pro findclusters_sextract_I1I2

;This code uses sextractor to find peaks in a cluster density map
;A bad pixel mask is used for each density map to make sure that only
;read pixels are included in the background.  The clusters are output to a file

;Read in red sequences from models
readfullsequences_newmodel_I1I2, z, intercept, slope, xstar, ystar

openw, lun, '/chooyu1/muzzin/SpARCS/ELAIS-S1/foundclusters_I1I2/highz_sex_cluster_cat.cat', /get_lun
printf, lun, '   z         RA            DEC          RA-BCG     DEC-BCG      RA         DEC       Flux   Slice'
printf, lun, '---------------------------------------------------------------------------------------------------'

minra = 6.0
mindec = -46.0
fieldsize = 5.0

;slicenum = 70
startslice = 65
endslice = 94
use_noise = 'false'

sex_path = '/home/muzzin/sextractor/sextractor-2.3.2/src/'
image_path = '/chooyu1/muzzin/SpARCS/ELAIS-S1/I1I2clustermaps/'

for slicenum = startslice, endslice do begin

xpos = -100 ; Removes images with no detections
ypos = -100

if (use_noise eq 'false') then command_line = sex_path +'sex ' + strcompress(image_path+'cmap_slice'+string(slicenum)+'.fits', /remove_all) + $
' -c ' + image_path+'clusterfind.sex' + ' -WEIGHT_IMAGE ' + strcompress(image_path+'cmap_weightmap'+string(slicenum)+'.fits', /remove_all) + $
' -PARAMETERS_NAME ' + image_path+'default.param' + ' -FILTER_NAME ' + image_path+'default.conv' + ' -CATALOG_NAME ' + $
image_path + 'test.cat'

if (use_noise eq 'true') then command_line = sex_path +'sex ' + strcompress(image_path+'cmap_finalmap'+string(slicenum)+'.fits', /remove_all) + $
' -c ' + image_path+'clusterfind.sex' + ' -WEIGHT_IMAGE ' + strcompress(image_path+'cmap_weightmap'+string(slicenum)+'.fits', /remove_all) + $
' -PARAMETERS_NAME ' + image_path+'default.param' + ' -FILTER_NAME ' + image_path+'default.conv' + ' -CATALOG_NAME ' + $
image_path + 'test.cat'

print, command_line
spawn, command_line

if (use_noise eq 'false') then image = Readfits(strcompress('/chooyu1/muzzin/SpARCS/ELAIS-S1/I1I2clustermaps/cmap_slice'+string(slicenum)+'.fits', /remove_all))
if (use_noise eq 'true') then image = Readfits(strcompress('/chooyu1/muzzin/SpARCS/ELAIS-S1/I1I2clustermaps/cmap_finalmap'+string(slicenum)+'.fits', /remove_all))

readcol, '/chooyu1/muzzin/SpARCS/ELAIS-S1/I1I2clustermaps/test.cat', cnum, flux_3px, flux_5px, eflux_3px, eflux_5px, flux_auto, eflux_auto,  $
xpos, ypos, flags, skipline = 8, format='(i,d,d,d,d,d,d,d,d,i)

if slicenum eq startslice then window, 0, xsize = 1200, ysize = 1000, title = 'Clustermap' + '   z =' + string(z[slicenum]) + '  Slice: '+  strcompress(string(slicenum) +'/' + string(endslice), /remove_all)
tvscl, image
tvcircle, 6.0, xpos, ypos

;Make an RA and DEC from .fits pixel positions

if xpos[0] ne -100 then begin

;Calculate the angular size of a 125 kpc pixel at redshift of slice
angsz = angularsize(z[slicenum], 125.0)
angsz2 = angularsize(z[slicenum], 500.0)/3600.0

pixelsize = (fieldsize)/(fix((fieldsize*3600.0)/(angsz)) + 1)

cdec = ypos*pixelsize + mindec
cra = ((xpos*pixelsize)/(cos(cdec*!pi/180.0))) + minra

;Read in weights (for getting BCG centroid)
readweight_final_I1I2_ELAISS1, ra, dec, I1MI2, eI1MI2, I2tot, eI2tot, I1tot, eI1tot, weight, slicenum

