;========================================================================================================================
FUNCTION read_template_extract, prosdir, PASS=pass 


;+
; NAME:
;       READ_TEMPLATE_EXTRACT()
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
;       A. DeGroot, 2014 Nov 19, Univ. Cali, Riverside v1.1.0
;          -added PASS keyword
;       A. DeGroot, 2014 Nov 19, Univ. Cali, Riverside v1.0.0
;          -Inception
;
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.1'



  IF keyword_set(PASS) THEN BEGIN                         ;if pass 
     RETURN, 'pass'                                       ;return pass
  ENDIF ELSE BEGIN                                        ;actually read in file
     bit = ' '                                            ;initialize
     temp_extr = 'PROSDIR/templates/template_extract.txt' ;template directory
     strreplace, temp_extr, 'PROSDIR', prosdir            ;replace given IDL directory
     temp_extr = strcompress(temp_extr, /REMOVE_ALL)      ;remove whitespace
     linestemp = file_lines(temp_extr)                    ;how many lines in template file
     strtemp = strarr(linestemp)                          ;string array
     openr, lun, temp_extr, /GET_LUN                      ;open file for reading
     FOR xx=0, linestemp-1, 1 DO BEGIN                    ;loop over the lines in file
        readf, lun, bit                                   ;read line
        strtemp[xx] = bit                                 ;store line
     ENDFOR                                               ;end loop over lines in file
     close, lun                                           ;close file unit 
     free_lun, lun                                        ;free file unit
     RETURN, strtemp                                      ;return template
  ENDELSE                                                 ;end actual read in 


END
;========================================================================================================================



;========================================================================================================================
PRO read_template_extract, check
  
  aaaa = check
  
END
;========================================================================================================================
