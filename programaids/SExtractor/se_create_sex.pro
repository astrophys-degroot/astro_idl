 ;========================================================================================================================
pro se_create_sex, image, SEXFILE=sexfile, $
                   OUTFILE=outfile, CTYPE=ctype, PARAM=param, $
                   FLAGim=flagim, MINAREA=minarea, DTHRESH=dthresh, ATHRESH=athresh, $
                   FILTER=filter, FNAME=fname, NDEB=ndeb, DEBMIN=debmin, CLEAN=clean, CVAL=cval, MASK=mask, $
                   WTYPE1=wtype1, WIMAGE1=wimage1, WTYPE2=wtype2, WIMAGE2=wimage2, $
                   APERS=apers, AUTO=auto, FFRACS=ffracs, PETRO=petro, SATUR=satur, MAGZERO=magzero, MAGGAM=maggam, GAIN=gain, PIXSCL=pixscl, $
                   FWHM=fwhm, STARNNW=starnnw, $
                   BTYPE1=btype1, BTYPE2=btype2, BPHOTYPE1=bphotype1, BPHOTYPE2=bphotype2, $
                   BACKSZ=backsz, BACKFLSZ=backflsz, BACKPHTH=backphth, BACKVAL=backval, $
                   ITYPE=itype, INAME=iname, $
                   MEMOBJ=memobj, MEMPIX=mempix, MEMBUFF=membuff, $
                   SEVERB=severb, WXML=wxml, XMLFILE=xmlfile, $
                   VERBOSE=verbose, HELP=help
  

