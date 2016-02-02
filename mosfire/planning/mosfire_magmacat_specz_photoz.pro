;========================================================================================================================
PRO MOSFIRE_MAGMACAT_SPECZ_PHOTOZ, master, stars, DATAHDR=datahdr, TAGRA=tagra, TAGDEC=tagdec, $
                                   SUBSETS=subsets, $
                                   CRA=cra, CDEC=cdec, DIST=dist, $
                                   TAGSPECZ=tagspecz, SPECZ=specz, $
                                   TAGQSPECZ=tagqspecz, QSPECZ=qspecz, $
                                   TAGZPHOT=tagzphot, ZPHOT=zphot, $
                                   TAGQZPHOT=tagqzphot, QZPHOT=qzphot, $
                                   TAGMAG1=tagmag1, MAG1=MAG1, $
                                   TAGMASKS=tagmasks, MASKS=masks, $
                                   TAGNINE=tagnine, NINE=NINE, $
                                   TAGTEN=tagten, TEN=ten, $
                                   STARHDR=starhdr, TAGSTRA=tagstra, TAGSTDEC=tagstdec, TAGSTJ=tagstj, $
                                   STARBRI=starbri, STARFAI=starfai, PST=pst, $
                                   JNOM=jnom, EPOCH=epoch, EQUINOX=equinox, THING1=thing1, THING2=thing2, $
                                   REGXY=regxy, REGDS9=regds9, $
                                   SUFFIX=suffix, OUTFILE=outfile, VERBOSE=verbose, HELP=help
  
  
