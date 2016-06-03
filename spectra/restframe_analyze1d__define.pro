;+
; NAME:
;       restframe_analyze1d()
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
;       A. DeGroot, 2015 Oct 30, Univ. Cali, Riverside v1.0.0
;          -adapted from mosfire_analyzd1d object
;
;
; DESIRED UPGRADES
;
;
;
;
;     
;
;-

;====================================================================================================
PRO restframe_analyze1d::getprop, OBJVER=objver, DATAHDR=datahdr, INITGSS=initgss, FMCRUNS=fmcruns

  IF arg_present(OBJVER) THEN objver = self.rfrobjver  ;return the data
  IF arg_present(DATAHDR) THEN datahdr = *self.datahdr ;return the data
  IF arg_present(INITGSS) THEN initgss = *self.initgss ;return the data
  IF arg_present(FMCRUNS) THEN fmcruns = self.mcruns   ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO restframe_analyze1d::prep, mciters, BASENAME=basename, FITTO=fitto, FITTOWL=fittowl, $
                               OLDVER=oldver, NEWVER=newver, ITERSTORE=iterstore

  IF keyword_set(BASENAME) THEN basename = string(basename) ELSE basename = self.basename ;default values
  IF keyword_set(FITTO) THEN fitto = string(fitto) ELSE fitto = *self.fitto               ;default values
  IF keyword_set(OLDVER) THEN oldver = string(oldver) ELSE oldver = self.oldver           ;default values
  IF keyword_set(NEWVER) THEN newver = string(newver) ELSE newver = self.newver           ;default values


  ;;;trim name down to create base file
  self.epsfileod = strcompress(self.basename + '_1d_' + self.object + '_' + oldver + '.fits', /REMOVE_ALL)                            ;make new name
  self.mcruns = strcompress(self.basename + '_1d_' + self.object + '_' + oldver + '_mcruns' + string(mciters) + '.fits', /REMOVE_ALL) ;make new name
  self.fitfile = strcompress(self.basename + '_1d_' + self.object + '_' + oldver + '_lines.ps', /REMOVE_ALL)                          ;make new name
  self.fitdistfile = strcompress(self.basename + '_1d_' + self.object + '_' + oldver + '_linesdist.ps', /REMOVE_ALL)                  ;make new name
  self.graphoutfile = strcompress(self.basename + '_1d_' + self.object + '_' + oldver + '_linessky.ps', /REMOVE_ALL)                  ;make new name
  self.nepsfileod = strcompress(self.basename + '_1d_' + self.object + '_' + newver + '.fits', /REMOVE_ALL)                           ;make new name

  
  ;;;print to screen
  print, '  This program creates several files. The names are as follows: '
  print, '   Base name: ', self.basename
  print, '   1D spectrum file name: ', self.epsfileod
  print, '   1D spectrum MC runs file name: ', self.mcruns
  print, '   1D spectrum with fits graphic file name: ', self.fitfile
  print, '   Distributions of fit parameters graphic file name: ', self.fitdistfile
  print, '   New 1D spectrum file name: ', self.nepsfileod


  ;;;now add output directory to name
  self.mcruns = strcompress(self.outdir + self.mcruns, /REMOVE_ALL)             ;make new name
  self.fitfile = strcompress(self.outdir + self.fitfile, /REMOVE_ALL)           ;make new name
  self.fitdistfile = strcompress(self.outdir + self.fitdistfile, /REMOVE_ALL)   ;make new name
  self.graphoutfile = strcompress(self.outdir + self.graphoutfile, /REMOVE_ALL) ;make new name
  self.nepsfileod = strcompress(self.outdir + self.nepsfileod, /REMOVE_ALL)     ;make new name

  

  ;;;Prep and stuff
  nfitto = n_elements(fitto)                ;find how many features to fit
  fittowl = fltarr(nfitto)                  ;make array for wavelengths
  FOR yy=0, nfitto-1, 1 DO BEGIN            ;loop over features
     fittowl[yy] = emissionlines(fitto[yy]) ;store wavelength
  ENDFOR                                    ;end loop over features
  

  ;;;store info
  self.fittowl = ptr_new(fittowl) ;store wavelengths

  ;;;if we want to do a monte carlo
  iterstore = {interno:0}                   ;structure
  iterstore = replicate(iterstore, mciters) ;one for each iteration

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION restframe_analyze1d::prepmcdata, xdata, xmciters, MCDATA=mcdata, NXS=nxs
  

  IF keyword_set(NXS) THEN nxs = ulong(nxs) ELSE nxs = 500UL ;set default value  
  

  ;;;the data and errors
  actdata = xdata.spec1d        ;grab data
  print, self.justfit
  CASE self.justfit OF
     1 : actdataerr = xdata.spec1dwei
     2 : actdataerr = xdata.spec1dfullwei
     ELSE :  actdataerr = xdata.spec1dwei
  ENDCASE
    
  
  ;;;structures to fill
  mcdata = {mcspec1d:fltarr(n_elements(actdata))} ;structure
  mcdata = replicate(mcdata, xmciters+1)          ;replicate structure

  ;;;random generator
  seed = ulong(systime(0, /SECONDS) mod 32766)                 ;get a seed 
  rands = uniformran(n_elements(actdata), xmciters, SEED=seed) ;get randoms
  
  IF xmciters NE 1 THEN BEGIN                                                                    ;is something to loop over
     FOR xx=0, n_elements(actdata)-1, 1 DO BEGIN                                                 ;begin loop 
                                ;print, actdata[xx]
                                ;print, actdataerr[xx]
        txs = ulindgen(nxs + 1)*((14.0*actdataerr[xx])/(nxs)) + (actdata[xx]-7.0*actdataerr[xx]) ;xs to try
        tys = 0.5*(1.0 + erf((txs-actdata[xx])/(1.414214*actdataerr[xx])))                       ;cdf 
                                ;myplot = plot(txs, tys, 'g*')
        FOR yy=0, xmciters-1, 1 DO BEGIN            ;loop over iterations
                                ;print, rands[xx, yy]
           min = min(abs(rands[xx,yy]-tys), minind) ;find closes match in cdf
                                ;print, txs[minind]
           mcdata[yy].mcspec1d[xx] = txs[minind] ;store result
        ENDFOR                                   ;end loop over iterations
        mcdata[xmciters].mcspec1d = actdata      ;store actual data
     ENDFOR                                      ;end loop
  ENDIF ELSE BEGIN                               ;end something to loop over 
     mcdata.mcspec1d = actdata                   ;set to null value
  ENDELSE                                        ;end nothing to loop over

  RETURN, mcdata
END
;====================================================================================================



;====================================================================================================
FUNCTION restframe_analyze1d::prepmcguess, xmciters, NXS=nxs, OTHFRAC=othfrac ; DZ=dz,
  

  IF keyword_set(NXS) THEN nxs = ulong(nxs) ELSE nxs = 500UL                ;set default value  
                                ;IF keyword_set(DZ) THEN dz = float(dz) ELSE dz = 0.0002                   ;set default value  
  IF keyword_set(OTHFRAC) THEN othfrac = float(othfrac) ELSE othfrac = 0.15 ;set default value  
  
  
  ;;;structures to fill
  fguess = self.initialguess::decipher(*self.fitto, self.border, /NOREDSHIFT) ;decipher text string 
  tags = tag_names(fguess)                                                    ;find tag names
  ntags = n_elements(tags)                                                    ;how many tags
  mcguess = replicate(fguess, xmciters+1)                                     ;replicate structure

  ;;;random generator
  seed = ulong(systime(0, /SECONDS) mod 32766)   ;get a seed 
  rands = uniformran(ntags, xmciters, SEED=seed) ;get randoms
  
  ;;;find new guess values
  IF xmciters NE 1 THEN BEGIN                                                  ;is something to loop over
     FOR xx=0, ntags-1, 1 DO BEGIN                                             ;begin loop 
        CASE tags[xx] OF                                                       ;special case for certain tags
                                ;'REDSHIFT' : error = dz                                             ;for redshift
           ELSE : error = othfrac * fguess.(xx)                                ;for everything else
        ENDCASE                                                                ;end special case
        txs = ulindgen(nxs + 1)*((14.0*error)/(nxs)) + (fguess.(xx)-7.0*error) ;xs to try
        tys = 0.5*(1.0 + erf((txs-fguess.(xx))/(1.414214*error)))              ;cdf 
        FOR yy=0, xmciters-1, 1 DO BEGIN                                       ;loop over iterations
           min = min(abs(rands[xx,yy]-tys), minind)                            ;find closes match in cdf
           mcguess[yy].(xx) = txs[minind]                                      ;store result
        ENDFOR                                                                 ;end loop over iterations
     ENDFOR                                                                    ;end loop
  ENDIF ELSE BEGIN                                                             ;end something to loop over 
     mcguess = fguess                                                          ;set to null value
  ENDELSE                                                                      ;end nothing to loop over
  
  
  RETURN, mcguess 
END
;====================================================================================================



