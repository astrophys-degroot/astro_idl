;========================================================================================================================
function makeiguess, xupgrade, xguesses, xnfeat, VERBOSE=verbose


  FOR xx=n_elements(xguesses)-1, 0, -1 DO BEGIN
     bits = strsplit(xguesses[xx], '=', /EXTRACT)
     CASE bits[0] OF
        'sig' : BEGIN
           IF verbose GE 2 THEN print, '  Using same initial sigma guess for all features.'
           FOR yy=0, xnfeat-1, 1 DO BEGIN
              bit = strcompress(bits[0] + string(yy+1), /REMOVE_ALL)
              tmp = tagind(xupgrade, bit, NOTE='Initial guess for sigma(s) not understood!')
              xupgrade.(tmp) = float(bits[1])
           ENDFOR
        END
        'c' : BEGIN
           IF verbose GE 2 THEN print, '  Using same initial flux guess for all features.'
           FOR yy=0, xnfeat-1, 1 DO BEGIN
              bit = strcompress(bits[0] + string(yy+1), /REMOVE_ALL)
              tmp = tagind(xupgrade, bit, NOTE='Initial guess for flux(s) not understood!')
              xupgrade.(tmp) = float(bits[1])
           ENDFOR
        END
        ELSE : BEGIN
           tmp = tagind(xupgrade, bits[0], NOTE='Initial guess for something else not understood!')
           xupgrade.(tmp) = float(bits[1])
        END
     ENDCASE
  ENDFOR  
  
  RETURN, xupgrade
END
;========================================================================================================================



;========================================================================================================================
function upgradebase, xbase, xnfeat, xborder 


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
  

  ;;;deal with XNFEAT second
  IF xnfeat GT 1 THEN BEGIN
     FOR xx=1, xnfeat-1, 1 DO BEGIN
        bita = strcompress('sig' + string(xx+1), /REMOVE_ALL)
        bitb = strcompress('c' + string(xx+1), /REMOVE_ALL)
        add_tags, xbasea, [bita, bitb], ['0.0D','0.0D'], xbaseoff
        xbaseb = xbaseoff
        xbaseoff = 0
        xbasea = xbaseb
     ENDFOR
  ENDIF ELSE xbaseb = xbasea
  
  RETURN, xbaseb
END
;========================================================================================================================



;========================================================================================================================
function varywhich, xiguess, xconstraints, xfeatures
  
  vary = xiguess
  tagnames = tag_names(vary)

  FOR xx=0, n_elements(xconstraints)-1, 1 DO BEGIN
     chk = where(xconstraints[xx].line2 EQ xfeatures)
     IF chk[0] NE -1 THEN BEGIN
        rid = strcompress(xconstraints[xx].part2 + string(chk+1), /REMOVE_ALL)
        varynew = remove_tags(vary, rid)
        vary = 0
        vary = varynew
        varynew = 0
     ENDIF     
  ENDFOR
  
  tagnames = tag_names(vary)
  FOR xx=0, n_elements(tagnames)-1, 1 DO BEGIN
     vary.(xx) = 0
  ENDFOR
  
  RETURN, vary
END
;========================================================================================================================



;========================================================================================================================
function varyhow, xvary, cdfpts
  
  tagnames = tag_names(xvary)
  FOR xx=0, n_elements(tagnames)-1, 1 DO BEGIN
     CASE 1 OF 
        tagnames[xx] EQ 'X0' : xvary.x0 = 0.2
        tagnames[xx] EQ 'X1' : xvary.x1 = 0.1
        tagnames[xx] EQ 'X2' : xvary.x2 = 0.05
        tagnames[xx] EQ 'X3' : xvary.x3 = 0.01
        tagnames[xx] EQ 'X4' : xvary.x4 = 0.002
        tagnames[xx] EQ 'X5' : xvary.x5 = 0.001
                                ;tagnames[xx] EQ 'REDSHIFT' : xvary.redshift = 0.05
        strmatch(tagnames[xx], 'sig*', /FOLD_CASE) : BEGIN
           ind = tagind(xvary, tagnames[xx], NOTE='varyhow1')
           xvary.(ind) = 0.6
        END
        strmatch(tagnames[xx], 'c*', /FOLD_CASE) : BEGIN
           ind = tagind(xvary, tagnames[xx], NOTE='varyhow2')
           xvary.(ind) = 1.0
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
function varyhowmuch, xvary, nvar


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
function varystepsize, xvary, xstuff, xsiter

  
  fracacc = float(xstuff.howmanyacc*xsiter) / float(xstuff.howmany) ;% jump rate
  fracoff = fracacc - 0.5                                           ;we want 50% jump rate
  FOR xx=0, n_elements(fracoff)-1, 1 DO BEGIN                       ;loop over jump variables
     xvary.(xx) = xvary.(xx) * (1.0 + fracoff[xx])                  ;adjust jump size
  ENDFOR                                                            ;end loop

  RETURN, xvary
END
;========================================================================================================================



