;========================================================================================================================
pro lris_makemaskinput, incat, STARS=stars, $
                        ZBRIGHT=zbright, CH1MCH2RED=ch1mch2red, $
                        APRIOR=aprior, BPRIOR=bprior, CPRIOR=cprior, DPRIOR=dprior, $
                        OUTFILE=outfile, REGFILE=regfile, $
                        VERBOSE=verbose
  
  IF keyword_set(ZBRIGHT) THEN zbright = zbright[0] ELSE zbright = 22.5                 ;set new value
  IF keyword_set(CH1MCH2RED) THEN ch1mch2red = ch1mch2red[0] ELSE ch1mch2red = 0.2      ;set new value  
  IF keyword_set(APRIOR) THEN aprior = aprior[0] ELSE aprior = '1000'                   ;set new value
  IF keyword_set(BPRIOR) THEN bprior = bprior[0] ELSE bprior= '800'                     ;set new value
  IF keyword_set(CPRIOR) THEN cprior = cprior[0] ELSE cprior = '70'                     ;set new value
  IF keyword_set(DPRIOR) THEN dprior = dprior[0] ELSE dprior = '100'                    ;set new value
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'lris_maskinput.txt' ;set new value
  IF keyword_set(REGFILE) THEN regfile = regfile[0] ELSE regfile = 'lris_maskinput.reg' ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2                    ;set new value
  
  

  
  cat = mrdfits(incat, 1, hdr)
  help, cat, /STRUC
  cnt = 1
  radec, cat.ra, cat.dec, irah, iram, iras, idech, idecm, idecs
  openw, lun, outfile, /GET_LUN
  openw, lun2, regfile, /GET_LUN

  FOR xx=0, 3, 1 DO BEGIN
     CASE xx OF
        0 : BEGIN
           chk = where((cat.mag_aper3_66 GT 16.0) AND (cat.mag_aper3_66 LT 22.5) AND $
                       (cat.ch1mch2 GT 0.10) AND (cat.ch1mch2 LT 0.30), nchk)
           p = 'a'
           prior = aprior
        END
        1 : BEGIN
           chk = where((cat.mag_aper3_66 GT 22.5) AND (cat.mag_aper3_66 LT 30.0) AND $
                       (cat.ch1mch2 GT 0.10) AND (cat.ch1mch2 LT 0.30), nchk)
           p = 'b'           
           prior = bprior
        END
        2 : BEGIN
           chk = where((cat.mag_aper3_66 GT 16.0) AND (cat.mag_aper3_66 LT 22.5) AND $
                       (cat.ch1mch2 GT -0.10) AND (cat.ch1mch2 LT 0.10), nchk)
           p = 'c'
           prior = cprior
        END
        3 : BEGIN
           chk = where((cat.mag_aper3_66 GT 22.5) AND (cat.mag_aper3_66 LT 30.0) AND $
                       (cat.ch1mch2 GT -0.10) AND (cat.ch1mch2 LT 0.10), nchk)
           p = 'd'
           prior = dprior
        END
        ELSE : print, 'WARNING!! Case not found!!'
     ENDCASE
     
     print, nchk
     IF nchk NE 0 THEN BEGIN
        names = strcompress('obj'+ p +string(indgen(nchk)+cnt), /REMOVE_ALL)
        zmag = string(cat[chk].mag_aper3_66)
        rahms = strcompress(string(irah[chk]) + ':' + string(iram[chk]) + ':' + string(iras[chk]), /REMOVE_ALL)
        dechms = strcompress(string(idech[chk]) + ':' + string(idecm[chk]) + ':' + string(idecs[chk]), /REMOVE_ALL)
        FOR yy=0UL, nchk-1, 1 DO BEGIN
           str = strcompress(names[yy] + ' ' + prior + ' ' + zmag[yy] + ' ' + rahms[yy] + ' ' + dechms[yy])
           printf, lun, str
           printf, lun2, cat[chk[yy]].ra, cat[chk[yy]].dec 
        ENDFOR
     ENDIF
     
  ENDFOR
  
  free_lun, lun, lun2
  
  







END
;========================================================================================================================
