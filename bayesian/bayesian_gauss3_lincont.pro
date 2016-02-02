;========================================================================================================================
function mosfireguess, iguess, xs, ys, yoffset
  
  boxscore, xs, VALUES=xvals, /QUIET
  boxscore, ys, VALUES=yvals, /QUIET
  
  IF iguess.mu1 EQ 0.0 THEN iguess.mu1 = xvals[0]
  IF iguess.mu2 EQ 0.0 THEN iguess.mu2 = iguess.mu1 - yoffset
  IF iguess.mu3 EQ 0.0 THEN iguess.mu3 = iguess.mu1 + yoffset
  IF iguess.sig1 EQ 0.0 THEN iguess.sig1 = 0.5*yoffset
  IF iguess.sig2 EQ 0.0 THEN iguess.sig2 = 0.5*yoffset
  IF iguess.sig3 EQ 0.0 THEN iguess.sig3 = 0.5*yoffset
  IF iguess.c1 EQ 0.0 THEN iguess.c1 = 1.0
  IF iguess.c2 EQ 0.0 THEN iguess.c2 = 0.5
  IF iguess.c3 EQ 0.0 THEN iguess.c3 = 0.5
  IF iguess.a EQ 0.0 THEN iguess.a = 0.0
  IF iguess.b EQ 0.0 THEN iguess.b = 0.0
  
  RETURN, iguess
END
;========================================================================================================================



;========================================================================================================================
function evaluate, xs, values
  
  fx = values.c1*exp(-(xs-values.mu1)^2/(2*values.sig1^2)) + $
         values.c2*exp(-(xs-values.mu2)^2/(2*values.sig2^2)) + $
         values.c3*exp(-(xs-values.mu3)^2/(2*values.sig3^2)) + $
         values.a*xs + values.b   
  
  RETURN, fx 
END
;========================================================================================================================



;========================================================================================================================
function store, markov, jumpspot
  
  markov.mu1 = jumpspot.mu1
  markov.mu2 = jumpspot.mu2
  markov.mu3 = jumpspot.mu3
  markov.sig1 = jumpspot.sig1
  markov.sig2 = jumpspot.sig2
  markov.sig3 = jumpspot.sig3
  markov.c1 = jumpspot.c1
  markov.c2 = jumpspot.c2
  markov.c3 = jumpspot.c3
  markov.a = jumpspot.a
  markov.b = jumpspot.b
 
  RETURN, markov 
END
;========================================================================================================================


;========================================================================================================================
function chkvar, xvar, XCURRENT=xcurrent
  
  CASE xvar OF
     'mu1' : wvar = 1 
     'mu2' : wvar = 2 
     'mu3' : wvar = 3 
     'sig1' : wvar = 4  
     'sig2' : wvar = 5  
     'sig3' : wvar = 6 
     'c1' : wvar = 7 
     'c2' : wvar = 8  
     'c3' : wvar = 9  
     'a' : wvar = 10 
     'b' : wvar = 11
     ELSE : BEGIN
        print, 'WARNING!! The varible provided for the following prior is not valid!!'
        print, '   ', xcurrent
        print, '   Choices for variable are: "mu1" "mu2" "mu3" "sig1" "sig2" "sig3" "c1" "c2" "c3" "a" "b" '
        print, '   Case matters!!'
        stop
     END
  ENDCASE
  
  RETURN, wvar
END
;========================================================================================================================


;========================================================================================================================
function chkcomp, xcomp, XCURRENT=xcurrent
  
  IF NOT keyword_set(xcurrent) THEN xcurrent = 'Error in evaluating priors!'

  CASE xcomp OF
     'EQ' : wcomp = 1 
     'NE' : wcomp = 2 
     'GT' : wcomp = 3 
     'GE' : wcomp = 4 
     'LT' : wcomp = 5  
     'LE' : wcomp = 6  
     ELSE : BEGIN
        print, 'WARNING!! The comparison provided for the following prior is not valid!!'
        print, '   ', xcurrent
        print, '   Choices for variable are: "EQ" "GT" "GE" "LT" "LE" "NE"'
        print, '   Case matters!!'
        stop
     END
  ENDCASE
  
  RETURN, wcomp
END
;========================================================================================================================


;========================================================================================================================
function getpriors, xpriors
  
  npriors = n_elements(xpriors)
  struc = {var:'mu1', comp:'EQ', val:0.0D}
  priors = replicate(struc, npriors)
  
  FOR xx=0, npriors-1, 1 DO BEGIN
     current = xpriors[xx]
     splits = strsplit(current, /EXTRACT)
     chk = chkvar(splits[0], XCURRENT=current)
     priors[xx].var = splits[0]
     chk = chkcomp(splits[1], XCURRENT=current)
     priors[xx].comp = splits[1]
     priors[xx].val = splits[2]
  ENDFOR

  RETURN, priors
