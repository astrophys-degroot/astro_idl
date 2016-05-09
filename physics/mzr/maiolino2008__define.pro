;+
; NAME:
;       MAIOLINO2008()
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
PRO maiolino2008::getprop, MA08OBJVER=ma08objver, R23DATA=r23data, MZRDATA=mzrdata

  IF arg_present(MA08OBJVER) THEN ma08objver = self.ma08objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.ma08r23data       ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.ma08mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION maiolino2008::convertmetallicity ;, whratio, HAFLUX=haflux, HBFLUX=hbflux, $
                                ;NIIFLUX=niiflux, OIIIFLUX=oiiiflux


  CASE whratio OF 
     'N2' : ys = 8.62 + 0.36 * alog10(niiflux / haflux) 
     ELSE : BEGIN
        print, 'WARNING!! Choice of metallicity indicator not valid.'
        print, ' Only choices are N2 ' 
     ENDELSE
  ENDCASE

  
  RETURN, ys
END
;====================================================================================================


;====================================================================================================
FUNCTION maiolino2008::MZRFIT


  CASE whmetal OF 
     'N2' : BEGIN
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
        
        ys = zmetals
     END
     ELSE : BEGIN
        print, 'WARNING!! Choice of metallicity indicator not valid.'
        print, ' Only choices are N2' 
     ENDELSE
  ENDCASE

  
  RETURN, ys
END
;====================================================================================================


;====================================================================================================
PRO maiolino2008::boxscore


  self.ma08sampsize = 9         ;sample size
  self.ma08IMF = 'maraston2005' ;IMF choice
  ;;;also BC03
  self.ma08mzrtype = 'R23'      ;MZR conversion type
  ;;;others including [OIII]5007 /Hbeta and [NeIII]3870/[OII]3727 and
  ;;;many others
  self.ma08selection = 'LBG'    ;sample selection
  self.ma08zmin = 3.0           ;minimum redshift
  self.ma08zmax = 3.7           ;maximum redshift

  self.ma08R23data = ptr_new({ xsmod:[10.2], $    ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                               xserrmodn:[0.9], $ ;
                               xserrmodp:[0.8], $ ;
                               xserrmod:[0.9], $  ;
                               ys:[8.24], $       ;
                               yserrn:[0.20], $   ;
                               yserrp:[0.15], $   ;
                               yserr:[0.20], $    ;
                               ul:[0], $
                               ngal:[9]})         ;
  self.ma08mzrdata = ptr_new({ xsmod:[10.2], $    ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                               xserrmodn:[0.9], $ ;
                               xserrmodp:[0.8], $ ;
                               xserrmod:[0.9], $  ;
                               ys:[8.24], $       ;
                               yserrn:[0.20], $   ;
                               yserrp:[0.15], $   ;
                               yserr:[0.20], $    ;
                               ul:[0], $
                               ngal:[9]}) ;
  
END
;====================================================================================================


;====================================================================================================
PRO maiolino2008::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION maiolino2008::init

  self.ma08objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO maiolino2008__define

  void = {maiolino2008, ma08objver:'A', $
          ma08sampsize:0, ma08zmin:0.0, ma08zmax:0.0, $
          ma08IMF:'A', ma08mzrtype:'A', ma08selection:'A', $
          ma08R23data:ptr_new(), ma08mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

