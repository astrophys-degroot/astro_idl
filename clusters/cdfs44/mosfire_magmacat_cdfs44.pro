;========================================================================================================================
pro mosfire_magmacat_cdfs44

  ;;***********************************************;;
  verbose = 2
  help = 'n'

  outfile = 'cdfs44_magmacat_v3.2.txt'
  compout = 'cdfs44_magmacomp_ch_v3.2.fits'
  p1cat = '../catalogs/cdfs44_catpz_v1.4.1_pr1.fits'
  p2cat = '../catalogs/cdfs44_catpz_v1.4.1_pr2.fits'
  p3acat = '../catalogs/cdfs44_catpz_v1.4.1_pr3a.fits'
  p3bcat = '../catalogs/cdfs44_catpz_v1.4.1_pr3b.fits'
  p3ccat = '../catalogs/cdfs44_catpz_v1.4.1_pr3c.fits'
  p4cat = '../catalogs/cdfs44_catpz_v1.4.1_pr4.fits'
  pstcat = '../stars/cdfs44_2mass_JHK_14arcmin.fits'
  p5acat = '../catalogs/cdfs44_catpz_v1.4.1_pr5a.fits'
  p5bcat = '../catalogs/cdfs44_catpz_v1.4.1_pr5b.fits'
  p5ccat = '../catalogs/cdfs44_catpz_v1.4.1_pr5c.fits'
  p6acat = '../catalogs/cdfs44_catpz_v1.4.1_pr6.fits'
  p6bcat = '../catalogs/cdfs44_catpz_v1.4.1_pr6.fits'
  p7cat = '../catalogs/cdfs44_catpz_v1.4.1_pr7.fits'

  p1 = 500                      ;fixed value cluster members
  p1sp = 1000                   ;fixed value cluster members
  p2 = 100                      ;fixed value possible cluster member
  p3a = 10                      ;multiplier * photo-z prob, bright sbs
  p3b = 6                       ;multiplier * photo-z prob, medium sbs
  p3c = 2                       ;multiplier * photo-z prob, faint sbs
  p4 = 0                        ;fixed probability field galaxy
  pst = -1                      ;star
  p5a = 325                     ;fixed value, bright sbs but no photo-z
  p5b = 275                     ;fixed value, medium sbs but no photo-z
  p5c = 225                     ;fixed value, faint sbs but no photo-z
  p6a = -1                       ;science stars
  p6b = 10                       ;science stars
  p7 = 50                      ;blue cloud sbs
  
  spnum = 3193                  ;bcg id number
  starmin = 13.0                ;min mag for star list
  starmax = 19.0                ;max mag for star list

  epoch = 2000.0
  equinox = 2000.0
  thing1 = 0
  thing2 = 0
  ;;***********************************************;;


  
  ;;***********************************************;;
  if verbose ge 2 then begin
     print, '  ', p1cat
     print, '  ', p2cat
     print, '  ', p3acat
     print, '  ', p3bcat
     print, '  ', p3ccat
     print, '  ', p4cat
     print, '  ', pstcat
     print, '  ', p5acat
     print, '  ', p5bcat
     print, '  ', p5ccat
     print, '  ', p6acat
     print, '  ', p6bcat
     print, '  ', p7cat
   endif

  p1cat = mrdfits(p1cat, 1)
  if help eq 'y' then help, p1cat, /STRUC
  p2cat = mrdfits(p2cat, 1)
  if help eq 'y' then help, p2cat, /STRUC
  p3acat = mrdfits(p3acat, 1)
  if help eq 'y' then help, p3acat, /STRUC
  p3bcat = mrdfits(p3bcat, 1)
  if help eq 'y' then help, p3bcat, /STRUC
  p3ccat = mrdfits(p3ccat, 1)
  if help eq 'y' then help, p3ccat, /STRUC
  p4cat = mrdfits(p4cat, 1)
  if help eq 'y' then help, p4cat, /STRUC
  pstcat = mrdfits(pstcat, 1)
  if help eq 'y' then help, pstcat, /STRUC
  p5acat = mrdfits(p5acat, 1)
  if help eq 'y' then help, p5acat, /STRUC
  p5bcat = mrdfits(p5bcat, 1)
  if help eq 'y' then help, p5bcat, /STRUC
  p5ccat = mrdfits(p5ccat, 1)
  if help eq 'y' then help, p5ccat, /STRUC
  p6acat = mrdfits(p6acat, 1)
  if help eq 'y' then help, p6acat, /STRUC
  p6bcat = mrdfits(p6bcat, 1)
  if help eq 'y' then help, p6bcat, /STRUC
  check = where(pstcat.jmag GT starmin AND pstcat.jmag LT starmax, ncheck)
  print, '  # of stars left in priority list:', ncheck
  pstcat = pstcat[check]
  print, ' Min and Max of stars included: ', min(pstcat.jmag), max(pstcat.jmag)
  p7cat = mrdfits(p7cat, 1)
  if help eq 'y' then help, p7cat, /STRUC


  ;;;Making the file

  openw, lun, outfile, /GET_LUN
  struct = {id:'cl1', priority:12, jmag:20.0, ra:20.0, dec:35.0, epoch:2000.0, equinox:2000.0, thing1:0, thing2:0}
  stru = replicate(struct, (n_elements(p1cat.(1))+n_elements(p2cat.(1))+n_elements(p3acat.(1))+n_elements(p3bcat.(1))+ $
                            n_elements(p3ccat.(1))+n_elements(p4cat.(1))+n_elements(p5acat.(1))+ $
                            n_elements(p5bcat.(1))+n_elements(p5ccat.(1))+n_elements(p6acat.(1))+n_elements(p6acat.(1))+$
                            n_elements(p7cat.(1))))
  cnt = 0
  
  ;;;First catalog
  p1ind = indgen(n_elements(p1cat.(1)))
  radec, p1cat.ra, p1cat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p1cat.(1))-1, 1 do begin 
     if p1cat[xx].id eq spnum then begin
        prstr = strcompress(strcompress('cl'+string(p1ind[xx]), /REMOVE_ALL)+' '+string(p1sp)+' '+string(p1cat[xx].j_mag_auto)+' '+ $
                            string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                            string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                            string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
        stru[cnt].priority = p1sp
     endif else begin
        prstr = strcompress(strcompress('cl'+string(p1ind[xx]), /REMOVE_ALL)+' '+string(p1)+' '+string(p1cat[xx].j_mag_auto)+' '+ $
                            string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                            string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                            string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
        stru[cnt].priority = p1
     endelse
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('cl'+string(p1ind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = p1cat[xx].j_mag_auto
     stru[cnt].ra = p1cat[xx].ra
     stru[cnt].dec = p1cat[xx].dec
     cnt = cnt+1
  endfor


  ;;;Second catalog
  p2ind = indgen(n_elements(p2cat.(1)))
  radec, p2cat.ra, p2cat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p2cat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('nby'+string(p2ind[xx]), /REMOVE_ALL)+' '+ $
                         string(p2)+' '+string(p2cat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('nby'+string(p2ind[xx]), /REMOVE_ALL)
     stru[cnt].priority = p2
     stru[cnt].jmag = p2cat[xx].j_mag_auto
     stru[cnt].ra = p2cat[xx].ra
     stru[cnt].dec = p2cat[xx].dec
     cnt = cnt+1
  endfor


  ;;;Third catalog
  p3aind = indgen(n_elements(p3acat.(1)))
  radec, p3acat.ra, p3acat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p3acat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('pzbsbs'+string(p3aind[xx]), /REMOVE_ALL)+' '+ $
                         string(fix(p3a*p3acat[xx].probability))+' '+string(p3acat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('pzbsbs'+string(p3aind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p3a*p3acat[xx].probability)
     stru[cnt].jmag = p3acat[xx].j_mag_auto
     stru[cnt].ra = p3acat[xx].ra
     stru[cnt].dec = p3acat[xx].dec
     cnt = cnt+1
 endfor
  print, mean(fix(p3a*p3acat[*].probability))
  

  ;;;Fourth catalog
  p3bind = indgen(n_elements(p3bcat.(1)))
  radec, p3bcat.ra, p3bcat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p3bcat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('pzmsbs'+string(p3bind[xx]), /REMOVE_ALL)+' '+ $
                         string(fix(p3b*p3bcat[xx].probability))+' '+string(p3bcat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('pzmsbs'+string(p3bind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p3b*p3bcat[xx].probability)
     stru[cnt].jmag = p3bcat[xx].j_mag_auto
     stru[cnt].ra = p3bcat[xx].ra
     stru[cnt].dec = p3bcat[xx].dec
     cnt = cnt+1
  endfor
  print, mean(fix(p3b*p3bcat[*].probability))
  

  ;;;Fifth catalog
  p3cind = indgen(n_elements(p3ccat.(1)))
  radec, p3ccat.ra, p3ccat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p3ccat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('pzfsbs'+string(p3cind[xx]), /REMOVE_ALL)+' '+ $
                         string(fix(p3c*p3ccat[xx].probability))+' '+string(p3ccat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('pzfsbs'+string(p3cind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p3c*p3ccat[xx].probability)
     stru[cnt].jmag = p3ccat[xx].j_mag_auto
     stru[cnt].ra = p3ccat[xx].ra
     stru[cnt].dec = p3ccat[xx].dec
     cnt = cnt+1
  endfor
  print, mean(fix(p3c*p3ccat[*].probability))

  
  ;;;Sixth catalog
  p4ind = indgen(n_elements(p4cat.(1)))
  radec, p4cat.ra, p4cat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p4cat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('fg'+string(p4ind[xx]), /REMOVE_ALL)+' '+ $
                         string(p4)+' '+string(p4cat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('fg'+string(p4ind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p4)
     stru[cnt].jmag = p4cat[xx].j_mag_auto
     stru[cnt].ra = p4cat[xx].ra
     stru[cnt].dec = p4cat[xx].dec
     cnt = cnt+1
  endfor


  ;;;Seventh catalog
  p5aind = indgen(n_elements(p5acat.(1)))
  radec, p5acat.ra, p5acat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p5acat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('bsbs'+string(p5aind[xx]), /REMOVE_ALL)+' '+ $
                         string(fix(p5a))+' '+string(p5acat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('bsbs'+string(p5aind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p5a)
     stru[cnt].jmag = p5acat[xx].j_mag_auto
     stru[cnt].ra = p5acat[xx].ra
     stru[cnt].dec = p5acat[xx].dec
     cnt = cnt+1
  endfor


  ;;;Eigth catalog
  p5bind = indgen(n_elements(p5bcat.(1)))
  radec, p5bcat.ra, p5bcat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p5bcat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('msbs'+string(p5bind[xx]), /REMOVE_ALL)+' '+ $
                         string(fix(p5b))+' '+string(p5bcat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('msbs'+string(p5bind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p5b)
     stru[cnt].jmag = p5bcat[xx].j_mag_auto
     stru[cnt].ra = p5bcat[xx].ra
     stru[cnt].dec = p5bcat[xx].dec
     cnt = cnt+1
  endfor


  ;;;Ninth catalog
  p5cind = indgen(n_elements(p5ccat.(1)))
  radec, p5ccat.ra, p5ccat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p5ccat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('fsbs'+string(p5cind[xx]), /REMOVE_ALL)+' '+ $
                         string(fix(p5c))+' '+string(p5ccat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('fsbs'+string(p5cind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p5c)
     stru[cnt].jmag = p5ccat[xx].j_mag_auto
     stru[cnt].ra = p5ccat[xx].ra
     stru[cnt].dec = p5ccat[xx].dec
     cnt = cnt+1
  endfor


  ;;;Tenth-a catalog
  p6aind = indgen(n_elements(p6acat.(1)))
  radec, p6acat.ra, p6acat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p6acat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('scista'+string(p6aind[xx]), /REMOVE_ALL)+' '+ $
                         string(fix(p6a))+' '+string(p6acat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('scista'+string(p6aind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p6a)
     stru[cnt].jmag = p6acat[xx].j_mag_auto
     stru[cnt].ra = p6acat[xx].ra
     stru[cnt].dec = p6acat[xx].dec
     cnt = cnt+1
  endfor


  ;;;Tenth-b catalog
  p6bind = indgen(n_elements(p6bcat.(1)))
  radec, p6bcat.ra, p6bcat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p6bcat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('scistb'+string(p6bind[xx]), /REMOVE_ALL)+' '+ $
                         string(fix(p6b))+' '+string(p6bcat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('scistb'+string(p6bind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p6b)
     stru[cnt].jmag = p6bcat[xx].j_mag_auto
     stru[cnt].ra = p6bcat[xx].ra
     stru[cnt].dec = p6bcat[xx].dec
     cnt = cnt+1
  endfor


  ;;;Eleventh catalog
  p7ind = indgen(n_elements(p7cat.(1)))
  radec, p7cat.ra, p7cat.dec, irah, iram, iras, idech, idecm, idecs
  for xx=0, n_elements(p7cat.(1))-1, 1 do begin 
     prstr = strcompress(strcompress('bcsbs'+string(p7ind[xx]), /REMOVE_ALL)+' '+ $
                         string(fix(p7))+' '+string(p7cat[xx].j_mag_auto)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].id = strcompress('bcsbs'+string(p7ind[xx]), /REMOVE_ALL)
     stru[cnt].priority = fix(p7)
     stru[cnt].jmag = p7cat[xx].j_mag_auto
     stru[cnt].ra = p7cat[xx].ra
     stru[cnt].dec = p7cat[xx].dec
     cnt = cnt+1
  endfor


  ;;;Star catalog
  ;pstind = indgen(n_elements(pstcat.(1)))
  ;radec, pstcat.raj2000, pstcat.dej2000, irah, iram, iras, idech, idecm, idecs
  ;for xx=0, n_elements(pstcat.(1))-1, 1 do begin 
  ;   prstr = strcompress(strcompress('st'+string(pstind[xx]), /REMOVE_ALL)+' '+ $
  ;                       string(pst)+' '+string(pstcat[xx].hmag)+' '+ $
  ;                       string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
  ;                       string(idech[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
  ;                       string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
  ;   printf, lun, prstr, FORMAT='(a)'
  ;   stru[cnt].id = strcompress('st'+string(pstind[xx]), /REMOVE_ALL)
  ;   stru[cnt].priority = fix(pst)
  ;   stru[cnt].jmag = pstcat[xx].hmag
  ;   stru[cnt].ra = pstcat[xx].raj2000
  ;   stru[cnt].dec = pstcat[xx].dej2000
  ;   cnt = cnt+1
  ;endfor


  close, lun
  free_lun, lun  
  mwrfits, stru, compout, /CREATE

end
;========================================================================================================================



;========================================================================================================================
pro mosfire_magmacat_addmask_cdfs44

  ;;***********************************************;;
  verbose = 2
  help = 'n'
  
  mascat = 'cdfs44_magmacat_v10.1.txt'                   ;master input list
  compcat = 'cdfs44_magmacomp_ch_v10.1.fits'             ;companion list
  recmask = '../cdfs44_mask2/cdfs44_mask1.coords'        ;just made mask
  outfile = 'cdfs44_magmacat_v10.1_mask2.txt'            ;next input file
  outcompnext = 'cdfs44_magmacomp_ch_v10.1_mask2.fits'   ;companion to next input file
  outcompthis = 'cdfs44_magmacomp_ch_v10.1_inmask1.fits' ;mask you just created

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
