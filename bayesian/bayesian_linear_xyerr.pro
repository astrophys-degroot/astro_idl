;========================================================================================================================
pro bayesian_linear_xyerr, xs, ys, xerr, yerr, $
                           INTMIN=intmin, INTMAX=intmax, INTBIN=intbin, $
                           SLPMIN=slpmin, SLPMAX=slpmax, SLPBIN=slpbin, $
                           TXMIN=txmin, TXMAX=txmax, TXBIN=txbin, $
                           PLOTFIT=plotfit, PLOTDATA=plotdata, VERBOSE=verbose


;+
; NAME:
;       BAYESIAN_LINEAR_XYERR()
;
; PURPOSE:
;       
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;       xs: data points' x values
;       ys: data points' y values
;       xerr: data points' x value errors
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
;       A. DeGroot, 2013 Oct 31, Univ. Cali, Riverside v2.0.0
;          -corrected marginalization over x error
;       A. DeGroot, 2013 Sept 23, Univ. Cali, Riverside v1.0.0
;
;-


  if keyword_set(INTMIN) then intmin = intmin[0] else intmin = -1.0  ;sets new value
  if keyword_set(INTMAX) then intmax = intmax[0] else intmax = 1.0   ;sets new value
  if keyword_set(INTBIN) then intbin = intbin[0] else intbin = 0.05  ;sets new value
  if keyword_set(SLPMIN) then slpmin = slpmin[0] else slpmin = 0.0   ;sets new value
  if keyword_set(SLPMAX) then slpmax = slpmax[0] else slpmax = 5.0   ;sets new value
  if keyword_set(SLPBIN) then slpbin = slpbin[0] else slpbin = 0.05  ;sets new value
  if keyword_set(TXMIN) then txmin = txmin[0] else txmin = -2.0       ;sets new value
  if keyword_set(TXMAX) then txmax = txmax[0] else txmax = 7.0       ;sets new value
  if keyword_set(TXBIN) then txbin = txbin[0] else txbin = 0.05      ;sets new value
  if keyword_set(PLOTFIT) then plotfit = 'Y' else plotfit = 'N'      ;sets new value
  if keyword_set(PLOTDATA) then plotdata = 'Y' else plotdata = 'N'   ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1 ;sets new value

  if verbose GE 4 THEN BEGIN                             ;check VERBOSE keyword
     print, xs                                           ;print info
     print, ys                                           ;print info
     print, xerr                                         ;print info
     print, yerr                                         ;print info
     print, ' '                                          ;space
  ENDIF                                                  ;end check VERBOSE keyword
  
  
  ;;;sanity checks
  nxs = n_elements(xs)                                               ;find # of elements
  nxe = n_elements(xerr)                                             ;find # of elements
  nys = n_elements(ys)                                               ;find # of elements
  nye = n_elements(yerr)                                             ;find # of elements
  if (nxs NE nys) then print, 'WARNING: # of xs not equal # of ys'   ;print warning 
  if (nxs NE nxe) then print, 'WARNING: # of xs not equal # of xerr' ;print warning 
  if (nys NE nye) then print, 'WARNING: # of ys not equal # of yerr' ;print warning 
  
  
  ;;;make our test point grids
  ndata = n_elements(xs)                                               ;find # of data points
  ints = dindgen((intmax-intmin)/intbin+1.0) * intbin + intmin         ;find test points
  nints = n_elements(ints)                                             ;find # of test points
  if verbose GE 2 THEN help, ints                                      ;print info
  if verbose GE 3 THEN print, 'Test intercept values: ', ints          ;print info
  slps = dindgen((slpmax-slpmin)/slpbin+1.0) * slpbin + slpmin         ;find test points
  nslps = n_elements(slps)                                             ;find # of test points
  if verbose GE 2 THEN help, slps                                      ;print info
  if verbose GE 3 THEN print, 'Test slope values: ', slps              ;print info
  txs = dindgen((txmax-txmin)/txbin+1.0) * txbin + txmin               ;find test points
  ntxs = n_elements(txs)                                               ;find # of test points
  if verbose GE 2 THEN help, txs                                       ;print info
  if verbose GE 3 THEN print, 'Test x values values: ', txs            ;print info
  if verbose GE 1 THEN print, ''                                       ;print info
  
  
  ;;;find likelihood of test points
  jlike = dblarr(nints, nslps)                                                       ;joint likelihood array to be filled
  ynorm = (1.0 / (2.0*!pi*yerr^2)^0.5)                                               ;find the normalization in y-dir
  ydenom = 2.0*yerr^2                                                                ;find y denoms in exp
  xnorm = (1.0 / (2.0*!pi*xerr^2)^0.5)                                               ;find normalization in x-dir
  xdenom = 2.0*xerr^2                                                                ;find x denominators
  FOR bb=0UL, nints-1, 1 DO BEGIN                                                    ;loop over the intercepts
     FOR cc=0UL, nslps-1, 1 DO BEGIN                                                 ;loop over slopes
        testing = slps[cc]*txs + ints[bb]                                            ;find hypothetical data values
        FOR aa=0UL, ndata-1, 1 DO BEGIN                                              ;loop over the data points
           xpart = (-1.0*(xs[aa]-txs)^2/xdenom[aa]) + alog(xnorm[aa])                ;the x error part
           ypart = (-1.0*(ys[aa]-testing)^2/ydenom[aa]) + alog(ynorm[aa])            ;the y error part
           tlikeli = ypart + xpart                                                   ;find likelihood in log space
           tlikeli = exp(tlikeli)                                                    ;out of log space: YOU CANT INTEGRATE IN LOG SPACE!!
           likeli = int_tabulated(txs, tlikeli)                                      ;integrate
           if aa eq 0 then likelihood = likeli else likelihood = likelihood * likeli ;find cumulative likelihood
        ENDFOR                                                                       ;end loop over data points
        jlike[bb,cc] = likelihood                                                    ;store value
     ENDFOR                                                                          ;end loop over slopes
  ENDFOR                                                                             ;end loop over intercepts


  ;;;Make some plots
  IF plotfit EQ 'Y' THEN BEGIN  ;check PLOTFIT keyword
     nwin = 1
     w = window(LOCATION=[100+50*nwin,25+25*nwin])
     xcontour = contour(jlike, ints, slps, $          ;2D posterior distribution plot
                        XTITLE='intercept [units]', $ ;plot options
                        YTITLE='slope [units]', $     ;plot options
                        TITLE='2D Posterior PDF', $   ;plot options
                        FONT_SIZE= 14, $              ;plot options
                        C_LABEL_SHOW= 0, $            ;plot options
                        AXIS_STYLE= 2, $              ;plot options
                        /CURRENT)                     ;plot options
     nwin++
     
    
     
     nogood = where(jlike NE jlike, nnogood) ;check for NaNs, INFs
     print, nnogood
     IF nnogood NE 0 THEN jlike[nogood] = 0.0 ;set to zero if present
     
     intprob = dblarr(nints)                                                    ;create array for marginalizing
     for xx=0UL, nints-1, 1 do begin                                            ;loop over intercepts
        intprob[xx] = total(jlike[xx,*])                                        ;marginalize over slopes
     endfor                                                                     ;end loop over intercepts
     norm_int = int_tabulated(ints, intprob)                                    ;normalization constant
     intprob = intprob * (1.0/norm_int)                                         ;normalize
     fakeys = [-10.0*min(intprob), 10.0*max(intprob)]                              ;fake data points 
     maxint = max(intprob, indint)                                              ;find most probable intercept value
     if verbose GE 1 THEN print,  'Most likeli intercept value: ', ints[indint] ;print info
     sigmas_int = sigmas(ints, intprob, LEVELS=1)                               ;find sigmas
     if verbose GE 1 THEN print, 'One sigma errors on intercept:', sigmas_int   ;print info
     w = window(LOCATION=[100+50*nwin,25+25*nwin])
     xplot = plot(ints, intprob, $                                               ;1D posterior for intercepts
                  XTITLE='intercept [units]', $                                  ;plot options
                  YTITLE='Probability', $                                        ;plot options
                  YRANGE=[0.0,1.25*max(intprob)], $                              ;plot options
                  TITLE='1D Posterior PDF for Intercept', $                      ;plot options
                  FONT_SIZE= 14, $                                               ;plot options
                  /CURRENT )                                                     ;plot options
     xplot1 = plot([ints[indint],ints[indint]], fakeys, LINESTYLE=2, NAME='MAX(Prob)', OVERPLOT=1) ;1D posterior for intercepts
     xplot2 = plot([ints[indint]-sigmas_int[0],ints[indint]-sigmas_int[0]], $    ;
                   fakeys, LINESTYLE=1, NAME='68% Conf', OVERPLOT=1)               ;1D posterior for intercepts
     xplot3 = plot([ints[indint]+sigmas_int[0],ints[indint]+sigmas_int[0]], $    ;
                   fakeys, LINESTYLE=1, OVERPLOT=1)                              ;1D posterior for intercepts
     xlegend = legend(TARGET=[xplot1, xplot2], POSITION = [0.65,0.82], $
                      FONT_SIZE= 10, $
                      THICK=1.5, SHADOW=0)
     nwin++                                                                      ;increase window counter
    
     slpprob = dblarr(nslps)                                                                       ;create array for marginalizing
     for xx=0UL, nslps-1, 1 do begin                                                               ;loop over slopes
        slpprob[xx] = total(jlike[*,xx])                                                           ;marginalize over slopes
     endfor                                                                                        ;end loop over slopes
     norm_slp = int_tabulated(slps, slpprob)                                                       ;normalization constant
     slpprob = slpprob * (1.0/norm_slp)                                                            ;normalize
     fakeys = [0.5*min(slpprob), 1.5*max(slpprob)]                                                 ;fake data points
     maxslp = max(slpprob, indslp)                                                                 ;find most probable slope value
     if verbose GE 1 THEN print,  'Most likely slope value: ', slps[indslp]                        ;prslp info
     sigmas_slp = sigmas(slps, slpprob, LEVELS=1)                                                  ;find sigmas
     if verbose GE 1 THEN print, 'One sigma errors on slope:', sigmas_slp                          ;prslp info
     w = window(LOCATION=[100+50*nwin,25+25*nwin])                                                 ;window
     xplot = plot(slps, slpprob, $                                                                 ;1D posterior for slopes
                  XTITLE='slpercept [units]', $                                                    ;plot options
                  YTITLE='Probability', $                                                          ;plot options
                  YRANGE=[0.0,1.25*max(slpprob)], $                                                ;plot options
                  TITLE='1D Posterior PDF for Slope', $                                            ;plot options
                  FONT_SIZE= 14, $                                                                 ;plot options
                  /CURRENT )                                                                       ;plot options
     xplot1 = plot([slps[indslp],slps[indslp]], fakeys, LINESTYLE=2, NAME='MAX(Prob)', OVERPLOT=1) ;1D posterior for slopes
     xplot2 = plot([slps[indslp]-sigmas_slp[0],slps[indslp]-sigmas_slp[0]], $                      ;plot options
                   fakeys, LINESTYLE=1, NAME='68% Conf', OVERPLOT=1)                               ;1D posterior for slopes
     xplot3 = plot([slps[indslp]+sigmas_slp[0],slps[indslp]+sigmas_slp[0]], $                      ;plot options
                   fakeys, LINESTYLE=1, OVERPLOT=1)                                                ;1D posterior for slopes
     xlegend = legend(TARGET=[xplot1, xplot2], POSITION = [0.65,0.82], $                           ;plot legend 
                      FONT_SIZE= 10, $                                                             ;plot options
                      THICK=1.5, SHADOW=0)                                                         ;plot options
     nwin++                                                                                        ;increase window counter
  ENDIF
  


  IF plotdata EQ 'Y' THEN BEGIN                                               ;check PLOTDATA keyword
     fakexs = [10.0*min(xs), 10.0*max(xs)]                                    ;fake data points
     fakeys = slps[indslp]*fakexs + ints[indint]                              ;fake data points
     w = window(LOCATION=[100+50*nwin,25+25*nwin])                            ;window set
     xplot = errorplot(xs, ys, xerr, yerr, 'o', $                             ;1D posterior for slpercepts
                       XTITLE = 'X VALUES', $                                 ;plot options
                       XRANGE=[min(xs)-0.25*min(xs), max(xs)+0.25*max(xs)], $ ;plot options
                       YTITLE = 'Y VALUES', $                                 ;plot options
                       YRANGE=[min(ys)-0.25*min(ys), max(ys)+0.25*max(ys)], $ ;plot options
                       FONT_SIZE= 14, $                                       ;plot options
                       /CURRENT )                                             ;plot options
     xplot1 = errorplot(fakexs, fakeys, [0.0,0.0], [0.0,0.0], $               ;1D posterior for slpercepts
                        'blue', LINESTYLE=0, THICK=2.5, OVERPLOT=1)           ;plot options
     nwin++                                                                   ;increase window counter

  ENDIF                         ;end check PLOTDATA keyword


