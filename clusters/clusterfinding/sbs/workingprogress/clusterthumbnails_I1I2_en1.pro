pro clusterthumbnails_ELAISN1_I1I2

;Pick a cluster 

;junkie = 77
;122 is best one at high-z

;for l = junkie, junkie do begin

for l = 113, 113 do begin

cnum = l

;centroid = 'flux'
centroid = 'cd'

clustercat = '/chooyu1/muzzin/SpARCS/ELAIS-N1/foundclusters_I1I2/final_ELAISN1_fields.cat'
readcol, clustercat, z, sra, sdec, ccra, ccdec, pfra, pfdec, flux, slicenum, z_field, irac1_field,$
skipline = 2, format = '(d,a,a,d,d,d,d,d,i,a,a)'
nclust = n_elements(z)

;Use central galaxy
if centroid eq 'cd' then begin
cra = ccra[cnum]
cdec = ccdec[cnum]
endif
;Use peak of RCS flux
if centroid eq 'flux' then begin
cra = pfra[cnum]; + 0.01
cdec = pfdec[cnum]; + 0.015
endif

print, 'Cluster #', cnum
print, 'Ra: ',sra[cnum]
print, 'Dec: ',sdec[cnum]

;dir = strcompress(chip[cnum], /remove_all)
;dir = strmid(dir, 0, 6)

dir_z = '/chooyu1/muzzin/SpARCS/ELAIS-N1/z/thumbnails_wide_I1I2/'
dir_irac1 = '/chooyu1/muzzin/SpARCS/ELAIS-N1/IRAC/thumbnails_wide_I1I2/'

;dir_z = '/chooyu1/muzzin/SpARCS/ELAIS-N1/z/thumbnails_I1I2/'
;dir_irac1 = '/chooyu1/muzzin/SpARCS/ELAIS-N1/IRAC/thumbnails_I1I2/'

pic = readfits( strcompress(dir_z + 'z_cluster'+string(cnum)+'.fits', /remove_all), header)
print, strcompress(dir_z + 'z_cluster'+string(cnum)+'.fits', /remove_all)
pic2 = readfits( strcompress(dir_irac1 + 'irac1_cluster'+string(cnum)+'.fits', /remove_all), header2)
pic3 = readfits( strcompress(dir_irac1 + 'irac1_cluster'+string(cnum)+'.fits', /remove_all), header3)

angsz = angularsize(z[cnum], 500.0)
print, angsz

;Set imagesize to physical size wanted (or in true pixels)
;Set imagesize2 to size on screen (no need to change this)
imagesize = 2.0*(angsz/0.18435) 
imagesize2 = 475.0

;Extast is the Extract-Astrometry task, takes out the Crpix vals etc.

extast, header, astr, noparams
extast, header2, astr2, noparams2
extast, header3, astr3, noparams3

;Read in the weighted data
;slice = slicenum[cnum]
;readweight, rra, rdec, id, c1ifl, dc1ifl, rmag, drmag, rweight, slice

;Read in IRAC catalogue
read_ELAISN1_zIRAC_finalcat, rra, rdec, apmag_176, eapmag_176, apmag_366, eapmag_366, mag_best, emag_best, c1_bf, c1_ebf, c1_3pxapc, c1_3pxerr, c2_bf, c2_ebf, c2_3pxapc, c2_3pxerr

;read_zIRAC_cat, rra, rdec, apmag_366, eapmag_366, mag_auto, emag_auto, c1_bf, c1_ebf, c1_3pxapc, c1_3pxerr

;Read in the other objects
;-----------Need to fix the below catalogue
;readcat_other_final, rra_oth, rdec_oth, c1_bf, c1_ebf, c1_3pxapc, c1_e3pxapc, ch1bf1, ch1ebf1, ch2bf1, ch2ebf1, $
;ch3bf1, ch3ebf1, ch4bf1, ch4ebf1, r_apmag, r_eapmag, rmag_auto, remag_auto, ext, mips_flux_oth, mips_eflux_oth, rflag_oth

;Get the rotation angle from North of the datasets
getrot, astr, rangle
getrot, astr2, rangle2
getrot, astr3, rangle3

