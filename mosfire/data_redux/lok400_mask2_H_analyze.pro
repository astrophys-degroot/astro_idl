;========================================================================================================================
function lok400_mask2_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;;Guesses listed first take precendence
  ;;;;Must give "which" as a string array!!!

  
  CASE xwhich OF
     'bsbsr17' :  spectrum = {which:'bsbsr17', dfile:'LOK400_mask2_H_bsbsr17_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17600.0, lau:18200.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.699', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.3', 'x1=-0.001' ], $
                              priors:['REDSHIFT GT 1.690', 'REDSHIFT LT 1.710', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'bsbsr5b' :  spectrum = {which:'bsbsr5b', dfile:'LOK400_mask2_H_bsbsr5b_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17600.0, lau:18200.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.711', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'fsbsb121' :  spectrum = {which:'fsbsb121', dfile:'LOK400_mask2_H_fsbsb121_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15300.0, lau:15900.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.370', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.360', 'REDSHIFT LT 1.380', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'fsbsb173' :  spectrum = {which:'fsbsb173', dfile:'LOK400_mask2_H_fsbsb173_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17675.0, lau:18100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.706', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.711', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'fsbsr123' :  spectrum = {which:'fsbsr123', dfile:'LOK400_mask2_H_fsbsr123_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15000.0, lau:15600.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.325', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.315', 'REDSHIFT LT 1.335', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'fsbsr128' :  spectrum = {which:'fsbsr128', dfile:'LOK400_mask2_H_fsbsr128_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15400.0, lau:15900.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.378', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.370', 'REDSHIFT LT 1.390', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'fsbsr130' :  spectrum = {which:'fsbsr130', dfile:'LOK400_mask2_H_fsbsr130_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17700.0, lau:18100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.7480', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.740', 'REDSHIFT LT 1.760', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'fsbsr189' :  spectrum = {which:'fsbsr189', dfile:'LOK400_mask2_H_fsbsr189_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17200.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.560', 'REDSHIFT LT 1.580', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'fsbsr237a' :  spectrum = {which:'fsbsr237a', dfile:'LOK400_mask2_H_fsbsr237a_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:17400.0, lau:18200.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=2.623', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.61000', 'REDSHIFT LT 2.63000', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
  
     'fsbsr237b' :  spectrum = {which:'fsbsr237b', dfile:'LOK400_mask2_H_fsbsr237b_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.60500', 'sig=3.5', 'c1=0.20', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.600', 'REDSHIFT LT 1.61000', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'fsbsr239' :  spectrum = {which:'fsbsr239', dfile:'LOK400_mask2_H_fsbsr239_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16000.0, lau:16600.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.459', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.450', 'REDSHIFT LT 1.470', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'man1' :  spectrum = {which:'man1', dfile:'LOK400_mask2_H_man1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16400.0, lau:16900.0, QFLAG:-1, NOFITSKY:0, $
                           guess:['redshift=1.518', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.510', 'REDSHIFT LT 1.530', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb109a' :  spectrum = {which:'msbsb109a', dfile:'LOK400_mask2_H_msbsb109a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17200.0, lau:17700.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.651', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.4', 'x1=-0.001' ], $
                                priors:['REDSHIFT GT 1.640', 'REDSHIFT LT 1.66', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb112' :  spectrum = {which:'msbsb112', dfile:'LOK400_mask2_H_msbsb112_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17700.0, lau:18200.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.732', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=-0.0001' ], $
                               priors:['REDSHIFT GT 1.725', 'REDSHIFT LT 1.740', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb157' :  spectrum = {which:'msbsb157', dfile:'LOK400_mask2_H_msbsb157_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16200.0, lau:16800.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.4950', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.9', 'x1=-0.0005' ], $
                               priors:['REDSHIFT GT 1.485', 'REDSHIFT LT 1.505', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb158a' :  spectrum = {which:'msbsb158a', dfile:'LOK400_mask2_H_msbsb158a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17400.0, lau:17800.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.695', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.685', 'REDSHIFT LT 1.705', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb174' :  spectrum = {which:'msbsb174', dfile:'LOK400_mask2_H_msbsb174_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15000.0, lau:15600.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.319', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.310', 'REDSHIFT LT 1.330', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb182' :  spectrum = {which:'msbsb182', dfile:'LOK400_mask2_H_msbsb182_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.472', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.471', 'REDSHIFT LT 1.473', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0']}
 
     'msbsb198' :  spectrum = {which:'msbsb198', dfile:'LOK400_mask2_H_msbsb198_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17600.0, lau:18200.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.726', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.715', 'REDSHIFT LT 1.735', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb224' :  spectrum = {which:'msbsb224', dfile:'LOK400_mask2_H_msbsb224_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17200.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.560', 'REDSHIFT LT 1.580', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb81' :  spectrum = {which:'msbsb81', dfile:'LOK400_mask2_H_msbsb81_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17100.0, lau:17700.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.646', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.640', 'REDSHIFT LT 1.650', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb90' :  spectrum = {which:'msbsb90', dfile:'LOK400_mask2_H_msbsb90_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16800.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.568', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.560', 'REDSHIFT LT 1.580', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr224' :  spectrum = {which:'msbsr224', dfile:'LOK400_mask2_H_msbsr224_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16300.0, lau:16900.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.515', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.505', 'REDSHIFT LT 1.525', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr226a' :  spectrum = {which:'msbsr226a', dfile:'LOK400_mask2_H_msbsr226a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16100.0, lau:16700.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.479', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.470', 'REDSHIFT LT 1.490', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr242' :  spectrum = {which:'msbsr242', dfile:'LOK400_mask2_H_msbsr242_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.475', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.465', 'REDSHIFT LT 1.485', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr252' :  spectrum = {which:'msbsr252', dfile:'LOK400_mask2_H_msbsr252_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15400.0, lau:15900.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.371', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.365', 'REDSHIFT LT 1.375', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr278a' :  spectrum = {which:'msbsr278a', dfile:'LOK400_mask2_H_msbsr278a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17500.0, lau:18100.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.707', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr355' :  spectrum = {which:'msbsr355', dfile:'LOK400_mask2_H_msbsr355_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17500.0, lau:18200.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.708', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr358' :  spectrum = {which:'msbsr358', dfile:'LOK400_mask2_H_msbsr358_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17500.0, lau:18200.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.733', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.725', 'REDSHIFT LT 1.740', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr359' :  spectrum = {which:'msbsr359', dfile:'LOK400_mask2_H_msbsr359_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr', 'OI6300'], border:2, $
                               lal:17000.0, lau:18200.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.704', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.1', 'c5=0.1', 'c6=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.710', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0', 'C6 GT 0.0']}
 
     'msbsr395' :  spectrum = {which:'msbsr395', dfile:'LOK400_mask2_H_msbsr395_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr', 'OI6300'], border:2, $
                               lal:17000.0, lau:18200.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.704', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.1', 'c5=0.1', 'c6=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.710', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0', 'C6 GT 0.0']}
     
     'msbsr404a' :  spectrum = {which:'msbsr404a', dfile:'LOK400_mask2_H_msbsr404a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16450.0, lau:17000.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.539', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.530', 'REDSHIFT LT 1.550', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr404b' :  spectrum = {which:'msbsr404b', dfile:'LOK400_mask2_H_msbsr404b_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15400.0, lau:15900.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.359', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.350', 'REDSHIFT LT 1.370', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr406' :  spectrum = {which:'msbsr406', dfile:'LOK400_mask2_H_msbsr406_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:18000.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.688', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.695', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr413a' :  spectrum = {which:'msbsr413a', dfile:'LOK400_mask2_H_msbsr413a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                                lal:15200.0, lau:16100.0, QFLAG:0, NOFITSKY:0, $
                                guess:['redshift=1.345', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.1', 'c5=0.1', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.340', 'REDSHIFT LT 1.350', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0']}
 
     'msbsr431' :  spectrum = {which:'msbsr431', dfile:'LOK400_mask2_H_msbsr431_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17700.0, lau:18000.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.710', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr454' :  spectrum = {which:'msbsr454', dfile:'LOK400_mask2_H_msbsr454_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:18000.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.683', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.675', 'REDSHIFT LT 1.690', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 

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
pro lok400_mask2_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask2/2014may14/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask2/2014may14/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                      ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                             ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = lok400_mask2_H_analyze_settings(which[zz])                                  ;get settings
     IF values.which NE '-1' THEN BEGIN                                                   ;check settings were found
        IF tag_exist(values, 'priors') EQ 1 THEN priors = values.priors ELSE priors = 0   ;if optional parameters given
        IF tag_exist(values, 'xwhich') EQ 1 THEN xwhich = values.xwhich ELSE xwhich = 0   ;check if tag exists
        mosfire_1dspec_analyze, values.dfile, values.which, XWHICH=xwhich, PYERR=pyerr, $ ;call routine
                                FITTO=values.fitto, BORDER=values.border, $
                                LLOWER=values.lal, LUPPER=values.lau, $
                                NOFITSKY=values.nofitsky, CHKVALS=values.guess, $
                                PRIORS=priors, DRYRUN=dryrun, QFLAG=values.qflag, $
                                OPENPLOT=openplot, INDIR=indir, OUTDIR=outdir
     ENDIF
  ENDFOR                        ;end loop over which elements
  
END	
;========================================================================================================================
  


