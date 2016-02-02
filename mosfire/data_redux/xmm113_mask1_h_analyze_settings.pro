;========================================================================================================================
FUNCTION xmm113_mask1_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUSSS TO 0.0!!!
  ;;;Initial guesses listed first take precendence
  
  CASE xwhich OF
     'bsbs46' :  spectrum = {which:'bsbs46', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'cl10' :  spectrum = {which:'cl10', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                           border:2, lal:16700.0, lau:17900.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.63600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.10', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.63100', 'REDSHIFT LT 1.641', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'cl5' :  spectrum = {which:'cl5', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:17150.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                          initgss:['redshift=1.638', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.633', 'REDSHIFT LT 1.643', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl6' :  spectrum = {which:'cl6', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                          initgss:['redshift=1.631', 'sig=3.5', 'c1=1.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'cl8' :  spectrum = {which:'cl8', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                           lal:17000.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.630', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.10', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.635', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
 
     'cl9' :  spectrum = {which:'cl9', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17900.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                          initgss:['redshift=1.632', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'fore1' :  spectrum = {which:'fore1', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'fsbs7' :  spectrum = {which:'fsbs7', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs22' :  spectrum = {which:'msbs22', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16300.0, lau:17000.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.540', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.535', 'REDSHIFT LT 1.545', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'msbs28' :  spectrum = {which:'msbs28', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs341' :  spectrum = {which:'msbs341', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:14700.0, lau:15600.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.302', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.297', 'REDSHIFT LT 1.307', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzbsbs10' :  spectrum = {which:'pzbsbs10', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16500.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.567', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.562', 'REDSHIFT LT 1.572', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzbsbs11' :  spectrum = {which:'pzbsbs11', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17200.0, lau:17500.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.635', 'sig=3.5', 'c1=0.8', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs12' :  spectrum = {which:'pzbsbs12', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.632', 'sig=3.5', 'c1=0.75', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzbsbs13' :  spectrum = {which:'pzbsbs13', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17400.0, lau:18000.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.705', 'sig=3.5', 'c1=0.3', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.710', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs14' :  spectrum = {which:'pzbsbs14', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.585', 'sig=3.5', 'c1=0.75', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.580', 'REDSHIFT LT 1.590', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs15' :  spectrum = {which:'pzbsbs15', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17200.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.635', 'sig=3.5', 'c1=0.6', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'SIG1 LT 30.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzbsbs16' :  spectrum = {which:'pzbsbs16', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17100.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.5685', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzbsbs18' :  spectrum = {which:'pzbsbs18', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17350.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.586', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.581', 'REDSHIFT LT 1.591', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzbsbs2' :  spectrum = {which:'pzbsbs2', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                              lal:16000.0, lau:16900.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.466', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.10', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.461', 'REDSHIFT LT 1.471', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
 
     'pzbsbs4' :  spectrum = {which:'pzbsbs4', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16400.0, lau:16800.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.521', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.516', 'REDSHIFT LT 1.526', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzbsbs6' :  spectrum = {which:'pzbsbs6', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzbsbs7' :  spectrum = {which:'pzbsbs7', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16700.0, lau:17500.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.568', 'sig=3.5', 'c1=0.5', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.563', 'REDSHIFT LT 1.573', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs8' :  spectrum = {which:'pzbsbs8', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17500.0, lau:18200.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.700', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.705', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs30' :  spectrum = {which:'pzfsbs30', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16400.0, lau:17000.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.539', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.534', 'REDSHIFT LT 1.544', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs100' :  spectrum = {which:'pzmsbs100', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15100.0, lau:15700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.333', 'sig=3.5', 'c1=0.7', 'c2=0.35', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.328', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs28' :  spectrum = {which:'pzmsbs28', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:14900.0, lau:15400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.302', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.297', 'REDSHIFT LT 1.307', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs45' :  spectrum = {which:'pzmsbs45', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15000.0, lau:15600.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.320', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.315', 'REDSHIFT LT 1.325', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs48' :  spectrum = {which:'pzmsbs48', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17400.0, lau:17900.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.710', 'sig=3.5', 'c1=0.3', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.705', 'REDSHIFT LT 1.715', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs50' :  spectrum = {which:'pzmsbs50', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'new1' :  spectrum = {which:'new1', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15900.0, lau:16400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.439', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.434', 'REDSHIFT LT 1.444', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs54' :  spectrum = {which:'pzmsbs54', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs67' :  spectrum = {which:'pzmsbs67', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16600.0, lau:17200.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.569', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs70' :  spectrum = {which:'pzmsbs70', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs83' :  spectrum = {which:'pzmsbs83', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs87' :  spectrum = {which:'pzmsbs87', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15400.0, lau:16000.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.401', 'sig=3.5', 'c1=0.4', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.396', 'REDSHIFT LT 1.406', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs94' :  spectrum = {which:'pzmsbs94', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs95' :  spectrum = {which:'pzmsbs95', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16100.0, lau:16700.0, QFLAG:3, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.484', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.480', 'REDSHIFT LT 1.488', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'scist2' :  spectrum = {which:'scist2', basename:'XMM113_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=0.00001', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 0.0000001', 'REDSHIFT LT 0.005', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}


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