;Convert the Cluster ra and dec to pixels for the zband image
AD2XY, cra ,cdec, astr, xpos, ypos
print, 'Cluster pixel positions on z-band:, ',xpos, ypos

;Convert the Cluster ra and dec to pixels for the IRAC ch1 image
AD2XY, cra ,cdec, astr2, xpos2, ypos2
print, 'Cluster pixel positions on IRAC1:, ',xpos2, ypos2

;Convert the Cluster ra and dec to pixels for the iband image
AD2XY, cra ,cdec, astr3, xpos3, ypos3
print, 'Cluster pixel positions on IRAC1:, ',xpos3, ypos3

;Sets Parameters for the menu part
b=''
probj = 'ON' & pyobj = 'OFF' & pbobj = 'OFF'  & pmobj = 'ON'
xtweak = float(0)
ytweak = float(0)

;While b ne 'q' do begin

;Select only objects within 0.25 of a degree for rotation

regionsize = 0.15 ;degrees
index = where((rra lt cra+regionsize) and (rra gt cra-regionsize) and (rdec lt cdec+regionsize) and (rdec gt cdec-regionsize) $
and apmag_366 lt 90 and apmag_366 gt 15 and c1_bf lt 50 )
ra = rra[index] 
dec = rdec[index] 
;weight = rweight[index]

;-----------Temporarily get out a list of objects-----------
zmI1 = apmag_366[index] - c1_3pxapc
mag_best = mag_best[index]
c1_bf = c1_bf[index]

;index_oth = where((rra_oth lt cra+0.25) and (rra_oth gt cra-0.25) and (rdec_oth lt cdec+0.25) and (rdec_oth gt cdec-0.25))
;ra_oth = rra_oth[index_oth] 
;dec_oth = rdec_oth[index_oth]
;flag_oth = rflag_oth[index_oth]

;Convert the object positions to pixels for each image
AD2XY, ra ,dec, astr, xzband, yzband
AD2XY, ra ,dec, astr2, xirac1, yirac1
AD2XY, ra, dec, astr3, xiband, yiband
;AD2XY, ra_oth ,dec_oth, astr, xrband_oth, yrband_oth
;AD2XY, ra_oth ,dec_oth, astr2, xirac1_oth, yirac1_oth
;AD2XY, ra_oth ,dec_oth, astr3, xmips1_oth, ymips1_oth

;Set pixels to thumbnail co-ordinate system
xzband = (xzband - xpos + imagesize*0.5)*imagesize2/imagesize
yzband = (yzband - ypos + imagesize*0.5)*imagesize2/imagesize
;xrband_oth = (xrband_oth - xpos + imagesize*0.5)*imagesize2/imagesize
;yrband_oth = (yrband_oth - ypos + imagesize*0.5)*imagesize2/imagesize

;Set IRAC + MIPS pixels to middle of subimage for rotation
xirac1 = xirac1 - xpos2
yirac1 = yirac1 - ypos2
;xirac1_oth = xirac1_oth - xpos2
;yirac1_oth = yirac1_oth - ypos2

;Select only objects that lie within the image
index = where( (xzband gt 0.0) and (xzband lt imagesize2) and (yzband gt 0.0) and (yzband lt imagesize2) )
;index_oth = where( (xrband_oth gt 0.0) and (xrband_oth lt imagesize2) and (yrband_oth gt 0.0) and (yrband_oth lt imagesize2) )

xzband = xzband[index] 
yzband = yzband[index] 
;weight = weight[index]
xirac1 = xirac1[index]
yirac1 = yirac1[index]
;xmips1 = xmips1[index]
;ymips1 = ymips1[index]
;pmips_flux = pmips_flux[index]

;xrband_oth= xrband_oth[index_oth] 
;yrband_oth = yrband_oth[index_oth] 
;xirac1_oth = xirac1_oth[index_oth]
;yirac1_oth = yirac1_oth[index_oth]
;flag_oth = flag_oth[index_oth]
;xmips1_oth = xmips1_oth[index_oth]
;ymips1_oth = ymips1_oth[index_oth]
;pmips_flux_oth = pmips_flux_oth[index_oth]