;====================================================================================================
FUNCTION restframe_analyze1d::findfiles, INDIR=indir, OUTDIR=outdir


  COMPILE_OPT IDL2              ;forces new defaults


  IF keyword_set(INDIR) THEN indir = indir[0] ELSE indir = self.indir        ;set default
  IF keyword_set(OUTDIR) THEN outdir = self.outdir ELSE outdir = self.outdir ;set default

  ;;;check directories
                                ;xfile = self.epsfiletd                                     ;copy value
                                ;there = file_test(strcompress(indir + xfile, /REMOVE_ALL)) ;is file present
                                ;allthere = there                                           ;all present
                                ;xfile = self.mepsfiletd                                    ;copy value
                                ;there = file_test(strcompress(indir + xfile, /REMOVE_ALL)) ;is file present
                                ;allthere = allthere * there                                ;all present
                                ;xfile = self.sigfiletd                                     ;copy value
                                ;there = file_test(strcompress(indir + xfile, /REMOVE_ALL)) ;is file present
                                ;allthere = allthere * there                                ;all present
                                ;xfile = self.snrfiletd                                     ;copy value
                                ;there = file_test(strcompress(indir + xfile, /REMOVE_ALL)) ;is file present
                                ;allthere = allthere * there                                ;all present
                                ;xfile = self.epsfiletd                                     ;copy value
                                ;there = file_test(strcompress(indir + xfile, /REMOVE_ALL)) ;is file present
                                ;allthere = allthere * there                                ;all present
                                ;xfile = self.msnrfiletd                                    ;copy value
                                ;there = file_test(strcompress(indir + xfile, /REMOVE_ALL)) ;is file present
                                ;allthere = allthere * there                                ;all present
                                ;xfile = self.waveresid                                     ;copy value
                                ;there = file_test(strcompress(indir + xfile, /REMOVE_ALL)) ;is file present
                                ;allthere = allthere * there                                ;all present
  xfile = self.epsfileod        ;copy value
  there = file_test(strcompress(indir + xfile, /REMOVE_ALL)) ;is file present
  allthere = there                                           ;all present?
  print, allthere
  

  RETURN, allthere
END
;====================================================================================================



;====================================================================================================
FUNCTION restframe_analyze1d::readfiles, xwhich, ERRFAC=errfac


  IF keyword_set(ERRFAC) THEN errfac = float(errfac[0]) ELSE errfac = 1.0 ;set default value

  CASE strlowcase(xwhich) OF    ;which file to read
     
     'data' : BEGIN             ;main 1d spectrum
        thisfile = strcompress(self.indir + self.epsfileod, /REMOVE_ALL)
        content = mrdfits(thisfile, 1, hdr, /SILENT) ;read in file
        ;;;;;;;;;;;;may need to change the next line sin the future
                                ;content.spec1dwei = content.spec1dwei^0.5 ;from variance to sigma

        self.data = ptr_new(content)   ;store data
        self.datahdr = ptr_new(hdr)    ;store data header
        IF (self.help EQ 1) THEN BEGIN ;help requested
           help, content, /STRUC       ;structur help
           print, hdr                  ;print info
        ENDIF                          ;help reqested
     END

     'waveresid' : BEGIN                                              ;wavelength residual file
        content = ['']                                                ;start array
        tmpline = ''                                                  ;initialize variable
        file = strcompress(self.indir + self.waveresid , /REMOVE_ALL) ;file name
        filethere = file_test(file)                                   ;is file present
        IF filethere EQ 1 THEN BEGIN                                  ;if it is present
           openr, lun, file, /GET_LUN                                 ;open file for reading 
           WHILE ~EOF(lun) DO BEGIN                                   ;until end of file reached
              readf, lun, tmpline                                     ;read line
              content = [content, tmpline]                            ;store line
           ENDWHILE                                                   ;end until end of file
           close, lun                                                 ;close file
           free_lun, lun                                              ;free memory unit
           
           ;;start working file
           content = content[1:-1] ;get rid of space entry
           residstore = {slit:0, line:0, rms:0.0, mad:0.0}
           search = strcompress('resid*p*:*rms*', /REMOVE_ALL)
           resids = where(strmatch(content, search, /FOLD_CASE) EQ 1, nvals)
           IF (resids[0] NE -1) THEN BEGIN
              residstores = replicate(residstore, nvals)
              FOR xx=0, nvals-1, 1 DO BEGIN
                 slitpos = strpos(content[resids[xx]], ' S')
                 residstores[xx].slit = fix(strcompress(strmid(content[resids[xx]], slitpos+2, 2), /REMOVE_ALL))
                 linepos = strpos(content[resids[xx]], '@ p')
                 residstores[xx].line = fix(strcompress(strmid(content[resids[xx]], linepos+3, 4), /REMOVE_ALL))
                 rmspos = strpos(content[resids[xx]], ' rms')
                 residstores[xx].rms = float(strcompress(strmid(content[resids[xx]], rmspos-4, 4), /REMOVE_ALL))
                 madpos = strpos(content[resids[xx]], ' mad')
                 residstores[xx].mad = float(strcompress(strmid(content[resids[xx]], madpos-4, 4), /REMOVE_ALL))
              ENDFOR
           ENDIF

        ;;;create a base storage
           store = {object:'A', low:0, high:0, resrms:0.0, resmad:0.0}
           slitstart = where(strmatch(content, '*Fitting Slit*', /FOLD_CASE) EQ 1, nslits)
           IF (slitstart[0] NE -1) THEN BEGIN
              stores = replicate(store, nslits)
              FOR xx=0, n_elements(slitstart)-1, 1 DO BEGIN
                 bits = strsplit(content[slitstart[xx]], /EXTRACT)
                 chk = where(bits EQ 'Slit')
                 stores[xx].object = bits[chk + 1]
                 chk = where(bits EQ 'from')
                 stores[xx].low = bits[chk + 1]
                 chk = where(bits EQ 'to')
                 stores[xx].high = bits[chk + 1]
                 chk = where((residstores.line GE stores[xx].low) AND (residstores.line LT stores[xx].high))
                 IF (chk[0] NE -1) THEN BEGIN
                    stores[xx].resrms = mean(residstores[chk].rms)
                    stores[xx].resmad = mean(residstores[chk].mad)
                 ENDIF
              ENDFOR
           ENDIF
           content = stores
        ENDIF ELSE content = 0
     END                        ;end wavelength residual file

     
     ELSE : BEGIN
        print, 'WARNING!! Data file not understood. Please try another.'
        print, '  Current options are: data'
     END
     
  ENDCASE                       ;end which file 


  RETURN, content
END
;====================================================================================================



;====================================================================================================
FUNCTION restframe_analyze1d::getsub, xdata, xflg

  COMPILE_OPT IDL2
  
  bits = where(xflg EQ 1, nbits) ;flagged for use

  IF (bits[0] NE -1) THEN BEGIN                                ;if something
     newxdata = {start:'start'}                                ;start structure
     mytags = tag_names(xdata)                                 ;get tags name
     ntags = n_elements(tag_names(xdata))                      ;find number of tags
     FOR xx=0, ntags-1, 1 DO BEGIN                             ;loop over tags 
        add_tag, newxdata, mytags[xx], dblarr(nbits), tmpstruc ;get subset
        newxdata = 0                                           ;delete struc
        newxdata = tmpstruc                                    ;recapture
     ENDFOR                                                    ;end loop over tags
     tmpstruc = remove_tags(newxdata, 'start')                 ;remove the tag
     newxdata = 0                                              ;nullify
     newxdata = tmpstruc                                       ;recapture
     
     FOR xx=0, ntags-1, 1 DO BEGIN ;loop over tags 
        tmp = xdata.(xx)           ;grab array
        tmp = tmp[bits]            ;get subset of array
        newxdata.(xx) = tmp        ;get subset
     ENDFOR                        ;end loop over tags
  ENDIF                            ;end if something

  RETURN, newxdata
END
;====================================================================================================



;====================================================================================================
PRO restframe_analyze1d::bounds, LAL=lal, LAU=lau, YL=yl, YU=yu


  ;;;set upper and lower bounds
  xdata = *self.data                               ;grab data
  IF keyword_set(LAL) THEN lal = lal[0] ELSE BEGIN ;if value not given
     lal = min(xdata.lambdas)                      ;sets new value
     self.lal = lal                                ;capture value
  ENDELSE                                          ;end if value not given
  
  IF keyword_set(LAU) THEN lau = lau[0] ELSE BEGIN ;if value not given
     lau = max(xdata.lambdas)                      ;sets new value
     self.lau = lau                                ;capture value
  ENDELSE                                          ;end value not given

  chk = where((xdata.lambdas GE lal) AND (xdata.lambdas LE lau), nchk) ;find subset
  
  IF keyword_set(YL) THEN yl = yl[0] ELSE BEGIN ;if value not given
     yl = 1.1*min(xdata.spec1d[chk])            ;sets new value
     self.yl = yl                               ;capture value
  ENDELSE                                       ;end value not given

  IF keyword_set(YU) THEN yu = yu[0] ELSE BEGIN ;if value not given
     yu = 1.1*max(xdata.spec1d[chk])            ;sets new value
     self.yu = yu                               ;capture value
  ENDELSE                                       ;end value not given


END
;====================================================================================================



;====================================================================================================
FUNCTION restframe_analyze1d::lambsubset, NOFITSKY=nofitsky, KEYSKY=keysky
  

  IF keyword_set(KEYSKY) THEN keysky = string(keysky[0]) ELSE keysky = self.keysky ;set default

  xdata = *self.data            ;grab data
  xdatahdr = *self.datahdr      ;grab data
  lambflg = xdata.lambdas       ;copy of array for flags
  lambflg[*] = 1                ;set flag for all to use 

  ;;;Subset of wavelength range and remove sky lines if wanted 
  IF keyword_set(NOFITSKY) THEN BEGIN                             ;check to avoid fitting sky
     skylines = fxpar(xdatahdr, keysky)                           ;get which sky to avoid
     speclines, skylines, VALS=skyvals                            ;get skyline values
     FOR xx=0, n_elements(skyvals.(0))-1, 1 DO BEGIN              ;loop over skylines
        chk = where((xdata.lambdas GE skyvals.lower[xx]) AND $    ;cont next line
                    (xdata.lambdas LE skyvals.upper[xx]))         ;find bad wavelengths
        IF chk[0] NE -1 THEN lambflg[chk] = 0                     ;set flag to zero
     ENDFOR                                                       ;end loop over skylines 
  ENDIF ELSE BEGIN                                                ;if not avoid sky lines
     print, '  Using everything in the wavelength range given...' ;print info
  ENDELSE                                                         ;end not avoid
  
  ;;;and now only the relevant wavelengths
  bit = where((xdata.lambdas GE self.lal) AND (xdata.lambdas LE self.lau), COMPLEMENT=nobit) ;find subset
  IF (nobit[0] NE -1) THEN lambflg[nobit] = 0                                                ;get rid of unwanted points
  self.lambflg = ptr_new(lambflg)                                                            ;store array

  RETURN, lambflg
