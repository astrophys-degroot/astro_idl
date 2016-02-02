;========================================================================================================================
FUNCTION tagprompt, xdata, xtext, MAX=max


;+
; NAME:
;       TAGPROMPT()
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
;       A. DeGroot, 20145 Mar 16, Univ. Cali, Riverside v1.0.0
;          -INCEPTION
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1-0-0'


  IF keyword_set(MAX) THEN max = max[0] ELSE max = 5 ;default value
  
  chk = 0                                          ;how we got here
  in = ' '                                         ;initalize
  tries = 0                                        ;intialize
  WHILE chk EQ 0 DO BEGIN                          ;so long as keyword not found
     IF tries GE 3 THEN help, xdata, /STRUC        ;give help after so long
     read, in, PROMPT= xtext                       ;prompt for tag
     IF (in EQ 'NA') OR (in EQ 'na') THEN BEGIN    ;if real answer
        chk = 1                                    ;get out of loop
        tagindex = -1                              ;not found
     ENDIF ELSE BEGIN                              ;if not real answer
        chk = tag_exist(xdata, in, INDEX=tagindex) ;find necessary tag
     ENDELSE                                       ;end if not real answer
     tries++                                       ;up counter
  ENDWHILE                                         ;end waiting for keyword


  RETURN, tagindex
END
;========================================================================================================================
