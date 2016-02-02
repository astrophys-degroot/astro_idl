;========================================================================================================================
function upgradenirbase, xbase, xborder 


  ;;;deal with BORDER first
  IF xborder GT 1 THEN BEGIN
     CASE xborder OF
        2 : add_tags, xbase, ['X1'], ['0.0D'], xbasea
        3 : add_tags, xbase, ['X1', 'X2'], ['0.0D', '0.0D'], xbasea
        4 : add_tags, xbase, ['X1', 'X2', 'X3'], ['0.0D', '0.0D', '0.0D'], xbasea
        5 : add_tags, xbase, ['X1', 'X2', 'X3', 'X4'], ['0.0D', '0.0D', '0.0D', '0.0D'], xbasea
        ELSE : BEGIN
           print, 'WARNING!! Something has gone horribly wrong!!'
           stop
        END
     ENDCASE
  ENDIF ELSE xbasea = xbase
  
  RETURN, xbasea
END
;========================================================================================================================



;========================================================================================================================
function makeiguess, xupgrade, xguesses, VERBOSE=verbose


  FOR xx=n_elements(xguesses)-1, 0, -1 DO BEGIN
     bits = strsplit(xguesses[xx], '=', /EXTRACT)
     CASE bits[0] OF
        'sig' : BEGIN
           bit = strcompress(bits[0], /REMOVE_ALL)
           tmp = tagind(xupgrade, bit, NOTE='Initial guess not understood!')
           xupgrade.(tmp) = float(bits[1])
        END
        'c' : BEGIN
           bit = strcompress(bits[0], /REMOVE_ALL)
           tmp = tagind(xupgrade, bit, NOTE='Initial guess not understood!')
           xupgrade.(tmp) = float(bits[1])
        END
        ELSE : BEGIN
           tmp = tagind(xupgrade, bits[0], NOTE='Initial guess not understood!')
           xupgrade.(tmp) = float(bits[1])
        END
     ENDCASE
  ENDFOR  
  
  RETURN, xupgrade
END
;========================================================================================================================



;========================================================================================================================
function varyhownir, xvary, cdfpts
  
  tagnames = tag_names(xvary)
  FOR xx=0, n_elements(tagnames)-1, 1 DO BEGIN
     CASE 1 OF 
        tagnames[xx] EQ 'X0' : xvary.x0 = 0.2
        tagnames[xx] EQ 'X1' : xvary.x1 = 0.1
        tagnames[xx] EQ 'X2' : xvary.x2 = 0.05
        tagnames[xx] EQ 'X3' : xvary.x3 = 0.01
        tagnames[xx] EQ 'X4' : xvary.x4 = 0.002
        tagnames[xx] EQ 'X5' : xvary.x5 = 0.001
        tagnames[xx] EQ 'MU' : xvary.mu = 1.00
        strmatch(tagnames[xx], 'sig*', /FOLD_CASE) : BEGIN
           ind = tagind(xvary, tagnames[xx], NOTE='varyhow1')
           xvary.(ind) = 0.25
        END
        strmatch(tagnames[xx], 'c*', /FOLD_CASE) : BEGIN
           ind = tagind(xvary, tagnames[xx], NOTE='varyhow2')
           xvary.(ind) = 0.5
        END
        ELSE : BEGIN
           print, 'WARNING!! Couldnt resolve tag name!!'
           print, tagnames[xx]
           stop
        ENDELSE
     ENDCASE
  ENDFOR
  
  array = dblarr(cdfpts)                                   ;create array
  tagnames = tag_names(xvary)                              ;find # tags remaining
  tagnames1 = strcompress(tagnames + '_diff', /REMOVE_ALL) ;new tag names
  tagnames2 = strcompress(tagnames + '_cdf', /REMOVE_ALL)  ;new tag names
  FOR xx=0, n_elements(tagnames1)-1, 1 DO BEGIN            ;loop over new tags
     add_tag, xvary, tagnames1[xx], array, tmpvary         ;add new tag
     xvary = 0                                             ;reset
     xvary = tmpvary                                       ;renew
     tmpvary = 0                                           ;reset
  ENDFOR                                                   ;end loop new tags
  FOR xx=0, n_elements(tagnames2)-1, 1 DO BEGIN            ;loop over new tags 
     add_tag, xvary, tagnames2[xx], array, tmpvary         ;add new tag
     xvary = 0                                             ;reset
     xvary = tmpvary                                       ;renew
     tmpvary = 0                                           ;reset
  ENDFOR                                                   ;end loop new tags
  
  RETURN, xvary
