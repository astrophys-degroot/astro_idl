pro match_zband_IRAC

;Use this to match the optical catalogue to the IRAC catalogue

;====================This is the zeropoint offset for CTIO fields=================
zp = 1.52

irac_cat = '~/originaldata/test_stellarbump/cdfs/I1_I2_matched_final.cat'
zband_cat = '~/originaldata/test_stellarbump/cdfs/zband_all_nooverlap_final_ext.cat'
out_cat = '~/originaldata/test_stellarbump/cdfs/zband_I1I2_matched_final.cat'

rdata = dblarr(18)
;numlines('/chooyu1/muzzin/SpARCS/ELAIS-N2/z/zband_all_nooverlap_final_ext.cat')-1)

print, 'Reading z-band Catalogue file'
openr, lun, zband_cat, /get_lun

ngal_z = numlines('~/originaldata/test_stellarbump/cdfs/zband_all_nooverlap_final_ext.cat')
;ngal_z = 15000
print, 'Number of z-band sources:', ngal_z

num = dblarr(ngal_z) & rar = dblarr(ngal_z) & decr = dblarr(ngal_z)
apmag_176 = dblarr(ngal_z) & eapmag_176 = dblarr(ngal_z)
apmag_366 = dblarr(ngal_z) & eapmag_366 = dblarr(ngal_z)
mag_best = dblarr(ngal_z) & emag_best = dblarr(ngal_z)
star = dblarr(ngal_z) & sat_flag = dblarr(ngal_z)
ext = dblarr(ngal_z) & opmatchflag = dblarr(ngal_z)

for p = 0L, ngal_z-1 do begin
readf, lun, format = '(i7, 2(f14.8), 15(f11.4))', rdata

;print, rdata

rar[p] = rdata[1] & decr[p] = rdata[2]
apmag_176[p] = rdata[5] & eapmag_176[p] = rdata[8]
apmag_366[p] = rdata[6] & eapmag_366[p] = rdata[9]
mag_best[p] = rdata[13] & emag_best[p] = rdata[14]
star[p] = rdata[15] & sat_flag[p] = rdata[16]
ext[p] = rdata[17] & num = rdata[0]

endfor

free_lun, lun

apmag_176 = apmag_176 + zp
apmag_366 = apmag_366 + zp
mag_best = mag_best + zp

nr = long(n_elements(rar))

print,'number of z-band sources',nr

; read in IRAC catalogue

isources = numlines(irac_cat)
;isources = 15000

ch1id = dblarr(isources) 
rai =  dblarr(isources) & deci = dblarr(isources) & ch1bf = dblarr(isources)
c1ebap = dblarr(isources) & c1_3pxapc = dblarr(isources) & c1_3pxerr = dblarr(isources)
ch2bf = dblarr(isources) & c2ebap = dblarr(isources) & c2_3pxapc = dblarr(isources)
c2_3pxerr = dblarr(isources)
c1_area = dblarr(isources) & c1_flag = intarr(isources)
c1_class = dblarr(isources) 
c2_area = dblarr(isources) & c2_flag = intarr(isources)
c2_class = dblarr(isources) 

openr, lun, irac_cat, /get_lun

for p = 0L, isources-1 do begin

readf, lun, rch1id, rrai,rdeci, rch1bf, rc1ebap, rc1_3pxapc, $
rc1_3pxerr, rch2bf, rc2ebap, rc2_3pxapc, rc2_3pxerr, rc1_flag, rc1_class, $
rc2_flag, rc2_class, format = '(i8, 2(1x,f12.6), 8(1x,f11.3), 4(1x,f6.3))' 


ch1id[p] = rch1id & rai[p] = rrai & deci[p] = rdeci
ch1bf[p] = rch1bf & c1ebap[p] = rc1ebap 
c1_3pxapc[p] = rc1_3pxapc & c1_3pxerr[p] = rc1_3pxerr 
ch2bf[p] = rch2bf & c2ebap[p] = rc2ebap 
c2_3pxapc[p] = rc2_3pxapc & c2_3pxerr[p] = rc2_3pxerr 
c1_flag[p] = rc1_flag & c1_class[p] = rc1_class 
c2_flag[p] = rc2_flag & c2_class[p] = rc2_class
 
if p mod 10000 eq 0 then print, p/1000L, 'k  Read'

endfor

free_lun, lun

;sort IRAC catalogue

iracind = sort(deci)
ch1id = ch1id[iracind] & rai = rai[iracind] & deci = deci[iracind]
ch1bf = ch1bf[iracind] & c1ebap = c1ebap[iracind] 
c1_3pxapc = c1_3pxapc[iracind] & c1_3pxerr = c1_3pxerr[iracind]
ch2bf = ch2bf[iracind] & c2ebap = c2ebap[iracind]
c2_3pxapc = c2_3pxapc[iracind] & c2_3pxerr = c2_3pxerr[iracind]
c1_flag = c1_flag[iracind] & c1_class = c1_class[iracind] 
c2_flag = c2_flag[iracind] & c2_class = c2_class[iracind]


print, 'Sorted IRAC catalogue'

nirac = long(n_elements(rai))

print,'number of IRAC sources (pre-match)',nirac

;Sort zband catalogue
index = sort(decr)
num = num[index]
rar = rar[index] & decr = decr[index]
apmag_176 = apmag_176[index] & eapmag_176 = eapmag_176[index]
apmag_366 = apmag_366[index] & eapmag_366 = eapmag_366[index]
mag_best = mag_best[index] & emag_best = emag_best[index]
star = star[index] & sat_flag = sat_flag[index]
ext = ext[index]

print, mean(ext), stdev(ext), min(ext), max(ext)

