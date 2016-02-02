;========================================================================================================================
pro bayesian_constant_yerr, xs, ys, yerr, MPVAL=mpval, SIGVALS=sigvals, $
                            INTMIN=intmin, INTMAX=intmax, INTBIN=intbin, $
                            PLOTFIT=plotfit, PLOTDATA=plotdata, VERBOSE=verbose
  

;+
; NAME:
;       BAYESIAN_CONSTANT_YERR()
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
;       A. DeGroot, 2013 NOV 16, Univ. Cali, Riverside v1.0.0
;
;-


  if keyword_set(INTMIN) then intmin = intmin[0] else intmin = -1.0  ;sets new value
  if keyword_set(INTMAX) then intmax = intmax[0] else intmax = 1.0   ;sets new value
  if keyword_set(INTBIN) then intbin = intbin[0] else intbin = 0.05  ;sets new value
  if keyword_set(PLOTFIT) then plotfit = 'Y' else plotfit = 'N'      ;sets new value
  if keyword_set(PLOTDATA) then plotdata = 'Y' else plotdata = 'N'   ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1 ;sets new value
  
  if verbose GE 4 THEN BEGIN    ;check VERBOSE keyword
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
  ndata = n_elements(xs)                                               ;find # of data points
  ints = dindgen((intmax-intmin)/intbin+1.0) * intbin + intmin         ;find test points
  nints = n_elements(ints)                                             ;find # of test points
  if verbose GE 2 THEN help, ints                                      ;print info
  if verbose GE 3 THEN print, 'Test intercept values: ', ints          ;print info
  if verbose GE 1 THEN print, ''                                       ;print info
  
  
  ;;;find likelihood of test points
  jlike = dblarr(nints)                                       ;joint likelihood array to be filled
  ynorm = (1.0 / (2.0*!pi*yerr^2)^0.5)                        ;find the normalization in y-dir
  ydenom = 2.0*yerr^2                                         ;find y denoms in exp
  FOR bb=0UL, nints-1, 1 DO BEGIN                             ;loop over the intercepts
     ypart = (-1.0*(ys-ints[bb])^2/ydenom) + alog(ynorm)      ;the y error part
     tlikeli = ypart                                          ;find likelihood in log space
     tlikeli = exp(tlikeli)                                   ;out of log space: YOU CANT INTEGRATE IN LOG SPACE!!
     likeli = total(tlikeli)                                  ;integrate
     jlike[bb] = likeli                                       ;store value
  ENDFOR                                                      ;end loop over intercepts
  
  nogood = where(jlike NE jlike, nnogood)                   ;check for NaNs, INFs
  IF nnogood NE 0 THEN jlike[nogood] = 0.0                  ;set to zero if present
  sigs = sigmas(ints, jlike, LEVELS=1)                      ;find sigmas
  maxval = max(jlike, maxind)                               ;find max value
  print, '*****Most likely constant values: ', ints[maxind] ;print value
  fakeys = [-0.5,9999.0]                                    ;fake y points
  

  ;;;Make some plots
  IF plotfit EQ 'Y' THEN BEGIN                                      ;check PLOTFIT keyword
     window, 0, XPOS=200, YPOS=400, XSIZE=500, YSIZE=500            ;window options
     plot, ints, jlike, $                                           ;2D posterior distribution plot
           BACKGROUND='FFFFFF'XL, $                                 ;plot options
           COLOR='000000'XL, $                                      ;plot options
           XTITLE='constant [units]', $                             ;plot options
           YTITLE='Probability [units]', $                          ;plot options
           TITLE='PDF for Constant Value', $                        ;plot options
           CHARSIZE=1.4                                             ;plot options
     oplot, [ints[maxind],ints[maxind]], fakeys, LINESTYLE=2, $     ;vert line for max value
            COLOR='000000'XL, THICK=2.0                             ;oplot options                       
     oplot, [ints[maxind]-sigs[0], ints[maxind]-sigs[0]], fakeys, $ ;vert line for lower 1sig
            LINESTYLE=1, COLOR='000000'XL, THICK=2.0                ;oplot options            
     oplot, [ints[maxind]+sigs[1], ints[maxind]+sigs[1]], fakeys, $ ;vert line for lower 1sig
            LINESTYLE=1, COLOR='000000'XL, THICK=2.0                ;oplot options 
  ENDIF                                                             ;end check PLOTFIT keyword
  
  IF plotdata EQ 'Y' THEN BEGIN                                     ;check PLOTDATA keyword
     fakexs = [min(xs)-1.0, max(xs)+1.0]                            ;fake data points
     window, 1, XPOS=250, YPOS=350, XSIZE=500, YSIZE=500            ;window options
     plot, xs, ys, PSYM=1, $                                        ;2D posterior distribution plot
           BACKGROUND='FFFFFF'XL, $                                 ;plot options
           COLOR='000000'XL, $                                      ;plot options
           XTITLE='X Values [units]', $                             ;plot options
           YTITLE='Y Values [units]', $                             ;plot options
           TITLE='Data Plotted with Constant', $                    ;plot options
           CHARSIZE=1.4                                             ;plot options
     oplot, fakexs, [ints[maxind], ints[maxind]], $                 ;vert line for max value
            LINESTYLE=2, $                                          ;oplot options
            COLOR='000000'XL, THICK=2.0                             ;oplot options                       
     oplot, fakexs, [ints[maxind]-sigs[0], ints[maxind]-sigs[0]], $ ;vert line for lower 1sig
            LINESTYLE=1, COLOR='000000'XL, THICK=2.0                ;oplot options            
     oplot, fakexs, [ints[maxind]+sigs[1], ints[maxind]+sigs[1]], $ ;vert line for lower 1sig
            LINESTYLE=1, COLOR='000000'XL, THICK=2.0                ;oplot options 
  ENDIF                                                             ;end check PLOTDATA keyword
  
  mpval = ints[maxind]          ;pass value
  sigvals = sigs                ;pass value


END
;========================================================================================================================




;========================================================================================================================
pro bayesian_constant_yerr_example

  xs = [1.1, 1.4, 2.1, 2.9, 3.5, 4.0, 4.5, 4.8, 1.3, 1.7, 2.1, 2.4, 2.7, 3.0, 3.3, 3.6]
  ys = [3.1, 3.1, 3.2, 3.1, 2.9, 2.9, 3.1, 3.0, 2.9, 2.95, 3.05, 3.0, 2.9, 3.9, 3.05, 2.95]
  yerr = [0.10, 0.11, 0.12, 0.11, 0.10, 0.10, 0.11, 0.09]*0.5
  intmin = 2.5
  intmax = 3.5
  intbin = 0.0001

  bayesian_constant_yerr, xs, ys, yerr, INTMIN=intmin, INTMAX=intmax, $
                         INTBIN=intbin, /PLOTFIT, /PLOTDATA 
  
end
;========================================================================================================================