END
;========================================================================================================================



;========================================================================================================================
function varyhowmuchnir, xvary, nvar


  ;;;CDF calculations
  fulltags = tag_names(xvary)         ;get tag names again
  FOR xx=0, nvar-1, 1 DO BEGIN        ;loop over variables
     gausscdf, xvary.(xx), tmp1, tmp2 ;get difference, cdfs
     xvary.(xx+nvar) = tmp2           ;set value
     xvary.(xx+2*nvar) = tmp1         ;set value
  ENDFOR                              ;end loop over variable
  
  RETURN, xvary
END
;========================================================================================================================



;========================================================================================================================
function jumps, xsteps, xnvar, xrandoms
  
  jstuff = {which:intarr(xsteps), howmany:ulonarr(xnvar), howmanyacc:ulonarr(xnvar)}

  FOR zz=0, xnvar-1, 1 DO BEGIN                                            ;loop over xnvar
     fzz = double(zz)/double(xnvar)                                        ;lower bound
     fzzp = double(zz+1)/double(xnvar)                                     ;upper bound
     chk = where((xrandoms[*,0] GE fzz) AND (xrandoms[*,0] LT fzzp), nchk) ;which ones
     IF chk[0] NE -1 THEN BEGIN                                            ;check for some
        jstuff.which[chk] = zz                                             ;set which  
        jstuff.howmany[zz] = nchk                                          ;set how many
     ENDIF ELSE BEGIN                                                      ;end check some
        print, 'WARNING!! Something is horribly wrong!!'                   ;print info
        print, 'One variable was never selected to jump!!'                 ;print info
        stop                                                               ;stop run
     ENDELSE                                                               ;end alt to check some
  ENDFOR                                                                   ;end loop over some

  RETURN, jstuff
END
;========================================================================================================================



;========================================================================================================================
function evalpriors, xspot, xpriors, xtags, XWHICH=xwhich
  

  IF keyword_set(XWHICH) THEN BEGIN
     chk = where(xtags[xwhich] EQ xpriors.var)
     IF chk[0] NE -1 THEN BEGIN
        FOR yy=0, n_elements(chk)-1, 1 DO BEGIN
           CASE xpriors[chk[yy]].comp OF
              'EQ' : test = xspot.(xwhich) EQ xpriors[chk[yy]].val 
              'NE' : test = xspot.(xwhich) NE xpriors[chk[yy]].val
              'GT' : test = xspot.(xwhich) GT xpriors[chk[yy]].val
              'GE' : test = xspot.(xwhich) GE xpriors[chk[yy]].val 
              'LT' : test = xspot.(xwhich) LT xpriors[chk[yy]].val  
              'LE' : test = xspot.(xwhich) LE xpriors[chk[yy]].val  
              ELSE : BEGIN
                 print, 'WARNING!! Something went horribly wrong!!'
                 stop
              END
           ENDCASE
           IF yy EQ 0 THEN otest = test ELSE otest = otest*test
        ENDFOR
     ENDIF ELSE otest = 1
  ENDIF ELSE BEGIN
     FOR zz=0, n_elements(xtags)-1, 1 DO BEGIN
        chk = where(xtags[zz] EQ xpriors.var)
        IF chk[0] NE -1 THEN BEGIN
           FOR yy=0, n_elements(chk)-1, 1 DO BEGIN
              CASE xpriors[chk[yy]].comp OF
                 'EQ' : test = xspot.(zz) EQ xpriors[chk[yy]].val 
                 'NE' : test = xspot.(zz) NE xpriors[chk[yy]].val
                 'GT' : test = xspot.(zz) GT xpriors[chk[yy]].val
                 'GE' : test = xspot.(zz) GE xpriors[chk[yy]].val 
                 'LT' : test = xspot.(zz) LT xpriors[chk[yy]].val  
                 'LE' : test = xspot.(zz) LE xpriors[chk[yy]].val  
                 ELSE : BEGIN
                    print, 'WARNING!! Something went horribly wrong!!'
                    stop
                 END
              ENDCASE
              IF yy EQ 0 THEN ptest = test ELSE ptest = ptest*test
           ENDFOR
        ENDIF ELSE ptest = 1
        IF zz EQ 0 THEN otest = ptest ELSE otest = otest*ptest             
     ENDFOR 
  ENDELSE

  RETURN, otest
