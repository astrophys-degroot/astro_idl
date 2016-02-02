;========================================================================================================================
pro mosfire_magmacat_zch1ch2, master, stars, DATAHDR=datahdr, STARHDR=starhdr, $
                              TAGRA=tagra, TAGDEC=tagdec, TAGZMAG=tagzmag, TAGERRZMAG=tarerrzmag, $
                              TAGCH1MAG=tagch1mag, TAGERRCH1MAGERR=tagerrch1mag, $
                              TAGCH2MAG=tagch2mag, TAGERRCH2MAGERR=tagerrch2mag, $
                              TAGSTRA=tagstra, TAGSTDEC=tagstdec, TAGSTH=tagsth, $
                              SBSRED=sbsred, SBSBLUE=sbsblue, SBSBRI=sbsbri, SBSMED=sbsmed, SBSFAI=sbsfai, RSRED=rsred, $
                              PST=pst, PCL=pcl, PBSBSR=pbsbsr, PBSBSB=pbsbsb, PMSBSR=pmsbsr, PMSBSB=pmsbsb, $
                              PFSBSR=pfsbsr, PFSBSB=pfsbsb, PSBSBC=psbsbc, PREST=prest, $
                              JNOM=jnom, EPOCH=epoch, EQUINOX=equinox, THING1=thing1, THING2=thing2, $
                              STARBRI=starbri, STARFAI=starfai, $
                              OUTFILE=outfile, REGXY=regxy, REGDS9=regds9, SUFFIX=suffix, $
                              VERBOSE=verbose, HELP=help, COMPILE=compile


  ;;;need to incorporate if J-band mag is known
  ;;;need to incorporate if we want zmch1 blue color to have differnt probs
  ;;;need to incorporate dealing with cluster members
  
  IF keyword_set(DATAHDR) THEN datahdr = datahdr[0] ELSE datahdr = 'N'                             ;set value
  IF keyword_set(STARHDR) THEN starhdr = starhdr[0] ELSE starhdr = 'N'                             ;set value
  IF keyword_set(TAGRA) THEN tagra = tagra[0] ELSE tagra = 'RA'                                    ;set value
  IF keyword_set(TAGDEC) THEN tagdec = tagdec[0] ELSE tagdec = 'DEC'                               ;set value
  IF keyword_set(TAGZMAG) THEN tagzmag = tagzmag[0] ELSE tagzmag = 'ZMAG'                          ;set value
  IF keyword_set(TAGERRZMAG) THEN tagerrzmag = tagerrzmag[0] ELSE tagerrzmag = 'ZMAGERR'           ;set value
  IF keyword_set(TAGCH1MAG) THEN tagch1mag = tagch1mag[0] ELSE tagch1mag = 'CH1MAG'                ;set value
  IF keyword_set(TAGERRCH1MAG) THEN tagerrch1mag = tagerrch1mag[0] ELSE tagerrch1mag = 'CH1MAGERR' ;set value
  IF keyword_set(TAGCH2MAG) THEN tagch2mag = tagch2mag[0] ELSE tagch2mag = 'CH2MAG'                ;set value
  IF keyword_set(TAGERRCH2MAG) THEN tagerrch2mag = tagerrch2mag[0] ELSE tagerrch2mag = 'CH2MAGERR' ;set value
  IF keyword_set(TAGSTRA) THEN tagstra = tagstra[0] ELSE tagstra = 'RAJ2000'                       ;set value
  IF keyword_set(TAGSTDEC) THEN tagstdec = tagstdec[0] ELSE tagstdec = 'DEJ2000'                   ;set value
  IF keyword_set(TAGSTH) THEN tagsth = tagsth[0] ELSE tagsth = 'HMAG'                              ;set value
  IF keyword_set(SBSRED) THEN sbsred = sbsred[0] ELSE sbsred = 0.1                                 ;set value
  IF keyword_set(SBSBLUE) THEN sbsblue = sbsblue[0] ELSE sbsblue = -0.1                            ;set value
  IF keyword_set(SBSBRI) THEN sbsbri = sbsbri[0] ELSE sbsbri = 19.5                                ;set value
  IF keyword_set(SBSMED) THEN sbsmed = sbsmed[0] ELSE sbsmed = 21.5                                ;set value
  IF keyword_set(SBSFAI) THEN sbsfai = sbsfai[0] ELSE sbsfai = 23.5                                ;set value
  IF keyword_set(RSRED) THEN rsred = rsred[0] ELSE rsred = 1.75                                    ;set value
  IF keyword_set(PST) THEN pst = pst[0] ELSE pst = -1                                              ;set value
  IF keyword_set(PCL) THEN pcl = pcl[0] ELSE pcl = 100                                             ;set value
  IF keyword_set(PBSBSR) THEN pbsbsr = pbsbsr[0] ELSE pbsbsr = 10                                  ;set value
  IF keyword_set(PBSBSB) THEN pbsbsb = pbsbsb[0] ELSE pbsbsb = 5                                   ;set value
  IF keyword_set(PMSBSR) THEN pmsbsr = pmsbsr[0] ELSE pmsbsr = 9                                   ;set value
  IF keyword_set(PMSBSB) THEN pmsbsb = pmsbsb[0] ELSE pmsbsb = 4                                   ;set value
  IF keyword_set(PFSBSR) THEN pfsbsr = pfsbsr[0] ELSE pfsbsr = 6                                   ;set value
  IF keyword_set(PFSBSB) THEN pfsbsb = pfsbsb[0] ELSE pfsbsb = 2                                   ;set value
  IF keyword_set(PSBSBC) THEN psbsbc = psbsbc[0] ELSE psbsbc = 1                                   ;set value
  IF keyword_set(JNOM) THEN jnom = jnom[0] ELSE jnom = 21.0                                        ;set value
  IF keyword_set(EPOCH) THEN epoch = epoch[0] ELSE epoch = 2000.0                                  ;set value
  IF keyword_set(EQUINOX) THEN equinox = equinox[0] ELSE equinox = 2000.0                          ;set value
  IF keyword_set(THING1) THEN thing1 = thing1[0] ELSE thing1 = 0                                   ;set value
  IF keyword_set(THING2) THEN thing2 = thing2[0] ELSE thing2 = 0                                   ;set value
  IF keyword_set(STARBRI) THEN starbri = starbri[0] ELSE starbri = 12.0                            ;set value
  IF keyword_set(STARFAI) THEN starfai = starfai[0] ELSE starfai = 16.0                            ;set value
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'magmacat_file.txt'             ;set value
  IF keyword_set(SUFFIX) THEN suffix = suffix[0] ELSE suffix = '.txt'                              ;set value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2                               ;set value
  mosfire_prob, 1                                                                                  ;compile module

  IF keyword_set(HELP) THEN BEGIN ;if help wanted
     help, master, /STRUC         ;give some help
     help, stars, /STRUC          ;give some help
  ENDIF                           ;end if help wanted


  ;;;Creating outfile structure
  struct = {id:'obj1', priority:12, jmag:20.0, ra:20.0, dec:35.0, $ ;cont next line
            epoch:2000.0, equinox:2000.0, thing1:0, thing2:0}       ;base structur
  nmaster = n_elements(master.(1))                                  ;get number of data points
  nstars = n_elements(stars.(1))                                    ;get number of stars
  ntot = nstars + nmaster                                           ;get total number
  stru = replicate(struct, ntot)                                    ;replicate structure
 

  ;;;preliminary setup
  picked = intarr(nmaster)         ;flag array
  mstcnt = 0                       ;master counter


  ;;;region file header strings
  string0a = '# Region file format: DS9 version 4.1'                                                                                                                 ;string
  string0b = '# Filename: en1_cutout_en1704_servs_ch1.fits'                                                                                                          ;string
  string0c = 'global color=green dashlist=8 3 width=1 font="helvetica 10 normal roman" select=1 highlite=1 dash=0 fixed=0 edit=1 move=1 delete=1 include=1 source=1' ;string
  string0d = 'fk5'                                                                                                                                                   ;string
  

  ;;;catalog information
  raind = tagind(master, tagra, NOTE='RA tag not valid!!')                              ;get RA index
  decind = tagind(master, tagdec,  NOTE='DEC tag not valid!!')                          ;get dec index
  zmagind = tagind(master, tagzmag,  NOTE='ZMAG tag not valid!!')                       ;get dec index
  zmagerrind = tagind(master, tagerrzmag,  NOTE='ZMAGERR tag not valid!!')              ;get dec index
  ch1magind = tagind(master, tagch1mag,  NOTE='CH1MAG tag not valid!!')                 ;get dec index
  ch1magerrind = tagind(master, tagerrch1mag,  NOTE='CH1MAGERR tag not valid!!')        ;get dec index
  ch2magind = tagind(master, tagch2mag,  NOTE='CH2MAG tag not valid!!')                 ;get dec index
  ch2magerrind = tagind(master, tagerrch2mag,  NOTE='CH2MAGERR tag not valid!!')        ;get dec index
  radec, master.(raind), master.(decind), irah, iram, iras, idech, idecm, idecs         ;get hours, mins, secs
  straind = tagind(stars, tagstra, NOTE='Star RA tag not valid!!')                      ;get star RA index
  stdecind = tagind(stars, tagstdec, NOTE='Star DEC tag not valid!!')                   ;get star DEC index
  sthind = tagind(stars, tagsth, NOTE='Stars H-band tag not valid!!')                   ;get star H-band index
  radec, stars.(straind), stars.(stdecind), strah, stram, stras, stdech, stdecm, stdecs ;get hours, mins, secs
  

  ;;;calculations : may exist in the catalog but we do them ourselves anyways
  zmch1 = master.(zmagind) - master.(ch1magind)                            ;z-CH1 color
  zmch1err = ((master.(zmagerrind))^2 + (master.(ch1magerrind))^2)^0.5     ;add errors in quadrature
  ch1mch2 = master.(ch1magind) - master.(ch2magind)                        ;CH1-CH2 color
  ch1mch2err = ((master.(ch1magerrind))^2 + (master.(ch2magerrind))^2)^0.5 ;add errors in quadrature

  
   
  openw, lun, outfile, /GET_LUN                                                       ;open magma text file 
  FOR zz=0, 7, 1 DO BEGIN                                                             ;loop over cuts
     CASE zz OF                                                                       ;which cut is it
      
        0 : BEGIN                                                                                  ;first option
           those = where((ch1mch2 GE sbsred) AND (master.(ch2magind) LT sbsbri) AND $              ;cont next line
                         (zmch1 GE rsred), nthose)                                                 ;cut
           bit = 'bsbsr'                                                                           ;bit of name
           prob = pbsbsr                                                                           ;get prob for cut
        END                                                                                        ;end first
        
        1 : BEGIN                                                                                              ;second option
           those = where((ch1mch2 GE sbsred) AND (master.(ch2magind) LT sbsmed) AND $                          ;cont next line
                         (master.(ch2magind) GE sbsbri) AND (zmch1 GE rsred), nthose)                          ;cut
           bit = 'msbsr'                                                                                       ;bit of name
           prob = pmsbsr                                                                                       ;get prob for cut
        END                                                                                                    ;end second
        2 : BEGIN                                                                                              ;third option
           those = where((ch1mch2 GE sbsred) AND (master.(ch2magind) LT sbsfai) AND $                          ;cont next line
                         (master.(ch2magind) GE sbsmed) AND (zmch1 GE rsred), nthose)                          ;cut
           bit = 'fsbsr'                                                                                       ;bit of name
           prob = pfsbsr                                                                                       ;get prob for cut
        END                                                                                                    ;end third option
        3 :BEGIN                                                                                               ;fourth option
           those = where((ch1mch2 GE sbsblue) AND (ch1mch2 LT sbsred) AND $                                    ;cont next line
                         (master.(ch2magind) LT sbsbri) AND (zmch1 GE rsred), nthose)                          ;cut
           bit = 'bsbsb'                                                                                       ;bit of name
           prob = pbsbsb                                                                                       ;get prob for cut
        END                                                                                                    ;end fourth option
        4 : BEGIN                                                                                              ;fifth option
           those = where((ch1mch2 GE sbsblue) AND (ch1mch2 LT sbsred) AND (master.(ch2magind) LT sbsmed) AND $ ;cont next line
                         (master.(ch2magind) GE sbsbri) AND (zmch1 GE rsred), nthose)                          ;cut
           bit = 'msbsb'                                                                                       ;bit of name
           prob = pmsbsb                                                                                       ;get prob for cut
        END                                                                                                    ;end fifth option
        5 :BEGIN                                                                                               ;sixth option
           those = where((ch1mch2 GE sbsblue) AND (ch1mch2 LT sbsred) AND (master.(ch2magind) LT sbsfai) AND $ ;cont next line
                         (master.(ch2magind) GE sbsmed) AND (zmch1 GE rsred), nthose)                          ;cut
           bit = 'fsbsb'                                                                                       ;bit of name
           prob = pfsbsb                                                                                       ;get prob for cut
        END                                                                                                    ;end sixth option
        6 :BEGIN                                                                                               ;seventh option
           those = where((ch1mch2 LT sbsblue) AND (master.(ch2magind) LT sbsfai) AND $                         ;cont next line
                         (master.(ch2magind) GE sbsmed) AND (zmch1 GE rsred), nthose)                          ;cut
           bit = 'sbsbc'                                                                                       ;bit of name
           prob = psbsbc                                                                                       ;get prob for cut
        END                                                                                                    ;end seventh option
        7 :BEGIN                                                                                               ;eigth option
           those = where((picked EQ 0), nthose)                                                                ;cut
           bit = 'rest'                                                                                        ;bit of name
           prob = prest                                                                                        ;get prob for cut
        END                                                                                                    ;end eigth option
        ELSE : BEGIN                                                                                           ;whoops
           print, 'WARNING!! Something went horribly wrong!!'                                                  ;print info
           stop                                                                                                ;stop program
        END                                                                                                    ;end whoops
     ENDCASE                                                                                                   ;end which cut is it
     
     IF nthose NE 0 THEN BEGIN                                                ;have to have something

     ;;;preparing to write part of the catalogs
        picked[those] = 1                                                     ;switch flag for those chosen
        chk = where(picked EQ 1, nchk)                                        ;find number of chosen 
        inds = indgen(nthose)                                                 ;create index array
        IF verbose GE 2 THEN print, '  # of detections in ' + bit + ': ', nthose ;print info
        
        
     ;;;optional region file outputs
        IF keyword_set(REGXY) THEN BEGIN                          ;want x,y coord region file
           outreg = outfile                                       ;copy outfile name
           nsuffix =strcompress('_' + bit + '.reg', /REMOVE_ALL)  ;new filename end
           strreplace, outreg, suffix, nsuffix                    ;new file name 
           openw, lun2, outreg, /GET_LUN                          ;open file
        ENDIF                                                     ;end want x,y coord region file
        IF keyword_set(REGDS9) THEN BEGIN                         ;want ds9 style region file
           outreg2 = outfile                                      ;copy outfile name
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
           
        ;;;those the magma text file
           prstr = strcompress(strcompress(bit+string(inds[xx]), /REMOVE_ALL)+' '+string(prob)+' '+string(jnom)+' '+ $
                               string(irah[those[xx]])+' '+string(iram[those[xx]])+' '+string(iras[those[xx]])+' '+ $
                               string(idech[those[xx]])+' '+string(idecm[those[xx]])+' '+string(idecs[those[xx]])+' '+ $
                               string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
           printf, lun, prstr, FORMAT='(a)'
           IF keyword_set(REGXY) THEN printf, lun2, master[those[xx]].(raind), master[those[xx]].(decind)
           string = strcompress( 'circle('+string(master[those[xx]].(raind))+','+$
                                 string(master[those[xx]].(decind))+','+string(zz+1)+'")', /REMOVE_ALL)
           IF keyword_set(REGDS9) THEN printf, lun3, string
           
        ;;;next the companion structure file
           stru[mstcnt].priority = prob                                  ;store probability
           stru[mstcnt].id = strcompress(bit+string(inds[xx]), /REMOVE_ALL) ;store id
           stru[mstcnt].jmag = jnom                                         ;store J-band mag
           stru[mstcnt].ra = master[those[xx]].(raind)                      ;store ra
           stru[mstcnt].dec = master[those[xx]].(decind)                    ;store dec
           mstcnt = mstcnt+1                                                ;up master counter by 1
        ENDFOR                                                              ;end loop over cut detections
        
        
        close, lun3             ;close fileunit
        free_lun, lun3          ;free memory
        close, lun2             ;close fileunit
        free_lun, lun2          ;free memory
     ENDIF
  ENDFOR                        ;end loop over cuts
  
  ;;;add stars to magma text file
  star = where(stars.(sthind) GT starbri and stars.(sthind) LT starfai, nstar)
  starind = indgen(nstar)
  bit = 'st'
  
  ;;;star optional region file outputs
  IF keyword_set(REGXY) THEN BEGIN                                ;want x,y coord region file
     outreg = outfile                                             ;copy outfile name
     nsuffix =strcompress('_' + bit + '.reg', /REMOVE_ALL)        ;new filename end
     strreplace, outreg, suffix, nsuffix                          ;new file name 
     openw, lun2, outreg, /GET_LUN                                ;open file
  ENDIF                                                           ;end want x,y coord region file
  IF keyword_set(REGDS9) THEN BEGIN                               ;want ds9 style region file
     outreg2 = outfile                                            ;copy outfile name
     nsuffix =strcompress('_' + bit + '_ds9.reg', /REMOVE_ALL)    ;new filename end
     strreplace, outreg2, suffix, nsuffix                         ;new filename en
     openw, lun3, outreg2, /GET_LUN                               ;open file
     printf, lun3, string0a                                       ;print header line
     printf, lun3, string0b                                       ;print header line
     printf, lun3, string0c                                       ;print header line
     printf, lun3, string0d                                       ;print header line
  ENDIF                                                           ;end want ds9 region file
 

  FOR xx=0, nstar-1, 1 DO BEGIN ;loop over cut detections
     prstr = strcompress(strcompress(bit+string(starind[xx]), /REMOVE_ALL)+' '+string(pst)+' '+string(stars[star[xx]].(sthind))+' '+ $
                         string(strah[star[xx]])+' '+string(stram[star[xx]])+' '+string(stras[star[xx]])+' '+ $
                         string(stdech[star[xx]])+' '+string(stdecm[star[xx]])+' '+string(stdecs[star[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     IF keyword_set(REGXY) THEN printf, lun2, master[those[xx]].(raind), master[those[xx]].(decind)
     string = strcompress( 'circle('+string(master[those[xx]].(raind))+','+$
                           string(master[those[xx]].(decind))+','+'4.0")', /REMOVE_ALL)
     IF keyword_set(REGDS9) THEN printf, lun3, string
     
     ;;;add stars to the companion structure file
     stru[mstcnt].priority = pst                                         ;store probability
     stru[mstcnt].id = strcompress(bit+string(starind[xx]), /REMOVE_ALL) ;store id
     stru[mstcnt].jmag = stars[star[xx]].(sthind)                        ;store J-band mag
     stru[mstcnt].ra = stars[star[xx]].(straind)                        ;store ra
     stru[mstcnt].dec = stars[star[xx]].(stdecind)                      ;store dec
     mstcnt = mstcnt+1                                                   ;up master counter by 1
  ENDFOR                                                                 ;end loop over cut detections
  close, lun3                                                            ;close fileunit
  free_lun, lun3                                                         ;free memory
  close, lun2                                                            ;close fileunit
  free_lun, lun2                                                         ;free memory
  
  
  close, lun                    ;close file
  free_lun, lun                 ;free memory unit

  
  ;;;the .FITS format companion copy
  strreplace, outfile, suffix, '.fits'  
  cleanse = where(stru.id NE 'obj1', ncleanse)
  stru = stru[cleanse]
  mwrfits, stru, outfile, /CREATE


  ;;;Zeroth cut
  ;;; cluster members -> clmem#
  ;nzeroth = n_elements(clmem.(1))
  ;print, nzeroth
  ;zerothind = indgen(nzeroth)
  ;radec, clmem.ra, clmem.dec, xirah, xiram, xiras, xidech, xidecm, xidecs

  ;magmaoutreg = magmaout
  ;strreplace, magmaoutreg, '.txt', '_clmem.reg' 
  ;openw, lun2, magmaoutreg, /GET_LUN
  ;for xx=0, nzeroth-1, 1 do begin 
  ;   prstr = strcompress(strcompress('clmem'+string(zerothind[xx]), /REMOVE_ALL)+' '+string(p_clmem)+' '+string(jnom)+' '+ $
  ;                       string(xirah[xx])+' '+string(xiram[xx])+' '+string(xiras[xx])+' '+ $
  ;                       string(xidech[xx])+' '+string(xidecm[xx])+' '+string(xidecs[xx])+' '+ $
  ;                       string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
  ;   printf, lun, prstr, FORMAT='(a)'
  ;   printf, lun2, data[xx].ra, data[xx].dec
  ;   stru[cnt].priority = p_clmem
  ;   stru[cnt].id = strcompress('clmem'+string(zerothind[xx]), /REMOVE_ALL)
  ;   stru[cnt].jmag = jnom
  ;   stru[cnt].ra = data[xx].ra
  ;   stru[cnt].dec = data[xx].dec
  ;   cnt = cnt+1
  ;endfor
  ;close, lun2
  ;free_lun, lun2  




END
;========================================================================================================================
