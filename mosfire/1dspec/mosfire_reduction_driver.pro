;========================================================================================================================
PRO MOSFIRE_REDUCTION_DRIVER


;+
; NAME:
;        MOSFIRE_REDUCTION_DRIVER 
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
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '0-0-1'
  ;;;very early stages
  ;;;want to create a structure to read in there for steps of analysis
  ;;;records to be kept.


  dir_for_output = '/Users/adegroot/research/dataredux/mosfire/'
  mask = 'xmm105_mask1_v1'
  date = '2014nov17'
  band = 'H'
  
  name = 'anything'
  myextract = obj_new('mosfireextract', mask, dir_for_output, date, band)
  myextract.prep
  help, myextract
  help, myextract, /OBJ
  


END
;========================================================================================================================