;+
; NAME:
;       MOSFIRE_MAGMACAT_SPECZ_PHOTOZ()
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
;       A. DeGroot, 2014 Nov 4, Univ. Cali, Riverside v1.0.0
;          -INCEPTION
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.0'


  ;;;default data catalog values
  IF keyword_set(DATAHDR) THEN datahdr = datahdr[0] ELSE datahdr = 'N'                 ;set value
  IF keyword_set(TAGRA) THEN tagra = tagra[0] ELSE tagra = 'RA'                        ;set value
  IF keyword_set(TAGDEC) THEN tagdec = tagdec[0] ELSE tagdec = 'DEC'                   ;set value
  IF keyword_set(TAGSPECZ) THEN tagspecz = tagspecz[0] ELSE tagspecz = 'MOSFIRE_Z'     ;set value
  IF keyword_set(SPECZ) THEN specz = specz ELSE specz = [0.0,1.0,2.0,10.0]             ;set value
  IF keyword_set(TAGQSPECZ) THEN tagqspecz = tagqspecz[0] ELSE tagqspecz = 'MOSFIRE_Q' ;set value 
  IF keyword_set(QSPECZ) THEN qspecz = qspecz ELSE qspecz = [0,1,2,3]                  ;set value 
  IF keyword_set(TAGZPHOT) THEN tagzphot = tagzphot[0] ELSE tagzphot = 'ZPHOT'         ;set value
  IF keyword_set(ZPHOT) THEN zphot = zphot ELSE zphot = [0.0,0.9,1.1,2.0]              ;set value
  IF keyword_set(TAGQZPHOT) THEN tagqzphot = tagqzphot[0] ELSE tagqzphot = 'Q99'       ;set value
  IF keyword_set(QZPHOT) THEN qzphot = qzphot ELSE qzphot = [2.0, 5.0, 10.0]           ;set value
  IF keyword_set(TAGMAG1) THEN tagmag1 = tagmag1[0] ELSE tagmag1 = 'MAG1'              ;set value
  IF keyword_set(MAG1) THEN mag1 = mag1 ELSE mag1 = [0.0, 10.0, 20.0, 30.0]            ;set value
  IF keyword_set(TAGNINE) THEN tagnine = tagnine[0] ELSE tagnine = 'NINE'              ;set value
  IF keyword_set(NINE) THEN nine = nine ELSE nine = [0.0, 10.0, 20.0, 30.0]            ;set value
  IF keyword_set(TAGMASKS) THEN tagmasks = tagmasks[0] ELSE tagmasks = 'MASK'          ;set value
  IF keyword_set(MASKS) THEN masks = masks ELSE masks = ['mask1']                      ;set value
  IF keyword_set(TAGTEN) THEN tagten = tagten[0] ELSE tagten = 'TEN'    ;set value
  IF keyword_set(TEN) THEN ten = ten ELSE ten = [0.0, 1.0, 2.0, 3.0]       ;set value
  
  IF keyword_set(CRA) THEN cra = cra[0] ELSE cra = 0                   ;set value
  IF keyword_set(CDEC) THEN cdec = cdec[0] ELSE cdec = 0               ;set value
  IF keyword_set(DIST) THEN dist = dist ELSE dist = [3.0,5.0,8.0,12.0] ;set value [arcmin]
  

  ;;;default star cat values
  IF keyword_set(STARHDR) THEN starhdr = starhdr[0] ELSE starhdr = 'N'           ;set value
  IF keyword_set(TAGSTRA) THEN tagstra = tagstra[0] ELSE tagstra = 'RAJ2000'     ;set value
  IF keyword_set(TAGSTDEC) THEN tagstdec = tagstdec[0] ELSE tagstdec = 'DEJ2000' ;set value
  IF keyword_set(TAGSTJ) THEN tagstj = tagstj[0] ELSE tagstj = 'JMAG'            ;set value
  IF keyword_set(JNOM) THEN jnom = float(jnom) ELSE BEGIN                        ;take values given
     jnom = fltarr(n_elements(master.(0)))                                       ;create array
     jnom[*] = 21.0                                                              ;set value
  ENDELSE                                                                        ;end values not given
  IF keyword_set(STARBRI) THEN starbri = starbri[0] ELSE starbri = 12.0          ;set value
  IF keyword_set(STARFAI) THEN starfai = starfai[0] ELSE starfai = 22.0          ;set value
  IF keyword_set(PST) THEN pst = pst[0] ELSE pst = -1                            ;set value

  ;;;default MAGMA input values
  IF keyword_set(EPOCH) THEN epoch = epoch[0] ELSE epoch = 2000.0                      ;set value
  IF keyword_set(EQUINOX) THEN equinox = equinox[0] ELSE equinox = 2000.0              ;set value
  IF keyword_set(THING1) THEN thing1 = thing1[0] ELSE thing1 = 0                       ;set value
  IF keyword_set(THING2) THEN thing2 = thing2[0] ELSE thing2 = 0                       ;set value
 
  ;;;default run values
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'magmacat_file.txt' ;set value
  IF keyword_set(SUFFIX) THEN suffix = suffix[0] ELSE suffix = '.txt'                  ;set value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 3                   ;set value


  ;;;finding appropriate tag indicies
  ;help, master, /STRUC
  raind = tagind(master, tagra, NOTE='RA tag not valid!!')                                       ;get RA index
  decind = tagind(master, tagdec,  NOTE='DEC tag not valid!!')                                   ;get dec index
  speczind = tagind(master, tagspecz,  NOTE='######## Spec-z tag not valid!!', /PASS)            ;get spec-z index  
  qspeczind = tagind(master, tagqspecz,  NOTE='######## Spec-z quality tag not valid!!', /PASS)  ;get spec-z quality index
  zphotind = tagind(master, tagzphot,  NOTE='######## Photo-z tag not valid!!', /PASS)           ;get dec index
  qzphotind = tagind(master, tagqzphot,  NOTE='######## Photo-z quality tag not valid!!', /PASS) ;get dec index
  mag1ind = tagind(master, tagmag1,  NOTE='######## Mag1 tag not valid!!', /PASS)                ;get mag 1 index
  nineind = tagind(master, tagnine,  NOTE='######## Nine tag not valid!!', /PASS)                ;get mag 2 index
  tenind = tagind(master, tagten,  NOTE='######## Ten tag not valid!!', /PASS)          ;get ten index
  masksind = tagind(master, tagmasks,  NOTE='######## Masks tag not valid!!', /PASS)             ;get masks index
  straind = tagind(stars, tagstra, NOTE='Star RA tag not valid!!')                               ;get star RA index
  stdecind = tagind(stars, tagstdec, NOTE='Star DEC tag not valid!!')                            ;get star DEC index
  stjind = tagind(stars, tagstj, NOTE='Stars J-band magnitude tag not valid!!')                  ;get star H-band index


  ;;;print the overview
  ;IF ((cra NE 0) AND (cdec NE 0)) THEN BEGIN
  ;   IF (tagmag1 EQ '0') THEN BEGIN
  ;      ov = ' Using a combination of spec-z, photo-z, and distance ...'
  ;   ENDIF ELSE BEGIN
  ;      IF (tagnine EQ '0') THEN BEGIN
  ;         ov = ' Using a combination of spec-z, photo-z, distance and one flux/mag cut...'
  ;      ENDIF ELSE BEGIN
  ;         ov = ' Using a combination of spec-z, photo-z, distance and two flux/mag cuts...'
  ;      ENDELSE
  ;   ENDELSE
  ;ENDIF ELSE BEGIN
  ;   IF (tagmag1 EQ '0') THEN BEGIN
  ;      ov = ' Using a combination of spec-z, and photo-z only...'
  ;   ENDIF ELSE BEGIN
  ;      IF (tagnine EQ '0') THEN BEGIN
  ;         ov = ' Using a combination of spec-z, photo-z, and one flux/mag cut...'
  ;      ENDIF ELSE BEGIN
  ;         ov = ' Using a combination of spec-z, photo-z, and two flux/mag cuts...'
  ;      ENDELSE
  ;   ENDELSE
  ;ENDELSE
  ;print, '=============================================================================================================='
  ;print, 'Magma input catalog being created with the following:'
  ;print, ov
  ;print, '  For the data catalog:'
  ;print, '   RA tag: ', tagra
  ;print, '   DEC tag: ', tagdec
  ;print, '   Spec-z tag: ', tagspecz
  ;print, '    Spec-z (1) minimum: ', specz1min
  ;print, '    Spec-z (1) maximum: ', specz1max
  ;IF (specz2min NE 0) THEN print, '    Spec-z (2) minimum: ', specz2min
  ;IF (specz2max NE 0) THEN print, '    Spec-z (2) maximum: ', specz2max
  ;print, '   Spec-z quality tag: ', tagqspecz
  ;print, '   Photo-z tag: ', tagzphot
  ;print, '   Photo-z quality tag: ', tagqzphot
  ;IF (cra NE 0) THEN print, '   Center RA for dist cut: ', cra
  ;IF (cdec NE 0) THEN print, '   Center DEC for dist cut: ', cdec
  ;IF (tagmag1 NE '0') THEN print, '   First mag/flux tag: ', tagmag1
  ;IF (tagnine NE '0') THEN print, '   Second mag/flux tag: ', tagnine
  ;print, '  For the guide star catalog:'
  ;print, '   RA tag: ', tagstra
  ;print, '   DEC tag: ', tagstdec
  ;print, '   Jband magnitude tag: ', tagstj
  ;print, '  Created MAGMA input: ', outfile
  ;print, '=============================================================================================================='


  ;;;region file header strings
  string0a = '# Region file format: DS9 version 4.1'                                                                                                                 ;string
  string0b = '# Filename: en1_cutout_en1704_servs_ch1.fits'                                                                                                          ;string
  string0c = 'global color=green dashlist=8 3 width=1 font="helvetica 10 normal roman" select=1 highlite=1 dash=0 fixed=0 edit=1 move=1 delete=1 include=1 source=1' ;string
  string0d = 'fk5'                                                                                                                                                   ;string

  
  ;;;make the catalog and flag arrays
  openw, lun, outfile, /GET_LUN            ;open magma text file 
  nn = n_elements(master.(raind))          ;number of data inputs
  nstars = n_elements(stars.(straind))     ;number of star inputs
  ntotal = nn + nstars                     ;total number in MAGMA catalog
  outstruc = mosfire_magmatemplate(ntotal) ;get structure
  IF keyword_set(HELP) THEN BEGIN          ;if help wanted
     help, master, /STRUC                  ;give some help
     help, stars, /STRUC                   ;give some help
     help, outstruc, /STRUC                ;give some help
  ENDIF                                    ;end if help wanted
  flags = {picked:intarr(nn), flagdist1:intarr(nn), flagdist2:intarr(nn), flagdist3:intarr(nn), flagdist4:intarr(nn)} ;flag structure
  
  ;;;cut in distance (if possible)
  
  IF ((cra NE 0) AND (cdec NE 0)) THEN BEGIN                                               ;check coords given
     print, cra, cdec
     print, master[0].(raind), master[0].(decind)
                                ;print, cra, ' ', cdec
                                ;help, master.(raind)
                                ; help, master.(decind)
     close_match_radec, cra, cdec, master.(raind), master.(decind), cmatch, mastermatch, $ ;cont next line
                        (dist[0]/60.0), 9999999, cmiss, /SILENT                            ;ra, dec match
     IF mastermatch[0] NE -1 THEN flags.flagdist1[mastermatch] = 1                         ;cut in distance
     close_match_radec, cra, cdec, master.(raind), master.(decind), cmatch, mastermatch, $ ;cont next line
                        (dist[1]/60.0), 9999999, cmiss, /SILENT                            ;ra, dec match
     IF mastermatch[0] NE -1 THEN flags.flagdist2[mastermatch] = 1                         ;cut in distance
     close_match_radec, cra, cdec, master.(raind), master.(decind), cmatch, mastermatch, $ ;cont next line
                        (dist[2]/60.0), 9999999, cmiss, /SILENT                            ;ra, dec match
     IF mastermatch[0] NE -1 THEN flags.flagdist3[mastermatch] = 1                         ;cut in distance
     close_match_radec, cra, cdec, master.(raind), master.(decind), cmatch, mastermatch, $ ;cont next line
                        (dist[3]/60.0), 9999999, cmiss                                     ;ra, dec match
     IF mastermatch[0] NE -1 THEN flags.flagdist4[mastermatch] = 1                         ;cut in distance
  ENDIF                                                                                    ;end if coords given
  
  bites = [' ', $
           '     -->  ' + strcompress('within ' + string(dist[0]) + 'arcmin of (RA, Dec) = (' + string(cra) + ',' + string(cdec) +')'), $
           '     -->  ' + strcompress('within ' + string(dist[1]) + 'arcmin of (RA, Dec) = (' + string(cra) + ',' + string(cdec) +')'), $
           '     -->  ' + strcompress('within ' + string(dist[2]) + 'arcmin of (RA, Dec) = (' + string(cra) + ',' + string(cdec) +')'), $
           '     -->  ' + strcompress('within ' + string(dist[3]) + 'arcmin of (RA, Dec) = (' + string(cra) + ',' + string(cdec) +')')]


  ;;;cut(s) in spec-z
  IF (speczind NE -1) THEN BEGIN                                                                    ;if spec-z present
     nspecz = n_elements(specz)                                                                     ;# of quality flags present
     FOR xx=0, nspecz-2, 1 DO BEGIN                                                                 ;loop over spec-zs
        tagname = strcompress('flagspecz' + string(xx+1), /REMOVE_ALL)                              ;create tag name
        add_tag, flags, tagname, intarr(nn), tmpstruc                                               ;add tag to structure
        flags = 0                                                                                   ;reset variable
        flags = tmpstruc                                                                            ;restore variable
        tmpind = tagind(flags, tagname, NOTE='WARNING!!! Things went horribly wrong!!')             ;get RA index
        chk = where((master.(speczind) GE specz[xx]) AND (master.(speczind) LT specz[xx+1]))        ;color in range
        IF chk[0] NE -1 THEN flags.(tmpind)[chk] = 1                                                ;set flags
        bites = [bites, ('    -->  ' + strcompress('spec-z in range ' + string(specz[xx]) + $       ;cont next line
                                                   ' < ' + tagspecz + ' <' + string(specz[xx+1])))] ;add to array
     ENDFOR                                                                                         ;end loop over spec-zs
  ENDIF                                                                                             ;end if spec-z present


  ;;;cut(s) in spec-z quality
  IF (qspeczind NE -1) THEN BEGIN                                                                     ;if spec-z quality present
     nqspecz = n_elements(qspecz)                                                                     ;# of quality flags present
     FOR xx=0, nqspecz-1, 1 DO BEGIN                                                                  ;loop over quality flags
        tagname = strcompress('flagqspecz' + string(xx+1), /REMOVE_ALL)                               ;create tag name
        add_tag, flags, tagname, intarr(nn), tmpstruc                                                 ;add tag to structure
        flags = 0                                                                                     ;reset variable
        flags = tmpstruc                                                                              ;restore variable
        tmpind = tagind(flags, tagname, NOTE='WARNING!!! Things went horribly wrong!!')               ;get RA index
        chk = where((master.(qspeczind) EQ qspecz[xx]))                                               ;color in range
        IF chk[0] NE -1 THEN flags.(tmpind)[chk] = 1                                                  ;set flags
        bites = [bites, ('   -->  ' + strcompress('spec-z quality equal to ' + string(qspecz[xx])))] ;add to array
     ENDFOR                                                                                           ;end loop over quality flags
  ENDIF                                                                                               ;end if spec-z quality present


  ;;;cut in photo-z
  IF (zphotind NE -1) THEN BEGIN
     nzphot = n_elements(zphot)                                                                     ;# of photo-z quality bins
     FOR xx=0, nzphot-2, 1 DO BEGIN                                                                 ;loop over # photo-z bins
        tagname = strcompress('flagzphot' + string(xx+1), /REMOVE_ALL)                              ;create tag name
        add_tag, flags, tagname, intarr(nn), tmpstruc                                               ;add tag to structure
        flags = 0                                                                                   ;reset variable
        flags = tmpstruc                                                                            ;restore variable
        tmpind = tagind(flags, tagname, NOTE='WARNING!!! Things went horribly wrong!!')             ;get RA index
        chk = where((master.(zphotind) GE zphot[xx]) AND (master.(zphotind) LT zphot[xx+1]))        ;color in range
        IF chk[0] NE -1 THEN flags.(tmpind)[chk] = 1                                                ;set flags
        bites = [bites, ('    -->  ' + strcompress('photo-z in range ' + string(zphot[xx]) + $      ;cont next line
                                                   ' < ' + tagzphot + ' <' + string(zphot[xx+1])))] ;add to array
     ENDFOR                                                                                         ;end loop over tag 
  ENDIF                                                                                             ;end zphot available

  
  ;;;cut(s) in photo-z quality
  IF (qzphotind NE -1) THEN BEGIN
     nqzphot = n_elements(qzphot)                                                                               ;# of photo-z quality bins
     FOR xx=0, nqzphot-2, 1 DO BEGIN                                                                            ;loop over # photo-z bins
        tagname = strcompress('flagqzphot' + string(xx+1), /REMOVE_ALL)                                         ;create tag name
        add_tag, flags, tagname, intarr(nn), tmpstruc                                                           ;add tag to structure
        flags = 0                                                                                               ;reset variable
        flags = tmpstruc                                                                                        ;restore variable
        tmpind = tagind(flags, tagname, NOTE='WARNING!!! Things went horribly wrong!!')                         ;get RA index
        chk = where((master.(qzphotind) GE qzphot[xx]) AND (master.(qzphotind) LT qzphot[xx+1]))                ;color in range
        IF chk[0] NE -1 THEN flags.(tmpind)[chk] = 1                                                            ;set flags
        bites = [bites, ('    -->  ' + strcompress('photo-z quality in range ' + string(qzphot[xx]) + ' < ' + $ ;cont next line
                                                   tagqzphot + ' <' + string(qzphot[xx+1])))]                   ;add to array
     ENDFOR                                                                                                     ;end loop over tag
  ENDIF                                                                                                         ;end qzphot available
  

  ;;;cut in mag/flux 1
  IF (mag1ind NE -1) THEN BEGIN
     nmag1 = n_elements(mag1)
     FOR xx=0, nmag1-2, 1 DO BEGIN                                                                                            ;loop over # colors
        tagname = strcompress('flagmag1_' + string(xx+1), /REMOVE_ALL)                                                        ;create tag name
        add_tag, flags, tagname, intarr(nn), tmpstruc                                                                         ;add tag to structure
        flags = 0                                                                                                             ;reset variable
        flags = tmpstruc                                                                                                      ;restore variable
        tmpind = tagind(flags, tagname, NOTE='WARNING!!! Things went horribly wrong!!')                                       ;get RA index
        chk = where((master.(mag1ind) GE mag1[xx]) AND (master.(mag1ind) LT mag1[xx+1]))                                      ;color in range
        IF chk[0] NE -1 THEN flags.(tmpind)[chk] = 1                                                                          ;set flags
        bites = [bites, ('    -->  ' + $                                                                                      ;cont next line
                         strcompress('mag/flux in range ' + string(mag1[xx]) + ' < ' + tagmag1 + ' <' + string(mag1[xx+1])))] ;add to array
     ENDFOR                                                                                                                   ;end loop over # colors
  ENDIF 


  ;;;cut in mag/flux 2
  IF (nineind NE -1) THEN BEGIN
     nnine = n_elements(nine)
     FOR xx=0, nnine-2, 1 DO BEGIN                                                                                            ;loop over # colors
        tagname = strcompress('flagnine_' + string(xx+1), /REMOVE_ALL)                                                        ;create tag name
        add_tag, flags, tagname, intarr(nn), tmpstruc                                                                         ;add tag to structure
        flags = 0                                                                                                             ;reset variable
        flags = tmpstruc                                                                                                      ;restore variable
        tmpind = tagind(flags, tagname, NOTE='WARNING!!! Things went horribly wrong!!')                                       ;get RA index
        chk = where((master.(nineind) GE nine[xx]) AND (master.(nineind) LT nine[xx+1]))                                      ;color in range
        IF chk[0] NE -1 THEN flags.(tmpind)[chk] = 1                                                                          ;set flags
        bites = [bites, ('    -->  ' + $                                                                                      ;cont next line
                         strcompress('NINE in range ' + string(nine[xx]) + ' < ' + tagnine + ' <' + string(nine[xx+1])))]     ;add to array
     ENDFOR                                                                                                                   ;end loop over # colors
  ENDIF 


  ;;;cut on which spec mask objects were on
  IF (masksind NE -1) THEN BEGIN                                                        ;if spec masks are provided
     nmasks = n_elements(masks)                                                         ;number of elements
     FOR xx=0, nmasks-1, 1 DO BEGIN                                                     ;loop over # colors
        tagname = strcompress('flagmask' + string(xx+1), /REMOVE_ALL)                   ;create tag name
        add_tag, flags, tagname, intarr(nn), tmpstruc                                   ;add tag to structure
        flags = 0                                                                       ;reset variable
        flags = tmpstruc                                                                ;restore variable
        tmpind = tagind(flags, tagname, NOTE='WARNING!!! Things went horribly wrong!!') ;get RA index
        chk = where((master.(masksind) EQ masks[xx]) )                                  ;color in range
        IF chk[0] NE -1 THEN flags.(tmpind)[chk] = 1                                    ;set flags
        bites = [bites, ('     -->  ' + $                                               ;cont next line
                         strcompress('observed on mask ' + masks[xx]))]                 ;add to array
     ENDFOR                                                                             ;end loop over # colors
  ENDIF


  ;;;cut on ten
  IF tenind NE -1 THEN BEGIN                                                                                           ;if color tag exists
     ncolors = n_elements(ten)                                                                                         ;# of color bins + 1
     FOR xx=0, ncolors-2, 1 DO BEGIN                                                                                   ;loop over # colors
        tagname = strcompress('flagten' + string(xx+1), /REMOVE_ALL)                                                   ;create tag name
        add_tag, flags, tagname, intarr(nn), tmpstruc                                                                  ;add tag to structure
        flags = 0                                                                                                      ;reset variable
        flags = tmpstruc                                                                                               ;restore variable
        tmpind = tagind(flags, tagname, NOTE='WARNING!!! Things went horribly wrong!!')                                ;get RA index
        chk = where((master.(tenind) GE ten[xx]) AND (master.(tenind) LT ten[xx+1]))                                   ;color in range
        IF chk[0] NE -1 THEN flags.(tmpind)[chk] = 1                                                                   ;set flags
        bites = [bites, ('       -->  ' + $                                                                            ;cont next line
                         strcompress('TEN in range: ' + string(ten[xx]) + ' < ' + tagten + ' <' + string(ten[xx+1])))] ;add to array
     ENDFOR                                                                                                            ;end loop over # colors
  ENDIF                                                                                                                ;end if color tag exists
  
  

  ;;;print summary of available subsets
  IF ~keyword_set(NOSUMMARY) THEN BEGIN
     print, '=============================================================================================================='
     print, ' Summary of possible subsets to join.'
     print, '  Reference subsets by number listed here. '
     flagtags = tag_names(flags)
     FOR zz=1, n_elements(flagtags)-1, 1 DO BEGIN
        print, zz, '. ', flagtags[zz], bites[zz]
     ENDFOR
     print, '=============================================================================================================='   
  ENDIF
  

  ;;;setup for organizing which detections have been completed
  mstcnt = 0                                                                    ;master counter
  radec, master.(raind), master.(decind), irah, iram, iras, idech, idecm, idecs ;get hours, mins, secs
  

  ;;;find subsets to write out
  FOR zz=0, n_elements(subsets)-1, 1 DO BEGIN ;loop over subset
     array = subsets[zz].sets                 ;grab sets to make subset
     tmp = array[UNIQ(array, SORT(array))]    ;get unique and ordered subset
     CASE n_elements(tmp) OF 
        1 : those = where((flags.(tmp[0]) EQ 1) AND (flags.picked EQ 0), nthose) ;cut

        2 : those = where((flags.(tmp[0]) EQ 1) AND (flags.(tmp[1]) EQ 1) AND (flags.picked EQ 0), nthose) ;cut

        3 : those = where((flags.(tmp[0]) EQ 1) AND (flags.(tmp[1]) EQ 1) AND (flags.(tmp[2]) EQ 1) AND $ ;cont next line
                          (flags.picked EQ 0), nthose)                                                    ;cut

        4 : those = where((flags.(tmp[0]) EQ 1) AND (flags.(tmp[1]) EQ 1) AND (flags.(tmp[2]) EQ 1) AND $ ;cont next line
                          (flags.(tmp[3]) EQ 1) AND (flags.picked EQ 0), nthose)                          ;cut

        5 : those = where((flags.(tmp[0]) EQ 1) AND (flags.(tmp[1]) EQ 1) AND (flags.(tmp[2]) EQ 1) AND $  ;cont next line
                          (flags.(tmp[3]) EQ 1) AND (flags.(tmp[4]) EQ 1) AND (flags.picked EQ 0), nthose) ;cut

        6 : those = where((flags.(tmp[0]) EQ 1) AND (flags.(tmp[1]) EQ 1) AND (flags.(tmp[2]) EQ 1) AND $ ;cont next line
                          (flags.(tmp[3]) EQ 1) AND (flags.(tmp[4]) EQ 1) AND (flags.(tmp[5]) EQ 1) AND $ ;cont next line
                          (flags.picked EQ 0), nthose)                                                    ;cut

        7 : those = where((flags.(tmp[0]) EQ 1) AND (flags.(tmp[1]) EQ 1) AND (flags.(tmp[2]) EQ 1) AND $ ;cont next line
                          (flags.(tmp[3]) EQ 1) AND (flags.(tmp[4]) EQ 1) AND (flags.(tmp[5]) EQ 1) AND $ ;cont next line
                          (flags.(tmp[6]) EQ 1) AND (flags.picked EQ 0), nthose)                          ;cut

        8 : those = where((flags.(tmp[0]) EQ 1) AND (flags.(tmp[1]) EQ 1) AND (flags.(tmp[2]) EQ 1) AND $  ;cont next line
                          (flags.(tmp[3]) EQ 1) AND (flags.(tmp[4]) EQ 1) AND (flags.(tmp[5]) EQ 1) AND $  ;cont next line
                          (flags.(tmp[6]) EQ 1) AND (flags.(tmp[7]) EQ 1) AND (flags.picked EQ 0), nthose) ;cut
        
        ELSE : BEGIN
           print, 'WARNING!!! Too many subsets at current time. Using max allowed of 8.'
           print, '  Why do you want that many anyways?!?!?'
        END
     ENDCASE
     
     IF nthose NE 0 THEN BEGIN  ;have to have something

        ;;;preparing to write part of the catalogs
        flags.picked[those] = 1                                                               ;switch flag for those chosen
        chk = where(flags.picked EQ 1, nchk)                                                  ;find number of chosen 
        inds = indgen(nthose)                                                                 ;create index array
        IF verbose GE 0 THEN print, '  # of detections in ' + subsets[zz].name + ': ', nthose ;print info

        ;;;optional region file outputs
        IF keyword_set(REGXY) THEN BEGIN                                        ;want x,y coord region file
           outreg = outfile                                                     ;copy outfile name
           nsuffix =strcompress('_' + subsets[zz].name + '.reg', /REMOVE_ALL)     ;new filename end
           strreplace, outreg, suffix, nsuffix                                  ;new file name 
           openw, lun2, outreg, /GET_LUN                                        ;open file
        ENDIF                                                                   ;end want x,y coord region file
        IF keyword_set(REGDS9) THEN BEGIN                                       ;want ds9 style region file
           outreg2 = outfile                                                    ;copy outfile name
           nsuffix =strcompress('_' + subsets[zz].name + '_ds9.reg', /REMOVE_ALL) ;new filename end
           strreplace, outreg2, suffix, nsuffix                                 ;new filename en
           openw, lun3, outreg2, /GET_LUN                                       ;open file
           printf, lun3, string0a                                               ;print header line
           printf, lun3, string0b                                               ;print header line
           printf, lun3, string0c                                               ;print header line
           printf, lun3, string0d                                               ;print header line
        ENDIF                                                                   ;end want ds9 region file

        ;;;fill info into catalog
        FOR xx=0, nthose-1, 1 DO BEGIN ;loop over cut detections
           
           ;;;put those in the magma text file
           prstr = strcompress(strcompress(subsets[zz].name+string(inds[xx]), /REMOVE_ALL)+' '+string(subsets[zz].priority)+' '+string(jnom[those[xx]])+' '+ $
                               string(irah[those[xx]])+' '+string(iram[those[xx]])+' '+string(iras[those[xx]])+' '+ $
                               string(idech[those[xx]])+' '+string(idecm[those[xx]])+' '+string(idecs[those[xx]])+' '+ $
                               string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
           printf, lun, prstr, FORMAT='(a)'
           IF keyword_set(REGXY) THEN printf, lun2, master[those[xx]].(raind), master[those[xx]].(decind)
           IF keyword_set(REGDS9) THEN BEGIN
              string = strcompress( 'circle('+string(master[those[xx]].(raind))+','+$
                                    string(master[those[xx]].(decind))+','+string(zz+1)+'")', /REMOVE_ALL)
              printf, lun3, string
           ENDIF           

           ;;;next the companion structure file
           outstruc[mstcnt].priority = subsets[zz].priority                                  ;store probability
           outstruc[mstcnt].id = strcompress(subsets[zz].name+string(inds[xx]), /REMOVE_ALL) ;store id
           outstruc[mstcnt].jmag = jnom[those[xx]]                                           ;store J-band mag
           outstruc[mstcnt].ra = master[those[xx]].(raind)                                   ;store ra
           outstruc[mstcnt].dec = master[those[xx]].(decind)                                 ;store dec
           mstcnt = mstcnt+1                                                                 ;up master counter by 1
        ENDFOR                                                                               ;end loop over cut detections
        
        IF keyword_set(REGDS9) THEN BEGIN ;if ds9 region file 
           close, lun3                    ;close fileunit
           free_lun, lun3                 ;free memory
        ENDIF                             ;end if ds9 region file
        IF keyword_set(REGXY) THEN BEGIN  ;if xy region file
           close, lun2                    ;close fileunit
           free_lun, lun2                 ;free memory
        ENDIF                             ;end if xy region file
     ENDIF                                ;end having something
  ENDFOR                                  ;end loop over subsets

  
  ;;;add stars to magma files
  radec, stars.(straind), stars.(stdecind), strah, stram, stras, stdech, stdecm, stdecs ;get stars' hours, mins, secs
  goodst = where(stars.(stjind) GT starbri and stars.(stjind) LT starfai, ngoodst)      ;find stars that fall in mag range
  starind = indgen(ngoodst)                                                             ;make star counter
  
  ;;;star optional region file outputs
  IF keyword_set(REGXY) THEN BEGIN                    ;want x,y coord region file
     outreg = outfile                                 ;copy outfile name
     nsuffix =strcompress('_st.reg', /REMOVE_ALL)     ;new filename end
     strreplace, outreg, suffix, nsuffix              ;new file name 
     openw, lun2, outreg, /GET_LUN                    ;open file
  ENDIF                                               ;end want x,y coord region file
  IF keyword_set(REGDS9) THEN BEGIN                   ;want ds9 style region file
     outreg2 = outfile                                ;copy outfile name
     nsuffix =strcompress('_st_ds9.reg', /REMOVE_ALL) ;new filename end
     strreplace, outreg2, suffix, nsuffix             ;new filename en
     openw, lun3, outreg2, /GET_LUN                   ;open file
     printf, lun3, string0a                           ;print header line
     printf, lun3, string0b                           ;print header line
     printf, lun3, string0c                           ;print header line
     printf, lun3, string0d                           ;print header line
  ENDIF                                               ;end want ds9 region file
  
  FOR xx=0, ngoodst-1, 1 DO BEGIN                                                                                                         ;loop over cut detections
     prstr = strcompress(strcompress('st'+string(starind[xx]), /REMOVE_ALL)+' '+string(pst)+' '+string(stars[goodst[xx]].(stjind))+' '+ $ ;cont next line
                         string(strah[goodst[xx]])+' '+string(stram[goodst[xx]])+' '+string(stras[goodst[xx]])+' '+ $                     ;cont next line
                         string(stdech[goodst[xx]])+' '+string(stdecm[goodst[xx]])+' '+string(stdecs[goodst[xx]])+' '+ $                  ;cont next line
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))                                         ;MAGMA file string 
     printf, lun, prstr, FORMAT='(a)'                                                                                                     ;print string to MAGMA file
     IF keyword_set(REGXY) THEN printf, lun2, stars[goodst[xx]].(straind), stars[goodst[xx]].(stdecind) 
     IF keyword_set(REGDS9) THEN BEGIN
        string = strcompress( 'circle('+string(stars[goodst[xx]].(raind))+','+$
                              string(stars[goodst[xx]].(decind))+','+'4.0")', /REMOVE_ALL)
        printf, lun3, string
     ENDIF
     
     ;;;add stars to the companion structure file
     outstruc[mstcnt].priority = pst                                          ;store probability
     outstruc[mstcnt].id = strcompress('st'+string(starind[xx]), /REMOVE_ALL) ;store id
     outstruc[mstcnt].jmag = stars[goodst[xx]].(stjind)                       ;store J-band mag
     outstruc[mstcnt].ra = stars[goodst[xx]].(straind)                        ;store ra
     outstruc[mstcnt].dec = stars[goodst[xx]].(stdecind)                      ;store dec
     mstcnt = mstcnt+1                                                        ;up master counter by 1
  ENDFOR                                                                      ;end loop over star cut detections

  IF keyword_set(REGDS9) THEN BEGIN ;if ds9 region file 
     close, lun3                    ;close fileunit
     free_lun, lun3                 ;free memory
  ENDIF                             ;end if ds9 region file
  IF keyword_set(REGXY) THEN BEGIN  ;if xy region file
     close, lun2                    ;close fileunit
     free_lun, lun2                 ;free memory
  ENDIF                             ;end if xy region file


  close, lun                    ;close MAGMA text file
  free_lun, lun                 ;free MAGMA text file memory unit


  ;;;output the .FITS format companion copy
  strreplace, outfile, suffix, '.fits'                 ;replace suffix 
  cleanse = where(outstruc.id NE 'obj1', ncleanse)     ;find real additions
  IF cleanse[0] NE 1 THEN outstruc = outstruc[cleanse] ;rid fake detections
  mwrfits, outstruc, outfile, /CREATE                  ;write the file


END
;========================================================================================================================
