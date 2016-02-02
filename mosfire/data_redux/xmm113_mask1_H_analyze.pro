;========================================================================================================================
function xmm113_mask1_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;Guesses listed first take precendence
  
  CASE xwhich OF
     'bsbs46' :  spectrum = {which:'bsbs46', dfile:'XMM113_mask1_1.0_H_bsbs46_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl10' :  spectrum = {which:'cl10', dfile:'XMM113_mask1_1.0_H_cl10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                           lal:16700.0, lau:17900.0, QFLAG:1, NOFITSKY:0, $
                           guess:['redshift=1.63600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.10', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.63100', 'REDSHIFT LT 1.641', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'cl5' :  spectrum = {which:'cl5', dfile:'XMM113_mask1_1.0_H_cl5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:17150.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                          guess:['redshift=1.638', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.633', 'REDSHIFT LT 1.643', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'cl6' :  spectrum = {which:'cl6', dfile:'XMM113_mask1_1.0_H_cl6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                          guess:['redshift=1.631', 'sig=3.5', 'c1=1.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl8' :  spectrum = {which:'cl8', dfile:'XMM113_mask1_1.0_H_cl8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                           lal:16700.0, lau:17800.0, QFLAG:0, NOFITSKY:0, $
                           guess:['redshift=1.630', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.10', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.635', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'cl9' :  spectrum = {which:'cl9', dfile:'XMM113_mask1_1.0_H_cl9_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17900.0, QFLAG:1, NOFITSKY:0, $
                          guess:['redshift=1.632', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fore1' :  spectrum = {which:'fore1', dfile:'XMM113_mask1_1.0_H_fore1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17400.0, QFLAG:99, NOFITSKY:0, $
                            guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbs7' :  spectrum = {which:'fsbs7', dfile:'XMM113_mask1_1.0_H_fsbs7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbs22' :  spectrum = {which:'msbs22', dfile:'XMM113_mask1_1.0_H_msbs22_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16300.0, lau:17000.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.540', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.535', 'REDSHIFT LT 1.545', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs28' :  spectrum = {which:'msbs28', dfile:'XMM113_mask1_1.0_H_msbs28_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbs341' :  spectrum = {which:'msbs341', dfile:'XMM113_mask1_1.0_H_msbs341_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:14700.0, lau:15600.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.302', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.297', 'REDSHIFT LT 1.307', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs10' :  spectrum = {which:'pzbsbs10', dfile:'XMM113_mask1_1.0_H_pzbsbs10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.567', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.562', 'REDSHIFT LT 1.572', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs11' :  spectrum = {which:'pzbsbs11', dfile:'XMM113_mask1_1.0_H_pzbsbs11_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17500.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.635', 'sig=3.5', 'c1=0.8', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzbsbs12' :  spectrum = {which:'pzbsbs12', dfile:'XMM113_mask1_1.0_H_pzbsbs12_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.632', 'sig=3.5', 'c1=0.75', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs13' :  spectrum = {which:'pzbsbs13', dfile:'XMM113_mask1_1.0_H_pzbsbs13_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:18000.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.705', 'sig=3.5', 'c1=0.3', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.710', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzbsbs14' :  spectrum = {which:'pzbsbs14', dfile:'XMM113_mask1_1.0_H_pzbsbs14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.585', 'sig=3.5', 'c1=0.75', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.580', 'REDSHIFT LT 1.590', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzbsbs15' :  spectrum = {which:'pzbsbs15', dfile:'XMM113_mask1_1.0_H_pzbsbs15_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.635', 'sig=3.5', 'c1=0.6', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'SIG1 LT 20.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs16' :  spectrum = {which:'pzbsbs16', dfile:'XMM113_mask1_1.0_H_pzbsbs16_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.5685', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'SIG1 LT 5.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs18' :  spectrum = {which:'pzbsbs18', dfile:'XMM113_mask1_1.0_H_pzbsbs18_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17350.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.586', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.581', 'REDSHIFT LT 1.591', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs2' :  spectrum = {which:'pzbsbs2', dfile:'XMM113_mask1_1.0_H_pzbsbs2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                              lal:16000.0, lau:16900.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.466', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.10', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.461', 'REDSHIFT LT 1.471', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzbsbs4' :  spectrum = {which:'pzbsbs4', dfile:'XMM113_mask1_1.0_H_pzbsbs4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16400.0, lau:16800.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.521', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.516', 'REDSHIFT LT 1.526', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs6' :  spectrum = {which:'pzbsbs6', dfile:'XMM113_mask1_1.0_H_pzbsbs6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs7' :  spectrum = {which:'pzbsbs7', dfile:'XMM113_mask1_1.0_H_pzbsbs7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16700.0, lau:17500.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.568', 'sig=3.5', 'c1=0.5', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.563', 'REDSHIFT LT 1.573', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzbsbs8' :  spectrum = {which:'pzbsbs8', dfile:'XMM113_mask1_1.0_H_pzbsbs8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17500.0, lau:18200.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.700', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.705', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzfsbs30' :  spectrum = {which:'pzfsbs30', dfile:'XMM113_mask1_1.0_H_pzfsbs30_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16400.0, lau:17000.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.539', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.534', 'REDSHIFT LT 1.544', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs100' :  spectrum = {which:'pzmsbs100', dfile:'XMM113_mask1_1.0_H_pzmsbs100_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15100.0, lau:15700.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.333', 'sig=3.5', 'c1=0.7', 'c2=0.35', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.328', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs28' :  spectrum = {which:'pzmsbs28', dfile:'XMM113_mask1_1.0_H_pzmsbs28_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:14900.0, lau:15400.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.302', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.297', 'REDSHIFT LT 1.307', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs45' :  spectrum = {which:'pzmsbs45', dfile:'XMM113_mask1_1.0_H_pzmsbs45_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15000.0, lau:15600.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.320', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.315', 'REDSHIFT LT 1.325', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs48' :  spectrum = {which:'pzmsbs48', dfile:'XMM113_mask1_1.0_H_pzmsbs48_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:17900.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.710', 'sig=3.5', 'c1=0.3', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.705', 'REDSHIFT LT 1.715', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs50' :  spectrum = {which:'pzmsbs50', dfile:'XMM113_mask1_1.0_H_pzmsbs50_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'new1' :  spectrum = {which:'new1', dfile:'XMM113_mask1_1.0_H_new1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15900.0, lau:16400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.439', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.434', 'REDSHIFT LT 1.444', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs54' :  spectrum = {which:'pzmsbs54', dfile:'XMM113_mask1_1.0_H_pzmsbs54_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs67' :  spectrum = {which:'pzmsbs67', dfile:'XMM113_mask1_1.0_H_pzmsbs67_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16600.0, lau:17200.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.569', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs70' :  spectrum = {which:'pzmsbs70', dfile:'XMM113_mask1_1.0_H_pzmsbs70_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs83' :  spectrum = {which:'pzmsbs83', dfile:'XMM113_mask1_1.0_H_pzmsbs83_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs87' :  spectrum = {which:'pzmsbs87', dfile:'XMM113_mask1_1.0_H_pzmsbs87_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15600.0, lau:16000.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.401', 'sig=3.5', 'c1=0.4', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.396', 'REDSHIFT LT 1.406', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs94' :  spectrum = {which:'pzmsbs94', dfile:'XMM113_mask1_1.0_H_pzmsbs94_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs95' :  spectrum = {which:'pzmsbs95', dfile:'XMM113_mask1_1.0_H_pzmsbs95_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.484', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.480', 'REDSHIFT LT 1.488', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'scist2' :  spectrum = {which:'scist2', dfile:'XMM113_mask1_1.0_H_scist2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:99, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}


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



;========================================================================================================================
pro xmm113_mask1_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = xmm113_mask1_H_analyze_settings(which[zz])                                  ;get settings
     IF values.which NE '-1' THEN BEGIN                                                   ;check settings were found
        IF tag_exist(values, 'priors') EQ 1 THEN priors = values.priors ELSE priors = 0   ;if optional parameters given
        IF tag_exist(values, 'xwhich') EQ 1 THEN xwhich = values.xwhich ELSE xwhich = 0   ;check if tag exists
        mosfire_1dspec_analyze, values.dfile, values.which, XWHICH=xwhich, PYERR=pyerr, $ ;call routine
                                FITTO=values.fitto, BORDER=values.border, $
                                LLOWER=values.lal, LUPPER=values.lau, $
                                NOFITSKY=values.nofitsky, CHKVALS=values.guess, $
                                PRIORS=priors, DRYRUN=dryrun, QFLAG=values.qflag, $
                                OPENPLOT=openplot, OPENFITS=values.openfits, INDIR=indir, OUTDIR=outdir
     ENDIF
  ENDFOR                        ;end loop over which elements
  
END	
;========================================================================================================================
  


