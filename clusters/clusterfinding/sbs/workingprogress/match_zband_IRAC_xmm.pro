pro match_zband_IRAC

;Use this to match the optical catalogue to the IRAC catalogue

dxs_irac_cat = '/Users/shelly/XMM-LSS/MatchZ_IRAC/dxs_irac.cat'
zband_cat = '/Users/shelly/XMM-LSS/MatchZ_IRAC/final_z.cat'
out_cat = '/Users/shelly/XMM-LSS/MatchZ_IRAC/zband_matched_final.cat'

rdata = dblarr(18)
;file_lines('/chooyu1/muzzin/SpARCS/ELAIS-N2/z/zband_all_nooverlap_final_ext.cat')-1)

print, 'Reading z-band Catalogue file'
openr, lun, zband_cat, /get_lun

ngal_z = file_lines('/Users/shelly/XMM-LSS/MatchZ_IRAC/final_z.cat')
;ngal_z = 15000
print, 'Number of z-band sources:', ngal_z

num = dblarr(ngal_z) & rar = dblarr(ngal_z) & decr = dblarr(ngal_z)
apmag_176 = dblarr(ngal_z) & eapmag_176 = dblarr(ngal_z)
apmag_366 = dblarr(ngal_z) & eapmag_366 = dblarr(ngal_z)
mag_best = dblarr(ngal_z) & emag_best = dblarr(ngal_z)
star = dblarr(ngal_z) & sat_flag = dblarr(ngal_z)
ext = dblarr(ngal_z) & opmatchflag = dblarr(ngal_z)

for p = 0L, ngal_z-1 do begin
readf, lun, format = '(i5, 2(f14.8), 15(f11.4))', rdata

;print, rdata

rar[p] = rdata[1] & decr[p] = rdata[2]
apmag_176[p] = rdata[5] & eapmag_176[p] = rdata[8]
apmag_366[p] = rdata[6] & eapmag_366[p] = rdata[9]
mag_best[p] = rdata[13] & emag_best[p] = rdata[14]
star[p] = rdata[15] & sat_flag[p] = rdata[16]
ext[p] = rdata[17] & num = rdata[0]

endfor

free_lun, lun


nr = long(n_elements(rar))

print,'number of z-band sources',nr

; read in IRAC catalogue

isources = file_lines(dxs_irac_cat)
;isources = 15000

rai =  dblarr(isources) & deci = dblarr(isources) & magj = dblarr(isources)
magk = dblarr(isources) 

openr, lun, dxs_irac_cat, /get_lun

for p = 0L, isources-1 do begin

readf, lun, rai,rdeci,rmagj,rmagk,$
format = '(2(1x,f12.8), 2(1x,d11.4))' 


rai[p] = rrai & deci[p] = rdeci
magj[p] = rmagj & magk[p] = rmagk 
 
if p mod 10000 eq 0 then print, p/1000L, 'k  Read'

endfor

free_lun, lun

;sort IRAC catalogue

iracind = sort(deci)
rai = rai[iracind] & deci = deci[iracind]
magj = magj[iracind] & magk = magk[iracind] 


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

if eapmag_366[pt] gt 90 then eapmag_366[pt] = 99.99
if sat_flag[pt] gt 90 then sat_flag[pt] = 99.99

printf, lun5, num[pt], rar[pt], decr[pt], apmag_176[pt], eapmag_176[pt], $
apmag_366[pt], eapmag_366[pt], mag_best[pt], emag_best[pt], $
magj[i], magk[i], $
star[pt], sat_flag[pt], ext[pt], $
format = '(i8, 2(1x,f12.6), 6(1x, f6.3), 2(1x,f11.3), 3(1x,f6.3))' 

nmatch = nmatch + 1L

endif 

endfor

freelun, lun 
end
