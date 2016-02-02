;========================================================================================================================
function catbase

  catbase = {id:0}

  RETURN, catbase
END
;========================================================================================================================



;========================================================================================================================
FUNCTION addbasic, xcat, xheader, xx, NTAG=ntag, MASSTAG=masstag, CLTAG=cltag


  IF keyword_set(NTAG) THEN ntag = ntag[0] ELSE ntag = 'NSTCK'                ;set new value
  IF keyword_set(MASSTAG) THEN masstag = masstag[0] ELSE masstag = 'STCKMAVE' ;set new value
  IF keyword_set(CLTAG) THEN cltag = cltag[0] ELSE cltag = 'CLUSTER'          ;set new value
  
  xcat[xx].nstck = float(fxpar(xheader, ntag))    ;get value from header
  xcat[xx].mass = float(fxpar(xheader, masstag))  ;get value from header
  xcat[xx].cluster = float(fxpar(xheader, cltag)) ;get value from header

  RETURN, xcat
END
;========================================================================================================================



;========================================================================================================================
FUNCTION addfluxes, xcat, xheader, xx, xfluxes, $
                    FLUXTAG=fluxtag, FLUXERRTAG=fluxerrtag, FLAGTAG=flagtag, FLUXNAMES=fluxnames, $
                    HFLUXTAG=hfluxtag, HFLUXERRTAG=hfluxerrtag, HFLAGTAG=hflagtag


  IF keyword_set(HFLUXTAG) THEN hfluxtag = hfluxtag[0] ELSE hfluxtag = '???FLX'              ;set new value
  IF keyword_set(HFLUXERRTAG) THEN hfluxerrtag = hfluxerrtag[0] ELSE hfluxerrtag = '???DFLX' ;set new value
  IF keyword_set(HFLAGTAG) THEN hflagtag = hflagtag[0] ELSE hflagtag = '???FLG'              ;set new value
  IF keyword_set(FLUXTAG) THEN fluxtag = fluxtag[0] ELSE fluxtag = '???_FLUX'                ;set new value
  IF keyword_set(FLUXERRTAG) THEN fluxerrtag = fluxerrtag[0] ELSE fluxerrtag = '???_FLUXERR' ;set new value
  IF keyword_set(FLAGTAG) THEN flagtag = flagtag[0] ELSE flagtag = '???_FLAG'                ;set new value
  
  fluxnames = [xfluxes, xfluxes, xfluxes]     ;make a copy
  FOR ww=0, n_elements(xfluxes)-1, 1 DO BEGIN ;loop over fluxes
     
     tmptag = fluxtag                                                ;copy value
     strreplace, tmptag, '???', xfluxes[ww]                          ;replace 
     tmptag = strcompress(tmptag, /REMOVE_ALL)                       ;remove whitespace
     fluxnames[3*ww] = tmptag                                        ;store value
     chk = tag_exist(xcat, tmptag, INDEX=ind, /TOP_LEVEL)            ;find tag index
     tmptag = hfluxtag                                               ;copy value
     strreplace, tmptag, '???', xfluxes[ww]                          ;replace 
     tmptag = strcompress(tmptag, /REMOVE_ALL)                       ;remove whitespace     
     val = fxpar(xheader, tmptag)                                    ;get value
     IF val EQ 0 THEN xcat[xx].(ind) = -99 ELSE xcat[xx].(ind) = val ;get value from header

     tmptag = fluxerrtag                                              ;copy value
     strreplace, tmptag, '???', xfluxes[ww]                           ;replace 
     tmptag = strcompress(tmptag, /REMOVE_ALL)                        ;remove whitespace
     fluxnames[3*ww+1] = tmptag                                       ;store value
     chk = tag_exist(xcat, tmptag, INDEX=ind, /TOP_LEVEL)             ;find tag index
     tmptag = hfluxerrtag                                             ;copy value
     strreplace, tmptag, '???', xfluxes[ww]                           ;replace 
     tmptag = strcompress(tmptag, /REMOVE_ALL)                        ;remove whitespace
     val = fxpar(xheader, tmptag)                                     ;get value
     IF val EQ 0 THEN xcat[xx].(ind) = -99 ELSE  xcat[xx].(ind) = val ;get value from header

     tmptag = flagtag                                                 ;copy value
     strreplace, tmptag, '???', xfluxes[ww]                           ;replace 
     tmptag = strcompress(tmptag, /REMOVE_ALL)                        ;remove whitespace
     fluxnames[3*ww+2] = tmptag                                       ;store value
     chk = tag_exist(xcat, tmptag, INDEX=ind, /TOP_LEVEL)             ;find tag index
     tmptag = hfluxtag                                                ;copy value
     strreplace, tmptag, '???', xfluxes[ww]                           ;replace 
     tmptag = strcompress(tmptag, /REMOVE_ALL)                        ;remove whitespace
     val = fxpar(xheader, tmptag)                                     ;get value
     IF val EQ 0 THEN xcat[xx].(ind) = -99 ELSE  xcat[xx].(ind) = val ;get value from header
     
  ENDFOR                        ;end loop over fluxes
  
  RETURN, xcat
