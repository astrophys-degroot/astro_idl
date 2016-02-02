;========================================================================================================================
FUNCTION polish_addcolor, xdata, tagf1, tagf2, tagcout, $
                          ZPF1=zpf1, ZPF2=zpf2, MAGNULL=magnull, $
                          M1OUT=m1out, M2OUT=m2out, COUT=cout, $
                          TAGEF1=tagef1, TAGEF2=tagef2, $
                          EM1OUT=em1out, EM2OUT=em2out, ECOUT=ecout, EMAGNULL=emagnull


;+
; NAME:
;       POLISH_ADDCOLOR()
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
;     
;
;-
  version = '1-0-0'


  ;;;default values
  IF keyword_set(ZPF1) THEN zpf1 = zpf1[0] ELSE zpf1 = 23.9                  ;default, assumes [uJy]
  IF keyword_set(ZPF2) THEN zpf2 = zpf2[0] ELSE zpf2 = 23.9                  ;default, assumes [uJy]
  IF keyword_set(MAGNULL) THEN magnull = magnull[0] ELSE magnull = -99.0     ;default value 
  IF keyword_set(M1OUT) THEN m1out = m1out[0] ELSE m1out = 'NULL'            ;default value 
  IF keyword_set(M2OUT) THEN m2out = m2out[0] ELSE m2out = 'NULL'            ;default value 
  IF keyword_set(COUT) THEN cout = cout[0] ELSE cout = 'COLOR'               ;default value 
  IF keyword_set(EMAGNULL) THEN emagnull = emagnull[0] ELSE emagnull = -99.0 ;default value 
  IF keyword_set(EM1OUT) THEN em1out = em1out[0] ELSE em1out = 'NULL'        ;default value 
  IF keyword_set(EM2OUT) THEN em2out = em2out[0] ELSE em2out = 'NULL'        ;default value 
  IF keyword_set(ECOUT) THEN ecout = ecout[0] ELSE cout = 'COLOR'            ;default value 
  

  ;;;deal with flux tags
  chk = tag_exist(xdata, tagf1, INDEX=f1ind)                         ;find necessary tag
  text = '   This calculation requires a first flux keyword: '       ;text to pass
  IF chk EQ 0 THEN f1ind = tagprompt(xdata, text)                    ;find necessary tag


  chk = tag_exist(xdata, tagf2, INDEX=f2ind)                         ;find necessary tag
  text = '   This calculation requires a second flux keyword: '      ;text to pass
  IF chk EQ 0 THEN f2ind = tagprompt(xdata, text)                    ;find necessary tag
  chk = tag_exist(xdata, cout, INDEX=coutind)                        ;find necessary tag
  text = '   The provided color tag already exists: '                ;text to pass
  IF chk EQ 1 THEN read, in, PROMPT= xtext                           ;get another attempt
  chk = tag_exist(xdata, xtext, INDEX=coutind)                       ;find necessary tag
  chk = tag_exist(xdata, tagef1, INDEX=ef1ind)                       ;find necessary tag
  text = '   This calculation options a first flux error keyword: '  ;text to pass
  IF chk EQ 0 THEN ef1ind = tagprompt(xdata, text)                   ;find necessary tag
  chk = tag_exist(xdata, tagef2, INDEX=ef2ind)                       ;find necessary tag
  text = '   This calculation options a second flux error keyword: ' ;text to pass
  IF chk EQ 0 THEN ef2ind = tagprompt(xdata, text)                   ;find necessary tag
  chk = tag_exist(xdata, ecout, INDEX=ecoutind)                      ;find necessary tag
  text = '   The provided error color tag already exists: '          ;text to pass
  IF chk EQ 1 THEN read, in, PROMPT= xtext                           ;get another attempt
  chk = tag_exist(xdata, xtext, INDEX=ecoutind)                      ;find necessary tag


  ;;;find and perhaps add magnitudes, error values to structure
  IF m1out NE 'NULL' THEN BEGIN                    ;if out tag given
     chk = tag_exist(xdata, m1out, INDEX=m1ind)    ;find if tag already exists
     IF (chk EQ 0) THEN BEGIN                      ;if tag not already present
        mag1 = -2.5*alog10(xdata.(f1ind)) + zpf1   ;convert to magnitudes
        chk = where(mag1 NE mag1)                  ;find and NaNs, INFs
        IF chk[0] NE -1 THEN mag1[chk] = magnull   ;set any to null value
        add_tag, xdata, m1out, 0.0, tmpstruct      ;add tag to structure
        xdata = tmpstruct                          ;copy new structur
        chk = tag_exist(xdata, m1out, INDEX=m1ind) ;find necessary tag
        xdata.(m1ind) = mag1                       ;store values
     ENDIF ELSE mag1 = xdata.(m1ind)               ;or if tag already present
  ENDIF ELSE BEGIN                                 ;end if out tag not given
     mag1 = -2.5*alog10(xdata.(f1ind)) + zpf1      ;convert to magnitudes
     chk = where(mag1 NE mag1)                     ;find and NaNs, INFs
     IF chk[0] NE -1 THEN mag1[chk] = magnull      ;set any to null value
  ENDELSE                                          ;end if out tag not given

  IF em1out NE 'NULL' THEN BEGIN                                                     ;if out tag given
     chk = tag_exist(xdata, em1out, INDEX=em1ind)                                    ;find if tag already exists
     IF (chk EQ 0) THEN BEGIN                                                        ;if tag not already present
        emag1 = 2.5*alog10(xdata.(f1ind)+xdata.(ef1ind)) - 2.5*alog10(xdata.(f1ind)) ;find first error
        chk = where(emag1 NE emag1)                                                  ;find NaNs, INFs
        IF chk[0] NE -1 THEN emag1[chk] = emagnull                                   ;set any to null
        add_tag, xdata, em1out, 0.0, tmpstruct                                       ;add tag to structure
        xdata = tmpstruct                                                            ;copy new structur
        chk = tag_exist(xdata, em1out, INDEX=em1ind)                                 ;find necessary tag
        xdata.(em1ind) = emag1                                                       ;store values
     ENDIF ELSE emag1 = xdata.(em1ind)                                               ;or if tag already present
  ENDIF ELSE BEGIN                                                                   ;end if out tag not given
     emag1 = 2.5*alog10(xdata.(f1ind)+xdata.(ef1ind)) - 2.5*alog10(xdata.(f1ind))    ;find first error
     chk = where(emag1 NE emag1)                                                     ;find NaNs, INFs
     IF chk[0] NE -1 THEN emag1[chk] = emagnull                                      ;set any to null
  ENDELSE                                                                            ;end if out tag not given

  IF m2out NE 'NULL' THEN BEGIN                    ;if out tag given
     chk = tag_exist(xdata, m2out, INDEX=m2ind)    ;find if tag already exists
     IF (chk EQ 0) THEN BEGIN                      ;if tag not already present
        mag2 = -2.5*alog10(xdata.(f2ind)) + zpf2   ;convert to magnitudes
        chk = where(mag2 NE mag2)                  ;find and NaNs, INFs
        IF chk[0] NE -1 THEN mag2[chk] = magnull   ;set any to null value
        add_tag, xdata, m2out, 0.0, tmpstruct      ;add tag to structure
        xdata = tmpstruct                          ;copy new structur
        chk = tag_exist(xdata, m2out, INDEX=m2ind) ;find necessary tag
        xdata.(m2ind) = mag2                       ;store values
     ENDIF ELSE mag2 = xdata.(m2ind)               ;or if tag already present
  ENDIF ELSE BEGIN                                 ;end if out tag not given
     mag2 = -2.5*alog20(xdata.(f2ind)) + zpf2      ;convert to magnitudes
     chk = where(mag2 NE mag2)                     ;find and NaNs, INFs
     IF chk[0] NE -1 THEN mag2[chk] = magnull      ;set any to null value
  ENDELSE                                          ;end if out tag not given


 IF em2out NE 'NULL' THEN BEGIN                                                     ;if out tag given
     chk = tag_exist(xdata, em2out, INDEX=em2ind)                                    ;find if tag already exists
     IF (chk EQ 0) THEN BEGIN                                                        ;if tag not already present
        emag2 = 2.5*alog10(xdata.(f2ind)+xdata.(ef2ind)) - 2.5*alog10(xdata.(f2ind)) ;find first error
        chk = where(emag2 NE emag2)                                                  ;find NaNs, INFs
        IF chk[0] NE -1 THEN emag2[chk] = emagnull                                   ;set any to null
        add_tag, xdata, em2out, 0.0, tmpstruct                                       ;add tag to structure
        xdata = tmpstruct                                                            ;copy new structur
        chk = tag_exist(xdata, em2out, INDEX=em2ind)                                 ;find necessary tag
        xdata.(em2ind) = emag2                                                       ;store values
     ENDIF ELSE emag2 = xdata.(em2ind)                                               ;or if tag already present
  ENDIF ELSE BEGIN                                                                   ;end if out tag not given
     emag2 = 2.5*alog10(xdata.(f2ind)+xdata.(ef2ind)) - 2.5*alog10(xdata.(f2ind))    ;find first error
     chk = where(emag2 NE emag2)                                                     ;find NaNs, INFs
     IF chk[0] NE -1 THEN emag2[chk] = emagnull                                      ;set any to null
  ENDELSE                                                                            ;end if out tag not given


  ;;;find and perhaps add color, error values to structure
  color = mag1 - mag2                                               ;find color
  chk = where((color NE color) OR (abs(color-(zpf1-zpf2)) LT 0.01)) ;find NaNs, INFs, color between 2 nulls
  IF chk[0] NE -1 THEN color[chk] = magnull                         ;set any to null
  add_tag, xdata, cout, 0.0, tmpstruct                              ;add tag
  xdata = tmpstruct                                                 ;reclaim structure
  chk = tag_exist(xdata, cout, INDEX=coutind)                       ;find necessary tag
  xdata.(coutind) = color                                           ;store values
  
  ecolor = (emag1^2 + emag2^2)^0.5              ;find color error
  chk = where(ecolor NE ecolor)                 ;find NaNs, INFs
  IF chk[0] NE -1 THEN ecolor[chk] = emagnull   ;set any to null value
  add_tag, xdata, ecout, 0.0, tmpstruct         ;add tag
  xdata = tmpstruct                             ;recapture structure
  chk = tag_exist(xdata, ecout, INDEX=ecoutind) ;find necessary tag
  xdata.(ecoutind) = ecolor                     ;store data


  RETURN, xdata
END
;========================================================================================================================



;========================================================================================================================
PRO call_polish_addcolor

  file = 'cdfs44_v4-1_master.fits'
  data = mrdfits(file, 1, hdr)
  zp = 25.0


  out = polish_addcolor(data, 'zflux', 'irac1flux', 'zmch1', ZPF1=zp, ZPF2=zp, M1OUT='ZMAG', M2OUT='CH1MAG', COUT='ZMCH1', $
                        TAGEF1='ezflux', TAGEF2='eirac1flux', EM1OUT='EZMAG', EM2OUT='ECH1MAG', ECOUT='EZMCH1')
  out = polish_addcolor(data, 'irac1flux', 'irac2flux', 'ch1mch2', ZPF1=zp, ZPF2=zp, M1OUT='CH1MAG', M2OUT='CH2MAG', COUT='CH1MCH2', $
                        TAGEF1='eirac1flux', TAGEF2='eirac2flux', EM1OUT='ECH1MAG', EM2OUT='ECH2MAG', ECOUT='ECH1MCH2')
  help, out, /STRUC

  mwrfits, out, 'cdfs44_v4-2_master.fits', /CREATE



END
;========================================================================================================================
