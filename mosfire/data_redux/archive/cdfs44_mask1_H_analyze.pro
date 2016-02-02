;========================================================================================================================
function cdfs44_mask1_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'bcsbs109' :  spectrum = {which:'bcsbs109', dfile:'CDFS44_mask1_1.0_H_bcsbs109_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs113' :  spectrum = {which:'bcsbs113', dfile:'CDFS44_mask1_1.0_H_bcsbs113_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17800.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.647', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.642', 'REDSHIFT LT 1.652', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bcsbs37' :  spectrum = {which:'bcsbs37', dfile:'CDFS44_mask1_1.0_H_bcsbs37_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15800.0, lau:16400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.4520', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.440', 'REDSHIFT LT 1.460', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs69' :  spectrum = {which:'bcsbs69', dfile:'CDFS44_mask1_1.0_H_bcsbs69_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15800.0, lau:16400.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.442', 'sig=3.5', 'c1=0.75', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.432', 'REDSHIFT LT 1.452', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs78' :  spectrum = {which:'bcsbs78', dfile:'CDFS44_mask1_1.0_H_bcsbs78_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16200.0, lau:16700.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.477', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.4270', 'REDSHIFT LT 1.527', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bsbs2' :  spectrum = {which:'bsbs2', dfile:'CDFS44_mask1_1.0_H_bsbs2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16700.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                            guess:['redshift=1.57000', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.5650', 'REDSHIFT LT 1.5750', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbs66' :  spectrum = {which:'bsbs66', dfile:'CDFS44_mask1_1.0_H_bsbs66_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:14900.0, lau:15400.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.288', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.238', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl12' :  spectrum = {which:'cl12', dfile:'CDFS44_mask1_1.0_H_cl12_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16400.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                           guess:['redshift=1.6210', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.62600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl1' :  spectrum = {which:'cl1', dfile:'CDFS44_mask1_1.0_H_cl1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17700.0, QFLAG:2, NOFITSKY:0, $
                          guess:['redshift=1.6290', 'sig=3.5', 'c1=0.5', 'c2=0.35', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.6240', 'REDSHIFT LT 1.6340', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl3' :  spectrum = {which:'cl3', dfile:'CDFS44_mask1_1.0_H_cl3_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], border:2, $
                          lal:17000.0, lau:17700.0, QFLAG:2, NOFITSKY:0, $
                          guess:['redshift=1.626', 'sig=2.5', 'c1=0.75', 'c2=0.4', 'c4=0.2', 'c5=0.2', 'x0=0.4', 'x1=-0.0005' ], $
                          priors:['REDSHIFT GT 1.621', 'REDSHIFT LT 1.631', 'SIG1 LT 3.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'cl4' :  spectrum = {which:'cl4', dfile:'CDFS44_mask1_1.0_H_cl4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                          guess:['redshift=1.62100', 'sig=3.5', 'c1=0.75', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.62600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'cl5' :  spectrum = {which:'cl5', dfile:'CDFS44_mask1_1.0_H_cl5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17400.0, QFLAG:0, NOFITSKY:0, $
                          guess:['redshift=1.62700', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.6170', 'REDSHIFT LT 1.6270', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl6' :  spectrum = {which:'cl6', dfile:'CDFS44_mask1_1.0_H_cl6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17400.0, QFLAG:0, NOFITSKY:0, $
                          guess:['redshift=1.60600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.60100', 'REDSHIFT LT 1.61100', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl7' :  spectrum = {which:'cl7', dfile:'CDFS44_mask1_1.0_H_cl7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                          guess:['redshift=1.6320', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.6270', 'REDSHIFT LT 1.63700', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl8' :  spectrum = {which:'cl8', dfile:'CDFS44_mask1_1.0_H_cl8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:15200.0, lau:15700.0, QFLAG:1, NOFITSKY:0, $
                          guess:['redshift=1.347', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.342', 'REDSHIFT LT 1.352', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'cl9' :  spectrum = {which:'cl9', dfile:'CDFS44_mask1_1.0_H_cl9_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16800.0, lau:17300.0, QFLAG:3, NOFITSKY:0, $
                          guess:['redshift=1.59400', 'sig=3.5', 'c1=0.40', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.589', 'REDSHIFT LT 1.599', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs3' :  spectrum = {which:'msbs3', dfile:'CDFS44_mask1_1.0_H_msbs3_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16100.0, lau:16900.0, QFLAG:3, NOFITSKY:0, $
                            guess:['redshift=1.517', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.512', 'REDSHIFT LT 1.522', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'nby6' :  spectrum = {which:'nby6', dfile:'CDFS44_mask1_1.0_H_nby6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                           lal:15900.0, lau:16600.0, QFLAG:0, NOFITSKY:0, $
                           guess:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzbsbs25' :  spectrum = {which:'pzbsbs25', dfile:'CDFS44_mask1_1.0_H_pzbsbs25_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                               lal:15900.0, lau:16600.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'pzbsbs30' :  spectrum = {which:'pzbsbs30', dfile:'CDFS44_mask1_1.0_H_pzbsbs30_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                               lal:15900.0, lau:16600.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.459', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.454', 'REDSHIFT LT 1.464', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'pzbsbs31' :  spectrum = {which:'pzbsbs31', dfile:'CDFS44_mask1_1.0_H_pzbsbs31_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17900.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.635', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzfsbs115' :  spectrum = {which:'pzfsbs115', dfile:'CDFS44_mask1_1.0_H_pzfsbs115_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16100.0, lau:16700.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.488', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.483', 'REDSHIFT LT 1.493', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs134' :  spectrum = {which:'pzfsbs134', dfile:'CDFS44_mask1_1.0_H_pzfsbs134_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16500.0, lau:17100.0, QFLAG:1, NOFITSKY:0, $
                                guess:['redshift=1.538', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.533', 'REDSHIFT LT 1.543', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs64' :  spectrum = {which:'pzfsbs64', dfile:'CDFS44_mask1_1.0_H_pzfsbs64_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs87' :  spectrum = {which:'pzfsbs87', dfile:'CDFS44_mask1_1.0_H_pzfsbs87_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.60600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.60100', 'REDSHIFT LT 1.61100', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs22' :  spectrum = {which:'pzmsbs22', dfile:'CDFS44_mask1_1.0_H_pzmsbs22_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.619', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.614', 'REDSHIFT LT 1.624', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs23' :  spectrum = {which:'pzmsbs23', dfile:'CDFS44_mask1_1.0_H_pzmsbs23_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.536', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs28' :  spectrum = {which:'pzmsbs28', dfile:'CDFS44_mask1_1.0_H_pzmsbs28_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.534', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs31' :  spectrum = {which:'pzmsbs31', dfile:'CDFS44_mask1_1.0_H_pzmsbs31_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17750.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.661', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.656', 'REDSHIFT LT 1.667', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs34' :  spectrum = {which:'pzmsbs34', dfile:'CDFS44_mask1_1.0_H_pzmsbs34_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16200.0, lau:17000.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.503', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.508', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs38' :  spectrum = {which:'pzmsbs38', dfile:'CDFS44_mask1_1.0_H_pzmsbs38_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.548', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.543', 'REDSHIFT LT 1.553', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs43' :  spectrum = {which:'pzmsbs43', dfile:'CDFS44_mask1_1.0_H_pzmsbs43_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16400.0, lau:17000.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.540', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.535', 'REDSHIFT LT 1.545', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs44' :  spectrum = {which:'pzmsbs44', dfile:'CDFS44_mask1_1.0_H_pzmsbs44_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.488', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.483', 'REDSHIFT LT 1.493', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs46' :  spectrum = {which:'pzmsbs46', dfile:'CDFS44_mask1_1.0_H_pzmsbs46_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.614', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.609', 'REDSHIFT LT 1.619', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs56' :  spectrum = {which:'pzmsbs56', dfile:'CDFS44_mask1_1.0_H_pzmsbs56_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15000.0, lau:15500.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.310', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.305', 'REDSHIFT LT 1.315', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs60' :  spectrum = {which:'pzmsbs60', dfile:'CDFS44_mask1_1.0_H_pzmsbs60_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15400.0, lau:15900.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.380', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.375', 'REDSHIFT LT 1.385', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs70' :  spectrum = {which:'pzmsbs70', dfile:'CDFS44_mask1_1.0_H_pzmsbs70_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.479', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.474', 'REDSHIFT LT 1.484', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs72' :  spectrum = {which:'pzmsbs72', dfile:'CDFS44_mask1_1.0_H_pzmsbs72_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15100.0, lau:15700.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.333', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.328', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs76' :  spectrum = {which:'pzmsbs76', dfile:'CDFS44_mask1_1.0_H_pzmsbs76_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:18100.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.698', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.693', 'REDSHIFT LT 1.703', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
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
pro cdfs44_mask1_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  ;indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/'  ;
  ;outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  ;IF which[0] EQ 'all' THEN which = ['hey']

  
  ;FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = cdfs44_mask1_H_analyze_settings(which[zz])                                  ;get settings
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
  ;ENDFOR                        ;end loop over which elements
  
END	
;========================================================================================================================
  


