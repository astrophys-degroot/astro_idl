;========================================================================================================================
pro mosfire_make_magmacat_lok200

  ;;***********************************************;;
  verbose = 2                   ;how much do you want to know
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  datain = '/Users/degroota/research/current7_mosfire_2013nov28_lok200/catalogs/lok200_sparcs_z_servs_ch1ch2_sbscat_v1.1.fits'
  starsin = '/Users/degroota/research/current7_mosfire_2013nov28_lok200/catalogs/lok200_2mass_pointsources_v3-0.fits'
  magmaout = 'lok200_feedtomagma_mask1_v1.0.txt'
  
  epoch = 2000.0                ;no need to change
  equinox = 2000.0              ;no need to change
  thing1 = 0                    ;no need to change
  thing2 = 0                    ;no need to change
  jnom = 21.0                   ;if no jmag available

  starmin = 12.0                ;min mag for star list
  starmax = 16.0                ;max mag for star list

  sbsred = 0.1                  ;ch1-ch2 must be great than
  sbsblue = -0.1                ;;ch1-ch2 must be great than but less than sbsred

  sbsbright = 19.5              ;ch2mag must be less than
  sbsmedium = 22.0              ;ch2 mag must be less than but greater than sbsbright
  sbsfaint = 23.0               ;ch2 mag must be less than but greater than sbsmedium
  

  p_st = -1                     ;star fiducial probability
  p_clmem = 00                  ;prob(cluster members)
  p_bsbsr = 4000                ;prob(bsbsr)
  p_msbsr = 500                 ;prob(msbsr)
  p_fsbsr = 50                  ;prob(fsbsr)
  p_bsbsb = 5000                ;prob(bsbsb)
  p_msbsb = 700                 ;prob(msbsb)
  p_fsbsb = 40                  ;prob(fsbsb)
  p_sbsbc = 30                  ;prob(sbsbc)
  p_rest = 5                    ;prob(everything else)

  
  ;;***********************************************;;
  
  
  
  ;;;read in the files
  data = mrdfits(datain, 1, datahdr)
  IF keyword_set(HELP) THEN help, data, /STRUC
  ;clmem = mrdfits(clmemin, 1, datahdr)
  ;IF keyword_set(HELP) THEN help, clmem, /STRUC
  stars = mrdfits(starsin, 1, starhdr)
  IF keyword_set(HELP) THEN help, stars, /STRUC
  
  
  ;;;Making the file
  radec, data.ra, data.dec, irah, iram, iras, idech, idecm, idecs
  openw, lun, magmaout, /GET_LUN
  struct = {id:'cl1', priority:12, jmag:20.0, ra:20.0, dec:35.0, epoch:2000.0, equinox:2000.0, thing1:0, thing2:0}
  stru = replicate(struct, (n_elements(data.(1))+n_elements(stars.(1))))
  picked = intarr(n_elements(data.(1)))
  cnt = 0
  
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

  ;;;reg header strings
  string0a = '# Region file format: DS9 version 4.1'
  string0b = '# Filename: en1_cutout_en1704_servs_ch1.fits'
  string0c = 'global color=green dashlist=8 3 width=1 font="helvetica 10 normal roman" select=1 highlite=1 dash=0 fixed=0 edit=1 move=1 delete=1 include=1 source=1'
  string0d = 'fk5'


  ;;;First cut
  ;;; brighter than sbsbright and redder than sbsred -> bsbsr#
  first = where(data.ch1mch2 GT sbsred AND data.ch2mag LT sbsbright, nfirst)
  picked[first] = 1
  chk = where(picked EQ 1, nchk)
  firstind = indgen(nfirst)

  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_bsbsr.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_bsbsr_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nfirst-1, 1 do begin 
     prstr = strcompress(strcompress('bsbsr'+string(firstind[xx]), /REMOVE_ALL)+' '+string(p_bsbsr)+' '+string(jnom)+' '+ $
                         string(irah[first[xx]])+' '+string(iram[first[xx]])+' '+string(iras[first[xx]])+' '+ $
                         string(idech[first[xx]])+' '+string(idecm[first[xx]])+' '+string(idecs[first[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[first[xx]].ra, data[first[xx]].dec
     string = strcompress( 'circle('+string(data[first[xx]].ra)+','+string(data[first[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_bsbsr
     stru[cnt].id = strcompress('bsbsr'+string(firstind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jnom
     stru[cnt].ra = data[first[xx]].ra
     stru[cnt].dec = data[first[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  
  
  
  ;;;second cut
  ;;; brighter than sbsmedium but fainter than sbsbright and redder than sbsred -> msbsr#
  second = where(data.ch1mch2 GT sbsred AND data.ch2mag LT sbsmedium AND data.ch2mag GT sbsbright, nsecond)
  print, nsecond
  picked[second] = 1
  chk = where(picked EQ 1, nchk)
  secondind = indgen(nsecond)

  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_msbsr.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_msbsr_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nsecond-1, 1 do begin 
     prstr = strcompress(strcompress('msbsr'+string(secondind[xx]), /REMOVE_ALL)+' '+string(p_msbsr)+' '+string(jnom)+' '+ $
                         string(irah[second[xx]])+' '+string(iram[second[xx]])+' '+string(iras[second[xx]])+' '+ $
                         string(idech[second[xx]])+' '+string(idecm[second[xx]])+' '+string(idecs[second[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[second[xx]].ra, data[second[xx]].dec
     string = strcompress( 'circle('+string(data[second[xx]].ra)+','+string(data[second[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_msbsr
     stru[cnt].id = strcompress('msbsr'+string(secondind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jnom
     stru[cnt].ra = data[second[xx]].ra
     stru[cnt].dec = data[second[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  


  ;;;third cut
  ;;; fainter than sbsfaint and redder than sbsred -> fsbsr#
  third = where(data.ch1mch2 GT sbsred AND data.ch2mag LT sbsfaint AND data.ch2mag GT sbsmedium, nthird)
  print, nthird
  picked[third] = 1
  chk = where(picked EQ 1, nchk)
  thirdind = indgen(nthird)
  
  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_fsbsr.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_fsbsr_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nthird-1, 1 do begin 
     prstr = strcompress(strcompress('fsbsr'+string(thirdind[xx]), /REMOVE_ALL)+' '+string(p_fsbsr)+' '+string(jnom)+' '+ $
                         string(irah[third[xx]])+' '+string(iram[third[xx]])+' '+string(iras[third[xx]])+' '+ $
                         string(idech[third[xx]])+' '+string(idecm[third[xx]])+' '+string(idecs[third[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[third[xx]].ra, data[third[xx]].dec
     string = strcompress( 'circle('+string(data[third[xx]].ra)+','+string(data[third[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_fsbsr
     stru[cnt].id = strcompress('fsbsr'+string(thirdind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jnom
     stru[cnt].ra = data[third[xx]].ra
     stru[cnt].dec = data[third[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  


  ;;;fourth cut
  ;;; fainter than sbsfaint and redder than sbsred -> bsbsb#
  fourth = where(data.ch1mch2 LT sbsred AND data.ch1mch2 GT sbsblue AND data.ch2mag LT sbsbright, nfourth)
  print, nfourth
  picked[fourth] = 1
  chk = where(picked EQ 1, nchk)
  fourthind = indgen(nfourth)
  
  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_bsbsb.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_bsbsb_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nfourth-1, 1 do begin 
     prstr = strcompress(strcompress('bsbsb'+string(fourthind[xx]), /REMOVE_ALL)+' '+string(p_bsbsb)+' '+string(jnom)+' '+ $
                         string(irah[fourth[xx]])+' '+string(iram[fourth[xx]])+' '+string(iras[fourth[xx]])+' '+ $
                         string(idech[fourth[xx]])+' '+string(idecm[fourth[xx]])+' '+string(idecs[fourth[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[fourth[xx]].ra, data[fourth[xx]].dec
     string = strcompress( 'circle('+string(data[fourth[xx]].ra)+','+string(data[fourth[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_bsbsb
     stru[cnt].id = strcompress('bsbsb'+string(fourthind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jnom
     stru[cnt].ra = data[fourth[xx]].ra
     stru[cnt].dec = data[fourth[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  


  ;;;fifth cut
  ;;; fainter than sbsfaint and redder than sbsred -> msbsb#
  fifth = where(data.ch1mch2 LT sbsred AND data.ch1mch2 GT sbsblue AND data.ch2mag GT sbsbright AND data.ch2mag LT sbsmedium, nfifth)
  print, nfifth
  picked[fifth] = 1
  chk = where(picked EQ 1, nchk)
  fifthind = indgen(nfifth)
  
  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_msbsb.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_msbsb_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nfifth-1, 1 do begin 
     prstr = strcompress(strcompress('msbsb'+string(fifthind[xx]), /REMOVE_ALL)+' '+string(p_msbsb)+' '+string(jnom)+' '+ $
                         string(irah[fifth[xx]])+' '+string(iram[fifth[xx]])+' '+string(iras[fifth[xx]])+' '+ $
                         string(idech[fifth[xx]])+' '+string(idecm[fifth[xx]])+' '+string(idecs[fifth[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[fifth[xx]].ra, data[fifth[xx]].dec
     string = strcompress( 'circle('+string(data[fifth[xx]].ra)+','+string(data[fifth[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_msbsb
     stru[cnt].id = strcompress('msbsb'+string(fifthind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jnom
     stru[cnt].ra = data[fifth[xx]].ra
     stru[cnt].dec = data[fifth[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  

  ;;;sixth cut
  ;;; fainter than sbsfaint and redder than sbsred -> fsbsb#
  sixth = where(data.ch1mch2 LT sbsred AND data.ch1mch2 GT sbsblue AND data.ch2mag GT sbsmedium AND data.ch2mag LT sbsfaint, nsixth)
  print, nsixth
  picked[sixth] = 1
  chk = where(picked EQ 1, nchk)
  sixthind = indgen(nsixth)
  
  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_fsbsb.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_fsbsb_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nsixth-1, 1 do begin 
     prstr = strcompress(strcompress('fsbsb'+string(sixthind[xx]), /REMOVE_ALL)+' '+string(p_fsbsb)+' '+string(jnom)+' '+ $
                         string(irah[sixth[xx]])+' '+string(iram[sixth[xx]])+' '+string(iras[sixth[xx]])+' '+ $
                         string(idech[sixth[xx]])+' '+string(idecm[sixth[xx]])+' '+string(idecs[sixth[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[sixth[xx]].ra, data[sixth[xx]].dec
     string = strcompress( 'circle('+string(data[sixth[xx]].ra)+','+string(data[sixth[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_fsbsb
     stru[cnt].id = strcompress('fsbsb'+string(sixthind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jnom
     stru[cnt].ra = data[sixth[xx]].ra
     stru[cnt].dec = data[sixth[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  


  IF includeall EQ 'Y'THEN BEGIN
     rest = where(picked EQ 0, nrest)
     print, nrest
     restind = indgen(nrest)
     
     magmaoutreg = magmaout
     strreplace, magmaoutreg, '.txt', '_rest.reg' 
     openw, lun2, magmaoutreg, /GET_LUN
     magmaoutreg2 = magmaout
     strreplace, magmaoutreg2, '.txt', '_rest_ds9_wcsdeg.reg' 
     openw, lun3, magmaoutreg2, /GET_LUN
     printf, lun3, string0a
     printf, lun3, string0b
     printf, lun3, string0c
     printf, lun3, string0d
     for xx=0, nrest-1, 1 do begin 
        prstr = strcompress(strcompress('rest'+string(restind[xx]), /REMOVE_ALL)+' '+string(p_rest)+' '+string(jnom)+' '+ $
                            string(irah[rest[xx]])+' '+string(iram[rest[xx]])+' '+string(iras[rest[xx]])+' '+ $
                            string(idech[rest[xx]])+' '+string(idecm[rest[xx]])+' '+string(idecs[rest[xx]])+' '+ $
                            string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
        printf, lun, prstr, FORMAT='(a)'
        printf, lun2, data[rest[xx]].ra, data[rest[xx]].dec
        string = strcompress( 'circle('+string(data[rest[xx]].ra)+','+string(data[rest[xx]].dec)+',4.0")', /REMOVE_ALL)
        printf, lun3, string
        stru[cnt].priority = p_rest
        stru[cnt].id = strcompress('rest'+string(restind[xx]), /REMOVE_ALL)
        stru[cnt].jmag = jnom
        stru[cnt].ra = data[rest[xx]].ra
        stru[cnt].dec = data[rest[xx]].dec
        cnt = cnt+1
     endfor
     close, lun3
     free_lun, lun3  
     close, lun2
     free_lun, lun2  
  ENDIF

  ;;;star cut
  ;;; fainter than sbsfaint and redder than sbsred -> st#
  star = where(stars.hmag GT starmin and stars.hmag LT starmax, nstar)
  print, nstar
  starind = indgen(nstar)
  
  radec, stars.raj2000, stars.dej2000, strah, stram, stras, stdech, stdecm, stdecs
    
  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_st.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_st_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nstar-1, 1 do begin 
     prstr = strcompress(strcompress('st'+string(starind[xx]), /REMOVE_ALL)+' '+string(p_st)+' '+string(stars[star[xx]].hmag)+' '+ $
                         string(strah[star[xx]])+' '+string(stram[star[xx]])+' '+string(stras[star[xx]])+' '+ $
                         string(stdech[star[xx]])+' '+string(stdecm[star[xx]])+' '+string(stdecs[star[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, stars[star[xx]].raj2000, stars[star[xx]].dej2000
     string = strcompress( 'circle('+string(data[star[xx]].ra)+','+string(data[star[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_st
     stru[cnt].id = strcompress('st'+string(starind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = stars[star[xx]].hmag
     stru[cnt].ra = stars[star[xx]].raj2000
     stru[cnt].dec = stars[star[xx]].dej2000
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  


  ;;;free memory of magmafile
  close, lun
  free_lun, lun  

  ;;;and a .fits format copy
  strreplace, magmaout, '.txt', '.fits'  
  cleanse = where(stru.id NE 'cl1', ncleanse)
  stru = stru[cleanse]
  mwrfits, stru, magmaout, /CREATE

end
;========================================================================================================================



;========================================================================================================================
pro lok200_remakecomp, VERBOSE=verbose, HELP=help


  mascat = 'lok200_feedtomagma_formask3_v1-0_gill.txt' 
  directory = ' '
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro lok200_nextmask, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'lok200_feedtomagma_formask3_v1-0_gill.txt'       ;master input list
  recmask = '../LOK200_mask3/LOK200_mask3_1.0.coords'        ;just made mask
  compcat = 'lok200_feedtomagma_formask3_v1-0_gill.fits'     ;companion list
  outfile = 'lok200_feedtomagma_formask4_v1-0_gill.txt'      ;next input file
  outcompnext = 'lok200_feedtomagma_formask4_v1-0_gill.fits' ;companion to next input file
  outcompthis = 'lok200_feedtomagma_inmask3_v1-0_gill.fits'  ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis

END
;========================================================================================================================