END
;====================================================================================================



;====================================================================================================
FUNCTION restframe_analyze1d::fitspec, xdata, NEWDATA=newdata, $
                                       DRYRUN=dryrun, GETVARY=getvary, VARIES=varies, $
                                       FITTO=fitto, BORDER=border, $
                                       INITGSS=initgss, PRIORS=priors, PLOTIT=plotit


  IF keyword_set(NEWDATA) THEN fitdata = newdata ELSE fitdata = xdata.spec1d          ;set default value
  IF keyword_set(FITTO) THEN fitto = fix(fitto[0]) ELSE fitto = *self.fitto           ;set default value
  IF keyword_set(BORDER) THEN border = fix(border[0]) ELSE border = self.border       ;set default value
  IF keyword_set(INITGSS) THEN initgss = string(initgss) ELSE initgss = *self.initgss ;set default value
  IF keyword_set(PRIORS) THEN priors = fix(priors[0]) ELSE priors = *self.priors      ;set default value
  
  CASE self.justfit OF
     1 : actdataerr = xdata.spec1dwei
     2 : actdataerr = xdata.spec1dfullwei
     ELSE :  actdataerr = xdata.spec1dwei
  ENDCASE

  ;;;get step sizes
  IF keyword_set(GETVARY) THEN BEGIN                                                        ;just want step size
     print, '  Now determining appropriate step ...'                                        ;print info 
     bayesian_rfspectral, xdata.lambdas, fitdata, actdataerr, $                             ;cont next line
                          FEATURES=fitto, BORDER=border, GUESSES=initgss, VARYHOW=myvary, $ ;cont next line
                          PRIORS=priors, CALL=self.object, FITVALS=fitvalsb, PFIT=plotit    ;run fitting
     RETURN, myvary                                                                         ;return step sizes
  ENDIF ELSE BEGIN                                                                          ;end just want step size
     
     ;;;Fit emission line(s) and continuum 
     IF (~keyword_set(DRYRUN)) THEN BEGIN                                                          ;if not a dry run
        print, '  Now fitting spectrum as requested...'                                            ;print info 
        bayesian_rfspectral, xdata.lambdas, fitdata, actdataerr, $                                 ;cont next line
                             FEATURES=fitto, BORDER=border, GUESSES=initgss, VARIES=varies, $      ;cont next line
                             PRIORS=priors, CALL=self.object, PDATA=pdata, $                       ;cont next line
                             PLOTFIT=self.fitfile, PLOTPARAM=self.fitdistfile, FITVALS=fitvalsb, $ ;cont next line
                             PFIT=plotit                                                           ;run fitting
     ENDIF ELSE BEGIN                                                                              ;if a dry run
        print, '  Now performing a dry run of fitting the spectrum...'                             ;print info 
        bayesian_rfspectral, xdata.lambdas, fitdata, actdataerr, $                                 ;cont next line
                             FEATURES=fitto, BORDER=border, GUESSES=initgss, VARIES=varies, $      ;cont next line
                             PRIORS=priors, CALL=self.object, FITVALS=fitvalsb, PFIT=plotit        ;run fitting
     ENDELSE                                                                                       ;end if a dry run
     IF keyword_set(HELP) THEN help, fitvalsb, /STRUC                                              ;print help
     RETURN, fitvalsb                                                                              ;return fit values
  ENDELSE



END
;====================================================================================================