;Put the co-ords in the TV frame
;xirac1 = xirac1 + imagesize + 20.0
;xirac1_oth = xirac1_oth + imagesize + 20.0
;yirac1 = yirac1 + imagesize + 20.0
;yirac1_oth = yirac1_oth + imagesize + 20.0

xirac1 = xzband + imagesize2 + 20.0 + Xtweak*6.594594*imagesize2/imagesize
;xirac1_oth = xrband_oth + imagesize2 + 20.0 + Xtweak*6.594594*imagesize2/imagesize
yirac1 = yzband + imagesize2 + 20.0 + Ytweak*6.594594*imagesize2/imagesize
;yirac1_oth = yrband_oth + imagesize2 + 20.0 + Ytweak*6.594594*imagesize2/imagesize
;;;xiband = xzband
;xmips1_oth = xrband_oth
;;;yiband = yzband
;ymips1_oth = yrband_oth

yzband = yzband + imagesize2 + 20.0
;yrband_oth = yrband_oth + imagesize2 + 20.0

;ind_f0 = where(flag_oth eq 0) ; IRAC + Rband Stars
;ind_f1 = where(flag_oth eq 1) ; IRAC only object
;ind_f2 = where(flag_oth eq 2) ; Rband only star
;ind_f3 = where(flag_oth eq 3) ; Rband only galaxy
;ind_f4 = where(flag_oth eq 4) ; IRAC + Rband Saturated
;ind_f5 = where(flag_oth eq 5) ; Rband only Saturated
;ind_f6 = where(pmips_flux gt 0.1) ; MIPS detection - IRAC counterpart
;ind_f7 = where(pmips_flux_oth gt 0.1) ; MIPS detection - No IRAC counterpart

;Check that thumbnails to not run off the edge of the images

flagxunder = 'false'
flagxover = 'false'
flagyunder  = 'false'
flagyover = 'false'

;if ((xpos-imagesize/2.0)) lt 0 then begin
;oldimage = pic
;pic = dblarr(n_elements(oldimage[*,0]) + (abs((xpos-imagesize/2.0))), n_elements(oldimage[0,*]))
;thumbxmin = 0 
;pic[n_elements(pic[*,0])-n_elements(oldimage[*,0]):n_elements(pic[*,0])-1, *] = oldimage
;flagxunder = 'true'
;endif else thumbxmin = (xpos-imagesize/2.0)

;if ((xpos+imagesize/2.0)) gt n_elements(pic[*,0]) then begin
;oldimage = pic
;pic = dblarr(n_elements(oldimage[*,0]) + (n_elements(pic[*,0]) - abs((xpos-imagesize/2.0))), n_elements(oldimage[0,*]))
;thumbxmax = n_elements(pic[*,0])-1 
;pic[0:n_elements(oldimage[*,0])-1, *] = oldimage
;flagxover = 'true'
;endif else thumbxmax = (xpos+imagesize/2.0)

;if ((ypos-imagesize/2.0)) lt 0 then begin 
;thumbymin = 0 
;oldimage = pic
;pic = dblarr(n_elements(oldimage[*,0]), n_elements(oldimage[0,*]) + (abs((ypos-imagesize/2.0)) + 1))
;pic[*, (n_elements(pic[0,*])-n_elements(oldimage[0,*])):n_elements(pic[0,*])-1] = oldimage
;flagyunder = 'true'
;endif else thumbymin = (ypos-imagesize/2.0)

;if ((ypos+imagesize/2.0)) gt n_elements(pic[0,*]) then begin 
;oldimage = pic
;pic = dblarr(n_elements(oldimage[*,0]), n_elements(oldimage[0,*]) + (abs( (ypos-imagesize/2.0) - n_elements(pic[0,*])) + 1))
;pic[*, 0:n_elements(oldimage[0,*])-1] = oldimage
;thumbymax = n_elements(pic[0,*])-1 
;flagyover = 'true'
;endif else thumbymax = (ypos+imagesize/2.0)

;if flagxunder eq 'true' then thumbxmax = thumbxmax + abs((xpos-imagesize/2.0))
;if flagyunder eq 'true' then thumbymax = thumbymax + abs((ypos-imagesize/2.0))


;Check that thumbnails to not run off the edge of the images - Z BAND IMAGE

