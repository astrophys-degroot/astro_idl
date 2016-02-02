;========================================================================================================================
pro mosfire_magmacat_lockman163405810

  ;;***********************************************;;
  verbose = 2
  help = 'n'

  infile = '../catalogs/cl163.40258.1193_sbs.fits'
  stfile = '../stars/lockman163405810_2mass_JHK.fits'
  outfile = 'lockman163405810_magmacat_v5.1.txt'
  compout = 'lockman163405810_magmacomp_ch_v5.1.fits'


  wbsbs_r = 1500                 ;fixed value cluster members
  wfsbs_r = 700                 ;fixed value cluster members
  wbsbs_b = 300                 ;fixed value possible cluster member
  wfsbs_b = 200                 ;multiplier * photo-z prob, bright sbs
  wbcsbs = 100                  ;multiplier * photo-z prob, medium sbs
  pst = -1                      ;

  ch2bl = 17.0                  ;bright limit
  ch2div = 21.5                 ;divide between bright and faint
  ch2fl = 23.5                  ;faint limit
  sbs_rdiv = 0.4                ;high z sbs color 
  sbs_bdiv = 0.2                ;possible high z sbs color
  sbs_bc = -0.2                 ;blue cloud color limit
  
  starmin = 13.0                ;min mag for star list
  starmax = 19.0                ;max mag for star list

  jmag = 21.0 
  epoch = 2000.0
  equinox = 2000.0
  thing1 = 0
  thing2 = 0
  ;;***********************************************;;


  
  ;;***********************************************;;
  if verbose ge 2 then begin
     print, '  ', infile
     print, '  ', outfile
     print, '  ', compout
   endif

  infile = mrdfits(infile, 1)
  if help eq 'y' then help, infile, /STRUC
  pstcat = mrdfits(stfile, 1)
  if help eq 'y' then help, pstcat, /STRUC
  check = where(pstcat.jmag GT starmin AND pstcat.jmag LT starmax, ncheck)
  print, '  # of stars left in priority list:', ncheck
  pstcat = pstcat[check]
  print, ' Min and Max of stars included: ', min(pstcat.jmag), max(pstcat.jmag)




  ;;;Making the file

  openw, lun, outfile, /GET_LUN
  struct = {id:'cl1', priority:99, jmag:20.0, ra:20.0, dec:35.0, epoch:2000.0, equinox:2000.0, thing1:0, thing2:0}
  stru = replicate(struct, (n_elements(infile.(1))))
  cnt = 0
  test = intarr (n_elements(infile.(1)))
  test[*] = 0

  
  ;;;First cut
  check = where(infile.mag_best GT ch2bl AND infile.mag_best LT ch2div AND infile.ch1mch2 GT sbs_rdiv AND test EQ 0, ncheck)
  test[check] = 1
  print, ' # of bright sbs with redder color: ', ncheck
  ind = indgen(ncheck)
  radec, infile.ra, infile.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, ncheck-1, 1 do begin 
     prstr = strcompress(strcompress('bsbsr'+string(ind[xx]), /REMOVE_ALL)+' '+string(wbsbs_r)+' '+string(jmag)+' '+ $
                         string(irah[check[xx]])+' '+string(iram[check[xx]])+' '+string(iras[check[xx]])+' '+ $
                         string(idech[check[xx]])+' '+string(idecm[check[xx]])+' '+string(idecs[check[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].priority = wbsbs_r
     stru[cnt].id = strcompress('bsbsr'+string(ind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jmag
     stru[cnt].ra = infile[check[xx]].ra
     stru[cnt].dec = infile[check[xx]].dec
     cnt = cnt+1
  endfor


  ;;;Second cut
  check = where(infile.mag_best GT ch2div AND infile.mag_best LT ch2fl AND infile.ch1mch2 GT sbs_rdiv AND test EQ 0, ncheck)
  test[check] = 1
  print, ' # of faint sbs with redder color: ', ncheck
  ind = indgen(ncheck)
  radec, infile.ra, infile.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, ncheck-1, 1 do begin 
     prstr = strcompress(strcompress('fsbsr'+string(ind[xx]), /REMOVE_ALL)+' '+string(wfsbs_r)+' '+string(jmag)+' '+ $
                         string(irah[check[xx]])+' '+string(iram[check[xx]])+' '+string(iras[check[xx]])+' '+ $
                         string(idech[check[xx]])+' '+string(idecm[check[xx]])+' '+string(idecs[check[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].priority = wfsbs_r
     stru[cnt].id = strcompress('fsbsr'+string(ind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jmag
     stru[cnt].ra = infile[check[xx]].ra
     stru[cnt].dec = infile[check[xx]].dec
     cnt = cnt+1
  endfor


  ;;;Third cut
  check = where(infile.mag_best GT ch2bl AND infile.mag_best LT ch2div AND infile.ch1mch2 LT sbs_rdiv AND infile.ch1mch2 GT sbs_bdiv AND test EQ 0, ncheck)
  test[check] = 1
  print, ' # of bright sbs with redder color: ', ncheck
  ind = indgen(ncheck)
  radec, infile.ra, infile.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, ncheck-1, 1 do begin 
     prstr = strcompress(strcompress('bsbsb'+string(ind[xx]), /REMOVE_ALL)+' '+string(wbsbs_b)+' '+string(jmag)+' '+ $
                         string(irah[check[xx]])+' '+string(iram[check[xx]])+' '+string(iras[check[xx]])+' '+ $
                         string(idech[check[xx]])+' '+string(idecm[check[xx]])+' '+string(idecs[check[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].priority = wbsbs_b
     stru[cnt].id = strcompress('bsbsb'+string(ind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jmag
     stru[cnt].ra = infile[check[xx]].ra
     stru[cnt].dec = infile[check[xx]].dec
     cnt = cnt+1
  endfor



  ;;;Fourth cut
  check = where(infile.mag_best GT ch2div AND infile.mag_best LT ch2fl AND infile.ch1mch2 LT sbs_rdiv AND infile.ch1mch2 GT sbs_bdiv AND test EQ 0, ncheck)
  test[check] = 1
  print, ' # of bright sbs with redder color: ', ncheck
  ind = indgen(ncheck)
  radec, infile.ra, infile.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, ncheck-1, 1 do begin 
     prstr = strcompress(strcompress('fsbsb'+string(ind[xx]), /REMOVE_ALL)+' '+string(wfsbs_b)+' '+string(jmag)+' '+ $
                         string(irah[check[xx]])+' '+string(iram[check[xx]])+' '+string(iras[check[xx]])+' '+ $
                         string(idech[check[xx]])+' '+string(idecm[check[xx]])+' '+string(idecs[check[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].priority = wfsbs_b
     stru[cnt].id = strcompress('fsbsb'+string(ind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jmag
     stru[cnt].ra = infile[check[xx]].ra
     stru[cnt].dec = infile[check[xx]].dec
     cnt = cnt+1
  endfor


  ;;;Fifth cut
  check = where(infile.mag_best GT ch2div AND infile.mag_best LT ch2fl AND infile.ch1mch2 LT sbs_bdiv AND infile.ch1mch2 GT sbs_bc AND test EQ 0, ncheck)
  test[check] = 1
  print, ' # of bright sbs with redder color: ', ncheck
  ind = indgen(ncheck)
  radec, infile.ra, infile.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, ncheck-1, 1 do begin 
     prstr = strcompress(strcompress('sbsbc'+string(ind[xx]), /REMOVE_ALL)+' '+string(wbcsbs)+' '+string(jmag)+' '+ $
                         string(irah[check[xx]])+' '+string(iram[check[xx]])+' '+string(iras[check[xx]])+' '+ $
                         string(idech[check[xx]])+' '+string(idecm[check[xx]])+' '+string(idecs[check[xx]])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].priority = wbcsbs
     stru[cnt].id = strcompress('sbsbc'+string(ind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jmag
     stru[cnt].ra = infile[check[xx]].ra
     stru[cnt].dec = infile[check[xx]].dec
     cnt = cnt+1
  endfor


  ;;;Star catalog
  pstind = indgen(n_elements(pstcat.(1)))
  radec, pstcat.raj2000, pstcat.dej2000, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(pstcat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('st'+string(pstind[xx]), /REMOVE_ALL)+' '+ $
                         string(pst)+' '+string(pstcat[xx].hmag)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('st'+string(pstind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(pst)
     stru[cnt].jmag = pstcat[xx].hmag
     stru[cnt].ra = pstcat[xx].raj2000
     stru[cnt].dec = pstcat[xx].dej2000
     cnt = cnt+1
  endfor


  close, lun
  free_lun, lun  


  check = where(stru.priority eq 99, ncheck, COMPLEMENT=ngood)
  stru = stru[ngood]
  mwrfits, stru, compout, /CREATE

end
;========================================================================================================================



;========================================================================================================================
pro mosfire_magmacat_addmask_lockman163325884

  ;;***********************************************;;
  verbose = 2
  help = 'n'
  
  mascat = 'lockman163325884_magmacat_v10.1.txt'                   ;master input list
  compcat = 'lockman163325884_magmacomp_ch_v10.1.fits'             ;companion list
  recmask = '../lockman163325884_mask2/lockman163325884_mask1.coords'        ;just made mask
  outfile = 'lockman163325884_magmacat_v10.1_mask2.txt'            ;next input file
  outcompnext = 'lockman163325884_magmacomp_ch_v10.1_mask2.fits'   ;companion to next input file
  outcompthis = 'lockman163325884_magmacomp_ch_v10.1_inmask1.fits' ;mask you just created

  ;;***********************************************;;



  print, outfile
  print, outcompnext
  print, outcompthis
  print, mascat
  print, compcat
  print, recmask

  comp = mrdfits(compcat, 1)
  help, comp, /STRUC
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
                      id2[xx] EQ id1, n, COMPLEMENT=keep, NCOMPLEMENT=nkeep)
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
