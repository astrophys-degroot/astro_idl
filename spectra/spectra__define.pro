;+
; NAME:
;       SPECTRA()
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
PRO SPECTRA::getprop, SPECOBJVER=specobjver

  IF arg_present(SPECOBJVER) THEN specobjver = self.specobjver ;return the data

  RETURN
END
;====================================================================================================



;====================================================================================================
PRO SPECTRA::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION SPECTRA::init                            
  
  self.specobjver = 'v0-0-1'    ;code version
 
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO SPECTRA__define

  void = {SPECTRA, specobjver:'A', $
          lambdas:ptr_new(), flux:ptr_new(), fluxerr:ptr_new(), fluxflag:ptr_new(), hdr:ptr_new()}

  RETURN
END
;====================================================================================================