;========================================================================================================================
function evalcont, xs, values
  
  IF tag_exist(values, 'X0') EQ 1 THEN tx0 = values.x0 ELSE tx0 = 0.0
  IF tag_exist(values, 'X1') EQ 1 THEN tx1 = values.x1 ELSE tx1 = 0.0
  IF tag_exist(values, 'X2') EQ 1 THEN tx2 = values.x2 ELSE tx2 = 0.0
  IF tag_exist(values, 'X3') EQ 1 THEN tx3 = values.x3 ELSE tx3 = 0.0
  IF tag_exist(values, 'X4') EQ 1 THEN tx4 = values.x4 ELSE tx4 = 0.0
  IF tag_exist(values, 'X5') EQ 1 THEN tx5 = values.x5 ELSE tx5 = 0.0
  
  cont = tx0 + tx1*xs + tx2*xs^2 + tx3*xs^3 + tx4*xs^4 + tx5*xs^5
  
  RETURN, cont 
END
;========================================================================================================================



;========================================================================================================================
function evallines, xs, values, xwl
  
                                ;obs = (values.redshift+1.0)*xwl
  obs = xwl
  FOR xx=0, n_elements(xwl)-1, 1 DO BEGIN
     this = xs
     this[*] = 0.0
     tag = strcompress('sig' + string(xx+1), /REMOVE_ALL)
     ind1 = tagind(values, tag, NOTE='evallines1')
     tag = strcompress('c' + string(xx+1), /REMOVE_ALL)
     ind2 = tagind(values, tag, NOTE='evallines2')
     exponent = -(xs-obs[xx])^2/(2.0*values.(ind1)^2)
     chk = where((exponent GT -83.0) AND (exponent LT 83.0))
     IF chk[0] NE -1 THEN this[chk] = values.(ind2)*exp(exponent[chk]) 
     IF xx EQ 0 THEN lines = this ELSE lines = lines + this
  ENDFOR
  
  RETURN, lines 
END
;========================================================================================================================



;========================================================================================================================
function store, markov, jumpspot
  
  FOR xx=0, n_elements(tag_names(markov))-1, 1 DO BEGIN
     markov.(xx) = jumpspot.(xx)
  ENDFOR
  
  RETURN, markov 
END
;========================================================================================================================



;========================================================================================================================
function chkvar, xtagnames, xvar, XCURRENT=xcurrent
  
  
  chk = where(xtagnames EQ xvar)
  IF chk[0] NE -1 THEN BEGIN
     wvar = chk
  ENDIF ELSE BEGIN
     print, 'WARNING!! The varible provided for the following prior is not valid!!'
     print, '   ', xcurrent
     print, '   Choices for variable are: ', xtagnames
     print, '   Case matters!!'
     stop
  ENDELSE
  
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
function getpriors, xpriors, xtagnames
  
  npriors = n_elements(xpriors)
  struc = {var:'var', comp:'EQ', val:0.0D}
  priors = replicate(struc, npriors)
  
  FOR xx=0, npriors-1, 1 DO BEGIN
     current = xpriors[xx]
     splits = strsplit(current, /EXTRACT)
     chk = chkvar(xtagnames, splits[0], XCURRENT=current)
     priors[xx].var = splits[0]
     chk = chkcomp(splits[1], XCURRENT=current)
     priors[xx].comp = splits[1]
     priors[xx].val = splits[2]
  ENDFOR

  RETURN, priors
END
;========================================================================================================================