end
;========================================================================================================================




;========================================================================================================================
pro bayesian_linear_xyerr_example

  ;xs = [1.0, 1.4, 2.1, 2.9]
  ;ys = [3.1, 4.1, 5.0, 7.1]
  ;xerr = [0.11, 0.12, 0.10, 0.11]*1.0
  ;yerr = [0.10, 0.11, 0.12, 0.11]*1.0
  intmin = 0.3
  intmax = 0.45
  intbin = 0.001
  slpmin = -0.2
  slpmax = 0.4
  slpbin = 0.01
  txmin = -3.0
  txmax = 3.0
  txbin = 0.1

  data = mrdfits('chris0034.fits', 1, hdr)
  tofit = where((data.O2 EQ 0) AND (data.virial_frac LT 1) AND (data.mass GT 10.42))
  help, data, /STRUC
  xs = data[tofit].mass-10.6
  xerr = data[tofit].emass
  ys = data[tofit].ub
  yerr = data[tofit].eub
  chk1 = data[tofit].O2
  chk2 = data[tofit].virial_frac

  bayesian_linear_xyerr, xs, ys, xerr, yerr, $
                         INTMIN=intmin, INTMAX=intmax, INTBIN=intbin, $
                         SLPMIN=slpmin, SLPMAX=slpmax, SLPBIN=slpbin, $
                         TXMIN=txmin, TXMAX=txmax, TXBIN=txbin, $
                         /PLOTFIT, /PLOTDATA 
  
end
;========================================================================================================================
