;+
; NAME:
;       TRAN2015()
;
; PURPOSE:
;           
;
; CALLING SEQUENCE:
;       
;      
; INPUTS:
;        
;
; OPTIONAL INPUTS:
;       
;
; KEYWORD PARAMETERS:
;        
;
; OUTPUTS:
;       
;
; OPTIONAL OUTPUTS:
;
;
; COMMON BLOCKS:
;       
;
; PROCEDURES USED:
;       
;
; COMMENTS:
;        
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2016 June 4, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-
;====================================================================================================
PRO mosfireaux::setprop, DATADIR=datadir, REDUXDIR=reduxdir

  IF keyword_set(DATADIR) THEN self.datadir = datadir    ;set the data directory
  IF keyword_set(REDUXDIR) THEN self.reduxdir = reduxdir ;set the redux directory

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO mosfireaux::getprop, OBJVER=objver, DATADIR=datadir, REDUXDIR=reduxdir

  IF arg_present(OBJVER) THEN objver = self.mosaux_objver ;return the data
  IF arg_present(DATADIR) THEN datadir = self.datadir     ;return the data directory
  IF arg_present(REDUXDIR) THEN reduxdir = self.reduxdir  ;return the redux directory
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfireaux::exist, MAKEOUTDIR=makeoutdir


  last = strmid(self.datadir, 0, 1, /REVERSE_OFFSET)                                ;check for trailing /
  IF (last NE '/') THEN self.datadir = strcompress(self.datadir + '/', /REMOVE_ALL) ;add if not present
  result = file_test(self.datadir, /DIRECTORY)                                      ;test file's existance  

  IF keyword_set(MAKEOUTDIR) AND (RESULT EQ 0) THEN BEGIN ;if makeoutdir keyword set
     spawn, 'mkdir ' + self.outdir                        ;create directory
     result = file_test(self.outdir, /DIRECTORY)          ;retest file's existance  
  ENDIF                                                   ;end if OUTDIR set

  RETURN, result
END
;====================================================================================================


;====================================================================================================
PRO mosfireaux::plotseeingframe, xdata, MEDVAL=medval, UPMEDVAL=upmedval, LOWMEDVAL=lowmedval


  help, xdata
  xs = indgen(n_elements(xdata))
  
  seeingplot = plot(xs, xdata, $
                    XRANGE=[-50,2050], $
                    XTITLE='Vertical Spatial Position [Pixels]', $
                    YTITLE='Flux [arbitrary]')
  seeingplot = plot([-100,2150], [medval,medval], /OVERPLOT)
  seeingplot = plot([-100,2150], [lowmedval,lowmedval], '-.', /OVERPLOT)
  seeingplot = plot([-100,2150], [upmedval,upmedval], '-.', /OVERPLOT)
  


  stop
  
END
;====================================================================================================


;====================================================================================================
PRO mosfireaux::plotseeing, xseeing


  
  
END
;====================================================================================================


