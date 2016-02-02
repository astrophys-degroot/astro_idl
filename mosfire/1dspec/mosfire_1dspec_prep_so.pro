;========================================================================================================================
pro mosfire_1dspec_extract_prep_so, mask, BITSPOT=bitspot, BAND=band, MASKSNR=masksnr, $
                                 IDL=idl, TOTAL=total, REGION=region, LATEX=latex, $
                                 WAVEPAD=wavepad, SPATPAD=spatpad, $
                                 OPENFILE=openfile, VERBOSE=verbose
  
;+
; NAME:
;       MOSFIRE_1DSPEC_EXTRACT_PREP()
;
; PURPOSE:
;       create several differently formatted text strings for use with
;       various routines and programs. same as
;       mosfire_1dspec_extract_prep but this version is stand alone
;       and does not need to be invoked via mosfire_reduction_driver clone       
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
;       A. DeGroot, 2014 Sep 9, Univ. Cali, Riverside v2.2.0
;          -improved guess for region file dimensions
;       A. DeGroot, 2014 Aug 6, Univ. Cali, Riverside v2.0.0
;
;
; DESIRED UPGRADES
;     none at this time
;
;-
  version = '2.2.0'

  
  IF keyword_set(BITSPOT) THEN bitspot = bitspot[0] ELSE bitspot = 4    ;set new value
  IF keyword_set(WAVEPAD) THEN wavepad = wavepad[0] ELSE wavepad = 50.0 ;set new value
  IF keyword_set(SPATPAD) THEN spatpad = spatpad[0] ELSE spatpad = 2.0  ;set new value
  IF keyword_set(BAND) THEN band = band[0] ELSE band = 'H'           ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2    ;set new value
  
  
  ;;;create list of 2D spectra
  IF verbose GE 1 THEN print, 'Mask name: ', mask             ;print info
  list2d = strcompress(mask + '_2dspeclist.txt', /REMOVE_ALL) ;create name for file
  spawn, 'ls ' + mask + '*eps.fits > '+ list2d                ;populate file
  

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


  ;;;lines to print
  IF keyword_set(IDL) THEN BEGIN                                                      ;if keyword is not set
     mos2 = "fit:'gauss3', border:2, nosky:'" + strlowcase(band) + "band_mosfire', $" ;text
     mos3 = "xwhich:0, flip:0, $"                                                     ;text
     mos4 = "guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $"          ;text
     mos5 = "priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}"                      ;text
     openw, lun, 'tmp_extract_idl.txt', /GET_LUN                                      ;open file for writing
  ENDIF                                                                               ;end keyword not set
  
  IF keyword_set(TOTAL) THEN BEGIN                    ;if keyword is not set
     openw, lun1, 'tmp_extract_idl_all.txt', /GET_LUN ;open file for writing
  ENDIF                                               ;end keyword not set
  
  IF keyword_set(REGION) THEN BEGIN                                                         ;if keyword is not set
     reg1 = '# Region file format: DS9 version 4.1'                                         ;text
     reg3 = 'global color=green dashlist=8 3 width=1 font="helvetica 10 normal roman" ' + $ ;cont next line
            'select=1 highlite=1 dash=0 fixed=0 edit=1 move=1 delete=1 include=1 source=1'  ;text
     reg4 = 'image'                                                                         ;text
  ENDIF                                                                                     ;end keyword not set
  
  IF keyword_set(LATEX) THEN BEGIN                  ;if keyword is not set
     latex1 = "\begin{itemize}"                     ;text
     latex2 = "\item{ }"                            ;text
     latex3 = "\item{ }"                            ;text
     latex4 = "\end{itemize}"                       ;text
     openw, lun2, 'tmp_extract_latex.txt', /GET_LUN ;open file for writing
  ENDIF                                             ;end keyword not set
  
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


  FOR xx=0, nspec-1, 1 DO BEGIN ;loop over spectra
     current = spectra[xx]
     print, current
     bits = strsplit(current, '_', /EXTRACT)
     this = bits[bitspot]
     that = strcompress("'" + bits[bitspot] + "'", /REMOVE_ALL)
     reg2 = strcompress('# Filename: ' + mask + '_' + this + '_eps.fits') ;text
     
     
     IF keyword_set(IDL) THEN BEGIN
        other = current
        other2 = current
        strreplace, other, 'eps.fits', 'sig.fits'
        strreplace, other2, 'eps.fits', 'eps.reg'
        mos0 = that + " :  mask = {which:'" + this + "', dfile:'" + current + "', wfile:'" + other + "', $"
        mos1 = "rfile:'" + other2 + "', $"
        printf, lun, mos0
        printf, lun, mos1
        printf, lun, mos2
        printf, lun, mos3
        printf, lun, mos4
        printf, lun, mos5
        printf, lun, ' '
     ENDIF

     IF keyword_set(TOTAL) THEN BEGIN
        IF xx EQ 0 THEN totthat = that ELSE totthat = strcompress(totthat + ', ' + that)
     ENDIF
     
     IF keyword_set(LATEX) THEN BEGIN
        latex_1 = "\subsection{" + bits[0] + ' ' + bits[1] + ' ' + bits[2] + ' ' + bits[3] + ' ' + "}"                       
        IF xx EQ 0 THEN printf, lun2, latex_1
        FOR yy=0, n_elements(bits)-1, 1 DO BEGIN
           IF yy EQ 0 THEN whole = bits[yy] ELSE whole = strcompress(whole + '\_' + bits[yy], /REMOVE_ALL)
        ENDFOR
        latex0 = "\item{" + whole + "}"
        printf, lun2, latex0
        printf, lun2, latex1
        printf, lun2, latex2
        printf, lun2, latex3
        printf, lun2, latex4
        printf, lun2,  ''
     ENDIF

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

  ENDFOR                        ;end loop over spectra
  

  IF keyword_set(IDL) THEN BEGIN
     close, lun
     free_lun, lun
     IF keyword_set(OPENFILE) THEN spawn, 'aqua ' + 'tmp_extract_idl.txt'
  ENDIF
  
  IF keyword_set(TOTAL) THEN BEGIN 
     printf, lun1, totthat
     close, lun1
     free_lun, lun1
     IF keyword_set(OPENFILE) THEN spawn, 'aqua ' + 'tmp_extract_idl_all.txt'
  ENDIF
  
  IF keyword_set(LATEX) THEN BEGIN
     close, lun2
     free_lun, lun2
     IF keyword_set(OPENFILE) THEN spawn, 'aqua ' + 'tmp_extract_latex.txt'
  ENDIF


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
