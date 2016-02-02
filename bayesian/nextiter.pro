;========================================================================================================================
function nextiter, xxs, xys, NOUT=nout, FRACMAX=fracmax, NDISPBINS=ndispbins 
  

;+
; NAME:
;       NEXTITER()
;
; PURPOSE:
;       In a classical call to a fitting routine based on Bayesian
;       inference, this routine examines the PDF of a single variable
;       and determines a "zoom in" region for a more detailed run of
;       the fitting routine on the area of interest i.e. the peak of
;       the PDF    
;
;
; CALLING SEQUENCE:
;       
;      
; INPUTS:
;        
;
; OPTIONAL INPUTS:
;       NOUT: # of indices of padding to use in either direction
;       FRACMAX: fraction of max value that a index must be above to count as non-zero
;       NDISPBINS: number of bins used in determining the bin size
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
;       A. DeGroot, 2013 August 22, Univ. Cali, Riverside v1.0.0
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.0'


  IF keyword_set(NOUT) THEN nout = nout[0] ELSE nout = 1                        ;sets new value
  IF keyword_set(FRACMAX) THEN fracmax = fracmax[0] ELSE fracmax = 0.0001       ;sets new value
  IF keyword_set(NDISPBINS) THEN ndispbins = ndispbins[0] ELSE ndispbins = 20.0 ;sets new value

  nxxs = n_elements(xxs)
  chk = where(xys GT fracmax*max(xys), nchk)
  IF nchk GT 0 THEN BEGIN
     minind = min(chk)-nout
     IF minind LT 0 THEN BEGIN
        minind = 0
        xmin = xxs[minind]
     ENDIF ELSE xmin = xxs[minind]
     maxind = max(chk)+nout
     IF maxind GT nxxs-1 THEN BEGIN
        maxind = nxxs-1
        xmax = xxs[maxind]
     ENDIF ELSE xmax = xxs[maxind]
     xbin = (xmax-xmin) / ndispbins
  ENDIF ELSE BEGIN
                                ;print, 'Shit everything is all zeroes'
     xmin = xxs[0]
     xmax = xxs[nxxs-1]
     xbin = (xmax-xmin) / ndispbins
  ENDELSE

  
  RETURN, [xmin, xmax, xbin]
END
;========================================================================================================================
