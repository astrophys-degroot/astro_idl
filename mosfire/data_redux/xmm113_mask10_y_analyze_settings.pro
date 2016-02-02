;========================================================================================================================
FUNCTION xmm113_mask10_y_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'pzhiuqhs4' :  spectrum = {which:'pzhiuqhs4', basename:'J0224_mask10_v1-3_Y', fitto:['OIIb','OIIr'], $
                                border:2, lal:9000.0, lau:11500.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, YERR:0, $
                                initgss:['redshift=1.63600', 'sig=1.5', 'c1=0.5', 'c2=0.5', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.635', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.4', 'C2 GT 0.4'], NEWVER:'v1-2'}

     ELSE : BEGIN
        print, 'WARNING!! Choice not found'
        stop
     END 
  ENDCASE
  
  chk = where(spectrum.which EQ xwhich)
  IF chk NE -1 THEN values = spectrum[chk] ELSE BEGIN
     print, 'This detection tag not found: ', xwhich
     print, ' Skipping....'
     values = {which:'-1'}
  ENDELSE
  
  RETURN, values
END
;========================================================================================================================


