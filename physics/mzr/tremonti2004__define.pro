;+
; NAME:
;       TREMONTI2004()
;
; PURPOSE:
;           
;
; CALLING SEQUENCE:
;       
;      
; INPUTS:
;        
;
; OPTIONAL INPUTS:
;       
;
; KEYWORD PARAMETERS:
;        
;
; OUTPUTS:
;       
;
; OPTIONAL OUTPUTS:
;
;
; COMMON BLOCKS:
;       
;
; PROCEDURES USED:
;       
;
; COMMENTS:
;        
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2015 May 8, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO tremonti2004::getprop, TR04OBJVER=tr04objver

  IF arg_present(TR04OBJVER) THEN tr04objver = self.tr04objver ;return the data
  
  RETURN
END
;====================================================================================================



;====================================================================================================
FUNCTION tremonti2004::MZRFIT, whmetal, xs


  CASE whmetal OF 
     'R23' : ys = -1.492 + 1.847*xs -0.08026*xs^2
     ELSE : BEGIN
        print, 'WARNING!! Choice of metallicity indicator not valid.'
        print, ' Only choice is R23' 
     ENDELSE
  ENDCASE

  
  RETURN, ys
END
;====================================================================================================


;====================================================================================================
FUNCTION tremonti2004::MYMZRFIT, xs, ys, dxs, dys, $
                                 CMIN=cmin, CMAX=cmax, CPTS=cpts, $
                                 TXMIN=txmin, TXMAX=txmax, TXPTS=txpts, $
                                 PLOTPOST=plotpost, PLOTDATA=plotdata, NWIN=nwin, $
                                 VERBOSE=verbose


 

  ;;;set defaults
  IF keyword_set(CMIN) THEN cmin = float(cmin[0]) ELSE cmin = -1.0        ;set default value
  IF keyword_set(CMAX) THEN cmax = float(cmax[0]) ELSE cmax = 0.0         ;set default value
  IF keyword_set(CPTS) THEN cpts = ulong(cpts[0]) ELSE cpts = 1000        ;set default value
  IF keyword_set(TXMIN) THEN txmin = txmin[0] ELSE txmin = 7.0            ;sets new value
  IF keyword_set(TXMAX) THEN txmax = txmax[0] ELSE txmax = 12.0           ;sets new value
  IF keyword_set(TXPTS) THEN txpts = txpts[0] ELSE txpts = 1000           ;sets new value
  IF keyword_set(PLOTDATA) THEN plotdata = 'Y' ELSE plotdata = 'N'        ;sets new value
  IF keyword_set(PLOTPOST) THEN plotpost = 'Y' ELSE plotpost = 'N'        ;sets new value
  IF keyword_set(NWIN) THEN nwin = fix(nwin[0]) ELSE nwin = 1             ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = fix(verbose[0]) ELSE verbose = 1 ;sets new value


  ;;;sanity checks
  nxs = n_elements(xs)                                               ;find # of elements
  nxe = n_elements(dxs)                                              ;find # of elements
  nys = n_elements(ys)                                               ;find # of elements
  nye = n_elements(dys)                                              ;find # of elements
  if (nxs NE nys) then print, 'WARNING: # of xs not equal # of ys'   ;print warning 
  if (nxs NE nxe) then print, 'WARNING: # of xs not equal # of xerr' ;print warning 
  if (nys NE nye) then print, 'WARNING: # of ys not equal # of yerr' ;print warning 


  ;;;prep work
  ndata = n_elements(xs)                                 ;find # of data points
  cs = ((cmax-cmin)/cpts) * dindgen(cpts+1) + cmin       ;find test points
  ncs = n_elements(cs)                                   ;find # of test points
  txs = ((txmax-txmin)/txpts) * dindgen(txpts+1) + txmin ;find test x-points
  ntxs = n_elements(txs)                                 ;find # of test x-points
  jlike = dblarr(ncs)                                    ;joint likelihood array to be filled in
  help, jlike

  
  ;;;find likelihood of test points
  ynorm = (1.0 / (2.0*!pi*dys^2)^0.5)                                             ;find the normalization in y-dir
  ydenom = 2.0*dys^2                                                              ;find y denoms in exp
  xnorm = (1.0 / (2.0*!pi*dxs^2)^0.5)                                             ;find normalization in x-dir
  xdenom = 2.0*dxs^2                                                              ;find x denominators
  FOR bb=0UL, ncs-1, 1 DO BEGIN                                                   ;loop over the intercepts
     testing = self.mzrfit('R23', txs) + cs[bb]                                   ;find hypothetical data values
     FOR aa=0UL, ndata-1, 1 DO BEGIN                                              ;loop over the data points
        xpart = (-1.0*(xs[aa]-txs)^2/xdenom[aa]) + alog(xnorm[aa])                ;the x error part
        ypart = (-1.0*(ys[aa]-testing)^2/ydenom[aa]) + alog(ynorm[aa])            ;the y error part
        tlikeli = ypart + xpart                                                   ;find likelihood in log space
        tlikeli = exp(tlikeli)                                                    ;out of log space: YOU CANT INTEGRATE IN LOG SPACE!!
        likeli = int_tabulated(txs, tlikeli)                                      ;integrate
        if aa eq 0 then likelihood = likeli else likelihood = likelihood * likeli ;find cumulative likelihood
     ENDFOR                                                                       ;end loop over data points
     jlike[bb] = likelihood                                                       ;store value
  ENDFOR                                                                          ;end loop over intercepts

  
  ;;;post run analysis
  nogood = where(jlike NE jlike, nnogood)                                ;check for NaNs, INFs
  IF nnogood NE 0 THEN jlike[nogood] = 0.0                               ;set to zero if present
  maxc = max(jlike, indc)                                                ;find most probable intercept value
  IF verbose GE 1 THEN print,  'Most likeli intercept value: ', cs[indc] ;print info
  sigcs = sigmas(cs, jlike, LEVELS=1)                                    ;find sigmas
  IF verbose GE 1 THEN print, 'One sigma errors on intercept:', sigcs    ;print info
  

  ;;;plotting
  IF plotpost EQ 'Y' THEN BEGIN                                          ;check PLOTPOST keyword
     w = window(LOCATION=[100+50*nwin,25+25*nwin])                       ;window set
     xplot = plot(cs, jlike, '-', $                                      ;1D posterior for slpercepts
                  XTITLE = 'Constant Values', $                          ;plot options
                  XRANGE=[min(cs)-0.25*min(cs), max(cs)+0.25*max(cs)], $ ;plot options
                  YTITLE = 'Likelihood', $                               ;plot options
                  FONT_SIZE= 14, $                                       ;plot options
                  /CURRENT )                                             ;plot options
     nwin++                                                              ;increase window counter
  ENDIF                                                                  ;end check PLOTPOST keyword

  IF plotdata EQ 'Y' THEN BEGIN                                               ;check PLOTDATA keyword
     fakeys = self.mzrfit('R23', txs) + cs[indc]                              ;fake data points
     w = window(LOCATION=[100+50*nwin,25+25*nwin])                            ;window set
     xplot = errorplot(xs, ys, dxs, dys, 'o', $                               ;1D posterior for slpercepts
                       XTITLE = 'X VALUES', $                                 ;plot options
                       XRANGE=[min(xs)-0.25*min(xs), max(xs)+0.25*max(xs)], $ ;plot options
                       YTITLE = 'Y VALUES', $                                 ;plot options
                       YRANGE=[min(ys)-0.25*min(ys), max(ys)+0.25*max(ys)], $ ;plot options
                       FONT_SIZE= 14, $                                       ;plot options
                       /CURRENT )                                             ;plot options
     xplot1 = plot(txs, fakeys, 'b-', LINESTYLE=0, THICK=2.5, OVERPLOT=1)     ;plot options
     nwin++                                                                   ;increase window counter
  ENDIF                                                                       ;end check PLOTDATA keyword


  RETURN, {name:'tr04', mpv:cs[indc], nmpv:sigcs[0], pmpv:sigcs[1]}
END
;====================================================================================================


;====================================================================================================
PRO tremonti2004::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION tremonti2004::init

  self.tr04objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO tremonti2004__define

  void = {tremonti2004, tr04objver:'A'}

  RETURN
END
;====================================================================================================

