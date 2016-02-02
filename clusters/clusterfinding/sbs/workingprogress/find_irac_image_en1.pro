pro find_irac_image

;====Use this to make a combined, congrided image

iracdir = '/chooyu1/muzzin/SpARCS/ELAIS-N1/IRAC/'

iracimages = ['swire_EN1_I1_tile_1_1_v2_cov.fits', $
'swire_EN1_I1_tile_1_2_v2_cov.fits', $
'swire_EN1_I1_tile_1_3_v2_cov.fits', $
'swire_EN1_I1_tile_1_4_v2_cov.fits', $
'swire_EN1_I1_tile_2_1_v2_cov.fits', $
'swire_EN1_I1_tile_2_2_v2_cov.fits', $
'swire_EN1_I1_tile_2_3_v2_cov.fits', $
'swire_EN1_I1_tile_2_4_v2_cov.fits', $
'swire_EN1_I1_tile_3_1_v2_cov.fits', $
'swire_EN1_I1_tile_3_2_v2_cov.fits', $
'swire_EN1_I1_tile_3_3_v2_cov.fits', $
'swire_EN1_I1_tile_3_4_v2_cov.fits', $
'swire_EN1_I1_tile_4_1_v2_cov.fits', $
'swire_EN1_I1_tile_4_2_v2_cov.fits', $
'swire_EN1_I1_tile_4_3_v2_cov.fits', $
'swire_EN1_I1_tile_4_4_v2_cov.fits']

iracimages_out = ['swire_EN1_I1_tile_1_1_v2_mosaic.fits', $
'swire_EN1_I1_tile_1_2_v2_mosaic.fits', $
'swire_EN1_I1_tile_1_3_v2_mosaic.fits', $
'swire_EN1_I1_tile_1_4_v2_mosaic.fits', $
'swire_EN1_I1_tile_2_1_v2_mosaic.fits', $
'swire_EN1_I1_tile_2_2_v2_mosaic.fits', $
'swire_EN1_I1_tile_2_3_v2_mosaic.fits', $
'swire_EN1_I1_tile_2_4_v2_mosaic.fits', $
'swire_EN1_I1_tile_3_1_v2_mosaic.fits', $
'swire_EN1_I1_tile_3_2_v2_mosaic.fits', $
'swire_EN1_I1_tile_3_3_v2_mosaic.fits', $
'swire_EN1_I1_tile_3_4_v2_mosaic.fits', $
'swire_EN1_I1_tile_4_1_v2_mosaic.fits', $
'swire_EN1_I1_tile_4_2_v2_mosaic.fits', $
'swire_EN1_I1_tile_4_3_v2_mosaic.fits', $
'swire_EN1_I1_tile_4_4_v2_mosaic.fits']

for x = 0, n_elements(iracimages)-1 do begin
iracheader = headfits(strcompress(iracdir+iracimages_out[x], /remove_all))
iracimage = readfits(strcompress(iracdir+iracimages_out[x], /remove_all))

junk = where(iracimage gt 0.00001)
junk1 = array_indices(iracimage, junk)

iracimage[*,*] = 0.0
iracimage[junk1[0,*], junk1[1,*]] = x+1

;print, junk1[0,*]
outimname = strcompress(iracdir+'small'+iracimages_out[x], /remove_all)

HCONGRID, iracimage, iracheader, outim, outimheader, n_elements(iracimage[0,*])/10.0, n_elements(iracimage[*,0])/10.0, /HALF_HALF
writefits, outimname, outim, outimheader

;xpos = [min(junk1[0,*]), max(junk1[0,*])]
;ypos = [min(junk1[1,*]), max(junk1[1,*])]

;print, xpos
;print, ypos

;xyad, iracheader, xpos[0], ypos[0], imra1, imdec1
;xyad, iracheader, xpos[1], ypos[1], imra2, imdec2

;printf, lun2, iracimages_out[x], imra1, imdec1, imra2, imdec2, format = '(a40, 4(f11.5))'

endfor

end
