;========================================================================================================================
pro bayesian_quadratic_yerr, xs, ys, yerr, FITS=fits, ITERATE=iterate, WINSTART=winstart, $
                             AMIN=amin, AMAX=amax, ABINS=abins, $
                             BMIN=bmin, BMAX=bmax, BBINS=bbins, $
                             CMIN=cmin, CMAX=cmax, CBINS=cbins, $
                             PLOTFIT=plotfit, PLOTDATA=plotdata, VERBOSE=verbose
  

;+
; NAME:
;       BAYESIAN_QUADRATIC_YERR()
;
; PURPOSE:
;       Fit a function of the form
;          a*x^2 + b*x + c 
;       to a set of x,y data pairs given the error in y. 
;
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;       xs: data poas' x values
;       ys: data poas' y values
;       yerr: data poas' y value errors
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
;       A. DeGroot, 2014 Sep 10, Univ. Cali, Riverside v1.0.0
;
; DESIRED UPGRADES
;       -add sanity check for at least 10 bins     

;-

  IF keyword_set(WINSTART) THEN winstart = winstart[0] ELSE winstart = 0 ;set new value
  IF keyword_set(AMIN) THEN amin = amin[0] ELSE amin = -1.0              ;sets new value
  IF keyword_set(AMAX) THEN amax = amax[0] ELSE amax = 1.0               ;sets new value
  IF keyword_set(ABINS) THEN abins = abins[0] ELSE abins = 50            ;sets new value
  IF keyword_set(BMIN) THEN bmin = bmin[0] ELSE bmin = -5.0              ;sets new value
  IF keyword_set(BMAX) THEN bmax = bmax[0] ELSE bmax = 5.0               ;sets new value
  IF keyword_set(BBINS) THEN bbins = bbins[0] ELSE bbins = 40            ;sets new value
  IF keyword_set(CMIN) THEN cmin = cmin[0] ELSE cmin = -10.0             ;sets new value
  IF keyword_set(CMAX) THEN cmax = cmax[0] ELSE cmax = 10.0              ;sets new value
  IF keyword_set(CBINS) THEN cbins = cbins[0] ELSE cbins = 60            ;sets new value
  IF keyword_set(PLOTFIT) THEN plotfit = 'Y' ELSE plotfit = 'N'          ;sets new value
  IF keyword_set(PLOTDATA) THEN plotdata = 'Y' ELSE plotdata = 'N'       ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1     ;sets new value

  IF verbose GE 4 THEN BEGIN    ;check VERBOSE keyword
     print, xs                  ;print info
     print, ys                  ;print info
     print, yerr                ;print info
     print, ' '                 ;space
  ENDIF                         ;end check VERBOSE keyword
  
  
  ;;;sanity checks
  nxs = n_elements(xs)                                               ;find # of elements
  nys = n_elements(ys)                                               ;find # of elements
  nye = n_elements(yerr)                                             ;find # of elements
  IF (nxs NE nys) THEN print, 'WARNING: # of xs not equal # of ys'   ;print warning 
  IF (nys NE nye) THEN print, 'WARNING: # of ys not equal # of yerr' ;print warning 
  
  
  ;;;make our test point grids
  ndata = n_elements(xs)                                   ;find # of data prints
  bina = (amax-amin) / abins                               ;find bin size
  as = dindgen((amax-amin)/bina+1.0) * bina + amin         ;find test prints
  nas = n_elements(as)                                     ;find # of test prints
  IF verbose GE 2 THEN help, as                            ;pra info
  IF verbose GE 3 THEN pra, 'Test aercept values: ', as    ;pra info
  binb = (bmax-bmin) / bbins                               ;find bin size
  bs = dindgen((bmax-bmin)/binb+1.0) * binb + bmin         ;find test prints
  nbs = n_elements(bs)                                     ;find # of test prints
  IF verbose GE 2 THEN help, bs                            ;pra info
  IF verbose GE 3 THEN pra, 'Test slope values: ', bs      ;pra info
  binc = (cmax-cmin) / cbins                               ;find bin size
  cs = dindgen((cmax-cmin)/binc+1.0) * binc + cmin         ;find test prints
  ncs = n_elements(cs)                                     ;find # of test prints
  IF verbose GE 2 THEN help, cs                            ;print info
  IF verbose GE 3 THEN print, 'Test x values values: ', cs ;print info
  IF verbose GE 2 THEN print, ''                           ;print info
  

  ;;;find likelihood of test points
  jlike = dblarr(nas, nbs, ncs)                                                      ;joint likelihood array to be filled
  ynorm = (1.0 / (2.0*!pi*yerr^2)^0.5)                                               ;find the normalization in y-dir
  ydenom = 2.0*yerr^2                                                                ;find y denoms in exp

  FOR aa=0UL, nas-1, 1 DO BEGIN                                    ;loop over as
     FOR bb=0UL, nbs-1, 1 DO BEGIN                                 ;loop over bs
        FOR cc=0UL, ncs-1, 1 DO BEGIN                              ;loop over cs
           testing = as[aa]*xs^2 + bs[bb]*xs + cs[cc]              ;find hypothetical data values
           likelihood = (-1.0*(ys-testing)^2/ydenom) + alog(ynorm) ;the y error part
           likelihood = total(likelihood)                          ;sum up 
           jlike[aa,bb,cc] = likelihood                            ;store value
        ENDFOR                                                     ;end loop over cs
     ENDFOR                                                        ;end loop over bs
  ENDFOR                                                           ;end loop over as
  
  maxjlike = max(jlike)         ;find most probable value
  jlike = jlike - maxjlike      ;subtract most probable value
  jlike = exp(jlike)            ;exponentiate out of log space
  
  analyze_threevar, jlike, as, bs, cs, VARNAMES=['as', 'bs', 'cs'], FITS=fits, ITERATE=iterate, WINSTART=winstart ;break down results

  ;;;double check fit progress plot
  ;window, 9
  ;plot, xs, ys, PSYM=1, BACKGROUND='FFFFFF'XL, COLOR='000000'XL
  ;oplot, xs, fits.amp*xs^2 + fits.bmp*xs + fits.cmp, COLOR='FF0000'XL


END
;========================================================================================================================




;========================================================================================================================
pro bayesian_quadratic_yerr_example

  
end
;========================================================================================================================
