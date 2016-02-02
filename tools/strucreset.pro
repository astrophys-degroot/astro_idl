;========================================================================================================================
FUNCTION strucreset, xstruc, NULLVAL=nullval


;+
; NAME:
;       STRUCRESET()
;
; PURPOSE:
;       Take a structure and reset all entries to some nominal null value.     
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
;       A. DeGroot, 2015 FEB 15, Univ. Cali, Riverside v1.0.0
;          -inception
;
;
; DESIRED UPGRADES
;     
;      -need to finish including all data types
;
;-
  version = '1.0.0'


  ;;;set default value
  IF keyword_set(NULLVAL) THEN nullval = nullval[0] ELSE nullval = -99.0 ;set default

  
  ;;;Do the reset
  FOR xx=0, n_elements(tag_names(xstruc))-1, 1 DO BEGIN
     tmp = xstruc.(xx)
     CASE typename(tmp) OF
        'INT' : xstruc.(xx) = fix(nullval)
        'UINT' : xstruc.(xx) = uint(nullval)
        'LONG' : xstruc.(xx) = long(nullval)
        'ULONG' : xstruc.(xx) = ulong(nullval)
        'LONG64' : xstruc.(xx) = long64(nullval)
        'ULONG64' : xstruc.(xx) = ulong64(nullval)
        'FLOAT' : xstruc.(xx) = float(nullval)
        'STRING' : xstruc.(xx) = strcompress(string(nullval), /REMOVE_ALL)
        'DOUBLE' : xstruc.(xx) = double(nullval)
        ELSE : print, '####Unknown data type!!!', typename(tmp)
     ENDCASE
  ENDFOR


  RETURN, xstruc
END
;========================================================================================================================


;========================================================================================================================
PRO call_strucreset 



  file = 'J1049_specz_photoz_eazy_v2-1.fits'
  data = mrdfits(file, 1, hdr)

  data = strucreset(data, NULLVAL=-99.0)

  mwrfits, data, 'J1049_specz_photoz_eazy_v2-2.fits', hdr, /CREATE



END
;========================================================================================================================

