;========================================================================================================================
FUNCTION cdfs44_mask3_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUESS TO 0.0!!!
  
  CASE xwhich OF
     'bcsbs12' :  spectrum = {which:'bcsbs12', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.604', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.599', 'REDSHIFT LT 1.609', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs28' :  spectrum = {which:'bcsbs28', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs51' :  spectrum = {which:'bcsbs51', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16600.0, lau:17200.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.545', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.540', 'REDSHIFT LT 1.550', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bsbs1' :  spectrum = {which:'bsbs1', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:17200.0, lau:17800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.654', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.649', 'REDSHIFT LT 1.659', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bsbs62' :  spectrum = {which:'bsbs62', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16300.0, lau:16900.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.505', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.510', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl11' :  spectrum = {which:'cl11', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.628', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.623', 'REDSHIFT LT 1.633', 'SIG1 GT 2.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'msbs140' :  spectrum = {which:'msbs140', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs144' :  spectrum = {which:'msbs144', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16400.0, lau:17000.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.526', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.520', 'REDSHIFT LT 1.530', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs165' :  spectrum = {which:'msbs165', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:15800.0, lau:16400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.425', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.420', 'REDSHIFT LT 1.430', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs2' :  spectrum = {which:'msbs2', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:17400.0, lau:18000.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.673', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.668', 'REDSHIFT LT 1.678', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'nby8' :  spectrum = {which:'nby8', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs0' :  spectrum = {which:'pzbsbs0', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16200.0, lau:16800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.492', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.487', 'REDSHIFT LT 1.497', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs10' :  spectrum = {which:'pzbsbs10', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17300.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.597', 'sig=3.5', 'c1=0.3', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.592', 'REDSHIFT LT 1.602', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs13' :  spectrum = {which:'pzbsbs13', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15000.0, lau:15500.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.308', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.303', 'REDSHIFT LT 1.313', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs14' :  spectrum = {which:'pzbsbs14', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.593', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.588', 'REDSHIFT LT 1.598', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs4' :  spectrum = {which:'pzbsbs4', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIr', 'SIIb'], $
                              border:2, lal:15600.0, lau:16400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.431', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.10', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.426', 'REDSHIFT LT 1.436', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs6' :  spectrum = {which:'pzbsbs6', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17500.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.624', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.619', 'REDSHIFT LT 1.629', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs7' :  spectrum = {which:'pzbsbs7', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:15800.0, lau:16400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.424', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.419', 'REDSHIFT LT 1.429', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs8' :  spectrum = {which:'pzbsbs8', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16700.0, lau:17300.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.569', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs37' :  spectrum = {which:'pzfsbs37', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17200.0, lau:17800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.657', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.652', 'REDSHIFT LT 1.662', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzfsbs51' :  spectrum = {which:'pzfsbs51', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzfsbs57' :  spectrum = {which:'pzfsbs57', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzfsbs95' :  spectrum = {which:'pzfsbs95', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15300.0, lau:15800.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.389', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.384', 'REDSHIFT LT 1.394', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs13' :  spectrum = {which:'pzmsbs13', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15600.0, lau:16200.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.401', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.396', 'REDSHIFT LT 1.416', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs19' :  spectrum = {which:'pzmsbs19', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs25' :  spectrum = {which:'pzmsbs25', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs26' :  spectrum = {which:'pzmsbs26', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16500.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.611', 'sig=3.5', 'c1=0.5', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs27' :  spectrum = {which:'pzmsbs27', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.611', 'sig=3.5', 'c1=0.25', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs33' :  spectrum = {which:'pzmsbs33', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17500.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.604', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.600', 'REDSHIFT LT 1.610', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs4' :  spectrum = {which:'pzmsbs4', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs6' :  spectrum = {which:'pzmsbs6', basename:'CDFS44_mask3_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     



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
