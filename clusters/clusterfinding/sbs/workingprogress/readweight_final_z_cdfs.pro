Pro readweight_final_z_cdfs, rar, decr, zMI1, ezMI1, I1tot, eI1tot, mag_auto, emag_auto, weight, slicenum

print, 'CDFS: Using z 3" mags & IRAC 3 pixel mags'

galtot = 312103
;galtot = 149474

filename = 'slice' + string(slicenum) + 'weights.dat'
openr, lun2, strcompress('zsliceweightszf40/' + filename, /remove_all), /get_lun

print, 'NUMBER OF GALAXIES IN WEIGHT FILE:',galtot
print, '---------------BEWARE-------------' 

rar = dblarr(galtot) & decr = dblarr(galtot)
zMI1 = dblarr(galtot) & ezMI1 = dblarr(galtot) & I1tot = dblarr(galtot) & eI1tot = dblarr(galtot)
mag_auto = dblarr(galtot) & emag_auto = dblarr(galtot)
weight = dblarr(galtot)
cnt = double(0) & q = 0

readu, lun2, cnt
readu, lun2, rar
readu, lun2, decr
readu, lun2, zMI1
readu, lun2, ezMI1
readu, lun2, I1tot
readu, lun2, eI1tot
readu, lun2, mag_auto
readu, lun2, emag_auto
readu, lun2, weight

free_lun, lun2

return
end
