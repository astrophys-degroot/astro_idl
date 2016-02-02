;========================================================================================================================
pro mosfire_1dspec_extract_prep, mask, date, band, datadir, prosdir, $
                                 BITSPOT=bitspot, MASKSNR=masksnr, $
                                 WAVEPAD=wavepad, SPATPAD=spatpad, $
                                 OPENFILE=openfile, VERBOSE=verbose
  
;+
; NAME:
;       MOSFIRE_1DSPEC_EXTRACT_PREP()
;
; PURPOSE:
;       creates the necessary prep files for running optimal spectrum
;       extraction for MOSFIRE DRP produced 2D specta. This version
;       needs to be invoked by a mosfire_reduction_driver clone
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
;       A. DeGroot, 2014 Sep 9, Univ. Cali, Riverside v3.0.0
;          -started modifying for use with mosfire_reduction_driver clones
;       A. DeGroot, 2014 Sep 9, Univ. Cali, Riverside v2.2.0
;          -improved guess for region file dimensions
;       A. DeGroot, 2014 Sep 9, Univ. Cali, Riverside v2.1.0
;          -added mask SNR image feature
;       A. DeGroot, 2014 Aug 6, Univ. Cali, Riverside v2.0.0
;
;
; DESIRED UPGRADES
;     working with MRD remove the openfile option, bitspot option,
;     -better guess and extract parameters based on info in header and
;     quick look at data
;     -better way of getting what spectra are at hand
;     -figure out how to do carrage return
;
;-
  version = '3.0.0'

  
  IF keyword_set(BITSPOT) THEN bitspot = bitspot[0] ELSE bitspot = 4          ;set new value
  IF keyword_set(WAVEPAD) THEN wavepad = wavepad[0] ELSE wavepad = 50.0       ;set new value
  IF keyword_set(SPATPAD) THEN spatpad = spatpad[0] ELSE spatpad = 2.0        ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2          ;set new value
  read_template_extract, 1                                                    ;compile routine




  ;;;create list of 2D spectra
                                ;IF verbose GE 1 THEN print, '  Mask name: ', mask                              ;print info
                                ;list2d = strcompress(mask + '_2dspeclist.txt', /REMOVE_ALL)                    ;create name for file
                                ;dir2d = strcompress('../' + mask + '/' + date + '/' + band + '/', /REMOVE_ALL) ;create path to files
                                ;spawn, 'ls ' + dir2d + '*eps.fits > '+ list2d                                  ;populate file
                                ;spawn, 'mv ' + list2d + ' ' + dir2d                                            ;move the list file
  

  ;;;read in 2D speclist file
  bit = ' '                     ;initialize
  nspec = file_lines(list2d)    ;find number of lines
  spectra = strarr(nspec)       ;create string array
  openr, lun, list2d, /GET_LUN  ;open list for reading
  FOR xx=0, nspec-1, 1 DO BEGIN ;loop over the lines in file
     readf, lun, bit            ;read line
     spectra[xx] = bit          ;store line
  ENDFOR                        ;end loop over lines in file
  close, lun                    ;close memory
  free_lun, lun                 ;free memory

  
  ;;;read in template extration file
  strtemp = read_template_extract(prosdir)                                  ;read in template file
  outextract = strcompress(mask + '_' + band + '_extract.pro', /REMOVE_ALL) ;extraction file name
  

  ;;;find some of what needs to be replace in template extraction
  xstrings = ['XMASK', 'XDMASK', 'XDATE', 'XBAND', 'XDIRECTORY']         ;items to replace
  FOR xx = 0, n_elements(xstrings)-1, 1 DO BEGIN                         ;loop over items
     CASE xx OF                                                          ;which iteration of xstrings
        0 : replace = mask                                               ;first iter
        1 : replace = drivemask                                          ;second iter
        2 : replace = date                                               ;third iter
        3 : replace = band                                               ;fourth iter
        4 : replace = datadir                                            ;fifth iter
        ELSE : print, 'Shit! Something went wrong!!'                     ;catch all
     ENDCASE                                                             ;end which iterations of xstrings
     ystrings = strpos(strtemp, xstrings[xx])                            ;find where item is
     chk = where(ystrings NE -1, nchk)                                   ;find lines with item
     IF chk[0] NE -1 THEN BEGIN                                          ;if xstring found
        FOR yy=0, nchk-1, 1 DO BEGIN                                     ;loop over lines xstring found
           tmp = strtemp[[chk[yy]]]                                      ;copy value
           strreplace, tmp, xstrings[xx], replace                        ;replace xstring with string
           strtemp[[chk[yy]]] = tmp                                      ;save value
        ENDFOR                                                           ;end loop over xstring found
     ENDIF ELSE BEGIN                                                    ;if item is in no lines
        print, 'WARNING!! template_extract.txt file has been corrupted!' ;warning
     ENDELSE                                                             ;end if item in no lines
  ENDFOR                                                                 ;end loop over items


  ;;;stock lines to print
  mos2 = "fit:'gauss3', border:2, nosky:'" + strlowcase(band) + "band_mosfire', $"          ;text
  mos3 = "xwhich:0, flip:0, $"                                                              ;text
  mos4 = "guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $"                   ;text
  mos5 = "priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}"                               ;text
  reg1 = '# Region file format: DS9 version 4.1'                                            ;text
  reg3 = 'global color=green dashlist=8 3 width=1 font="helvetica 10 normal roman" ' + $    ;cont next line
         'select=1 highlite=1 dash=0 fixed=0 edit=1 move=1 delete=1 include=1 source=1'     ;text
  reg4 = 'image'                                                                            ;text


  ;;;loop over spectra to get info and such
  strip1 = strcompress(dir2d + mask + '_' + band + '_', /REMOVE_ALL)         ;text string
  strip2 = strcompress('_eps.fits', /REMOVE_ALL)                             ;text string
  FOR xx=0, nspec-1, 1 DO BEGIN                                              ;loop over spectra
 
     ;;;get mask's nickname for source
     current = spectra[xx]                                                   ;grab current spec
     strreplace, current, strip1, ''                                         ;strip front stuff
     strreplace, current, strip2, ''                                         ;strip front stuff
                                ;this = current       ;find 
     that = strcompress("'" + current + "'", /REMOVE_ALL)                    ;make it a string
     reg2 = strcompress('# Filename: ' + mask + '_' + current + '_eps.fits') ;text


     ;;;format for the XEXTRACTIONS entry
     ;other = current
     ;other2 = current
     ;strreplace, other, 'eps.fits', 'sig.fits'
     ;strreplace, other2, 'eps.fits', 'eps.reg'
     ;mos0 = that + " :  mask = {which:'" + this + "', dfile:'" + current + "', wfile:'" + other + "', $"
     ;mos1 = "rfile:'" + other2 + "', $"
     ;printf, lun, mos0
     ;printf, lun, mos1
     ;printf, lun, mos2
     ;printf, lun, mos3
     ;printf, lun, mos4
     ;printf, lun, mos5
     ; printf, lun, ' '


     ;;;format for the XTOTAL entry
     IF xx EQ 0 THEN BEGIN                        ;if first one
        thats = strcompress('[' + that + ', ')    ;store that
     ENDIF ELSE BEGIN                             ;if not first pass
        thats = strcompress(thats + that + ', ' ) ;concatenate
        IF (xx mod 6) EQ 0 THEN BEGIN             ;every sixth pass
           thats = strcompress(thats + ' $' )     ;concatenate
           IF (xx EQ 6)  THEN BEGIN               ;if first sixth pass
              totthat = thats                     ;concatenate every 6th one
           ENDIF ELSE BEGIN                       ;end if first sixth pass
              totthat = [totthat, thats]          ;concatenate every 6th one
           ENDELSE                                ;if not first sixth pass
           thats = ' '                            ;reset
        ENDIF                                     ;end every sixth pass
     ENDELSE                                      ;end if not first pass
     
  ENDFOR                                                                     ;end loop over spectra

  
  ;;;a bit of cleanup
  tmp = totthat[-1]             ;grab last entry
  strreplace, tmp, ', $', ']'   ;modify last entry
  totthat[-1] = tmp             ;resave last entry


  ;;;find rest of what needs to be replace in template extraction
  xstrings = ['XTOTAL', 'XEXTRACTIONS']                                  ;items to replace
  FOR xx = 0, n_elements(xstrings)-2, 1 DO BEGIN                         ;loop over items
     CASE xx OF                                                          ;which iteration of xstrings
        0 : replace = totthat[0]                                         ;first iter
        1 : replace = drivemask                                          ;second iter
        ELSE : print, 'Shit! Something went wrong!!'                     ;catch all
     ENDCASE                                                             ;end which iterations of xstrings
     ystrings = strpos(strtemp, xstrings[xx])                            ;find where item is
     chk = where(ystrings NE -1, nchk)                                   ;find lines with item
     IF (chk[0] NE -1) AND (nchk EQ 1) THEN BEGIN                        ;if xstring found
        tmp = strtemp[[chk]]                                             ;copy value
        strreplace, tmp, xstrings[xx], replace                           ;replace xstring with string
        strtemp[[chk]] = tmp                                             ;save value
        strtemp = [strtemp[0:chk], totthat[1:-1], strtemp[chk+1:-1]]     ;concatenate

     ENDIF ELSE BEGIN                                                    ;if item is in no lines
        print, 'WARNING!! template_extract.txt file has been corrupted!' ;warning
     ENDELSE                                                             ;end if item in no lines
  ENDFOR                                                                 ;end loop over items
  


  ;;;print info to file
  openw, lun, outextract, /GET_LUN            ;open file unit
  FOR xx=0, n_elements(strtemp)-1, 1 DO BEGIN ;loop over string entries
     printf, lun, strtemp[xx]                 ;print to file
  ENDFOR                                      ;end loop over string entries
  close, lun                                  ;close file 
  free_lun, lun                               ;free file unit
  IF keyword_set(OPENFILE) THEN spawn, 'aqua ' + outextract



  stop

  
    
  IF keyword_set(MASKSNR) THEN BEGIN                         ;check MASKSNR keyword
     masksnr = masksnr[0]                                    ;get single entry
     chk = (masksnr GT 0.0) AND (masksnr LT 99999.9)         ;sanity check
     IF chk NE 0 THEN BEGIN                                  ;if sanity check passes
     ENDIF ELSE BEGIN                                        ;end sanity check passes
        print, ' MASKSNR values is outside allowed values!!' ;print info
        print, '  0.0 < masksnr < 99999.9'                   ;print info
        stop                                                 ;stop run
     ENDELSE                                                 ;end sanity check fails
  ENDIF                                                      ;end MASKSNR keyword


     
     
     

     IF keyword_set(REGION) THEN BEGIN                     ;check REGION keyword
        reg5 = 'box(avex,avey,szx,szy,0)'                  ;text
        data = readfits(current, hdr, /SILENT)             ;read in file 
        chk = where(data NE data)                          ;sanity check
        IF chk[0] NE -1 THEN data[chk] = 0.0               ;reset NaNs, INFs
        tmpdata = total(data, 1)                           ;sum over wavelengths
        chk = where(tmpdata NE 0.0)                        ;find nonzero 
        y1 = min(chk)+spatpad                              ;create string bit
        y2 = max(chk)-spatpad                              ;create string bit
        tmpdata = total(data, 2)                           ;sum over spatial
        chk = where(tmpdata NE 0.0)                        ;find nonzero 
        x1 = min(chk)+wavepad                              ;create string bit
        x2 = max(chk)-wavepad                              ;create string bit
        avex = 0.5*(x2-x1) + wavepad                       ;center x pos
        avey = 0.5*(y2-y1) + spatpad                       ;center y pos
        szx = (x2-x1)                                      ;size of x
        szy = (y2-y1)                                      ;size of y
        avex = strcompress(string(fix(avex)), /REMOVE_ALL) ;create string bit
        avey = strcompress(string(fix(avey)), /REMOVE_ALL) ;create string bit
        szx = strcompress(string(fix(szx)), /REMOVE_ALL)   ;create string bit
        szy = strcompress(string(fix(szy)), /REMOVE_ALL)   ;create string bit
        strreplace, reg5, 'avex', avex                     ;replace string
        strreplace, reg5, 'avey', avey                     ;replace string
        strreplace, reg5, 'szx', szx                       ;replace string
        strreplace, reg5, 'szy', szy                       ;replace string
        other = current                                    ;make a copy of file
        strreplace, other, 'eps.fits', 'eps.reg'           ;rename file
        openw, lun3, other, /GET_LUN                       ;open file to write
        printf, lun3, reg1                                 ;write to file
        printf, lun3, reg2                                 ;write to file
        printf, lun3, reg3                                 ;write to file
        printf, lun3, reg4                                 ;write to file
        printf, lun3, reg5                                 ;write to file
        close, lun3                                        ;close file
        free_lun, lun3                                     ;free file memory
     ENDIF                                                 ;end check REGION keyword
     

     ;;;mask SNR file if desired 
     IF keyword_set(MASKSNR) THEN BEGIN                                              ;check MASKSNR keyword
        other = current                                                              ;pick current spectrum
        strreplace, other, 'eps.fits', 'snrs.fits'                                   ;edit file name
        masksnrout = other                                                           ;copy current spectrum
        strreplace, masksnrout, 'snrs.fits', 'snrs_masked.fits'                      ;edit outfile name
        data = readfits(other, snrhdr, /SILENT)                                      ;read in file
        fxaddpar, snrhdr, 'MASKSNR', masksnr, 'Lower limit for SNR value to be kept' ;add to header
        chk = where(data LT masksnr)                                                 ;find snr values that dont make cut
        IF chk[0] NE -1 THEN data[chk] = 0.0                                         ;mask low values
        mwrfits, data, masksnrout, snrhdr, /CREATE                                   ;write file
     ENDIF                                                                           ;end MASKSNR keyword

  



