;========================================================================================================================
FUNCTION struccombine, xdata1, xdata2, $
                       OUTFILE=outfile, $
                       VERBOSE=verbose 


;+
; NAME:
;       STRUCCOMBINE()
;
; PURPOSE:
;       Take two data structures which have 1-to-1 corresponance and
;       combine into a single new structure and return that new structure. 
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
;-
  version = '0.0.1'



  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'struccombine.fits' ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                   ;set new value

  
  ;;;prepare output
  tmp1 = xdata1[0]                                                             ;get sample 
  m1 = n_elements(xdata1.(0))                                                  ;find number of detections
  tmp2 = xdata2[0]                                                             ;get sample
  m2 = n_elements(xdata2.(0))                                                  ;find number of detections
  IF (m1 NE m2) THEN BEGIN                                                     ;sanity check
     print, 'WARNING!! This program will fail!! '                              ;print info
     print, '  The assumption of 1-1 correspondance fails!!'                   ;print info
     stop                                                                      ;stop program
  ENDIF                                                                        ;end sanity check
  combine_structs, tmp1, tmp2, newstruc                                        ;combine samples into new structure
  out = replicate(newstruc, (m1))                                         ;replicate


  ;;;fill output
  tags1 = tag_names(xdata1)                          ;get tag names
  tags2 = tag_names(xdata2)                          ;get tag names
  FOR xx=0, n_elements(tags1)-1, 1 DO BEGIN          ;loop over first structure
     note = strcompress('Missing tag: ' + tags1(xx)) ;find tag in output structure
     tmpind = tagind(out, tags1(xx), NOTE=note)      ;find tag index
     FOR yy=0ULL, m1-1, 1 DO BEGIN                   ;loop over matches in first
        out[yy].(tmpind) = xdata1[yy].(xx)           ;set values in output
     ENDFOR                                          ;end loop over matches in first
  ENDFOR                                             ;end loop over first structure
  FOR xx=0, n_elements(tags2)-1, 1 DO BEGIN          ;loop over second structure
     note = strcompress('Missing tag: ' + tags2(xx)) ;find tag in output structure
     tmpind = tagind(out, tags2(xx), NOTE=note)      ;find tag index
     FOR yy=0ULL, m2-1, 1 DO BEGIN                   ;loop over matches in second
        out[yy].(tmpind) = xdata2[yy].(xx)           ;set values in output
     ENDFOR                                          ;end loop over matches in second
  ENDFOR                                             ;end loop over second structure


  ;;;write out file
  mwrfits, out, outfile, /CREATE ;write file


END
;========================================================================================================================



;========================================================================================================================
PRO call_struccombine


  file1 = 'SpARCS-1616_V2.0.fits'
  data1 = mrdfits(file1, 1, hdr)
  file2 = 'SpARCS-1616_v2.0_zout.fits'
  data2 = mrdfits(file2, 1, hdr)

  new = struccombine(data1, data2)



END
;========================================================================================================================
