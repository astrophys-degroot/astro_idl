;========================================================================================================================
function verifyfunc, xfunc, arg1, arg2, arg3
  
  ON_ERROR, 1
  
  if size(xfunc, /TYPE) ne 7 then begin
     print, 'Function input must be a string quantity'
     return, -1
  endif
  
  retval = call_function(xfunc, arg1, arg2, arg3)
  return, retval

end
;========================================================================================================================



;========================================================================================================================
function mcmc_rgbim, data, func, npars, INITIAL=initial, NSTEPS=nsteps, NBURN=nburn, SEED=seed, IGNORE=ignore
  
  ON_ERROR, 1
  
  if n_params() lt 2 then begin
     print, 'SYNTAX : result = mcmcmain(data, function) {, INITIAL=[values], NSTEPS=value, NBURN=value, IGNORE=value} ' 
     return, -1
  endif
  
  if keyword_set(INITIAL) then begin                                       ;check keyword
     if n_elements(initial) NE npars then begin                            ;check correct #
        print, 'Number of elements of initial must match npars!!'          ;print info
        return, -1                                                         ;return bad 
     endif                                                                 ;end check keyword
  endif else begin                                                         ;end check keyword
     initial = dblarr(npars)                                               ;make initial guess
  endelse                                                                  ;end alt tokeyword
  if keyword_set(NSTEPS) then nsteps = nsteps[0] else nsteps = 100      ;set new value
  if keyword_set(NBURN) then nburn = nburn[0] else nburn = fix(0.1*nsteps) ;set new value
  if keyword_set(SEED) then seed = seed[0] else seed = 1234                ;set new value 
  if keyword_set(IGNORE) then ignore = ignore[0] else ignore = 0.0         ;set new value
  
  
   
  ;;;mcmc stuff
  randoms = uniformran(nsteps, npars)       ;chooses random devs from uniform dist
  nparsteps = ulonarr(npars)                ;array for counting which var changes
  jumpaccept = 0UL                          ;initialize counter
  jumpfail = 0UL                            ;initialize counter
  markov = dblarr(npars, nsteps)            ;creates markov chain
  markov[*,0] = initial                     ;sets up markov chain
  
  

  ;;;calculate initial guess likelihood
  ;;;note: most of the calculations are done outside the for loop so
  ;;;it can be array based and hence quicker; its all still poisson though
  chkdat = where(data NE ignore, nchkdat)                          ;where not ignore val
  exper = call_function(func, data, initial)                       ;find experimental vals
  fctdat = 1.0 / factorial(data[chkdat])                           ;factorial of observed
  expexper = exp(-1.0*exper[chkdat])                               ;exponential of experimental vals
  experdat = exper[chkdat]^data[chkdat]                            ;exponential of experi to power of observed
  for ww=0UL, nchkdat-1, 1 do begin                                ;loop over all points
     lkhd = double(experdat[ww]*expexper[ww]*fctdat[ww])           ;calc likelihood
     if ww eq 0 then jl = alog10(lkhd) else jl = jl + alog10(lkhd) ;adds to joint likelihood
  endfor                                                           ;end loop over all points
  print, jl
  

  for aa=0UL, nsteps-1, 1 do begin ;loop over all steps
     jumpspot = markov[*,jumpaccept] ;creates array for guess location


     
     
  endfor                        ;end loop over all steps

  x = 1
  return, x
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