END
;========================================================================================================================


;========================================================================================================================
FUNCTION addmasses, xcat, xheader, xx, TGMASSMIN=tgmassmin, TGMASSMAX=tgmassmax


  IF keyword_set(TGMASSMIN) THEN tgmassmin = tgmassmin[0] ELSE tgmassmin = 'STCKMMIN' ;set new value
  IF keyword_set(TGMASSMAX) THEN tgmassmax = tgmassmax[0] ELSE tgmassmax = 'STCKMMAX' ;set new value
  
  xcat[xx].stckmmin = float(fxpar(xheader, tgmassmin)) ;get value from header
  xcat[xx].stckmmax = float(fxpar(xheader, tgmassmax)) ;get value from header
  
  RETURN, xcat
END
;========================================================================================================================



;========================================================================================================================
function upgradecat, xcat, xtag, ival, FLUXES=fluxes

  add_tag, xcat, xtag, ival, tmpcat ;add tag to new temp structure
  xcat = tmpcat                     ;recapture
  tmpcat = 0                        ;reset temp structure
  
  RETURN, xcat
END
;========================================================================================================================



;========================================================================================================================
pro spectra_collate, xin, NOBASIC=nobasic, NOFLUXES=nofluxes, NOMASSES=nomasses, $
                     MASKDIR=maskdir, OUTFILE=outfile, $
                     INTERACTIVE=interactive, VERBOSE=verbose, HELP=help


