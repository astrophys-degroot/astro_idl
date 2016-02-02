;========================================================================================================================
FUNCTION strucnull, xstruc, NULLVAL=nullval, RESETVAL=resetval


;+
; NAME:
;       STRUCNULL()
;
; PURPOSE:
;       Take a structure with NaN or empty array values and set to a
;       null value.     
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
;       A. DeGroot, 2014 Oct 24, Univ. Cali, Riverside v1.0.0
;          -inception
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.0'



  ;;;set default value
  IF keyword_set(NULLVAL) THEN nullval = nullval[0] ELSE nullval = -99.0 ;set default

  ;print, xstruc[135].mobinslit
  ;help, xstruc[135].mobinslit
  ;stop

  ;;;set nonentries to null values
  tagnames = tag_names(xstruc)                       ;find tag names 
  FOR xx=0, n_elements(tagnames)-1, 1 DO BEGIN       ;loop over tags
     chk = where(xstruc.(xx) NE xstruc.(xx))         ;find nonentries
     IF chk[0] NE -1 THEN xstruc[chk].(xx) = nullval ;set to null val
     ;chk = where(xstruc.(xx) EQ -32768)              ;find nonentries
     ;IF chk[0] NE -1 THEN xstruc[chk].(xx) = nullval ;set to null val
     ;chk = where(xstruc.(xx) EQ '         ')         ;find nonentries
     ;IF chk[0] NE -1 THEN xstruc[chk].(xx) = nullval ;set to null val
     ;chk = where(xstruc.(xx) EQ '        ')         ;find nonentries
     ;IF chk[0] NE -1 THEN xstruc[chk].(xx) = nullval ;set to null val
     ;chk = where(xstruc.(xx) EQ ' ')                 ;find nonentries
     ;IF chk[0] NE -1 THEN xstruc[chk].(xx) = nullval ;set to null val
  ENDFOR                                             ;end loop over tags

  ;;;set entries with resetval to null values
  ;IF keyword_set(RESETVAL) THEN BEGIN                      ;if RESETVAL is provided
  ;   resetval = resetval[0]                                ;sanity 
  ;   tagnames = tag_names(xstruc)                          ;find tag names 
  ;   FOR xx=0, n_elements(tagnames)-1, 1 DO BEGIN          ;loop over tags
  ;      chk1 = size(xstruc.(xx))                           ;find entry size
  ;      dtypeind = chk1[0]+1                               ;find data type index
  ;      dtype = chk1[dtypeind]                             ;find data type
  ;      gooddtype = [1,2,3,4,5,12,13,14,15]                ;number data types
  ;      chk2 = where(dtype EQ gooddtype)                   ;find if compatible data type
  ;      IF dtype EQ 1 THEN resetval = fix(resetval)
  ;      IF chk2[0] NE -1 THEN BEGIN                        ;if compatible
  ;         chk = where(xstruc.(xx) EQ resetval)            ;find nonentries
  ;         IF chk[0] NE -1 THEN xstruc[chk].(xx) = nullval ;set to null val
  ;      ENDIF                                              ;end if compatible
  ;   ENDFOR                                                ;end loop over tags
  ;ENDIF                                                    ;end reset val provided

  RETURN, xstruc
END
;========================================================================================================================


;========================================================================================================================
PRO call_strucnull 



  file = 'SPARCSJ0224_HSTv6_xmm113v3-1-5_v0-1.fits'
  data = mrdfits(file, 1, hdr)

  data = strucnull(data, NULLVAL=-99.0)

  mwrfits, data, 'SPARCSJ0224_HSTv6_xmm113v3-1-5_v0-2.fits', hdr, /CREATE



END
;========================================================================================================================

