;========================================================================================================================
function tmp1

  CASE zz OF                                                                                 ;which cut is it
        0 : BEGIN                                                                             ;first option
           those = where((master.(zprobind) GE 0.5) AND (master.(speczind1) EQ 0.0) AND $     ;cont next line
                         (master.(speczind2) EQ 0.0) AND (picked EQ 0), nthose)               ;cut
           bit = 'pzhi'                                                                       ;bit of name
           prob = fix(pzhi*master.(zprobind))                                                 ;get prob for cut
        END                                                                                   ;end first
        1 : BEGIN                                                                             ;second option
           those = where((master.(zprobind) GE 0.1) AND (master.(speczind1) EQ 0.0) AND $     ;cont next line
                         (master.(speczind2) EQ 0.0) AND (picked EQ 0), nthose)               ;cut
           bit = 'pzmed'                                                                      ;bit of name
           prob = fix(pzmed*master.(zprobind))                                                ;get prob for cut
        END                                                                                   ;end second
        2 : BEGIN                                                                             ;second option
           those = where((master.(zprobind) LT 0.1) AND (master.(speczind1) EQ 0.0) AND $     ;cont next line
                         (master.(speczind2) EQ 0.0) AND (picked EQ 0), nthose)               ;cut
           bit = 'pzlow'                                                                      ;bit of name
           prob = fix(pzlow*master.(zprobind))                                                ;get prob for cut
        END                                                                                   ;end second
        3 : BEGIN                                                                             ;third option
           those = where(((master.(speczind1) NE 0.0) AND (master.(qzind1) LE 1)) OR $        ;cont next line
                         ((master.(speczind2) NE 0.0) AND (master.(qzind2) LE 0)) AND $       ;cont next line
                         (picked EQ 0), nthose)                                               ;cut
           bit = 'spzg'                                                                       ;bit of name
           tmp = master.(1)
           tmp[*] = 1.0
           prob = spzg*tmp                                                         ;get prob for cut
        END                                                                        ;end third option
        4 :BEGIN                                                                   ;fourth option
           those = where(((master.(speczind1) NE 0.0) AND (master.(qzind1) GT 1)) OR $  ;cont next line
                         ((master.(speczind2) NE 0.0) AND (master.(qzind2) GT 0)) AND $ ;cont next line
                         (picked EQ 0), nthose)                                         ;cut
           bit = 'spzo'                                                                 ;bit of name
           tmp = master.(1)
           tmp[*] = 1.0
           prob = spzo*tmp                                    ;get prob for cut
        END                                                   ;end fourth option
        5 : BEGIN                                             ;eigth option
           those = where((picked EQ 0), nthose)               ;cut
           bit = 'rest'                                       ;bit of name
           prob = prest                                       ;get prob for cut
        END                                                   ;end eigth option
        ELSE : BEGIN                                          ;whoops
           print, 'WARNING!! Something went horribly wrong!!' ;print info
           stop                                               ;stop program
        END                                                   ;end whoops
     ENDCASE                                                  ;end which cut is it


END
;========================================================================================================================