flagxunder = 'false'
flagxover = 'false'
flagyunder  = 'false'
flagyover = 'false'

;if ((xpos3-imagesize/2.0)) lt 0 then begin
;oldimage = pic3
;pic3 = dblarr(n_elements(oldimage[*,0]) + (abs((xpos3-imagesize/2.0))), n_elements(oldimage[0,*]))
;thumb3xmin = 0 
;pic3[n_elements(pic3[*,0])-n_elements(oldimage[*,0]):n_elements(pic3[*,0])-1, *] = oldimage
;flagxunder = 'true'
;endif else thumb3xmin = (xpos3-imagesize/2.0)

;if ((xpos3+imagesize/2.0)) gt n_elements(pic3[*,0]) then begin
;oldimage = pic3
;pic3 = dblarr(n_elements(oldimage[*,0]) + (n_elements(pic3[*,0]) - abs((xpos3-imagesize/2.0))), n_elements(oldimage[0,*]))
;thumb3xmax = n_elements(pic3[*,0])-1 
;pic3[0:n_elements(oldimage[*,0])-1, *] = oldimage
;flagxover = 'true'
;endif else thumb3xmax = (xpos3+imagesize/2.0)

;if ((ypos3-imagesize/2.0)) lt 0 then begin 
;thumb3ymin = 0 
;oldimage = pic3
;pic3 = dblarr(n_elements(oldimage[*,0]), n_elements(oldimage[0,*]) + (abs((ypos3-imagesize/2.0)) + 1))
;pic3[*, (n_elements(pic3[0,*])-n_elements(oldimage[0,*])):n_elements(pic3[0,*])-1] = oldimage
;flagyunder = 'true'
;endif else thumb3ymin = (ypos3-imagesize/2.0)

;if ((ypos3+imagesize/2.0)) gt n_elements(pic3[0,*]) then begin 
;oldimage = pic3
;pic3 = dblarr(n_elements(oldimage[*,0]), n_elements(oldimage[0,*]) + (abs( (ypos3-imagesize/2.0) - n_elements(pic3[0,*])) + 1))
;pic3[*, 0:n_elements(oldimage[0,*])-1] = oldimage
;thumb3ymax = n_elements(pic3[0,*])-1 
;flagyover = 'true'
;endif else thumb3ymax = (ypos3+imagesize/2.0);

;if flagxunder eq 'true' then thumb3xmax = thumb3xmax + abs((xpos3-imagesize/2.0))
;if flagyunder eq 'true' then thumb3ymax = thumb3ymax + abs((ypos3-imagesize/2.0));

;If extracted image is larger than original image, crop properly - Channel 1

;imageflagc1 = 0
;if ((xpos2-(imagesize*0.151639*0.5))) lt 0 then imageflagc1 = 1
;if ((xpos2+(imagesize*0.151639*0.5))) gt n_elements(pic2[*,0]) then imageflagc1 = 1
;if ((ypos2-(imagesize*0.151639*0.5))) lt 0 then imageflagc1 = 1
;if ((ypos2+(imagesize*0.151639*0.5))) gt n_elements(pic2[0,*]) then imageflagc1 = 1

;if imageflagc1 eq 1 then begin
;if ((xpos2-(imagesize*0.151639*0.5))) lt 0 then thumb2xmin = 0 else thumb2xmin = (xpos2-(imagesize*0.151639*0.5))
;if ((xpos2+(imagesize*0.151639*0.5))) gt n_elements(pic2[*,0]) then thumb2xmax = n_elements(pic2[*,0])-1 else thumb2xmax = (xpos2+(imagesize*0.151639*0.5))
;if ((ypos2-(imagesize*0.151639*0.5))) lt 0 then thumb2ymin = 0 else thumb2ymin = (ypos2-(imagesize*0.151639*0.5))
;if ((ypos2+(imagesize*0.151639*0.5))) gt n_elements(pic2[0,*]) then thumb2ymax = n_elements(pic2[0,*])-1 else thumb2ymax = (ypos2+(imagesize*0.151639*0.5))
;endif else begin
;if ((xpos2-(imagesize*0.151639*0.5 + 20))) lt 0 then thumb2xmin = 0 else thumb2xmin = (xpos2-(imagesize*0.151639*0.5 + 20))
;if ((xpos2+(imagesize*0.151639*0.5 + 20))) gt n_elements(pic2[*,0]) then thumb2xmax = n_elements(pic2[*,0])-1 else thumb2xmax = (xpos2+(imagesize*0.151639*0.5 + 20))
;if ((ypos2-(imagesize*0.151639*0.5 + 20))) lt 0 then thumb2ymin = 0 else thumb2ymin = (ypos2-(imagesize*0.151639*0.5 + 20))
;if ((ypos2+(imagesize*0.151639*0.5 + 20))) gt n_elements(pic2[0,*]) then thumb2ymax = n_elements(pic2[0,*])-1 else thumb2ymax = (ypos2+(imagesize*0.151639*0.5 + 20))
;endelse