END
;========================================================================================================================




;========================================================================================================================
pro mosfire_1dspec_analyze_prep, mask, BITSPOT=bitspot, ZGUESS=zguess, FITTO=fitto, $
                                 SPECVER=specver, INTERACTIVE=interactive, $
                                 IDL=idl, TOTAL=total, $
                                 OPENFILE=openfile, VERBOSE=verbose


;+
; NAME:
;       MOSFIRE_1DSPEC_ANALYZE_PREP()
;
; PURPOSE:
;       create several differently formatted text strings for use with
;       various routines and programs.      
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
;       A. DeGroot, 2014 Sep 9, Univ. Cali, Riverside v2.1.0
;          -added OPENFITS
;       A. DeGroot, 2014 Sep 9, Univ. Cali, Riverside v2.0.0
;          -added INTERACTIVE feature as well as other run time options
;       A. DeGroot, 2014 Aug 6, Univ. Cali, Riverside v1.0.0
;          -prior to 2014 Aug 6
;
;
; DESIRED UPGRADES
;     -better fill in priors and intial guess based on fitto lines
;     -add TOTAL feature
;
;-
  version = '2.1.0'



  IF keyword_set(BITSPOT) THEN bitspot = bitspot[0] ELSE bitspot = 4                ;set new value
  IF keyword_set(SPECVER) THEN specver = specver[0] ELSE specver = 'v10'            ;set new value
  IF keyword_set(ZGUESS) THEN zguess = zguess[0] ELSE zguess = 1.626                ;set new value
  IF keyword_set(FITTO) THEN fitto = fitto[0] ELSE fitto = "'Ha', 'NIIr', 'NIIb'" ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2                ;set new value


  ;;;interactive user input if so desired
  IF keyword_set(INTERACTIVE) THEN BEGIN                                          ;check INTERACTIVE variable
     value = ''                                                                   ;reset
     bit = strcompress('['+ string(mask)+']', /REMOVE_ALL)                        ;string up value
     read, value, PROMPT = '  Mask name? ' + bit + ' '                            ;prompt
     IF value EQ '' THEN mask = mask ELSE mask = value                            ;store new value
     value = ''                                                                   ;reset
     bit = strcompress('['+ string(bitspot)+']', /REMOVE_ALL)                     ;string up value
     read, value, PROMPT = '  Location in string of spectrum name? ' + bit + ' '  ;prompt
     IF value EQ '' THEN bitspot = bitspot ELSE bitspot = fix(value)              ;store new value
     value = ''                                                                   ;reset
     bit = strcompress('['+ string(specver)+']', /REMOVE_ALL)                     ;string up value
     read, value, PROMPT = '  Version of 1D spectra to analyze? ' + bit + ' '     ;prompt
     IF value EQ '' THEN specver = specver ELSE specver = value                   ;store new value
     value = ''                                                                   ;reset
     bit = strcompress('['+ string(zguess)+']', /REMOVE_ALL)                      ;string up value
     read, value, PROMPT = '  Version of 1D spectra to analyze? ' + bit + ' '     ;prompt
     IF value EQ '' THEN zguess = zguess ELSE zguess = value                      ;store new value
     value = ''                                                                   ;reset
     bit = strcompress('['+ string(fitto)+']', /REMOVE_ALL)                       ;string up value
     read, value, PROMPT = '  Version of 1D spectra to analyze? ' + bit + ' '     ;prompt
     IF value EQ '' THEN fitto = fitto ELSE fitto = value                         ;store new value
  ENDIF                                                                           ;end check INTERACTIVE
  IF verbose GE 1 THEN BEGIN                                                      ;check verbose value
     print, ' '                                                                   ;spacer
     print, '************Run Parameters********************'                      ;print info
     print, ' Mask name: ', mask                                                  ;print info
     print, ' Spectra name location: ', strcompress(string(bitspot), /REMOVE_ALL) ;print info
     print, ' Spectra version nubmer: ', specver                                  ;print info
     print, ' Redshift guess: ', string(zguess)                                   ;print info
     print, ' Lines to fit to: ', fitto                                           ;print info
     print, '**********************************************'                      ;print info
  ENDIF                                                                           ;end check verbose value


  ;;;create list of 1D spectra
  list1d = strcompress(mask + '_1dspeclist.txt', /REMOVE_ALL)   ;create name for file
  spawn, 'ls ' + mask + '*eps*' + specver + '*.fits > '+ list1d ;populate file


  ;;;read in file
  bit = ' '                     ;initialize
  nspec = file_lines(list1d)    ;find number of 1d spec
  spectra = strarr(nspec)       ;create string array
  openr, lun, list1d, /GET_LUN  ;open file to read
  FOR xx=0, nspec-1, 1 DO BEGIN ;loop over file's lines
     readf, lun, bit            ;read line
     spectra[xx] = bit          ;store line
  ENDFOR                        ;end loop over lines
  close, lun                    ;close memory
  free_lun, lun                 ;free memory unit

  
  ;;;take a guess at wavelength range
  lines = strsplit(fitto, ",+'+ ", /EXTRACT)       ;extract emission lines
  FOR xx=0, n_elements(lines)-1, 1 DO BEGIN        ;loop over emission lines
     wl = emissionlines(lines[xx])                 ;get rest frame wavelength
     IF xx EQ 0 THEN wls = wl ELSE wls = [wls, wl] ;store wavelengths
  ENDFOR                                           ;end loop over emission lines
  observed = (1.0+zguess)*wls                      ;observed wavelengths
  lower = min(observed) - 200.0                    ;lower bound
  remove = lower mod 100                           ;find extra after 100
  lower = float(fix(lower - remove))               ;round 
  upper = max(observed) + 200.0                    ;upper bound
  remove = upper mod 100                           ;find extra after 100
  upper = float(fix(upper - remove))               ;round 
  

  ;;;open files, prep lines to print
  IF keyword_set(IDL) THEN BEGIN                                                                              ;if keyword is not set
     part1 = strcompress('lal:' + string(lower), /REMOVE_ALL)                                                 ;part of line to print
     part2 = strcompress('lau:' + string(upper), /REMOVE_ALL)                                                 ;part of line to print
     mos1 = part1 + ', ' + part2 + ", QFLAG:99, NOFITSKY:0, $"                                                ;line to print
     part1 = strcompress('redshift=' + string(zguess), /REMOVE_ALL)                                           ;part of line to print
     mos2 = "guess:['" + part1 + "', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $"              ;line to print
     part1 = strcompress('REDSHIFT GT ' + string(zguess-0.01))                                                ;part of line to print
     part2 = strcompress('REDSHIFT LT ' + string(zguess+0.01))                                                ;part of line to print 
     mos3 = "priors:['" + part1 + "', '" + part2 + "', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}" ;line to print
     openw, lun, 'tmp_analyze_idl.txt', /GET_LUN                                                              ;open file to print text
  ENDIF                                                                                                       ;end keyword not set
  
  
  ;;;print to files
  IF keyword_set(IDL) THEN BEGIN                                          ;if keyword IDL is set
     FOR xx=0, nspec-1, 1 DO BEGIN                                        ;loop over spectra
        current = spectra[xx]                                             ;pick current spectra
        bits = strsplit(current, '_', /EXTRACT)                           ;split the string
        this = bits[bitspot]                                              ;get slit name
        that = strcompress("'" + bits[bitspot] + "'", /REMOVE_ALL)        ;string format
        part1 = strcompress('fitto:[' + fitto + ']', /REMOVE_ALL)         ;part of line to print 
        mos0 = that + " :  spectrum = {which:'" + this + "', dfile:'" + $ ;cont next line
               current + "', " + part1 + ", border:2, $"                  ;line to print
        printf, lun, mos0                                                 ;print to file
        printf, lun, mos1                                                 ;print to file
        printf, lun, mos2                                                 ;print to file
        printf, lun, mos3                                                 ;print to file
        printf, lun, ' '                                                  ;print to file
     ENDFOR                                                               ;end loop over spectra
  ENDIF                                                                   ;end keyword IDL set
  

  ;;;close files
  IF keyword_set(IDL) THEN BEGIN                                          ;if keyword is not set
     close, lun                                                           ;close file
     free_lun, lun                                                        ;free file memory
     IF keyword_set(OPENFILE) THEN spawn, 'aqua ' + 'tmp_analyze_idl.txt' ;open file
  ENDIF                                                                   ;end IDL keyword set



