;========================================================================================================================
function cdfs44_mask7_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF

     'pzhi17' :  spectrum = {which:'pzhi17', dfile:'cdfs44_mask7_v2_H_pzhi17_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15000.0, lau:15600.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.308', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.303', 'REDSHIFT LT 1.313', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi19' :  spectrum = {which:'pzhi19', dfile:'cdfs44_mask7_v2_H_pzhi19_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16850.0, lau:17350.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.613', 'sig=3.5', 'c1=0.3', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.608', 'REDSHIFT LT 1.618', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi24' :  spectrum = {which:'pzhi24', dfile:'cdfs44_mask7_v2_H_pzhi24_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17500.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=1.607', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.602', 'REDSHIFT LT 1.612', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi38' :  spectrum = {which:'pzhi38', dfile:'cdfs44_mask7_v2_H_pzhi38_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15800.0, lau:16400.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.434', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.429', 'REDSHIFT LT 1.439', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi40' :  spectrum = {which:'pzhi40', dfile:'cdfs44_mask7_v2_H_pzhi40_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16200.0, lau:16800.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.494', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.489', 'REDSHIFT LT 1.499', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi42' :  spectrum = {which:'pzhi42', dfile:'cdfs44_mask7_v2_H_pzhi42_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17300.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi48' :  spectrum = {which:'pzhi48', dfile:'cdfs44_mask7_v2_H_pzhi48_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16500.0, lau:17100.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=1.540', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.535', 'REDSHIFT LT 1.545', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi50' :  spectrum = {which:'pzhi50', dfile:'cdfs44_mask7_v2_H_pzhi50_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17500.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.620', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.615', 'REDSHIFT LT 1.625', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi54' :  spectrum = {which:'pzhi54', dfile:'cdfs44_mask7_v2_H_pzhi54_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16200.0, lau:16800.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=1.494', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.490', 'REDSHIFT LT 1.498', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi93' :  spectrum = {which:'pzhi93', dfile:'cdfs44_mask7_v2_H_pzhi93_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzlow1674' :  spectrum = {which:'pzlow1674', dfile:'cdfs44_mask7_v2_H_pzlow1674_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzlow1869' :  spectrum = {which:'pzlow1869', dfile:'cdfs44_mask7_v2_H_pzlow1869_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                                lal:15170.0, lau:15600.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=2.071', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 2.066', 'REDSHIFT LT 2.076', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'pzlow2736' :  spectrum = {which:'pzlow2736', dfile:'cdfs44_mask7_v2_H_pzlow2736_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:14900.0, lau:15300.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.289', 'sig=3.5', 'c1=0.5', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.284', 'REDSHIFT LT 1.294', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed1170' :  spectrum = {which:'pzmed1170', dfile:'cdfs44_mask7_v2_H_pzmed1170_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17000.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.634', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed1181' :  spectrum = {which:'pzmed1181', dfile:'cdfs44_mask7_v2_H_pzmed1181_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15100.0, lau:15500.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.316', 'sig=3.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.311', 'REDSHIFT LT 1.321', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed1195' :  spectrum = {which:'pzmed1195', dfile:'cdfs44_mask7_v2_H_pzmed1195_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.626', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed1223' :  spectrum = {which:'pzmed1223', dfile:'cdfs44_mask7_v2_H_pzmed1223_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17200.0, lau:17600.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.647', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.643', 'REDSHIFT LT 1.651', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed1227' :  spectrum = {which:'pzmed1227', dfile:'cdfs44_mask7_v2_H_pzmed1227_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17600.0, lau:18200.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.727', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.722', 'REDSHIFT LT 1.732', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed200' :  spectrum = {which:'pzmed200', dfile:'cdfs44_mask7_v2_H_pzmed200_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed211' :  spectrum = {which:'pzmed211', dfile:'cdfs44_mask7_v2_H_pzmed211_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16800.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.581', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.576', 'REDSHIFT LT 1.586', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
 
     'pzmed258' :  spectrum = {which:'pzmed258', dfile:'cdfs44_mask7_v2_H_pzmed258_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17600.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.621', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.626', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed283' :  spectrum = {which:'pzmed283', dfile:'cdfs44_mask7_v2_H_pzmed283_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17600.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.627', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.622', 'REDSHIFT LT 1.632', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed306' :  spectrum = {which:'pzmed306', dfile:'cdfs44_mask7_v2_H_pzmed306_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed341' :  spectrum = {which:'pzmed341', dfile:'cdfs44_mask7_v2_H_pzmed341_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed384' :  spectrum = {which:'pzmed384', dfile:'cdfs44_mask7_v2_H_pzmed384_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:15000.0, lau:15400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=2.026', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.021', 'REDSHIFT LT 2.031', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'pzmed444' :  spectrum = {which:'pzmed444', dfile:'cdfs44_mask7_v2_H_pzmed444_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed464' :  spectrum = {which:'pzmed464', dfile:'cdfs44_mask7_v2_H_pzmed464_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16300.0, lau:16900.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.502', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.497', 'REDSHIFT LT 1.507', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed580' :  spectrum = {which:'pzmed580', dfile:'cdfs44_mask7_v2_H_pzmed580_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.611', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed640' :  spectrum = {which:'pzmed640', dfile:'cdfs44_mask7_v2_H_pzmed640_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed649' :  spectrum = {which:'pzmed649', dfile:'cdfs44_mask7_v2_H_pzmed649_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed776' :  spectrum = {which:'pzmed776', dfile:'cdfs44_mask7_v2_H_pzmed776_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.535', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.530', 'REDSHIFT LT 1.540', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed797' :  spectrum = {which:'pzmed797', dfile:'cdfs44_mask7_v2_H_pzmed797_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17500.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.596', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.591', 'REDSHIFT LT 1.600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed799' :  spectrum = {which:'pzmed799', dfile:'cdfs44_mask7_v2_H_pzmed799_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17500.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.592', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.587', 'REDSHIFT LT 1.597', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed825' :  spectrum = {which:'pzmed825', dfile:'cdfs44_mask7_v2_H_pzmed825_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed836' :  spectrum = {which:'pzmed836', dfile:'cdfs44_mask7_v2_H_pzmed836_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed871' :  spectrum = {which:'pzmed871', dfile:'cdfs44_mask7_v2_H_pzmed871_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'spzg29' :  spectrum = {which:'spzg29', dfile:'cdfs44_mask7_v2_H_spzg29_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'spzg76' :  spectrum = {which:'spzg76', dfile:'cdfs44_mask7_v2_H_spzg76_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16200.0, lau:16800.0, QFLAG:1, NOFITSKY:0, $
                           guess:['redshift=1.496', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.491', 'REDSHIFT LT 1.500', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
    
     'st20' :  spectrum = {which:'st20', dfile:'cdfs44_mask7_v2_H_st20_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16200.0, lau:16800.0, QFLAG:1, NOFITSKY:0, $
                           guess:['redshift=1.496', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.491', 'REDSHIFT LT 1.500', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     


 

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
pro cdfs44_mask7_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = ''                                                   ;
  outdir = indir                                               ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['HEY']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = cdfs44_mask7_H_analyze_settings(which[zz])                                  ;get settings
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
  