END
;========================================================================================================================



;========================================================================================================================
function evaluate, xs, values, yoffset, medxs, RATIO=ratio

  IF keyword_set(RATIO) THEN ratio = ratio[0] ELSE ratio = -1.0 ;set new value
  
  IF tag_exist(values, 'X0') EQ 1 THEN tx0 = values.x0 ELSE tx0 = 0.0
  IF tag_exist(values, 'X1') EQ 1 THEN tx1 = values.x1 ELSE tx1 = 0.0
  IF tag_exist(values, 'X2') EQ 1 THEN tx2 = values.x2 ELSE tx2 = 0.0
  IF tag_exist(values, 'X3') EQ 1 THEN tx3 = values.x3 ELSE tx3 = 0.0
  IF tag_exist(values, 'X4') EQ 1 THEN tx4 = values.x4 ELSE tx4 = 0.0
  IF tag_exist(values, 'X5') EQ 1 THEN tx5 = values.x5 ELSE tx5 = 0.0
 
  cxs = xs - medxs              ;offset origin for fitting continuum
  fx = values.c*exp(-(xs-values.mu)^2/(2.0*values.sig^2)) + $
       (ratio*values.c)*exp(-(xs-(values.mu-yoffset))^2/(2.0*values.sig^2)) + $
       (ratio*values.c)*exp(-(xs-(values.mu+yoffset))^2/(2.0*values.sig^2)) + $
       tx0 + tx1*cxs + tx2*cxs^2 + tx3*cxs^3 + tx4*cxs^4 + tx5*cxs^5
  

  RETURN, fx 
END
;========================================================================================================================



;========================================================================================================================
function store, markov, jumpspot
  
  markov.mu = jumpspot.mu
  markov.sig = jumpspot.sig
  markov.c = jumpspot.c
  markov.x0 = jumpspot.x0
  IF tag_exist(jumpspot, 'X1') EQ 1 THEN markov.x1 = jumpspot.x1
  IF tag_exist(jumpspot, 'X2') EQ 1 THEN markov.x2 = jumpspot.x2
  IF tag_exist(jumpspot, 'X3') EQ 1 THEN markov.x3 = jumpspot.x3
  IF tag_exist(jumpspot, 'X4') EQ 1 THEN markov.x4 = jumpspot.x4
  IF tag_exist(jumpspot, 'X5') EQ 1 THEN markov.x5 = jumpspot.x5
 
  RETURN, markov 
END
;========================================================================================================================


;========================================================================================================================
function chkvarnir, xvar, XCURRENT=xcurrent
  
  xvar = strlowcase(xvar)
  CASE xvar OF
     'mu' : wvar = 1 
     'sig' : wvar = 2  
     'c' : wvar = 3 
     'x0' : wvar = 4 
     'x1' : wvar = 5 
     'x2' : wvar = 6 
     'x3' : wvar = 7 
     'x4' : wvar = 8 
     'x5' : wvar = 9 
     ELSE : BEGIN
        print, 'WARNING!! The varible provided for the following prior is not valid!!'
        print, '   ', xcurrent
        print, '   Choices for variable are: "mu" "sig" "c" "x1" "x2" "x3" "x4" "x5" '
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
  struc = {var:'mu', comp:'EQ', val:0.0D}
  priors = replicate(struc, npriors)
  
  FOR xx=0, npriors-1, 1 DO BEGIN
     current = xpriors[xx]
     splits = strsplit(current, /EXTRACT)
     chk = chkvarnir(splits[0], XCURRENT=current)
     priors[xx].var = splits[0]
     chk = chkcomp(splits[1], XCURRENT=current)
     priors[xx].comp = splits[1]
     priors[xx].val = splits[2]
  ENDFOR

  RETURN, priors
END
;========================================================================================================================



;========================================================================================================================
function makefitvals, xiguess

  tagnames = tag_names(xiguess)                    ;find tag names 
  fitvals = xiguess                                ;copy structure
  minus = strcompress(tagnames + 'M', /REMOVE_ALL) ;make new tags names
  plus = strcompress(tagnames + 'P', /REMOVE_ALL)  ;make new tags names
  value = '0.0d'                                   ;value to use
  values = replicate(value, n_elements(tagnames))  ;one value for each tag
  add_tags, fitvals, minus, values, tmpvals        ;add the tags
  fitvals = tmpvals                                ;capture new structure
  tmpvals = 0                                     ;reset temporary
  add_tags, fitvals, plus, values, tmpvals        ;add the tags
  fitvals = tmpvals                               ;capture new structure
  tmpvals = 0                                     ;reset temporary
  add_tag, fitvals, 'medxs', 0.0D, tmpvals        ;add a tag
  fitvals = tmpvals                               ;capture new structure
  tmpvals = 0                                     ;reset temporary
  
  RETURN, fitvals
