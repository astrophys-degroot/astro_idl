;+
; NAME:
;       BEERS1990()
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
PRO beers1990::getprop, VERSION=version

  IF arg_present(VERSION) THEN version = self.version       ;return the data
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION beers1990::mad
  

  xdata = *self.data                       ;get data
  xdata = xdata[sort(xdata)]               ;make sure data is sorted
  xdatamed = median(xdata)                 ;find median of data
  xdatamad = median(abs(xdata - xdatamed)) ;find median absolute difference
  self.mad = xdatamad                      ;store value
  
  RETURN, xdatamad
END
;====================================================================================================


;====================================================================================================
FUNCTION beers1990::biweight, TUNECONST=tuneconst, NITERS=niters

  IF keyword_set(TUNECONST) THEN tuneconst = tuneconst[0] ELSE tuneconst = self.cbiconst
  IF keyword_set(NITERS) THEN niters = niters[0] ELSE niters = self.cbiniters
  
  
  ;;;prep work
  xdata = *self.data            ;get data
  xdata = xdata[sort(xdata)]    ;make sure data is sorted
  xdatamed = median(xdata)      ;find median
  
  
  ;;;prep and while loop
  cnt = 0                       ;start counting

  WHILE (cnt LT niters) DO BEGIN ;loop 

     xmad = median(abs(xdata - xdatamed))           ;find med abs dev
     uval = (xdata - xdatamed) / (tuneconst * xmad) ;find u value
     chk = where(uval LT 1.0)                       ;find where its less than 1
     IF (chk[0] NE -1) THEN BEGIN                   ;if points satisfy condition
        denom = total( (1.0 - uval[chk]^2)^2 )      ;denominator of eq 5
        numer1 = (xdata[chk] - xdatamed)            ;part of numerator of eq 5
        numer2 = (1.0 - uval[chk]^2)^2              ;part of numerator of eq 5
        numer = total(numer1 * numer2)              ;numerator of eq 5
     ENDIF ELSE BEGIN                               ;if no points satify we are done
        denom = 1.0                                 ;set to trivial
        numer = 1.0                                 ;set to trivial
        cnt = niters                                ;escape while loop
     ENDELSE                                        ;end we are done
     
     cbi = xdatamed + (numer / denom) ;find biweight estimator
     xdatamed = cbi                   ;use biweight estimator as new median guess
     cnt = cnt + 1                    ;up counter
  ENDWHILE                            ;end loop
  

  RETURN, cbi
END
;====================================================================================================



;====================================================================================================
FUNCTION beers1990::biweightscale, TUNECONST=tuneconst, NITERS=niters

  print, 'NOT YET TESTED FOR ACCURACY!!!'
  IF keyword_set(TUNECONST) THEN tuneconst = tuneconst[0] ELSE tuneconst = self.sbiconst
  IF keyword_set(NITERS) THEN niters = niters[0] ELSE niters = self.sbiniters
  
  
  ;;;prep work
  xdata = *self.data            ;get data
  nxdata = n_elements(xdata)    ;how many data points
  xdata = xdata[sort(xdata)]    ;make sure data is sorted
  xdatamed = median(xdata)      ;find median
  
  
  ;;;prep and while loop
  cnt = 0                       ;start counting

  WHILE (cnt LT niters) DO BEGIN ;loop 

     xmad = median(abs(xdata - xdatamed))           ;find med abs dev
     uval = (xdata - xdatamed) / (tuneconst * xmad) ;find u value
     chk = where(uval LT 1.0)                       ;find where its less than 1
     IF (chk[0] NE -1) THEN BEGIN                   ;if points satisfy condition
        denom1 = (1.0 - uval[chk]^2)                ;part of denominator of eq 9
        denom2 = (1.0 - 5.0*uval[chk]^2)            ;part of denominator of eq 9
        denom = total(denom1 / denom2)              ;denominator of eq 5
        numer1 = (xdata[chk] - xdatamed)^2          ;part of numerator of eq 5
        numer2 = (1.0 - uval[chk]^2)^4              ;part of numerator of eq 5
        numer = total(numer1 * numer2)^0.5          ;numerator of eq 5
     ENDIF ELSE BEGIN                               ;if no points satify we are done
        denom = 1.0                                 ;set to trivial
        numer = 1.0                                 ;set to trivial
        cnt = niters                                ;escape while loop
     ENDELSE                                        ;end we are done
     
     sbi = nxdata^0.5 * (numer / denom) ;find biweight estimator
     xdatamed = sbi                     ;use biweight estimator as new median guess
     cnt = cnt + 1                      ;up counter
  ENDWHILE                              ;end loop
  

  RETURN, sbi
END
;====================================================================================================


;====================================================================================================
PRO beers1990::cleanup

  ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION beers1990::init, data, CBICONST=cbiconst, CBINITERS=cbiniters, $
                          SBICONST=sbiconst, SBINITERS=sbiniters

  self.data = ptr_new(data)
  self.version = 'v1-0-0'
  IF keyword_set(CBICONST) THEN self.cbiconst = cbiconst[0] ELSE self.cbiconst = 6.0
  IF keyword_set(CBINITERS) THEN self.cbiniters = cbiniters[0] ELSE self.cbiniters = 1
  IF keyword_set(SBICONST) THEN self.sbiconst = sbiconst[0] ELSE self.sbiconst = 9.0
  IF keyword_set(SBINITERS) THEN self.sbiniters = sbiniters[0] ELSE self.sbiniters = 1

  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO beers1990__define

  void = {beers1990, version:'A', data:ptr_new(), MAD:0.0, CBICONST:0.0, CBINITERS:1, SBICONST:0.0, SBINITERS:1}

  RETURN
END
;====================================================================================================