;If extracted image is larger than original image, crop properly - MIPS

;if ((xpos3-imagesize/2.0)) lt 0 then begin
;oldimage = pic3
;pic3 = dblarr(n_elements(oldimage[*,0]) + (abs((xpos3-imagesize/2.0))), n_elements(oldimage[0,*]))
;thumb3xmin = 0 
;pic3[n_elements(pic3[*,0])-n_elements(oldimage[*,0]):n_elements(pic3[*,0])-1, *] = oldimage
;flagxunder = 'true'
;endif else thumb3xmin = (xpos3-imagesize/2.0)

;if ((xpos3+imagesize/2.0)) gt n_elements(pic3[*,0]) then begin
;oldimage = pic3
;pic3 = dblarr(n_elements(oldimage[*,0]) + (n_elements(pic3[*,0]) - abs((xpos3-imagesize/2.0))), n_elements(oldimage[0,*]))
;thumb3xmax = n_elements(pic3[*,0])-1 
;pic3[0:n_elements(oldimage[*,0])-1, *] = oldimage
;flagxover = 'true'
;endif else thumb3xmax = (xpos3+imagesize/2.0)

;if ((ypos3-imagesize/2.0)) lt 0 then begin 
;thumb3ymin = 0 
;oldimage = pic3
;pic3 = dblarr(n_elements(oldimage[*,0]), n_elements(oldimage[0,*]) + (abs((ypos3-imagesize/2.0)) + 1))
;pic3[*, (n_elements(pic3[0,*])-n_elements(oldimage[0,*])):n_elements(pic3[0,*])-1] = oldimage
;flagyunder = 'true'
;endif else thumb3ymin = (ypos3-imagesize/2.0)

;if ((ypos3+imagesize/2.0)) gt n_elements(pic3[0,*]) then begin 
;oldimage = pic3
;pic3 = dblarr(n_elements(oldimage[*,0]), n_elements(oldimage[0,*]) + (abs( (ypos3-imagesize/2.0) - n_elements(pic3[0,*])) + 1))
;pic3[*, 0:n_elements(oldimage[0,*])-1] = oldimage
;thumb3ymax = n_elements(pic3[0,*])-1 
;flagyover = 'true'
;endif else thumb3ymax = (ypos3+imagesize/2.0)

;if flagxunder eq 'true' then thumb3xmax = thumb3xmax + abs((xpos3-imagesize/2.0))
;if flagyunder eq 'true' then thumb3ymax = thumb3ymax + abs((ypos3-imagesize/2.0))

;imageflagc3 = 0
;if ((xpos3-(imagesize*0.151639*0.5))) lt 0 then imageflagc3 = 1
;if ((xpos3+(imagesize*0.151639*0.5))) gt n_elements(pic3[*,0]) then imageflagc3 = 1
;if ((ypos3-(imagesize*0.151639*0.5))) lt 0 then imageflagc3 = 1
;if ((ypos3+(imagesize*0.151639*0.5))) gt n_elements(pic3[0,*]) then imageflagc3 = 1