;+
; NAME:
;       SPECTRA_COLLATE()
;
; PURPOSE:
;
;
; CALLING SEQUENCE:
;       
; INPUTS:
;      xin : linux search string that gives all spectra to be included 
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;
; COMMON BLOCKS:
;
; PROCEDURES USED:
;
; COMMENTS:
;
;       -ID is always delivered!!!
;       -Bases on MOSFIRE_1DSPEC_COLLATE
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2015 Apr 2, Univ. Cali, Riverside v1.0.0
;
; DESIRED UPGRADES
;
;-    

  version = 'v1.0.0'


  IF keyword_set(INDIR) THEN indir = indir[0]                                                ;set new value
  IF keyword_set(SPECLIST) THEN speclist = speclist[0] ELSE speclist = 'tmp_spectralist.txt' ;set new value
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'collated_list.fits'      ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                         ;set new value
  check_dir, 1                                                                               ;compile module
  

  ;;;possible interactive setup 
  IF keyword_set(INTERACTIVE) THEN BEGIN                                                ;check INTERACTIVE variable
     value = ''                                                                         ;reset
     bit = strcompress('['+ string(xin)+']', /REMOVE_ALL)                               ;string up value
     read, value, PROMPT = '  Spectra search string? ' + bit + ' '                      ;prompt
     IF value EQ '' THEN xin = xin ELSE xin = value                                     ;store new value
  ENDIF                                                                                 ;end check INTERACTIVE
  IF verbose GE 1 THEN BEGIN                                                            ;check verbose value
     print, ' '                                                                         ;spacer
     print, '************Run Parameters********************'                            ;print info
     print, ' Spectra search string: ', xin                                             ;print info
     print, ' Spectra list: ', speclist                                                 ;print info
     print, '  Remove spectra list: ', speclist EQ 'tmp_spectralist.txt' ? 'Yes' : 'No' ;print info
     print, '**********************************************'                            ;print info
  ENDIF                                                                                 ;end check verbose value


  ;;;create list of 1D spectra to collate, then obtain list
  IF verbose GE 1 THEN print, 'ls ' + xin + ' > '+ speclist ;print info
  spawn,  'ls ' + xin + ' > '+ speclist                     ;populate file
  bit = ' '                                                 ;intialize
  nspec = file_lines(speclist)                              ;find number of spectra
  spectra = strarr(nspec)                                   ;make array for names
  openr, lun, speclist, /GET_LUN                            ;open file to read
  FOR xx=0, nspec-1, 1 DO BEGIN                             ;loop over file
     readf, lun, bit                                        ;read line from file
     spectra[xx] = bit                                      ;store file
  ENDFOR                                                    ;end loop over array
  close, lun                                                ;close file
  free_lun, lun                                             ;free file memory unit
  

  ;;;create base structure to be filled in
  base = catbase()                         ;get base
  cat = replicate(base, nspec)             ;replicate cat
  IF ~keyword_set(NOBASIC) THEN BEGIN      ;if redshift requested
     cat = upgradecat(cat, 'NSTCK', 0.0)   ;add tag to cat
     cat = upgradecat(cat, 'MASS', 0.0)    ;add tag to cat
     cat = upgradecat(cat, 'CLUSTER', 0.0) ;add tag to cat
  ENDIF                                    ;end if redshift requested


 
  ;;;if emission line fluxes are needed
  IF ~keyword_set(NOFLUXES) THEN BEGIN                                                      ;if flux keyword set
     poslines = emissionlines('allnames')                                                   ;make a copy
     fluxflag = poslines                                                                    ;make a copy
     fluxflag[*] = 0                                                                        ;set all to zero
     FOR xx=0, nspec-1, 1 DO BEGIN                                                          ;loop over spectra
        If keyword_set(INDIR) THEN check_indir, indir, spectra[xx], VERBOSE=1, NOTE='INDIR' ;check directory
        header = headfits(spectra[xx], EXTEN=1)                                             ;get header 
        FOR yy=0, n_elements(poslines)-1, 1 DO BEGIN                                        ;loop over lines 
           test = strcompress(poslines[yy] + 'CML', /REMOVE_ALL)                            ;check for line to add
           chk = fxpar(header, test)                                                        ;check if present in header
           IF chk NE 0 THEN fluxflag[yy] = 1                                                ;set flag
        ENDFOR                                                                              ;end loop over lines
     ENDFOR                                                                                 ;end loop over spectra
     chk = where(fluxflag EQ 1)                                                             ;find lines present
     IF chk[0] NE -1 THEN poslines = poslines[chk] ELSE poslines = ['0']                    ;lines need to be added
     noprint = 0                                                                            ;flag
     FOR yy=0, n_elements(poslines)-1, 1 DO BEGIN                                           ;loop over lines 
        test = [strcompress(poslines[yy] + '_FLUX', /REMOVE_ALL), $                         ;cont next line
                strcompress(poslines[yy] + '_FLUXERR', /REMOVE_ALL), $                      ;cont next line
                strcompress(poslines[yy] + '_FLAG', /REMOVE_ALL) ]                          ;check for line to add
        FOR zz=0, 2, 1 DO BEGIN                                                             ;end loop over 3 tags/ flux
           IF zz EQ 2 THEN initval = 0 ELSE initval = 0.0                                   ;if flag tag
           ind = tag_exist(cat, test[zz])                                                   ;check if tag exists
           chk = emissionlines(poslines[yy], VERBOSE=1)                                     ;check if emission line is real
           IF (ind EQ 0) AND (chk[0] NE -1) THEN BEGIN                                      ;if both chks pass
              cat = upgradecat(cat, test[zz], initval)                                      ;add tag to cat 
           ENDIF ELSE BEGIN                                                                 ;if both chks dont pass
              IF (ind NE 0) THEN BEGIN                                                      ;if tag already exists
                 print, 'Flux tag already exists in structure!!'                            ;print info
                 print, ' Culprit tag: ', test[zz]                                          ;print info
              ENDIF                                                                         ;end if tag already exists
              IF (chk[0] EQ -1) THEN BEGIN                                                  ;if invalid emission line
                 IF noprint EQ 0 THEN BEGIN                                                 ;chk no print
                    print, 'Emission line not found. Wont be included!!'                    ;print info
                    print, ' Culprit emission line: ', poslines[yy]                         ;print info
                 ENDIF                                                                      ;end chk noprint
                 fluxflag[yy] = 1                                                           ;set flag
                 noprint = 1                                                                ;set flag
              ENDIF                                                                         ;end if invalid emission lines
           ENDELSE                                                                          ;end if not both chks
        ENDFOR                                                                              ;end loop over test tags
     ENDFOR                                                                                 ;end loop over lines
  ENDIF                                                                                     ;if not line poslines
  IF keyword_set(HELP) THEN help, cat, /STRUC                                               ;offer help

  
  ;;;add to base structure
  IF ~keyword_set(NOMASSES) THEN BEGIN      ;if redshift requested
     cat = upgradecat(cat, 'STCKMMIN', 0.0) ;add tag to cat
     cat = upgradecat(cat, 'STCKMMAX', 0.0) ;add tag to cat
  ENDIF                                     ;end if redshift requested



  ;;;make measurements deppending on what is requested
  FOR xx=0, nspec-1, 1 DO BEGIN                                                          ;loop over spectra
     cat.id = xx                                                                         ;store index
     IF verbose GE 1 THEN print, ' Now working on ', spectra[xx]                         ;print info
     If keyword_set(INDIR) THEN check_indir, indir, spectra[xx], VERBOSE=1, NOTE='INDIR' ;check directory

     ;;;get current spectra
     header = headfits(spectra[xx], EXTEN=1) ;get header
                                ;print, header
     
     ;;;add basic info to catalog if desired
     IF ~keyword_set(NOBASIC) THEN cat = addbasic(cat, header, xx) ;add info
     
     ;;;add fluxes to catalog if desired
     IF ~keyword_set(NOFLUXES) THEN cat = addfluxes(cat, header, xx, poslines, FLUXNAMES=fluxnames) ;add names
     
     ;;;add masses to catalog if desired
     IF ~keyword_set(NOMASSES) THEN cat = addmasses(cat, header, xx) ;if masses requested

  ENDFOR                        ;end loop over spectra
  
  
   ;;;clean up catalog
  
  ;;;Output final product, clean up
  mwrfits, cat, outfile, /CREATE                                              ;write file
  IF (speclist EQ 'tmp_spectralist.txt') THEN spawn, 'rm tmp_spectralist.txt' ;remove temporary region file

  
END
;========================================================================================================================



;========================================================================================================================
pro call_spectra_collate


  xin = '*v3-1-2*.fits'
  outfile = 'composite_spectra_stack_cat_v3-1-0.fits'


  spectra_collate, xin, OUTFILE=outfile
  

END
;========================================================================================================================
