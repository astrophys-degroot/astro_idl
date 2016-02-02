pro sortclustercat_I1I2

;This program takes a compiled catalogue of found clusters and removes
;duplicates.  The default is to remove clusters that are within 3 pixels
;of the relative maps.  --This is done by calculating the angular size
;of pixels at the redshift of the cluster

;Read in clusters

nclust = numlines('/chooyu1/muzzin/SpARCS/Lockman/foundclusters_I1I2/I1I2clustercat_combined.cat') -2

openr, lun, '/chooyu1/muzzin/SpARCS/Lockman/foundclusters_I1I2/I1I2clustercat_combined.cat', /get_lun
header = strarr(2)
readf, lun, header
z = dblarr(nclust) & sra = strarr(nclust) & sdec = strarr(nclust)
xpos = dblarr(nclust) & ypos = dblarr(nclust) & ra = dblarr(nclust)
dec = dblarr(nclust) & flux = dblarr(nclust) & slicenum = intarr(nclust)

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

;Set up temporary locations to store clusters as they are compared and removed
raholder = ra & decholder = dec & zholder = z & sraholder = sra
sdecholder = sdec & xposholder = xpos & yposholder = ypos & fluxholder = flux
slicenumholder = slicenum

;Open the logfile
openw, lun5, '/chooyu1/muzzin/SpARCS/Lockman/foundclusters_I1I2/catmerge.log', /get_lun
clustersremain = 'true'
debug = 0

while clustersremain eq 'true' and debug lt 1000 do begin

	tempindex = 0
	angsz = angularsize(zholder[0], 1000.0)
	;pixelsize = (4.0)/(fix((4.0*3600.0)/(angsz)) + 1)
	angsz = angsz / 3600

	for y = 1, n_elements(raholder)-1 do begin
		if sqrt( ((raholder[0] - raholder[y])*cos(decholder[0]*(!pi/180)))^2 + (decholder[0] - decholder[y])^2) lt angsz $
		and ( abs(slicenumholder[0] -slicenumholder[y]) lt 25) then begin
		;print, raholder[0], raholder[y]
		tempindex = [tempindex, y]; Indexes of matching clusters
		endif
	endfor 	

	useless = max(fluxholder[tempindex], clusterid)

	tempindex = [tempindex, 0]; Pad tempindex... crashes without and extra element

	debz = zholder[tempindex] & debsra = sraholder[tempindex] & debsdec = sdecholder[tempindex] & debflux = fluxholder[tempindex]
	for u = 0, n_elements(tempindex) - 1 do begin
	printf, lun5, debz[u], '  ',debsra[u], '  ',debsdec[u], '  ', debflux[u]
	endfor
	printf, lun5, '---------------------------------------------------'

	;Set the cluster to keep as the one with the highest flux
	;wz = [wz,zholder[clusterid]] & wsra = [wsra, sraholder[clusterid]] & wsdec = [wsdec, sdecholder[clusterid]]
	;wxpos = [wxpos, xposholder[clusterid]] & wypos = [wypos, yposholder[clusterid]] & wra = [wra, raholder[clusterid]]
	;wdec = [wdec, decholder[clusterid]] & wflux =[wflux, fluxholder[clusterid]] & wslicenum = [wslicenum, slicenumholder[clusterid]]

	test = n_elements(wz)	
	wz = [wz,zholder[where(fluxholder[*] eq useless)]] & wsra = [wsra, sraholder[where(fluxholder[*] eq useless)]] & wsdec = [wsdec, sdecholder[where(fluxholder[*] eq useless)]]
	wxpos = [wxpos, xposholder[where(fluxholder[*] eq useless)]] & wypos = [wypos, yposholder[where(fluxholder[*] eq useless)]] & wra = [wra, raholder[where(fluxholder[*] eq useless)]]
	wdec = [wdec, decholder[where(fluxholder[*] eq useless)]] & wflux =[wflux, fluxholder[where(fluxholder[*] eq useless)]] & wslicenum = [wslicenum, slicenumholder[where(fluxholder[*] eq useless)]]
	test2 = n_elements(wz)
	if test2 - test gt 1 then print, 'FUUUUUUUUUUCKKKKKKKKKKK'

	;These steps remove the clusters from the holder array
	junk = intarr(n_elements(raholder))
	inds = findgen(n_elements(raholder))
	cnt = 0
	if n_elements(tempindex) gt 1 then begin
		for x = 0, n_elements(raholder)-1 do begin
		if tempindex[cnt] eq x then begin
			junk[x] = x
			cnt = cnt + 1
		endif
		endfor
	endif else begin
	junk = 0
	endelse

	;Decide if we are out of clusters to compare	
	decision = where(inds ne junk)
	if decision[0] eq -1.0 then begin
	clustersremain = 'false' 
	endif else begin

	debug = debug + 1
	raholder = raholder[where(inds ne junk)] & decholder = decholder[where(inds ne junk)]
	zholder = zholder[where(inds ne junk)] & sraholder = sraholder[where(inds ne junk)]
	sdecholder = sdecholder[where(inds ne junk)] & xposholder = xposholder[where(inds ne junk)]
	yposholder = yposholder[where(inds ne junk)] & fluxholder = fluxholder[where(inds ne junk)]
	slicenumholder = slicenumholder[where(inds ne junk)]
	endelse

endwhile

;Sort the remaining clusters by redshift
sorted = sort(wz)
wz = wz[sorted] & wsra = wsra[sorted] & wsdec = wsdec[sorted] & wxpos = wxpos[sorted]
wypos = wypos[sorted] & wra = wra[sorted] & wdec = wdec[sorted] & wflux = wflux[sorted]
wslicenum = wslicenum[sorted]

;Write out the data file
openw, lun, '/chooyu1/muzzin/SpARCS/Lockman/foundclusters_I1I2/final_I1I2_clustercat_combined.cat', /get_lun
printf, lun, header
for x = 1, n_elements(wdec) - 1.0 do begin
printf, lun, format = '(f7.5, 1x, 2(a13, 2x), 5(f10.5, 1x), i3)',wz[x], wsra[x], wsdec[x], wxpos[x], wypos[x], wra[x], wdec[x], wflux[x], wslicenum[x]
endfor
free_lun, lun
free_lun, lun5 ;close logfile

end