;========================================================================================================================
function tmp2
    
     CASE zz OF                                                                               ;which cut is it
        0 : BEGIN                                                                             ;first option
           those = where((master.(zprobind) GE 0.5) AND (master.(speczind1) EQ 0.0) AND $     ;cont next line
                         (master.(speczind2) EQ 0.0) AND (picked EQ 0), nthose)               ;cut
           bit = 'pzhi'                                                                       ;bit of name
           prob = fix(pzhi*master.(zprobind))                                                 ;get prob for cut
        END                                                                                   ;end first
        1 : BEGIN                                                                             ;second option
           those = where((master.(zprobind) GE 0.1) AND (master.(speczind1) EQ 0.0) AND $     ;cont next line
                         (master.(speczind2) EQ 0.0) AND (picked EQ 0), nthose)               ;cut
           bit = 'pzmed'                                                                      ;bit of name
           prob = fix(pzmed*master.(zprobind))                                                ;get prob for cut
        END                                                                                   ;end second
        2 : BEGIN                                                                             ;second option
           those = where((master.(zprobind) LT 0.1) AND (master.(speczind1) EQ 0.0) AND $     ;cont next line
                         (master.(speczind2) EQ 0.0) AND (picked EQ 0), nthose)               ;cut
           bit = 'pzlow'                                                                      ;bit of name
           prob = fix(pzlow*master.(zprobind))                                                ;get prob for cut
        END                                                                                   ;end second
        3 : BEGIN                                                                             ;third option
           those = where((master.(speczind1) GE 1.42) AND (master.(speczind1) LE 1.44) AND $ ;cont next line
                          (picked EQ 0), nthose)                                              ;cut
           bit = 'cllow'                                                                      ;bit of name
           tmp = master.(1)
           tmp[*] = 1000
           prob = tmp                                                                   ;get prob for cut
        END                                                                      ;end third option
        4 :BEGIN                                                                 ;fourth option
           those = where((master.(speczind1) GE 1.57) AND (master.(speczind1) LE 1.61) AND $ ;cont next line
                          (picked EQ 0), nthose)                                              ;cut
           bit = 'clhi'                                                                       ;bit of name
           tmp = master.(1)
           tmp[*] = 10000
           prob = tmp           ;get prob for cut
        END                     ;end fourth option
        5 :BEGIN                ;fourth option
           those = where((master.(speczind1) GT 1.61) OR $
                         ((master.(speczind1) LT 1.57) AND (master.(speczind1) GE 1.42)) OR $
                         (master.(speczind1) LE 1.44) AND (picked EQ 0), nthose) ;cut


           bit = 'fg'           ;bit of name
           tmp = master.(1)
           tmp[*] = 1
           prob = tmp           ;get prob for cut
        END                     ;end fourth option
        6 : BEGIN                                             ;eigth option
           those = where((picked EQ 0), nthose)               ;cut
           help, those
           bit = 'rest'                                       ;bit of name
           prob = prest                                       ;get prob for cut
        END                                                   ;end eigth option
        ELSE : BEGIN                                          ;whoops
           print, 'WARNING!! Something went horribly wrong!!' ;print info
           stop                                               ;stop program
        END                                                   ;end whoops
     ENDCASE                                                  ;end which cut is it



END
;========================================================================================================================


;========================================================================================================================
PRO MOSFIRE_MAGMACAT_PHOTOZ, master, stars, DATAHDR=datahdr, TAGRA=tagra, TAGDEC=tagdec, CRA=cra, CDEC=cdec, DIST=dist, $
                             TAGZPROB=tagzprob, TAGSPECZ1=tagspecz1, TAGQZ1=tagqz1, TAGSPECZ2=tagspecz2, TAGQZ2=tagqz2, $
                             PZHI=pzhi, PZMED=pzmed, PZLOW=pzlow, $
                             STARHDR=starhdr, TAGSTRA=tagstra, TAGSTDEC=tagstdec, TAGSTJ=tagstj, $
                             STARBRI=starbri, STARFAI=starfai, PST=pst, $
                             JNOM=jnom, EPOCH=epoch, EQUINOX=equinox, THING1=thing1, THING2=thing2, $
                             REGXY=regxy, REGDS9=regds9, $
                             SUFFIX=suffix, OUTFILE=outfile, VERBOSE=verbose, HELP=help
  
  
;+
; NAME:
;       MOSFIRE_MAGMACAT_PHOTOZ()
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
;       -region file header image name
;       -incorporate if J-band mag is known
;       -incorporate if we want zmch1 blue color to have differnt probs
;       -incorporate dealing with cluster members

