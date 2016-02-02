;========================================================================================================================
function readds9, file, DIR=dir, VERBOSE=verbose
  

;+
; NAME:
;       READDS9()
;
; PURPOSE:
;
; CALLING SEQUENCE:
;
; INPUTS:
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;
; COMMON BLOCKS:
;
; PROCEDURES USED:
;
; COMMENTS:
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;
; DESIRED UPGRADES
;       -support for all variation of region file
;       -add header to returned structure
;-

  on_error, 1                                                               ;error return
  if n_params() lt 1 then begin                                             ;check number of params passed
     print, ' '                                                             ;space
     print,'SYNTAX: values = readds9(regfile) {, DIR=dir, VERBOSE=verbose}' ;print info
     print, ' '                                                             ;spacer
  endif                                                                     ;end check # params
  
  if keyword_set(DIR) then dir = dir[0] else dir = ' '               ;set value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;set value
  
  
  file = strcompress(dir + file, /REMOVE_ALL)                                ;append directory
  if verbose ge 2 then print, '  Region file we are looking for is: ', file ;print info
  if verbose ge 2 then print, '  Checking for file existance...'             ;print info
  flag = file_test(file)                                                     ;test file
  if flag eq 1 then begin                                                    ;check file test status
     if verbose ge 2 then print, '  File found!'                             ;print info
  endif else begin                                                           ;end successful file check
     if verbose ge 0 then print, 'File not found!! Exiting...'               ;print info
  endelse                                                                    ;end unsuccessful file check

  
  nlines = file_lines(file)      ;find # of lines
  line = ''                      ;initialize
  lines = strarr(nlines)         ;initialize
  openr, lun, file, /GET_LUN     ;open file to read
  for xx=0, nlines-1, 1 do begin ;loop over all lines
     readf, lun, line            ;read first line
     lines[xx] = line            ;store line
  endfor                         ;end loop over lines
  close, lun                     ;close file to read
  free_lun, lun                  ;free memory

  lineval = strsplit(lines[0], /EXTRACT)  ;extract string values
  check = where(lineval EQ 'DS9', ncheck) ;check
  if ncheck ge 1 then ncheck = 1          ;reset value
  
  case ncheck of                                                               ;check file format
     1 : begin                                                                 ;if format is DS9
        if verbose ge 3 then print, '  Standard DS9 format region file...'     ;print info
     end                                                                       ;end if DS9 format
     0 : begin                                                                 ;if format is other
        if verbose ge 3 then begin                                             ;if verbose fits
           print, '   Other format of region file...'                          ;print info
           print, '   Bypassing comment lines...'                              ;print info
        endif                                                                  ;end if verbose fits
        chkpnt = 0                                                             ;check point flag
        xxchkpnt = 0                                                           ;check point counter
        while chkpnt eq 0 do begin                                             ;loop over lines until 
           lineval = strsplit(lines[xxchkpnt], /EXTRACT)                       ;extract line
           check1 = where(lineval eq '#', ncheck1)                             ;check line for comment char
           if ncheck1 NE 0 then xxchkpnt++ else chkpnt = 1                     ;if non-comment found
        endwhile                                                               ;end loop until non-comment line
        lines = lines[xxchkpnt:nlines-1]                                       ;cut out comments
        nlines = n_elements(lines)                                             ;find new number of lines
        lineval = strsplit(lines[0], ':'+'+'+' ', /EXTRACT)                    ;extract line
        case 1 of                                                              ;check line form
           n_elements(lineval) GT 2 : type = 'sexagesimal'                     ;if lots of things
           n_elements(lineval) EQ 2 : begin                                    ;if only two items 
              check2 = where((lineval[0] LT 0.0) OR (lineval[0] GT 360.0) OR $ ;sanity check
                             (lineval[1] LT -90.0) or (lineval[1] GT 90.0))    ;NOT FULLPROOF
              case check2[0] of                                                ;results of sanity check
                 -1 : begin                                                    ;if in degrees
                    if verbose ge 3 then print, '   Data type is degrees...'   ;if all pass then should be
                    values = {ra:23.45, dec:34.56}                             ;initialize structure
                    values = replicate(values, nlines)                         ;replicate structure
                    for xx=0, nlines-1, 1 do begin                             ;loop over remaining lines
                       lineval = strsplit(lines[xx], /EXTRACT)                 ;extract line
                       values[xx].ra = double(lineval[0])                      ;set value
                       values[xx].dec = double(lineval[1])                     ;set value
                    endfor                                                     ;end loop over remaining lines
                 end                                                           ;end if in degrees
                 else : type = 'image'                                         ;last option
              endcase                                                          ;end result of sanity check
           end                                                                 ;end if only two items
           else : begin                                                        ;catch all
              print, 'Something has gone horribly wrong!!'                     ;if only 1 item after split
              print, 'Check region file format!!'                              ;something is wrong
           end                                                                 ;end catch all
        endcase                                                                ;end check line form
        
        

     end                                            ;end if format is other
     else : print, 'Something has gone very wrong!' ;catch all
  endcase                                           ;end check file format

  return, values
end	
;========================================================================================================================