;+
; NAME:
;       SE_CREATE_SEX()
;
; PURPOSE:
;       Create a .sex file for 
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;       image: image that will have a .sex file will be created for
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;       verbose: how much info is printed to screen during run 
;       help: will print additional information to screen during run 
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
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2013 Oct 4, Univ. Cali, Riverside v2.0.0
;          -major revision to taking one image at a time, remove FOR loop
;          -major revision to no longer need a template file
;       A. DeGroot, 2012 June 1, Univ. Cali, Riverside v1.2.4
;
; Desired Upgrades:
;       Include FLAG_TYPE and multiple flag images
;       PHOT_FLUXFRAC
;       INTERP***
;       ASSOC
;-

  IF N_PARAMS() LT 1 THEN BEGIN                                                          ;check # of parameters passed
     print, 'Call sequence: sex_writer, image, [OUTFILE=name, CATNAME=catalog name... ]' ;print example
     stop                                                                                ;stop program
  ENDIF                                                                                  ;end if # of parameters incorrect
  IF keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2                     ;set new value
  IF keyword_set(SEXFILE) then sexfile = sexfile[0] else sexfile = 'yourfile.sex'        ;set new value
  openw, lun, sexfile, /GET_LUN                                                          ;open file for writing
  
  if verbose ge 1 THEN print, ' Making .sex file for: ', image ;print info
  spawn, 'whoami', whoami
  
  printf, lun, '# Configuration file for SExtractor 2.5.0' ;print line to file
  printf, lun, '# Created : ' + string(SYSTIME())          ;print line to file
  printf, lun, '# Author :', whoami                        ;print line to file
  printf, lun, '# Written for image : ', image             ;print line to file
  printf, lun, '   '                                       ;print line to file
  

  ;;;Catalog section
  printf, lun,  ' '                                                                             ;space
  printf, lun, '#-------------------------------- Catalog ------------------------------------' ;print line to file

  CASE keyword_set(CTYPE) OF                                                      ;check CTYPE 
     1 : BEGIN                                                                    ;if CTYPE is set
        CASE ctype[0] OF                                                          ;check CTYPE val
           'NONE' : BEGIN                                                         ;if ascii type 
              ctype = 'NONE'                                                      ;sets new value
              suffix = '.cat'                                                     ;set SE output file name
           END                                                                    ;end if ascii type
           'ASCII' : BEGIN                                                        ;if ascii type 
              ctype = 'ASCII'                                                     ;sets new value
              suffix = '.cat'                                                     ;set SE output file name
           END                                                                    ;end if ascii type
           'ASCII_HEAD' : BEGIN                                                   ;if ascii type 
              ctype = 'ASCII_HEAD'                                                ;sets new value
              suffix = '_hdr.cat'                                                 ;set SE output file name
           END                                                                    ;end if ascii type
           'ASCII_SKYCAT' : BEGIN                                                 ;if ascii type 
              ctype = 'ASCII_SKYCAT'                                              ;sets new value
              suffix = '_skycat.cat'                                              ;set SE output file name
           END                                                                    ;end if ascii type
           'ASCII_VOTABLE' : BEGIN                                                ;if ascii type 
              ctype = 'ASCII_VOTABLE'                                             ;sets new value
              suffix = 'votable.cat'                                              ;set SE output file name
           END                                                                    ;end if ascii type
           'FITS_1.0' : BEGIN                                                     ;if ascii type 
              ctype = 'FITS_1.0'                                                  ;sets new value
              suffix = '.fits'                                                    ;set SE output file name
           END                                                                    ;end if ascii type
           'FITS_LDAC' : BEGIN                                                    ;if ascii type 
              ctype = 'FITS_LDAC'                                                 ;sets new value
              suffix = '_ldac.fits'                                               ;set SE output file name
           END                                                                    ;end if ascii type
           ELSE : BEGIN                                                           ;if CTYPE not found
              if verbose GE 1 THEN BEGIN                                          ;check VERBOSE
                 print, 'WARNING!! CTYPE provided not valid!!'                    ;print info
                 print, '  Acceptable choices are: NONE, ASCII, ASCII_HEAD, ' + $ ;cont next line
                        'ASCII_SKYCAT, ASCII_VOTABLE, FITS_1.0 or FITS_LDAC'      ;print info
              endif                                                               ;end check VERBOSE
              stop                                                                ;halt 
           END                                                                    ;end if CTYPE not found
        ENDCASE                                                                   ;end check CTYPE vale
     END                                                                          ;end if CTYPE set
     0 : BEGIN                                                                    ;if CTYPE not set
        if verbose GE 2 THEN print, '  CTYPE not set. Using defaults!'            ;print info
        ctype = 'ASCII'                                                           ;sets new value
        suffix = '.cat'                                                           ;set SE output file name
     END                                                                          ;end if CTYPE not set
  ENDCASE                                                                         ;end check CTYPE set
  
  CASE keyword_set(OUTFILE) OF                                                                ;check OUTFILE given 
     1 : xoutfile = outfile[0]                                                                ;if OUTFILE is given
     0 : BEGIN                                                                                ;if OUTFILE not given
        xoutfile = image                                                                      ;make copy of name
        strreplace, xoutfile, '.fits', suffix                                                 ;replace image
     END                                                                                      ;end if OUTFILE not given
  ENDCASE                                                                                     ;end check OUTFILE given
  printf, lun, 'CATALOG_NAME     ' + xoutfile + ' # name of the output catalog'               ;print line to file
  printf, lun, 'CATALOG_TYPE     ' + ctype + ' # NONE, ASCII, ASCII_HEAD, ASCII_SKYCAT, ' + $ ;cont next line
          'ASCII_VOTABLE, FITS_1.0 or FITS_LDAC'                                              ;print line to file
  
  CASE keyword_set(PARAM) OF                                                                      ;check if PARAM set
     1 : BEGIN                                                                                    ;if PARAM set
        xparam = param[0]                                                                         ;get value
     END                                                                                          ;end if PARAM set
     0 : BEGIN                                                                                    ;if PARAM not set
        if verbose GE 2 THEN print, '  PARAM not set. Using default!'                             ;print info
        xparam = 'default.param'                                                                  ;sets new value
     END                                                                                          ;end if PARAM not set
     ELSE : BEGIN                                                                                 ;failsave
        print, 'WARNING!! Something has gone horribly wrong with PARAM'                           ;print info
     END                                                                                          ;end failsafe
  ENDCASE                                                                                         ;end check if PARAM set
  printf, lun, 'PARAMETERS_NAME   ' + xparam + ' # name of the file containing catalog contents ' ;cont next line
  printf, lun, ' '                                                                                ;space
  

  ;;;Extraction section
  printf, lun,  ' '                                                                             ;space
  printf, lun, '#------------------------------- Extraction ----------------------------------' ;print line to file
  CASE keyword_set(FLAGIM) OF                                                                   ;check if FLAGIM set  
     1 : BEGIN                                                                                  ;if FLAGIM set
        xflagim = flagim[0]                                                                     ;sets new value
     END                                                                                        ;end if FLAGIM set
     0 : BEGIN                                                                                  ;if FLAGIM not set
        if verbose GE 2 THEN print, '  FLAGIM not set. Using default!'                          ;print info
        xflagim = 'NONE'                                                                        ;sets new value
     END                                                                                        ;end if FLAGIM not set
     ELSE : BEGIN                                                                               ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with FLAGIM'                        ;print info
     END                                                                                        ;end failsafe
  ENDCASE                                                                                       ;end check if FLAGIM set
  printf, lun, 'FLAG_IMAGE     ' + xflagim + ' # name of the file containing flag image '       ;cont next line
  printf, lun,  ' '                                                                             ;space

  CASE keyword_set(MINAREA) OF                                                                   ;check if MINAREA set
     1 : BEGIN                                                                                   ;if MINAREA set
        xminarea = string(minarea[0])                                                            ;sets new value
     END                                                                                         ;end if MINAREA set
     0 : BEGIN                                                                                   ;if MINAREA not set
        if verbose GE 2 THEN print, '  MINAREA not set. Using default!'                          ;print info
        xminarea = '5'                                                                           ;sets new value
     END                                                                                         ;end if MINAREA not set
     ELSE : BEGIN                                                                                ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with MINAREA'                        ;print info
     END                                                                                         ;end failsafe
  ENDCASE                                                                                        ;end check if MINAREA set
  printf, lun, 'DETECT_MINAREA     ' + xminarea + ' # minimum number of pixels above threshold ' ;cont next line

  CASE keyword_set(DTHRESH) OF                                                                      ;check if DTHRESH set
     1 : BEGIN                                                                                      ;if DTHRESH set
        xdthresh = string(dthresh[0])                                                               ;sets new value
     END                                                                                            ;end if DTHRESH set
     0 : BEGIN                                                                                      ;if DTHRESH not set
        if verbose GE 2 THEN print, '  DTHRESH not set. Using default!'                             ;print info
        xdthresh = '2.0'                                                                            ;sets new value
     END                                                                                            ;end if DTHRESH not set
     ELSE : BEGIN                                                                                   ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with DTHRESH'                           ;print info
     END                                                                                            ;end failsafe
  ENDCASE                                                                                           ;end check if DTHRESH set
  printf, lun, 'DETECT_THRESH     ' + xdthresh + ' # <sigmas> or <threshold>,<ZP> in mag.arcsec-2 ' ;cont next line

  CASE keyword_set(ATHRESH) OF                                                                        ;check if ATHRESH set
     1 : BEGIN                                                                                        ;if ATHRESH set
        xathresh = string(athresh[0])                                                                 ;sets new value
     END                                                                                              ;end if ATHRESH set
     0 : BEGIN                                                                                        ;if ATHRESH not set
        if verbose GE 2 THEN print, '  ATHRESH not set. Using default!'                               ;print info
        xathresh = '2.0'                                                                              ;sets new value
     END                                                                                              ;end if ATHRESH not set
     ELSE : BEGIN                                                                                     ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with ATHRESH'                             ;print info
     END                                                                                              ;end failsafe
  ENDCASE                                                                                             ;end check if ATHRESH set
  printf, lun, 'ANALYSIS_THRESH     ' + xathresh + ' # <sigmas> or <threshold>,<ZP> in mag.arcsec-2 ' ;cont next line
  printf, lun,  ' '                                                                                   ;space

  CASE keyword_set(FILTER) OF                                                       ;check if FILTER set
     1 : BEGIN                                                                      ;if FILTER set
        CASE filter[0] OF                                                           ;check FILTER val
           'Y' : BEGIN                                                              ;if ascii type 
              xfilter = 'Y'                                                         ;sets new value
           END                                                                      ;end if ascii type
           'N' : BEGIN                                                              ;if ascii type 
              xfilter = 'N'                                                         ;sets new value
           END                                                                      ;end if ascii type
           ELSE : BEGIN                                                             ;if FILTER not found
              if verbose GE 1 THEN BEGIN                                            ;check VERBOSE
                 print, 'WARNING!! FILTER value provided not valid!!'               ;print info
                 print, '  Acceptable choices are: Y or N'                          ;print info
              endif                                                                 ;end check VERBOSE
              stop                                                                  ;halt 
           END                                                                      ;end if FILTER not found
        ENDCASE                                                                     ;end check FILTER vale
     END                                                                            ;end if FILTER set
     0 : BEGIN                                                                      ;if FILTER not set
        if verbose GE 2 THEN print, '  FILTER not set. Using default!'              ;print info
        xfilter = 'Y'                                                               ;sets new value
     END                                                                            ;end if FILTER not set
     ELSE : BEGIN                                                                   ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with FILTER'            ;print info
     END                                                                            ;end failsafe
  ENDCASE                                                                           ;end check if FILTER set
  printf, lun, 'FILTER     ' + xfilter + ' # apply filter for detection (Y or N)? ' ;cont next line
  
  CASE keyword_set(FNAME) OF                                                              ;check if FNAME set
     1 : BEGIN                                                                            ;if FNAME set
        xfname = string(fname[0])                                                         ;sets new value
     END                                                                                  ;end if FNAME set
     0 : BEGIN                                                                            ;if FNAME not set
        if verbose GE 2 THEN print, '  FNAME not set. Using default!'                     ;print info
        xfname = 'default.conv'                                                           ;sets new value
     END                                                                                  ;end if FNAME not set
     ELSE : BEGIN                                                                         ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with FNAME'                   ;print info
     END                                                                                  ;end failsafe
  ENDCASE                                                                                 ;end check if FNAME set
  printf, lun, 'FILTER_NAME     ' + xfname + ' # name of the file containing the filter ' ;cont next line
  printf, lun,  ' '                                                                       ;space

  CASE keyword_set(NDEB) OF                                                              ;check if NDEB set
     1 : BEGIN                                                                           ;if NDEB set
        xndeb = string(ndeb[0])                                                          ;sets new value
     END                                                                                 ;end if NDEB set
     0 : BEGIN                                                                           ;if NDEB not set
        if verbose GE 2 THEN print, '  NDEB not set. Using default!'                     ;print info
        xndeb = '32'                                                                     ;sets new value
     END                                                                                 ;end if NDEB not set
     ELSE : BEGIN                                                                        ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with NDEB'                   ;print info
     END                                                                                 ;end failsafe
  ENDCASE                                                                                ;end check if NDEB set
  printf, lun, 'DEBLEND_NTHRESH     ' + xndeb + ' # Number of deblending sub-thresholds' ;cont next line
  
  CASE keyword_set(DEBMIN) OF                                                                    ;check if DEBMIN set
     1 : BEGIN                                                                                   ;if DEBMIN set
        xdebmin = string(debmin[0])                                                              ;sets new value
     END                                                                                         ;end if DEBMIN set
     0 : BEGIN                                                                                   ;if DEBMIN not set
        if verbose GE 2 THEN print, '  DEBMIN not set. Using default!'                           ;print info
        xdebmin = '0.00001'                                                                      ;sets new value
     END                                                                                         ;end if DEBMIN not set
     ELSE : BEGIN                                                                                ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with DEBMIN'                         ;print info
     END                                                                                         ;end failsafe
  ENDCASE                                                                                        ;end check if DEBMIN set
  printf, lun, 'DEBLEND_MINCONT     ' + xdebmin + ' # Minimum contrast parameter for deblending' ;cont next line
  printf, lun,  ' '                                                                              ;space

  CASE keyword_set(CLEAN) OF                                                     ;check if CLEAN set
     1 : BEGIN                                                                   ;if CLEAN set
        CASE clean[0] OF                                                         ;check CLEAN val
           'Y' : BEGIN                                                           ;if ascii type 
              xclean = 'Y'                                                       ;sets new value
           END                                                                   ;end if ascii type
           'N' : BEGIN                                                           ;if ascii type 
              xclean = 'N'                                                       ;sets new value
           END                                                                   ;end if ascii type
           ELSE : BEGIN                                                          ;if CLEAN not found
              if verbose GE 1 THEN BEGIN                                         ;check VERBOSE
                 print, 'WARNING!! CLEAN value provided not valid!!'             ;print info
                 print, '  Acceptable choices are: Y or N'                       ;print info
              endif                                                              ;end check VERBOSE
              stop                                                               ;halt 
           END                                                                   ;end if CLEAN not found
        ENDCASE                                                                  ;end check CLEAN vale
     END                                                                         ;end if CLEAN set
     0 : BEGIN                                                                   ;if CLEAN not set
        if verbose GE 2 THEN print, '  CLEAN not set. Using default!'            ;print info
        xclean = 'Y'                                                             ;sets new value
     END                                                                         ;end if CLEAN not set
     ELSE : BEGIN                                                                ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with CLEAN'          ;print info
     END                                                                         ;end failsafe
  ENDCASE                                                                        ;end check if CLEAN set
  printf, lun, 'CLEAN     ' + xclean + ' # Clean spurious detections? (Y or N)?' ;cont next line
  
  CASE keyword_set(CVAL) OF                                            ;check if CVAL set
     1 : BEGIN                                                         ;if CVAL set
        xcval = string(cval[0])                                        ;sets new value
     END                                                               ;end if CVAL set
     0 : BEGIN                                                         ;if CVAL not set
        if verbose GE 2 THEN print, '  CVAL not set. Using default!'   ;print info
        xcval = '1.0'                                                  ;sets new value
     END                                                               ;end if CVAL not set
     ELSE : BEGIN                                                      ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with CVAL' ;print info
     END                                                               ;end failsafe
  ENDCASE                                                              ;end check if CVAL set
  printf, lun, 'CLEAN_PARAM     ' + xcval + ' # Cleaning efficiency'    ;cont next line
  printf, lun,  ' '                                                    ;space
  
  CASE keyword_set(MASK) OF                                                                                    ;check if MASK set
     1 : BEGIN                                                                                                 ;if MASK set
        CASE mask[0] OF                                                                                        ;check MASK val
           'NONE' : BEGIN                                                                                      ;if ascii type 
              xmask = 'NONE'                                                                                   ;sets new value
           END                                                                                                 ;end if ascii type
           'BLANK' : BEGIN                                                                                     ;if ascii type 
              xmask = 'BLANK'                                                                                  ;sets new value
           END                                                                                                 ;end if ascii type
           'CORRECT' : BEGIN                                                                                   ;if ascii type 
              xmask = 'CORRECT'                                                                                ;sets new value
           END                                                                                                 ;end if ascii type
           ELSE : BEGIN                                                                                        ;if MASK not found
              if verbose GE 1 THEN BEGIN                                                                       ;check VERBOSE
                 print, 'WARNING!! MASK provided not valid!!'                                                  ;print info
                 print, '  Acceptable choices are: NONE, BLANK, or CORRECT'                                    ;print info
              endif                                                                                            ;end check VERBOSE
              stop                                                                                             ;halt 
           END                                                                                                 ;end if MASK not found
        ENDCASE                                                                                                ;end check MASK vale
     END                                                                                                       ;end if MASK set
     0 : BEGIN                                                                                                 ;if MASK not set
        if verbose GE 2 THEN print, '  MASK not set. Using default!'                                           ;print info
        xmask = 'NONE'                                                                                         ;sets new value
     END                                                                                                       ;end if MASK not set
     ELSE : BEGIN                                                                                              ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with MASK'                                         ;print info
     END                                                                                                       ;end failsafe
  ENDCASE                                                                                                      ;end check if MASK set
  printf, lun, 'MASK_TYPE     ' + xmask + ' # type of detection MASKing: can be one of NONE, BLANK or CORRECT' ;cont next line
  printf, lun,  ' '                                                                                            ;space

  CASE keyword_set(WTYPE1) OF                                                                        ;check if WTYPE1 set
     1 : BEGIN                                                                                       ;if WTYPE1 set
        CASE wtype1[0] OF                                                                            ;check WTYPE1 val
           'NONE' : BEGIN                                                                            ;if ascii type 
              xwtype1 = 'NONE'                                                                       ;sets new value
           END                                                                                       ;end if ascii type
           'BACKGROUND' : BEGIN                                                                      ;if ascii type 
              xwtype1 = 'BACKGROUND'                                                                 ;sets new value
           END                                                                                       ;end if ascii type
           'MAP_RMS' : BEGIN                                                                         ;if ascii type 
              xwtype1 = 'MAP_RMS'                                                                    ;sets new value
           END                                                                                       ;end if ascii type
           'MAP_VAR' : BEGIN                                                                         ;if ascii type 
              xwtype1 = 'MAP_VAR'                                                                    ;sets new value
           END                                                                                       ;end if ascii type
           'MAP_WEIGHT' : BEGIN                                                                      ;if ascii type 
              xwtype1 = 'MAP_WEIGHT'                                                                 ;sets new value
           END                                                                                       ;end if ascii type
           ELSE : BEGIN                                                                              ;if WTYPE1 not found
              if verbose GE 1 THEN BEGIN                                                             ;check VERBOSE
                 print, 'WARNING!! WTYPE1 provided not valid!!'                                      ;print info
                 print, '  Acceptable choices are: NONE, BACKGROUND, MAP_RMS, MAP_VAR or MAP_WEIGHT' ;print info
              endif                                                                                  ;end check VERBOSE
              stop                                                                                   ;halt 
           END                                                                                       ;end if WTYPE1 not found
        ENDCASE                                                                                      ;end check WTYPE1 vale
     END                                                                                             ;end if WTYPE1 set
     0 : BEGIN                                                                                       ;if WTYPE1 not set
        if verbose GE 2 THEN print, '  WTYPE1 not set. Using default!'                               ;print info
        xwtype1 = 'NONE'                                                                             ;sets new value
     END                                                                                             ;end if WTYPE1 not set
     ELSE : BEGIN                                                                                    ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with WTYPE1'                             ;print info
     END                                                                                             ;end failsafe
  ENDCASE                                                                                            ;end check if WTYPE1 set
  CASE keyword_set(WTYPE2) OF                                                                        ;check if WTYPE2 set
     1 : BEGIN                                                                                       ;if WTYPE2 set
        CASE wtype2[0] OF                                                                            ;check WTYPE2 val
           'NONE' : BEGIN                                                                            ;if ascii type 
              xwtype2 = ', NONE'                                                                     ;sets new value
           END                                                                                       ;end if ascii type
           'BACKGROUND' : BEGIN                                                                      ;if ascii type 
              xwtype2 = ', BACKGROUND'                                                               ;sets new value
           END                                                                                       ;end if ascii type
           'MAP_RMS' : BEGIN                                                                         ;if ascii type 
              xwtype2 = ', MAP_RMS'                                                                  ;sets new value
           END                                                                                       ;end if ascii type
           'MAP_VAR' : BEGIN                                                                         ;if ascii type 
              xwtype2 = ', MAP_VAR'                                                                  ;sets new value
           END                                                                                       ;end if ascii type
           'MAP_WEIGHT' : BEGIN                                                                      ;if ascii type 
              xwtype2 = ', MAP_WEIGHT'                                                               ;sets new value
           END                                                                                       ;end if ascii type
           ELSE : BEGIN                                                                              ;if WTYPE2 not found
              if verbose GE 1 THEN BEGIN                                                             ;check VERBOSE
                 print, 'WARNING!! WTYPE2 provided not valid!!'                                      ;print info
                 print, '  Acceptable choices are: NONE, BACKGROUND, MAP_RMS, MAP_VAR or MAP_WEIGHT' ;print info
              endif                                                                                  ;end check VERBOSE
              stop                                                                                   ;halt 
           END                                                                                       ;end if WTYPE2 not found
        ENDCASE                                                                                      ;end check WTYPE2 vale
     END                                                                                             ;end if WTYPE2 set
     0 : BEGIN                                                                                       ;if WTYPE2 not set
        if verbose GE 2 THEN print, '  WTYPE2 not set. Using default!'                               ;print info
        xwtype2 = ' '                                                                                ;sets new value
     END                                                                                             ;end if WTYPE2 not set
     ELSE : BEGIN                                                                                    ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with WTYPE2'                             ;print info
     END                                                                                             ;end failsafe
  ENDCASE                                                                                            ;end check if WTYPE2 set
  printf, lun, 'WEIGHT_TYPE     ' + xwtype1 + xwtype2 + ' # type(s) of weighting'                    ;cont next line
 


  CASE keyword_set(WIMAGE1) OF                                                           ;check if WIMAGE1 set
     1 : BEGIN                                                                           ;if WIMAGE1 set
        xwimage1 = string(wimage1[0])                                                    ;sets new value
     END                                                                                 ;end if WIMAGE1 set
     0 : BEGIN                                                                           ;if WIMAGE1 not set
        if verbose GE 2 THEN print, '  WIMAGE1 not set. Using default!'                  ;print info
        xwimage1 = 'NONE.fits'                                                           ;sets new value
     END                                                                                 ;end if WIMAGE1 not set
     ELSE : BEGIN                                                                        ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with WIMAGE1'                ;print info
     END                                                                                 ;end failsafe
  ENDCASE                                                                                ;end check if WIMAGE1 set
  CASE keyword_set(WIMAGE2) OF                                                           ;check if WIMAGE2 set
     1 : BEGIN                                                                           ;if WIMAGE2 set
        xwimage2 = ', ' + string(wimage2[0])                                             ;sets new value
     END                                                                                 ;end if WIMAGE2 set
     0 : BEGIN                                                                           ;if WIMAGE2 not set
        if verbose GE 2 THEN print, '  WIMAGE2 not set. Using default!'                  ;print info
        xwimage2 = ' '                                                                   ;sets new value
     END                                                                                 ;end if WIMAGE2 not set
     ELSE : BEGIN                                                                        ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with WIMAGE2'                ;print info
     END                                                                                 ;end failsafe
  ENDCASE                                                                                ;end check if WIMAGE2 set
  printf, lun, 'WEIGHT_IMAGE     ' + xwimage1 + xwimage2 + ' # image used for weighting' ;cont next line
  printf, lun,  ' '                                                                      ;space
  

  ;;;Photometry secction
  printf, lun,  ' '                                                                               ;space
  printf, lun, '#------------------------------ Photometry -----------------------------------'   ;print line to file
  
  CASE keyword_set(APERS) OF                                                                 ;check if APERS set
     1 : BEGIN                                                                               ;if APERS set
        CASE n_elements(APERS) OF                                                            ;check # of apers given 
           1 : xapers = string(apers[0])                                                     ;if one aper given
           ELSE : begin                                                                      ;if more than one aper given
              FOR zz=0, n_elements(APERS)-1, 1 DO BEGIN                                      ;loop over # apers
                 IF zz EQ 0 THEN xapers = string(apers[zz]) ELSE $                           ;take first aper
                    xapers = strcompress(xapers + ', ' + string(apers[zz]))                  ;string them together
              ENDFOR                                                                         ;end loop over # apers
           END                                                                               ;end if more than one aper
        ENDCASE                                                                              ;end check # apers given
     END                                                                                     ;end if APERS set
     0 : BEGIN                                                                               ;if APERS not set
        if verbose GE 2 THEN print, '  APERS not set. Using default!'                        ;print info
        xapers = '3.0'                                                                       ;sets new value
     END                                                                                     ;end if APERS not set
     ELSE : BEGIN                                                                            ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with APERS'                      ;print info
     END                                                                                     ;end failsafe
  ENDCASE                                                                                    ;end check if APERS set
  printf, lun, 'PHOT_APERTURES     ' + xapers + ' # MAG_APER aperture diameter(s) in pixels' ;cont next line
  
 
  CASE keyword_set(AUTO) OF                                                                                   ;check if AUTO set
     1 : BEGIN                                                                                                ;if AUTO set
        xauto = strcompress(string(auto[0]) + ', ' + string(auto[1]))                                         ;sets new value
     END                                                                                                      ;end if AUTO set
     0 : BEGIN                                                                                                ;if AUTO not set
        if verbose GE 2 THEN print, '  AUTO not set. Using default!'                                          ;print info
        xauto = '2.5, 3.5'                                                                                    ;sets new value
     END                                                                                                      ;end if AUTO not set
     ELSE : BEGIN                                                                                             ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with AUTO'                                        ;print info
     END                                                                                                      ;end failsafe
  ENDCASE                                                                                                     ;end check if AUTO set
  printf, lun, 'PHOT_AUTOPARAMS     ' + xauto + ' # MAG_AUTO parameters: <Kron_fact>,<min_radius>'            ;cont next line

  CASE keyword_set(FFRACS) OF                                                               ;check if FFRAC set
     1 : BEGIN                                                                             ;if FFRAC set
        CASE n_elements(FFRACS) OF                                                         ;check # of flux fracs given 
           1 : xffracs = string(ffracs[0])                                                 ;if one flux frac given
           ELSE : begin                                                                    ;if more than one flux frac given
              FOR zz=0, n_elements(FFRACS)-1, 1 DO BEGIN                                   ;loop over # flux fracs
                 IF zz EQ 0 THEN xffracs = string(ffracs[zz]) ELSE $                       ;take first flux frac
                    xffracs = strcompress(xffracs + ', ' + string(ffracs[zz]))             ;string them together
              ENDFOR                                                                       ;end loop over # ffracs
           END                                                                             ;end if more than one ffrac
        ENDCASE                                                                            ;end check # apers given
     END                                                                                   ;end if FFRAC set
     0 : BEGIN                                                                             ;if FFRAC not set
        if verbose GE 2 THEN print, '  FFRAC not set. Using default!'                      ;print info
        xffracs = '0.5'                                                                    ;sets new value
     END                                                                                   ;end if FFRAC not set
     ELSE : BEGIN                                                                          ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with FFRAC'                    ;print info
     END                                                                                   ;end failsafe
  ENDCASE                                                                                  ;end check if FFRAC set
  printf, lun, 'PHOT_FLUXFRAC     ' + xffracs + ' # Flux fraction(s) used for FLUX_RADIUS' ;cont next line
  
  
  CASE keyword_set(PETRO) OF                                                                                  ;check if PETRO set
     1 : BEGIN                                                                                                ;if PETRO set
        xpetro = strcompress(string(petro[0]) + ', ' + string(petro[1]))                                      ;sets new value
     END                                                                                                      ;end if PETRO set
     0 : BEGIN                                                                                                ;if PETRO not set
        if verbose GE 2 THEN print, '  PETRO not set. Using default!'                                         ;print info
        xpetro = '2.0, 3.5'                                                                                   ;sets new value
     END                                                                                                      ;end if PETRO not set
     ELSE : BEGIN                                                                                             ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with PETRO'                                       ;print info
     END                                                                                                      ;end failsafe
  ENDCASE                                                                                                     ;end check if PETRO set
  printf, lun, 'PHOT_PETROPARAMS     ' + xpetro + ' # MAG_PETRO parameters: <Petrosian_fact>, # <min_radius>' ;cont next line
  CASE keyword_set(SATUR) OF                                                                                  ;check if SATUR set
     1 : BEGIN                                                                                                ;if SATUR set
        xsatur = string(satur[0])                                                                             ;sets new value
     END                                                                                                      ;end if SATUR set
     0 : BEGIN                                                                                                ;if SATUR not set
        if verbose GE 2 THEN print, '  SATUR not set. Using default!'                                         ;print info
        xsatur = '50000.0'                                                                                    ;sets new value
     END                                                                                                      ;end if SATUR not set
     ELSE : BEGIN                                                                                             ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with SATUR'                                       ;print info
     END                                                                                                      ;end failsafe
  ENDCASE                                                                                                     ;end check if SATUR set
  printf, lun, 'SATUR_LEVEL     ' + xsatur + ' # level (in ADUs) at which arises saturation'                  ;cont next line
  printf, lun,  ' '                                                                                           ;space

  CASE keyword_set(MAGZERO) OF                                                                   ;check if MAGZERO set
     1 : BEGIN                                                                                   ;if MAGZERO set
        xmagzero = string(magzero[0])                                                            ;sets new value
     END                                                                                         ;end if MAGZERO set
     0 : BEGIN                                                                                   ;if MAGZERO not set
        if verbose GE 2 THEN print, '  MAGZERO not set. Using default!'                          ;print info
        xmagzero = '0.0'                                                                         ;sets new value
     END                                                                                         ;end if MAGZERO not set
     ELSE : BEGIN                                                                                ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with MAGZERO'                        ;print info
     END                                                                                         ;end failsafe
  ENDCASE                                                                                        ;end check if MAGZERO set
  printf, lun, 'MAG_ZEROPOINT    ' + xmagzero + ' # magnitude zero-point'                        ;cont next line
  CASE keyword_set(MAGGAM) OF                                                                    ;check if MAGGAM set
     1 : BEGIN                                                                                   ;if MAGGAM set
        xmaggam = string(maggam[0])                                                              ;sets new value
     END                                                                                         ;end if MAGGAM set
     0 : BEGIN                                                                                   ;if MAGGAM not set
        if verbose GE 2 THEN print, '  MAGGAM not set. Using default!'                           ;print info
        xmaggam = '4.0'                                                                          ;sets new value
     END                                                                                         ;end if MAGGAM not set
     ELSE : BEGIN                                                                                ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with MAGGAM'                         ;print info
     END                                                                                         ;end failsafe
  ENDCASE                                                                                        ;end check if MAGGAM set
  printf, lun, 'MAG_GAMMA     ' + xmaggam + ' # gamma of emulsion (for photographic scans)'      ;cont next line
  CASE keyword_set(GAIN) OF                                                                      ;check if GAIN set
     1 : BEGIN                                                                                   ;if GAIN set
        xgain = string(gain[0])                                                                  ;sets new value
     END                                                                                         ;end if GAIN set
     0 : BEGIN                                                                                   ;if GAIN not set
        if verbose GE 2 THEN print, '  GAIN not set. Using default!'                             ;print info
        xgain = '0.0'                                                                            ;sets new value
     END                                                                                         ;end if GAIN not set
     ELSE : BEGIN                                                                                ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with GAIN'                           ;print info
     END                                                                                         ;end failsafe
  ENDCASE                                                                                        ;end check if GAIN set
  printf, lun, 'GAIN     ' + xgain + ' # detector gain in e-/ADU'                                ;cont next line
  CASE keyword_set(PIXSCL) OF                                                                    ;check if PIXSCL set
     1 : BEGIN                                                                                   ;if PIXSCL set
        xpixscl = string(pixscl[0])                                                              ;sets new value
     END                                                                                         ;end if PIXSCL set
     0 : BEGIN                                                                                   ;if PIXSCL not set
        if verbose GE 2 THEN print, '  PIXSCL not set. Using default!'                           ;print info
        xpixscl = '0'                                                                            ;sets new value
     END                                                                                         ;end if PIXSCL not set
     ELSE : BEGIN                                                                                ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with PIXSCL'                         ;print info
     END                                                                                         ;end failsafe
  ENDCASE                                                                                        ;end check if PIXSCL set
  printf, lun, 'PIXEL_SCALE     ' + xpixscl + ' # size of pixel in arcsec (0=use FITS WCS info)' ;cont next line
  printf, lun,  ' '                                                                              ;space
  
  
  
  ;;;Star/Galaxy section
  printf, lun,  ' '                                                                             ;space
  printf, lun, '#------------------------- Star/Galaxy Separation ----------------------------' ;print line to file
   
  CASE keyword_set(FWHM) OF                                                               ;check if FWHM set
     1 : BEGIN                                                                            ;if FWHM set
        xfwhm = string(fwhm[0])                                                           ;sets new value
     END                                                                                  ;end if FWHM set
     0 : BEGIN                                                                            ;if FWHM not set
        if verbose GE 2 THEN print, '  FWHM not set. Using default!'                      ;print info
        xfwhm = '1.0'                                                                     ;sets new value
     END                                                                                  ;end if FWHM not set
     ELSE : BEGIN                                                                         ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with FWHM'                    ;print info
     END                                                                                  ;end failsafe
  ENDCASE                                                                                 ;end check if FWHM set
  printf, lun, 'SEEING_FWHM     ' + xfwhm + ' # stellar FWHM in arcsec'                   ;cont next line
  CASE keyword_set(STARNNW) OF                                                            ;check if STARNNW set
     1 : BEGIN                                                                            ;if STARNNW set
        xstarnnw = string(starnnw[0])                                                     ;sets new value
     END                                                                                  ;end if STARNNW set
     0 : BEGIN                                                                            ;if STARNNW not set
        if verbose GE 2 THEN print, '  STARNNW not set. Using default!'                   ;print info
        xstarnnw = 'default.nnw'                                                          ;sets new value
     END                                                                                  ;end if STARNNW not set
     ELSE : BEGIN                                                                         ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with STARNNW'                 ;print info
     END                                                                                  ;end failsafe
  ENDCASE                                                                                 ;end check if STARNNW set
  printf, lun, 'STARNNW_NAME     ' + xstarnnw + ' # Neural-Network_Weight table filename' ;cont next line
  printf, lun,  ' '                                                                       ;space
  

  ;;;Background section
  printf, lun,  ' '                                                                           ;space
  printf, lun, '#------------------------------ Background -----------------------------------' ;print line to file
  
  CASE keyword_set(BTYPE1) OF                                                    ;check if BTYPE1 set
     1 : BEGIN                                                                   ;if BTYPE1 set
        CASE btype1[0] OF                                                        ;check BTYPE1 val
           'AUTO' : BEGIN                                                        ;if ascii type 
              xbtype1 = 'AUTO'                                                   ;sets new value
           END                                                                   ;end if ascii type
           'MANUAL' : BEGIN                                                      ;if ascii type 
              xbtype1 = 'MANUAL'                                                 ;sets new value
           END                                                                   ;end if ascii type
           ELSE : BEGIN                                                          ;if BTYPE1 not found
              if verbose GE 1 THEN BEGIN                                         ;check VERBOSE
                 print, 'WARNING!! BTYPE1 provided not valid!!'                  ;print info
                 print, '  Acceptable choices are: AUTO or MANUAL'               ;print info
              endif                                                              ;end check VERBOSE
              stop                                                               ;halt 
           END                                                                   ;end if BTYPE1 not found
        ENDCASE                                                                  ;end check BTYPE1 vale
     END                                                                         ;end if BTYPE1 set
     0 : BEGIN                                                                   ;if BTYPE1 not set
        if verbose GE 2 THEN print, '  BTYPE1 not set. Using default!'           ;print info
        xbtype1 = 'AUTO'                                                         ;sets new value
     END                                                                         ;end if BTYPE1 not set
     ELSE : BEGIN                                                                ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with BTYPE1'         ;print info
     END                                                                         ;end failsafe
  ENDCASE                                                                        ;end check if BTYPE1 set
  CASE keyword_set(BTYPE2) OF                                                    ;check if BTYPE2 set
     1 : BEGIN                                                                   ;if BTYPE2 set
        CASE btype2[0] OF                                                        ;check BTYPE2 val
           'AUTO' : BEGIN                                                        ;if ascii type 
              xbtype2 = ', AUTO'                                                 ;sets new value
           END                                                                   ;end if ascii type
           'MANUAL' : BEGIN                                                      ;if ascii type 
              xbtype2 = ', MANUAL'                                               ;sets new value
           END                                                                   ;end if ascii type
           ELSE : BEGIN                                                          ;if BTYPE2 not found
              if verbose GE 1 THEN BEGIN                                         ;check VERBOSE
                 print, 'WARNING!! BTYPE2 provided not valid!!'                  ;print info
                 print, '  Acceptable choices are: AUTO or MANUAL'               ;print info
              endif                                                              ;end check VERBOSE
              stop                                                               ;halt 
           END                                                                   ;end if BTYPE2 not found
        ENDCASE                                                                  ;end check BTYPE2 vale
     END                                                                         ;end if BTYPE2 set
     0 : BEGIN                                                                   ;if BTYPE2 not set
        if verbose GE 2 THEN print, '  BTYPE2 not set. Using default!'           ;print info
        xbtype2 = ' '                                                            ;sets new value
     END                                                                         ;end if BTYPE2 not set
     ELSE : BEGIN                                                                ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with BTYPE2'         ;print info
     END                                                                         ;end failsafe
  ENDCASE                                                                        ;end check if BTYPE2 set
  printf, lun, 'BACK_TYPE     ' + xbtype1 + xbtype2 + ' # can be AUTO or MANUAL' ;cont next line

  CASE keyword_set(BPHOTYPE1) OF                                                             ;check if BPHTYPE set
     1 : BEGIN                                                                               ;if BPHOTYPE1 set
        CASE bphotype1[0] OF                                                                 ;check BPHOTYPE1 val
           'GLOBAL' : BEGIN                                                                  ;if ascii type 
              xbphotype1 = 'GLOBAL'                                                          ;sets new value
           END                                                                               ;end if ascii type
           'LOCAL' : BEGIN                                                                   ;if ascii type 
              xbphotype1 = 'LOCAL'                                                           ;sets new value
           END                                                                               ;end if ascii type
           ELSE : BEGIN                                                                      ;if BPHOTYPE1 not found
              if verbose GE 1 THEN BEGIN                                                     ;check VERBOSE
                 print, 'WARNING!! BPHOTYPE1 provided not valid!!'                           ;print info
                 print, '  Acceptable choices are: GLOBAL or LOCAL'                          ;print info
              endif                                                                          ;end check VERBOSE
              stop                                                                           ;halt 
           END                                                                               ;end if BPHOTYPE1 not found
        ENDCASE                                                                              ;end check BPHOTYPE1 vale
     END                                                                                     ;end if BPHOTYPE1 set
     0 : BEGIN                                                                               ;if BPHOTYPE1 not set
        if verbose GE 2 THEN print, '  BPHOTYPE1 not set. Using default!'                    ;print info
        xbphotype1 =  'GLOBAL'                                                               ;sets new value
     END                                                                                     ;end if BPHOTYPE1 not set
     ELSE : BEGIN                                                                            ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with BPHOTYPE1'                  ;print info
     END                                                                                     ;end failsafe
  ENDCASE                                                                                    ;end check if BPHOTYPE1 set
  CASE keyword_set(BPHOTYPE2) OF                                                             ;check if BPHTYPE set
     1 : BEGIN                                                                               ;if BPHOTYPE2 set
        CASE bphotype2[0] OF                                                                 ;check BPHOTYPE2 val
           'GLOBAL' : BEGIN                                                                  ;if ascii type 
              xbphotype2 = ', GLOBAL'                                                        ;sets new value
           END                                                                               ;end if ascii type
           'LOCAL' : BEGIN                                                                   ;if ascii type 
              xbphotype2 = ', LOCAL'                                                         ;sets new value
           END                                                                               ;end if ascii type
           ELSE : BEGIN                                                                      ;if BPHOTYPE2 not found
              if verbose GE 1 THEN BEGIN                                                     ;check VERBOSE
                 print, 'WARNING!! BPHOTYPE2 provided not valid!!'                           ;print info
                 print, '  Acceptable choices are: GLOBAL or LOCAL'                          ;print info
              endif                                                                          ;end check VERBOSE
              stop                                                                           ;halt 
           END                                                                               ;end if BPHOTYPE2 not found
        ENDCASE                                                                              ;end check BPHOTYPE2 vale
     END                                                                                     ;end if BPHOTYPE2 set
     0 : BEGIN                                                                               ;if BPHOTYPE2 not set
        if verbose GE 2 THEN print, '  BPHOTYPE2 not set. Using default!'                    ;print info
        xbphotype2 =  ''                                                                     ;sets new value
     END                                                                                     ;end if BPHOTYPE2 not set
     ELSE : BEGIN                                                                            ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with BPHOTYPE2'                  ;print info
     END                                                                                     ;end failsafe
  ENDCASE                                                                                    ;end check if BPHOTYPE2 set
  printf, lun, 'BACKPHOTO_TYPE     ' + xbphotype1 + xbphotype2 + ' # can be GLOBAL or LOCAL' ;cont next line
  printf, lun,  ' '                                                                          ;space
  
  CASE keyword_set(BACKSZ) OF                                                                          ;check if BACKSZ set
     1 : BEGIN                                                                                         ;if BACKSZ set
        CASE n_elements(BACKSZ) OF                                                                     ;check # of values given
           1 : xbacksz = string(backsz[0])                                                             ;if one value
           2 : xbacksz = string(backsz[0]) + ', ' + string(backsz[1])                                  ;if two values
           ELSE : BEGIN                                                                                ;if BTYPE not found
              if verbose GE 1 THEN BEGIN                                                               ;check VERBOSE
                 print, 'WARNING!! BACKSZ # of elements provided not valid!!'                          ;print info
                 print, '  Acceptable choices are: <size> or <width>,<height>'                         ;print info
              endif                                                                                    ;end check VERBOSE
              stop                                                                                     ;halt 
           END                                                                                         ;end if BTYPE not found
        ENDCASE                                                                                        ;end check BTYPE vale
     END                                                                                               ;end if BACKSZ set
     0 : BEGIN                                                                                         ;if BACKSZ not set
        if verbose GE 2 THEN print, '  BACKSZ not set. Using default!'                                 ;print info
        xbacksz = '32'                                                                                 ;sets new value
     END                                                                                               ;end if BACKSZ not set
     ELSE : BEGIN                                                                                      ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with BACKSZ'                               ;print info
     END                                                                                               ;end failsafe
  ENDCASE                                                                                              ;end check if BACKSZ set
  printf, lun, 'BACK_SIZE     ' + xbacksz + ' # Background mesh: <size> or <width>,<height>'           ;cont next line
  CASE keyword_set(BACKFLSZ) OF                                                                        ;check if BACKFLSZ set
     1 : BEGIN                                                                                         ;if BACKFLSZ set
        CASE n_elements(BACKFLSZ) OF                                                                   ;check # of values given
           1 : xbackflsz = string(backflsz[0])                                                         ;if one value
           2 : xbackflsz = string(backflsz[0]) + ', ' + string(backflsz[1])                            ;if two values
           ELSE : BEGIN                                                                                ;if BTYPE not found
              if verbose GE 1 THEN BEGIN                                                               ;check VERBOSE
                 print, 'WARNING!! BACKFLSZ # of elements provided not valid!!'                        ;print info
                 print, '  Acceptable choices are: <size> or <width>,<height>'                         ;print info
              endif                                                                                    ;end check VERBOSE
              stop                                                                                     ;halt 
           END                                                                                         ;end if BTYPE not found
        ENDCASE                                                                                        ;end check BTYPE vale
     END                                                                                               ;end if BACKFLSZ set
     0 : BEGIN                                                                                         ;if BACKFLSZ not set
        if verbose GE 2 THEN print, '  BACKFLSZ not set. Using default!'                               ;print info
        xbackflsz = '3'                                                                                ;sets new value
     END                                                                                               ;end if BACKFLSZ not set
     ELSE : BEGIN                                                                                      ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with BACKFLSZ'                             ;print info
     END                                                                                               ;end failsafe
  ENDCASE                                                                                              ;end check if BACKFLSZ set
  printf, lun, 'BACK_FILTERSIZE     ' + xbackflsz + ' # Background filter: <size> or <width>,<height>' ;cont next line
  
  CASE keyword_set(BACKPHTH) OF                                                                         ;check if BACKPHTH set
     1 : BEGIN                                                                                          ;if BACKPHTH set
        xbackphth = string(backphth[0])                                                                 ;sets new value
     END                                                                                                ;end if BACKPHTH set
     0 : BEGIN                                                                                          ;if BACKPHTH not set
        if verbose GE 2 THEN print, '  BACKPHTH not set. Using default!'                                ;print info
        xbackphth = '24'                                                                                ;sets new value
     END                                                                                                ;end if BACKPHTH not set
     ELSE : BEGIN                                                                                       ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with BACKPHTH'                              ;print info
     END                                                                                                ;end failsafe
  ENDCASE                                                                                               ;end check if BACKPHTH set
  printf, lun, 'BACKPHOTO_THICK     ' + xbackphth + ' # thickness [pixels] of background LOCAL annulus' ;cont next line
  printf, lun,  ' '                                                                                     ;space
  
  CASE keyword_set(BACKVAL) OF                                                                        ;check if BACKVAL set
     1 : BEGIN                                                                                        ;if BACKVAL set
        CASE n_elements(BACKVAL) OF                                                                   ;check # of values given
           1 : xbackval = string(backval[0])                                                          ;if one value
           2 : xbackval = string(backval[0]) + ', ' + string(backval[1])                              ;if two values
           ELSE : BEGIN                                                                               ;if BTYPE not found
              if verbose GE 1 THEN BEGIN                                                              ;check VERBOSE
                 print, 'WARNING!! BACKVAL # of elements provided not valid!!'                        ;print info
                 print, '  Acceptable choices are: 1 or 2'                                            ;print info
              endif                                                                                   ;end check VERBOSE
              stop                                                                                    ;halt 
           END                                                                                        ;end if BTYPE not found
        ENDCASE                                                                                       ;end check BTYPE vale
     END                                                                                              ;end if BACKVAL set
     0 : BEGIN                                                                                        ;if BACKVAL not set
        if verbose GE 2 THEN print, '  BACKVAL not set. Using default!'                               ;print info
        xbackval = '0.0'                                                                              ;sets new value
     END                                                                                              ;end if BACKVAL not set
     ELSE : BEGIN                                                                                     ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with BACKVAL'                             ;print info
     END                                                                                              ;end failsafe
  ENDCASE                                                                                             ;end check if BACKVAL set
  printf, lun, 'BACK_VALUE     ' + xbackval + ' # constant to be subtracted in BACK_TYPE=MANUAL'      ;cont next line
  printf, lun,  ' '                                                                                   ;space
  
  
  ;;;Check Image section
  printf, lun,  ' '                                                                               ;space
  printf, lun, '#------------------------------ Check Image ----------------------------------'   ;print line to file


  CASE keyword_set(ITYPE) OF                                                                ;check if ITYPE set
     1 : BEGIN                                                                              ;if ITYPE set
        FOR zz=0, n_elements(ITYPE)-1, 1 DO BEGIN                                           ;loop over # itype
           IF zz EQ 0 THEN BEGIN                                                            ;if first pass
              xitype = ' '                                                                  ;intialize
              bit = ' '                                                                     ;space bit
           ENDIF ELSE bit = ', '                                                            ;adds comma
           CASE itype[zz] OF                                                                ;check ITYPE val
              'NONE' : BEGIN                                                                ;if ascii type 
                 hold = 'NONE'                                                              ;sets new value
              END                                                                           ;end if ascii type
              'IDENTICAL' : BEGIN                                                           ;if ascii type 
                 hold = 'IDENTICAL'                                                         ;sets new value
              END                                                                           ;end if ascii type
              'BACKGROUND' : BEGIN                                                          ;if ascii type 
                 hold = 'BACKGROUND'                                                        ;sets new value
              END                                                                           ;end if ascii type
              'BACKGROUND_RMS' : BEGIN                                                      ;if ascii type 
                 hold = 'BACKGROUND_RMS'                                                    ;sets new value
              END                                                                           ;end if ascii type
              'MINIBACKGROUND' : BEGIN                                                      ;if ascii type 
                 hold = 'MINIBACKGROUND'                                                    ;sets new value
              END                                                                           ;end if ascii type
              'MINIBACK_RMS' : BEGIN                                                        ;if ascii type 
                 hold = 'MINIBACK_RMS'                                                      ;sets new value
              END                                                                           ;end if ascii type
              '-BACKGROUND' : BEGIN                                                         ;if ascii type 
                 hold = '-BACKGROUND'                                                       ;sets new value
              END                                                                           ;end if ascii type
              'FILTERED' : BEGIN                                                            ;if ascii type 
                 hold = 'FILTERED'                                                          ;sets new value
              END                                                                           ;end if ascii type
              'OBJECTS' : BEGIN                                                             ;if ascii type 
                 hold = 'OBJECTS'                                                           ;sets new value
              END                                                                           ;end if ascii type
              '-OBJECTS' : BEGIN                                                            ;if ascii type 
                 hold = '-OBJECTS'                                                          ;sets new value
              END                                                                           ;end if ascii type
              'SEGMENTATION' : BEGIN                                                        ;if ascii type 
                 hold = 'SEGMENTATION'                                                      ;sets new value
              END                                                                           ;end if ascii type
              'APERTURES' : BEGIN                                                           ;if ascii type 
                 hold = 'APERTURES'                                                         ;sets new value
              END                                                                           ;end if ascii type
              ELSE : BEGIN                                                                  ;if ITYPE not found
                 if verbose GE 1 THEN BEGIN                                                 ;check VERBOSE
                    print, 'WARNING!! ITYPE provided not valid!!'                           ;print info
                    print, '  Acceptable choices are: NONE, IDENTICAL, BACKGROUND, '        ;print info
                    print, '    BACKGROUND_RMS, MINIBACKGROUND, MINIBACK_RMS, -BACKGROUND ' ;print info
                    print, '    FILTERED, OBJECTS, -OBJECTS, SEGMENTATION, or APERTURES'    ;print info
                 endif                                                                      ;end check VERBOSE
                 stop                                                                       ;halt 
              END                                                                           ;end if ITYPE not found
           ENDCASE                                                                          ;end check ITYPE vale
           xitype = xitype + bit + hold                                                     ;concatenate
        ENDFOR                                                                              ;end loop over # itype
        if n_elements(ITYPE) EQ 1 then strreplace, xitype, ' , ', ''                        ;cut somestuff off
     END                                                                                    ;end if ITYPE set
     0 : BEGIN                                                                              ;if ITYPE not set
        if verbose GE 2 THEN print, '  ITYPE not set. Using default!'                       ;print info
        xitype =  'NONE'                                                                    ;sets new value
     END                                                                                    ;end if ITYPE not set
     ELSE : BEGIN                                                                           ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with ITYPE'                     ;print info
     END                                                                                    ;end failsafe
  ENDCASE                                                                                   ;end check if ITYPE set
  printf, lun, 'CHECKIMAGE_TYPE     ' + xitype + ' # can be one of several. Check manual'   ;cont next line
 
  CASE keyword_set(INAME) OF                                                         ;check if INAME set
     1 : BEGIN                                                                       ;if INAME set
        CASE n_elements(INAME) OF                                                    ;check # iname
           1 : xiname = iname[0]                                                     ;if one iname
           ELSE : BEGIN                                                              ;if more than one iname
              FOR zz=0, n_elements(INAME)-1, 1 DO BEGIN                              ;loop over # iname
                 IF zz EQ 0 THEN BEGIN                                               ;if first pass
                    xiname = ' '                                                     ;intialize
                    bit = ' '                                                        ;space bit
                 ENDIF ELSE bit = ', '                                               ;adds comma
                 xiname = xiname + bit + iname[zz]                                   ;concatenate
              ENDFOR                                                                 ;end loop over # iname
           END                                                                       ;end if more than one iname
        ENDCASE                                                                      ;end check # iname
     END                                                                             ;end if INAME set
     0 : BEGIN                                                                       ;if INAME not set
        if verbose GE 2 THEN print, '  INAME not set. Using default!'                ;print info
        xiname =  'NONE.fits'                                                        ;sets new value
     END                                                                             ;end if INAME not set
     ELSE : BEGIN                                                                    ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with INAME'              ;print info
     END                                                                             ;end failsafe
  ENDCASE                                                                            ;end check if INAME set
  printf, lun, 'CHECKIMAGE_NAME     ' + xiname + ' # file name for each check image' ;cont next line
  printf, lun,  ' '                                                                  ;space
  
  
  ;;;Memory section
  printf, lun,  ' '                                                                           ;space
  printf, lun, '#--------------------- Memory (change with caution!) -------------------------' ;print line to file
  
  CASE keyword_set(MEMOBJ) OF                                                     ;check if MEMOBJ set
     1 : BEGIN                                                                    ;if MEMOBJ set
        xmemobj = string(memobj[0])                                               ;sets new value
     END                                                                          ;end if MEMOBJ set
     0 : BEGIN                                                                    ;if MEMOBJ not set
        if verbose GE 2 THEN print, '  MEMOBJ not set. Using default!'            ;print info
        xmemobj = '3000'                                                          ;sets new value
     END                                                                          ;end if MEMOBJ not set
     ELSE : BEGIN                                                                 ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with MEMOBJ'          ;print info
     END                                                                          ;end failsafe
  ENDCASE                                                                         ;end check if MEMOBJ set
  printf, lun, 'MEMORY_OBJSTACK     ' + xmemobj + ' # number of objects in stack' ;cont next line
  CASE keyword_set(MEMPIX) OF                                                     ;check if MEMPIX set
     1 : BEGIN                                                                    ;if MEMPIX set
        xmempix = string(mempix[0])                                               ;sets new value
     END                                                                          ;end if MEMPIX set
     0 : BEGIN                                                                    ;if MEMPIX not set
        if verbose GE 2 THEN print, '  MEMPIX not set. Using default!'            ;print info
        xmempix = '300000'                                                        ;sets new value
     END                                                                          ;end if MEMPIX not set
     ELSE : BEGIN                                                                 ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with MEMPIX'          ;print info
     END                                                                          ;end failsafe
  ENDCASE                                                                         ;end check if MEMPIX set
  printf, lun, 'MEMORY_PIXSTACK     ' + xmempix + ' # number of pixels in stack'  ;cont next line
  CASE keyword_set(MEMBUFF) OF                                                    ;check if MEMBUFF set
     1 : BEGIN                                                                    ;if MEMBUFF set
        xmembuff = string(membuff[0])                                             ;sets new value
     END                                                                          ;end if MEMBUFF set
     0 : BEGIN                                                                    ;if MEMBUFF not set
        if verbose GE 2 THEN print, '  MEMBUFF not set. Using default!'           ;print info
        xmembuff = '1024'                                                         ;sets new value
     END                                                                          ;end if MEMBUFF not set
     ELSE : BEGIN                                                                 ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with MEMBUFF'         ;print info
     END                                                                          ;end failsafe
  ENDCASE                                                                         ;end check if MEMBUFF set
  printf, lun, 'MEMORY_BUFSIZE     ' + xmembuff + ' # number of lines in buffer'  ;cont next line
  printf, lun,  ' '                                                               ;space
  

  ;;;Miscellaneous section
  printf, lun,  ' '                                                                             ;space
  printf, lun, '#----------------------------- Miscellaneous ---------------------------------' ;print line to file
 
  CASE keyword_set(SEVERB) OF                                                             ;check if SEVERB set
     1 : BEGIN                                                                            ;if SEVERB set
        CASE severb[0] OF                                                                 ;check SEVERB val
           'NORMAL' : BEGIN                                                               ;if ascii type 
              xseverb = 'NORMAL'                                                          ;sets new value
           END                                                                            ;end if ascii type
           'QUIET' : BEGIN                                                                ;if ascii type 
              xseverb = 'QUIET'                                                           ;sets new value
           END                                                                            ;end if ascii type
           'EXTRA_WARNINGS' : BEGIN                                                       ;if ascii type 
              xseverb = 'EXTRA_WARNINGS'                                                  ;sets new value
           END                                                                            ;end if ascii type
           'FULL' : BEGIN                                                                 ;if ascii type 
              xseverb = 'FULL'                                                            ;sets new value
           END                                                                            ;end if ascii type
           ELSE : BEGIN                                                                   ;if SEVERB not found
              if severbose GE 1 THEN BEGIN                                                ;check SEVERB
                 print, 'WARNING!! SEVERB provided not valid!!'                           ;print info
                 print, '  Acceptable choices are: QUIET, NORMAL, EXTRA_WARNINGS or FULL' ;print info
              endif                                                                       ;end check SEVERB
              stop                                                                        ;halt 
           END                                                                            ;end if SEVERB not found
        ENDCASE                                                                           ;end check SEVERB vale
     END                                                                                  ;end if SEVERB set
     0 : BEGIN                                                                            ;if SEVERB not set
        if severbose GE 2 THEN print, '  SEVERB not set. Using default!'                  ;print info
        xseverb = 'NORMAL'                                                                ;sets new value
     END                                                                                  ;end if SEVERB not set
     ELSE : BEGIN                                                                         ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with SEVERB'                  ;print info
     END                                                                                  ;end failsafe
  ENDCASE                                                                                 ;end check if SEVERB set
  printf, lun, 'VERBOSE_TYPE     ' + xseverb + ' # can be QUIET, NORMAL or FULL'           ;cont next line
  
  CASE keyword_set(WXML) OF                                               ;check if WXML set
     1 : BEGIN                                                              ;if WXML set
        CASE wxml[0] OF                                                     ;check WXML val
           'Y' : BEGIN                                                      ;if ascii type 
              xwxml = 'Y'                                                   ;sets new value
           END                                                              ;end if ascii type
           'N' : BEGIN                                                      ;if ascii type 
              xwxml = 'N'                                                   ;sets new value
           END                                                              ;end if ascii type
           ELSE : BEGIN                                                     ;if WXML not found
              if wxml GE 1 THEN BEGIN                                       ;check WXML
                 print, 'WARNING!! WXML provided not valid!!'               ;print info
                 print, '  Acceptable choices are: Y or N'                  ;print info
              endif                                                         ;end check WXML
              stop                                                          ;halt 
           END                                                              ;end if WXML not found
        ENDCASE                                                             ;end check WXML vale
     END                                                                    ;end if WXML set
     0 : BEGIN                                                              ;if WXML not set
        if verbose GE 2 THEN print, '  WXML not set. Using default!'        ;print info
        xwxml = 'Y'                                                         ;sets new value
     END                                                                    ;end if WXML not set
     ELSE : BEGIN                                                           ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with WXML'      ;print info
     END                                                                    ;end failsafe
  ENDCASE                                                                   ;end check if WXML set
  printf, lun, 'WRITE_XML     ' + xwxml + ' # Write XML file (Y/N)?'   ;cont next line
  CASE keyword_set(XMLFILE) OF                                              ;check if XMLFILE set
     1 : BEGIN                                                              ;if XMLFILE set
        xxmlfile = xmlfile[0]                                               ;sets new value
     END                                                                    ;end if XMLFILE set
     0 : BEGIN                                                              ;if XMLFILE not set
        if verbose GE 2 THEN print, '  XMLFILE not set. Using default!'     ;print info
        xxmlfile = 'yourfile.xml'                                           ;sets new value
     END                                                                    ;end if XMLFILE not set
     ELSE : BEGIN                                                           ;failsafe
        print, 'WARNING!! Something has gone horribly wrong with XMLFILE'   ;print info
     END                                                                    ;end failsafe
  ENDCASE                                                                   ;end check if XMLFILE set
  printf, lun, 'XML_NAME     ' + xxmlfile + ' # Filename for XML output'    ;cont next line
  printf, lun,  ' '                                                         ;space
  
  
 
  close, lun                    ;close file
  free_lun, lun                 ;free file memory     
end
;========================================================================================================================



;========================================================================================================================
pro call_se_create_sex

 
  print, 'Under construction'

  ;se_create_sex, imagelist, template, WHICH=which, CATNAME=catname, DATADIR=datadir, OUTDIR=outdir, VERBOSE=2, $
  ;            CTYPE=ctype, PARAM=param, FLAGLIST=flaglist, MINAREA=minarea, DTRHESH=dthresh, ATHRESH=athresh, $
  ;            FNAME=fname, NDEB=ndeb, DEBMIN=debmin, /CLEAN, CVAL=cval, MASK=mask, WTYPE=wtype, WIMAGE=wimage, $
  ;            APERS=apers, AUTO=auto, SAT=sat, MAGZERO=magzero, GAIN=gain, PIXEL=pixel, FWHM=fwhm, $
  ;            BSIZE=bsize, FSIZE=fsize, BTYPE=btype, ITYPE=itype, INAME=iname
                                 

end
;========================================================================================================================
