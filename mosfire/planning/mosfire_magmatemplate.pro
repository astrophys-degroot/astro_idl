;========================================================================================================================
function mosfire_magmatemplate, nentries 


;+
; NAME:
;       MOSFIRE_MAGMATEMPLATE()
;
; PURPOSE:
;       Return a structure of to be filled that corresponds to the
;       standard MAGMA inputs            
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


  ;;;Creating outfile structure
  struct = {id:'obj1', priority:12, jmag:20.0, ra:20.0D, dec:35.0D, $ ;cont next line
            epoch:2000.0, equinox:2000.0, thing1:0, thing2:0}         ;base structur
  stru = replicate(struct, nentries)                                  ;replicate structure
  

  RETURN, stru
END
;========================================================================================================================