;if imageflagc3 eq 1 then begin
;if ((xpos3-(imagesize*0.151639*0.5))) lt 0 then thumb3xmin = 0 else thumb3xmin = (xpos3-(imagesize*0.151639*0.5))
;if ((xpos3+(imagesize*0.151639*0.5))) gt n_elements(pic3[*,0]) then thumb3xmax = n_elements(pic3[*,0])-1 else thumb2xmax = (xpos3+(imagesize*0.151639*0.5))
;if ((ypos3-(imagesize*0.151639*0.5))) lt 0 then thumb3ymin = 0 else thumb3ymin = (ypos3-(imagesize*0.151639*0.5))
;if ((ypos3+(imagesize*0.151639*0.5))) gt n_elements(pic3[0,*]) then thumb3ymax = n_elements(pic3[0,*])-1 else thumb2ymax = (ypos3+(imagesize*0.151639*0.5))
;endif else begin
;if ((xpos3-(imagesize*0.151639*0.5 + 20))) lt 0 then thumb3xmin = 0 else thumb3xmin = (xpos3-(imagesize*0.151639*0.5 + 20))
;if ((xpos3+(imagesize*0.151639*0.5 + 20))) gt n_elements(pic3[*,0]) then thumb3xmax = n_elements(pic3[*,0])-1 else thumb3xmax = (xpos3+(imagesize*0.151639*0.5 + 20))
;if ((ypos3-(imagesize*0.151639*0.5 + 20))) lt 0 then thumb3ymin = 0 else thumb3ymin = (ypos3-(imagesize*0.151639*0.5 + 20))
;if ((ypos3+(imagesize*0.151639*0.5 + 20))) gt n_elements(pic3[0,*]) then thumb3ymax = n_elements(pic3[0,*])-1 else thumb3ymax = (ypos3+(imagesize*0.151639*0.5 + 20))
;endelse

;thumb = pic[thumbxmin:thumbxmax, thumbymin:thumbymax]
;thumb2 = pic2[thumb2xmin:thumb2xmax, thumb2ymin:thumb2ymax]
;thumb3 = pic3[thumb3xmin:thumb3xmax, thumb3ymin:thumb3ymax]

thumb = pic
thumb2 = pic2
thumb3 = pic3

window, 1, xsize = imagesize2*2.0 + 20.0, ysize = 2.0*imagesize2+40.0, title = 'Cluster: ' + strcompress(string(cnum),/remove_all) + '   RA: ' + string(sra[cnum]) + '   Dec: ' + string(sdec[cnum]) + '   z = ' + strcompress(string(z[cnum]),/remove_all); + '  KPNO field: ' + strcompress(string(KPNOfield[cnum]), /remove_all)
zscl = zscale_range(thumb)
zscl2 = zscale_range(thumb2);, POINTS = 50)
zscl3 = zscale_range(thumb3)

thumb2 = rot(thumb2, rangle2)
thumb3 = rot(thumb3, rangle3)

;if imageflagc1 ne 1 then thumb2 = thumb2[20:n_elements(thumb2[*,0])-20, 20:n_elements(thumb2[0,*])-20]
thumb2 = congrid(thumb2, imagesize2, imagesize2)
;if imageflagc3 ne 1 then thumb3 = thumb3[20:n_elements(thumb3[*,0])-20, 20:n_elements(thumb3[0,*])-20]
;thumb3 = congrid(thumb3, imagesize2, imagesize2)

thumb = congrid(thumb, imagesize2, imagesize2)
thumb3 = congrid(thumb3, imagesize2, imagesize2)

clustercmds_IRAC_ELAISN1_I1I2, cnum
;clustercmds_EN2_I1I2, cnum
;clustercmds_i, cnum

