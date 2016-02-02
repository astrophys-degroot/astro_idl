pro makecat_zband_IRAC

gal = numlines('zband_I1I2_matched_final.cat')
;gal = 1500

num = dblarr(gal) & rar= dblarr(gal) &  decr= dblarr(gal) & apmag_176= dblarr(gal) & eapmag_176 = dblarr(gal)
apmag_366= dblarr(gal) & eapmag_366= dblarr(gal) & mag_best= dblarr(gal) & emag_best= dblarr(gal)
ch1bf= dblarr(gal) & c1ebap= dblarr(gal) & c1_3pxapc= dblarr(gal) & c1_3pxerr= dblarr(gal)
ch2bf= dblarr(gal) &  c2ebap= dblarr(gal) & c2_3pxapc= dblarr(gal) & c2_3pxerr= dblarr(gal)
star= dblarr(gal) & sat_flag= dblarr(gal) & c1_flag= dblarr(gal) & c1_class= dblarr(gal) & c2_flag= dblarr(gal) & c2_class = dblarr(gal)
ext = dblarr(gal)

openr, lun5, 'zband_I1I2_matched_final.cat', /get_lun
rdata = dblarr(24)
for i = 0L, gal-1 do begin

if i mod 10000 eq 0 then print, i/1000L, 'k  Read'

;============If there is a failure here because of **** use XEMACS to fix it
readf, lun5, rdata, $
format = '(i8, 2(1x,f12.6), 6(1x, f6.3), 8(1x,f11.3), 7(1x,f6.3))' 

rar[i] = rdata[1] &  decr[i] = rdata[2] & apmag_176[i] = rdata[3] & eapmag_176[i] = rdata[4]
apmag_366[i] = rdata[5] & eapmag_366[i] = rdata[6] & mag_best[i] = rdata[7] & emag_best[i] = rdata[8]
ch1bf[i] = rdata[9] & c1ebap[i] = rdata[10] & c1_3pxapc[i] = rdata[11] & c1_3pxerr[i] = rdata[12]
ch2bf[i] = rdata[13] & c2ebap[i] = rdata[14] & c2_3pxapc[i] = rdata[15] & c2_3pxerr[i] = rdata[16]
star[i] = rdata[17] & sat_flag[i] = rdata[18] & c1_flag[i] = rdata[19] & c1_class[i] = rdata[20] & c2_flag[i] = rdata[21] & c2_class[i] = rdata[22]
ext[i] = rdata[23]

endfor

free_lun, lun5

;useful = where( (star lt 0.9) and ( (sat_flag lt 2 and c1_flag lt 4) or (sat_flag lt 4 and c1_flag lt 4)

junk = where( (star gt 0.9) or (sat_flag gt 2 and c1_flag gt 2) or (c2_flag gt 2 and c1_flag gt 2) or $
(sat_flag gt 2 and c2_flag gt 2), complement = useful)

;extinction correct
apmag_366 = apmag_366 - ext*1.479
apmag_176 = apmag_176 - ext*1.479
mag_best = mag_best - ext*1.479

;AB to VEGA correct
apmag_366 = apmag_366 - 0.4898
apmag_176 = apmag_176 - 0.4898
mag_best = mag_best - 0.4898

;Convert IRAC to magnitudes

pch1_bf = (-2.512*alog10((ch1bf+c1ebap)/(277500000.0)) )
ch1bf = -2.512*alog10((ch1bf)/(277500000.0))
c1ebap = ch1bf - pch1_bf

pc1_3pxapc = (-2.512*alog10((c1_3pxapc+c1_3pxerr)/(277500000.0)) )
c1_3pxapc = -2.512*alog10((c1_3pxapc)/(277500000.0))
c1_3pxerr = c1_3pxapc - pc1_3pxapc

pch2_bf = (-2.512*alog10((ch2bf+c2ebap)/(179700000.0)) )
ch2bf = -2.512*alog10((ch2bf)/(179700000.0))
c2ebap = ch2bf - pch2_bf

pc2_3pxapc = (-2.512*alog10((c2_3pxapc+c2_3pxerr)/(179700000.0)) )
c2_3pxapc = -2.512*alog10((c2_3pxapc)/(179700000.0))
c2_3pxerr = c2_3pxapc - pc2_3pxapc

openw, lun, 'ELAISS1_finalzIRAC.cat', /get_lun

cnt = 0.0
writeu, lun, cnt
writeu, lun, rar[useful]
writeu, lun, decr[useful]
writeu, lun, apmag_176[useful]
writeu, lun, eapmag_176[useful]
writeu, lun, apmag_366[useful]
writeu, lun, eapmag_366[useful]
writeu, lun, mag_best[useful]
writeu, lun, emag_best[useful]
writeu, lun, ch1bf[useful]
writeu, lun, c1ebap[useful]
writeu, lun, c1_3pxapc[useful]
writeu, lun, c1_3pxerr[useful]
writeu, lun, ch2bf[useful]
writeu, lun, c2ebap[useful]
writeu, lun, c2_3pxapc[useful]
writeu, lun, c2_3pxerr[useful]

free_lun, lun

print, 'Number of useful objects:', n_elements(useful)

end