END
;========================================================================================================================


;========================================================================================================================
function evalpriors, xjumpspot, xpriors, xtags, xwhich
  

  chk = where(xtags[xwhich] EQ xpriors.var)
  IF chk[0] NE -1 THEN BEGIN
     FOR yy=0, n_elements(chk)-1, 1 DO BEGIN
        CASE xpriors[chk[yy]].comp OF
           'EQ' : test = xjumpspot.(xwhich) EQ xpriors[chk[yy]].val 
           'NE' : test = xjumpspot.(xwhich) NE xpriors[chk[yy]].val
           'GT' : test = xjumpspot.(xwhich) GT xpriors[chk[yy]].val
           'GE' : test = xjumpspot.(xwhich) GE xpriors[chk[yy]].val 
           'LT' : test = xjumpspot.(xwhich) LT xpriors[chk[yy]].val  
           'LE' : test = xjumpspot.(xwhich) LE xpriors[chk[yy]].val  
           ELSE : BEGIN
              print, 'WARNING!! Something went horribly wrong!!'
              stop
           END
        ENDCASE
        IF yy EQ 0 THEN otest = test ELSE otest = otest*test
     ENDFOR
  ENDIF ELSE otest = 1

  RETURN, otest
END
;========================================================================================================================



;========================================================================================================================
pro bayesian_gauss3_lincont, xs, ys, yerr, INSTANCE=instance, FITVALS=fitvals, YOFFSET=yoffset, $
                             GUESSES=guesses, PRIORS=priors, $ 
                             GMU1=gmu1, GSIG1=gsig1, GSIG2=gsig2, GSIG3=gsig3, $
                             GC1=gc1, GC2=gc2, GC3=gc3, GA=ga, GB=gb, $
                             NSTEPS=nsteps, BURNFRAC=burnfrac, $
                             NOPFIT=nopfit, NOPDATA=nopdata, PLOTFIT=plotfit, PLOTPARAMS=plotparams, CALL=call, $
                             VERBOSE=verbose, HELP=help

