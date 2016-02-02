;+
; NAME:
;       QUIESCENT()
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
PRO QUIESCENT::getprop, TLA=tla, QUIOBJVER=quiobjver

  IF arg_present(TLA) THEN tla = self.tla                   ;return the data
  IF arg_present(QUIOBJVER) THEN quiobjver = self.quiobjver ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO QUIESCENT::grabdata, which

  print, 'hey world'

  CASE fix(which) OF            ;which file to read
     
     'data' : BEGIN                                                                ;main 1d spectrum
        content = mrdfits(strcompress(self.indir + self.epsfileod, /REMOVE_ALL), $ ;cont next line
                          1, hdr, /SILENT)                                         ;read in file

       ;self.data = ptr_new(content)                                               ;store data
       ; self.datahdr = ptr_new(hdr)                                                ;store data header
       ; IF (self.help EQ 1) THEN BEGIN                                             ;help requested
       ;    help, content, /STRUC                                                   ;structur help
        ;   print, hdr                                                              ;print info
       ; ENDIF                                                                      ;help reqested
     ;END
  ENDCASE

END
;====================================================================================================



;====================================================================================================
PRO QUIESCENT::findquiescent

  print, 'hey world'
  help, data, /STRUC


END
;====================================================================================================



;====================================================================================================
PRO QUIESCENT::cleanup

  ptr_free, self.quidata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION QUIESCENT::init, QUIDATA=quidata                            
  
  self.tla = 'QUI'              ;three letter acronym
  self.quiobjver = 'v0-0-1'     ;code version

  IF keyword_set(QUIDATA) THEN self.quidata = ptr_new(quidata) ;set pointer 
  
 
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO QUIESCENT__define

  void = {QUIESCENT, TLA:'A', quiobjver:'A', $
          quidata:ptr_new()}

  RETURN
END
;====================================================================================================

