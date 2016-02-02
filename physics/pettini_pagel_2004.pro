;========================================================================================================================
function PETTINI_PAGEL_2004, xhaflux, xniiflux


;+
; NAME:
;       XXXX()
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
;       A. DeGroot, 2014 Oct 8, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.0'


  zmetals = 8.90 + 0.57 * alog10(xniiflux / xhaflux)

  
  RETURN, zmetals
END
;========================================================================================================================
