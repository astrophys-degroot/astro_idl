pro make_iraf_cutoutfiles

catfile = '/chooyu1/muzzin/SpARCS/CDFS/foundclusters_z/final_CDFS_fields.cat'
readcol, catfile, z, sra, sdec, xpos, ypos, ra, dec, flux, slicenum, kpno_field, irac1_field, $
format = 'd, a, a, d, d, d, d, d, i, a, a)', skipline = 2

openw, lun, '/chooyu1/muzzin/CTIO_data/CDFS_photometry/zband_images_in.lst', /get_lun
openw, lun2, '/chooyu1/muzzin/SpARCS/CDFS/IRAC/irac1_images_in.lst', /get_lun
openw, lun3, '/chooyu1/muzzin/CTIO_data/CDFS_photometry/zband_images_out.lst', /get_lun
openw, lun4, '/chooyu1/muzzin/SpARCS/CDFS/IRAC/irac1_images_out.lst', /get_lun

irac1pixscale = 0.61
zpixscale = 0.27

for x = 0, n_elements(irac1_field) -1 do begin

zheader = headfits( strcompress('/chooyu1/muzzin/CTIO_data/CDFS_photometry/'+kpno_field[x], /remove_all))
angsz = angularsize(z[x], 1000.0)
adxy, zheader, xpos[x], ypos[x], zxpos_tmp, zypos_tmp
zxposll = zxpos_tmp - (angsz/zpixscale)
zxposur = zxpos_tmp + (angsz/zpixscale)
zyposll = zypos_tmp - (angsz/zpixscale)
zyposur = zypos_tmp + (angsz/zpixscale)

if zxposll lt 1 then zxposll = 1
if zyposll lt 1 then zyposll = 1
if zxposur gt 8600 then zxposur = 8600
if zyposur gt 8600 then zyposur = 8600

zxposll = round(zxposll)
zxposur = round(zxposur)
zyposll = round(zyposll)
zyposur = round(zyposur)

irac1header = headfits( strcompress('/chooyu1/muzzin/SpARCS/CDFS/IRAC/'+irac1_field[x], /remove_all))
angsz = angularsize(z[x], 1000.0)
adxy, irac1header, xpos[x], ypos[x], irac1xpos_tmp, irac1ypos_tmp
irac1xposll = irac1xpos_tmp - (angsz/irac1pixscale)
irac1xposur = irac1xpos_tmp + (angsz/irac1pixscale)
irac1yposll = irac1ypos_tmp - (angsz/irac1pixscale)
irac1yposur = irac1ypos_tmp + (angsz/irac1pixscale)

if irac1xposll lt 1 then irac1xposll = 1
if irac1yposll lt 1 then irac1yposll = 1
if irac1xposur gt 4750 then irac1xposur = 4750
if irac1yposur gt 5250 then irac1yposur = 5250

irac1xposll = round(irac1xposll)
irac1xposur = round(irac1xposur)
irac1yposll = round(irac1yposll)
irac1yposur = round(irac1yposur)


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
