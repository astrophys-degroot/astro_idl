;========================================================================================================================
pro se_run_sex_lok200_wantreg, xout
  
  data = mrdfits(xout, 1, hdr)                 ;read in file
  strreplace, xout, '.fits', '.reg'            ;change suffix
  openw, lun, xout, /GET_LUN                   ;get memory unit
  FOR xx=0, n_elements(data.(1))-1, 1 DO BEGIN ;loop over data 
     printf, lun, data[xx].(1), data[xx].(2)   ;print RA, Dec to file
  ENDFOR                                       ;end loop over data                                             
  close, lun                                   ;close memory unit
  free_lun, lun                                ;free memory unit
  
end
;========================================================================================================================



;========================================================================================================================
pro se_run_sex_lok200, band, DETECTION=detection, REGION=region, HELP=help
  
  
  if keyword_set(DETECTION) then detection = detection[0] else detection = 'multimap_cumprobmap_sqrt_v2.1.fits' ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'                                                          ;sets new value
  se_output_conversion, 1                                                                                       ;compile module
    
  regflag = 0                                                                                 ;set flag to off
  IF (band EQ 'swireg') OR (band EQ 'all') THEN BEGIN                                         ;checks band value
     print, 'Now running SE on SWIRE g'                                                       ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_swireg_mosaic_v2.0_resamp_szmulti.fits' +  $   ;cont next line
            ' -c ' + 'lok200_swireg_mosaic_v2.0_resamp_szmulti.sex'                           ;call SE run
     
     values = se_create_sex_lok200_settings('swireg')                                        ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                                ;print .sex file values
     tmpout = values.outfile                                                                 ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                     ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='g'   ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
  ENDIF
 
  IF (band EQ 'swirei') OR (band EQ 'all') THEN BEGIN                                       ;checks band value
     print, 'Now running SE on SWIRE i'                                                     ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_swirei_mosaic_v2.0_resamp_szmulti.fits' +  $ ;cont next line
            ' -c ' + 'lok200_swirei_mosaic_v2.0_resamp_szmulti.sex'                         ;call SE run
     
     values = se_create_sex_lok200_settings('swirei')                                      ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                              ;print .sex file values
     tmpout = values.outfile                                                               ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                   ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='i' ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
  ENDIF
  
  IF (band EQ 'swirer') OR (band EQ 'all') THEN BEGIN                                       ;checks band value
     print, 'Now running SE on SWIRE r'                                                     ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_swirer_mosaic_v2.0_resamp_szmulti.fits' +  $ ;cont next line
            ' -c ' + 'lok200_swirer_mosaic_v2.0_resamp_szmulti.sex'                         ;call SE run
     
     values = se_create_sex_lok200_settings('swirer')                                      ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                                ;print .sex file values
     tmpout = values.outfile                                                                 ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                     ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='r'   ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
 ENDIF

  IF (band EQ 'sparcsz') OR (band EQ 'all') THEN BEGIN                                       ;checks band value
     print, 'Now running SE on SpARCS z'                                                     ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_sparcsz_mosaic_v2.0_resamp_szmulti.fits' +  $ ;cont next line
            ' -c ' + 'lok200_sparcsz_mosaic_v2.0_resamp_szmulti.sex'                         ;call SE run
     
     values = se_create_sex_lok200_settings('sparcsz')                                     ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                                ;print .sex file values
     tmpout = values.outfile                                                                 ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                     ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='z'   ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
  ENDIF

  IF (band EQ 'ukidssJ') OR (band EQ 'all') THEN BEGIN                                       ;checks band value
     print, 'Now running SE on UKIDSS J'                                                     ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_ukidssJ_mosaic_v2.0_resamp_szmulti.fits' +  $ ;cont next line
            ' -c ' + 'lok200_ukidssJ_mosaic_v2.0_resamp_szmulti.sex'                         ;call SE run
     
     values = se_create_sex_lok200_settings('ukidssJ')                                     ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                              ;print .sex file values
     tmpout = values.outfile                                                               ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                   ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='J' ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
  ENDIF

  IF (band EQ 'ukidssK') OR (band EQ 'all') THEN BEGIN                                       ;checks band value
     print, 'Now running SE on UKIDSS K'                                                     ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_ukidssK_mosaic_v2.0_resamp_szmulti.fits' +  $ ;cont next line
            ' -c ' + 'lok200_ukidssK_mosaic_v2.0_resamp_szmulti.sex'                         ;call SE run
     
     values = se_create_sex_lok200_settings('ukidssK')                                     ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                              ;print .sex file values
     tmpout = values.outfile                                                               ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                   ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='K' ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
  ENDIF

  IF (band EQ 'servsch1') OR (band EQ 'all') THEN BEGIN                                       ;checks band value
     print, 'Now running SE on IRAC Ch1'                                                      ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_servsch1_mosaic_v2.0_resamp_szmulti.fits' +  $ ;cont next line
            ' -c ' + 'lok200_servsch1_mosaic_v2.0_resamp_szmulti.sex'                         ;call SE run
     
     values = se_create_sex_lok200_settings('servsch1')                                       ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                                ;print .sex file values
     tmpout = values.outfile                                                                 ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                     ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='ch1' ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
  ENDIF
  
  IF (band EQ 'servsch2') OR (band EQ 'all') THEN BEGIN                                       ;checks band value
     print, 'Now running SE on IRAC Ch2'                                                      ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_servsch2_mosaic_v2.0_resamp_szmulti.fits' +  $ ;cont next line
            ' -c ' + 'lok200_servsch2_mosaic_v2.0_resamp_szmulti.sex'                         ;call SE run
     
     values = se_create_sex_lok200_settings('servsch2')                                       ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                                ;print .sex file values
     tmpout = values.outfile                                                                 ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                     ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='ch2' ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
  ENDIF

  IF (band EQ 'swirech3') OR (band EQ 'all') THEN BEGIN                                       ;checks band value
     print, 'Now running SE on IRAC Ch3'                                                      ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_swirech3_mosaic_v2.0_resamp_szmulti.fits' +  $ ;cont next line
            ' -c ' + 'lok200_swirech3_mosaic_v2.0_resamp_szmulti.sex'                         ;call SE run
     
     values = se_create_sex_lok200_settings('swirech3')                                       ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                                ;print .sex file values
     tmpout = values.outfile                                                                 ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                     ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='ch3' ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
  ENDIF

  IF (band EQ 'swirech4') OR (band EQ 'all') THEN BEGIN                                       ;checks band value
     print, 'Now running SE on IRAC Ch4'                                                      ;print info
     spawn, 'sex ' + detection + ' ' + 'lok200_swirech4_mosaic_v2.0_resamp_szmulti.fits' +  $ ;cont next line
            ' -c ' + 'lok200_swirech4_mosaic_v2.0_resamp_szmulti.sex'                         ;call SE run
     
     values = se_create_sex_lok200_settings('swirech4')                                       ;gets .sex values from SE creation
     if help EQ 'Y' then help, values, /STRUC                                                ;print .sex file values
     tmpout = values.outfile                                                                 ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                                     ;change suffix
     asciitofits, values.param, values.sexfile, values.outfile, OUTFILE=tmpout, PREFIX='ch4' ;convert ascii to .FITS
     
     IF keyword_set(REGION) AND (regflag EQ 0) THEN BEGIN ;check reg file desired
        se_run_sex_lok200_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                       ;set reg flag to on
     ENDIF                                                ;end check reg file desired
     print, ' '                                           ;space on screen
  ENDIF
  
end
;========================================================================================================================
