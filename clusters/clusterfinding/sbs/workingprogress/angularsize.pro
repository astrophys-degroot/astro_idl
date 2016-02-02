function angularsize, z, objectsize

;objectsize is in kpc - Convert to Mpc because H0 is units Mpc

objectsize = objectsize / 1000.0
;!p.multi = [0,1,2]

omegam = 0.3
omegal = 0.7
c = 3e5
H0 = 70.0

;Integrate ('qromb') to find the distance modulus 
dc = qromb('e',0.0,z)
dh = (c)/(H0)
dc = dh*dc

da = (dc)/(1 + z)

;Howard's definition of DM and DA in z
;dm[x,*] = (c*2.0*(2.0 - omegam[x]*(1.0 - z) - (2.0 - omegam[x])*sqrt(1.0 + omegam[x]*z))) * (omegam[x]^2.0 * (1.0 + z) * H0)^(-1.0)
;dm[0,*] = (c/H0)*z*(1.0+0.5*z) * (1.0+z)^(-1.0)
;da[x,*] = dm[x,*] * (1 + z)^(-1.0)
;plot, alog10(z), alog10(da[0,*]), xtitle = 'Log!d10!n redshift (z)', ytitle = 'Log!d10!n D!dA!n (kpc)'; , /xlog, /ylog
;oplot, alog10(z), alog10(da[1,*]), linestyle = 2.0
;oplot, alog10(z), alog10(da[2,*]), linestyle = 3.0

as = ((objectsize)/(da))*3600.0*57.295 ; in arcsec
;as[x,*] = (objectsize/da[x,*])*60.0*57.295 ; in arcmin

;print, 'z: ',z,'  Angular Size: ', as, ' arcsec'

;plot, alog10(z), alog10(as[0,*]), xtitle = 'Log!d10!n redshift (z)', ytitle = 'Log!d10!n Angular Size (arcsec)' 
;oplot, alog10(z), alog10(as[1,*]), linestyle = 2.0
;oplot, alog10(z), alog10(as[2,*]), linestyle = 3.0

return, as
end

;Function E(z) for integration
function e, z

omegam = 0.3
omegal = 0.7

return, (sqrt(omegam*((1+z)^3)+(1-omegam-omegal)*((1+z)^2)+omegal))^(-1)

end
