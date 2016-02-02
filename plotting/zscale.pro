;========================================================================================================================
function zscale_samp, xim, xmaxpix, BPMASK=bpmask, ZMASK=zmask

  shape = size(xim)
  
  nc = shape[1]
  nl = shape[2]
  xopt1 = (nc-1)*(nl-1)^0.5 / float(xmaxpix)
  stride = fix(max([1.0, xopt1]))

  samp = where((xim EQ xim) AND (xim NE 0.0), nsamp) ;check for NaNs and avoids 0s
  sampind = where((samp MOD stride) EQ 0, nsampind)  ;find sample indices 
  samples = xim[samp[sampind]]                       ;get image values
  
  nsamp =n_elements(samples)                     ;how many samples 
  IF xmaxpix GT nsamp-1 then xmaxpix = nsamp - 1 ;cap value 
  
  RETURN, samples[0:xmaxpix]
END
;========================================================================================================================



;========================================================================================================================
function zscale_sigma, xflat, xbadpixels, xnsamp, goodval

  
  xgood = where(xbadpixels EQ goodval, xngood)
  sumz = total(xflat[xgood])
  sumsq = total(xflat[xgood]^2)

  CASE xngood OF
     0 : BEGIN
        mean = 0.0
        sigma = 0.0
     END
     1 : BEGIN
        mean = sumz
        sigma = 0.0
     END
     ELSE : BEGIN
        mean = sumz / xngood
        tmp = (sumsq / float(xngood - 1.0)) - sumz^2 / float(xngood * (xngood - 1.0))
        IF tmp LT 0.0 THEN sigma = 0.0 ELSE sigma = tmp^0.5
     END
  ENDCASE
 
  RETURN, [mean, sigma, xngood]
END
;========================================================================================================================



;========================================================================================================================
function zscale_fit, xsampled, krej, ngrow, maxiter, minpix, goodval, badval
  

  nsamp = n_elements(xsampled)
  xscale = 2.0 / (nsamp - 1.0)
  xnorm = findgen(nsamp)
  xnorm = xnorm * xscale - 1.0

  ngoodpix = nsamp
  last_ngoodpix = nsamp + 1
  badpixels = intarr(nsamp)
 
  xx = 1                        ;counter
  WHILE xx LE maxiter DO BEGIN

     good = where(badpixels EQ goodval, ngood)
     IF ngood NE 0 THEN BEGIN
        sumx = total(xnorm[good])
        sumxx = total(xnorm[good]^2)
        sumy = total(xsampled[good])
        sumxy = total(xnorm[good]*xsampled[good])
     ENDIF

     delta = (ngood * sumxx) - sumx^2
     intercept = (sumxx * sumy - sumx * sumxy) / delta
     slope = (ngood * sumxy - sumx * sumy) / delta

     fitted = slope * xnorm + intercept
     flat = xsampled - fitted
     fitvals = zscale_sigma(flat, badpixels, nsamp, goodval)
     
     thresh = fitvals[1] * krej
     lcut = -1.0 * thresh
     hcut = thresh
     below = where(flat LT lcut, nbelow)
     IF nbelow NE 0 THEN badpixels[below] = badval

     above = where(flat GT hcut, nabove)
     IF nabove NE 0 THEN badpixels[above] = badval

     kernel = fltarr(ngrow)
     kernel[*] = 1.0
     badpixels = convolve(badpixels, kernel)

     good = where(badpixels EQ goodval, ngood)
     IF (ngoodpix GE last_ngoodpix) OR (ngoodpix LT minpix) THEN xx = maxiter ;break clause
     xx = xx+1
  ENDWHILE

  zstart = intercept - slope
  zslope = slope * xscale
  
 RETURN, [zstart, zslope, ngood]
END
;========================================================================================================================



;========================================================================================================================
function zscale, image, $
                 NSAMPLES=nsamples, CONTRAST=contrast, $
                 MAXREJ=maxrej, MIN_NPIXELS=min_npixels, $
                 GOODVAL=goodval, BADPIX=badpix, $
                 KREJ=krej, MAXITER=maxiter
  
  IF keyword_set(NSAMPLES) THEN nsamples = nsamples[0] ELSE nsamples = 1000          ;set value
  IF keyword_set(CONTRAST) THEN contrast = contrast[0] ELSE contrast = 0.25          ;set value
  IF keyword_set(MAXREJ) THEN maxrej = maxrej[0] ELSE maxrej = 0.5                   ;set value
  IF keyword_set(MIN_NPIXELS) THEN min_npixels = min_npixels[0] ELSE min_npixels = 5 ;set value
  IF keyword_set(GOODVAL) THEN goodval = goodval[0] ELSE goodval = 0                 ;set value
  IF keyword_set(BADVAL) THEN badval = badval[0] ELSE badval = 1                     ;set value
  IF keyword_set(KREJ) THEN krej = krej[0] ELSE krej = 2.5                           ;set value
  IF keyword_set(MAXITER) THEN maxiter = maxiter[0] ELSE maxiter = 5                 ;set value


  sampled = zscale_samp(image, nsamples)
  nsamp = n_elements(sampled)
  sort = bsort(sampled)
  sampled = sampled[sort]
  zmin = sampled[0]
  zmax = sampled[nsamp-1]

  center = (nsamp-1) / 2
  IF (nsamp MOD 2) EQ 1 THEN median = sampled[center] ELSE $
     median = 0.5*(sampled[center]+sampled[center+1])

  opt1 = fix(nsamp * maxrej)
  minpix = max([min_npixels, opt1])
  opt2 = fix(0.01 * nsamp)
  ngrow = max(1, opt2)

  fit = zscale_fit(sampled, krej, ngrow, maxiter, minpix, goodval, badval)

  IF fit[2] LT minpix THEN BEGIN
     z1 = zmin
     z2 = zmax
  ENDIF ELSE BEGIN
     IF contrast > 0.0 THEN fit[1] = fit[1] / contrast
     opt1 = median - fit[1] * float(center - 1) 
     z1 = max([zmin, opt1])
     opt1 = median + fit[1] * float(nsamp - center) 
     z2 = min([zmax, opt1])
  ENDELSE

  RETURN, [z1, z2]
END
;========================================================================================================================
