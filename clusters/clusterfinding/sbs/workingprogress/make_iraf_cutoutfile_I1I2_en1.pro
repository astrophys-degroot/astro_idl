pro make_iraf_cutoutfiles_I1I2

catfile = '/chooyu1/muzzin/SpARCS/ELAIS-N1/foundclusters_I1I2/final_ELAISN1_fields.cat'
readcol, catfile, z, sra, sdec, xpos, ypos, ra, dec, flux, slicenum, kpno_field, irac1_field, $
format = 'd, a, a, d, d, d, d, d, i, a, a)', skipline = 2

openw, lun, '/chooyu1/muzzin/SpARCS/ELAIS-N1/z/I1I2_zband_images_in.lst', /get_lun
openw, lun2, '/chooyu1/muzzin/SpARCS/ELAIS-N1/IRAC/I1I2_irac1_images_in.lst', /get_lun
openw, lun3, '/chooyu1/muzzin/SpARCS/ELAIS-N1/z/I1I2_zband_images_out.lst', /get_lun
openw, lun4, '/chooyu1/muzzin/SpARCS/ELAIS-N1/IRAC/I1I2_irac1_images_out.lst', /get_lun

irac1pixscale = 0.61
zpixscale = 0.185

for x = 0, n_elements(irac1_field) -1 do begin

zheader = headfits( strcompress('/chooyu1/muzzin/SpARCS/ELAIS-N1/z/'+kpno_field[x], /remove_all))
;.r angularsize
angsz = angularsize(z[x], 1000.0)
adxy, zheader, xpos[x], ypos[x], zxpos_tmp, zypos_tmp
zxposll = zxpos_tmp - (angsz/zpixscale)
zxposur = zxpos_tmp + (angsz/zpixscale)
zyposll = zypos_tmp - (angsz/zpixscale)
zyposur = zypos_tmp + (angsz/zpixscale)

if zxposll lt 1 then zxposll = 1
if zyposll lt 1 then zyposll = 1
if zxposur gt 20000 then zxposur = 20000
if zyposur gt 20000 then zyposur = 20000

zxposll = round(zxposll)
zxposur = round(zxposur)
zyposll = round(zyposll)
zyposur = round(zyposur)

irac1header = headfits( strcompress('/chooyu1/muzzin/SpARCS/ELAIS-N1/IRAC/'+irac1_field[x], /remove_all))
;junk_image = readfits(strcompress('/chooyu1/muzzin/SpARCS/ELAIS-N1/IRAC/'+irac1_field[x], /remove_all))
imsizex = 8430 ;n_elements(junk_image[*,0])
imsizey = 8300 ;n_elements(junk_image[0,*])
angsz = angularsize(z[x], 1000.0)
adxy, irac1header, xpos[x], ypos[x], irac1xpos_tmp, irac1ypos_tmp
irac1xposll = irac1xpos_tmp - (angsz/irac1pixscale)
irac1xposur = irac1xpos_tmp + (angsz/irac1pixscale)
irac1yposll = irac1ypos_tmp - (angsz/irac1pixscale)
irac1yposur = irac1ypos_tmp + (angsz/irac1pixscale)

if irac1xposll lt 1 then irac1xposll = 1
if irac1yposll lt 1 then irac1yposll = 1

if irac1xposur gt imsizex then irac1xposur = imsizex
if irac1yposur gt imsizey then irac1yposur = imsizey

irac1xposll = round(irac1xposll)
irac1xposur = round(irac1xposur)
irac1yposll = round(irac1yposll)
irac1yposur = round(irac1yposur)


print, irac1yposur

printf, lun, string(strcompress(kpno_field[x]+'['+string(zxposll)+':'+string(zxposur)+','+string(zyposll)+':'+string(zyposur)+']', /remove_all))
printf, lun2, string(strcompress(irac1_field[x]+'['+string(irac1xposll)+':'+string(irac1xposur)+','+string(irac1yposll)+':'+string(irac1yposur)+']', /remove_all))
printf, lun3, strcompress('z_cluster'+string(x)+'.fits', /remove_all)
printf, lun4, strcompress('irac1_cluster'+string(x)+'.fits', /remove_all)

endfor

free_lun, lun
free_lun, lun2
free_lun, lun3
free_lun, lun4

end
