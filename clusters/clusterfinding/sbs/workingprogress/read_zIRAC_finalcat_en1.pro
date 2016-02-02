pro read_ELAISN1_zIRAC_finalcat, rar, decr, apmag_176, eapmag_176, apmag_366, eapmag_366, mag_best, emag_best, ch1bf, c1ebap, c1_3pxapc, c1_3pxerr, ch2bf, c2ebap, c2_3pxapc, c2_3pxerr

;Ricardo: there are no official ID#'s (never needed them writing them takes harddisk space).  Let just use the order of the galaxies in this file as their ID 
;numbers.  Lets adopt the format of starting with the first object as ID "0" instead of "1", which will keep things consistent with the IDL 
;incrementing scheme.

;nzobj = 535473
nzobj = 1089537

openr, lun, '/chooyu1/muzzin/SpARCS/ELAIS-N1/IRAC/ELAISN1_finalzIRAC.cat', /get_lun

rar = dblarr(nzobj) ; RA
decr = dblarr(nzobj) ;DEC
apmag_176 = dblarr(nzobj) ;z-band mag in 1.76" diameter aperture
eapmag_176 = dblarr(nzobj) ;error in 1.76" apmmag
apmag_366 = dblarr(nzobj) ; z-band mag in 3.66" diameter aperture
eapmag_366 = dblarr(nzobj) ;error in 3.66" apmag
ch1bf = dblarr(nzobj) ; "Best" IRAC ch1 total flux --see Lacy et al. (2005)
c1ebap = dblarr(nzobj); error in best flux
c1_3pxapc = dblarr(nzobj) ;IRAC ch1 3.66" diameter aperture mag
c1_3pxerr = dblarr(nzobj) ; error in 3.66" apmag
ch2bf = dblarr(nzobj) ; Below same for IRAC ch2
c2ebap = dblarr(nzobj)
c2_3pxapc = dblarr(nzobj)
c2_3pxerr = dblarr(nzobj)
mag_best = dblarr(nzobj) ;Sextractor magbest for z-band (z-band total mag)
emag_best = dblarr(nzobj) ;error in z-band mag_best

cnt = 0.0
readu, lun, cnt
readu, lun, rar
readu, lun, decr
readu, lun, apmag_176
readu, lun, eapmag_176
readu, lun, apmag_366
readu, lun, eapmag_366
readu, lun, mag_best
readu, lun, emag_best
readu, lun, ch1bf
readu, lun, c1ebap
readu, lun, c1_3pxapc
readu, lun, c1_3pxerr
readu, lun, ch2bf
readu, lun, c2ebap
readu, lun, c2_3pxapc
readu, lun, c2_3pxerr

free_lun, lun

end