END
;========================================================================================================================



;========================================================================================================================
pro bayesian_nir_spatial, xs, ys, yerr, INSTANCE=instance, FITVALS=fitvals, YOFFSET=yoffset, $
                          PRIORS=priors, GUESSES=guesses, GMU=gmu, GSIG=gsig, GC=gc, GA=ga, GB=gb, $
                          NSTEPS=nsteps, BURNFRAC=burnfrac, BORDER=border, CDFPTS=cdfpts, $
                          CALL=call, NOSHOWPLOT=noshowplot, NOSAVEPLOT=nosaveplot, VERBOSE=verbose, HELP=help
  
;+
; NAME:
;       BAYESIAN_NIR_SPATIAL()
;
; PURPOSE:
;       Fits a Gaussian function with a linear background of the form
;       f(x) = c*exp(-(x-mu1)^2/(2*sigma1^2)) + c2*exp(-(x-mu2)^2/(2*sigma2^2)) + 
;              c3*exp(-(x-mu3)^2/(2*sigma3^2)) + a*x + b   
;       where mu1, mu2 and mu3 have a predetermined relationship
;       aso do c1, c2, c3 based on the NIR spectrograph the data was
;       taken with
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
;       scatter plot with overlaid fits at various stages: 'bayesian_nir_spatproffit.ps'
;       marginalized PDFs of fitting paramters: 'bayesian_nir_spatprofparams.pdf'
;
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
;       A. DeGroot, 2015 March 4, Univ. Cali, Riverside v4.0.0
;          -upgraded plotting functionality and added NOPLOT keyword
;          -now requires IDL 8.3 or newer
;       A. DeGroot, 2014 March 5, Univ. Cali, Riverside v3.0.0
;          -working with MOSFIRE DRP v20140610 the negative 'flux' is
;          now equal to the positve signal's 'flux' and not half as before
;       A. DeGroot, 2014 March 5, Univ. Cali, Riverside v2.0.1
;          -output formatting
;       A. DeGroot, 2014 March 5, Univ. Cali, Riverside v2.0.0
;          -added constraints based on NIR dither knowledge
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

  version = '2.0.1'

  IF keyword_set(NSTEPS) THEN nsteps = nsteps[0] ELSE nsteps = 100000                  ;sets new value
  IF keyword_set(BURNFRAC) THEN BEGIN                                                  ;check if set
     IF (burnfrac[0] LT 0.0) OR (burnfrac[0] GT 1.0) THEN BEGIN                        ;check if makes sense
        print, 'Value given for BURNFRAC keyword makes no sense! Using default value!' ;print warning
        burnfrac = 0.15                                                                ;set to default
     ENDIF                                                                             ;end check makes sense
     burnfrac = burnfrac[0]                                                            ;sets new value
  ENDIF ELSE burnfrac = 0.15                                                           ;sets new value
  IF keyword_set(BORDER) THEN BEGIN                                                    ;check keyword
     IF (n_elements(border) GT 1) THEN BEGIN                                           ;check # values passed
        print, 'WARNING!! More than one value give for BORDER! Taking first element!'  ;print info
        border = border[0]                                                             ;take only 1st val
     ENDIF                                                                             ;end check # passed
     IF (border LT 1) OR (border GT 5) THEN BEGIN                                      ;check value passed
        print, 'WARNING!! BORDER keyword value makes no sense! Using closest value!'   ;print info
        IF border GT 5 THEN border = 5                                                 ;set value
        IF border LT 1 THEN border = 1                                                 ;set value
     ENDIF                                                                             ;end check value
  ENDIF ELSE border = 2                                                                ;sets new value
  IF keyword_set(CDFPTS) THEN cdfpts = cdfpts[0] ELSE cdfpts = 10001.0                 ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                   ;sets new value
  IF keyword_set(HELP) THEN help = help[0] ELSE help = 'N'                             ;sets new value
  

  ;;;Help Desk 
  IF verbose GE 1 THEN BEGIN                                                                           ;check verbose
     print, '  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' ;
     print, '  ' + strcompress(' BACKGROUND ORDER: ' + string(border))                                 ;print info
     print, '  ' + strcompress(' MCMC STEPS: ' + string(nsteps))                                       ;print info
     print, '  ' + strcompress(' MCMC BURN IN STEPS: ' + string(ulong(burnfrac*nsteps)))               ;print info
     print, '  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' ;
  ENDIF                                                                                                ;check verbose

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
  
    
  ;;;set up storage i.e. determine number of variables
  base = {mu:0.0D, sig:0.0D, c:0.0D, x0:0.0D} ;start the structure
  upgrade = upgradenirbase(base, border) ;beef up the structure
  

  ;;;deal with initial guesses
  IF keyword_set(GUESSES) THEN BEGIN                        ;if guesses provided
     iguess = makeiguess(upgrade, guesses, VERBOSE=verbose) ;put in guesses
     IF help EQ 'Y' THEN help, iguess, /STRUC               ;offer help
  ENDIF ELSE BEGIN                                          ;end guesses provided
     print, 'Please provide initial guesses'                ;print info
     stop                                                   ;stop run
  ENDELSE                                                   ;end alt to guesses
  nvar = n_tags(iguess)                                     ;remember mus, cs are correlated, 3->1


  ;;;mcmc counters and stuff
  randoms = uniformran(nsteps, 3)  ;chooses random devs from uniform dist
  wait, 2.0                        ;wait so randomu seed changes
  bsteps = floor(burnfrac*nsteps)  ;how many burn steps
  brandoms = uniformran(bsteps, 3) ;chooses random devs from uniform dist
  ja = 0UL                         ;initialize counter
  jf = 0UL                         ;initialize counter
  bja = 0UL                        ;initialize counter
  bjf = 0UL                        ;initialize counter
  

  ;;;varying parameters
  vary = iguess                           ;find variables to vary
  varytags = tag_names(vary)              ;get tag names of changing variables
  vary = varyhownir(vary, cdfpts)         ;get step size
  vary = varyhowmuchnir(vary, nvar)       ;fill vary array
  IF help EQ 'Y' THEN help, vary, /STRUCT ;offer help

  
  ;;;median to shift origin for when fitting continuum 
  medxs = median(xs)              ;find median of x vals


  ;;;extract priors
  ypriors = getpriors(priors)               ;extract priors from strings
  IF help EQ 'Y' THEN help, ypriors, /STRUC ;offer help


  ;;;enforce priors on initial guess
  chkprior = evalpriors(iguess, ypriors, varytags)             ;check priors
  IF chkprior EQ 0 THEN BEGIN                                  ;check against priors
     print, 'WARNING!! Initial Guess fails to satify priors!!' ;print info
     print, '  Please adjust initial guess values!!'           ;print info
     stop                                                      ;stop program
  ENDIF                                                        ;end check against priors


  ;;;Pick which varible to jump each step for burn in
  bstuff = jumps(bsteps, nvar, brandoms) 
  stuff = jumps(nsteps, nvar, randoms) 

  ;;;starting out the burn in phase
  burnmarkov = replicate(iguess, bsteps)              ;the burn markov chain
  first = evaluate(xs, burnmarkov[0], yoffset, medxs) ;evaluate points given fit parameters
  chk = where(yerr EQ 0.0)                            ;safety check for yerr=0
  if chk[0] NE -1 THEN yerr[chk] = median(yerr)       ;new value in place of 0
  denom = 2.0*yerr^2                                  ;find denom in exp
  likeli = (-1.0*(ys-first)^2/denom)                  ;find likelihood
  jl = total(likeli)                                  ;joint likelihood
  jl = exp(jl)                                        ;out of log space

 
  ;;;Burn in Markov Chain Loop
  FOR bb=0UL, bsteps-1, 1 DO BEGIN                                                                       ;loop over # steps
     line = '    ' + strcompress('Now on step ' + string(bb) + ' of ' + string(bsteps) + ' for burn in') ;info
     IF (verbose GE 1) AND (bb MOD floor(0.1*nsteps) EQ 0) THEN print, line                              ;print info
     jumpspot = burnmarkov[bja]                                                                          ;copy current location
     spot = min((vary.(bstuff.which[bb]+2*nvar) - brandoms[bb,1]), indmin, /ABSOLUTE)                    ;closest in CDF
     jump = vary.(bstuff.which[bb]+nvar)[indmin]                                                         ;corresponding x val
     jind = tagind(jumpspot, varytags[bstuff.which[bb]])                                                 ;which ind in jumpspot 
     jumpspot.(jind) = jumpspot.(jind) + jump                                                            ;proposed jump

     ;;;Jump and re-evaluatate, including priors
     test = evaluate(xs, jumpspot, yoffset, medxs)                               ;evaluate given fit parameters
     likeli = (-1.0*(ys-test)^2/denom)                                           ;find likelihood
     tmpjl = total(likeli)                                                       ;joint likelihood
     tmpjl = exp(tmpjl)                                                          ;out of log space
     chkprior = evalpriors(jumpspot, ypriors, varytags, XWHICH=bstuff.which[bb]) ;check priors
     IF chkprior EQ 0 then tmpjl = 0.0D                                          ;if prior fails

     ;;;Decide whether or not to jump        
     IF tmpjl GT jl then begin                                    ;compares joint likelihoods
        burnmarkov[bja+1] = store(burnmarkov[bja+1], jumpspot)    ;updates location in param space
        jl = tmpjl                                                ;updates joint likelihood value
        bstuff.howmanyacc[bstuff.which[bb]]++                     ;up counter for var
        bja++                                                     ;ups counter
     ENDIF ELSE BEGIN                                             ;end check joint likelihoods
        limit = tmpjl / jl                                        ;find ratio
        IF brandoms[bb,2] LT limit THEN BEGIN                     ;check uniform ran against limit
           burnmarkov[bja+1] = store(burnmarkov[bja+1], jumpspot) ;updates location in param space
           jl = tmpjl                                             ;updates joint likelihood value
           bstuff.howmanyacc[bstuff.which[bb]]++                  ;up counter for var
           bja++                                                  ;ups counter
        ENDIF ELSE bjf++                                          ;end check of uniform ran against limit
     ENDELSE                                                      ;end alt to joint likelihoods  
  ENDFOR                                                          ;end loop over steps
  next = evaluate(xs, burnmarkov[bja], yoffset, medxs)            ;evaluate
  
  ;;;Starting out the markov chain
  markov = replicate(burnmarkov[bja], nsteps)   ;creates markov chain
  chk = evaluate(xs, markov[0], yoffset, medxs) ;evaluate points given fit parameters
  likeli = (-1.0*(ys-chk)^2/denom)              ;find likelihood
  chkjl = total(likeli)                         ;joint likelihood
  chkjl = exp(chkjl)                            ;out of log space

  ;;;Markov Chain Loop
  FOR aa=0UL, nsteps-1, 1 DO BEGIN                                                      ;loop over # steps
     line = '    ' + strcompress('Now on step ' + string(aa) + ' of ' + string(nsteps)) ;info
     IF (verbose GE 1) AND (aa MOD floor(0.1*nsteps) EQ 0) THEN print, line             ;print info
     jumpspot = markov[ja]                                                              ;copy current location
     spot = min((vary.(stuff.which[aa]+2*nvar) - randoms[aa,1]), indmin, /ABSOLUTE)     ;closest in CDF
     jump = vary.(stuff.which[aa]+nvar)[indmin]                                         ;corresponding x val
     jind = tagind(jumpspot, varytags[stuff.which[aa]])                                 ;which ind in jumpspot 
     jumpspot.(jind) = jumpspot.(jind) + jump                                           ;proposed jump
     
     ;;;Test priors and re-evaluatate
     test = evaluate(xs, jumpspot, yoffset, medxs)                              ;evaluate given fit parameters
     likeli = (-1.0*(ys-test)^2/denom)                                          ;find likelihood
     tmpjl = total(likeli)                                                      ;joint likelihood
     tmpjl = exp(tmpjl)                                                         ;out of log space
     chkprior = evalpriors(jumpspot, ypriors, varytags, XWHICH=stuff.which[aa]) ;check priors
     IF chkprior EQ 0 then tmpjl = 0.0D                                         ;if prior fails
     
     ;;;Decide whether or not to jump        
     IF tmpjl GT jl then begin                          ;compares joint likelihoods
        markov[ja+1] = store(markov[ja+1], jumpspot)    ;updates location in param space
        jl = tmpjl                                      ;updates joint likelihood value
        stuff.howmanyacc[stuff.which[aa]]++             ;up counter for var
        ja++                                            ;ups counter
     ENDIF ELSE BEGIN                                   ;end check joint likelihoods
        limit = tmpjl / jl                              ;find ratio
        IF randoms[aa,2] LT limit THEN BEGIN            ;check uniform ran against limit
           markov[ja+1] = store(markov[ja+1], jumpspot) ;updates location in param space
           jl = tmpjl                                   ;updates joint likelihood value
           stuff.howmanyacc[stuff.which[aa]]++          ;up counter for var
           ja++                                         ;ups counter
        ENDIF ELSE jf++                                 ;end check of uniform ran against limit
     ENDELSE                                            ;end alt to joint likelihoods

  ENDFOR                                                ;end loop over steps


  ;;;Escape clause if MCMC never jumps
  IF ja EQ 0 THEN BEGIN                                                   ;if no accepted jumps
     print, 'WARNING!! MCMC never jumped during main phase!! Quitting...' ;print info
     ybit = 0.05*(max(ys) - min(ys))                                      ;bit to scale yaxis by
     w = window(LOCATION=[150,250])                                       ;window options
     xplot = errorplot(xs, ys, yerr, 's', /CURRENT, HIDE=hide, $          ;plot points
                       TITLE=title, $                                     ;plot options
                       XTITLE='Spatial Row [Pixels]', $                   ;plot options
                       YTITLE='Flux [arbitrary units]', $                 ;plot options
                       YRANGE = [min(ys)-ybit,max(ys)+ybit], $            ;plot options
                       FONT_SIZE=13, $                                    ;plot options
                       NAME=' Data')                                      ;plot options
     xplot2 = plot(xs, first, '-', /CURRENT, /OVERPLOT, $                 ;overplot starting fit
                   COLOR='green', $                                       ;plot options
                   THICK=4.2, $                                           ;plot options
                   NAME=' Initial Guess')                                 ;plot options
     xplot3 = plot(xs, next, '-', /CURRENT, /OVERPLOT, $                  ;overplot starting fit
                   COLOR='blue', $                                        ;plot options
                   THICK=2.2, $                                           ;plot options
                   NAME=' Post Burn-In')                                  ;plot options
     stop                                                                 ;kill run
  ENDIF                                                                   ;end if no accepted jumps


  ;;;post run processing
  markov = markov[0:ja]                                                        ;kill not good space
  bestmarkov = iguess                                                          ;copy
  fitvals = makefitvals(iguess)                                                ;make storage structure
  ntot = n_elements(tag_names(iguess))                                         ;total number of variables
  FOR xx=0, ntot-1, 1 DO BEGIN                                                 ;loop over all fit variables
     fitvals.(xx) = mean(markov.(xx))                                          ;find best guess
     bestmarkov.(xx) = fitvals.(xx)                                            ;copy best guess
     fitvals.(xx+ntot) = (total((markov.(xx) - fitvals.(xx))^2, /DOUBLE) / $   ;cont next line
                          ((ja-1)*ja))^0.5                                     ;find error
     fitvals.(xx+2*ntot) = (total((markov.(xx) - fitvals.(xx))^2, /DOUBLE) / $ ;cont next line
                            ((ja-1)*ja))^0.5                                   ;find error
  ENDFOR                                                                       ;end loop over all fit variables
  fitvals.medxs = medxs                                                        ;median x value
  best = evaluate(xs, bestmarkov, yoffset, medxs)                              ;evaluate best fit

  
  ;;;A bit of post run data
  IF verbose GE 1 THEN BEGIN                                                                           ;check verbose
     print, '  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' ;
     line = '   ' + strcompress('Number of jumps accepted: ' + string(ja) + $                          ;cont next line
                                ' out of ' + string(nsteps))                                           ;info
     print, line                                                                                       ;print info
     print, '    Number of Accepted Steps for Each Variable: '                                         ;print info
     FOR xx=0, nvar-1, 1 DO BEGIN                                                                      ;loop over tag names
        one = varytags[xx]                                                                             ;first part
        two = string(stuff.howmanyacc[xx])                                                             ;second part
        three = string(stuff.howmany[xx])                                                              ;third part
        print, '     ' +  strcompress('   ' + one + ': ' + two + ' of ' + three)                       ;print info
     ENDFOR                                                                                            ;end loop over tags
     print, '  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' ;
  ENDIF                                                                                                ;end verbose check
  

  ;;;Plot results of fitting
  IF ~keyword_set(NOSAVEPLOT) THEN BEGIN                               ;if not NOPLOT
     IF keyword_set(NOSHOWPLOT) THEN hide = 1 ELSE hide = 0            ;set value for display or not
     title = strcompress('Summed Spatial Profile Fit ' + string(call)) ;title of plot
     ybit = 0.05*(max(ys) - min(ys))                                   ;bit to scale yaxis by
 
     ;;;data and fits and various stages
     w = window(LOCATION=[150,250])                              ;window options
     xplot = errorplot(xs, ys, yerr, 's', /CURRENT, HIDE=hide, $ ;plot points
                       TITLE=title, $                            ;plot options
                       XTITLE='Spatial Row [Pixels]', $          ;plot options
                       YTITLE='Flux [arbitrary units]', $        ;plot options
                       YRANGE = [min(ys)-ybit,max(ys)+ybit], $   ;plot options
                       FONT_SIZE=13, $                           ;plot options
                       NAME=' Data')                             ;plot options
     xplot2 = plot(xs, first, '-', /CURRENT, /OVERPLOT, $        ;overplot starting fit
                   COLOR='green', $                              ;plot options
                   THICK=2.2, $                                  ;plot options
                   NAME=' Initial Guess')                        ;plot options
     xplot3 = plot(xs, next, '-', /CURRENT, /OVERPLOT, $         ;overplot starting fit
                   COLOR='blue', $                               ;plot options
                   THICK=2.2, $                                  ;plot options
                   NAME=' Post Burn-In')                         ;plot options
     xplot4 = plot(xs, best, '-', /CURRENT, /OVERPLOT, $         ;overplot starting fit
                   COLOR='purple', $                             ;plot options
                   THICK=2.2, $                                  ;plot options
                   NAME=' Most Prob. Fit')                       ;plot options
     xleg = LEGEND(TARGET=[xplot,xplot2,xplot3,xplot4], $        ;add legend
                   POSITION=[0.65,0.85], $                       ;legend options
                   /AUTO_TEXT_COLOR)                             ;legend options
     xplot.save, 'bayesian_nir_spatproffit.ps', RESOLUTION=600   ;plot saving


     ;;;histograms of fitting parameters' values
     w = window(LOCATION=[250,300])                                                       ;window options
     FOR xx=0, nvar-1, 1 DO BEGIN                                                         ;loop over variables
        data = markov.(xx)                                                                ;grab set
        chk = where(data NE data)                                                         ;double check for NaNs
        IF chk[0] NE -1 THEN data = data[chk]                                             ;remove if present
        pdf = histogram(data, LOCATIONS=xbin, NBINS=50)                                   ;bin it up
        cdf = total(pdf, /CUMULATIVE) / n_elements(data)                                  ;find cumulative distribution function
        phist = PLOT(xbin, pdf, /CURRENT, /HISTOGRAM, $                                   ;plot param histograms
                     FONT_SIZE = 14, $                                                    ;plot options
                     TITLE='Spectroscopic Redshift Distribution', $                       ;plot options
                     XTITLE=varytags[xx], $                                               ;plot options
                     YTITLE='Frequency', $                                                ;plot options
                     /FILL_BACKGROUND, FILL_COLOR='blue', $                               ;plot options
                     COLOR='blue', THICK=2.0)                                             ;plot options
        phistcdf = PLOT(xbin, cdf, '-', /CURRENT, $                                       ;plot cumulative distribution function
                        AXIS_STYLE=4, $                                                   ;plot options
                        COLOR = 'green', $                                                ;plot options
                        THICK=3.0)                                                        ;plot options
        IF (xx NE nvar-1) THEN BEGIN                                                      ;plot saving
           phist.save, 'bayesian_nir_spatprofparams.pdf', RESOLUTION=600, /APPEND         ;write plot
        ENDIF ELSE BEGIN                                                                  ;end if not last plot
           phist.save, 'bayesian_nir_spatprofparams.pdf', RESOLUTION=600, /APPEND, /CLOSE ;write and close
        ENDELSE                                                                           ;end if last time
        phistwin = phist.WINDOW                                                           ;get window attributes
        phistwin.Erase                                                                    ;erase window
     ENDFOR                                                                               ;end loop over variables
  ENDIF                                                                                   ;end if not NOPLOT
    
  RETURN
END
;========================================================================================================================




;========================================================================================================================
pro bayesian_gauss3_lincont_example

  print, 1
end
;========================================================================================================================