;+
; NAME:
;       BAYESIAN_GAUSS3_LINCONT()
;
; PURPOSE:
;       Fits a Gaussian function with a linear background of the form
;       f(x) = c1*exp(-(x-mu1)^2/(2*sigma1^2)) + 
;              c2*exp(-(x-mu2)^2/(2*sigma2^2)) + 
;              c3*exp(-(x-mu3)^2/(2*sigma3^2)) + a*x + b   
;       where mu1, mu2 and mu3 MUST have a predetermined relationship
;       and c1, c2, c3 can also depending on the circumstances i.e. dithered
;       NIR spectra or strong emission lines
;
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;       xs: data points' x values
;       ys: data points' y values
;       yerr: data points' y errors
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;       verbose: how much info is printed to screen during run 
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;
; COMMON BLOCKS:
;
; PROCEDURES USED:
;
; COMMENTS:
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2014 Feb 3, Univ. Cali, Riverside v1.1.1
;          -added pause to see plot if iterating
;       A. DeGroot, 2014 Feb 3, Univ. Cali, Riverside v1.1.0
;          -added check if any errors=0
;       A. DeGroot, 2014 Feb 3, Univ. Cali, Riverside v1.0.0
;
;
; DESIRED UPGRADES
;       Add option of double precision calculations
;       Add function to change step size as necessary
;       Add ability to skip over certain parts of data
;
;-


  IF keyword_set(NSTEPS) THEN nsteps = nsteps[0] ELSE nsteps = 250000                  ;sets new value
  IF keyword_set(BURNFRAC) THEN BEGIN                                                  ;check if set
     IF (burnfrac[0] LT 0.0) OR (burnfrac[0] GT 1.0) THEN BEGIN                        ;check if makes sense
        print, 'Value given for BURNFRAC keyword makes no sense! Using default value!' ;print warning
        burnfrac = 0.15                                                                ;set to default
     ENDIF                                                                             ;end check makes sense
     burnfrac = burnfrac[0]                                                            ;sets new value
  ENDIF ELSE burnfrac = 0.15                                                           ;sets new value
  IF keyword_set(NOPFIT) THEN nopfit = 'N' ELSE nopfit = 'Y'                           ;sets new value
  IF keyword_set(NOPDATA) THEN nopdata = 'N' ELSE nopdata = 'Y'                        ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                   ;sets new value
  IF keyword_set(HELP) THEN help = help[0] ELSE help = 'N'                             ;sets new value
  
  ;;;Help Desk 
  IF help EQ 'Y' THEN BEGIN     ;check VERBOSE keyword
     help, xs                   ;help info
     help, ys                   ;help info
     help, yerr                 ;help info
  ENDIF                         ;end check VERBOSE keyword
  IF verbose GE 4 THEN BEGIN    ;check VERBOSE keyword
     print, xs                  ;print info
     print, ys                  ;print info
     print, yerr                ;print info
     print, ' '                 ;space
  ENDIF                         ;end check VERBOSE keyword
  
  
  
  ;;;sanity checks
  nxs = n_elements(xs)                                                 ;find # of elements
  nys = n_elements(ys)                                                 ;find # of elements
  nyerr = n_elements(yerr)                                             ;find # of elements
  if (nxs NE nys) then print, 'WARNING: # of xs not equal # of ys'     ;print warning 
  if (nys NE nyerr) then print, 'WARNING: # of ys not equal # of yerr' ;print warning 
  
    
  ;;;deal with initial guesses
  iguess = {mu1:0.0D, sig1:0.0D, sig2:0.0D, sig3:0.0D, $                   ;cont next line
            c1:0.0D, c2:0.0D, c3:0.0D, a:0.0D, b:0.0D, mu2:0.0D, mu3:0.0D} ;storage for values
  tags = tag_names(iguess)                                                 ;get tag names
  tags = strlowcase(tags)                                                  ;get tag names
  IF keyword_set(GUESSES) THEN BEGIN
     iguess.mu1 = guesses.mu1   ;store value
     iguess.sig1 = guesses.sig1 ;store value
     iguess.sig2 = guesses.sig2 ;store value
     iguess.sig3 = guesses.sig3 ;store value
     iguess.c1 = guesses.c1     ;store value
     iguess.c2 = guesses.c2     ;store value
     iguess.c3 = guesses.c3     ;store value
     iguess.a = guesses.a       ;store value
     iguess.b = guesses.b       ;store value
  ENDIF
  nvar = n_tags(iguess)-2       ;remember mus are correlated, 3->1
  
  
  ;;;Case specific information
  CASE instance[0] OF
     'MOSFIRE' : BEGIN                                                                     ;if MOSFIRE 2D reduction
        IF keyword_set(YOFFSET) THEN yoffset = yoffset[0] ELSE BEGIN                       ;must provide value
           print, 'WARNING!! With MOSFIRE keyword set you must also set YOFFSET keyword!!' ;print error
           stop                                                                            ;stop run
        ENDELSE                                                                            ;end if value not provided
        pyoffset = (2.0*yoffset) / 0.18                                                     ;change from arcsec to pixels
        iguess = mosfireguess(iguess, xs, ys, pyoffset)                                     ;fill in any nonzero guesses
        mu1step = 1.0                                       ;
        sig1step = 0.5                                                                     ;
        sig2step = 0.5                                                                     ;
        sig3step = 0.5                                                                     ;
        c1step = 0.5                                                                       ;
        c2step = 10.5                                                                       ;
        c3step = 0.5                                                                       ;
        astep = 0.08                                                                       ;
        bstep = 0.5                                                                       ;
     END                                                                                   ;end MOSFIRE 2D reduction
     'HaNII' : BEGIN                                                                       ;specific emission lines
        print, 'NEEDS WORK!!'                                                              ;
        stop                                                                               ;
     END                                                                                   ;end specific emission lines
     ELSE : BEGIN                                                                          ;no suitable case
        print, 'WARNING!! INSTANCE not found!!'                                            ;print warning 
        print, '  Please use either "MOSFIRE" or "HaNII"!!'                                ;print options
        stop                                                                               ;stop run
     END                                                                                   ;end no suitable case
  ENDCASE                                                                                  ;which case are we in
  
    
  
  ;;;mcmc counters and stuff
  randoms = uniformran(nsteps, 3)  ;chooses random devs from uniform dist
  bsteps = floor(burnfrac*nsteps)  ;how many burn steps
  brandoms = uniformran(bsteps, 3) ;chooses random devs from uniform dist
  ja = 0UL                         ;initialize counter
  jf = 0UL                         ;initialize counter
  bja = 0UL                        ;initialize counter
  bjf = 0UL                        ;initialize counter
  
  
  ;;;CDF calculations for random draws
  gausscdf, mu1step, mu1cdf, mu1diff
  gausscdf, sig1step, sig1cdf, sig1diff
  gausscdf, sig2step, sig2cdf, sig2diff 
  gausscdf, sig3step, sig3cdf, sig3diff 
  gausscdf, c1step, c1cdf, c1diff
  gausscdf, c2step, c2cdf, c2diff
  gausscdf, c3step, c3cdf, c3diff 
  gausscdf, astep, acdf, adiff
  gausscdf, bstep, bcdf, bdiff 
  
  IF help EQ 'Y' THEN BEGIN
     help, mu1cdf
     help, sig1cdf
     help, sig2cdf
     help, sig3cdf
     help, c1cdf
     help, c2cdf
     help, c3cdf
     help, acdf
     help, bcdf
  ENDIF
  
  ;;;Shift data points to the center of the 
  medxs = median(xs)              ;find median of x vals
  xs = xs - medxs                 ;subtract off median
  iguess.mu1 = iguess.mu1 - medxs ;shift
  iguess.mu2 = iguess.mu2 - medxs ;shift
  iguess.mu3 = iguess.mu3 - medxs ;shift


  ;;;extract priors
  ypriors = getpriors(priors)                                                             ;extract priors from strings
  chk = where((ypriors.var EQ 'mu1') OR (ypriors.var EQ 'mu3') OR (ypriors.var EQ 'mu3')) ;find any mu priors
  IF chk[0] NE -1 THEN ypriors[chk].val = ypriors[chk].val - medxs                        ;shift comparisons by median x val
  
  ;;;starting out the burn in phase
  burnmarkov = replicate(iguess, bsteps)        ;the burn markov chain
  first = evaluate(xs, burnmarkov[0])           ;evaluate points given fit parameters
  IF nopfit EQ 'Y' THEN BEGIN                   ;check nopfit status
     tmpxs = xs + medxs                         ;subtract off median
     oplot, tmpxs, first, LINESTYLE=0, $        ;overplot starting fit
            COLOR='00FF00'XL, $                 ;plot options
            THICK=3.0                           ;plot options
  ENDIF                                         ;end nopfit status
  chk = where(yerr EQ 0.0)                      ;safety check for yerr=0
  if chk[0] NE -1 THEN yerr[chk] = median(yerr) ;new value in place of 0
  denom = 2.0*yerr^2                            ;find denom in exp
  likeli = (-1.0*(ys-first)^2/denom)            ;find likelihood
  jl = total(likeli)                            ;joint likelihood
  jl = exp(jl)                                  ;out of log space


  ;;;Pick which varible to jump each step for burn in
  which = intarr(bsteps)
  howmany = ulonarr(nvar)
  howmanyacc = ulonarr(nvar)
  FOR zz=0, nvar-1, 1 DO BEGIN
     fzz = float(zz)
     fzzp = float(zz+1)
     chk = where((brandoms[*,0] GE double(fzz/nvar)) AND ((brandoms[*,0] LT double(fzzp/nvar))), nchk)
     IF chk[0] NE -1 THEN BEGIN
        which[chk] = zz
        howmany[zz] = nchk
     ENDIF
  ENDFOR


  ;;;Burn in Markov Chain Loop
  FOR bb=0UL, bsteps-1, 1 DO BEGIN                                                                ;loop over # steps
     line = strcompress('  Now on step ' + string(bb) + ' of ' + string(bsteps) + ' for burn in') ;info
     IF (verbose GE 1) AND (bb MOD floor(0.1*nsteps) EQ 0) THEN print, line                       ;print info
     jumpspot = burnmarkov[bja]                                                                   ;copy current location
     
     CASE which[bb] OF                                             ;which variable
        0 : BEGIN                                                  ;first
           spot = min((mu1cdf - randoms[bb,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = mu1diff[indmin]                                  ;corresponding x val
           jumpspot.mu1 = jumpspot.mu1 + jump                      ;jump parameter
           jumpspot.mu2 = jumpspot.mu2 + jump                      ;jump parameter
           jumpspot.mu3 = jumpspot.mu3 + jump                      ;jump parameter
        END
        1 : BEGIN
           spot = min((sig1cdf - randoms[bb,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = sig1diff[indmin]                                  ;corresponding x val
           jumpspot.sig1 = jumpspot.sig1 + jump                     ;jump parameter
        END
        2 : BEGIN
           spot = min((sig2cdf - randoms[bb,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = sig2diff[indmin]                                  ;corresponding x val
           jumpspot.sig2 = jumpspot.sig2 + jump                     ;jump parameter
        END
        3 : BEGIN
           spot = min((sig3cdf - randoms[bb,1]), indmin, /ABSOLUTE);closest in CDF
           jump = sig3diff[indmin]                                 ;corresponding x val
           jumpspot.sig3 = jumpspot.sig3 + jump                    ;jump parameter
        END
        4 : BEGIN
           spot = min((c1cdf - randoms[bb,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = c1diff[indmin]                                  ;corresponding x val
           jumpspot.c1 = jumpspot.c1 + jump                       ;jump parameter
        END
        5 : BEGIN
           spot = min((c2cdf - randoms[bb,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = c2diff[indmin]                                  ;corresponding x val
           jumpspot.c2 = jumpspot.c2 + jump                       ;jump parameter
        END
        6 : BEGIN
           spot = min((c3cdf - randoms[bb,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = c3diff[indmin]                                  ;corresponding x val
           jumpspot.c3 = jumpspot.c3 + jump                       ;jump parameter
        END
        7 : BEGIN
           spot = min((acdf - randoms[bb,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = adiff[indmin]                                  ;corresponding x val
           jumpspot.a = jumpspot.a + jump                        ;jump parameter
        END
        8 : BEGIN
           spot = min((bcdf - randoms[bb,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = bdiff[indmin]                                  ;corresponding x val
           jumpspot.b = jumpspot.b + jump                        ;jump parameter
        END
        ELSE : BEGIN
           print, 'WARNING!! Something has gone horriby wrong!!'
           stop
        END
     ENDCASE

     ;;;Jump and re-evaluatate, including priors
     test = evaluate(xs, jumpspot)                             ;evaluate given fit parameters
     likeli = (-1.0*(ys-test)^2/denom)                         ;find likelihood
     tmpjl = total(likeli)                                     ;joint likelihood
     tmpjl = exp(tmpjl)                                        ;out of log space
     chkprior = evalpriors(jumpspot, ypriors, tags, which[bb]) ;check priors
     IF chkprior EQ 0 then tmpjl = 0.0D                        ;if prior fails
     
     ;;;Decide whether or not to jump        
     IF tmpjl GT jl then begin                                    ;compares joint likelihoods
        burnmarkov[bja+1] = store(burnmarkov[bja+1], jumpspot)    ;updates location in param space
        jl = tmpjl                                                ;updates joint likelihood value
        howmanyacc[which[bb]]++                                   ;up counter for var
        bja++                                                     ;ups counter
     ENDIF ELSE BEGIN                                             ;end check joint likelihoods
        limit = tmpjl / jl                                        ;find ratio
        IF randoms[bb,2] LT limit THEN BEGIN                      ;check uniform ran against limit
           burnmarkov[bja+1] = store(burnmarkov[bja+1], jumpspot) ;updates location in param space
           jl = tmpjl                                             ;updates joint likelihood value
           howmanyacc[which[bb]]++                                ;up counter for var
           bja++                                                  ;ups counter
        ENDIF ELSE jf++                                           ;end check of uniform ran against limit
     ENDELSE                                                      ;end alt to joint likelihoods     
  ENDFOR                                                          ;end loop over steps
  
  IF nopfit EQ 'Y' THEN BEGIN             ;check nopfit status
     tmpxs = xs + medxs                   ;subtract off median
     next = evaluate(xs, burnmarkov[bja]) ;evaluate
     oplot, tmpxs, next, LINESTYLE=0, $   ;overplot starting fit
            COLOR='FF0000'XL, $           ;plot options
            THICK=3.0                     ;plot options
  ENDIF                                   ;end nopfit status

  
  ;;;Starting out the markov chain
  markov = replicate(burnmarkov[bja], nsteps) ;creates markov chain
  chk = evaluate(xs, markov[0])               ;evaluate points given fit parameters
  likeli = (-1.0*(ys-chk)^2/denom)            ;find likelihood
  chkjl = total(likeli)                       ;joint likelihood
  chkjl = exp(chkjl)                          ;out of log space
  

  ;;;Pick which varible to jump each step
  which = intarr(nsteps)
  howmany = ulonarr(nvar)
  howmanyacc = ulonarr(nvar)
  FOR zz=0, nvar-1, 1 DO BEGIN
     fzz = float(zz)
     fzzp = float(zz+1)
     chk = where((randoms[*,0] GE double(fzz/nvar)) AND ((randoms[*,0] LT double(fzzp/nvar))), nchk)
     IF chk[0] NE -1 THEN BEGIN
        which[chk] = zz
        howmany[zz] = nchk
     ENDIF
  ENDFOR


  ;;;Markov Chain Loop
  FOR aa=0UL, nsteps-1, 1 DO BEGIN                                               ;loop over # steps
     line = strcompress('  Now on step ' + string(aa) + ' of ' + string(nsteps)) ;info
     IF (verbose GE 1) AND (aa MOD floor(0.1*nsteps) EQ 0) THEN print, line      ;print info
     jumpspot = markov[ja]                                                       ;copy current location
     
     ;;;Proposed jump, which variable and how far
     CASE which[aa] OF                                             ;which variable
        0 : BEGIN                                                  ;first
           spot = min((mu1cdf - randoms[aa,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = mu1diff[indmin]                                  ;corresponding x val
           jumpspot.mu1 = jumpspot.mu1 + jump                      ;jump parameter
           jumpspot.mu2 = jumpspot.mu2 + jump                      ;jump parameter
           jumpspot.mu3 = jumpspot.mu3 + jump                      ;jump parameter
        END
        1 : BEGIN
           spot = min((sig1cdf - randoms[aa,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = sig1diff[indmin]                                  ;corresponding x val
           jumpspot.sig1 = jumpspot.sig1 + jump                     ;jump parameter
        END
        2 : BEGIN
           spot = min((sig2cdf - randoms[aa,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = sig2diff[indmin]                                  ;corresponding x val
           jumpspot.sig2 = jumpspot.sig2 + jump                     ;jump parameter
        END
        3 : BEGIN
           spot = min((sig3cdf - randoms[aa,1]), indmin, /ABSOLUTE);closest in CDF
           jump = sig3diff[indmin]                                 ;corresponding x val
           jumpspot.sig3 = jumpspot.sig3 + jump                    ;jump parameter
        END
        4 : BEGIN
           spot = min((c1cdf - randoms[aa,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = c1diff[indmin]                                  ;corresponding x val
           jumpspot.c1 = jumpspot.c1 + jump                       ;jump parameter
        END
        5 : BEGIN
           spot = min((c2cdf - randoms[aa,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = c2diff[indmin]                                  ;corresponding x val
           jumpspot.c2 = jumpspot.c2 + jump                       ;jump parameter
        END
        6 : BEGIN
           spot = min((c3cdf - randoms[aa,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = c3diff[indmin]                                  ;corresponding x val
           jumpspot.c3 = jumpspot.c3 + jump                       ;jump parameter
        END
        7 : BEGIN
           spot = min((acdf - randoms[aa,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = adiff[indmin]                                  ;corresponding x val
           jumpspot.a = jumpspot.a + jump                        ;jump parameter
        END
        8 : BEGIN
           spot = min((bcdf - randoms[aa,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = bdiff[indmin]                                  ;corresponding x val
           jumpspot.b = jumpspot.b + jump                        ;jump parameter
        END
        ELSE : BEGIN
           print, 'WARNING!! Something has gone horriby wrong!!'
           stop
        END
     ENDCASE

     ;;;Test priors and re-evaluatate
     test = evaluate(xs, jumpspot)                            ;evaluate given fit parameters
     likeli = (-1.0*(ys-test)^2/denom)                        ;find likelihood
     tmpjl = total(likeli)                                    ;joint likelihood
     tmpjl = exp(tmpjl)                                       ;out of log space
     chkprior = evalpriors(jumpspot, ypriors, tags, which[aa]) ;check priors
     IF chkprior EQ 0 then tmpjl = 0.0D                       ;if prior fails

     ;;;Decide whether or not to jump        
     IF tmpjl GT jl then begin                          ;compares joint likelihoods
        markov[ja+1] = store(markov[ja+1], jumpspot)    ;updates location in param space
        jl = tmpjl                                      ;updates joint likelihood value
        howmanyacc[which[aa]]++                         ;up counter for var
        ja++                                            ;ups counter
     ENDIF ELSE BEGIN                                   ;end check joint likelihoods
        limit = tmpjl / jl                              ;find ratio
        IF randoms[aa,2] LT limit THEN BEGIN            ;check uniform ran against limit
           markov[ja+1] = store(markov[ja+1], jumpspot) ;updates location in param space
           jl = tmpjl                                   ;updates joint likelihood value
           howmanyacc[which[aa]]++                      ;up counter for var
           ja++                                         ;ups counter
        ENDIF ELSE jf++                                 ;end check of uniform ran against limit
     ENDELSE                                            ;end alt to joint likelihoods

  ENDFOR                                                ;end loop over steps


  ;;;Escape clause if MCMC never jumps
  IF ja EQ 0 THEN BEGIN
     print, 'WARNING!! MCMC never jumped!! Quitting...'
     stop
  ENDIF


  ;;;post run processing
  markov = markov[0:ja]           ;kill not good space
  xs = xs + medxs                 ;add back median
  iguess.mu1 = iguess.mu1 + medxs ;shift back
  iguess.mu2 = iguess.mu2 + medxs ;shift back 
  iguess.mu3 = iguess.mu3 + medxs ;shift back
  markov.mu1 = markov.mu1 + medxs ;shift back
  markov.mu2 = markov.mu2 + medxs ;shift back
  markov.mu3 = markov.mu3 + medxs ;shift back
  

  fitvals = {mu1:0.0D, mu1p:0.0D, mu1m:0.0D, $
             mu2:0.0D, mu2p:0.0D, mu2m:0.0D, $
             mu3:0.0D, mu3p:0.0D, mu3m:0.0D, $
             sig1:0.0D, sig1p:0.0D, sig1m:0.0D, $
             sig2:0.0D, sig2p:0.0D, sig2m:0.0D, $
             sig3:0.0D, sig3p:0.0D, sig3m:0.0D, $ 
             c1:0.0D, c1p:0.0D, c1m:0.0D, $
             c2:0.0D, c2p:0.0D, c2m:0.0D, $
             c3:0.0D, c3p:0.0D, c3m:0.0D, $ 
             a:0.0D, ap:0.0D, am:0.0D, $
             b:0.0D, bp:0.0D, bm:0.0D, medxs:0.0D}
  
  bestmarkov = iguess
  fitvals.mu1 = mean(markov.mu1)
  bestmarkov.mu1 = fitvals.mu1
  fitvals.mu1p = (total((markov.mu1 - fitvals.mu1)^2) / ((ja-1)*ja))^0.5
  fitvals.mu1m = fitvals.mu1p
  fitvals.mu2 = mean(markov.mu2)
  bestmarkov.mu2 = fitvals.mu2
  fitvals.mu3 = mean(markov.mu3)
  bestmarkov.mu3 = fitvals.mu3
  fitvals.sig1 = mean(markov.sig1)
  bestmarkov.sig1 = fitvals.sig1
  fitvals.sig1p = (total((markov.sig1 - fitvals.sig1)^2) / ((ja-1)*ja))^0.5
  fitvals.sig1m = fitvals.sig1p
  fitvals.sig2 = mean(markov.sig2)
  bestmarkov.sig2 = fitvals.sig2
  fitvals.sig2p = (total((markov.sig2 - fitvals.sig2)^2) / ((ja-1)*ja))^0.5
  fitvals.sig2m = fitvals.sig2p
  fitvals.sig3 = mean(markov.sig3)
  bestmarkov.sig3 = fitvals.sig3
  fitvals.sig3p = (total((markov.sig3 - fitvals.sig3)^2) / ((ja-1)*ja))^0.5
  fitvals.sig3m = fitvals.sig3p
  fitvals.c1 = mean(markov.c1)
  bestmarkov.c1 = fitvals.c1
  fitvals.c1p = (total((markov.c1 - fitvals.c1)^2) / ((ja-1)*ja))^0.5
  fitvals.c1m = fitvals.c1p
  fitvals.c2 = mean(markov.c2)
  bestmarkov.c2 = fitvals.c2
  fitvals.c2p = (total((markov.c2 - fitvals.c2)^2) / ((ja-1)*ja))^0.5
  fitvals.c2m = fitvals.c2p
  fitvals.c3 = mean(markov.c3)
  bestmarkov.c3 = fitvals.c3
  fitvals.c3p = (total((markov.c3 - fitvals.c3)^2) / ((ja-1)*ja))^0.5
  fitvals.c3m = fitvals.c3p
  fitvals.a = mean(markov.a)
  bestmarkov.a = fitvals.a
  fitvals.ap = (total((markov.a - fitvals.a)^2) / ((ja-1)*ja))^0.5
  fitvals.am = fitvals.ap
  fitvals.b = mean(markov.b)
  bestmarkov.b = fitvals.b
  fitvals.bp = (total((markov.b - fitvals.b)^2) / ((ja-1)*ja))^0.5
  fitvals.bm = fitvals.bp
  fitvals.medxs = medxs
  IF nopfit EQ 'Y' THEN BEGIN           ;check nopfit status
     best = evaluate(xs, bestmarkov)    ;evaluate
     oplot, xs, best, LINESTYLE=0, $    ;overplot starting fit
            COLOR='FF00FF'XL, $         ;plot options
            THICK=3.0                   ;plot options
  ENDIF                                 ;end nopfit status
  wait, 5.0                             ;pause to see the plot
  
  ;;;Write a plot of fitting
  IF keyword_set(PLOTFIT) THEN plotfit = plotfit[0] ELSE plotfit = 'mosfirespatproffit.ps'
  title = strcompress('Spatial Profile Fit ' + string(call))
  set_plot, 'ps'
  device, FILENAME=plotfit, Bits_per_Pixel=8, /COLOR
  ploterror, xs, ys, yerr, PSYM=0, $
             COLOR='000000'XL, $
             ERRCOLOR='000000'XL, $
             BACKGROUND='FFFFFF'Xl, $
             TITLE=title, $
             XTITLE='Spatial Row [Pixels]', $
             YTITLE='Flux [arbitrary units]', $
             CHARSIZE = 1.5, $
             CHARTHICK = 3.0
  oplot, xs, first, LINESTYLE=0, $   ;overplot starting fit
         COLOR=100, THICK=4.0 ;plot options
  oplot, xs, next, LINESTYLE=0, $    ;overplot starting fit
         COLOR=175, THICK=4.0 ;plot options
  oplot, xs, best, LINESTYLE=0, $    ;overplot starting fit
         COLOR=250, THICK=4.0 ;plot options
  legend, ['Initial Guess', 'Post Burn-In', 'Best Fit'], $ ;create legend
          LINESTYLE=[0,0,0],  $                            ;legend options
          COLOR=[100, 175, 250], $                         ;legend options
          TEXTCOLOR='000000'XL, $                          ;legend options
          CHARSIZE=1.2, CHARTHICK=3.0, $                   ;legend opts
          THICK=4.0, BOX=0, /RIGHT                         ;legend options

  device, /CLOSE
  set_plot, 'x'


  ;;;A bit of post run data
  IF verbose GE 1 THEN BEGIN                                               ;check verbose
     line = strcompress('  Number of jumps accepted: ' + string(ja) + $    ;cont next line
                        ' out of ' + string(nsteps))                       ;info
     print, line                                                           ;print info
     print, '  Number of Accepted Steps for Each Variable: '               ;print info
     print, strcompress('   mus: ' + string(howmanyacc[0]) + ' of ' + string(howmany[0]))  ;print info
     print, strcompress('   sig1: ' + string(howmanyacc[1]) + ' of ' + string(howmany[1])) ;print info
     print, strcompress('   sig2: ' + string(howmanyacc[2]) + ' of ' + string(howmany[2])) ;print info
     print, strcompress('   sig3: ' + string(howmanyacc[3]) + ' of ' + string(howmany[3])) ;print info
     print, strcompress('   c1: ' + string(howmanyacc[4]) + ' of ' + string(howmany[4]))   ;print info
     print, strcompress('   c2: ' + string(howmanyacc[5]) + ' of ' + string(howmany[5]))   ;print info
     print, strcompress('   c3: ' + string(howmanyacc[6]) + ' of ' + string(howmany[6]))   ;print info
     print, strcompress('   a: ' + string(howmanyacc[7]) + ' of ' + string(howmany[7]))    ;print info
     print, strcompress('   b: ' + string(howmanyacc[8]) + ' of ' + string(howmany[8]))    ;print info
  ENDIF                                                                    ;end verbose check
  

  ;;;Make some plots
  IF keyword_set(PLOTPARAMS) THEN plotparams = plotparams[0] ELSE plotparams = 'mosfirespatprofparams.ps'
  set_plot, 'ps'
  device, FILENAME = plotparams

  cghistoplot, markov.mu1, XTITLE = 'Mu1',  YTITLE = 'Frequency', $
               CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue']
  cghistoplot, markov.sig1, XTITLE = 'Sig1',  YTITLE = 'Frequency', $
               CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue']
  cghistoplot, markov.sig2, XTITLE = 'Sig2',  YTITLE = 'Frequency', $
               CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue']
  cghistoplot, markov.sig3, XTITLE = 'Sig3',  YTITLE = 'Frequency', $
               CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue']
  cghistoplot, markov.c1, XTITLE = 'C1',  YTITLE = 'Frequency', $
               CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue']
  cghistoplot, markov.c2, XTITLE = 'C2',  YTITLE = 'Frequency', $
               CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue']
  cghistoplot, markov.c3, XTITLE = 'C3',  YTITLE = 'Frequency', $
               CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue']
  cghistoplot, markov.a, XTITLE = 'A',  YTITLE = 'Frequency', $
               CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue']
  cghistoplot, markov.b, XTITLE = 'B',  YTITLE = 'Frequency', $
               CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue']
  
  device, /CLOSE                ;closes device
  set_plot, 'x'

  RETURN
END
;========================================================================================================================




;========================================================================================================================
pro bayesian_gauss3_lincont_example

  print, 1
end
;========================================================================================================================