;====================================================================================================
FUNCTION restframe_analyze1d::fitbrkdwn, xfitvals, xborder, WLINERR=wlinerr


  IF keyword_set(WLINERR) THEN wlinerr = float(wlinerr[0]) ELSE wlinerr = 3.0 ;set default

  
  xdatahdr = *self.datahdr      ;dereference header
  xfitto = *self.fitto          ;dereference lines
  nfitto = n_elements(xfitto)   ;how many lines were fit
  xborder = self.border         ;get background order

  
  ;;;first the continuum
  chk = tag_exist(xfitvals, 'X1')                 ;check tag name
  IF chk EQ 1 THEN x1 = xfitvals.x1 ELSE x1 = 0.0 ;assign value
  chk = tag_exist(xfitvals, 'X2')                 ;check tag name
  IF chk EQ 1 THEN x2 = xfitvals.x2 ELSE x2 = 0.0 ;assign value
  chk = tag_exist(xfitvals, 'X3')                 ;check tag name
  IF chk EQ 1 THEN x3 = xfitvals.x3 ELSE x3 = 0.0 ;assign value
  chk = tag_exist(xfitvals, 'X4')                 ;check tag name
  IF chk EQ 1 THEN x4 = xfitvals.x4 ELSE x4 = 0.0 ;assign value
  chk = tag_exist(xfitvals, 'X5')                 ;check tag name
  IF chk EQ 1 THEN x5 = xfitvals.x5 ELSE x5 = 0.0 ;assign value


  store = {start:1}                                                     ;storage structure
  FOR xx=0, xborder-1, 1 DO BEGIN                                       ;loop over background terms
     CASE xx OF                                                         ;which term are we on
        0 : BEGIN                                                       ;constant term
           tag1 = 'X0'                                                  ;tag
           chk = tag_exist(xfitvals, tag1, INDEX=tagind1)               ;check tag name
           IF chk EQ 1 THEN curval = xfitvals.x0 ELSE curval = 0.0      ;assign value
           tag2 = 'X0M'                                                 ;tag
           chk = tag_exist(xfitvals, tag2, INDEX=tagind2)               ;check tag name
           IF chk EQ 1 THEN dcurvalm = xfitvals.x0m ELSE dcurvalm = 0.0 ;assign value
           chk = tag_exist(xfitvals, 'X0P')                             ;check tag name
           IF chk EQ 1 THEN dcurvalp = xfitvals.x0p ELSE dcurvalp = 0.0 ;assign value
        END                                                             ;end constant term

        1 : BEGIN                                                       ;constant term
           tag1 = 'X1'                                                  ;tag
           chk = tag_exist(xfitvals, tag1, INDEX=tagind1)               ;check tag name
           IF chk EQ 1 THEN curval = xfitvals.x1 ELSE curval = 0.0      ;assign value
           tag2 = 'X1M'                                                 ;tag
           chk = tag_exist(xfitvals, tag2, INDEX=tagind2)               ;check tag name
           IF chk EQ 1 THEN dcurvalm = xfitvals.x1m ELSE dcurvalm = 0.0 ;assign value
           chk = tag_exist(xfitvals, 'X1P')                             ;check tag name
           IF chk EQ 1 THEN dcurvalp = xfitvals.x1p ELSE dcurvalp = 0.0 ;assign value
        END                                                             ;get data
        
        2 : BEGIN                                                       ;constant term
           tag1 = 'X2'                                                  ;tag
           chk = tag_exist(xfitvals, tag1, INDEX=tagind1)               ;check tag name
           IF chk EQ 1 THEN curval = xfitvals.x2 ELSE curval = 0.0      ;assign value
           tag2 = 'X2M'                                                 ;tag
           chk = tag_exist(xfitvals, tag2, INDEX=tagind2)               ;check tag name
           IF chk EQ 1 THEN dcurvalm = xfitvals.x2m ELSE dcurvalm = 0.0 ;assign value
           chk = tag_exist(xfitvals, 'X2P')                             ;check tag name
           IF chk EQ 1 THEN dcurvalp = xfitvals.x2p ELSE dcurvalp = 0.0 ;assign value
        END 
        
        3 : BEGIN                                                       ;constant term
           tag1 = 'X3'                                                  ;tag
           chk = tag_exist(xfitvals, tag1, INDEX=tagind1)               ;check tag name
           IF chk EQ 1 THEN curval = xfitvals.x3 ELSE curval = 0.0      ;assign value
           tag2 = 'X3M'                                                 ;tag
           chk = tag_exist(xfitvals, tag2, INDEX=tagind2)               ;check tag name
           IF chk EQ 1 THEN dcurvalm = xfitvals.x3m ELSE dcurvalm = 0.0 ;assign value
           chk = tag_exist(xfitvals, 'X3P')                             ;check tag name
           IF chk EQ 1 THEN dcurvalp = xfitvals.x3p ELSE dcurvalp = 0.0 ;assign value
        END 

        4 : BEGIN                                                       ;constant term
           tag1 = 'X4'                                                  ;tag
           chk = tag_exist(xfitvals, tag1, INDEX=tagind1)               ;check tag name
           IF chk EQ 1 THEN curval = xfitvals.x4 ELSE curval = 0.0      ;assign value
           tag2 = 'X4M'                                                 ;tag
           chk = tag_exist(xfitvals, tag2, INDEX=tagind2)               ;check tag name
           IF chk EQ 1 THEN dcurvalm = xfitvals.x4m ELSE dcurvalm = 0.0 ;assign value
           chk = tag_exist(xfitvals, 'X4P')                             ;check tag name
           IF chk EQ 1 THEN dcurvalp = xfitvals.x4p ELSE dcurvalp = 0.0 ;assign value
        END

        5 : BEGIN                                                       ;constant term
           tag1 = 'X5'                                                  ;tag
           chk = tag_exist(xfitvals, tag1, INDEX=tagind1)               ;check tag name
           IF chk EQ 1 THEN curval = xfitvals.x5 ELSE curval = 0.0      ;assign value
           tag2 = 'X5M'                                                 ;tag
           chk = tag_exist(xfitvals, tag2, INDEX=tagind2)               ;check tag name
           IF chk EQ 1 THEN dcurvalm = xfitvals.x5m ELSE dcurvalm = 0.0 ;assign value
           chk = tag_exist(xfitvals, 'X5P')                             ;check tag name
           IF chk EQ 1 THEN dcurvalp = xfitvals.x5p ELSE dcurvalp = 0.0 ;assign value
        END

        ELSE : BEGIN                                          ;if option not found
           print, 'WARNING!! Something went horribly wrong!!' ;print warning
        END                                                   ;end option not found
     ENDCASE                                                  ;end which term

     IF (curval[0] NE 0.0) THEN BEGIN                                              ;if data exists
        IF ((dcurvalm[0] NE 0.0) AND (dcurvalp[0] NE 0.0) ) THEN BEGIN             ;if data exists
           dcurval = 0.5 * (dcurvalm + dcurvalp)                                   ;average error bar
        ENDIF ELSE BEGIN                                                           ;if not both
           IF (dcurvalm[0] NE 0.0) THEN dcurval = dcurvalm ELSE dcurval = dcurvalp ;one or the other
        ENDELSE                                                                    ;end one or other

        
        ;;;MLE analysis
        mybeers = obj_new('beers1990', dcurval)                              ;create object
        mleerr = mybeers.biweight()                                          ;find biweight estimate MLE err
        obj_destroy, mybeers                                                 ;destroy object
        tag1mle = strcompress(tag1 + 'MLE', /REMOVE_ALL)                     ;new tag name
        tag2mle = strcompress(tag2 + 'MLE', /REMOVE_ALL)                     ;new tag name
        add_tag, store, tag1mle, curval[-1], tmpstruc                        ;add tag
        store = 0                                                            ;reset variable
        store = tmpstruc                                                     ;recapture
        add_tag, store, tag2mle, mleerr, tmpstruc                            ;add tag
        store = 0                                                            ;reset variable
        store = tmpstruc                                                     ;recapture
        outline = strcompress(' MLE ' + tag1 + ': ' + string(curval[-1]) + $ ;cont next line
                              ' +/- ' + string(mleerr))                      ;line to print
        print, outline                                                       ;print info
        
        ;;;MC analysis
        mybeers = obj_new('beers1990', curval)                         ;create object
        mcval = mybeers.biweight()                                     ;find biweight estimate MLE err
        obj_destroy, mybeers                                           ;destroy object
        mcerr = sigma(curval)                                          ;MC error
        tag1mc = strcompress(tag1 + 'MC', /REMOVE_ALL)                 ;new tag name
        tag2mc = strcompress(tag2 + 'MC', /REMOVE_ALL)                 ;new tag name
        add_tag, store, tag1mc, mcval, tmpstruc                        ;add tag
        store = 0                                                      ;reset variable
        store = tmpstruc                                               ;recapture
        add_tag, store, tag2mc, mcerr, tmpstruc                        ;add tag
        store = 0                                                      ;reset variable
        store = tmpstruc                                               ;recapture
        outline = strcompress(' MC ' + tag1 + ': ' + string(mcval) + $ ;cont next line
                              ' +/- ' + string(mcerr))                 ;line to print
        print, outline                                                 ;print info

     ENDIF                      ;end if data exists
  ENDFOR                        ;end loop background
  
  
  
  ;;;second the emission lines
  FOR xx=0, nfitto-1, 1 DO BEGIN                                                                  ;loop over lines fit to
     chk = tag_exist(xfitvals, strcompress('sig' + string(xx+1), /REMOVE_ALL), INDEX=isig)        ;structure index
     chk = tag_exist(xfitvals, strcompress('sig' + string(xx+1) + 'm', /REMOVE_ALL), INDEX=isigm) ;structure index
     chk = tag_exist(xfitvals, strcompress('sig' + string(xx+1) + 'p', /REMOVE_ALL), INDEX=isigp) ;structure index
     chk = tag_exist(xfitvals, strcompress('c' + string(xx+1), /REMOVE_ALL), INDEX=ic)            ;structure index
     chk = tag_exist(xfitvals, strcompress('c' + string(xx+1) + 'm', /REMOVE_ALL), INDEX=icm)     ;structure index
     chk = tag_exist(xfitvals, strcompress('c' + string(xx+1) + 'p', /REMOVE_ALL), INDEX=icp)     ;structure index


     ;;;the emission line's width
     curval = xfitvals.(isig)                                                      ;copy values
     dcurvalm = xfitvals.(isigm)                                                   ;copy values
     dcurvalp = xfitvals.(isigp)                                                   ;copy values
     IF (curval[0] NE 0.0) THEN BEGIN                                              ;if data exists
        IF ((dcurvalm[0] NE 0.0) AND (dcurvalp[0] NE 0.0) ) THEN BEGIN             ;if data exists
           dcurval = 0.5 * (dcurvalm + dcurvalp)                                   ;average error bar
        ENDIF ELSE BEGIN                                                           ;if not both
           IF (dcurvalm[0] NE 0.0) THEN dcurval = dcurvalm ELSE dcurval = dcurvalp ;one or the other
        ENDELSE                                                                    ;end one or other

        ;;;MLE analysis
        mybeers = obj_new('beers1990', dcurval)                                           ;create object
        sigmleerr = mybeers.biweight()                                                    ;find biweight estimate MLE err
        obj_destroy, mybeers                                                              ;destroy object
        sigmpv = curval[-1]                                                               ;get value
        tag1mle = strcompress(xfitto[xx] + 'WML', /REMOVE_ALL)                            ;tag name
        tag2mle = strcompress(xfitto[xx] + 'DWML', /REMOVE_ALL)                           ;new tag name
        add_tag, store, tag1mle, sigmpv, tmpstruc                                         ;add tag
        store = 0                                                                         ;reset variable
        store = tmpstruc                                                                  ;recapture
        add_tag, store, tag2mle, sigmleerr, tmpstruc                                      ;add tag
        store = 0                                                                         ;reset variable
        store = tmpstruc                                                                  ;recapture
        outline = strcompress(' MLE ' + xfitto[xx] + ' line width: ' + string(sigmpv) + $ ;cont next line
                              ' +/- ' + string(sigmleerr))                                ;line to print
        print, outline                                                                    ;print info

        ;;;MC analysis
        mybeers = obj_new('beers1990', curval)                                          ;create object
        mcval = mybeers.biweight()                                                      ;find biweight estimate of systematic err
        obj_destroy, mybeers                                                            ;destroy object
        mcerr = sigma(curval)                                                           ;mc error
        tag1mc = strcompress(xfitto[xx] + 'WMC', /REMOVE_ALL)                           ;tag name
        tag2mc = strcompress(xfitto[xx] + 'DWMC', /REMOVE_ALL)                          ;new tag name
        add_tag, store, tag1mc, mcval, tmpstruc                                         ;add tag
        store = 0                                                                       ;reset variable
        store = tmpstruc                                                                ;recapture
        add_tag, store, tag2mc, mcerr, tmpstruc                                         ;add tag
        store = 0                                                                       ;reset variable
        store = tmpstruc                                                                ;recapture
        outline = strcompress(' MC ' + xfitto[xx] + ' line width: ' + string(mcval) + $ ;cont next line
                              ' +/- ' + string(mcerr))                                  ;line to print
        print, outline                                                                  ;print info
     ENDIF                                                                              ;end if data exists
     

     ;;;the emission line's constant factor
     curval = xfitvals.(ic)                                                        ;copy values
     dcurvalm = xfitvals.(icm)                                                     ;copy values
     dcurvalp = xfitvals.(icp)                                                     ;copy values
     IF (curval[0] NE 0.0) THEN BEGIN                                              ;if data exists
        IF ((dcurvalm[0] NE 0.0) AND (dcurvalp[0] NE 0.0) ) THEN BEGIN             ;if data exists
           dcurval = 0.5 * (dcurvalm + dcurvalp)                                   ;average error bar
        ENDIF ELSE BEGIN                                                           ;if not both
           IF (dcurvalm[0] NE 0.0) THEN dcurval = dcurvalm ELSE dcurval = dcurvalp ;one or the other
        ENDELSE                                                                    ;end one or other

        ;;;MLE analysis
        mybeers = obj_new('beers1990', dcurval)                                              ;create object
        cmleerr = mybeers.biweight()                                                         ;find biweight estimate MLE err
        obj_destroy, mybeers                                                                 ;destroy object
        cmpv = curval[-1]                                                                    ;get value
        tag1mle = strcompress(xfitto[xx] + 'CML', /REMOVE_ALL)                               ;tag name
        tag2mle = strcompress(xfitto[xx] + 'DCML', /REMOVE_ALL)                              ;new tag name
        add_tag, store, tag1mle, cmpv, tmpstruc                                              ;add tag
        store = 0                                                                            ;reset variable
        store = tmpstruc                                                                     ;recapture
        add_tag, store, tag2mle, cmleerr, tmpstruc                                           ;add tag
        store = 0                                                                            ;reset variable
        store = tmpstruc                                                                     ;recapture
        outline = strcompress(' MLE ' + xfitto[xx] + ' constant factor: ' + string(cmpv) + $ ;cont next line
                              ' +/- ' + string(cmleerr))                                     ;line to print
        print, outline                                                                       ;print info

        ;;;MC analysis
        mybeers = obj_new('beers1990', curval)                                               ;create object
        mcval = mybeers.biweight()                                                           ;find biweight estimate of systematic err
        obj_destroy, mybeers                                                                 ;destroy object
        mcerr = sigma(curval)                                                                ;mc error
        tag1mc = strcompress(xfitto[xx] + 'CMC', /REMOVE_ALL)                                ;tag name
        tag2mc = strcompress(xfitto[xx] + 'DCMC', /REMOVE_ALL)                               ;new tag name
        add_tag, store, tag1mc, mcval, tmpstruc                                              ;add tag
        store = 0                                                                            ;reset variable
        store = tmpstruc                                                                     ;recapture
        add_tag, store, tag2mc, mcerr, tmpstruc                                              ;add tag
        store = 0                                                                            ;reset variable
        store = tmpstruc                                                                     ;recapture
        outline = strcompress(' MC ' + xfitto[xx] + ' constant factor: ' + string(mcval) + $ ;cont next line
                              ' +/- ' + string(mcerr))                                       ;line to print
        print, outline                                                                       ;print info
     ENDIF                                                                                   ;end if data exists
     

     ;;;propagate the errors
     wl = emissionlines(xfitto[xx])                 ;, ZZ=xfitvals[0].redshift)                                               ;get observed wavelength
     const = (-1.0 * cmpv * sigmpv * (0.5*!pi)^0.5) ;constant
     flux = const * (erf((-wlinerr*sigmpv) / (1.14214*sigmpv)) - erf((wlinerr*sigmpv) / (1.14214*sigmpv))) ;definite integral
     fluxerr = flux * ((cmleerr/cmpv)^2 + (sigmleerr/sigmpv)^2)^0.5                                        ;lines flux err
     there =  (wl-xfitvals[0].medxs)                                                                       ;from emission line to fit origin
     lowb = (wl - xfitvals[0].medxs - wlinerr*sigmpv)                                                      ;lower bound
     hib = (wl - xfitvals[0].medxs + wlinerr*sigmpv)                                                       ;upper bound

     CASE xborder OF 
        2 : BEGIN
           conterr = ((0.5*(hib^2-lowb^2)*store.x1mmle)^2 + ((hib-lowb)*store.x0mmle)^2)^0.5
        END
        ELSE : BEGIN
           print, 'cant add continuum in quadrature because its not done yet'
           conterr = 0.0 
        END
     ENDCASE
     fluxerr = (fluxerr^2 + conterr^2)^0.5      ;cont error in quadrature 
     sigline = flux / fluxerr                   ;find SNR
     sigline = string(sigline, FORMAT='(F8.3)') ;find total sigma

     outline = strcompress(' ' + xfitto[xx] + ' LINE SIGNIFICANCE: ' + sigline + ' sigma')                                  ;line to print
     print, outline                                                                                                         ;print info
     print, '   This comes from the FLUX/FLUXERR ratio where is is determined by: '                                         ;print info
     print, '     The flux is the integral between +/- 3sigma from the most probable values: ', flux                        ;print info
     print, '     The flux error is adding in quadrature of flux error and the continuum error in same interval: ', fluxerr ;print info

     ;;;adding more to structure
     tag = strcompress(xfitto[xx] + 'FLX', /REMOVE_ALL)  ;new tag
     add_tag, store, tag, flux, tmpstruc                 ;add tag
     store = 0                                           ;reset variable
     store = tmpstruc                                    ;recapture
     tag = strcompress(xfitto[xx] + 'DFLX', /REMOVE_ALL) ;new tag
     add_tag, store, tag, fluxerr, tmpstruc              ;add tag
     store = 0                                           ;reset variable
     store = tmpstruc                                    ;recapture
     tag = strcompress(xfitto[xx] + 'SGN', /REMOVE_ALL)  ;new tag
     add_tag, store, tag, sigline, tmpstruc              ;add tag
     store = 0                                           ;reset variable
     store = tmpstruc                                    ;recapture
  ENDFOR                                                 ;end loop over lines fit to

  RETURN, store
