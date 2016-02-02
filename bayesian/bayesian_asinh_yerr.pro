;========================================================================================================================
function bayesian_asinh_yerr, xs, ys, yerr, ITERATE=iterate, $
                              AMIN=amin, AMAX=amax, ABIN=abin, $
                              BMIN=bmin, BMAX=bmax, BBIN=bbin, $
                              CMIN=cmin, CMAX=cmax, CBIN=cbin, $
                              NDISPITERS=ndispiters, $
                              PLOTFIT=plotfit, PLOTDATA=plotdata, VERBOSE=verbose


;+
; NAME:
;       BAYESIAN_ASINH_YERR()
;
; PURPOSE:
;       Fit a function of the form
;           y(x) = c * (asinh(a*x) + b)
;       to a set of data given with yerror bars
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;       xs: data points' x values
;       ys: data points' y values
;       yerr: data points' y value errors
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
;       A. DeGroot, 2013 Sept 23, Univ. Cali, Riverside v1.1.0
;          -altered *bin keyword to be # of bins rather than size of bins
;       A. DeGroot, 2013 Sept 23, Univ. Cali, Riverside v1.0.0
;
; Desired upgrades
;       -make interactive fit optional
;-

version = '1.0.0'

  IF keyword_set(AMIN) THEN amin = amin[0] ELSE amin = -50.0                       ;sets new value
  IF keyword_set(AMAX) THEN amax = amax[0] ELSE amax = 50.0                     ;sets new value
  IF keyword_set(ABINS) THEN abins = abins[0] ELSE abins = 100.0                 ;sets new value
  IF keyword_set(BMIN) THEN bmin = bmin[0] ELSE bmin = -20.0                     ;sets new value
  IF keyword_set(BMAX) THEN bmax = bmax[0] ELSE bmax = 20.0                      ;sets new value
  IF keyword_set(BBINS) THEN bbins = bbins[0] ELSE bbins = 100.0                 ;sets new value
  IF keyword_set(CMIN) THEN cmin = cmin[0] ELSE cmin = 0.0                       ;sets new value
  IF keyword_set(CMAX) THEN cmax = cmax[0] ELSE cmax = 200.0                     ;sets new value
  IF keyword_set(CBINS) THEN cbins = cbins[0] ELSE cbins = 200.0                 ;sets new value
  IF keyword_set(NDISPITERS) THEN ndispiters = ndispiters[0] ELSE ndispiters = 3 ;sets new value
  IF keyword_set(PLOTFIT) THEN plotfit = 'Y' ELSE plotfit = 'N'                  ;sets new value
  IF keyword_set(PLOTDATA) THEN plotdata = 'Y' ELSE plotdata = 'N'               ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1             ;sets new value
  
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
  if (nxs NE nys) then print, 'WARNING: # of xs not equal # of ys'   ;print warning 
  if (nys NE nye) then print, 'WARNING: # of ys not equal # of yerr' ;print warning 
  
  
  ;;;make our test point grids
  ndata = n_elements(xs)                                     ;find # of data points
  bina = (amax-amin) / abins                                 ;find bin size
  as = dindgen((amax-amin)/bina+1.0) * bina + amin           ;find test points
  nas = n_elements(as)                                       ;find # of test points
  if verbose GE 2 THEN help, as                              ;print info
  if verbose GE 3 THEN print, 'Test a values: ', as          ;print info
  binb = (bmax-bmin) / bbins                                 ;find bin size
  bs = dindgen((bmax-bmin)/binb+1.0) * binb + bmin           ;find test points
  nbs = n_elements(bs)                                       ;find # of test points
  if verbose GE 2 THEN help, bs                              ;print info
  if verbose GE 3 THEN print, 'Test b values: ', bs          ;print info
  binc = (cmax-cmin) / cbins                                 ;find bin size
  cs = dindgen((cmax-cmin)/binc+1.0) * binc + cmin           ;find test points
  ncs = n_elements(cs)                                       ;find # of test points
  if verbose GE 2 THEN help, cs                              ;print info
  if verbose GE 3 THEN print, 'Test c values: ', cs          ;print info
  if verbose GE 1 THEN print, ''                             ;print info
  
 
  
  ;;;find likelihood of test points
  escape = 0
  WHILE escape EQ 0 DO BEGIN
  
     jlike = dblarr(nas, nbs, ncs)                               ;joint likelihood array to be filled
     ynorm = (1.0 / (2.0*!pi*yerr^2)^0.5)                        ;find the normalization in y-dir
     ydenom = 2.0*yerr^2                                         ;find y denoms in exp
     FOR aa=0UL, nas-1, 1 DO BEGIN                               ;loop over as
        FOR bb=0UL, nbs-1, 1 DO BEGIN                            ;loop over bs
           FOR cc=0UL, ncs-1, 1 DO BEGIN                         ;loop over cs
              ;testing = cs[cc]*(asinh(as[aa]+xs)+bs[bb])         ;find hypothetical data values
              testing = asinh_gen(xs, as[aa], bs[bb], cs[cc])    ;find hypothetical data values
              ypart = (-1.0*(ys-testing)^2/ydenom) + alog(ynorm) ;the y error part
              tlikeli = total(ypart)                             ;find likelihood in log space
              jlike[aa,bb,cc] = tlikeli                          ;store value
           ENDFOR                                                ;end loop over cs
        ENDFOR                                                   ;end loop over bs
     ENDFOR                                                      ;end loop over as


     ;;;post run shopkeeping
     jmax = max(jlike)                        ;find max value
     jlike = jlike - jmax                     ;basically renormalize
     jlike = exp(jlike)                       ;out of log space
     nogood = where(jlike NE jlike, nnogood)  ;check for NaNs, INFs
     IF nnogood NE 0 THEN jlike[nogood] = 0.0 ;set to zero if present


     ;;;now start marginalizing
     coeffs = fltarr(3)         ;array to be filled
     jlike_margc = total(jlike, 3) ;marg over c
     jlike_margb = total(jlike, 2) ;marg over b
     jlike_marga = total(jlike, 1) ;marg over a
    
     jlike_margbc = total(jlike_margc, 2)   ;marg over b,c
     norm = int_tabulated(as, jlike_margbc) ;normalization constant
     jlike_margbc = jlike_margbc / norm     ;normalize
     maxa = max(jlike_margbc, inda)         ;find most probable value
     coeffs[0] = as[inda]                   ;store value 
     
     jlike_margac = total(jlike_margc, 1)   ;marg over a,c
     norm = int_tabulated(bs, jlike_margac) ;normalization constant
     jlike_margac = jlike_margac / norm     ;normalize
     maxb = max(jlike_margac, indb)         ;find most probable value
     coeffs[1] = bs[indb]                   ;store value 
     
     jlike_margab = total(jlike_marga, 1)   ;marg over a,b
     norm = int_tabulated(cs, jlike_margab) ;normalization constant
     jlike_margab = jlike_margab / norm     ;normalize
     maxc = max(jlike_margab, indc)         ;find most probable value
     coeffs[2] = cs[indc]                   ;store value 
     

     ;;;Make some plots
     IF plotfit EQ 'Y' THEN BEGIN                                   ;check PLOTFIT keyword
        window, 0, XPOS=200, YPOS=400, XSIZE=500, YSIZE=500         ;window options
        contour, jlike_margc, as, bs, $                             ;2D posterior distribution plot
                 BACKGROUND='FFFFFF'XL, $                           ;plot options
                 COLOR='000000'XL, $                                ;plot options
                 XTITLE='as [units]', $                             ;plot options
                 YTITLE='bs [units]', $                             ;plot options
                 TITLE='2D Posterior PDF', $                        ;plot options
                 CHARSIZE=1.4                                       ;plot options
        window, 1, XPOS=250, YPOS=350, XSIZE=500, YSIZE=500         ;window options
        contour, jlike_margb, as, cs, $                             ;2D posterior distribution plot
                 BACKGROUND='FFFFFF'XL, $                           ;plot options
                 COLOR='000000'XL, $                                ;plot options
                 XTITLE='as [units]', $                             ;plot options
                 YTITLE='cs [units]', $                             ;plot options
                 TITLE='2D Posterior PDF', $                        ;plot options
                 CHARSIZE=1.4                                       ;plot options
        window, 2, XPOS=300, YPOS=300, XSIZE=500, YSIZE=500         ;window options
        contour, jlike_marga, bs, cs, $                             ;2D posterior distribution plot
                 BACKGROUND='FFFFFF'XL, $                           ;plot options
                 COLOR='000000'XL, $                                ;plot options
                 XTITLE='bs [units]', $                             ;plot options
                 YTITLE='cs [units]', $                             ;plot options
                 TITLE='2D Posterior PDF', $                        ;plot options
                 CHARSIZE=1.4                                       ;plot options
        window, 3, XPOS=350, YPOS=250, XSIZE=500, YSIZE=500         ;window options
        plot, as, jlike_margbc, $                                   ;1D posterior for intercepts
              BACKGROUND='FFFFFF'XL, $                              ;plot options
              COLOR='000000'XL, $                                   ;plot options
              XTITLE='as [units]', $                                ;plot options
              YTITLE='Probability', $                               ;plot options
              TITLE='1D Posterior PDF for A', $                     ;plot options
              CHARSIZE=1.4                                          ;plot options
        window, 4, XPOS=400, YPOS=200, XSIZE=500, YSIZE=500         ;window options
        plot, bs, jlike_margac, $                                   ;1D posterior for intercepts
              BACKGROUND='FFFFFF'XL, $                              ;plot options
              COLOR='000000'XL, $                                   ;plot options
              XTITLE='bs [units]', $                                ;plot options
              YTITLE='Probability', $                               ;plot options
              TITLE='1D Posterior PDF for B', $                     ;plot options
              CHARSIZE=1.4                                          ;plot options
        window, 5, XPOS=450, YPOS=150, XSIZE=500, YSIZE=500         ;window options
        plot, cs, jlike_margab, $                                   ;1D posterior for intercepts
              BACKGROUND='FFFFFF'XL, $                              ;plot options
              COLOR='000000'XL, $                                   ;plot options
              XTITLE='cs [units]', $                                ;plot options
              YTITLE='Probability', $                               ;plot options
              TITLE='1D Posterior PDF for C', $                     ;plot options
              CHARSIZE=1.4                                          ;plot options
        window, 6, XPOS=800, YPOS=100, XSIZE=500, YSIZE=500         ;window options
        ploterror, xs, ys, yerr, PSYM=2, $                          ;plot values 
                   COLOR = '000000'XL, $                            ;plot options
                   ERRCOLOR = '000000'XL, $                         ;plot options
                   BACKGROUND = 'FFFFFF'XL, $                       ;plot options
                   CHARSIZE = 1.4, $                                ;plot options
                   XTITLE = 'X VALUES', $                           ;plot options
                   YTITLE = 'Y VALUES', $                           ;plot options
                   TITLE = 'Values and Fit'                         ;plot options
        fakexs = indgen(200)                                        ;fake x values
        fakeys = asinh_gen(fakexs, coeffs[0], coeffs[1], coeffs[2]) ;fit for fake x values
        oplot, fakexs, fakeys, COLOR='000000'XL, $                  ;plot best fit line 
               LINESTYLE = 0, $                                     ;line options
               THICK = 1.5                                          ;line options
     ENDIF                                                          ;end check PLOTFIT keyword
     
     
     
     ;;;figure out a refit if desired
     value = ' '                                                       ;initialize
     read, value, PROMPT = 'Do you wish to refit the data? [yes] '     ;prompt
     value = strlowcase(value)                                         ;ensure lower case
     IF (value EQ 'no') OR (value EQ 'n') THEN escape = 1 ELSE BEGIN $ ;if no to refit escape
        value = ''                                                     ;reset
        bit = strcompress('['+ string(amin)+']', /REMOVE_ALL)          ;string up value
        read, value, PROMPT = '  New value for amin? ' + bit + ' '     ;prompt
        IF value EQ '' THEN amin = amin ELSE amin = float(value)       ;store new value
        value = ''                                                     ;reset
        bit = strcompress('['+ string(amax)+']', /REMOVE_ALL)          ;string up value
        read, value, PROMPT = '  New value for amax? ' + bit + ' '     ;prompt
        IF value EQ '' THEN amax = amax ELSE amax = float(value)       ;store new value
        value = ''                                                     ;reset
        bit = strcompress('['+ string(abins)+']', /REMOVE_ALL)         ;string up value
        read, value, PROMPT = '  New value for abins? ' + bit + ' '    ;prompt
        IF value EQ '' THEN abins = abins ELSE abins = float(value)    ;store new value
        value = ''                                                     ;reset
        bit = strcompress('['+ string(bmin)+']', /REMOVE_ALL)          ;string up value
        read, value, PROMPT = '  New value for bmin? ' + bit + ' '     ;prompt
        IF value EQ '' THEN bmin = bmin ELSE bmin = float(value)       ;store new value
        value = ''                                                     ;reset
        bit = strcompress('['+ string(bmax)+']', /REMOVE_ALL)          ;string up value
        read, value, PROMPT = '  New value for bmax? ' + bit + ' '     ;prompt
        IF value EQ '' THEN bmax = bmax ELSE bmax = float(value)       ;store new value
        value = ''                                                     ;reset
        bit = strcompress('['+ string(bbins)+']', /REMOVE_ALL)         ;string up value
        read, value, PROMPT = '  New value for bbins? ' + bit + ' '    ;prompt
        IF value EQ '' THEN bbins = bbins ELSE bbins = float(value)    ;store new value
        value = ''                                                     ;reset
        bit = strcompress('['+ string(cmin)+']', /REMOVE_ALL)          ;string up value
        read, value, PROMPT = '  New value for cmin? ' + bit + ' '     ;prompt
        IF value EQ '' THEN cmin = cmin ELSE cmin = float(value)       ;store new value
        value = ''                                                     ;reset
        bit = strcompress('['+ string(cmax)+']', /REMOVE_ALL)          ;string up value
        read, value, PROMPT = '  New value for cmax? ' + bit + ' '     ;prompt
        IF value EQ '' THEN cmax = cmax ELSE cmax = float(value)       ;store new value
        value = ''                                                     ;reset
        bit = strcompress('['+ string(cbins)+']', /REMOVE_ALL)         ;string up value
        read, value, PROMPT = '  New value for cbins? ' + bit + ' '    ;prompt
        IF value EQ '' THEN cbins = cbins ELSE cbins = float(value)    ;store new value

        ;;;remake our test point grids
        ndata = n_elements(xs)                      ;find # of data points
        bina = (amax-amin) / abins                  ;find bin size
        as = dindgen((amax-amin)/bina+1.0) * bina + amin ;find test points
        nas = n_elements(as)                             ;find # of test points
        if verbose GE 2 THEN help, as                    ;print info
        if verbose GE 3 THEN print, 'Test a values: ', as ;print info
        binb = (bmax-bmin) / bbins                        ;find bin size
        bs = dindgen((bmax-bmin)/binb+1.0) * binb + bmin  ;find test points
        nbs = n_elements(bs)                              ;find # of test points
        if verbose GE 2 THEN help, bs                     ;print info
        if verbose GE 3 THEN print, 'Test b values: ', bs ;print info
        binc = (cmax-cmin) / cbins                        ;find bin size
        cs = dindgen((cmax-cmin)/binc+1.0) * binc + cmin  ;find test points
        ncs = n_elements(cs)                              ;find # of test points
        if verbose GE 2 THEN help, cs                     ;print info
        if verbose GE 3 THEN print, 'Test c values: ', cs ;print info
        if verbose GE 1 THEN print, ''                    ;print info
     
     ENDELSE                    ;end yes to refit
     
  ENDWHILE                      ;end loop iters to find dispersion
  
   
  




  RETURN, coeffs
END
;========================================================================================================================




;========================================================================================================================
pro bayesian_asinh_yerr_example

 
end
;========================================================================================================================