;========================================================================================================================
function evalpriors, xspot, xpriors, xtags, XWHICH=xwhich


  spottags = tag_names(xspot)
  IF keyword_set(XWHICH) THEN BEGIN
     chk = where(xtags[xwhich] EQ xpriors.var)
     chk2 = where(xtags[xwhich] EQ spottags)
     IF chk[0] NE -1 THEN BEGIN
        FOR yy=0, n_elements(chk)-1, 1 DO BEGIN
           CASE xpriors[chk[yy]].comp OF
              'EQ' : test = xspot.(chk2[0]) EQ xpriors[chk[yy]].val 
              'NE' : test = xspot.(chk2[0]) NE xpriors[chk[yy]].val
              'GT' : test = xspot.(chk2[0]) GT xpriors[chk[yy]].val
              'GE' : test = xspot.(chk2[0]) GE xpriors[chk[yy]].val 
              'LT' : test = xspot.(chk2[0]) LT xpriors[chk[yy]].val  
              'LE' : test = xspot.(chk2[0]) LE xpriors[chk[yy]].val  
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
        chk2 = where(xtags[zz] EQ spottags)
        IF chk[0] NE -1 THEN BEGIN
           FOR yy=0, n_elements(chk)-1, 1 DO BEGIN
              CASE xpriors[chk[yy]].comp OF
                 'EQ' : test = xspot.(chk2[0]) EQ xpriors[chk[yy]].val 
                 'NE' : test = xspot.(chk2[0]) NE xpriors[chk[yy]].val
                 'GT' : test = xspot.(chk2[0]) GT xpriors[chk[yy]].val
                 'GE' : test = xspot.(chk2[0]) GE xpriors[chk[yy]].val 
                 'LT' : test = xspot.(chk2[0]) LT xpriors[chk[yy]].val  
                 'LE' : test = xspot.(chk2[0]) LE xpriors[chk[yy]].val  
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
function evalconstraints, xspot, xconst, xfeat
  

  FOR xx=0, n_elements(xconst)-1, 1 DO BEGIN
     chk2 = where(xconst[xx].line2 EQ xfeat)
     chk1 = where(xconst[xx].line1 EQ xfeat)
     IF (chk1[0] NE -1) AND (chk2[0] NE -1) THEN BEGIN
        bit2 = strcompress(strlowcase(xconst[xx].part2) + string(chk2+1), /REMOVE_ALL)
        bit1 = strcompress(strupcase(xconst[xx].part1) + string(chk1+1), /REMOVE_ALL)
        IF (xconst[xx].part2 NE 'null') AND (xconst[xx].part1 NE 'null') THEN BEGIN
           tag2 = tagind(xspot, bit2[0], NOTE='evalconstraints1')
           tag1 = tagind(xspot, bit1[0], NOTE='evalconstraints2')
           xspot.(tag2) = xconst[xx].val*xspot.(tag1)
        ENDIF
     ENDIF ELSE BEGIN
        print, 'WARNING!! Something has gone horribly wrong!!'
        print, '  Constraint should only be here if both lines are present!!'
        stop
     ENDELSE
  ENDFOR

  RETURN, xspot
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
function makefitvals, xiguess

  tagnames = tag_names(xiguess)                    ;find tag names 
  fitvals = xiguess                                ;copy structure
  minus = strcompress(tagnames + 'M', /REMOVE_ALL) ;make new tags names
  plus = strcompress(tagnames + 'P', /REMOVE_ALL)  ;make new tags names
  value = '0.0d'                                   ;value to use
  values = replicate(value, n_elements(tagnames))  ;one value for each tag
  add_tags, fitvals, minus, values, tmpvals        ;add the tags
  fitvals = tmpvals                                ;capture new structure
  tmpvals = 0                                      ;reset temporary
  add_tags, fitvals, plus, values, tmpvals         ;add the tags
  fitvals = tmpvals                                ;capture new structure
  tmpvals = 0                                      ;reset temporary
  add_tag, fitvals, 'medxs', 0.0D, tmpvals         ;add a tag
  fitvals = tmpvals                                ;capture new structure
  tmpvals = 0                                      ;reset temporary
  
  RETURN, fitvals
END
;========================================================================================================================


;========================================================================================================================
pro bayesian_rfspectral, xs, ys, yerr, FEATURES=features, BORDER=border, FITVALS=fitvals, $ 
                         NSTEPS=nsteps, BURNFRAC=burnfrac, STEPFRAC=stepfrac, STEPITER=stepiter, CDFPTS=cdfpts, $
                         GUESSES=guesses, PRIORS=priors, VARIES=varies, VARYHOW=varyhow, $
                         PFIT=pfit, PDATA=pdata, PLOTFIT=plotfit, PLOTPARAMS=plotparams, CALL=call, $
                         VERBOSE=verbose, HELP=help
  