END
;====================================================================================================



;====================================================================================================
FUNCTION restframe_analyze1d::flagging, xzs, xfitbrk, NSIGNEG=nsigneg, TAGNOSKY=tagnosky

  IF keyword_set(NSIGNEG) THEN nsigneg = float(nsigneg[0]) ELSE nsigneg = 2.0          ;default value
  IF keyword_set(TAGNOSKY) THEN tagnosky = string(tagnosky[0]) ELSE tagnosky = 'NOSKY' ;default value


  xfitto = *self.fitto           ;dereference lines
  xdata = *self.data             ;dereference data
  xhdr = *self.datahdr           ;dereference data
  xnosky = fxpar(xhdr, tagnosky) ;grab value
  
  flags = {start:0}                          ;start structure
  FOR xx=0, n_elements(xfitto)-1, 1 DO BEGIN ;loop over lines
     flag = 0                                ;start with no flag value
     wl = emissionlines(xfitto[xx])          ;, ZZ=xzs.zmle) ;get observed wavelength

     ;;;determine if there is a negative pixel within n-sigma
     tag = strcompress(xfitto[xx] + 'WML', /REMOVE_ALL) ;tag name
     chk = tag_exist(xfitbrk, tag, INDEX=tagind)        ;find tag index
     wllow = wl - nsigneg * xfitbrk.(tagind)            ;find lower
     wlhi = wl + nsigneg * xfitbrk.(tagind)             ;find lower
     close = min(abs(wllow-xdata.lambdas), lowind)      ;find closest wavelength
     close = min(abs(wlhi-xdata.lambdas), hiind)        ;find closest wavelength
     negs = where(xdata.spec1d[lowind:hiind] LT 0.0)    ;check for negative values
     IF (negs[0] NE -1) THEN flag = flag + 1            ;add to flag value
     
     
     ;;;flag based on sky line contamination
     speclines, xnosky, VALS=skyvals                                     ;grab sky lines used to extract
     FOR yy=0, n_elements(skyvals.(0))-1, 1 DO BEGIN                     ;loop over sky lines
        tchk = ((wl GE skyvals.lower[yy]) AND (wl LE skyvals.upper[yy])) ;in sky line region
        IF (yy NE 0) THEN chk = chk + tchk ELSE chk = tchk               ;add it up
     ENDFOR                                                              ;end loop sky lines
     IF (chk NE 0) THEN flag = flag + 8                                  ;add to flag

     ;;;flag based on significance
     tag = strcompress(xfitto[xx] + 'SGN', /REMOVE_ALL) ;tag name
     chk = tag_exist(xfitbrk, tag, INDEX=tagind)        ;find tag index
     CASE 1 OF                                          ;trivial case
        xfitbrk.(tagind) LT 1.0 : flag = flag + 128     ;add to flag value
        xfitbrk.(tagind) LT 3.0 : flag = flag + 64      ;add to flag value
        xfitbrk.(tagind) LT 5.0 : flag = flag + 32      ;add to flag value
        xfitbrk.(tagind) LT 7.0 : flag = flag + 16      ;add to flag value
        ELSE : flag = flag                              ;do nothing 
     ENDCASE                                            ;end trivial case
     
     tag = strcompress(xfitto[xx] + 'FLG', /REMOVE_ALL) ;tag name
     add_tag, flags, tag, flag, tmpstruc                ;add tag
     flags = 0                                          ;wipe variable
     flags = tmpstruc                                   ;recapture info
  ENDFOR

  RETURN, flags
END
;====================================================================================================


