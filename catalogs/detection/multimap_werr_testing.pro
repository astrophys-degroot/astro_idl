pro multimap_werr_testing


  a = 'multimap_test_irac_200x100.fits'
  a = mrdfits(a, 0, hdr)
  vara = 'multimap_test_irac_200x100_unc.fits'
  vara = mrdfits(vara, 0, hdr)
  aerr = 1.0 / vara
  ;b = 'multimap_test_irac_3x3_no.fits'
  ;b = mrdfits(b, 0, hdr)
  ;varb = 'multimap_test_irac_3x3_cov_no.fits'
  ;varb = mrdfits(varb, 0, hdr)
  ;berr = 1.0 / varb
 
  ;a = [[1.0, 3.0, 1.0], $
  ;     [3.0, 6.0, 3.0], $
  ;     [1.0, 3.0, 1.0] ]
  ;print, a
  ;print, variance(a)
  ;print, ''
  ;aerr = 0.1 * a

  ;b = [[1.0, 1.5, 1.0], $
  ;     [-1.0, 0.1, -3.0], $
  ;     [0.5, 1.0, -1.0] ]
  ;print, b
  ;print, variance(b)
  ;print, ''
  ;berr = 0.1 * b
    

  l = 3
  n = 500
  probs = dblarr(n+1)
  finalvar = a
  finalvar[*,*] = 0.0
  szvar = a
  szvar[*,*] = 0.0
  FOR zz=5, 95, 1 DO BEGIN
     if (zz mod 10) EQ 0 then print, zz
     FOR yy=5, 195, 1 DO BEGIN
        sub = a[yy-l:yy+l,zz-l:zz+l]
        suberr = aerr[yy-l:yy+l,zz-l:zz+l]
        szvar[yy,zz] = variance(sub)
        inds = indgen(n+1)*(5.0*(max(sub)-min(sub))/n) 
        FOR xx=0, n, 1 DO BEGIN
           prob = 1.0/((2.0*!pi)^0.5*suberr)*exp(-1.0*(sub - inds[xx])^2 / (2.0*suberr^2))
           sumprob = total(prob)
           probs[xx] = sumprob
        ENDFOR
        vals = sigmas(inds, probs, LEVELS=3)
        ;print, mean(vals[0:1])
        finalvar[yy, zz] = (mean(vals[0:1]))^2
     ENDFOR
  ENDFOR

  mwrfits, finalvar, 'testing.fits', /CREATE
  mwrfits, szvar, 'benchmark.fits', /CREATE
                                ;thing = plot(inds, probs)
  sortind = bsort(finalvar, finalvarsort)
  nfinalvar = n_elements(finalvar)
  cap = fix(nfinalvar*0.84)
  print, finalvarsort[cap]
  cut = finalvarsort[cap]
  chk = where(finalvar LT cut)
  help, chk
  finalvar[chk] = 0
  mwrfits, finalvar, 'testing2.fits', /CREATE

  ;pdf = histogram(finalvar, LOCATIONS=xbin, BINSIZE=0.0001, MIN=0.0001, MAX=0.1)
  ;aplot = plot(xbin, pdf)
  ;pdf = histogram(szvar, LOCATIONS=xbin, BINSIZE=0.0001, MIN=0.0001, MAX=0.01)
  ;aplot = plot(xbin, pdf)


  source = a
  source[*,*] = 0
  cap = fix(nfinalvar*0.99)
  cut = finalvarsort[cap]
  chk = where(finalvar GT cut)
  source[chk] = 1.0

  mwrfits, source, 'sources.fits', /CREATE
  spawn, 'ds9 -zscale testing.fits benchmark.fits sources.fits testing2.fits multimap_test_irac_200x100.fits multimap_test_irac_200x100_unc.fits &'



end