;+
; NAME:
;       BAYESIAN_RFSPECTRAL()
;
; PURPOSE:
;       Fit any number of gaussians profiles to spectral features, be
;       it emission or absorption, simultaneously with up to a 5th
;       order polynomial fit to the continuum but no redshift; its
;       rest frame 
;
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;       xs: 1D spectrum's wavelength values
;       ys: 1D spectrum's flux values
;       yerr: 1D spectrum's flux error values
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
;       A. DeGroot, 2015 Nov 1, Univ. Cali, Riverside v1.0.0
;           -based on bayesian_spectral.pro; now no redshift
;
;
; DESIRED UPGRADES
;
;
;         
;-

  version = '2.0.0' 
  ON_ERROR, 2

  ;;;get passed parameters in order
  IF keyword_set(FEATURES) THEN features = features ELSE BEGIN                         ;check FEATURES
     print, 'Fitting only 1 feature!!'                                                 ;print info
     features = ['Ha']                                                                 ;sets new value 
  ENDELSE                                                                              ;end check FEATURES
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
  IF keyword_set(NSTEPS) THEN nsteps = nsteps[0] ELSE nsteps = 25000                   ;sets new value
  IF keyword_set(BURNFRAC) THEN BEGIN                                                  ;check if set
     IF (burnfrac[0] LT 0.0) OR (burnfrac[0] GT 1.0) THEN BEGIN                        ;check if makes sense
        print, 'Value given for BURNFRAC keyword makes no sense! Using default value!' ;print warning
        print, 'Burn in fraction: 0.15'                                                ;print info
        burnfrac = 0.15                                                                ;set to default
     ENDIF                                                                             ;end check makes sense
     burnfrac = burnfrac[0]                                                            ;sets new value
  ENDIF ELSE burnfrac = 0.15                                                           ;sets new value
  IF keyword_set(STEPITER) THEN stepiter = stepiter[0] ELSE stepiter = 25              ;sets new value
  IF keyword_set(STEPFRAC) THEN BEGIN                                                  ;check if set
     IF (stepfrac[0] LT 0.0) OR (stepfrac[0] GT 1.0) THEN BEGIN                        ;check if makes sense
        print, 'Value given for STEPFRAC keyword makes no sense! Using default value!' ;print warning
        print, 'Step fraction: 0.02'                                                   ;print info
        stepfrac = 0.02                                                                ;set to default
     ENDIF                                                                             ;end check makes sense
     stepfrac = stepfrac[0]                                                            ;sets new value
  ENDIF ELSE stepfrac = 0.02                                                           ;sets new value
  IF keyword_set(CDFPTS) THEN cdfpts = cdfpts[0] ELSE cdfpts = 10001.0                 ;sets new value
  IF keyword_set(PFIT) THEN pfit = 'Y' ELSE pfit = 'N'                                 ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                   ;sets new value
  IF keyword_set(HELP) THEN help = help[0] ELSE help = 'N'                             ;sets new value
  

  ;;;Help Desk 
  IF verbose GE 1 THEN BEGIN                                                        ;check verbose
     print, '++++++++++++++++++++++++++++++++++++++'                                ;print info
     print, strcompress(' FEATURES FIT: '), features                                ;print info
     print, strcompress(' BACKGROUND ORDER: ' + string(border))                     ;print info
     print, strcompress(' MCMC STEPS: ' + string(nsteps))                           ;print info
     print, strcompress(' MCMC BURN IN STEPS: ' + string(ulong(burnfrac*nsteps)))   ;print info
     print, strcompress(' MCMC STEP SIZE STEPS: ' + string(ulong(stepfrac*nsteps))) ;print info
     print, '++++++++++++++++++++++++++++++++++++++'                                ;print info
  ENDIF                                                                             ;check verbose
  IF help EQ 'Y' THEN BEGIN                                                         ;check VERBOSE keyword
     help, xs                                                                       ;help info
     help, ys                                                                       ;help info
     help, yerr                                                                     ;help info
  ENDIF                                                                             ;end check VERBOSE keyword
  IF verbose GE 4 THEN BEGIN                                                        ;check VERBOSE keyword
     print, xs                                                                      ;print info
     print, ys                                                                      ;print info
     print, yerr                                                                    ;print info
     print, ' '                                                                     ;space
  ENDIF                                                                             ;end check VERBOSE keyword
  

  ;;;sanity checks
  nxs = n_elements(xs)                                                 ;find # of elements
  nys = n_elements(ys)                                                 ;find # of elements
  nyerr = n_elements(yerr)                                             ;find # of elements
  if (nxs NE nys) then print, 'WARNING: # of xs not equal # of ys'     ;print warning 
  if (nys NE nyerr) then print, 'WARNING: # of ys not equal # of yerr' ;print warning 


  ;;;get feature info
  nfeat = n_elements(features)                  ;find how many features to fit
  features = strcompress(features, /REMOVE_ALL) ;safety net
  wl = fltarr(nfeat)                            ;make array for wavelengths
  FOR yy=0, nfeat-1, 1 DO BEGIN                 ;loop over features
     wl[yy] = emissionlines(features[yy])       ;store wavelength
  ENDFOR                                        ;end loop over features
  

  ;;;set up storage i.e. determine number of variables
  base = {x0:0.0D, sig1:0.0D, c1:0.0D}       ;start the structure
  upgrade = upgradebase(base, nfeat, border) ;beef up the structure
  
  ;;;deal with initial guesses
  IF keyword_set(GUESSES) THEN BEGIN                               ;if guesses provided
     iguess = makeiguess(upgrade, guesses, nfeat, VERBOSE=verbose) ;put in guesses
     IF help EQ 'Y' THEN help, iguess, /STRUC                      ;offer help
  ENDIF                                                            ;end guesses provided
  
  ;;;implement constaints, find number of unique variables, get steps size
  constraints = bayesian_spectral_constraints(features)                    ;get constraints
  IF help EQ 'Y' THEN help, constraints, /STRUC                            ;offer help
  chk = where(constraints.part1 EQ 'null' AND constraints.part2 EQ 'null') ;check for null
  IF chk[0] NE -1 then nullconst = 1 ELSE nullconst = 0                    ;set value
  nvar = n_tags(iguess)-n_elements(constraints) + nullconst                ;each constraint is one less variable
  vary = varywhich(iguess, constraints, features)                          ;find variables to vary
  varytags = tag_names(vary)                                               ;get tag names of changing variables
  nvar2 = n_elements(tag_names(vary))                                      ;test # vars again
  IF nvar NE nvar2 THEN BEGIN                                              ;compare
     print, nvar, nvar2                                                    ;print info
     print, 'WARNING!! Something has gone horribly wrong!!'                ;print info
     stop                                                                  ;stop 
  ENDIF                                                                    ;end compare
  varypass = vary                                                          ;a copy of vary
  vary = varyhow(vary, cdfpts)                                             ;get step size
  vary = varyhowmuch(vary, nvar)                                           ;fill vary array


  ;;;mcmc counters and stuff
  bsteps = floor(burnfrac*nsteps)             ;how many burn steps
  sstep = floor(stepfrac*nsteps)              ;step size iterations
  ssteps = floor(stepiter*stepfrac*nsteps)    ;step size iterations
  total = nsteps + bsteps + ssteps            ;total # of random draws needed
  whole = uniformran(total, 3)                ;all possible uniform random draws
  randoms = whole[0:nsteps-1, *]              ;subset for main mcmc 
  brandoms = whole[nsteps:nsteps+bsteps-1, *] ;subset for burn in 
  srandoms = whole[nsteps+bsteps:total-1, *]  ;subset for step randoms
  whole = 0                                   ;kill variable
  ja = 0UL                                    ;initialize counter
  jf = 0UL                                    ;initialize counter
  bja = 0UL                                   ;initialize counter
  bjf = 0UL                                   ;initialize counter
  sja = 0UL                                   ;initialize counter
  sjf = 0UL                                   ;initialize counter
  jl = 0.0D                                   ;initialize variable
  tmpjl = 0.0D                                ;initialize variable

  
  ;;;Shift origin to center of wavelength range for continuum fit 
  contxs = xs                   ;copy value
  medxs = median(xs)            ;find median of x vals
  contxs = contxs - medxs       ;subtract off median
  denom = 2.0*yerr^2            ;find denom in exp

  ;;;extract priors
  ypriors = getpriors(priors, varytags) ;extract priors from strings
  

  ;;;enforce constraints and priors on initial guess
                                ;help, iguess
                                ;print, iguess
                                ;help, ypriors
                                ;print, ypriors
  chkprior = evalpriors(iguess, ypriors, varytags)             ;check priors
  IF chkprior EQ 0 THEN BEGIN                                  ;check against priors
     print, 'WARNING!! Initial Guess fails to satify priors!!' ;print info
     print, '  Please adjust initial guess values!!'           ;print info
     stop                                                      ;stop program
  ENDIF                                                        ;end check against priors
  iguess = evalconstraints(iguess, constraints, features)      ;apply constraints


  ;;;Pick which varible to jump each step for burn in
  bstuff = jumps(bsteps, nvar, brandoms) ;burn-in stuff
  stuff = jumps(nsteps, nvar, randoms)   ;MCMC main stuff
  

  ;;;initial guess plotting
  cont = evalcont(contxs, iguess)                                                   ;evaluate continuum points 
  lines = evallines(xs, iguess, wl)                                                 ;evaluate continuum points 
  first = lines + cont                                                              ;combine
  IF pfit EQ 'Y' THEN firstfit = plot(xs, first, /OVERPLOT, NAME='Initial Guess', $ ;plot initial guess
                                      LINESTYLE=0, COLOR= 'green', THICK=3.0)       ;plot options

  ;;;Step size configuration
  IF keyword_set(VARIES) THEN BEGIN    ;check value
     FOR zz=0, nvar-1, 1 DO BEGIN      ;loop over variables
        vary.(zz) = varies.(zz)        ;copy values
        vary = varyhowmuch(vary, nvar) ;fill vary array
     ENDFOR                            ;end loop over vars
  ENDIF ELSE BEGIN                     ;begin alt to check value
     IF verbose GE 1 THEN print, ' Configuring step size.', FORMAT='((A),$)' 
     FOR cc=0, stepiter-1, 1 DO BEGIN
        sstuff = jumps(ssteps, nvar, srandoms) 
        bit = '.'
        IF verbose GE 1 THEN BEGIN
           IF cc LT stepiter-1 THEN print, bit, FORMAT='((A),$)' ELSE $
              print, bit, FORMAT='(A)'
        ENDIF
        
        ;;;setting up step size config
        stepmarkov = replicate(iguess, ssteps)        ;the step config markov chain
        chk = where(yerr EQ 0.0)                      ;safety check for yerr=0
        IF chk[0] NE -1 THEN yerr[chk] = median(yerr) ;new value in place of 0
        likeli = (-1.0*(ys-first)^2/denom)            ;find likelihood
        jl = total(likeli, /DOUBLE)                   ;joint likelihood


        ;;;Step config Markov Chain Loop
        starting = 0UL + cc*sstep                                                           ;where to start
        ending = sstep - 1 + cc*sstep                                                       ;where to end
        FOR ss=starting, ending-1, 1 DO BEGIN                                               ;loop over # steps
           jumpspot = stepmarkov[sja]                                                       ;copy current location
           spot = min((vary.(sstuff.which[ss]+2*nvar) - srandoms[ss,1]), indmin, /ABSOLUTE) ;closest in CDF
           jump = vary.(sstuff.which[ss]+nvar)[indmin]                                      ;corresponding x val
           jind = tagind(jumpspot, varytags[sstuff.which[ss]])                              ;which ind in jumpspot 
           jumpspot.(jind) = jumpspot.(jind) + jump                                         ;proposed jump
           
           
           ;;;Jump and re-evaluatate, including constraints and priors
           jumpspot = evalconstraints(jumpspot, constraints, features)                 ;reapply constraints
           chkprior = evalpriors(jumpspot, ypriors, varytags, XWHICH=sstuff.which[ss]) ;check priors
           IF chkprior EQ 1 THEN BEGIN                                                 ;priors satisfied
              tcont = evalcont(contxs, jumpspot)                                       ;evaluate given fit parameters
              tlines = evallines(xs, jumpspot, wl)                                     ;evaluate given fit parameters
              test = tcont + tlines                                                    ;add parts
              likeli = (-1.0*(ys-test)^2/denom)                                        ;find likelihood
              tmpjl = total(likeli, /DOUBLE)                                           ;joint likelihood
           ENDIF ELSE tmpjl = -1.0*10^(306D)                                           ;if prior fails
           
           ;;;Decide whether or not to jump        
           IF tmpjl GT jl then begin                                    ;compares joint likelihoods
              stepmarkov[sja+1] = store(stepmarkov[sja+1], jumpspot)    ;updates location in param space
              jl = tmpjl                                                ;updates joint likelihood value
              sstuff.howmanyacc[sstuff.which[ss]]++                     ;up counter for var
              sja++                                                     ;ups counter
           ENDIF ELSE BEGIN                                             ;end check joint likelihoods
              diff = (tmpjl - jl)                                       ;find difference
              IF (diff LT 88.0) AND (diff GT -88.0) THEN $              ;check for underflow
                 limit = exp(diff) ELSE limit = 9.99E-99                ;find ratio
              IF srandoms[ss,2] LT limit THEN BEGIN                     ;check uniform ran against limit
                 stepmarkov[sja+1] = store(stepmarkov[sja+1], jumpspot) ;updates location in param space
                 jl = tmpjl                                             ;updates joint likelihood value
                 sstuff.howmanyacc[sstuff.which[ss]]++                  ;up counter for var
                 sja++                                                  ;ups counter
              ENDIF ELSE sjf++                                          ;end check of uniform ran against limit
           ENDELSE                                                      ;end alt to joint likelihoods  
        ENDFOR                                                          ;end loop over steps
        
        vary = varystepsize(vary, sstuff, stepiter) ;array
        vary = varyhowmuch(vary, nvar)              ;fill vary array
        IF cc EQ stepiter-1 THEN BEGIN              ;if the last pass
           FOR zz=0, nvar-1, 1 DO BEGIN             ;loop over variables
              varypass.(zz) = vary.(zz)             ;copy values
           ENDFOR                                   ;end loop over vars
           varies = varypass                        ;pass values
           varyhow = varypass                       ;pass values
        ENDIF                                       ;end if last pass
     ENDFOR                                         ;end iterations on step size
  ENDELSE                                           ;end alt to vary step size not given


  ;;;starting out the burn in phase
  burnmarkov = replicate(iguess, bsteps)        ;the burn markov chain
  cont = evalcont(contxs, burnmarkov[0])        ;evaluate continuum points 
  lines = evallines(xs, burnmarkov[0], wl)      ;evaluate continuum points 
  first = lines + cont                          ;combine
  chk = where(yerr EQ 0.0)                      ;safety check for yerr=0
  IF chk[0] NE -1 THEN yerr[chk] = median(yerr) ;new value in place of 0
  likeli = (-1.0*(ys-first)^2/denom)            ;find likelihood
  jl = total(likeli, /DOUBLE)                   ;joint likelihood


  ;;;Burn in Markov Chain Loop
  FOR bb=0UL, bsteps-1, 1 DO BEGIN                                                                ;loop over # steps
     line = strcompress('  Now on step ' + string(bb) + ' of ' + string(bsteps) + ' for burn in') ;info
     IF (verbose GE 1) AND (bb MOD floor(0.1*nsteps) EQ 0) THEN print, line                       ;print info
     jumpspot = burnmarkov[bja]                                                                   ;copy current location
     spot = min((vary.(bstuff.which[bb]+2*nvar) - brandoms[bb,1]), indmin, /ABSOLUTE)             ;closest in CDF
     jump = vary.(bstuff.which[bb]+nvar)[indmin]                                                  ;corresponding x val
     jind = tagind(jumpspot, varytags[bstuff.which[bb]])                                          ;which ind in jumpspot 
     jumpspot.(jind) = jumpspot.(jind) + jump                                                     ;proposed jump

     
     ;;;Jump and re-evaluatate, including constraints and priors
     jumpspot = evalconstraints(jumpspot, constraints, features)                 ;reapply constraints
     chkprior = evalpriors(jumpspot, ypriors, varytags, XWHICH=bstuff.which[bb]) ;check priors
     IF chkprior EQ 1 THEN BEGIN                                                 ;priors satisfied
        tcont = evalcont(contxs, jumpspot)                                       ;evaluate given fit parameters
        tlines = evallines(xs, jumpspot, wl)                                     ;evaluate given fit parameters
        test = tcont + tlines                                                    ;add parts
        likeli = (-1.0*(ys-test)^2/denom)                                        ;find likelihood
        tmpjl = total(likeli, /DOUBLE)                                           ;joint likelihood
     ENDIF ELSE tmpjl = -1.0*10^(307D)                                           ;if prior fails

     ;;;Decide whether or not to jump        
     IF tmpjl GT jl then begin                                                   ;compares joint likelihoods
        burnmarkov[bja+1] = store(burnmarkov[bja+1], jumpspot)                   ;updates location in param space
        jl = tmpjl                                                               ;updates joint likelihood value
        bstuff.howmanyacc[bstuff.which[bb]]++                                    ;up counter for var
        bja++                                                                    ;ups counter
     ENDIF ELSE BEGIN                                                            ;end check joint likelihoods
        diff = (tmpjl - jl)                                                      ;find difference
        IF (diff LT 88.0) AND (diff GT -88.0) THEN $                             ;check for underflow
           limit = exp(diff) ELSE limit = 9.99E-99                               ;find ratio
        IF brandoms[bb,2] LT limit THEN BEGIN                                    ;check uniform ran against limit
           burnmarkov[bja+1] = store(burnmarkov[bja+1], jumpspot)                ;updates location in param space
           jl = tmpjl                                                            ;updates joint likelihood value
           bstuff.howmanyacc[bstuff.which[bb]]++                                 ;up counter for var
           bja++                                                                 ;ups counter
        ENDIF ELSE bjf++                                                         ;end check of uniform ran against limit
     ENDELSE                                                                     ;end alt to joint likelihoods  
  ENDFOR                                                                         ;end loop over steps
  IF pfit EQ 'Y' THEN burnfit = plot(xs, test, /OVERPLOT, NAME='Post Burn-In', $ ;plot post burn-in
                                     LINESTYLE=0, COLOR='yellow', THICK=3.0)     ;plot options
  

  ;;;Starting out the markov chain
  markov = replicate(burnmarkov[bja], nsteps) ;creates markov chain
  chkcont = evalcont(contxs, jumpspot)        ;evaluate given fit parameters
  chklines = evallines(xs, jumpspot, wl)      ;evaluate given fit parameters
  chk = chkcont + chklines                    ;add parts
  likeli = (-1.0*(ys-chk)^2/denom)            ;find likelihood
  chkjl = total(likeli, /DOUBLE)              ;joint likelihood


  ;;;Markov Chain Loop
  FOR aa=0UL, nsteps-1, 1 DO BEGIN                                                  ;loop over # steps
     line = strcompress('  Now on step ' + string(aa) + ' of ' + string(nsteps))    ;info
     IF (verbose GE 1) AND (aa MOD floor(0.1*nsteps) EQ 0) THEN print, line         ;print info
     jumpspot = markov[ja]                                                          ;copy current location
     spot = min((vary.(stuff.which[aa]+2*nvar) - randoms[aa,1]), indmin, /ABSOLUTE) ;closest in CDF
     jump = vary.(stuff.which[aa]+nvar)[indmin]                                     ;corresponding x val
     jind = tagind(jumpspot, varytags[stuff.which[aa]])                             ;which ind in jumpspot 
     jumpspot.(jind) = jumpspot.(jind) + jump                                       ;proposed jump

     ;;;Jump and re-evaluatate, including constraints and priors
     jumpspot = evalconstraints(jumpspot, constraints, features)                ;reapply constraints
     chkprior = evalpriors(jumpspot, ypriors, varytags, XWHICH=stuff.which[aa]) ;check priors
     IF chkprior EQ 1 THEN BEGIN                                                ;priors satisfied
        tcont = evalcont(contxs, jumpspot)                                      ;evaluate given fit parameters
        tlines = evallines(xs, jumpspot, wl)                                    ;evaluate given fit parameters
        test = tcont + tlines                                                   ;add parts
        likeli = (-1.0*(ys-test)^2/denom)                                       ;find likelihood
        tmpjl = total(likeli, /DOUBLE)                                          ;joint likelihood
     ENDIF ELSE tmpjl = -1.0*10^(307D)                                          ;if prior fails

     ;;;Decide whether or not to jump        
     IF tmpjl GT jl then begin                          ;compares joint likelihoods
        markov[ja+1] = store(markov[ja+1], jumpspot)    ;updates location in param space
        jl = tmpjl                                      ;updates joint likelihood value
        stuff.howmanyacc[stuff.which[aa]]++             ;up counter for var
        ja++                                            ;ups counter
     ENDIF ELSE BEGIN                                   ;end check joint likelihoods
        diff = (tmpjl - jl)                             ;find difference
        IF (diff LT 88.0) AND (diff GT -88.0) THEN $    ;check for underflow
           limit = exp(diff) ELSE limit = 9.99E-99      ;find ratio
        IF randoms[aa,2] LT limit THEN BEGIN            ;check uniform ran against limit
           markov[ja+1] = store(markov[ja+1], jumpspot) ;updates location in param space
           jl = tmpjl                                   ;updates joint likelihood value
           stuff.howmanyacc[stuff.which[aa]]++          ;up counter for var
           ja++                                         ;ups counter
        ENDIF ELSE jf++                                 ;end check of uniform ran against limit
     ENDELSE                                            ;end alt to joint likelihoods
  ENDFOR                                                ;end loop over steps


  ;;;Escape clause if MCMC never jumps
  IF ja EQ 0 THEN BEGIN                                 ;check # of jumps
     print, 'WARNING!! MCMC never jumped!! Quitting...' ;print info
     stop                                               ;stop run
  ENDIF                                                 ;end check # of jumps


  ;;;post run processing
  markov = markov[0:ja]                                                      ;kill not good space
  bestmarkov = iguess                                                        ;copy
  fitvals = makefitvals(iguess)                                              ;make storage structure
  ntot = n_elements(tag_names(iguess))                                       ;total number of variables
  FOR xx=0, ntot-1, 1 DO BEGIN                                               ;loop over all fit variables
     fitvals.(xx) = mean(markov.(xx))                                        ;find best guess
     bestmarkov.(xx) = fitvals.(xx)                                          ;copy best guess
     fitvals.(xx+ntot) = sigma(markov.(xx))                                  ;find error
     fitvals.(xx+2*ntot) = sigma(markov.(xx))                                ;find error
  ENDFOR                                                                     ;end loop over all fit variables
  fitvals.medxs = medxs                                                      ;median x value
  bestcont = evalcont(contxs, bestmarkov)                                    ;evaluate given fit parameters
  bestlines = evallines(xs, bestmarkov, wl)                                  ;evaluate given fit parameters
  best = bestcont + bestlines                                                ;add parts
  pdata = best                                                               ;store best fit data to send back
  IF pfit EQ 'Y' THEN bestfit = plot(xs, best, /OVERPLOT, NAME='Best Fit', $ ;overplot best?? fit
                                     LINESTYLE=0, COLOR='red', THICK=3.0)    ;plot options
  
  IF pfit EQ 'Y' THEN mylegend = legend(TARGET=[firstfit, burnfit, bestfit], $ ;legend
                                        POSITION=[0.7,0.8], /NORMAL, $         ;legend options
                                        SHADOW=0, LINESTYLE=6, FONT_SIZE=11)   ;legend options

  ;;;Write a plot of fitting
  IF keyword_set(PLOTFIT) THEN BEGIN       ;check PLOTFIT keyword
     plotfit = plotfit[0]                  ;get plot file name
     bestfit.save, plotfit, RESOLUTION=600 ;save the plot
  ENDIF                                    ;end check PLOTFIT
  
  ;;;A bit of post run data
  IF verbose GE 1 THEN BEGIN                                            ;check verbose
     print, '++++++++++++++++++++++++++++++++++++++'                    ;print info
     line = strcompress('  Number of jumps accepted: ' + string(ja) + $ ;cont next line
                        ' out of ' + string(nsteps))                    ;info
     print, line                                                        ;print info
     print, '  Number of Accepted Steps for Each Variable: '            ;print info
     FOR xx=0, nvar-1, 1 DO BEGIN                                       ;loop over tag names
        one = varytags[xx]                                              ;first part
        two = string(stuff.howmanyacc[xx])                              ;second part
        three = string(stuff.howmany[xx])                               ;third part
        print, strcompress('   ' + one + ': ' + two + ' of ' + three)   ;print info
     ENDFOR                                                             ;end loop over tags
     print, '++++++++++++++++++++++++++++++++++++++'                    ;print info
  ENDIF                                                                 ;end verbose check
  

  ;;;Make some plots
  IF keyword_set(PLOTPARAMS) THEN plotparams = plotparams[0] ELSE plotparams = 'mosfirespatprofparams.ps'
  set_plot, 'ps'                                                                                            ;set plot type
  device, FILENAME = plotparams                                                                             ;open plot
  FOR xx=0, nvar-1, 1 DO BEGIN                                                                              ;loop over variables
     cghistoplot, markov.(xx), XTITLE = varytags[xx],  YTITLE = 'Frequency', $                              ;plot
                  CHARTHICK = 3.0, /OPROBABILITY, THICK = 3.0, /FILL, POLYCOLOR=['charcoal', 'dodger blue'] ;plot options
  ENDFOR                                                                                                    ;end loop over variables
  device, /CLOSE                                                                                            ;closes device
  set_plot, 'x'                                                                                             ;reset plot type
  
  RETURN
END
;========================================================================================================================



;========================================================================================================================
pro bayesian_spectral_example

  print, 1
end
;========================================================================================================================