;====================================================================================================
FUNCTION restframe_analyze1d::updatehdr, whichupdate, FITVALS=fitvals, ZVALS=zvals, FITBRK=fitbrk, $
                                         FLGVALS=flgvals
  


  xdatahdr = *self.datahdr                                                                                ;dereference header
  xfitto = *self.fitto                                                                                    ;dereference lines
  xpriors = *self.priors                                                                                  ;dereference priors
  xinitgss = *self.initgss                                                                                ;dereference initial guesses
  IF (strlowcase(whichupdate[0]) EQ 'all') THEN whichupdate = ['basic', 'run', 'fit', 'postrun', 'flags'] ;if all updates


  FOR xx=0, n_elements(whichupdate)-1, 1 DO BEGIN ;loop over header update
     CASE whichupdate[xx] OF                      ;which header update

        'basic' : BEGIN                                                                               ;the basic info
           spawn, 'whoami', whoami                                                                    ;get who ran this code
           fxaddpar, xdatahdr, 'ZANAUTH', whoami[0], 'Who performed redshift analysis'                ;add to header
           time = SYSTIME()                                                                           ;get the date
           fxaddpar, xdatahdr, 'ZANDATE', time, 'Date of redshift analysis.'                          ;add to header
           fxaddpar, xdatahdr, 'VZAN', self.rfrobjver, 'Version of rest frame redshift analysis code' ;add to header
           fxaddpar, xdatahdr, 'ZANLAL', self.lal, 'Lower wavelength for contiuum fit, [Ang]'         ;add to header
           fxaddpar, xdatahdr, 'ZANLAU', self.lau, 'Upper wavelength for contiuum fit, [Ang]'         ;add to header
                                ;IF strcompress(self.xwhich, /REMOVE_ALL) EQ 'N' THEN mobval = 0 ELSE mobval = 1                ;determine value
                                ;fxaddpar, xdatahdr, 'ZANMOBJ', mobval, 'Multiple objects for reshift analysis?'                ;add value 
                                ;fxaddpar, xdatahdr, 'ZQFLAG', fix(self.zqflag), 'Quality of redshift, higher=bad, negative=NA' ;add value 
        END                     ;end the basic info

        'run' : BEGIN                                                                                       ;run parameters
           fxaddpar, xdatahdr, 'NOFITSKY', self.nofitsky, 'Were regions of sky lines included in fit? 1=no' ;add value
           FOR yy=0, n_elements(xpriors)-1, 1 DO BEGIN                                                      ;loop over priors
              name = strcompress('ZANPRI' + string(yy+1), /REMOVE_ALL)                                      ;name in header
              fxaddpar, xdatahdr, name, xpriors[yy], 'Prior used in redshift analysis'                      ;add value
           ENDFOR                                                                                           ;end loop over priors
           FOR yy=0, n_elements(xinitgss)-1, 1 DO BEGIN                                                     ;loop over priors
              name = strcompress('ZANGSS' + string(yy+1), /REMOVE_ALL)                                      ;name in header
              fxaddpar, xdatahdr, name, xinitgss[yy], 'Initial guess used in fitting'                       ;add value
           ENDFOR                                                                                           ;end loop over priors
        END                                                                                                 ;end run parameters

        'fit' : BEGIN                                                                                       ;add the fit param values
           IF keyword_set(FITVALS) THEN BEGIN                                                               ;parameter values given
              fxaddpar, xdatahdr, 'ZANMEDX', fitvals.medxs, 'Wavelength at origin for continuum fit, [Ang]' ;add to header

              FOR yy=0, self.border-1, 1 DO BEGIN                                          ;loop over continuum params
                 tag = strcompress('X' + string(yy), /REMOVE_ALL)                          ;tag to grab
                 chk = tag_exist(fitvals, tag, INDEX=ind)                                  ;find tag location
                 name = strcompress('ZANX' + string(yy), /REMOVE_ALL)                      ;header key
                 comment = strcompress('X' + string(yy) + ' value in continuum fit')       ;header comment
                 fxaddpar, xdatahdr, name, fitvals.(ind), comment                          ;add to header 
                 tag = strcompress('X' + string(yy) + 'm', /REMOVE_ALL)                    ;tag to grab
                 chk = tag_exist(fitvals, tag, INDEX=indm)                                 ;find tag location
                 tag = strcompress('X' + string(yy) + 'p', /REMOVE_ALL)                    ;tag to grab
                 chk = tag_exist(fitvals, tag, INDEX=indp)                                 ;find tag location
                 name = strcompress('DZANX' + string(yy), /REMOVE_ALL)                     ;header key
                 comment = strcompress('X' + string(yy) + ' value error in continuum fit') ;header comment
                 fxaddpar, xdatahdr, name, mean([fitvals.(indm), fitvals.(indp)]), comment ;add to header
              ENDFOR                                                                       ;end loop continuum params

              FOR yy=0, n_elements(xfitto)-1, 1 DO BEGIN                                            ;loop over emission line params
                 name = strcompress('ZANLIN' + string(yy+1), /REMOVE_ALL)                           ;header key
                 value = strcompress(xfitto[yy], /REMOVE_ALL)                                       ;value
                 comment = strcompress('Line ' + string(yy+1) + ' used to find redshift')           ;header comment
                 fxaddpar, xdatahdr, name, value, comment                                           ;add to header 
                 tag = strcompress('sig' + string(yy+1), /REMOVE_ALL)                               ;tag to search
                 chk = tag_exist(fitvals, tag, INDEX=ind)                                           ;find tag
                 name = strcompress(xfitto[yy] +'WID', /REMOVE_ALL)                                 ;header key
                 comment =  strcompress('Sigma of Gaussian ' + xfitto[yy] + ' line, [Ang]')         ;header comment
                 fxaddpar, xdatahdr, name, fitvals.(ind), comment                                   ;add to header
                 tag = strcompress('sig' + string(yy+1) + 'm', /REMOVE_ALL)                         ;tag to search
                 chk = tag_exist(fitvals, tag, INDEX=indm)                                          ;find tag
                 tag = strcompress('sig' + string(yy+1) + 'p', /REMOVE_ALL)                         ;tag to search
                 chk = tag_exist(fitvals, tag, INDEX=indp)                                          ;find tag
                 name = strcompress('D' + xfitto[yy] +'WID', /REMOVE_ALL)                           ;header key
                 comment = strcompress('Sigma of Gaussian error of ' + xfitto[yy] + ' line, [Ang]') ;header comment
                 fxaddpar, xdatahdr, name, mean([fitvals.(indm), fitvals.(indp)]), comment          ;add to header
                 tag = strcompress('c' + string(yy+1), /REMOVE_ALL)                                 ;tag to search
                 chk = tag_exist(fitvals, tag, INDEX=ind)                                           ;find tag
                 name = strcompress(xfitto[yy] +'AR', /REMOVE_ALL)                                  ;header key
                 comment = strcompress('Constant factor of ' + xfitto[yy] + ' line, [flux]')        ;header comment
                 fxaddpar, xdatahdr, name, fitvals.(ind), comment                                   ;add to header
                 tag = strcompress('c' + string(yy+1) + 'm', /REMOVE_ALL)                           ;tag to search
                 chk = tag_exist(fitvals, tag, INDEX=indm)                                          ;find tag
                 tag = strcompress('c' + string(yy+1) + 'p', /REMOVE_ALL)                           ;tag to search
                 chk = tag_exist(fitvals, tag, INDEX=indp)                                          ;find tag
                 name = strcompress('D' + xfitto[yy] +'AR', /REMOVE_ALL)                            ;header key
                 comment = strcompress('Constant factor error of ' + xfitto[yy] + ' line, [flux]')  ;header comment
                 fxaddpar, xdatahdr, name, mean([fitvals.(indm), fitvals.(indp)]), comment          ;add to header
              ENDFOR                                                                                ;end loop over emission line params
              
           ENDIF ELSE BEGIN                                                 ;if parameters not given
              print, 'WARNING!! Can not add fit parameter values to header' ;print info
              print, '  Fit parameter values not passed!'                   ;print info
           ENDELSE                                                          ;end parameters not given
        END                                                                 ;end add fit param values
        
        'postrun' : BEGIN                                                             ;add the post run analysis param values
           IF keyword_set(ZVALS) THEN BEGIN                                           ;if values were passed
              fxaddpar, xdatahdr, 'ZANZMLE', zvals.zmle, 'MLE Redshift value'         ;add value 
              fxaddpar, xdatahdr, 'ZANDZMLE', zvals.dzmle, 'MLE Redshift error value' ;add value 
              fxaddpar, xdatahdr, 'ZANZMC', zvals.zmc, 'MC Redshift value'            ;add value 
              fxaddpar, xdatahdr, 'ZANDZMC', zvals.dzmc, 'MC Redshift error value'    ;add value 
           ENDIF                                                                      ;end if values were passed

           IF keyword_set(FITBRK) THEN BEGIN                                                                  ;if values were passed
              chk = tag_exist(fitbrk, 'x0', INDEX=tagind1)                                                    ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANX0', fitbrk.x0, 'Continuum const term coeff'         ;update value 
              chk = tag_exist(fitbrk, 'x0m', INDEX=tagind1)                                                   ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANDX0', fitbrk.x0m, 'Continuum const term coeff error' ;update value 
              chk = tag_exist(fitbrk, 'x1', INDEX=tagind1)                                                    ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANX1', fitbrk.x1, 'Continuum lin term coeff'           ;update value 
              chk = tag_exist(fitbrk, 'x1m', INDEX=tagind1)                                                   ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANDX1', fitbrk.x1m, 'Continuum lin term coeff error'   ;update value 
              chk = tag_exist(fitbrk, 'x2', INDEX=tagind1)                                                    ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANX2', fitbrk.x2, 'Continuum quad term coeff'          ;update value 
              chk = tag_exist(fitbrk, 'x2m', INDEX=tagind1)                                                   ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANDX2', fitbrk.x2m, 'Continuum quad term coeff error'  ;update value 
              chk = tag_exist(fitbrk, 'x3', INDEX=tagind1)                                                    ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANX3', fitbrk.x3, 'Continuum cubic term coeff'         ;update value 
              chk = tag_exist(fitbrk, 'x3m', INDEX=tagind1)                                                   ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANDX3', fitbrk.x3m, 'Continuum cubic term coeff error' ;update value 
              chk = tag_exist(fitbrk, 'x4', INDEX=tagind1)                                                    ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANX4', fitbrk.x4, 'Continuum quar term coeff'          ;update value 
              chk = tag_exist(fitbrk, 'x4m', INDEX=tagind1)                                                   ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANDX4', fitbrk.x4m, 'Continuum quar term coeff error'  ;update value 
              chk = tag_exist(fitbrk, 'x5', INDEX=tagind1)                                                    ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANX5', fitbrk.x5, 'Continuum quin term coeff'          ;update value 
              chk = tag_exist(fitbrk, 'x5m', INDEX=tagind1)                                                   ;check tag name
              IF (chk EQ 1) THEN fxaddpar, xdatahdr, 'ZANDX5', fitbrk.x5m, 'Continuum quin term coeff error'  ;update value 

              
              FOR yy=0, n_elements(xfitto)-1, 1 DO BEGIN                                            ;loop over lines
                 tag = strcompress(xfitto[yy] +'WML', /REMOVE_ALL)                                  ;tag to search
                 chk = tag_exist(fitbrk, tag, INDEX=ind)                                            ;find tag
                 name = strcompress(xfitto[yy] +'WML', /REMOVE_ALL)                                 ;header key
                 comment =  strcompress('Sigma of Gaussian ' + xfitto[yy] + ' line, [Ang]')         ;header comment
                 fxaddpar, xdatahdr, name, fitbrk.(ind), comment                                    ;add to header
                 tag = strcompress(xfitto[yy] +'DWML', /REMOVE_ALL)                                 ;tag to search
                 chk = tag_exist(fitbrk, tag, INDEX=indp)                                           ;find tag
                 name = strcompress('D' + xfitto[yy] +'WID', /REMOVE_ALL)                           ;header key
                 comment = strcompress('Sigma of Gaussian error of ' + xfitto[yy] + ' line, [Ang]') ;header comment
                 fxaddpar, xdatahdr, name, fitbrk.(indp), comment                                   ;add to header
                 tag = strcompress(xfitto[yy] +'CML', /REMOVE_ALL)                                  ;tag to search
                 chk = tag_exist(fitbrk, tag, INDEX=ind)                                            ;find tag
                 name = strcompress(xfitto[yy] +'CML', /REMOVE_ALL)                                 ;header key
                 comment = strcompress('Constant factor of ' + xfitto[yy] + ' line, [flux]')        ;header comment
                 fxaddpar, xdatahdr, name, fitbrk.(ind), comment                                    ;add to header
                 tag = strcompress(xfitto[yy] +'DCML', /REMOVE_ALL)                                 ;tag to search
                 chk = tag_exist(fitbrk, tag, INDEX=indp)                                           ;find tag
                 name = strcompress('D' + xfitto[yy] +'ML', /REMOVE_ALL)                            ;header key
                 comment = strcompress('Constant factor error of ' + xfitto[yy] + ' line, [flux]')  ;header comment
                 fxaddpar, xdatahdr, name, fitbrk.(indp), comment                                   ;add to header
                 tag = strcompress(xfitto[yy] + 'FLX', /REMOVE_ALL)                                 ;tag name
                 chk = tag_exist(fitbrk, tag, INDEX=tagind)                                         ;find tag
                 comment = strcompress(xfitto[yy] + ' line flux [arb]')                             ;header comment
                 IF (chk EQ 1) THEN fxaddpar, xdatahdr, tag, fitbrk.(tagind), comment               ;add value 
                 tag = strcompress(xfitto[yy] + 'DFLX', /REMOVE_ALL)                                ;tag name
                 chk = tag_exist(fitbrk, tag, INDEX=tagind)                                         ;find tag
                 comment = strcompress(xfitto[yy] + ' line flux error [arb]')                       ;header comment
                 IF (chk EQ 1) THEN fxaddpar, xdatahdr, tag, fitbrk.(tagind), comment               ;add value 
                 tag = strcompress(xfitto[yy] + 'SGN', /REMOVE_ALL)                                 ;tag name
                 chk = tag_exist(fitbrk, tag, INDEX=tagind)                                         ;find tag
                 IF (chk EQ 1) THEN fxaddpar, xdatahdr, tag, fitbrk.(tagind), 'line signif [sigma]' ;add value 
              ENDFOR                                                                                ;end loop over lines
           ENDIF                                                                                    ;end if values were passed

        END                     ;end post run analysis

        'flags' : BEGIN                                                                             ;flag values
           IF keyword_set(FLGVALS) THEN BEGIN                                                       ;if values provided
              FOR yy=0, n_elements(xfitto)-1, 1 DO BEGIN                                            ;loop over emission line params
                 tag = strcompress(xfitto[yy] + 'FLG', /REMOVE_ALL)                                 ;tag name
                 chk = tag_exist(flgvals, tag, INDEX=indflg)                                        ;find tag
                 comment = strcompress('Flag value for ' + xfitto[yy] + ' line; redshift analysis') ;header comment
                 fxaddpar, xdatahdr, tag, flgvals.(indflg) , comment                                ;add to header
              ENDFOR                                                                                ;end loop over lines
           ENDIF ELSE BEGIN                                                                         ;end values provided
              print, 'WARNING!! Can not add flag values to header'                                  ;print info
              print, '  Flag values not passed!'                                                    ;print info
           ENDELSE                                                                                  ;end no values provided
        END                                                                                         ;end flag values

        ELSE : BEGIN
           print, 'something'
        END

     ENDCASE                    ;end which header update
  ENDFOR                        ;end loop over header updates
  

  self.datahdr = ptr_new(xdatahdr) ;resave header

  RETURN, xdatahdr
