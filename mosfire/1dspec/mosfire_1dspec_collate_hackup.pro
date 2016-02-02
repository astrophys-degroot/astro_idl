;========================================================================================================================
FUNCTION addredshift, xcat, xheader, xx, ZTAG=ztag, DZTAG=dztag, QFLAGTAG=qflagtag


  IF keyword_set(ZTAG) THEN ztag = ztag[0] ELSE ztag = 'Z'                     ;set new value
  IF keyword_set(DZTAG) THEN dztag = dztag[0] ELSE dztag = 'dZ'                ;set new value
  IF keyword_set(QFLAGTAG) THEN qflagtag = qflagtag[0] ELSE qflagtag = 'QFLAG' ;set new value

  xcat[xx].z = float(fxpar(xheader, ztag))               ;get value from header
  xcat[xx].dz = float(fxpar(xheader, dztag))             ;get value from header
  xcat[xx].qflag_mosfire = fix(fxpar(xheader, qflagtag)) ;get value from header
  IF fix(fxpar(xheader, qflagtag)) EQ 99 then print, obj ;print objects with QFLAG=99

  RETURN, xcat
END
;========================================================================================================================



;========================================================================================================================
FUNCTION addnames, xcat, xheader, xx, OBJTAG=objtag, SLITTAG=slittag, MASKTAG=masktag


  IF keyword_set(OBJTAG) THEN objtag = objtag[0] ELSE objtag = 'OBJECT'    ;set new value
  IF keyword_set(SLITTAG) THEN slittag = slittag[0] ELSE slittag = 'SLIT'  ;set new value
  IF keyword_set(MASKTAG) THEN masktag = masktag[0] ELSE masktag = 'MASK'  ;set new value
  IF keyword_set(MOBTAG) THEN mobtag = mobtag[0] ELSE mobtag = 'MOBINSLIT' ;set new value

  xcat[xx].obj = fxpar(xheader, objtag)       ;get value from header
  xcat[xx].slit = fxpar(xheader, slittag)     ;get value from header
                                ;xcat[xx].mask = fxpar(xheader, masktag)     ;get value from header
  xcat[xx].mobinslit = fxpar(xheader, mobtag) ;get value from header
  
  RETURN, xcat
END
;========================================================================================================================



;========================================================================================================================
FUNCTION addfluxes, xcat, xheader, xx, xfluxes, $
                    FLUXTAG=fluxtag, FLUXERRTAG=fluxerrtag, FLAGTAG=flagtag, FLUXNAMES=fluxnames, $
                    HFLUXTAG=hfluxtag, HFLUXERRTAG=hfluxerrtag, HFLAGTAG=hflagtag

  ;help, xcat, /STRUC
  ;help, xheader
  ;help, xx
  ;help, xfluxes

  IF keyword_set(HFLUXTAG) THEN hfluxtag = hfluxtag[0] ELSE hfluxtag = '???C'                ;set new value
  IF keyword_set(HFLUXERRTAG) THEN hfluxerrtag = hfluxerrtag[0] ELSE hfluxerrtag = 'D???C'   ;set new value
  IF keyword_set(HFLAGTAG) THEN hflagtag = hflagtag[0] ELSE hflagtag = '???FLAG'             ;set new value
  IF keyword_set(FLUXTAG) THEN fluxtag = fluxtag[0] ELSE fluxtag = '???_FLUX'                ;set new value
  IF keyword_set(FLUXERRTAG) THEN fluxerrtag = fluxerrtag[0] ELSE fluxerrtag = '???_FLUXERR' ;set new value
  IF keyword_set(FLAGTAG) THEN flagtag = flagtag[0] ELSE flagtag = '???_FLAG'                ;set new value
  
  fluxnames = [xfluxes, xfluxes, xfluxes]     ;make a copy
  FOR ww=0, n_elements(xfluxes)-1, 1 DO BEGIN ;loop over fluxes
     
     tmptag = fluxtag                                                 ;copy value
     strreplace, tmptag, '???', xfluxes[ww]                           ;replace 
     tmptag = strcompress(tmptag, /REMOVE_ALL)                        ;remove whitespace
     fluxnames[3*ww] = tmptag                                         ;store value
     chk = tag_exist(xcat, tmptag, INDEX=ind, /TOP_LEVEL)             ;find tag index
     tmptag = hfluxtag                                                ;copy value
     strreplace, tmptag, '???', xfluxes[ww]                           ;replace 
     tmptag = strcompress(tmptag, /REMOVE_ALL)                        ;remove whitespace
     val = fxpar(xheader, tmptag)                                     ;get value
     IF val EQ 0 THEN xcat[xx].(ind) = -99 ELSE  xcat[xx].(ind) = val ;get value from header

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
function upgradecat, xcat, xtag, ival, FLUXES=fluxes

  add_tag, xcat, xtag, ival, tmpcat ;add tag to new temp structure
  xcat = tmpcat                     ;recapture
  tmpcat = 0                        ;reset temp structure
  
  RETURN, xcat
