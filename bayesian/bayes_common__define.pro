;+
; NAME:
;       bayes_common()
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
;
;-

;====================================================================================================
PRO bayes_common::getprop, OBJVER=objver

  IF arg_present(OBJVER) THEN objver = self.bco_objver ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION bayes_common::mkarray, zmin, zmax, zbins


  zs = ((zmax-zmin) / zbins) * ulindgen(zbins+1) + zmin

                             
  RETURN, zs
END
;====================================================================================================


;====================================================================================================
PRO bayes_common::break2d, xjlike, PDFX=pdfx, PDFY=pdfy


  PDFX = total(xjlike, 2)       ;sum over 2nd dimension
  PDFY = total(xjlike, 1)       ;sum over first dimension
                             
  RETURN
END
;====================================================================================================


;====================================================================================================
PRO bayes_common::cleanup

                                ;ptr_free, self.bco_xs
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION bayes_common::init                          
  
  self.bco_objver = 'v1-0-0'                                 ;code version
                                ;self.bco_xs = ptr_new(tmpxs)                               ;store values
    
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO bayes_common__define

  void = {bayes_common, bco_objver:'A'}

  RETURN
END
;====================================================================================================

