;========================================================================================================================
function xmm113_mask6_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUESS TO 0.0!!!
  ;;;Initial guesses listed first take precendence
  
  CASE xwhich OF

     'cl11' :  spectrum = {which:'cl11', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                           border:2, lal:17000.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.628', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001'], $
                           priors:['REDSHIFT GT 1.623', 'REDSHIFT LT 1.633', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'cl1' :  spectrum = {which:'cl1', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:17000.0, lau:17650.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                          initgss:['redshift=1.635', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.8', 'x1=-0.001' ], $
                          priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl3' :  spectrum = {which:'cl3', basename:'XMM113_mask6_H', fitto:['OIIIr','OIIIb', 'Hb'], $
                          border:2, lal:14500.0, lau:15400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                          initgss:['redshift=2.046', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 2.041', 'REDSHIFT LT 2.051', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs17' :  spectrum = {which:'msbs17', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs310' :  spectrum = {which:'msbs310', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                              border:2, lal:14800.0, lau:15700.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.288', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.283', 'REDSHIFT LT 1.293', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs320' :  spectrum = {which:'msbs320', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs335' :  spectrum = {which:'msbs335', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16400.0, lau:17000.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.533', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.528', 'REDSHIFT LT 1.538', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'nby0' :  spectrum = {which:'nby0', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16600.0, lau:17000.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.563', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.558', 'REDSHIFT LT 1.568', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'new3' :  spectrum = {which:'new3', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd14' :  spectrum = {which:'pzadd14', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16700.0, lau:17300.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.587', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.582', 'REDSHIFT LT 1.592', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd18' :  spectrum = {which:'pzadd18', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                              border:2, lal:16200.0, lau:17000.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.520', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.515', 'REDSHIFT LT 1.525', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd23' :  spectrum = {which:'pzadd23', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                              border:2, lal:16600.0, lau:17200.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.556', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.551', 'REDSHIFT LT 1.561', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd34' :  spectrum = {which:'pzadd34', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd72' :  spectrum = {which:'pzadd72', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                              border:2, lal:16700.0, lau:17500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd77' :  spectrum = {which:'pzadd77', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                              border:2, lal:17000.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.611', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd7' :  spectrum = {which:'pzadd7', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd86' :  spectrum = {which:'pzadd86', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                              border:2, lal:16900.0, lau:17700.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.611', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd8' :  spectrum = {which:'pzadd8', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.613', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.610', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd90' :  spectrum = {which:'pzadd90', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs1' :  spectrum = {which:'pzbsbs1', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.613', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.610', 'REDSHIFT LT 1.61600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs3' :  spectrum = {which:'pzbsbs3', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:14500.0, lau:15100.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.237', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.232', 'REDSHIFT LT 1.242', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs26' :  spectrum = {which:'pzfsbs26', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:16600.0, lau:17200.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.555', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.550', 'REDSHIFT LT 1.560', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs5' :  spectrum = {which:'pzfsbs5', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], $
                              border:2, lal:16600.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzj4745' :  spectrum = {which:'pzj4745', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16600.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.571', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs101' :  spectrum = {which:'pzmsbs101', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $ 
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.611', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs88' :  spectrum = {which:'pzmsbs88', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.633', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.628', 'REDSHIFT LT 1.638', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs8' :  spectrum = {which:'pzmsbs8', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                              border:2, lal:15200.0, lau:16000.0, QFLAG:0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.330', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.325', 'REDSHIFT LT 1.335', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs97' :  spectrum = {which:'pzmsbs97', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.635', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'st30' :  spectrum = {which:'st30', basename:'XMM113_mask6_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=0.001', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 0.000001', 'REDSHIFT LT 0.05', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
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
