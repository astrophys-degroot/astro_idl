;========================================================================================================================
pro mosfire_make_magmacat_xmm710

  ;;***********************************************;;
  verbose = 2                   ;how much do you want to know
  helper = 'Y'                  ;capitals count
  
  datain = '/Users/degroota/research/observing/keck/mosfire/2013nov28/xmm710/magma/xmm710_12pass_se_v1.3.1.fits'
  starsin = '/Users/degroota/research/observing/keck/mosfire/2013nov28/xmm710/catalogs/xmm710_2massstars_v1.0.fits'
  magmaout = 'xmm710_feedtomagma_v1.0.txt'
  
  epoch = 2000.0                ;no need to change
  equinox = 2000.0              ;no need to change
  thing1 = 0                    ;no need to change
  thing2 = 0                    ;no need to change
                                ;jnom = 21.0                   ;if no jmag available

  starmin = 15.0                ;min mag for star list
  starmax = 20.0                ;max mag for star list

  ykred = 2.0                   ;Y-K greater than 
  yksuperred = 3.0              ;Y-K greater than 
  ykceil = 6.0                  ;Y-K NO greater than 
  
  bright = 19.5                 ;bright/faint cut

  p_st = -1                     ;star fiducial probability
  p_ykbsr = 3                   ;prob(bsbsr)
  p_ykfsr = 3                   ;prob(msbsr)
  p_ykbr = 3                    ;prob(fsbsr)
  p_ykfr = 3                    ;prob(bsbsb) 
  p_noy = 3                     ;prob(bsbsb) 
  p_else = 3                    ;all else
  ;;***********************************************;;
  
  
  
  ;;;read in the files
  data = mrdfits(datain, 1, datahdr)
  if helper eq 'Y' then help, data, /STRUC
  ;clmem = mrdfits(clmemin, 1, datahdr)
  ;if helper eq 'Y' then help, clmem, /STRUC
  stars = mrdfits(starsin, 1, starhdr)
  if helper eq 'Y' then help, stars, /STRUC
  
  
  ;;;Making the file
  radec, data.ra, data.dec, irah, iram, iras, idech, idecm, idecs
  openw, lun, magmaout, /GET_LUN
  struct = {id:'cl1', priority:12, jmag:20.0, ra:20.0, dec:35.0, epoch:2000.0, equinox:2000.0, thing1:0, thing2:0}
  stru = replicate(struct, n_elements(data.(1)))
  cnt = 0
  

  ;;;reg header strings
  string0a = '# Region file format: DS9 version 4.1'
  string0b = '# Filename: en1_cutout_en1704_servs_ch1.fits'
  string0c = 'global color=green dashlist=8 3 width=1 font="helvetica 10 normal roman" select=1 highlite=1 dash=0 fixed=0 edit=1 move=1 delete=1 include=1 source=1'
  string0d = 'fk5'


  ;;;First cut
  ;;;brighter than bright and redder than yksupered -> ykbsr#
  first = where((data.ymk GE yksuperred) AND (data.ymk LT ykceil) AND (data.f259 LE bright), nfirst)
  print, nfirst
  firstind = indgen(nfirst)

  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_ykbsr.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_ykbsr_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nfirst-1, 1 do begin 
     prstr = strcompress(strcompress('ykbsr'+string(firstind[xx]), /REMOVE_ALL)+' '+string(p_ykbsr)+' '+string(data[first[xx]].f257)+' '+ $
                         string(irah[first[xx]])+' '+string(iram[first[xx]])+' '+string(iras[first[xx]])+' '+ $
                         string(idech[first[xx]])+' '+string(idecm[first[xx]])+' '+string(idecs[first[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[first[xx]].ra, data[first[xx]].dec
     string = strcompress( 'circle('+string(data[first[xx]].ra)+','+string(data[first[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_ykbsr
     stru[cnt].id = strcompress('ykbsr'+string(firstind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = data[first[xx]].f257
     stru[cnt].ra = data[first[xx]].ra
     stru[cnt].dec = data[first[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  

  
  ;;;Second cut
  ;;;fainter than bright and redder than yksupered -> ykfsr#
  first = where((data.ymk GE yksuperred) AND (data.ymk LT ykceil) AND (data.f259 GT bright), nfirst)
  print, nfirst
  firstind = indgen(nfirst)

  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_ykfsr.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_ykfsr_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nfirst-1, 1 do begin 
     prstr = strcompress(strcompress('ykfsr'+string(firstind[xx]), /REMOVE_ALL)+' '+string(p_ykfsr)+' '+string(data[first[xx]].f257)+' '+ $
                         string(irah[first[xx]])+' '+string(iram[first[xx]])+' '+string(iras[first[xx]])+' '+ $
                         string(idech[first[xx]])+' '+string(idecm[first[xx]])+' '+string(idecs[first[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[first[xx]].ra, data[first[xx]].dec
     string = strcompress( 'circle('+string(data[first[xx]].ra)+','+string(data[first[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_ykfsr
     stru[cnt].id = strcompress('ykfsr'+string(firstind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = data[first[xx]].f257
     stru[cnt].ra = data[first[xx]].ra
     stru[cnt].dec = data[first[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  


  ;;;Third cut
  ;;;brighter than bright and red but not redder than yksupered -> ykbr#
  first = where((data.ymk GT ykred) AND (data.ymk LT yksuperred) AND (data.f259 LE bright), nfirst)
  print, nfirst
  firstind = indgen(nfirst)

  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_ykbr.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_ykbr_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nfirst-1, 1 do begin 
     prstr = strcompress(strcompress('ykbr'+string(firstind[xx]), /REMOVE_ALL)+' '+string(p_ykbr)+' '+string(data[first[xx]].f257)+' '+ $
                         string(irah[first[xx]])+' '+string(iram[first[xx]])+' '+string(iras[first[xx]])+' '+ $
                         string(idech[first[xx]])+' '+string(idecm[first[xx]])+' '+string(idecs[first[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[first[xx]].ra, data[first[xx]].dec
     string = strcompress( 'circle('+string(data[first[xx]].ra)+','+string(data[first[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_ykbr
     stru[cnt].id = strcompress('ykbr'+string(firstind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = data[first[xx]].f257
     stru[cnt].ra = data[first[xx]].ra
     stru[cnt].dec = data[first[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  


  ;;;Fourth cut
  ;;;fainter than bright and red but not redder than yksupered -> ykbsr#
  first = where((data.ymk GT ykred) AND (data.ymk LT yksuperred) AND (data.f259 GT bright), nfirst)
  print, nfirst
  firstind = indgen(nfirst)

  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_ykfr.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_ykfr_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nfirst-1, 1 do begin 
     prstr = strcompress(strcompress('ykfr'+string(firstind[xx]), /REMOVE_ALL)+' '+string(p_ykfr)+' '+string(data[first[xx]].f257)+' '+ $
                         string(irah[first[xx]])+' '+string(iram[first[xx]])+' '+string(iras[first[xx]])+' '+ $
                         string(idech[first[xx]])+' '+string(idecm[first[xx]])+' '+string(idecs[first[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[first[xx]].ra, data[first[xx]].dec
     string = strcompress( 'circle('+string(data[first[xx]].ra)+','+string(data[first[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_ykfr
     stru[cnt].id = strcompress('ykfr'+string(firstind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = data[first[xx]].f257
     stru[cnt].ra = data[first[xx]].ra
     stru[cnt].dec = data[first[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  

  ;;;Fifth cut
  ;;;no y detection
  fifth = where((data.ymk LT -99.0), nfifth)
  print, nfifth
  fifthind = indgen(nfifth)

  magmaoutreg = magmaout
  strreplace, magmaoutreg, '.txt', '_noy.reg' 
  openw, lun2, magmaoutreg, /GET_LUN
  magmaoutreg2 = magmaout
  strreplace, magmaoutreg2, '.txt', '_noy_ds9_wcsdeg.reg' 
  openw, lun3, magmaoutreg2, /GET_LUN
  printf, lun3, string0a
  printf, lun3, string0b
  printf, lun3, string0c
  printf, lun3, string0d
  for xx=0, nfifth-1, 1 do begin 
     prstr = strcompress(strcompress('noy'+string(fifthind[xx]), /REMOVE_ALL)+' '+string(p_ykfr)+' '+string(data[fifth[xx]].f257)+' '+ $
                         string(irah[fifth[xx]])+' '+string(iram[fifth[xx]])+' '+string(iras[fifth[xx]])+' '+ $
                         string(idech[fifth[xx]])+' '+string(idecm[fifth[xx]])+' '+string(idecs[fifth[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     printf, lun2, data[fifth[xx]].ra, data[fifth[xx]].dec
     string = strcompress( 'circle('+string(data[fifth[xx]].ra)+','+string(data[fifth[xx]].dec)+',4.0")', /REMOVE_ALL)
     printf, lun3, string
     stru[cnt].priority = p_noy
     stru[cnt].id = strcompress('noy'+string(fifthind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = data[fifth[xx]].f257
     stru[cnt].ra = data[fifth[xx]].ra
     stru[cnt].dec = data[fifth[xx]].dec
     cnt = cnt+1
  endfor
  close, lun3
  free_lun, lun3  
  close, lun2
  free_lun, lun2  


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
PRO mosfire_magmacat_applychanges_xmm710

  ;;***********************************************;;
  verbose = 2
  help = 'n'
  
  mascat = 'lok400_feedtomagma_v1.1.txt' ;master input list
  
  IF verbose GE 3 THEN print, ' Modified catalog that MAGMA used to run: ', mascat
  IF verbose GE 3 THEN print, ' Modified catalog converted to .FITS format: ', compcat
  ;;***********************************************;;

  compcat = mascat                     ;companion list
  strreplace, compcat, '.txt', '.fits'   ;alter extension
  
  readcol, mascat, id1, priority1, jmag1, rah1, ram1, ras1, decd1, decm1, decs1, epoch1, equi1, thing1, thing2, FORMAT='(a,i,f,f,f,f,f,f,f,f,f,i,i)'  
  struct = {id:'cl1', priority:12, jmag:20.0, ra:20.0, dec:35.0, epoch:2000.0, equinox:2000.0, thing1:0, thing2:0}
  stru = replicate(struct, n_elements(id1))
  
  stru[*].id = id1
  stru[*].priority = priority1
  stru[*].ra = (rah1*15.0) + (ram1*0.25) + (ras1*((1.0)/(240.0)))
  stru[*].dec = decd1 + (decm1*(1.0/60.0)) + (decs1*((1.0/3600.0)))
  stru[*].jmag =jmag1
  stru[*].epoch = epoch1
  stru[*].equinox = equi1
  stru[*].thing1 = thing1
  stru[*].thing2 =thing2  
  help, stru, /STRUC

  mwrfits, stru, compcat, /CREATE
  
END
;========================================================================================================================



;========================================================================================================================
pro mosfire_magmacat_nextmask_xmm710, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'xmm710_feedtomagma_v1.0.txt'                ;master input list
  compcat = 'xmm710_feedtomagma_v1.0.fits'              ;companion list
  recmask = '../xmm710_mask1/xmm710_mask1.coords'       ;just made mask
  outfile = 'xmm710_feedtomagma_v1.1_formask2.txt'      ;next input file
  outcompnext = 'xmm710_feedtomagma_v1.1_formask2.fits' ;companion to next input file
  outcompthis = 'xmm710_feedtomagma_v1.1_inmask1.fits'  ;mask you just created
  
  ;;***********************************************;;


  IF VERBOSE GE 2 THEN BEGIN
     print, outfile
     print, outcompnext
     print, outcompthis
     print, mascat
     print, compcat
     print, recmask
  ENDIF

  comp = mrdfits(compcat, 1)
  IF keyword_set(HELP) THEN help, comp, /STRUC
  readcol, mascat, id1, priority1, jmag1, rah1, ram1, ras1, decd1, decm1, decs1, epoch1, equi1, thing11, thing21, FORMAT='(a,i,f,f,f,f,f,f,f,f,f,i,i)'
  readcol, recmask, id2, priority2, jmag2, rah2, ram2, ras2, decd2, decm2, decs2, epoch2, equi2, thing12, thing22, FORMAT='(a,i,f,f,f,f,f,f,f,f,f,i,i)'

  inmask = intarr(n_elements(id2))
  inmask[*] = -6789 
  for xx=0L, n_elements(id2)-1, 1 do begin
     if priority2[xx] ne -1 then begin
        test = where((rah2[xx] EQ rah1) AND (ram2[xx] EQ ram1) AND (abs(ras2[xx]-ras1) LT 0.01) AND $
                     (decd2[xx] EQ decd1) AND (decm2[xx] EQ decm1) AND (abs(decs2[xx]-decs1) LT 0.01) AND $
                     id2[xx] EQ id1, n, COMPLEMENT=keep, NCOMPLEMENT=nkeep)
        if n eq 0 then print, ' No matches found!!!!'
        if (n ne 1) or (nkeep ne (n_elements(id1)-1)) then print, ' More than one match found!!!'
        inmask[xx] = test
     endif
  endfor
  test = where(inmask NE -6789)
  compthis = comp[inmask[test]]
  mwrfits, compthis, outcompthis, /CREATE

  compnext = comp
  for yy=0L, n_elements(id2)-1, 1 do begin
     if priority2[yy] ne -1 then begin
        test = where((rah2[yy] EQ rah1) AND (ram2[yy] EQ ram1) AND (abs(ras2[yy]-ras1) LT 0.01) AND $
                     (decd2[yy] EQ decd1) AND (decm2[yy] EQ decm1) AND (abs(decs2[yy]-decs1) LT 0.01) AND $
                      id2[yy] EQ id1, n, COMPLEMENT=keep, NCOMPLEMENT=nkeep)
        if (n ne 1) or (nkeep ne (n_elements(id1)-1)) then print, ' More than one match found!!!'
        print, test
        id1 = id1[keep]
        priority1 = priority1[keep]
        jmag1 = jmag1[keep]
        rah1 = rah1[keep]
        ram1 = ram1[keep]
        ras1 = ras1[keep]
        decd1 = decd1[keep]
        decm1 = decm1[keep]
        decs1 = decs1[keep]
        epoch1 = epoch1[keep]
        equi1 = equi1[keep]
        thing11 = thing11[keep]
        thing21 = thing21[keep]
        compnext = compnext[keep]
     endif else print, ' Guide star!! Keeping it!!'
  endfor
  mwrfits, compnext, outcompnext, /CREATE
  

  openw, lun, outfile, /GET_LUN
  for zz=0L, n_elements(id1)-1, 1 do begin
     if zz mod 100 eq 0 then print, '  Now on number: ', zz
     prstr = strcompress(string(id1[zz])+' '+string(priority1[zz])+' '+string(jmag1[zz])+' '+ $
             string(fix(rah1[zz]))+' '+string(fix(ram1[zz]))+' '+string(ras1[zz])+' '+ $
             string(fix(decd1[zz]))+' '+string(fix(decm1[zz]))+' '+string(decs1[zz])+' '+ $
             string(epoch1[zz])+' '+string(equi1[zz])+' '+string(thing11[zz])+' '+string(thing21[zz]))
     printf, lun, prstr, FORMAT='(a)'
  endfor
  close, lun
  free_lun, lun
  

end
;========================================================================================================================
