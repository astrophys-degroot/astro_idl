;========================================================================================================================
function sigma_clip, stuff, sig, iter, GOODSUB=goodsub, BADSUB=badsub


  for rr=0, iter-1, 1 do begin                                            ;sigma clip iterations
     stuffmean = mean(stuff)                                              ;find mean
     stuffsig = stdev(stuff)                                              ;find sigma
     if sig LT 0.0001 then sig = 0.0001                                   ;catch if all same value
     lowsig = stuffmean - sig*stuffsig                                    ;lower limit
     highsig = stuffmean + sig*stuffsig                                   ;upper limit
     goods = where((stuff GT lowsig) AND (stuff LT highsig), ngoods, $    ;cont next line
                   COMPLEMENT=bads, NCOMPLEMENT=nbads)                    ;clips
     if n_elements(good) EQ 0 then good = goods else good = [good, goods] ;store good subscripts
     if n_elements(bad) EQ 0 then bad = bads else bad = [bad, bads]       ;store bad subscripts
     if ngoods NE 0 then stuff = stuff[goods]                             ;keeps good
  endfor                                                                  ;end loop over sig clip iters
  
  if keyword_set(GOODSUB) then return, good
  if keyword_set(BADSUB) then return, bad
  if NOT keyword_set(GOODSUB) and NOT keyword_set(BADSUB) EQ -1 then return, stuff
end
;========================================================================================================================