tv, -1.0*(bytscl(thumb, min = zscl[0], max = zscl[1])), 0, imagesize2+20.0
if pyobj eq 'ON' then tvcircle, 9.0, xzband, yzband, color = 65000, thick = 2 ; yellow = 65000
;if pbobj eq 'ON' then tvcircle, 9.0, xrband_oth[ind_f3], yrband_oth[ind_f3], color = 1.50080e+07, thick = 2 ; blue = 14500000
;if probj eq 'ON' and ind_f0[0] ne -1 then tvbox, 9.0, xrband_oth[ind_f0], yrband_oth[ind_f0], color = 5000, thick = 2 ; red = 2000
;if pbobj eq 'ON' and ind_f2[0] ne -1 then tvbox, 9.0, xrband_oth[ind_f2], yrband_oth[ind_f2], color = 1.50080e+07, thick = 2 ; blue = 14500000
;if probj eq 'ON' and ind_f1[0] ne -1 then tvcircle, 9.0, xrband_oth[ind_f1], yrband_oth[ind_f1], color = 5000, thick = 2 ; red = 2000
;if pmobj eq 'ON' and ind_f6[0] ne -1.0 then tvcircle, 12.0, xmips1[ind_f6], ymips1[ind_f6] + imagesize2 + 20.0, color = 65000, thick = 5 ; yellow = 55000
;if pmobj eq 'ON' and ind_f7[0] ne -1.0 then tvcircle, 12.0, xmips1_oth[ind_f7], ymips1_oth[ind_f7] + imagesize2 + 20.0, color = 65000, thick = 5 ; yellow = 55000
;if probj eq 'ON' and ind_f4[0] ne -1.0 then begin
;tvbox, 16.0, xrband_oth[ind_f4], yrband_oth[ind_f4], color = 5000, thick = 2 ; red = 2000
;endif

tv, -1.0*(bytscl(thumb2, min = zscl2[0], max = zscl2[1])), imagesize2+20.0, imagesize2+20.0
if pyobj eq 'ON' then tvcircle, 9.0, xirac1, yirac1, color = 65000, thick = 2 ; yellow = 55000
;if pbobj eq 'ON' then tvcircle, 9.0, xirac1_oth[ind_f3], yirac1_oth[ind_f3], color = 1.50080e+07, thick = 2 ; blue = 14500000
;if probj eq 'ON' and ind_f0[0] ne -1 then tvbox, 9.0, xirac1_oth[ind_f0], yirac1_oth[ind_f0], color = 5000, thick = 2 ; red = 2000
;if pbobj eq 'ON' and ind_f2[0] ne -1 then tvbox, 9.0, xirac1_oth[ind_f2], yirac1_oth[ind_f2], color = 1.50080e+07, thick = 2 ; blue = 14500000
;if probj eq 'ON' and ind_f1[0] ne -1 then tvcircle, 9.0, xirac1_oth[ind_f1], yirac1_oth[ind_f1], color = 5000, thick = 2 ; red = 2000
;if pmobj eq 'ON' and ind_f6[0] ne -1.0 then tvcircle, 12.0, xmips1[ind_f6] + imagesize2 + 20.0, ymips1[ind_f6] + imagesize2 + 20.0, color = 65000, thick = 5 ; yellow = 55000
;if pmobj eq 'ON' and ind_f7[0] ne -1.0 then tvcircle, 12.0, xmips1_oth[ind_f7] + imagesize2 + 20.0, ymips1_oth[ind_f7] + imagesize2 + 20.0, color = 65000, thick = 5 ; yellow = 55000
;if probj eq 'ON' and ind_f4[0] ne -1.0  then begin
;tvbox, 16.0, xirac1_oth[ind_f4], yirac1_oth[ind_f4], color = 5000, thick = 2 ; red = 2000
;endif

tv, -1.0*(bytscl(thumb3, min = zscl3[0], max = zscl3[1])), 0, 0
;if pyobj eq 'ON' then tvcircle, 9.0, xmips1, ymips1, color = 65000, thick = 2 ; yellow = 55000
;if pbobj eq 'ON' then tvcircle, 9.0, xmips1_oth[ind_f3], ymips1_oth[ind_f3], color = 1.50080e+07, thick = 2 ; blue = 14500000
;if probj eq 'ON' and ind_f0[0] ne -1 then tvbox, 9.0, xmips1_oth[ind_f0], ymips1_oth[ind_f0], color = 5000, thick = 2 ; red = 2000
;if pbobj eq 'ON' and ind_f2[0] ne -1 then tvbox, 9.0, xmips1_oth[ind_f2], ymips1_oth[ind_f2], color = 1.50080e+07, thick = 2 ; blue = 14500000
;if probj eq 'ON' and ind_f1[0] ne -1 then tvcircle, 9.0, xmips1_oth[ind_f1], ymips1_oth[ind_f1], color = 5000, thick = 2 ; red = 2000
;if pmobj eq 'ON' and ind_f6[0] ne -1.0 then tvcircle, 12.0, xmips1[ind_f6], ymips1[ind_f6], color = 65000, thick = 5 ; yellow = 55000
;if pmobj eq 'ON' and ind_f7[0] ne -1.0 then tvcircle, 12.0, xmips1_oth[ind_f7], ymips1_oth[ind_f7], color = 65000, thick = 5 ; yellow = 55000
;if probj eq 'ON' and ind_f4[0] ne -1.0  then begin
;tvbox, 16.0, xmips1_oth[ind_f4], ymips1_oth[ind_f4], color = 5000, thick = 2 ; red = 2000
;endif

