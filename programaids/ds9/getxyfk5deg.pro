;========================================================================================================================
function getxyfk5deg, lines, entry, VERBOSE
  

;+
; NAME:
;       GETXYFK5DEG()
;
; PURPOSE:
;       Given the data and type of region file, it returns a structure
;       with tags RA, DEC in J2000 (fk5) coordinate system, in degree
;       coordinate type 
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
;       -If a DS9 region file can come with more or less than 4 lines
;       of header then this program needs to be made more flexible
;
;-

  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;set new value

  nlines = n_elements(lines)
  coord = {RA:0.000, DEC:0.000}
  coords = replicate(coord, (nlines-4))
  
  case entry of 
     1 : begin
        if verbose ge 2 THEN print, '  We have DS9 region, in FK5 coord system, and sexagesimal coord type...'
        rah = fltarr(nlines)
        ram = fltarr(nlines)
        ras = fltarr(nlines)
        dech = fltarr(nlines)
        decm = fltarr(nlines)
        decs = fltarr(nlines)
        for xx=4, nlines-1 do begin
           test = strsplit(lines[xx], ' '+','+'('+')'+':'+string(9b), /EXTRACT)
           rah[xx-4] = float(test[1])
           ram[xx-4] = float(test[2])
           ras[xx-4] = float(test[3])
           dech[xx-4] = float(test[4])
           decm[xx-4] = float(test[5])
           decs[xx-4] = float(test[6])
        endfor
      
     end
     2 : begin                                                                       ;one case
        if verbose ge 2 THEN begin                                                   ;check VERBOSE keyword
           print, '  We have DS9 region, in FK5 coord system, and Deg coord type...' ;print info
           print, '  No conversion required! Pulling out coordiates'                 ;print info
        endif                                                                        ;end check VERBOSE
        for xx=4, nlines-1 do begin                                                  ;loop over array
           test = strsplit(lines[xx], ' '+','+'('+')'+':'+string(9b), /EXTRACT)      ;extract info
           coords[xx-4].ra = double(test[1])                                         ;get RA
           coords[xx-4].dec = double(test[2])                                        ;get DEC
        endfor                                                                       ;end loop over array
     end                                                                             ;end one case
     else : begin                                                                    ;fail safe
        print, 'Conversion not yet supported!!'                                      ;print info
        return, -1                                                                   ;return null
     end                                                                             ;end fail safe
  endcase                                                                            ;end check case
  

  return, coords
end
;========================================================================================================================