END
;====================================================================================================



;====================================================================================================
FUNCTION restframe_analyze1d::writefile, DRYRUN=dryrun


  outfile = self.epsfileod                                                               ;copy in file
  tester = strcompress('*' + self.oldver + '*', /REMOVE_ALL)                             ;string to test for
  test = strmatch(outfile, tester)                                                       ;text outfile
  IF (test EQ 1) THEN BEGIN                                                              ;if test passes
     strreplace, outfile, self.oldver, self.newver                                       ;replace name
     outfile = strcompress(self.outdir + outfile, /REMOVE_ALL)                           ;write file
     print, outfile                                                                      ;REMOVAL
     IF (~keyword_set(DRYRUN)) THEN mwrfits, *self.data, outfile, *self.datahdr, /CREATE ;write out new
     RETURN, 1                                                                           ;return
  ENDIF ELSE BEGIN                                                                       ;end test passes
     print, 'Outfile name not unique!! Original file would be overwritten!!'             ;print info
     print, '  Not writing file!!'                                                       ;print info
     RETURN, 0                                                                           ;return
  ENDELSE                                                                                ;end alt to test passing


END
;====================================================================================================


;====================================================================================================
PRO restframe_analyze1d::displayoned, xmylambflg, NEWDATA=newdata ;, SPEC=spec

  
  xdata = *self.data                                                      ;dereference data
  bit = where(xmylambflg EQ 1)                                            ;find points to use
  xxs = xdata.lambdas[bit]                                                ;data to plot spectrum
  IF keyword_set(NEWDATA) THEN xys = newdata ELSE xys = xdata.spec1d[bit] ;data to plot spectrum
  CASE self.justfit OF
     1 : actdataerr = xdata.spec1dwei
     2 : actdataerr = xdata.spec1dfullwei
     ELSE :  actdataerr = xdata.spec1dwei
  ENDCASE
  yerr = actdataerr[bit]        ;data to plot spectrum

  
  IF keyword_set(PAD) THEN pad = pad[0] ELSE pad = 0.02                                   ;sets new value
  IF keyword_set(XMIN) THEN xmin = xmin[0] ELSE xmin = min(xxs) - pad*(max(xxs)-min(xxs)) ;sets new value
  IF keyword_set(XMAX) THEN xmax = xmax[0] ELSE xmax = max(xxs) + pad*(max(xxs)-min(xxs)) ;sets new value
  IF keyword_set(YMIN) THEN ymin = ymin[0] ELSE ymin = min(xys) - pad*(max(xys)-min(xys)) ;sets new value
  IF keyword_set(YMAX) THEN ymax = ymax[0] ELSE ymax = max(xys) + pad*(max(xys)-min(xys)) ;sets new value
  IF keyword_set(OUTPLOT) THEN outplot = 'Y' ELSE outplot = 'N'                           ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                      ;sets new value
  

  ;;;Find plot area
  chk = where((xxs GE xmin) AND (xxs LE xmax), nchk)
  
  ;;;plotting
  w = window(LOCATION=[200,25], DIMENSIONS=[1000,400]) ;set window
  CASE keyword_set(YERR) OF 
     0 : BEGIN
        myplot = plot(xxs[chk], xys[chk], /NODATA, $       ;plot values 
                      /CURRENT,  LINESTYLE=0, $            ;plot options     
                      XTITLE = 'Wavelength [Angstroms]', $ ;plot options
                      XRANGE = [xmin, xmax], $             ;plot options
                      YTITLE = 'Flux [arbitrary units]', $ ;plot options
                      YRANGE = [ymin, ymax], $             ;plot options
                      TITLE = '1D Spetrum and Errors', $   ;plot options
                      SYM_SIZE = 1.5, $                    ;plot options
                      FONT_SIZE = 14)                      ;plot options
        
     END
     1 : BEGIN
        CASE keyword_set(FILLERR) OF
           0 : BEGIN
              myplot = errorplot(xxs[chk], xys[chk], yerr[chk], $         ;plot values
                                 /CURRENT, LINESTYLE=0, $                 ;plot options               
                                 XTITLE = 'Obs Wavelength [Angstroms]', $ ;plot options
                                 XRANGE = [xmin, xmax], $                 ;plot options
                                 YTITLE = 'Flux [arbitrary units]', $     ;plot options
                                 YRANGE = [ymin, ymax], $                 ;plot options
                                 TITLE = '1D Spetrum, Errors and Fit', $  ;plot options
                                 SYM_SIZE = 1.5, $                        ;plot options
                                 FONT_SIZE = 14)                          ;plot options
           END
           1: BEGIN
              myplot = plot(xxs[chk], xys[chk], /NODATA, $           ;plot values
                            /CURRENT, LINESTYLE=0, $                 ;plot options
                            XTITLE = 'Obs Wavelength [Angstroms]', $ ;plot options
                            XRANGE = [xmin, xmax], $                 ;plot options
                            YTITLE = 'Flux [arbitrary units]', $     ;plot options
                            YRANGE = [ymin, ymax], $                 ;plot options
                            TITLE = '1D Spetrum and Errors', $       ;plot options
                            SYM_SIZE = 1.5, $                        ;plot options
                            FONT_SIZE = 14)                          ;plot options
              
              xyslow = (xys-yerr)
              xyshigh = (xys+yerr)
              IF nchk GT 0 THEN BEGIN
                 polyxs = [xxs[chk], reverse(xxs[chk])]
                 polyys = [xyslow[chk], reverse(xyshigh[chk])]
              ENDIF
              tmpchk = where(polyys GE ymax, nchk)
              IF nchk NE 0 then polyys[tmpchk] = ymax
              tmpchk = where(polyys LE ymin, nchk)
              IF nchk NE 0 then polyys[tmpchk] = ymin
              
              polyfill, polyxs, polyys, /DATA, $ ;fill error bars
                        COLOR = '666666'XL       ;plot options
           END
        ENDCASE
     END 
     
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
  ENDCASE
  myfit = plot(xxs[chk], xys[chk], /OVERPLOT, $ ;plot values
               LINESTYLE=0, THICK = 1.8)        ;plot options

  IF keyword_set(VALSBAYES) THEN BEGIN                                       ;if value given
     gausspart = -(xxs-valsbayes.mu1)^2.0/(2.0*valsbayes.sig1^2)             ;find exponent values
     bayesys = valsbayes.c1*exp(gausspart) + valsbayes.a1*xxs + valsbayes.b1 ;find hypothetical data values
     myfit= plot(xxs[chk], bayesys, /OVERPLOT, $                             ;plot values 
                 LINESTYLE=0, THICK = 2.0)                                   ;plot options
  ENDIF

  IF keyword_set(VALSMP) THEN BEGIN                           ;check if MPFIT vals given
     gausspart = gaussmp(xxs, valsmp[2:4])                    ;eval gauss part
     mpys = gausspart + valsmp[1]*xxs + valsmp[0]             ;eval all
     myfit = plot(xxs[chk], mpys, /OVERPLOT, $                ;plot fit
                  LINESTYLE=0, THICK = 2.0)                   ;plot options
     legend, ['Bayesian', 'MPFIT'], LINESTYLE=[0,0], BOX=0, $ ;legend
             COLORS=['FF0000'XL, '00FF00'XL], $               ;legend options
             CHARSIZE = 1.4, $                                ;plot options
             TEXTCOLORS='000000'XL                            ;legend options
  ENDIF ELSE BEGIN                                            ;end check MPFIT vals
     IF keyword_set(VALSBAYES) THEN BEGIN
        legend, ['Bayesian'], LINESTYLE=[0], BOX=0, $ ;legend
                COLORS=['FF0000'XL], $                ;legend options
                CHARSIZE = 1.4, $                     ;plot options
                TEXTCOLORS='000000'XL                 ;legend options
     ENDIF
  ENDELSE


