;+
; NAME:
;       XXXXX()
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
PRO XXXXX::getprop

  ;IF arg_present(YYYY) THEN     ;return the data

  RETURN
END
;====================================================================================================



;====================================================================================================
PRO XXXXX::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION XXXXX::init                            
  
                                ;self.objver = 'v1-0-0'                         ;code version
 
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO XXXXX__define

  void = {XXXXX, objver:'A'}

  RETURN
END
;====================================================================================================

