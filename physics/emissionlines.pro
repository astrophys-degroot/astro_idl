;========================================================================================================================
function emissionlines, xval, ZZ=zz, VERBOSE=verbose

  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ; set new value

  CASE xval OF
     'OIIb' : wl = 3726.0
     'OIIr' : wl = 3728.8
     'CaK' : wl = 3933.663
     'CaH' : wl = 3968.468
     'Hb' : wl = 4861.3 
     'OIIIb' : wl = 4958.9
     'OIIIr' : wl = 5006.8
     'OI6300' : wl = 6300.3
     'NIIb' : wl = 6548.1
     'Ha' : wl = 6562.81
     'NIIr' : wl = 6583.4
     'SIIb' : wl = 6716.4
     'SIIr' : wl = 6730.8
     'allnames' : wl = ['OIIb', 'OIIr', 'Hb', 'OIIIb', 'OIIIr', 'OI6300', $
                        'NIIb', 'Ha', 'NIIr', 'SIIb', 'SIIr']
     ELSE : BEGIN                                                              ;choice not found
        IF verbose GE 2 THEN BEGIN                                             ;chk VERBOSE
           print, 'WARNING!! Choice of line not found! Please use: '           ;print info
           print, '  Ha, Hb, NIIb, NIIr, OIIb, OIIr, OIIIb, OIIIr, SIIb, SIIr' ;print info
        ENDIF                                                                  ;end chk VERBOSE
        wl = -1                                                                ;null value
     END                                                                       ;end choice not found
  ENDCASE                                                                      ;end check of xval
  
  IF keyword_set(ZZ) THEN wl = wl * (1.0 + zz) ;observed wavelength

  
  RETURN, wl
END
;========================================================================================================================


