;========================================================================================================================
function whichreg, entry, VERBOSE


;+
; NAME:
;       WHICHREG()
;
; PURPOSE:
;       determines type of region file a particular file is 
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
;       A. DeGroot, 2012 July 20, Univ. Cali, Riverside v1.0.0
;
; NOTES
;       -Still need to include many more variations of region file
;
;-

  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1 ;set new value
  
  if verbose ge 3 then print, entry
  splt = strsplit(entry[0], ' '+','+'('+')'+string(9b), /EXTRACT)
  if verbose ge 3 then print, splt
  chk1 = where(splt EQ 'DS9', nchk1)
  case nchk1 of
     1 : begin
        if verbose GE 2 then print, '  DS9 type reg file...'
        splt = strsplit(entry[3], ' '+','+'('+')'+string(9b), /EXTRACT)
        if verbose ge 3 then print, splt
        if verbose ge 3 then help, splt
        ;chk1 = where(splt EQ 'DS9', nchk1)
        case splt of
           'fk5' : begin
              if verbose ge 2 then print, '  J2000 (fk5) coord sys...' 
              splt = strsplit(entry[4], ' '+','+'('+')'+string(9b), /EXTRACT)
              if verbose ge 3 then help, splt
              if verbose ge 3 then print, splt
              splt2 = strsplit(splt[2], ' '+','+'('+')'+string(9b)+':', /EXTRACT)
              if verbose ge 3 then help, splt2
              if verbose ge 3 then print, splt2
              chk2 = n_elements(splt2)
              case chk2 of
                 3 : begin
                    if verbose ge 2 then print, '  Sexagesimal coord type...' 
                    return, 1
                 end
                 1 : begin
                    if verbose ge 2 then print, '  Degree coord type...' 
                    return, 2
                 end
                 else : begin
                    print, 'Uknown coordiate type!!'
                    return, -1
                 end
              endcase
           end
           else : begin 
              print, 'Unknown coordinate system!!'
              return, -1
           end
        endcase
     end
     0 : begin
        if verbose GE 2 then print, '  XY type reg file...'
     end
     else : begin
        print, 'Something has done horribly wrong'
        return, -1
     end
  endcase

  return, 1
end
;========================================================================================================================