raBCG = dblarr(n_elements(cra))
decBCG = dblarr(n_elements(cra))

;Select the brightest galaxy within 500 kpc with a weight higher than 0.4

if xpos[0] ne -1 then begin

;Remove clusters detected out of bounds - Rare, just in low background, high-z maps

good_clusters = findgen(n_elements(cra))
for q = 0, n_elements(cra) -1 do begin
check_posra = where( sqrt( ((ra-cra[q])*cos(dec*!pi/180.0))^2 + (dec-cdec[q])^2) lt angsz2)
check_posdec = where( sqrt( ((ra-cra[q])*cos(dec*!pi/180.0))^2 + (dec-cdec[q])^2) lt angsz2)
if check_posra[0] eq -1.0 or check_posdec[0] eq -1.0 then begin
	good_clusters = good_clusters[where(good_clusters ne q)]
	print, 'Removed Bad cluster:', q
endif
endfor

cra = cra[good_clusters]
cdec = cdec[good_clusters]
flux_5px = flux_5px[good_clusters]
eflux_5px = eflux_5px[good_clusters]
flux_auto = flux_auto[good_clusters]

for q = 0, n_elements(cra) -1 do begin

temp_ra = ra[where( sqrt( ((ra-cra[q])*cos(dec*!pi/180.0))^2 + (dec-cdec[q])^2) lt angsz2)]
temp_dec = dec[where( sqrt( ((ra-cra[q])*cos(dec*!pi/180.0))^2 + (dec-cdec[q])^2) lt angsz2)]
temp_weight = weight[where( sqrt( ((ra-cra[q])*cos(dec*!pi/180.0))^2 + (dec-cdec[q])^2) lt angsz2)]
temp_mags = I2tot[where( sqrt( ((ra-cra[q])*cos(dec*!pi/180.0))^2 + (dec-cdec[q])^2) lt angsz2)]

temp_check = where(temp_weight gt 0.4)
if temp_check[0] ne -1.0 then begin ; Picking a BCG only works if there is one :)
	temp_ra = temp_ra[where(temp_weight gt 0.4)]
	temp_dec = temp_dec[where(temp_weight gt 0.4)]
	temp_mags = temp_mags[where(temp_weight gt 0.4)]
	junk = min(temp_mags, magindex)
	raBCG[q] = temp_ra[magindex]
	decBCG[q] = temp_dec[magindex]
endif else begin
	raBCG[q] = cra[q]
	decBCG[q] = cdec[q]
endelse

endfor

endif else begin
raBCG = 300.0
decBCG = 60.0
endelse

;Convert RA and DEC to sexidecimal

radec, raBCG, decBCG, ihr, imin, xsec, ideg, imn, xsc

ximin = strarr(n_elements(raBCG))
ximn = strarr(n_elements(raBCG))
xxsec = strarr(n_elements(raBCG))
xxsc = strarr(n_elements(raBCG))

for p = 0, n_elements(raBCG)-1 do begin
if strlen(strcompress(string(imin[p]), /remove_all)) lt 2 then ximin[p] = '0'+string(imin[p]) else ximin[p] = string(imin[p])
if strlen(strcompress(string(imn[p]), /remove_all)) lt 2 then ximn[p] = '0'+string(imn[p]) else ximn[p] = string(imn[p])
if strpos(strcompress(string(xsec[p]), /remove_all), '.') lt 2 then xxsec[p] = '0'+string(xsec[p]) else xxsec[p] = string(xsec[p])
if strpos(strcompress(string(xsc[p]), /remove_all), '.') lt 2 then xxsc[p] = '0'+string(xsc[p]) else xxsc[p] = string(xsc[p])

endfor

sra = strcompress(string(ihr)+':'+ximin+':'+xxsec, /remove_all)
sdec = strcompress(string(ideg)+':'+ximn+':'+xxsc, /remove_all)

for p = 0, n_elements(cra)-1 do begin
printf, lun, format = '(f7.5, 1x, 2(a13, 2x), 5(f10.5, 1x), i3)',z[slicenum], sra[p], sdec[p], raBCG[p], decBCG[p], cra[p], cdec[p], flux_5px[p], slicenum
endfor

endif ; (don't print if no objects found)

endfor ; (cluster finding loop)

free_lun, lun
end
