;========================================================================================================================
FUNCTION VERSIONCONTROL, name, MAJOR=major, MINOR=minor, MICRO=micro 


;+
; NAME:
;       VERSIONCONTROL()
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
;     -add option for additional delimiters
;     -handling all the various off cases
;     -what do i do if there is another v in the file name???
;
;
;-
  version = '1-0-0'

  
  ;;;identify the update
  update = [0,0,0]                         ;which version index to update
  IF keyword_set(MAJOR) THEN update[0] = 1 ;set value
  IF keyword_set(MINOR) THEN update[1] = 1 ;set value
  IF keyword_set(MICRO) THEN update[2] = 1 ;set value


  ;;;handle the extension
  chkdot = strsplit(name, '.', /EXTRACT)
  CASE n_elements(chkdot) OF
     0 : BEGIN
        print, ' WARNING!! Something has gone horribly wrong!!'
     END
     1 : BEGIN
        print, ' Your file name has no extension?!?!'
     END
     2 : BEGIN
        print, ' Fantastic, you have exactly one period in your filename'
        suffix = chkdot[-1]
        remains = chkdot[0]
     END
     ELSE : BEGIN
        print, ' Why??? Why do you have more than one period in your filename'
        print, '   You better not be using periods as a delimiter :|'
        stop
     ENDELSE   
  ENDCASE 


  ;;;find if a current version system is in place
  exists = [0,0,0,0]
  try = 0
  found = 0
  WHILE (found EQ 0) DO BEGIN
     CASE try OF
        0 : BEGIN
           search = ['*v*-*-*', '*v*_*_*', '*v*-*_*', '*v*-*_*']
           match = intarr(n_elements(search))
           FOR yy=0, n_elements(search)-1, 1 DO BEGIN
              match[yy] = strmatch(name, search[yy], /FOLD_CASE)
           ENDFOR
           chk= where(match EQ 1)
           IF (chk[0] NE -1) THEN BEGIN
              exists[try] = 1
              found = 1
              templatefind = search[chk[0]]
           ENDIF
        END
        1 : BEGIN
           search1 = '*v*-*'
           search2 = '*v*_*'
           match1 = strmatch(name, search1)
           match2 = strmatch(name, search2)
           IF (match1 EQ 1) OR (match2 EQ 2) THEN BEGIN
              exists[try] = 1
              found = 1
           ENDIF
        END
        2 : BEGIN
           search1 = '*v*'
           match1 = strmatch(name, search1)
           IF (match1 EQ 1) THEN BEGIN
              exists[try] = 1
              found = 1
           ENDIF
        END
        3 : BEGIN
           print, 'WARNING!! No version found in place!!'
           exists[try] = 1
           found = 1
        END
        ELSE : BEGIN
           print, 'WARNING!! Something has gone very wrong!!'
           found = 99
        END
     ENDCASE
     try = try + 1
     
  ENDWHILE


  ;;;determine current version
  print, stregex(name, 'v', /EXTRACT)

  ;;;update appropriately
  ;print, name
  ;print, templatefind
  ;print, update
  ;print, exists
  
  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
PRO call_versioncontrol

  
  new = versioncontrol('hey_v3-2-1.fits', /MAJOR)


END
;========================================================================================================================
