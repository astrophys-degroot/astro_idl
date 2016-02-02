pro find_zband_IRAC_image_I1I2


;==============The IRAC part of this is flawed, use find_IRAC_image


;Read in the field coverage data
;openr, lun, '/scr/adam/FLSclusters/field_coverage.dat', /get_lun
;readcol, '/scr/adam/FLSclusters/field_coverage.dat', field, rall, decll, raur, decur, format = '(i, d, d, d, d)', skipline = 4 
;free_lun, lun

readcol, '/chooyu1/muzzin/SpARCS/CDFS/zimage_positions.dat', zimage, raur, decll, rall, decur, format = '(a, d, d, d, d)', skipline = 2 
readcol, '/chooyu1/muzzin/SpARCS/CDFS/IRAC1image_positions.dat', IRAC1image, irall, idecll, iraur, idecur, format = '(a, d, d, d, d)', skipline = 2 

;Read in clusters

nclust = numlines('/chooyu1/muzzin/SpARCS/CDFS/foundclusters_I1I2/final_I1I2_clustercat_combined.cat') -2

openr, lun, '/chooyu1/muzzin/SpARCS/CDFS/foundclusters_I1I2/final_I1I2_clustercat_combined.cat', /get_lun
header = strarr(2)
readf, lun, header
z = dblarr(nclust) & sra = strarr(nclust) & sdec = strarr(nclust)
xpos = dblarr(nclust) & ypos = dblarr(nclust) & ra = dblarr(nclust)
dec = dblarr(nclust) & flux = dblarr(nclust) & slicenum = intarr(nclust)
kpno_field = strarr(nclust) & irac1_field = strarr(nclust)


;Set up the final clusters to be written
wz = double(0) & wsra = string('xxx') & wsdec = string('xxx')
wxpos = double(0) & wypos = double(0) & wra = double(0)
wdec = double(0) & wflux = double(0) & wslicenum = 0

rz = 0.0 & rsra = 'xxx' & rsdec = 'xxx' & rxpos = 0.0 & rypos = 0.0
rra = 0.0 & rdec = 0.0 & rflux = 0.0 & rslicenum = 0

for cnt = 0, nclust-1 do begin
readf, lun, format = '(f7.5, 1x, 2(a13, 2x), 5(f10.5, 1x), i3)',rz, rsra, rsdec, rxpos, rypos, rra, rdec, rflux, rslicenum
z[cnt] = rz & sra[cnt] = rsra & sdec[cnt] = rsdec & xpos[cnt] = rxpos
ypos[cnt] = rypos & ra[cnt] = rra & dec[cnt] = rdec & flux[cnt] = rflux
slicenum[cnt] = rslicenum
endfor

free_lun, lun

;Find which z-band field the cluster is located in

for x = 0, nclust-1 do begin
	fields = 0
	for y = 0, n_elements(rall) -1 do begin
		if (ra[x] lt rall[y]) and (ra[x] gt raur[y]) and (dec[x] gt decll[y]) and (dec[x] lt decur[y]) and (fields[0] ne 0) then begin
		fields = [fields, y]
		endif
		if (ra[x] lt rall[y]) and (ra[x] gt raur[y]) and (dec[x] gt decll[y]) and (dec[x] lt decur[y]) and (fields[0] eq 0) then begin
		fields = y
		endif
	;print, rall[y], decll[y], raur[y], decur[y]
	endfor

;If the cluster has multiple fields, choose the one that is farthest from both
;the x and y axis of the field

;print, 'fields', field[fields], '  ',sra[x], '  ', sdec[x]

	if n_elements(fields) eq 1 then kpno_field[x] = zimage[fields] $
	else begin
	print, 'Multi-field Cluster, Choosing best field', x, '  ',sra[x], '  ', sdec[x]
	dx = dblarr(n_elements(fields)) & dy = dblarr(n_elements(fields))

	for y = 0, n_elements(dx) -1 do begin
	dx[y] = min( [rall[fields[y]]-ra[x], ra[x]-raur[fields[y]] ] ) 
	dy[y] = min( [dec[x]-decll[fields[y]], decur[fields[y]]-dec[x]] )
	endfor

	dist = dx + dy
	junk = max(dist, maxfld)
	kpno_field[x] = zimage[fields[maxfld]]
	print, kpno_field[x]
	endelse