END
;========================================================================================================================



;========================================================================================================================
pro mosfire_1dspec_collate, xmask, xcoords, INTERACTIVE=interactive, CHKRADECDEG=chkradecdeg, $
                            NOREDSHIFT=noredshift, NONAMES=nonames, RADECDEG=radecdeg, NOFLUXES=nofluxes, $
                            NAMEPOS=namepos, $
                            MASKDIR=maskdir, DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile, $
                            VERBOSE=verbose


;+
; NAME:
;       MOSFIRE_1DSPEC_COLLATE()
;
; PURPOSE:
;
;
; CALLING SEQUENCE:
;       
; INPUTS:
;      xmask : name of spec mask 
;      xcoords : name of .coords file produce by MAGMA for spec mask
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
;       RA, Dec is always delivered!!!
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2014 Sep 11, Univ. Cali, Riverside v1.0.0
;
; DESIRED UPGRADES
;       -add interactive??
;       -fix the RA, Dec for multiple objects 
;       -add "mask"
;       -add line sigs once I get the sigs fixed
;       -debug emission line flag
;       -issue with RA, Dec double check when there is a spectrum with
;       more than one object in it. 
;       -gettting infomation for objects that are the second object in
;       ths slit
;
;-    

  version = 'v1.0.0'


  IF keyword_set(DIRCHKRADECDEG) THEN dirchkradecdeg = dirchkradecdeg[0] ELSE dirchkradecdeg = ' ' ;set new value
  IF keyword_set(NAMEPOS) THEN namepos = namepos[0] ELSE namepos = 5                               ;set new value
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'collated_list.fits'            ;set new value
  IF keyword_set(SGNFCUT) THEN sgnfcut = sgnfcut[0] ELSE sgnfcut = 5.0                             ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                               ;set new value
  check_dir, 1                                                                                     ;compile module
  


   
  ;;;Check directories
  check_indir, maskdir, xcoords, VERBOSE=1, NOTE='MASKDIR'                                                    ;check directory
  IF keyword_set(CHKRADECDEG) THEN check_indir, dirchkradecdeg, chkradecdeg, VERBOSE=1, NOTE='DIRCHKRADECDEG' ;check directory
  

 

  ;;;Read in MOSFIRE mask
  readcol, xcoords, name, priority, jmag, rah, ram, ras, decd, decm, decs, epoch, blah1, blah2, blah3, $ ;columns
           FORMAT='(A, L, F, I, I, F, I, I, F, F, F, F, F)', /SILENT                                     ;format
  

  ;;;create base structure to be filled in
  base = catbase()                                      ;get base
  cat = replicate(base, nspec)                          ;replicate cat
  IF ~keyword_set(NOREDSHIFT) THEN BEGIN                ;if redshift requested
     cat = upgradecat(cat, 'Z', 0.0)                    ;add tag to cat
     cat = upgradecat(cat, 'dZ', 0.0)                   ;add tag to cat
     cat = upgradecat(cat, 'QFLAG_MOSFIRE', 0)          ;add tag to cat
  ENDIF                                                 ;end if redshift requested
  IF ~keyword_set(NONAMES) THEN BEGIN                   ;if names requested
     cat = upgradecat(cat, 'OBJ', '0')                  ;add tag to cat
     cat = upgradecat(cat, 'SLIT', '0')                 ;add tag to cat
     cat = upgradecat(cat, 'MASK', '0')                 ;add tag to cat
     cat = upgradecat(cat, 'MOBINSLIT', '0')            ;add tag to cat
  ENDIF                                                 ;end if names requested
  cat[*].mask = xmask                                   ;fill in info
  IF keyword_set(RADECDEG) THEN BEGIN                   ;if RA, DEC deg requested
     cat = upgradecat(cat, 'RA', 0.0D)                  ;add tag to cat
     cat = upgradecat(cat, 'DEC', 0.0D)                 ;add tag to cat
  ENDIF                                                 ;end if RA, DEC deg requested


  ;;;if
  IF ~keyword_set(NOFLUXES) THEN BEGIN                                   ;if flux keyword set
     poslines = emissionlines('allnames')                                ;make a copy
     fluxflag = poslines                                                 ;make a copy
     fluxflag[*] = 0                                                     ;set all to zero
     FOR xx=0, nspec-1, 1 DO BEGIN                                       ;loop over spectra
        header = headfits(spectra[xx], EXTEN=1)                          ;get header 
        FOR yy=0, n_elements(poslines)-1, 1 DO BEGIN                     ;loop over lines 
           test = strcompress(poslines[yy] + 'C', /REMOVE_ALL)           ;check for line to add
           chk = fxpar(header, test)                                     ;check if present in header
           IF chk NE 0 THEN fluxflag[yy] = 1                             ;set flag
        ENDFOR                                                           ;end loop over lines
     ENDFOR                                                              ;end loop over spectra
     chk = where(fluxflag EQ 1)                                          ;find lines present
     IF chk[0] NE -1 THEN poslines = poslines[chk]                       ;lines need to be added
     noprint = 0                                                         ;flag
     FOR yy=0, n_elements(poslines)-1, 1 DO BEGIN                        ;loop over lines 
        test = [strcompress(poslines[yy] + '_FLUX', /REMOVE_ALL), $      ;cont next line
                strcompress(poslines[yy] + '_FLUXERR', /REMOVE_ALL), $   ;cont next line
                strcompress(poslines[yy] + '_FLAG', /REMOVE_ALL) ]       ;check for line to add
        FOR zz=0, 2, 1 DO BEGIN                                          ;end loop over 3 tags/ flux
           IF zz EQ 2 THEN initval = 0 ELSE initval = 0.0                ;if flag tag
           ind = tag_exist(cat, test[zz])                                ;check if tag exists
           chk = emissionlines(poslines[yy], VERBOSE=1)                  ;check if emission line is real
           IF (ind EQ 0) AND (chk[0] NE -1) THEN BEGIN                   ;if both chks pass
              cat = upgradecat(cat, test[zz], initval)                   ;add tag to cat 
           ENDIF ELSE BEGIN                                              ;if both chks dont pass
              IF (ind NE 0) THEN BEGIN                                   ;if tag already exists
                 print, 'Flux tag already exists in structure!!'         ;print info
                 print, ' Culprit tag: ', test[zz]                       ;print info
              ENDIF                                                      ;end if tag already exists
              IF (chk[0] EQ -1) THEN BEGIN                               ;if invalid emission line
                 IF noprint EQ 0 THEN BEGIN                              ;chk no print
                    print, 'Emission line not found. Wont be included!!' ;print info
                    print, ' Culprit emission line: ', poslines[yy]      ;print info
                 ENDIF                                                   ;end chk noprint
                 fluxflag[yy] = 1                                        ;set flag
                 noprint = 1                                             ;set flag
              ENDIF                                                      ;end if invalid emission lines
           ENDELSE                                                       ;end if not both chks
        ENDFOR                                                           ;end loop over test tags
     ENDFOR                                                              ;end loop over lines
     chk = where(fluxflag EQ 0)                                          ;check flux flags
  ENDIF                                                                  ;if not line poslines

  IF keyword_set(HELP) THEN help, cat, /STRUC ;offer help

  ;;;make measurements deppending on what is requested
  openw, lun, 'temp.reg', /GET_LUN                               ;open temp reg file
  FOR xx=0, nspec-1, 1 DO BEGIN                                  ;loop over spectra
     IF verbose GE 1 THEN print, ' Now working on ', spectra[xx] ;print info
     
     ;;;get current spectra
     header = headfits(spectra[xx], EXTEN=1) ;get header 
     ;print, header
     obj = fxpar(header, 'OBJECT')      ;get info from header
     obj = strcompress(obj, /REMOVE_ALL)     ;remove white space from string
     chk = where(name EQ obj, nchk)          ;find match
     
     ;;;get the measurements
     CASE nchk OF                                                          ;how many times is object in mask
        1 : BEGIN                                                          ;obj appear exactly 1x
           
          ;;;get the sexigesimal RA, Dec
           cat[xx].rah = rah[chk]   ;RA hours
           cat[xx].ram = ram[chk]   ;RA min
           cat[xx].ras = ras[chk]   ;RA sec
           cat[xx].decd = decd[chk] ;DEC degrees
           cat[xx].decm = decm[chk] ;DEC min
           cat[xx].decs = decs[chk] ;DEC sec
           
           ;;;add RA, DEC in degrees if requested
           IF keyword_set(RADECDEG) THEN BEGIN                                                                         ;if RA, DEC deg requested
              cat[xx].ra = (15.0*double(rah[chk])) + (0.25*double(ram[chk])) + (0.00416666*double(ras[chk]))           ;store value
              IF cat[xx].decd GT 0.0 THEN BEGIN                                                                        ;if northern hemisphere
                 cat[xx].dec = double(decd[chk]) + (double(decm[chk])/60.0) + (double(decs[chk])/3600.0)               ;store value
              ENDIF ELSE BEGIN                                                                                         ;if southern hemisphere
                 cat[xx].dec = double(decd[chk]) - (double(decm[chk])/60.0) - (double(decs[chk])/3600.0)               ;store value
              ENDELSE                                                                                                  ;end if southern hemisphere
              rasex = strcompress(string(rah[chk]) + ':' + string(ram[chk]) + ':' + string(ras[chk]), /REMOVE_ALL)     ;string
              decsex = strcompress(string(decd[chk]) + ':' + string(decm[chk]) + ':' + string(decs[chk]), /REMOVE_ALL) ;string
              printf, lun, strcompress(rasex + ' ' + decsex)                                                           ;print strings to file
           ENDIF                                                                                                       ;end if RA, DEC deg requested
           
           ;;;add redshift, redshift error, redshift flag if requested
           IF ~keyword_set(NOREDSHIFT) THEN cat = addredshift(cat, header, xx) ;add redshifts

           ;;;add names to catalog if desired
           IF ~keyword_set(NONAMES) THEN cat = addnames(cat, header, xx) ;add names
 
           ;;;add fluxes to catalog if desired
           IF ~keyword_set(NOFLUXES) THEN cat = addfluxes(cat, header, xx, poslines, FLUXNAMES=fluxnames) ;add names

        END                                                                               ;end obj appear 1x
        0 : BEGIN                                                                         ;obj doesnt appear
           print, "  'Object' was not found in mask list"                                 ;print info
           print, "   Must be two objects in the slit. Searching for 'slit' in mask list" ;print info

           obj = fxpar(header, 'SLIT')           ;get info from header
           obj = strcompress(obj, /REMOVE_ALL)   ;remove white space from string
           print, '  ', obj                      ;print which object
           chk = where(name EQ obj)              ;find match
           IF chk[0] NE -1 THEN BEGIN            ;if the object is in the list
              IF n_elements(chk) EQ 1 THEN BEGIN ;if only 1 match
                 
           ;;;get the sexigesimal RA, Dec
                 cat[xx].rah = rah[chk]   ;RA hours
                 cat[xx].ram = ram[chk]   ;RA min
                 cat[xx].ras = ras[chk]   ;RA sec
                 cat[xx].decd = decd[chk] ;DEC degrees
                 cat[xx].decm = decm[chk] ;DEC min
                 cat[xx].decs = decs[chk] ;DEC sec

                 ;;;add redshift, redshift error, redshift flag if desired
                 IF ~keyword_set(NOREDSHIFT) THEN cat = addredshift(cat, header, xx)
                
                 ;;;names to catalog if desired
                 IF ~keyword_set(NONAMES) THEN cat = addnames(cat, header, xx) ;add names

                 ;;;add fluxes to catalog if desired
                 IF ~keyword_set(NOFLUXES) THEN cat = addfluxes(cat, header, xx, poslines, FLUXNAMES=fluxnames) ;add names

                 ;;;add RA, DEC in degrees if requested
                 IF keyword_set(RADECDEG) THEN BEGIN                                                                         ;if RA, DEC deg requested
                    cat[xx].ra = (15.0*double(rah[chk])) + (0.25*double(ram[chk])) + (0.00416666*double(ras[chk]))           ;store value
                    IF cat[xx].decd GT 0.0 THEN BEGIN                                                                        ;if northern hemisphere
                       cat[xx].dec = double(decd[chk]) + (double(decm[chk])/60.0) + (double(decs[chk])/3600.0)               ;store value
                    ENDIF ELSE BEGIN                                                                                         ;if southern hemisphere
                       cat[xx].dec = double(decd[chk]) - (double(decm[chk])/60.0) - (double(decs[chk])/3600.0)               ;store value
                    ENDELSE                                                                                                  ;end if southern hemisphere
                    rasex = strcompress(string(rah[chk]) + ':' + string(ram[chk]) + ':' + string(ras[chk]), /REMOVE_ALL)     ;string
                    decsex = strcompress(string(decd[chk]) + ':' + string(decm[chk]) + ':' + string(decs[chk]), /REMOVE_ALL) ;string
                    printf, lun, strcompress(rasex + ' ' + decsex)                                                           ;print strings to file
                 ENDIF                                                                                                       ;end if RA, DEC deg requested
              ENDIF
           ENDIF
        END                                                                ;end obj doesnt appear
        ELSE : BEGIN                                                       ;obj appears >1x
           print, 'WARNING!! Object was found more than once in mask list' ;print info
           print, '   '  + obj                                             ;print obj
        END                                                                ;end obj appears >1x
     ENDCASE                                                               ;end how many times obj appears

  ENDFOR                        ;end loop over spectra
  close, lun                    ;close temp reg file
  free_lun, lun                 ;free memory
  
  
  ;;;Double check conversion from sexigesimal to degrees using a reference image
  IF keyword_set(CHKRADECDEG) THEN BEGIN                                                     ;if RA, DEC deg requested
     chk = file_test(chkradecdeg)                                                            ;chk if file exists
     IF chk EQ 1 THEN BEGIN                                                                  ;if file exists
        line = ' -zscale -zoom to fit -regions format xy -regions system wcs ' + $           ;cont next line
               '-regions load temp.reg -regions skyformat degrees -regions save temp1.reg &' ;ds9 options
        spawn, 'ds9 ' + chkradecdeg + line                                                   ;open image in ds9
     ENDIF ELSE BEGIN                                                                        ;file doesn't exist
        print, 'WARNING!! File for converting from sexigesimal to degrees does not exist!!'  ;print info
        print, '  Check on RA, Dec in degrees is not be available '                          ;print info
     ENDELSE                                                                                 ;end file doesn't exist

     ;;;retrive and check newly converted coodinates
     value = ''                                                                      ;intialize
     check = 'Y'                                                                     ;value
     read, value, PROMPT = '  Did you save the region in xy format in degrees? [Y] ' ;prompt
     IF value EQ '' THEN check = check ELSE check = value                            ;store new value
     IF check EQ 'Y' THEN BEGIN                                                      ;if file has been saved
        readcol, 'temp1.reg', ra, dec, FORMAT='(F,F)'                                ;read in file
        linera = '  WARNING!! RA [deg] is off by >1.0" '                             ;possible warning
        linedec = '  WARNING!! Dec [deg] is off by >1.0" '                           ;possible warning
        FOR yy=0, n_elements(ra)-1, 1 DO BEGIN                                       ;loop over detections
           IF (3600.0* (ra[yy]-cat[yy].ra) GT 1.0) THEN print, linera                ;print warning
           IF (3600.0* (dec[yy]-cat[yy].dec) GT 1.0) THEN print, linedec             ;print warning
        ENDFOR                                                                       ;end loop over detections
     ENDIF ELSE BEGIN                                                                ;end if file saved
        print, '  File was not saved so no check on RA, Dec will be done'            ;print info
     ENDELSE                                                                         ;end if file not saved
 
     ;;;additional sanity check: still require image 
     linera = '  WARNING!! RA [sexigesimal] is off by >1.0" '   ;possible warning
     linedec = '  WARNING!! Dec [sexigesimal] is off by >1.0" ' ;possible warning
     FOR yy=0, n_elements(ra)-1, 1 DO BEGIN                     ;loop over detections
        radec, ra[yy], dec[yy], ihr, imin, xsec, ideg, imn, xsc ;reconvert back for double check
        IF (cat[yy].rah NE ihr) OR (cat[yy].ram NE imin) OR $   ;check rah, ram
           (abs(cat[yy].ras-xsec) GT 1.0) THEN print, linera    ;check decs
                                ;print, cat[yy].rah, ihr
                                ;print, cat[yy].ram, imin 
                                ;print, cat[yy].ras, xsec
        IF (cat[yy].decd NE ideg) OR (cat[yy].decm NE imn) OR $ ;check decd, decm
           (abs(cat[yy].decs-xsc) GT 1.0) THEN print, linedec   ;check decs
     ENDFOR                                                     ;end loop over detections
  ENDIF                                                         ;end if RA, DEC deg requested


  ;;;clean up catalog
  chk = where(cat.qflag_mosfire EQ -1)                  ;find non-redshift
  IF chk[0] NE -1 THEN BEGIN                            ;if some non-redshift
     cat[chk].z = -99                                   ;set to zero
     cat[chk].dz = -99                                  ;set to zero
     FOR xx=0, n_elements(fluxnames)-1, 1 DO BEGIN      ;loop over flux names
        chk2 = tag_exist(cat, fluxnames[xx], INDEX=ind) ;find tag index 
        cat[chk].(ind) = -99                            ;put to null value
     ENDFOR                                             ;end loop over flux names
  ENDIF                                                 ;end if some non-redshifts


  ;;;Output final product, clean up
  mwrfits, cat, outfile, /CREATE ;write file
  spawn, 'rm temp.reg'           ;remove temporary region file
  spawn, 'rm temp1.reg'          ;remove temporary region file

  
END
;========================================================================================================================



;========================================================================================================================
pro call_mosfire_1dspec_collate


  xmask = 'lok400_mask1_H_1dspeclist_v11.txt'
  listdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov28/H/'
  xcoords = 'LOK400_mask1.coords'
  maskdir = '/Users/adegroot/research/clusters/lockman/lok400/specmasks/LOK400_mask1/'
  outfile = 'lok400_mosfire_specz_mask1_v2-2.fits'
  image = '/Users/adegroot/research/clusters/lockman/lok400/images_safe/lok400_ukidssK_mosaic_v1.0.fits'


  mosfire_1dspec_collate, xmask, xcoords, /RADECDEG, CHKRADECDEG=image, $
                          NAMEPOS=namepos, LISTDIR=listdir, MASKDIR=maskdir, OUTFILE=outfile
  

END
;========================================================================================================================