;====================================================================================================
PRO mosfireaux::seeing, which


  ;;;handle inputs, set defaults
  IF which EQ 'all' THEN which = [1,2,3,4]
  mosfirepixscl = 0.18          ;[arcsec/pixel]

  ;;;grab object values
  self.getprop, DATADIR=mydatadir, REDUXDIR=myreduxdir
  print, mydatadir
  print, myreduxdir


  ;;;to fill in
  tmpoutstruc = {mask:'A', date:'A', frame:'A', seeing:0.0}
  outstruc = [tmpoutstruc]

  ;;;start finding the data
  FOR xx=0, n_elements(which)-1 DO BEGIN
     print, xx

     IF (which[xx] EQ 1) OR (string(which[xx]) EQ 'CDFS44_mask1_1.0') THEN BEGIN
        mask = 'CDFS44_mask1_1.0'
        date = '2012nov25'
        band = 'H'
        offset = ['1.75','-1.75']
     ENDIF
     IF (which[xx] EQ 2) OR (string(which[xx]) EQ 'CDFS44_mask2_1.0') THEN BEGIN
        mask = 'CDFS44_mask2_1.0'
        date = '2012nov25'
        band = 'H'
        offset = ['1.75','-1.75']
     ENDIF
     IF (which[xx] EQ 3) OR (string(which[xx]) EQ 'CDFS44_mask3_1.0') THEN BEGIN
        mask = 'CDFS44_mask3_1.0'
        date = '2012nov25'
        band = 'H'
        offset = ['1.75','-1.75']
     ENDIF
     IF (which[xx] EQ 4) OR (string(which[xx]) EQ 'CDFS44_mask4_1.0') THEN BEGIN
        mask = 'CDFS44_mask4_1.0'
        date = '2012nov25'
        band = 'H'
        offset = ['1.75','-1.75']
     ENDIF

     ;;;make full data directories
     fulldatadir = strcompress(mydatadir + date + '/', /REMOVE_ALL)
     fullreduxdir = strcompress(myreduxdir + mask + '/' + date + '/' + band + '/', /REMOVE_ALL)
                                ;stop
 
     ;;;get which data frames to look at to measure seeing
     frames = []
     frame = ''
     FOR yy=0, n_elements(offset)-1, 1 DO BEGIN
        bit = strcompress('Offset_' + string(offset[yy]) + '.txt', /REMOVE_ALL)
        file = fullreduxdir + bit
        openr, lun, file, /GET_LUN
        WHILE ~EOF(lun) DO BEGIN
           readf, lun, frame
           yesthere = strmatch(frame, '*.fits*')
           IF yesthere EQ 1 THEN BEGIN
              frame = strcompress(strmid(frame, 0, 18), /REMOVE_ALL)
              frames = [frames, frame]
           ENDIF
        ENDWHILE
        close, lun
        free_lun, lun
     ENDFOR

     ;;;all this to find the seeing
     seeings = []
     FOR yy=0, n_elements(frames)-1, 1 DO BEGIN
        print, frames[yy]
        file = fulldatadir + frames[yy]

        ;;;read in data, basic stats
        data = readfits(file, hdr)
        data = total(data, 1)
        mediandata = median(data)
        lower = mediandata - 0.5*mediandata
        upper = mediandata + 0.2*mediandata

        
        ;;;find mins and maxes
        lows = where(data LT lower)
        IF lows[0] NE -1 THEN BEGIN
           consec, lows, lowslo, lowshi ;[, NUM, /SAME] 
           ;print, lowslo
           ;print, lowshi

        ENDIF ELSE BEGIN
           print, 'WARNING!! Lower threshold is too low'
        ENDELSE
        

        ;;;find where to measure the seeing
        highs = where(data GT upper, nchk)
        IF highs[0] NE -1 THEN BEGIN      
           consec, highs, highlo, highhi ;[, NUM, /SAME]   
           nseeings = n_elements(highlo)
           seeinglocs = replicate({lowpix:0, highpix:0}, nseeings)
           
           FOR zz=0, nseeings-1, 1 DO BEGIN
              lowerbound = highs[highlo[zz]]-lows[lowshi]
              still = where(lowerbound GT 0)
              seeinglocs[zz].lowpix = lows[lowshi[still[-1]]]
              
              upperbound = highs[highhi[zz]]-lows[lowslo]
              still = where(upperbound LT 0)
              seeinglocs[zz].highpix = lows[lowslo[still[0]]]
           ENDFOR
        ENDIF ELSE BEGIN
           print, 'WARNING!! Upper threshold is too high'
        ENDELSE
        

        ;;;now measure the seeing
        print, seeinglocs
        FOR zz=0, nseeings-1, 1 DO BEGIN
           databit = data[seeinglocs[zz].lowpix:seeinglocs[zz].highpix]
           newmed = median(databit)
           print, newmed
           max = max(databit, maxind)
           print, maxind
           halfmax = max - 0.5*(max-newmed)
           print, halfmax
           closestlow = min(abs(halfmax-databit[0:maxind]), halfmaxlow)
           closesthi = min(abs(halfmax-databit[maxind:-1]), halfmaxhi)
           print, halfmaxlow, (halfmaxhi+maxind)
           seeing = mosfirepixscl * ((halfmaxhi+maxind) - halfmaxlow)
           print, seeing

           
           tmpoutstruc.mask = mask
           tmpoutstruc.date = date
           tmpoutstruc.frame = frames[yy]
           tmpoutstruc.seeing = seeing
           outstruc = [outstruc, tmpoutstruc]
           


        ENDFOR

        

        ;self.plotseeingframe, data, MEDVAL=mediandata, UPMEDVAL=upper, LOWMEDVAL=lower

        
     ENDFOR

  ENDFOR
  
  myart = obj_new('beers1990', outstruc.seeing)
  print, myart.biweight()

  outstruc = outstruc[1:-1]
  mwrfits, outstruc, 'checkingout.fits', /CREATE
  


END
;====================================================================================================


;====================================================================================================
PRO mosfireaux::cleanup

  ;ptr_free, self.dates

RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfireaux::init, DATADIR=datadir, REDUXDIR=reduxdir


  self.mosaux_objver = 'v0-1-0'
  IF keyword_set(DATADIR) THEN self.datadir = string(datadir[0]) ELSE self.datadir = '/Users/adegroot/research/rawdata/'
  IF keyword_set(REDUXDIR) THEN self.reduxdir = string(reduxdir[0]) ELSE self.reduxdir = '/Users/adegroot/research/dataredux/mosfire/'


  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO mosfireaux__define

  void = {mosfireaux, mosaux_objver:'A', $
          datadir:'', reduxdir:''}

RETURN
END
;====================================================================================================
