;========================================================================================================================
function MAIOLINO_2008, xflux1, xflux2, N2=N2


;+
; NAME:
;       MAIOLINO_2008()
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
;       A. DeGroot, 20145 Mar 24, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;       !!!!N2 calibration seems to fail when the flux ratio is small?!?!?!?     
;
;
;-
  version = '1.0.0'


  
  coeffs = {name:'N2', C0:-0.7732, C1:1.2357, C2:-0.2811, C3:-0.7201, C4:-0.3330}
  
  IF keyword_set('N2') THEN BEGIN
     zmetals = xflux1                                                                 ;copy array
     zmetals[*] = 0.0                                                                 ;reset to zero
     R = (xflux2 / xflux1)                                                            ;find ratio of flux
     logR = alog10(R)                                                                 ;find log of ratio
     FOR xx=0, n_elements(xflux1)-1, 1 DO BEGIN                                       ;loop over elements of flux
        fzcoeffs = [(coeffs.c0-logR[xx]), coeffs.c1, coeffs.c2, coeffs.c3, coeffs.c4] ;arrange coeffs
        roots = fz_roots(fzcoeffs, /DOUBLE)                                           ;find roots
        roots = roots + 8.69                                                          ;add solar metallicity b/c of definition
        reals = real_part(roots)                                                      ;roots
        imaginary = imaginary(roots)                                                  ;how close to zero
        chk = where(imaginary EQ 0)                                                   ;find real roots
        IF chk[0] NE -1 THEN BEGIN                                                    ;if a real root exists
           min = min(reals[chk], minind)                                              ;find minimum real root
           zmetals[xx] = reals[chk[minind]]                                           ;store metallicity
        ENDIF ELSE BEGIN                                                              ;end real root found
           print, 'WARNING!! No real metallcity found'                                ;print info
        ENDELSE                                                                       ;end no real root found
     ENDFOR                                                                           ;end loop over fluxes
  ENDIF                                                                               ;end N2 metallicity calibrator
  
  RETURN, zmetals
END
;========================================================================================================================