END
;====================================================================================================



;====================================================================================================
PRO restframe_analyze1d::displayonedout, xzz, NEWHDR=newhdr


  IF keyword_set(NEWHDR) THEN datahdr = newhdr ELSE datahdr = *self.datahdr ;set default


  ;;;plot the spectra and fit
  outplot = self.graphoutfile                                                      ;copy file name
                                ;IF keyword_set(XWHICH) THEN strreplace, outplot, xwhich[0], xwhich[1] ;replace 
  nosky = fxpar(*self.datahdr, 'NOSKY')                                            ;get no sky value
  test = strmatch(nosky, '*yband*')                                                ;test sky line
  IF test NE 0 THEN ysky = nosky ELSE ysky = 0                                     ;set value
  test = strmatch(nosky, '*jband*')                                                ;test sky line
  IF test NE 0 THEN jsky = nosky ELSE jsky = 0                                     ;set value
  test = strmatch(nosky, '*hband*')                                                ;test sky line
  IF test NE 0 THEN hsky = nosky ELSE hsky = 0                                     ;set value
  test = strmatch(nosky, '*kband*')                                                ;test sky line
  IF test NE 0 THEN ksky = nosky ELSE ksky = 0                                     ;set value
  spectra_1d, *self.data, datahdr, ZZ=float(xzz), /YERR, $                         ;plot analysis
              DOMAIN=[self.lal, self.lau], $                                       ;plot options
              RANGE=[self.yl, self.yu], $                                          ;plot options
              BAYESFIT=*self.fitto, PREFIX='ZAN', $                                ;plot options
              TITLE=strcompress(self.basename + '_' + self.object, /REMOVE_ALL), $ ;plot options
              YSKY=ysky, JSKY=jsky, HSKY=hsky, KSKY=ksky, $                        ;plot options
              /SHADESKY, /BALMER, /NONBALMER, $                                    ;plot options
              /INFO, PSNAME=outplot                                                ;plot options
  


END
;====================================================================================================



;====================================================================================================
PRO restframe_analyze1d::run, ymciters

  
END
;====================================================================================================


;====================================================================================================
PRO restframe_analyze1d::cleanup


  self.initialguess::cleanup    ;cleanup
  ptr_free, self.data           ;free data pointer
  ptr_free, self.datahdr        ;free data header pointer
  ptr_free, self.lambflg        ;free lines pointer
  ptr_free, self.fitto          ;free lines pointer
  ptr_free, self.fittowl        ;free lines pointer
  ptr_free, self.initgss        ;free lines pointer
  ptr_free, self.priors         ;free lines pointer
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION restframe_analyze1d::init, xbasename, xobj, $
                                    DRYRUN=dryrun, NOFITSKY=nofitsky, INITGSS=initgss, PRIORS=priors, $
                                    FITTO=fitto, LAL=lal, LAU=lau, YL=yl, YU=yu, $
                                    BORDER=border, OLDVER=oldver, NEWVER=newver, XWHICH=xwhich, $
                                    ZQFLAG=zqflag, KEYSKY=keysky, JUSTFIT=justfit, $
                                    INDIR=indir, OUTDIR=outdir, VERBOSE=verbose, HELP=help
  
  

  self.rfrobjver = 'v1-0-0'     ;code version
  self.basename = xbasename     ;store name
  self.object = xobj            ;store name
                                ;  IF keyword_set(DRYRUN) THEN self.dryrun = dryrun ELSE self.dryrun = 0        ;sets new value
                                ;  IF keyword_set(NOFITSKY) THEN self.nofitsky =nofitsky ELSE self.nofitsky = 0 ;sets new value

  IF keyword_set(INITGSS) THEN BEGIN                                                       ;if initial guess is given
     self.initgss = ptr_new(initgss)                                                       ;store info
  ENDIF ELSE BEGIN                                                                         ;cont next line
     self.initgss = ptr_new(['sig1=3.0', 'c1=1.0', 'x0=0.1', 'x1=0.0001'])                 ;sets new value
  ENDELSE                                                                                  ;no initial guess given
  status = self.initialguess::init(*self.initgss)                                          ;initialize
  IF keyword_set(PRIORS) THEN self.priors = ptr_new(priors) ELSE $                         ;cont next line
     self.priors = ptr_new(['SIG1 GT 0.0', 'C1 GT 0.0'])                                   ;sets new value
  IF keyword_set(FITTO) THEN self.fitto = ptr_new(fitto) ELSE self.fitto = ptr_new(['Ha']) ;sets new value
  IF keyword_set(LAL) THEN self.lal = lal ELSE self.lal = 9000.0                           ;sets new value
  IF keyword_set(LAU) THEN self.lau = lau ELSE self.lau = 27000.0                          ;sets new value
  IF keyword_set(YL) THEN self.yl = yl ELSE self.yl = 0.0                                  ;sets new value
  IF keyword_set(YU) THEN self.yu = yu ELSE self.yu = 360.0                                ;sets new value
  IF keyword_set(BORDER) THEN self.border = border ELSE self.border = 2                    ;sets new value
  IF keyword_set(OLDVER) THEN self.oldver = oldver ELSE self.oldver = 'v10'                ;sets new value
  IF keyword_set(NEWVER) THEN self.newver = newver ELSE self.newver = 'v1-2'               ;sets new value
                                ;  IF keyword_set(XWHICH) THEN self.xwhich = xwhich ELSE self.xwhich = 'N'                 ;sets new value
                                ;  IF keyword_set(ZQFLAG) THEN self.zqflag = zqflag ELSE self.zqflag = '-128'              ;sets new value
  IF keyword_set(KEYSKY) THEN self.keysky = keysky ELSE self.keysky = 'NOSKY'  ;sets new value
  IF keyword_set(JUSTFIT) THEN self.justfit = justfit ELSE self.justfit = 0    ;sets new value
  IF keyword_set(INDIR) THEN self.indir = indir[0] ELSE self.indir = ' '       ;set default
  IF keyword_set(OUTDIR) THEN self.outdir = outdir[0] ELSE self.outdir = ' '   ;set default
  IF keyword_set(VERBOSE) THEN self.verbose = verbose[0] ELSE self.verbose = 2 ;set default
  IF keyword_set(HELP) THEN self.help = 1 ELSE self.help = 0                   ;set default

  RETURN, 1
END
;====================================================================================================



;====================================================================================================
PRO restframe_analyze1d__define

  void = {restframe_analyze1d, INHERITS initialguess, rfrobjver:'A', basename:'A', object:'A', $

                                ;epsfiletd:'A', mepsfiletd:'A', sigfiletd:'A', snrfiletd:'A', msnrfiletd:'A', waveresid:'A', $
          epsfileod:'A', mcruns:'A', mosaicfile:'A', fitfile:'A', fitdistfile:'A', graphoutfile:'A', nepsfileod:'A', $
          data:ptr_new(), datahdr:ptr_new(), lambflg:ptr_new(), $
          initgss:ptr_new(), priors:ptr_new(), nofitsky:0, dryrun:0, $
          fitto:ptr_new(), fittowl:ptr_new(), lal:0.0, lau:0.0, yl:0.0, yu:0.0, $
          border:0, oldver:'A', newver:'A', $ ;, xwhich:'A', zqflag:0, $
          keysky:'A', justfit:0, $
          indir:'A', outdir:'A', verbose:0, help:'A'}

  RETURN
END
;====================================================================================================

