;========================================================================================================================
function asinh_gen, xxs, xa, xb, xc 


;+
; NAME:
;       ASINH_GEN()
;
; PURPOSE:
;       Function to return values of the function y(x) =
;       c * (asinh(a*x) + b)    
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
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.0'


  xys = xc * asinh(xa + xxs) + xb

  RETURN, xys
END
;========================================================================================================================
