pro makeweight_z

;This program makes weights for galaxies for each model colour slice
;These weights are stored in the /sliceweightszfxx/ directory
;========================If there is a problem i.e. weights are negative... need to use
;the GAUSS_REDSEQUENCE function for integration


!p.multi = [0,1,1]

;Read in the galaxies
;readcat_final, ra, dec, c1_bf, c1_ebf, c1_3pxapc, c1_e3pxapc, ch1bf1, ch1ebf1, ch2bf1, $
;ch2ebf1, ch3bf1, ch3ebf1, ch4bf1, ch4ebf1, r_apmag, r_eapmag, rmag_auto, remag_auto, ext, mips_flux, mips_eflux

;read_zIRAC_cat, rar, decr, apmag_366, eapmag_366, mag_auto, emag_auto, ch1bf, c1ebap, c1_3pxapc, c1_3pxerr

read_zIRAC_finalcat_LOCKMAN, rar, decr, apmag_176, eapmag_176, apmag_366, eapmag_366, mag_best, emag_best, ch1bf, c1ebap, c1_3pxapc, c1_3pxerr, ch2bf, c2ebap, c2_3pxapc, c2_3pxerr


;===================BECAUSE WE ARE INCLUDING IRAC2, NEED TO CULL GALAXIES (MOST LIKELY STARS) WHICH
;ARE SATURATED IN z, BUT NOT IRAC1+IRAC2.................

zcull = where(apmag_366 lt 90 and apmag_366 gt 15 and ch1bf lt 50)

print, n_elements(zcull)

rar = rar[zcull]
decr = decr[zcull]
apmag_366 = apmag_366[zcull]
eapmag_366 = eapmag_366[zcull]
c1_3pxapc = c1_3pxapc[zcull]
c1_3pxerr = c1_3pxerr[zcull]
ch1bf = ch1bf[zcull]
c1ebap = c1ebap[zcull]
mag_best = mag_best[zcull]
emag_best = emag_best[zcull]

;New computation
zMI1 = apmag_366 - c1_3pxapc
ezMI1 = sqrt(eapmag_366^2 + c1_3pxerr^2)
I1tot = ch1bf
eI1tot = c1ebap

;Read in red sequences from models
readfullsequences_newmodel_z, z, intercept, slope, xstar, ystar
dispersion = dblarr(n_elements(z))
bigz = where(z ge 1.5)
midz = where(z ge 1.2 and z lt 1.5)
littlez =  where(z lt 1.2)
dispersion[bigz] = 0.15
dispersion[littlez] = 0.075
dispersion[midz] = 0.10

;++++++OLD MODELS
;;Read in red sequences from models
;readfullsequences_z, z, intercept, slope, xstar, ystar
;dispersion = dblarr(n_elements(z))
;bigz = where(z ge 1.2)
;littlez =  where(z lt 1.2)
;dispersion[bigz] = 0.15
;dispersion[littlez] = 0.075 

openw, lun6, 'zsliceweightszf40/zsliceindexzf40.dat', /get_lun
printf, lun6, '   z         Slice #      IRAC1star'
printf, lun6, '-----------------------------------'

startslice = 25
endslice = 161
;Loop and compute weights
;for q = 0, n_elements(intercept)- 1 do begin

for q = startslice, endslice do begin

;This is the red sequence fit by the clusterCMD and cmd pros
redseq = fltarr(2)
redseq[0] = intercept[q]
redseq[1] = slope[q]

xpnt = [10, 30]
ypnt = [xpnt*redseq[1]+redseq[0]]
if q eq 0 then window, 0, xsize = 600, ysize = 600, title = 'Colour Slice'
plot, xpnt, ypnt, yrange = [intercept[q]-2.5, intercept[q]+2.0], ystyle = 1.0, xrange = [xstar[q] - 6.0, xstar[q] + 6.0], xstyle = 1.0
oplot, xpnt, ypnt+dispersion[q], linestyle = 2.0
oplot, xpnt, ypnt-dispersion[q], linestyle = 2.0
oplot, I1tot, zMI1, psym = 3.0

;Create the image with only galaxies in the colour slice
print, 'Setting up density grid,   Slice: ', q
cmdplot = [0,0]
weight = dblarr(n_elements(rar))
for x = 0L, n_elements(rar)-1 do begin
	
	;If the object is in the colour slice - Compute weight
	if ( (zMI1[x]) ge (redseq[1]*I1tot[x]+redseq[0]-dispersion[q])) and $
	( (zMI1[x]) le (redseq[1]*I1tot[x]+redseq[0]+dispersion[q])) and $ 
	(I1tot[x] le xstar[q] +4.0) then begin

	val = (zMI1[x])
	siggie = ezMI1[x]
	openw, lun5, 'gval.tmp', /get_lun
	printf, lun5, val, siggie
	free_lun, lun5
	!EXCEPT = 0
	
	weight[x] = qromb('gauss_redsequence', redseq[1]*I1tot[x]+redseq[0]-dispersion[q], redseq[1]*I1tot[x]+redseq[0]+dispersion[q],/double)
	;print, redseq[1]*I1tot[x]+redseq[0]-dispersion[q], redseq[1]*I1tot[x]+redseq[0]+dispersion[q]
	weight[x] = (weight[x]) / (siggie*sqrt(!pi))	
	endif

	;If the object not in the colour slice and less than 3 sig away - Compute weight
	if ( (zMI1[x]) le (redseq[1]*I1tot[x]+redseq[0]-dispersion[q]) and $
	(zMI1[x] + 1.5*ezMI1[x]) ge (redseq[1]*I1tot[x]+redseq[0]-dispersion[q])) or $
	( (zMI1[x]) ge (redseq[1]*I1tot[x]+redseq[0]+dispersion[q])) and $ 
	( (zMI1[x] - 1.5*ezMI1[x]) le (redseq[1]*I1tot[x]+redseq[0]+dispersion[q])) and $
	(I1tot[x] le xstar[q] +4.0) then begin

	val = (zMI1[x])
	siggie = ezMI1[x]
	openw, lun5, 'gval.tmp', /get_lun
	printf, lun5, val, siggie
	free_lun, lun5
	!EXCEPT = 0
	
	weight[x] = qromb('gauss_redsequence', redseq[1]*I1tot[x]+redseq[0]-dispersion[q], redseq[1]*I1tot[x]+redseq[0]+dispersion[q],  /double)
	weight[x] = (weight[x]) / (siggie*sqrt(!pi))	
	if weight[x] lt 0.0 then print, 'Negative weight!!!  ', x, weight[x]
	endif

     endfor

;print, weight
fname = strcompress('slice' + string(q) + 'weights.dat', /remove_all)
openw, lun4, strcompress('zsliceweightszf40/'+fname, /remove_all), /get_lun
tempra = [rar[0], rar[0:n_elements(rar)-1]]
for xx=0UL, n_elements(rar)-1, 1 do begin
   printf, lun4, tempra[xx], decr[xx], zMI1[xx], ezMI1[xx], I1tot[xx], eI1tot[xx], mag_best[xx], emag_best[xx], weight[xx], FORMAT='(9f15.9)'
endfor
free_lun, lun4
printf, lun6, format = '(3(f12.5))', z[q], q, xstar[q]

endfor
free_lun, lun6
end
