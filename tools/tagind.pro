;========================================================================================================================
function tagind, xcat, xtag, DATA=data, NOTE=note, PASS=pass, VERBOSE=verbose, HELP=help


;+
; NAME:
;       TAGIND()
;
; PURPOSE:
;       Check a structure for a tag and then either return the index
;       in the structure associated with that tag or the data in the
;       strucutre associated with that tag. If the tag provided is not
;       found a warning is given the program stops.    
;
; CALLING SEQUENCE:
;       value = tagind(catalog, tag, [ /DATA, NOTE='', VERBOSE=, /HELP]) 
;      
; INPUTS:
;       xcat: structure to be searched
;       ytag: tag to search for 
;
; OPTIONAL INPUTS:
;       NONE
;
; KEYWORD PARAMETERS:
;       DATA: if keyword is set program will return data associated
;           with the tag rather than the tag index
;       NOTE: optional output to print to screen if tag is not found 
;       verbose: how much info is printed to screen during run 
;       help: wether or not to output the structure information 
;
; OUTPUTS:
;       Either tag index or data associated with the tag
;
; OPTIONAL OUTPUTS:
;
; COMMON BLOCKS:
;       NONE
;
; PROCEDURES USED:
;       TAG_EXIST: part of NASA IDL ASTRO lib
;
; COMMENTS:
;       Program stop entirely if tag is not found. 
;
; EXAMPLES:
;       To determine if the tag 'RA' is found in the structure 'catalog'
;
;       IDL> tagindex = tagind(catalog, 'RA')
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2015 Feb 20, Univ. Cali, Riverside v1.1.1
;          -Added missing VERBOSE location
;       A. DeGroot, 2015 Feb 20, Univ. Cali, Riverside v1.1.0
;          -Added PASS option
;       A. DeGroot, 2013 Feb 1, Univ. Cali, Riverside v1.0.0
;
;-
  version = '1-1-0'

  IF keyword_set(NOTE) then note = note[0] else note = 'Tag not found!!' ;sets new value
  IF keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2     ;sets new value
  IF keyword_set(HELP) then help, xcat, /STRUC
  
  status = tag_exist(xcat, xtag, INDEX=xtagind, /TOP_LEVEL)       ;check tag
  CASE status OF                                                  ;begin CASE on status
     1 : begin                                                    ;one status value
        CASE keyword_set(DATA) OF                                 ;check DATA keyword
           1 : retval = xcat.(xtagind)                            ;get data values
           0 : retval = xtagind                                   ;give indice
           ELSE : print, '###Something has gone horribly wrong!!' ;print warning
        ENDCASE                                                   ;END check DATA keyword
     END                                                          ;END IF tag found
     0 : BEGIN                                                    ;one status value 
        IF (verbose GE 2) THEN print, note                        ;print info
        IF keyword_set(PASS) THEN retval = -1 ELSE stop           ;stops program or not
     END                                                          ;END CASE status of
  ENDCASE                                                         ;END CASE on status
  
  RETURN, retval                ;return value
END
;========================================================================================================================
