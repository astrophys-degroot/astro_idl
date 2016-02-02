;========================================================================================================================
function sigclip, xarray, NITERS=niters, SIGMA=sigma, CLIPPED=clipped, VERBOSE=verbose
  


;+
; NAME:
;       SIGCLIP()
;
; PURPOSE:
;       To find the indices of an array which survive an iterative
;       sigma clipping or the indices of those that don't.     
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
;       A. DeGroot, 2015 May 28, Univ. Cali, Riverside v2.0.0
;          -fixed bug where points sigma below the mean were not clipped
;      
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '2.0.0'


  IF keyword_set(NITERS) THEN niters = niters[0] ELSE niters = 5 ;set default value
  IF keyword_set(SIGMA) THEN sigma = sigma[0] ELSE sigma = 3.0   ;set default value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 0 ;set default value

  ;print, xarray

  flag = intarr(n_elements(xarray))                                                  ;make flag array
  flag[*] = 0                                                                        ;make sure all entries are 0
  escape = 0                                                                         ;escape flag
  xx = 0                                                                             ;counter
  WHILE (xx LT niters) AND (escape EQ 0) DO BEGIN                                    ;loop over iterations
     chk = where(flag EQ 0)                                                          ;find what remains
     IF chk[0] EQ -1 THEN BEGIN                                                      ;check if nothing remains
        print, 'WARNING!! Nothing left after clipping!!'                             ;print info
        print, '  Not even sure this is possible!'                                   ;print info
     ENDIF                                                                           ;end if nothing remains
     xmean = mean(xarray[chk])                                                       ;mean of what is left
     xsig = stdev(xarray[chk])                                                       ;sigma of what is left
     ;print, xmean, xsig
     ;print, abs(xarray - xmean) / (xsig)
     chk = where(abs(xarray - xmean) GT sigma*xsig) ;what gets clipped
     ;print, chk
     ;stop
     IF chk[0] NE -1 THEN BEGIN                                                      ;something to clip
        flag[chk] = 1                                                                ;flag clipped
        xx = xx + 1                                                                  ;up counter
     ENDIF ELSE BEGIN                                                                ;nothing to clip
        IF (verbose GE 3) THEN print, 'WARNING!! Nothing clipped in iteration: ', xx ;print info
        IF (verbose GE 3) THEN print, '  Ending clipping...'                         ;print info
        escape = 1                                                                   ;set escape flag
     ENDELSE                                                                         ;end nothing clipped
  ENDWHILE
  
  keep = where(flag EQ 0, COMPLEMENT=clip) ;find which survived

  IF keyword_set(CLIPPED) THEN RETURN, clip ELSE RETURN, keep ;pass along info
END
;========================================================================================================================