END
;========================================================================================================================



;========================================================================================================================
PRO mosfire_2dspec_mask, image, XBAND=xband ;, xlambdas, xdata
  
  
  IF keyword_set(XBAND) THEN xband = xband[0] ELSE xband = 'kband_medium' ;set new value

  speclines, xband, VALS=skyvals ;get spectral lines
  data = readfits(image, hdr) ;get image 
  xskymask = data                ;make a copy
  xskymask[*,*] = 1              ;set all to 1
 
  naxis1 = fxpar(hdr, 'NAXIS1')
  naxis2 = fxpar(hdr, 'NAXIS2')
  crval1 = fxpar(hdr, 'CRVAL1')
  crval2 = fxpar(hdr, 'CRVAL2')
  cd1_1 = fxpar(hdr, 'CD1_1')
  cd1_2 = fxpar(hdr, 'CD1_2')
  cd2_1 = fxpar(hdr, 'CD2_1')
  cd2_2 = fxpar(hdr, 'CD2_2')
  

  xlambdas = cd1_1*indgen(naxis1)+crval1
  help, xlambdas

  FOR xx=0UL, n_elements(skyvals.(0))-1 DO BEGIN ;loop over spec lines
     chk = where((xlambdas GE skyvals.lower[xx]) AND (xlambdas LE skyvals.upper[xx]), nchk) ;find sky lines in spectrum
     IF nchk NE 0 THEN xskymask[chk, *] = 0                                                 ;set sky lines areas to zero
  ENDFOR                                                                                    ;end loop over spec lines

  data = xskymask*data
  help, data

  outfile = image
  strreplace, outfile, '.fits', '_masked.fits'
  print, outfile
  mwrfits, data, outfile, hdr, /CREATE
  

END
;========================================================================================================================




;========================================================================================================================
PRO mosfire_1dspec_prep, check

  aaaa = check


END
;========================================================================================================================
