pro makefinalmaps_ELAISS1

;This program makes the final cluster density maps using the
;pre-computed colour weights, as well as the P(M) data from the
;file slicepmdata.dat

!p.multi = [0,1,1]

startslice = 25
endslice = 154

;Loop and make grids
for q = startslice, endslice do begin

slicenum = q

;Read in the weighted data
readweight_final_z_ELAISS1, ra, dec, zMI1, ezMI1, I1tot, eI1tot, mag_auto, emag_auto, weight, slicenum

;Read in red sequences from models
readfullsequences_newmodel_z, z, intercept, slope, xstar, ystar

minra = 6.00
mindec = -46.00
fieldsize = 6.0

;Read in the P(M) fitted data
openr, lun, '/chooyu1/muzzin/SpARCS/ELAIS-S1/zsliceweightszf40/slicepmdata.dat', /get_lun
header = strarr(2)
readf, lun, header
data = dblarr(5, n_elements(z))
readf, lun, data
free_lun, lun
pmslope = data[4,*]
pmint = data[3,*]
pmweight = dblarr(n_elements(I1tot))

;Calculate the angular size of a 125 kpc pixel at redshift of slice
angsz = angularsize(z[slicenum], 125.0)

;Set up grid
xgrid = fix((fieldsize*3600.0)/(angsz)) + 1
ygrid = fix((fieldsize*3600.0)/(angsz)) + 1
grid = fltarr(xgrid,ygrid)
grid2 = fltarr(xgrid, ygrid)

;Create the image with only galaxies in the colour slice
print, 'Setting up density grid,   Slice: ', slicenum
pixelsize = (fieldsize)/(fix((fieldsize*3600.0)/(angsz)) + 1)

for x = 0L, n_elements(ra)-1 do begin

;Make the map of all objects
grid2[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))] = grid2[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))]+ 1.0

;Set P(M) = P(M = -1.5) if objects are brighter than 1.5M*
if weight[x] gt 0.0 then begin
	if (I1tot[x]-xstar[slicenum]) lt -1.5 then $ 
	pmweight[x] = (-1.5)*pmslope[slicenum] + pmint[slicenum] $
	else pmweight[x] = (I1tot[x]-xstar[slicenum])*pmslope[slicenum] + pmint[slicenum]
	if pmweight[x] lt 0.0 then print, pmweight[x]
	grid[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))] = grid[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))]+ 1.0*weight[x]*pmweight[x]

endif

endfor

;Create the smoothing kernel
print, 'Creating smoothing kernel'
kernel = dblarr(200,200)
for x = 0, 199 do begin
	for y = 0, 199 do begin
		;kernel[x,y] = 1.96576*exp(-1.965*(sqrt(((x-200.0)/(3.79))^2 + ((y-200.0)/(3.79))^2)))
		kernel[x,y] = 0.55400953*exp(-1.965*(sqrt(((x-100.0)/(2.64))^2 + ((y-100.0)/(2.64))^2)))
	endfor
endfor

;Smooth the image with the kernel
print, 'Smoothing density map with kernel'
hind = convolve(grid, kernel, FT_PSF = psf_FT)

;Make bad pixel map
bpm = fltarr(xgrid, ygrid)
bpm[where(grid2 eq 0.0)] = 0.0
bpm[where(grid2 ne 0.0)] = 1.0

outmap = dblarr(n_elements(bpm[*,0]),n_elements(bpm[0,*]))
outmap[*,*] = 0.0

print, 'Cleaning Bad Pixel Mask'
;Clean bpm --remove graininess from higher resolution maps
for x = 1, n_elements(bpm[*,0]) -2.0 do begin
	for y = 1, n_elements(bpm[0,*]) -2.0 do begin
		muck = where(bpm[x-1:x+1,y-1:y+1] ne 0.0)
		if muck[0] ne -1.0 then outmap[x,y] = 1.0
	endfor
endfor

if q eq startslice then window, 1, xsize = 1300, ysize = 700, title = 'Density Map'
window, 1, xsize = 1100, ysize = 900, title = 'Density Map'
tvscl, hind
writefits, strcompress('/chooyu1/muzzin/SpARCS/ELAIS-S1/zclustermaps/' + 'cmap_slice' + string(slicenum) +'.fits', /remove_all), hind
;write_jpeg, strcompress('/chooyu1/muzzin/SpARCS/ELAIS-S1/zclustermaps/' + 'cmap_slice' + string(slicenum) +'.jpg', /remove_all), TVRD()

if q eq startslice then window, 2, xsize = 1300, ysize = 700, title = 'Bad Pixel Mask'
window, 2, xsize = 1100, ysize = 900, title = 'Bad Pixel Mask'
tvscl, outmap
writefits, strcompress('/chooyu1/muzzin/SpARCS/ELAIS-S1/zclustermaps/' + 'cmap_weightmap' + string(slicenum) +'.fits', /remove_all), outmap
;write_jpeg, strcompress('/chooyu1/muzzin/SpARCS/ELAIS-S1/zclustermaps/' + 'cmap_weightmap' + string(slicenum) +'.jpg', /remove_all), TVRD()

endfor

end