write_jpeg, strcompress('/chooyu1/muzzin/SpARCS/ELAIS-N1/clusterpics_I1I2/cluster'+string(cnum)+'.jpg', /remove_all), TVRD(true = 3), true = 3
;write_jpeg, strcompress('/chooyu1/muzzin/SpARCS/ELAIS-N2/clusterpics/cluster'+string(cnum)+'_wide.jpg', /remove_all), TVRD(true = 3), true = 3
;write_jpeg, strcompress('/chooyu1/muzzin/SpARCS/ELAIS-N2/clusterpics/newcmr_cluster'+string(cnum)+'_wide.jpg', /remove_all), TVRD(true = 3), true = 3

;rep = 'true'
;while rep eq 'true' do begin
;toggled = 'no'
;print, 'p - Replot'
;print, 'q - Quits'
;print, 'b - Toggle BLUE   Object Plotting  Current Setting: ', pbobj
;print, 'r - Toggle RED    Object Plotting  Current Setting: ', probj
;print, 'y - Toggle YELLOW Object Plotting  Current Setting: ', pyobj
;print, 'm - Toggle MIPS   Object Plotting  Current Setting: ', pmobj
;print, 't - Tweak IRAC rotation,   Xtweak = ' + strcompress(string(xtweak), /remove_all) + '  Ytweak = ' + strcompress(string(ytweak), /remove_all)
;print, 'c - Plot Cluster CMD'
;read, b, prompt = 'Enter Selection'
;
;if b eq 'b' then begin
;	if pbobj eq 'ON' and toggled eq 'no' then begin
;	pbobj = 'OFF' & toggled = 'yes'
;	endif
;	if pbobj eq 'OFF' and toggled eq 'no' then pbobj = 'ON'
;endif
;if b eq 'y' then begin
;	if pyobj eq 'ON' and toggled eq 'no' then begin
;	pyobj = 'OFF' & toggled = 'yes'
;	endif
;	if pyobj eq 'OFF' and toggled eq 'no' then pyobj = 'ON'
;endif
;if b eq 'm' then begin
;	if pmobj eq 'ON' and toggled eq 'no' then begin
;	pmobj = 'OFF' & toggled = 'yes'
;	endif
;	if pmobj eq 'OFF' and toggled eq 'no' then pmobj = 'ON'
;endif
;if b eq 'r' then begin
;	if probj eq 'ON' and toggled eq 'no' then begin
;	probj = 'OFF' & toggled = 'yes'
;	endif
;	if probj eq 'OFF' and toggled eq 'no' then probj = 'ON'
;endif
;if b eq 't' then begin
;read, xtweak, prompt = 'Enter Xtweak'
;read, ytweak, prompt = 'Enter Ytweak'
;endif 
;
;if b eq 'c' then begin
;clustercmds, cnum
;endif
;
;if b eq 'p' then rep = 'false'
;if b eq 'q' then rep = 'false'
;endwhile

;endwhile

pic = 0.0
pic2 = 0.0
pic3 = 0.0
ra = 0.0 & dec = 0.0  & id = 0.0 & c1ifl = 0.0 & dc1ifl = 0.0 & rmag = 0.0 & drmag = 0.0 & weight = 0.0 & slice = 0.0
ra_oth = 0.0 & dec_oth = 0.0 & id_oth = 0.0 & c1ifl_oth = 0.0 & dc1ifl_oth = 0.0 & rmag_oth = 0.0 & drmag_oth = 0.0 & flag_oth = 0.0

endfor

end 