print,'Done sorting z-band catalogue'

; sort optical list in dec 

rars = dblarr(nr)

r_order = bsort(decr,decrs)

for j=0L, nr-1 do begin

rars[j] = rar[r_order[j]]

endfor

!p.multi = [0,1,2]
plot, rai, deci, psym = 3.0
plot, rar, decr, psym = 3.0
; match irac, r. r1 is the initial match radius
; nprev is the number of R-band sources prior to the current
; source to start looking for a match. 

i=0L
p=0L
pt=0L
nprev=1000L
npost=1000L
nmatch=0L
nmultiple=0L
nid=-1
nfl=99.99
nchar = '9.999'
start=0L
iracstart = 0L

; set matching radius in degrees (1"=0.000278deg)

;r1=0.00033 ;One IRAC Pixel
;r1 = 0.000555556 ; 2 Arcsec
;r1 = 0.000139 ; 0.5 Arcsec
r1 = 0.00050874 ; 1.5 IRAC pixels
;r1 = 0.00066 ; 2.0 IRAC pixels

print, 'Matching with 2 IRAC pixel (2.44") search radius'

; find the index corresponding to the lowest dec IRAC source

repeat start=start+1 until (decr[start] gt (deci[0]-r1))

print,'starting from ',start,' in the sorted IRAC2 catalogue'

p = start+long(nprev/2L)

openw, lun5, out_cat, /get_lun
 
for i= 0L, nirac -1 do begin

; set up subsection of optical catalogue to search for IRAC ID

nstart = p - nprev

if nstart lt 0 then nstart=0L

        nend = p + npost

        if nend gt nr - 1 then nend = nr - 1L

        rasub = rars[nstart:nend]

        decsub = decrs[nstart:nend] 

; now make up arrays of position differences

	radiff = (rasub - rai[i])*cos(deci[i]*!pi/180.)	

	d = sqrt(radiff*radiff + (decsub - deci[i])*(decsub - deci[i]))

	ptr = where(d lt r1)


if total(ptr) ne -1 then begin

; set the index to the pointer plus nstart

        p=ptr[0]+nstart

; Deal with multiple matches by taking the nearest

        if (n_elements(ptr) gt 1 ) then begin

       ;print,'multiple match, taking nearest', i

        nmultiple = nmultiple + 1L

        nmult = n_elements(ptr)

        for j=1,nmult -1 do begin

                if d[ptr[j]] le d[ptr[0]] then p=ptr[j]+nstart

        endfor

endif

if p mod 10000 eq 0 then print, p/1000L, 'k  Done'

; pt is the pointer back to the original list

	pt = r_order[p]


flagr=1
opmatchflag[pt] = 1.0

; write out the matches:

;rar = data[1,*] & decr = data[2,*]
;apmag_176 = data[5,*] & eapmag_176 = data[8,*]
;apmag_366 = data[6,*] & eapmag_366 = data[9,*]
;mag_best = data[13,*] & emag_best = data[14,*]
;star = data[15,*] & sat_flag = data[16,*]
;ext = data[17,*]

if eapmag_366[pt] gt 90 then eapmag_366[pt] = 99.99
if sat_flag[pt] gt 90 then sat_flag[pt] = 99.99

printf, lun5, num[pt], rar[pt], decr[pt], apmag_176[pt], eapmag_176[pt], $
apmag_366[pt], eapmag_366[pt], mag_best[pt], emag_best[pt], $
ch1bf[i], c1ebap[i], c1_3pxapc[i], c1_3pxerr[i], $
ch2bf[i], c2ebap[i], c2_3pxapc[i], c2_3pxerr[i], $
star[pt], sat_flag[pt], c1_flag[i], c1_class[i], c2_flag[i], c2_class[i], ext[pt], $
format = '(i8, 2(1x,f12.6), 6(1x, f6.3), 8(1x,f11.3), 7(1x,f6.3))' 

nmatch = nmatch + 1L

endif else begin

; if no match found, write nulls

flagr=0

nid = 99.99
nsat = -1.0

printf, lun5, ch1id[i], rai[i], deci[i], $
nid, nid, nid, nid, nid, nid, $
ch1bf[i], c1ebap[i], c1_3pxapc[i], c1_3pxerr[i], $
ch2bf[i], c2ebap[i], c2_3pxapc[i], c2_3pxerr[i], $
nsat, nsat, c1_flag[i], c1_class[i], c2_flag[i], c2_class[i], nsat,$
format = '(i8, 2(1x,f12.6), 6(1x, f6.3), 8(1x,f11.3), 7(1x,f6.3))' 

endelse

endfor

free_lun, lun5

print,'no. of z-band sources= ',nr
print,'no. of IRAC sources= ', nirac
print,'no. of z-band sources matched to IRAC list= ',nmatch
print,'no. of IRAC sources with multiple z-band matches= ',nmultiple

;Make z-band only objects objects
print, 'Writing optical Non-match Catalogue'
openw, lun, '~/originaldata/test_stellarbump/cdfs/zband_nonmatch.cat', /get_lun

for x = 0L, ngal_z-1 do begin
	if opmatchflag[x] eq 0.0 then begin

	printf, lun, num[x], rar[x], decr[x], nid, nid, apmag_176[x], eapmag_176[x], $ 
	apmag_366[x], eapmag_366[x], mag_best[x], emag_best[x], $ 
	nsat, nsat, star[x], $
	sat_flag[x], ext[x], $
	format = '(i8, 2(1x,f12.6), 8(1x,f11.3), 5(1x,f6.3))' 
     endif
endfor

print, mean(ext), stdev(ext), min(ext), max(ext)
free_lun, lun
end