endfor

;============================================================
;Find which IRAC1 field the cluster is located in

image_files = ['/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_1_1_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_1_2_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_1_3_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_1_4_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_2_1_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_2_2_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_2_3_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_2_4_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_3_1_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_3_2_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_3_3_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_3_4_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_4_1_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_4_2_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_4_3_v3_mosaic.fits', $
'/chooyu1/muzzin/SpARCS/CDFS/IRAC/smallswire_CDFS_I1_tile_4_4_v3_mosaic.fits']

;elais_images = dblarr(n_elements(images_files))

for x = 0, nclust-1 do begin
	fields = 0
	print, 'Finding IRAC image, cluster ',string(x) 
	for y = 0, n_elements(image_files) -1 do begin
		i1_image = readfits(image_files[y], i1_image_hdr, /silent)
		adxy, i1_image_hdr, ra[x], dec[x], imposx, imposy
		if (imposx lt n_elements(i1_image[*,0])) and (imposy lt n_elements(i1_image[0,*])) and $
		(imposx ge 0) and (imposy ge 0) and (fields[0] ne 0) then begin
		if i1_image[imposx, imposy] gt 0 then fields = [fields, y]
		endif
		if (imposx lt n_elements(i1_image[*,0])) and (imposy lt n_elements(i1_image[0,*])) and $
		(imposx ge 0) and (imposy ge 0) and (fields[0] eq 0) then begin 
		;print, imposy, n_elements(i1_image[*,0])
		if i1_image[imposx, imposy] gt 0 then fields = y
		endif

	endfor

;If the cluster has multiple fields, choose the one that is farthest from both
;the x and y axis of the field

;print, 'fields', field[fields], '  ',sra[x], '  ', sdec[x]

	if n_elements(fields) eq 1 then irac1_field[x] = IRAC1image[fields] $
	else begin
	print, 'Multi-field Cluster, Choosing first field', x, '  ',sra[x], '  ', sdec[x]
	irac1_field[x] = IRAC1image[fields[0]]

;	dx = dblarr(n_elements(fields)) & dy = dblarr(n_elements(fields))
;
;	for y = 0, n_elements(dx) -1 do begin
;	dx[y] = min( [irall[fields[y]]-ra[x], ra[x]-iraur[fields[y]] ] ) 
;	dy[y] = min( [dec[x]-idecll[fields[y]], idecur[fields[y]]-dec[x]] )
;	endfor
;
;	dist = dx + dy
;	junk = max(dist, maxfld)
;	irac1_field[x] = IRAC1image[fields[maxfld]]
;	print, irac1_field[x]
	endelse
;
endfor



;Sort the remaining clusters by field
;sorted = sort(kpno_field)
;or sort them by redshift
sorted = sort(z)

z = z[sorted] & sra = sra[sorted] & sdec = sdec[sorted] & xpos = xpos[sorted]
ypos = ypos[sorted] & ra = ra[sorted] & dec = dec[sorted] & flux = flux[sorted]
slicenum = slicenum[sorted] & kpno_field = kpno_field[sorted] & irac1_field = irac1_field[sorted]

;Write out the data file
openw, lun, '/chooyu1/muzzin/SpARCS/CDFS/foundclusters_I1I2/final_CDFS_fields.cat', /get_lun
printf, lun, header
for x = 0, n_elements(kpno_field) - 1.0 do begin
printf, lun, format = '(f7.5, 1x, 2(a13, 2x), 5(f10.5, 1x), i3, 2x, a24, a40)',z[x], sra[x], sdec[x], xpos[x], ypos[x], ra[x], dec[x], flux[x], slicenum[x], kpno_field[x], irac1_field[x]
endfor
free_lun, lun

;Use this code to create the field_coverage.dat file

;pic = readfits('/scr/adam/KPNO_Release/FLS_30_KPNO_R_v01.fits', header)

;Extast is the Extract-Astrometry task, takes out the Crpix vals etc.
;extast, header, astr, noparams

;llbound = [100, 100]
;urbound = [n_elements(pic[*,0])-100, n_elements(pic[0,*])-100]

;Convert the pixels to ra and dec limits
;XY2AD, llbound[0], llbound[1], astr, rall, decll
;XY2AD, urbound[0], urbound[1], astr, raur, decur

;print, rall, decll
;print, raur, decur

end