;========================================================================================================================
function mcmc_rgbim, data, func, npars, INITIAL=initial, NSTEPS=nsteps, NBURN=nburn, SEED=seed, $
                     BACKIT=backit, BACKSIG=backsig, $
                     IGNORE=ignore, BINSIZE=binsize, VERBOSE=verbose
  
  ON_ERROR, 1
  
  if n_params() lt 2 then begin
     print, 'SYNTAX : result = mcmcmain(data, function) {, INITIAL=[values], NSTEPS=value, NBURN=value, IGNORE=value} ' 
     return, -1
  endif
  
  if keyword_set(INITIAL) then begin                                         ;check keyword
     if n_elements(initial) NE npars then begin                              ;check correct #
        print, 'Number of elements of initial must match npars!!'            ;print info
        return, -1                                                           ;return bad 
     endif                                                                   ;end check keyword
  endif else begin                                                           ;end check keyword
     initial = dblarr(npars)                                                 ;make initial guess
  endelse                                                                    ;end alt tokeyword
  if keyword_set(NSTEPS) then nsteps = nsteps[0] else nsteps = 100000        ;set new value
  if keyword_set(NBURN) then nburn = nburn[0] else nburn = long(0.1*nsteps)  ;set new value
  if keyword_set(SEED) then seed = seed[0] else seed = 1234                  ;set new value
  if keyword_set(BACKIT) then backit = backit[0] else backit = 3             ;set new value
  if keyword_set(BACKSIG) then backsig = backsig[0] else backsig = 2.0       ;set new value
  if keyword_set(IGNORE) then ignore = ignore[0] else ignore = -99999.0      ;set new value
  if keyword_set(BINSIZE) then binsize = binsize[0] else binsize = 15        ;set new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1         ;set new value
  
  
   
  ;;;mcmc stuff
  randoms = uniformran(nsteps+nburn, 3)      ;chooses random devs from uniform dist
  brandoms = randoms[0:nburn-1, *]           ;separate out the burn randoms
  randoms = randoms[nburn:nsteps+nburn-1, *] ;clean the burn randoms
  bnparsteps = ulonarr(npars)                ;array for counting which var changes
  nparsteps = ulonarr(npars)                 ;array for counting which var changes
  bjumpacceptvar = ulonarr(npars)            ;initialize counter array
  jumpacceptvar = ulonarr(npars)             ;initialize counter array
  bjumpaccept = 0UL                          ;initialize counter
  jumpaccept = 0UL                           ;initialize counter
  bjumpfail = 0UL                            ;initialize counter
  jumpfail = 0UL                             ;initialize counter
  bmarkov = dblarr(npars, nburn)             ;creates markov chain
  markov = dblarr(npars, nsteps)             ;creates markov chain
  bmarkov[*,0] = initial                     ;sets up markov chain
  
  
  ;;;initial calculations (finding the CDFs of a normal distributions)
  cdf_norm = dblarr(14000, 22)  ;create array

  sigma = 4.0                                                  ;how best to pick this????
  sample = 0.001*sigma                                         ;how fine to sample grid
  ndiffs = 14.0*(sigma/sample)                                 ;# of pts in 7sigma sample grid
  diffs = lindgen(ceil(ndiffs))*sample - ((ndiffs*sample)/2.0) ;array to use in moving 
  denom = 1.0 / (2.0*sigma^2)^0.5                              ;denominator
  erfed = erf(diffs*denom)                                     ;meta step
  cdf_norm[*,0] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist

  sigma = 3.0                                                  ;how best to pick this????
  sample = 0.001*sigma                                         ;how fine to sample grid
  ndiffs = 14*(sigma/sample)                                   ;# of pts in 7sigma sample grid
  diffs = lindgen(ceil(ndiffs))*sample - ((ndiffs*sample)/2.0) ;array to use in moving 
  denom = 1.0 / (2.0*sigma)^0.5                                ;denominator
  erfed = erf(diffs*denom)                                     ;meta step
  cdf_norm[*,1] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist
  cdf_norm[*,2] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist
  
  sigma = 2.0                                                  ;how best to pick this????
  sample = 0.001*sigma                                         ;how fine to sample grid
  ndiffs = 14.0*(sigma/sample)                                 ;# of pts in 7sigma sample grid
  diffs = lindgen(ceil(ndiffs))*sample - ((ndiffs*sample)/2.0) ;array to use in moving 
  denom = 1.0 / (2.0*sigma)^0.5                                ;denominator
  erfed = erf(diffs*denom)                                     ;meta step
  cdf_norm[*,3] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist
  cdf_norm[*,4] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist
  cdf_norm[*,5] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist
  
  sigma = 1.0                                                  ;how best to pick this????
  sample = 0.001*sigma                                         ;how fine to sample grid
  ndiffs = 14.0*(sigma/sample)                                 ;# of pts in 7sigma sample grid
  diffs = lindgen(ceil(ndiffs))*sample - ((ndiffs*sample)/2.0) ;array to use in moving 
  denom = 1.0 / (2.0*sigma)^0.5                                ;denominator
  erfed = erf(diffs*denom)                                     ;meta step
  cdf_norm[*,6] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist
  cdf_norm[*,7] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist
  cdf_norm[*,8] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist
  cdf_norm[*,9] = 0.5*(1.0 + erfed)                            ;full CDF of a normal dist
  
  sigma = 0.8                                                  ;how best to pick this????
  sample = 0.001*sigma                                         ;how fine to sample grid
  ndiffs = 14.0*(sigma/sample)                                 ;# of pts in 7sigma sample grid
  diffs = lindgen(ceil(ndiffs))*sample - ((ndiffs*sample)/2.0) ;array to use in moving 
  denom = 1.0 / (2.0*sigma)^0.5                                ;denominator
  erfed = erf(diffs*denom)                                     ;meta step
  cdf_norm[*,10] = 0.5*(1.0 + erfed)                           ;full CDF of a normal dist
  cdf_norm[*,11] = 0.5*(1.0 + erfed)                           ;full CDF of a normal dist
  cdf_norm[*,12] = 0.5*(1.0 + erfed)                           ;full CDF of a normal dist
  cdf_norm[*,13] = 0.5*(1.0 + erfed)                           ;full CDF of a normal dist
  cdf_norm[*,14] = 0.5*(1.0 + erfed)                           ;full CDF of a normal dist
  

  ;diffs = lindgen(50001.0)/50000.0 - 0.5 ;array to use in moving 
  ;sigmasq = 0.00008                     ;how best to pick this????
  ;denom = 1.0 / (2.0*sigmasq)^0.5        ;denominar
  ;erfed = erf(diffs*denom)               ;meta step
  ;cdf_norm[*,15] = 0.5*(1.0 + erfed)     ;full CDF of a normal dist
  ;cdf_norm[*,16] = 0.5*(1.0 + erfed)     ;full CDF of a normal dist
  ;cdf_norm[*,17] = 0.5*(1.0 + erfed)     ;full CDF of a normal dist
  ;cdf_norm[*,18] = 0.5*(1.0 + erfed)     ;full CDF of a normal dist
  ;cdf_norm[*,19] = 0.5*(1.0 + erfed)     ;full CDF of a normal dist
  ;cdf_norm[*,20] = 0.5*(1.0 + erfed)     ;full CDF of a normal dist
  ;cdf_norm[*,21] = 0.5*(1.0 + erfed)     ;full CDF of a normal dist
  
  ;;;check for binning and proceed appropriately
  if binsize NE 1 then begin                                                     ;check whether to bin image
     datsize = size(data)                                                        ;find data array dims
     xsize = floor(datsize[1] / binsize)                                         ;find xsize
     ysize = floor(datsize[2] / binsize)                                         ;find ysize
     bindat = dblarr(xsize, ysize)                                               ;make bin array
     for pp=0, xsize-1, 1 do begin                                               ;loop over x dir
        for qq=0, ysize-1, 1 do begin                                            ;loop over y dir
           chunk = data[pp*binsize:(pp+1)*binsize-1,qq*binsize:(qq+1)*binsize-1] ;chunk to bin
           chunk = sigma_clip(chunk, backit, backsig)                            ;sigma clip chunk
           bindat[pp,qq] = median(chunk)                                         ;median the bin 
        endfor                                                                   ;end loop y dir
     endfor                                                                      ;end loop x dir
     data = bindat                                                               ;store it
  endif else begin                                                               ;end check yes bin image
     data = data                                                                 ;just a safety
  endelse                                                                        ;end not bin image
  window, 1, XPOS=100, YPOS=100, XSIZE=600, YSIZE=600                            ;set plot window
  surface, data, $                                                               ;surface contour
           BACKGROUND = 'FFFFFF'XL, $                                            ;plot option
           COLOR = '000000'XL, $                                                 ;plot option
           CHARSIZE = 2.5, $                                                     ;plot option
           CHARTHICK = 1.25, $                                                   ;plot option
           XTITLE = 'X [pixels]', $                                              ;plot option
           YTITLE = 'Y [pixels]', $                                              ;plot option
           ZTITLE = 'Image Value [arbitrary]'                                    ;plot option
  mwrfits, data, 'datatofit.fits', /CREATE  
  

  ;;;calculate initial guess likelihood
  ;;;note: most of the calculations are done outside the for loop so
  ;;;it can be array based and hence quicker; its all still poisson though
  baddat = where((data NE data) OR abs(data - ignore) LT 0.00001, nbaddat) ;where not ignore val
  if nbaddat NE 0 then data[baddat] = 0
  ignodat = where(data EQ 0, nignodat, COMPLEMENT=chkdat)
  mwrfits, data, 'datatofit2.fits', /CREATE  

  blah = data                                                              ;copy of data
  keeper = intarr(n_elements(chkdat))                                      ;holder array
  keeper[*] = 1                                                            ;set all to 'yes'
  blah = sigma_clip(blah, 3.0, 1, /BADSUB)                                 ;sigma clip
  if blah[0] NE -1 then begin                                              ;make sure something was clipped
     for ss=0, n_elements(blah)-1, 1 do begin                              ;loop over sigma clipped inds
        test = where(chkdat EQ blah[ss], ntest)                            ;see if ind matches
        if ntest EQ 1 then keeper[test] = 0                                ;if exactly 1 then flag as no
        if ntest GT 1 then print, 'Something has gone horribly wrong!'     ;fail safe
     endfor                                                                ;end loop over sigma clipped inds
  endif                                                                    ;end check something clipped
  keep = where(keeper EQ 1, nkeep, COMPLEMENT=baddat, NCOMPLEMENT=nbaddat) ;find where to keep                                            
  data[chkdat[baddat]] = 0
  chkdat = chkdat[keep]         ;keep good
  mwrfits, data, 'datatofit3.fits', /CREATE  
  surface, data, $                            ;surface contour
           BACKGROUND = 'FFFFFF'XL, $         ;plot option
           COLOR = '000000'XL, $              ;plot option
           CHARSIZE = 2.5, $                  ;plot option
           CHARTHICK = 1.25, $                ;plot option
           XTITLE = 'X [pixels]', $           ;plot option
           YTITLE = 'Y [pixels]', $           ;plot option
           ZTITLE = 'Image Value [arbitrary]' ;plot option

  ignodat = where(data EQ 0, nignodat, COMPLEMENT=chkdat)
  if chkdat[0] NE -1 then begin
     mudat = mean(data[chkdat])
     sigdat = stdev(data[chkdat])
     meddat = median(data[chkdat])
  endif

  
  predict = call_function(func, data, initial)                    ;find expected vals
  likeli = -1.0*(predict[chkdat]-data[chkdat])^2 / (2.0*sigdat^2) ;find likelihood at each point
  jl = total(likeli)                                              ;find joint likelihood

  
  ;;;This is exactly like the main event but just getting in the right neighborhood
  if verbose ge 1 then print, ' Starting the burn in period...' ;print
  for aa=0UL, nburn-1, 1 do begin                               ;loop over the burn in
     jumpspot = bmarkov[*,bjumpaccept]                          ;array for guess location
     
     ;;;this section randomly picks the variable and makes the jump
     whichvar = 0                                                                  ;set flag
     incpar = 0.0                                                                  ;set increment variable
     while whichvar EQ 0 do begin                                                  ;look until we find which var
        if (brandoms[aa,0] GE double((incpar)*(1.0/npars))) AND $                  ;cont next line
           (brandoms[aa,0] LT double((incpar+1)*(1.0/npars))) then begin           ;if in var 'bin'
           whichvar = 1                                                            ;switch flag
           incpar = fix(incpar)                                                    ;change data type to int 
           bnparsteps[incpar]++                                                    ;increment # steps for that par 
           cdfspot = min((cdf_norm[*,incpar] - brandoms[aa,1]), indmin, /ABSOLUTE) ;which ind to look at for the jump
           jump = diffs[indmin]                                                    ;how far to jump
           jumpspot[incpar] = jumpspot[incpar] + jump                              ;propose new location
        endif else begin                                                           ;end var found
           incpar++                                                                ;increment variable
        endelse                                                                    ;end if var not found
     endwhile                                                                      ;end look until we find var
     
     predict = call_function(func, data, jumpspot)                      ;find experimental vals
     check = where(predict LT 0.0, ncheck)                              ;checks parameter space
     if check[0] EQ -1 then begin                                       ;if no negative value
        likeli = -1.0*(predict[chkdat]-data[chkdat])^2 / (2.0*sigdat^2) ;find likelihood at each point
        gjl = total(likeli)                                             ;find joint likelihood  
        if gjl GT -99999999999999999.0 then begin                       ;check for -Infinity
           limit = gjl - jl                                             ;find difference : remember log space
           limit = exp(limit)                                           ;out of log space
           if limit gt 1 then begin                                     ;compares joint likelihoods
              bmarkov[*,bjumpaccept+1] = jumpspot                       ;updates location in param space
              jl = gjl                                                  ;updates joint likelihood value
              bjumpaccept++                                             ;ups counter
              bjumpacceptvar[incpar]++                                  ;ups counter for variable
           endif else begin                                             ;end check joint likelihoods
              if brandoms[aa,2] lt limit then begin                     ;check uniform ran against limit
                 bmarkov[*,bjumpaccept+1] = jumpspot                    ;updates location in param space
                 jl = gjl                                               ;updates joint likelihood value
                 bjumpaccept++                                          ;ups counter
                 bjumpacceptvar[incpar]++                               ;ups counter for variable
              endif else bjumpfail++                                    ;end check of uniform ran against limit
           endelse                                                      ;end alt to joint likelihoods
        endif else begin                                                ;end check no neg values
           bjumpfail++                                                  ;number of rejected steps
        endelse                                                         ;end alt no neg values   
     endif else begin                                                   ;end check no neg values
        bjumpfail++                                                     ;number of rejected steps
     endelse                                                            ;end alt no neg values   
  endfor                                                                ;end loop over the burn in
  
  if verbose ge 1 then print, ' Ending the burn in period...'                        ;print
  if verbose ge 1 then begin                                                         ;check verbose status
     print, '  # of steps for each variable during burn in', bnparsteps              ;print info
     print, '  # of jumps accepted during burn in: ', bjumpaccept, ' out of ', nburn ;print info    
  endif                                                                              ;end check verbose status
  markov[*,0] = bmarkov[*,bjumpaccept]                                               ;pass current state
  
  
  ;;;The main event of MCMC
  if verbose ge 1 then print, ' Starting the MCMC run...'                              ;print
  for aa=0UL, nsteps-1, 1 do begin                                                     ;loop over all steps
     if (verbose ge 1) AND (aa mod 25000 EQ 0) then print, 'Step #', aa, ' / ', nsteps ;print 
     jumpspot = markov[*,jumpaccept]                                                   ;array for guess location
     
     ;;;this section randomly picks the variable and makes the jump
     whichvar = 0                                                                 ;set flag
     incpar = 0.0                                                                 ;set increment variable
     while whichvar EQ 0 do begin                                                 ;look until we find which var
        if (randoms[aa,0] GE double((incpar)*(1.0/npars))) AND $                  ;cont next line
           (randoms[aa,0] LT double((incpar+1)*(1.0/npars))) then begin           ;if in var 'bin'
           whichvar = 1                                                           ;switch flag
           incpar = fix(incpar)                                                   ;change data type to int 
           nparsteps[incpar]++                                                    ;increment # steps for that par 
           cdfspot = min((cdf_norm[*,incpar] - randoms[aa,1]), indmin, /ABSOLUTE) ;which ind to look at for the jump
           jump = diffs[indmin]                                                   ;how far to jump
           jumpspot[incpar] = jumpspot[incpar] + jump                             ;propose new location
        endif else begin                                                          ;end var found
           incpar++                                                               ;increment variable
        endelse                                                                   ;end if var not found
     endwhile                                                                     ;end look until we find var
     
     predict = call_function(func, data, jumpspot)                      ;find expecimental vals
     check = where(predict LT 0.0, ncheck)                              ;checks parameter space
     if check[0] EQ -1 then begin                                       ;if no negative value
        likeli = -1.0*(predict[chkdat]-data[chkdat])^2 / (2.0*sigdat^2) ;find likelihood at each point
        gjl = total(likeli)                                             ;find joint likelihood
        if gjl GT -99999999999999999.0 then begin                       ;check for -Infinity
           limit = gjl - jl                                             ;find difference : remember log space
           limit = exp(limit)                                           ;out of log space
           if limit gt 1 then begin                                     ;compares joint likelihoods
              markov[*,jumpaccept+1] = jumpspot                         ;updates location in param space
              jl = gjl                                                  ;updates joint likelihood value
              jumpaccept++                                              ;ups counter
              jumpacceptvar[incpar]++                                   ;ups counter for var
           endif else begin                                             ;end check joint likelihoods
              if randoms[aa,2] lt limit then begin                      ;check uniform ran against limit
                 markov[*,jumpaccept+1] = jumpspot                      ;updates location in param space
                 jl = gjl                                               ;updates joint likelihood value
                 jumpaccept++                                           ;ups counter
                 jumpacceptvar[incpar]++                                ;ups counter for var
              endif else jumpfail++                                     ;end check of uniform ran against limit
           endelse                                                      ;end alt to joint likelihoods
        endif else begin                                                ;end check no neg values
           jumpfail++                                                   ;number of rejected steps
        endelse                                                         ;end alt no neg values   
     endif else begin                                                   ;end check no neg values
        jumpfail++                                                      ;number of rejected steps
     endelse                                                            ;end alt no neg values     
  endfor                                                                ;end loop over all steps
  
  
  if verbose ge 1 then begin                                               ;check verbose
     jumpaccept = float(jumpaccept)                                        ;convert type
     nsteps = float(nsteps)                                                ;convert type
     jumpacceptvar = float(jumpacceptvar)                                  ;convert type
     npars = float(npars)                                                  ;convert type
     perct = (jumpaccept/nsteps)                                           ;calculate
     perctvar = (jumpacceptvar*npars)/nsteps                               ;calculate
     print, '  Number of steps for each variable', nparsteps               ;print info
     print, '  Number of jumps accepted: ', jumpaccept, ' out of ', nsteps ;print info
     print, '  Percent of jumps accepted: ', perct                         ;print info
     print, '  Percent of jumps accepted for each parameter', perctvar     ;print info
  endif                                                                    ;end check verbose
  

  outvals = dblarr(npars)                                                                ;create array 
  for aa=0, npars-1, 1 do begin                                                          ;loop over npars
     outfile = strcompress('histoffit_'+string(aa)+'.ps', /REMOVE_ALL)                   ;file name
     if max(markov[aa,0:jumpaccept]) - min(markov[aa,0:jumpaccept]) GT 0.0001 then begin ;fail safe
        result = histogram_1d(markov[aa,0:jumpaccept], OUTFILE=outfile, /WRITE)          ;find and write dist of vals
        maxval = max(result[*,1], maxind)                                                ;find max # occurances
        bestval1 = result[maxind,0]                                                      ;find most common bin value
        bestval2 = mean(markov[aa,0:jumpaccept])                                         ;find average value
        chk = (bestval1-bestval2)/bestval2                                               ;check difference
        if chk GT 0.1 then print, ' Caution: measurements differ by >10%'                ;warning
        outvals[aa] = bestval2                                                           ;find common val
     endif                                                                               ;end fail safe
  endfor                                                                                 ;end loop over npars
  
  ;print, outvals
  return, outvals
end
;========================================================================================================================



;========================================================================================================================
pro call_mcmcmain

  stuff = [1,2,3]
  stuff2 = 'blah'

  test = mcmcmain(stuff, stuff2)
  print, test

end
;========================================================================================================================