;-
  version = '1.0.0'



  ;;;default data cat values
  IF keyword_set(DATAHDR) THEN datahdr = datahdr[0] ELSE datahdr = 'N'                 ;set value
  IF keyword_set(TAGRA) THEN tagra = tagra[0] ELSE tagra = 'RA'                        ;set value
  IF keyword_set(TAGDEC) THEN tagdec = tagdec[0] ELSE tagdec = 'DEC'                   ;set value
  IF keyword_set(CRA) THEN cra = cra[0] ELSE cra = 162.34427                           ;set value
  IF keyword_set(CDEC) THEN cdec = cdec[0] ELSE cdec = 56.675731                       ;set value
  IF keyword_set(DIST) THEN dist = dist[0] ELSE dist = 5.0                             ;set value [arcmin]
  IF keyword_set(TAGZPROB) THEN tagzprob = tagzprob[0] ELSE tagzprob = 'MEMBER_PROB'   ;set value
  IF keyword_set(TAGSPECZ1) THEN tagspecz1 = tagspecz1[0] ELSE tagspecz1 = 'MOSFIRE_Z' ;set value
  IF keyword_set(TAGQZ1) THEN tagqz1 = tagqz1[0] ELSE tagqz1 = 'MOSFIRE_Q'             ;set value
  IF keyword_set(TAGSPECZ2) THEN tagspecz2 = tagspecz2[0] ELSE tagspecz2 = 'FORS_Z'    ;set value
  IF keyword_set(TAGQZ2) THEN tagqz2 = tagqz2[0] ELSE tagqz2 = 'FORS_Q'                ;set value
  IF keyword_set(PZHI) THEN pzhi = pzhi[0] ELSE pzhi = 10000.0                         ;set value
  IF keyword_set(PZMED) THEN pzmed = pzmed[0] ELSE pzmed = 1000.0                      ;set value
  IF keyword_set(PZLOW) THEN pzlow = pzlow[0] ELSE pzlow = 100.0                       ;set value
  IF keyword_set(SPZG) THEN spzg = spzg[0] ELSE spzg = 10.0                            ;set value
  IF keyword_set(SPZO) THEN spzo = spzo[0] ELSE spzo = 20.0                            ;set value
  IF keyword_set(PREST) THEN prest = prest[0] ELSE prest = 5.0                         ;set value
  
  ;;;default star cat values
  IF keyword_set(STARHDR) THEN starhdr = starhdr[0] ELSE starhdr = 'N'           ;set value
  IF keyword_set(TAGSTRA) THEN tagstra = tagstra[0] ELSE tagstra = 'RAJ2000'     ;set value
  IF keyword_set(TAGSTDEC) THEN tagstdec = tagstdec[0] ELSE tagstdec = 'DEJ2000' ;set value
  IF keyword_set(TAGSTJ) THEN tagstj = tagstj[0] ELSE tagstj = 'JMAG'            ;set value
  IF keyword_set(JNOM) THEN jnom = jnom[0] ELSE jnom = 21.0                      ;set value
  IF keyword_set(STARBRI) THEN starbri = starbri[0] ELSE starbri = 12.0          ;set value
  IF keyword_set(STARFAI) THEN starfai = starfai[0] ELSE starfai = 16.0          ;set value
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
  raind = tagind(master, tagra, NOTE='RA tag not valid!!')                      ;get RA index
  decind = tagind(master, tagdec,  NOTE='DEC tag not valid!!')                  ;get dec index
  ;zprobind = tagind(master, tagzprob,  NOTE='Z probability tag not valid!!')    ;get dec index
  speczind1 = tagind(master, tagspecz1,  NOTE='Spec-z 1 tag not valid!!')       ;get dec index
  qzind1 = tagind(master, tagqz1,  NOTE='Spec-z 1 quality tag not valid!!')     ;get dec index
  speczind2 = tagind(master, tagspecz2,  NOTE='Spec-z 2 tag not valid!!')       ;get dec index
  qzind2 = tagind(master, tagqz2,  NOTE='Spec-z quality 2 tag not valid!!')     ;get dec index
  straind = tagind(stars, tagstra, NOTE='Star RA tag not valid!!')              ;get star RA index
  stdecind = tagind(stars, tagstdec, NOTE='Star DEC tag not valid!!')           ;get star DEC index
  stjind = tagind(stars, tagstj, NOTE='Stars J-band magnitude tag not valid!!') ;get star H-band index


  ;;;region file header strings
  string0a = '# Region file format: DS9 version 4.1'                                                                                                                 ;string
  string0b = '# Filename: en1_cutout_en1704_servs_ch1.fits'                                                                                                          ;string
  string0c = 'global color=green dashlist=8 3 width=1 font="helvetica 10 normal roman" select=1 highlite=1 dash=0 fixed=0 edit=1 move=1 delete=1 include=1 source=1' ;string
  string0d = 'fk5'                                                                                                                                                   ;string

  
  ;;;make the catalog
  openw, lun, outfile, /GET_LUN ;open magma text file 


  ;;;cut in distance
  close_match_radec, cra, cdec, master.(raind), master.(decind), cmatch, mastermatch, (dist/60.0), 99999.99, cmiss
  help, mastermatch
  IF mastermatch[0] NE -1 THEN master = master[mastermatch]


  ;;;setup for catalog creation
  nmaster = n_elements(master.(1))         ;number of data inputs
  nstars = n_elements(stars.(1))           ;number of star inputs
  ntotal = nmaster + nstars                ;total number in MAGMA catalog
  outstruc = mosfire_magmatemplate(ntotal) ;get structure
  IF keyword_set(HELP) THEN BEGIN          ;if help wanted
     help, master, /STRUC                  ;give some help
     help, stars, /STRUC                   ;give some help
     help, outstruc, /STRUC
  ENDIF                         ;end if help wanted


  ;;;setup for organizing which detections have been completed
  picked = intarr(nmaster)         ;flag array
  mstcnt = 0                       ;master counter


  ;;;add detections to magma files
  radec, master.(raind), master.(decind), irah, iram, iras, idech, idecm, idecs ;get hours, mins, secs
  FOR zz=0, 6, 1 DO BEGIN                                                       ;loop over cuts

     CASE zz OF                                                                              ;which cut is it
        0 : BEGIN                                                                            ;first option
           those = where((master.(speczind1) GE 1.69) AND (master.(speczind1) LE 1.72) AND $ ;cont next line
                         (picked EQ 0), nthose)                                              ;cut
           bit = 'cl'                                                                        ;bit of name
           tmp = master.(1)
           tmp[*] = 100
           prob = tmp                                                                          ;get prob for cut
        END                                                                                    ;end first
        1 : BEGIN                                                                              ;first option
           those = where(((master.(speczind1) GT 0.0) AND (master.(speczind1) LT 1.69)) OR $   ;cont next line
                         ((master.(speczind1) GT 1.72) AND (master.(speczind1) LT 25.0)) AND $ ;cont next line
                         (picked EQ 0), nthose)                                                ;cut
           bit = 'fg'                                                                          ;bit of name
           tmp = master.(1)                                                                    ;
           tmp[*] = 10                                                                         ;
           prob = tmp                                                                          ;get prob for cut
        END
        2 : BEGIN                                                                            ;first option
           those = where((master.(qzind1) EQ -1) AND (picked EQ 0), nthose)               ;cut
           bit = 'targ'                                                                      ;bit of name
           tmp = master.(1)                                                                  ;
           tmp[*] = 1                                                                        ;
           prob = tmp                                                                        ;get prob for cut
        END                                                                                  ;end first
        3 : BEGIN                                                                            ;first option
                                ;those = where((master.(speczind2) GE 1.51) AND (master.(speczind2) LE 1.91) AND $ ;cont next line
           those = where((master.(speczind2) GE 1.2) AND $                   ;cont next line
                         (master.(qzind2) LE 3.0) AND (picked EQ 0), nthose) ;cut
           bit = 'pzhi'                                                      ;bit of name
           tmp = master.(1)
           tmp[*] = 10000
           prob = tmp           ;get prob for cut
        END                     ;end first
        4 : BEGIN               ;first option
                                ;those = where((master.(speczind2) GE 1.51) AND (master.(speczind2) LE 1.91) AND $              ;cont next line
           those = where((master.(speczind2) GE 1.2) AND $                                       ;cont next line
                         (master.(qzind2) GT 3.0) AND (master.(qzind2) LT 8.0) AND (picked EQ 0), nthose) ;cut
           bit = 'pzmed'                                                                                   ;bit of name
           tmp = master.(1)
           tmp[*] = 1000
           prob = tmp           ;get prob for cut
        END                     ;end first
        5 : BEGIN               ;first option
                                ;those = where((master.(speczind2) GE 1.51) AND (master.(speczind2) LE 1.91) AND $              ;cont next line
           those = where((master.(speczind2) GE 1.2) AND $                                        ;cont next line
                         (master.(qzind2) GT 8.0) AND (master.(qzind2) LT 20.0) AND (picked EQ 0), nthose) ;cut
           bit = 'pzlow'                                                                                     ;bit of name
           tmp = master.(1)
           tmp[*] = 200
           prob = tmp                           ;get prob for cut
        END                                     ;end first
        6 : BEGIN                               ;eigth option
           those = where((picked EQ 0), nthose) ;cut
           bit = 'rest'                         ;bit of name
           tmp = master.(1)
           tmp[*] = prest
           prob = tmp  
        END                                                   ;end eigth option
        ELSE : BEGIN                                          ;whoops
           print, 'WARNING!! Something went horribly wrong!!' ;print info
           stop                                               ;stop program
        END                                                   ;end whoops
     ENDCASE                                                  ;end which cut is it
        

     IF nthose NE 0 THEN BEGIN  ;have to have something

        ;;;preparing to write part of the catalogs
        picked[those] = 1                                                        ;switch flag for those chosen
        chk = where(picked EQ 1, nchk)                                           ;find number of chosen 
        inds = indgen(nthose)                                                    ;create index array
        IF verbose GE 2 THEN print, '  # of detections in ' + bit + ': ', nthose ;print info

        ;;;optional region file outputs
        IF keyword_set(REGXY) THEN BEGIN                             ;want x,y coord region file
           outreg = outfile                                          ;copy outfile name
           nsuffix =strcompress('_' + bit + '.reg', /REMOVE_ALL)     ;new filename end
           strreplace, outreg, suffix, nsuffix                       ;new file name 
           openw, lun2, outreg, /GET_LUN                             ;open file
        ENDIF                                                        ;end want x,y coord region file
        IF keyword_set(REGDS9) THEN BEGIN                            ;want ds9 style region file
           outreg2 = outfile                                         ;copy outfile name
           nsuffix =strcompress('_' + bit + '_ds9.reg', /REMOVE_ALL) ;new filename end
           strreplace, outreg2, suffix, nsuffix                      ;new filename en
           openw, lun3, outreg2, /GET_LUN                            ;open file
           printf, lun3, string0a                                    ;print header line
           printf, lun3, string0b                                    ;print header line
           printf, lun3, string0c                                    ;print header line
           printf, lun3, string0d                                    ;print header line
        ENDIF                                                        ;end want ds9 region file

        ;;;fill info into catalog
        FOR xx=0, nthose-1, 1 DO BEGIN ;loop over cut detections
          
           ;;;put those in the magma text file
           prstr = strcompress(strcompress(bit+string(inds[xx]), /REMOVE_ALL)+' '+string(prob[those[xx]])+' '+string(jnom)+' '+ $
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
           outstruc[mstcnt].priority = prob[those[xx]]                          ;store probability
           outstruc[mstcnt].id = strcompress(bit+string(inds[xx]), /REMOVE_ALL) ;store id
           outstruc[mstcnt].jmag = jnom                                         ;store J-band mag
           outstruc[mstcnt].ra = master[those[xx]].(raind)                      ;store ra
           outstruc[mstcnt].dec = master[those[xx]].(decind)                    ;store dec
           mstcnt = mstcnt+1                                                    ;up master counter by 1
        ENDFOR                                                                  ;end loop over cut detections
  
        IF keyword_set(REGDS9) THEN BEGIN ;if ds9 region file 
           close, lun3                    ;close fileunit
           free_lun, lun3                 ;free memory
        ENDIF                             ;end if ds9 region file
        IF keyword_set(REGXY) THEN BEGIN  ;if xy region file
           close, lun2                    ;close fileunit
           free_lun, lun2                 ;free memory
        ENDIF                             ;end if xy region file
     ENDIF                                ;end having something
  ENDFOR                                  ;end loop over cuts


  ;;;add stars to magma files
  radec, stars.(straind), stars.(stdecind), strah, stram, stras, stdech, stdecm, stdecs ;get stars' hours, mins, secs
  goodst = where(stars.(stjind) GT starbri and stars.(stjind) LT starfai, ngoodst)      ;find stars that fall in mag range
  starind = indgen(ngoodst)                                                             ;make star counter
  bit = 'st'                                                                            ;w/ #, code name for MAGMA
  


    ;;;star optional region file outputs
  IF keyword_set(REGXY) THEN BEGIN                             ;want x,y coord region file
     outreg = outfile                                          ;copy outfile name
     nsuffix =strcompress('_' + bit + '.reg', /REMOVE_ALL)     ;new filename end
     strreplace, outreg, suffix, nsuffix                       ;new file name 
     openw, lun2, outreg, /GET_LUN                             ;open file
  ENDIF                                                        ;end want x,y coord region file
  IF keyword_set(REGDS9) THEN BEGIN                            ;want ds9 style region file
     outreg2 = outfile                                         ;copy outfile name
     nsuffix =strcompress('_' + bit + '_ds9.reg', /REMOVE_ALL) ;new filename end
     strreplace, outreg2, suffix, nsuffix                      ;new filename en
     openw, lun3, outreg2, /GET_LUN                            ;open file
     printf, lun3, string0a                                    ;print header line
     printf, lun3, string0b                                    ;print header line
     printf, lun3, string0c                                    ;print header line
     printf, lun3, string0d                                    ;print header line
  ENDIF                                                        ;end want ds9 region file
  
  FOR xx=0, ngoodst-1, 1 DO BEGIN                                                                                                        ;loop over cut detections
     prstr = strcompress(strcompress(bit+string(starind[xx]), /REMOVE_ALL)+' '+string(pst)+' '+string(stars[goodst[xx]].(stjind))+' '+ $ ;cont next line
                         string(strah[goodst[xx]])+' '+string(stram[goodst[xx]])+' '+string(stras[goodst[xx]])+' '+ $                    ;cont next line
                         string(stdech[goodst[xx]])+' '+string(stdecm[goodst[xx]])+' '+string(stdecs[goodst[xx]])+' '+ $                 ;cont next line
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))                                        ;MAGMA file string 
     printf, lun, prstr, FORMAT='(a)'                                                                                                    ;print string to MAGMA file
     IF keyword_set(REGXY) THEN printf, lun2, stars[goodst[xx]].(straind), stars[goodst[xx]].(stdecind) 
     IF keyword_set(REGDS9) THEN BEGIN
        string = strcompress( 'circle('+string(stars[goodst[xx]].(raind))+','+$
                              string(stars[goodst[xx]].(decind))+','+'4.0")', /REMOVE_ALL)
        printf, lun3, string
     ENDIF
     
     ;;;add stars to the companion structure file
     outstruc[mstcnt].priority = pst                                         ;store probability
     outstruc[mstcnt].id = strcompress(bit+string(starind[xx]), /REMOVE_ALL) ;store id
     outstruc[mstcnt].jmag = stars[goodst[xx]].(stjind)                      ;store J-band mag
     outstruc[mstcnt].ra = stars[goodst[xx]].(straind)                       ;store ra
     outstruc[mstcnt].dec = stars[goodst[xx]].(stdecind)                     ;store dec
     mstcnt = mstcnt+1                                                       ;up master counter by 1
  ENDFOR                                                                     ;end loop over star cut detections

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
