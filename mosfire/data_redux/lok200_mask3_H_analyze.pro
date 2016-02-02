;========================================================================================================================
function lok200_mask3_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;;Guesses listed first take precendence
  ;;;;Must give "which" as a string array!!!

  
  CASE xwhich OF

     'bsbsr12' :  spectrum = {which:'bsbsr12', dfile:'LOK200_mask3_H_bsbsr12_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16000.0, lau:16600.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.477', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.472', 'REDSHIFT LT 1.482', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bsbsr14' :  spectrum = {which:'bsbsr14', dfile:'LOK200_mask3_H_bsbsr14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15600.0, lau:16200.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.408', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.403', 'REDSHIFT LT 1.413', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsr7' :  spectrum = {which:'bsbsr7', dfile:'LOK200_mask3_H_bsbsr7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:17200.0, lau:18000.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=1.653', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.648', 'REDSHIFT LT 1.658', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsr8a' :  spectrum = {which:'bsbsr8a', dfile:'LOK200_mask3_H_bsbsr8a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17200.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.654', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.649', 'REDSHIFT LT 1.659', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsr106' :  spectrum = {which:'fsbsr106', dfile:'LOK200_mask3_H_fsbsr106_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr114' :  spectrum = {which:'fsbsr114', dfile:'LOK200_mask3_H_fsbsr114_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15800.0, lau:16400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.431', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.426', 'REDSHIFT LT 1.436', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr166' :  spectrum = {which:'fsbsr166', dfile:'LOK200_mask3_H_fsbsr166_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:14600.0, lau:15400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=2.035', 'sig=3.5', 'c1=0.50', 'c2=0.20', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.030', 'REDSHIFT LT 2.040', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'fsbsr170a' :  spectrum = {which:'fsbsr170a', dfile:'LOK200_mask3_H_fsbsr170a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15400.0, lau:16000.0, QFLAG:1, NOFITSKY:0, $
                                guess:['redshift=1.367', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.362', 'REDSHIFT LT 1.372', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsr182' :  spectrum = {which:'fsbsr182', dfile:'LOK200_mask3_H_fsbsr182_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17500.0, lau:17950.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.711', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.706', 'REDSHIFT LT 1.716', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsr242' :  spectrum = {which:'fsbsr242', dfile:'LOK200_mask3_H_fsbsr242_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsb131b' :  spectrum = {which:'msbsb131b', dfile:'LOK200_mask3_H_msbsb131b_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:14800.0, lau:15400.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.271', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.266', 'REDSHIFT LT 1.276', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsb134' :  spectrum = {which:'msbsb134', dfile:'LOK200_mask3_H_msbsb134_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb135' :  spectrum = {which:'msbsb135', dfile:'LOK200_mask3_H_msbsb135_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb136a' :  spectrum = {which:'msbsb136a', dfile:'LOK200_mask3_H_msbsb136a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb137' :  spectrum = {which:'msbsb137', dfile:'LOK200_mask3_H_msbsb137_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.469', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.464', 'REDSHIFT LT 1.474', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb153a' :  spectrum = {which:'msbsb153a', dfile:'LOK200_mask3_H_msbsb153a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb156' :  spectrum = {which:'msbsb156', dfile:'LOK200_mask3_H_msbsb156_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:14600.0, lau:15400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.051', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.045', 'REDSHIFT LT 2.055', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'msbsb166' :  spectrum = {which:'msbsb166', dfile:'LOK200_mask3_H_msbsb166_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:14700.0, lau:15400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.055', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'c3=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.045', 'REDSHIFT LT 2.065', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'msbsb175a' :  spectrum = {which:'msbsb175a', dfile:'LOK200_mask3_H_msbsb175a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:14700.0, lau:15300.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.274', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.269', 'REDSHIFT LT 1.279', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb178' :  spectrum = {which:'msbsb178', dfile:'LOK200_mask3_H_msbsb178_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.597', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.592', 'REDSHIFT LT 1.602', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb180' :  spectrum = {which:'msbsb180', dfile:'LOK200_mask3_H_msbsb180_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb189' :  spectrum = {which:'msbsb189', dfile:'LOK200_mask3_H_msbsb189_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb192' :  spectrum = {which:'msbsb192', dfile:'LOK200_mask3_H_msbsb192_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:14700.0, lau:15400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.0478', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.045', 'REDSHIFT LT 2.055', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'msbsb99a' :  spectrum = {which:'msbsb99a', dfile:'LOK200_mask3_H_msbsb99a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr235' :  spectrum = {which:'msbsr235', dfile:'LOK200_mask3_H_msbsr235_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:14700.0, lau:15400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=2.055', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.050', 'REDSHIFT LT 2.060', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'msbsr257' :  spectrum = {which:'msbsr257', dfile:'LOK200_mask3_H_msbsr257_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17800.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.646', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.641', 'REDSHIFT LT 1.651', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr274' :  spectrum = {which:'msbsr274', dfile:'LOK200_mask3_H_msbsr274_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:14700.0, lau:15400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=2.054', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.049', 'REDSHIFT LT 2.059', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr280' :  spectrum = {which:'msbsr280', dfile:'LOK200_mask3_H_msbsr280_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16600.0, lau:17200.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.556', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.551', 'REDSHIFT LT 1.561', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsr281a' :  spectrum = {which:'msbsr281a', dfile:'LOK200_mask3_H_msbsr281a_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:14700.0, lau:15400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=2.053', 'sig=3.5', 'c1=0.6', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.049', 'REDSHIFT LT 2.059', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr281b' :  spectrum = {which:'msbsr281b', dfile:'LOK200_mask3_H_msbsr281b_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr288' :  spectrum = {which:'msbsr288', dfile:'LOK200_mask3_H_msbsr288_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:14700.0, lau:15300.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.045', 'sig=3.5', 'c1=0.6', 'c2=0.4', 'c3=0.4', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.040', 'REDSHIFT LT 2.050', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'msbsr291' :  spectrum = {which:'msbsr291', dfile:'LOK200_mask3_H_msbsr291_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:17900.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.700', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.705', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsr292' :  spectrum = {which:'msbsr292', dfile:'LOK200_mask3_H_msbsr292_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17600.0, lau:18200.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.731', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.726', 'REDSHIFT LT 1.736', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr310' :  spectrum = {which:'msbsr310', dfile:'LOK200_mask3_H_msbsr310_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr313' :  spectrum = {which:'msbsr313', dfile:'LOK200_mask3_H_msbsr313_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr', 'SIIb'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.476', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.471', 'REDSHIFT LT 1.481', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'msbsr325' :  spectrum = {which:'msbsr325', dfile:'LOK200_mask3_H_msbsr325_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest451a' :  spectrum = {which:'rest451a', dfile:'LOK200_mask3_H_rest451a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest497a' :  spectrum = {which:'rest497a', dfile:'LOK200_mask3_H_rest497a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.541', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.536', 'REDSHIFT LT 1.546', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'st14' :  spectrum = {which:'st14', dfile:'LOK200_mask3_H_st14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                           guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 

     
     
 
     
    
 
 

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
PRO lok200_mask3_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask3/2014may14/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask3/2014may14/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = lok200_mask3_H_analyze_settings(which[zz])                                  ;get settings
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
  


