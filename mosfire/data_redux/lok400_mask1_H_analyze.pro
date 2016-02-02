;========================================================================================================================
function lok400_mask1_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;;Guesses listed first take precendence
  ;;;;Must give "which" as a string array!!!

  
  CASE xwhich OF
     'bsbsr3b' :  spectrum = {which:'bsbsr3b', dfile:'lok400_mask1_H_bsbsr3b_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb', 'SIIb'], border:2, $
                              lal:17600.0, lau:18200.0, NOFITSKY:0, QFLAG:1, $
                              guess:['redshift=1.707', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'c4=0.3', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 2.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'bsbsr3a' :  spectrum = {which:'bsbsr3a', dfile:'lok400_mask1_H_bsbsr3a_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                              lal:17600.0, lau:18200.0, NOFITSKY:0, QFLAG:1, $
                              guess:['redshift=1.708', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'bsbsr5a' :  spectrum = {which:'bsbsr5a', dfile:'lok400_mask1_H_bsbsr5a_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                              lal:17500.0, lau:18000.0, NOFITSKY:0, QFLAG:-1, $
                              guess:['redshift=1.705', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.4', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.715', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'SIG1 LT 4.0', 'C1 LT 1.0', 'C2 LT 1.0'], OPENFITS:0}

     'bsbsr5e' :  spectrum = {which:'bsbsr5e', dfile:'lok400_mask1_H_bsbsr5e_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                              lal:17650.0, lau:18100.0, NOFITSKY:0, QFLAG:2, $
                              guess:['redshift=1.701', 'sig=3.5', 'c1=0.4.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.705', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'bsbsr8b' :  spectrum = {which:'bsbsr8b', dfile:'lok400_mask1_H_bsbsr8b_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                              lal:17750.0, lau:18200.0, NOFITSKY:0, QFLAG:3, $
                              guess:['redshift=1.722', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.715', 'REDSHIFT LT 1.725', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'SIG1 LT 5.0']}

     'fore1' :  spectrum = {which:'fore1', dfile:'lok400_mask1_H_fore1_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                            lal:17750.0, lau:18200.0, NOFITSKY:0, QFLAG:-1, $
                            guess:['redshift=1.722', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.715', 'REDSHIFT LT 1.725', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'SIG1 LT 5.0']}

     'fore2' :  spectrum = {which:'fore2', dfile:'lok400_mask1_H_fore2_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                            lal:17750.0, lau:18200.0, NOFITSKY:0, QFLAG:-1, $
                            guess:['redshift=1.722', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.715', 'REDSHIFT LT 1.725', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'SIG1 LT 5.0']}
     
     'fsbsb139' :  spectrum = {which:'fsbsb139', dfile:'lok400_mask1_H_fsbsb139_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17475.0, lau:17850.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'fsbsb186' :  spectrum = {which:'fsbsb186', dfile:'lok400_mask1_H_fsbsb186_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17475.0, lau:17850.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'fsbsr214' :  spectrum = {which:'fsbsr214', dfile:'lok400_mask1_H_fsbsr214_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17750.0, lau:18200.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.733', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.725', 'REDSHIFT LT 1.740', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'fsbsr221' :  spectrum = {which:'fsbsr221', dfile:'lok400_mask1_H_fsbsr221_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17950.0, lau:18220.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.677', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.670', 'REDSHIFT LT 1.690', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'fsbsr232' :  spectrum = {which:'fsbsr232', dfile:'lok400_mask1_H_fsbsr232_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17450.0, lau:17900.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.708', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'SIG1 LT 10.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb130' :  spectrum = {which:'msbsb130', dfile:'lok400_mask1_H_msbsb130_eps_1d_v10.fits', fitto:['OIIIr', 'OIIIb'], border:2, $
                               lal:15500.0, lau:16000.0, NOFITSKY:0, QFLAG:1, $
                               guess:['redshift=2.143', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.138', 'REDSHIFT LT 2.460', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsb130b' :  spectrum = {which:'msbsb130b', dfile:'lok400_mask1_H_msbsb130_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                                xwhich:['msbsb130', 'msbsb130b'], lal:15500.0, lau:16400.0, NOFITSKY:0, QFLAG:2, $
                                guess:['redshift=1.436', 'sig=3.5', 'c1=1.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.425', 'REDSHIFT LT 1.445', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb207' :  spectrum = {which:'msbsb207', dfile:'lok400_mask1_H_msbsb207_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:16000.0, lau:16400.0, NOFITSKY:0, QFLAG:2, $
                               guess:['redshift=1.454', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.445', 'REDSHIFT LT 1.465', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb219' :  spectrum = {which:'msbsb219', dfile:'lok400_mask1_H_msbsb219_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17050.0, lau:17500.0, NOFITSKY:0, QFLAG:2, $
                               guess:['redshift=1.621', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.600', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb227' :  spectrum = {which:'msbsb227', dfile:'lok400_mask1_H_msbsb227_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:16750.0, lau:17300.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.572', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.550', 'REDSHIFT LT 1.590', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr180a' :  spectrum = {which:'msbsr180a', dfile:'lok400_mask1_H_msbsr180a_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                                 lal:16700.0, lau:17200.0, NOFITSKY:0, QFLAG:2, $
                                 guess:['redshift=1.579', 'sig=3.5', 'c1=0.5', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                                 priors:['REDSHIFT GT 1.570', 'REDSHIFT LT 1.590', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr180b' :  spectrum = {which:'msbsr180b', dfile:'lok400_mask1_H_msbsr180b_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                                 lal:15700.0, lau:16200.0, NOFITSKY:0, QFLAG:-1, $
                                 guess:['redshift=1.425', 'sig=3.5', 'c1=1.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                 priors:['REDSHIFT GT 1.415', 'REDSHIFT LT 1.430', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr181' :  spectrum = {which:'msbsr181', dfile:'lok400_mask1_H_msbsr181_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17450.0, lau:17825.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.678', 'sig=3.5', 'c1=1.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.670', 'REDSHIFT LT 1.690', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr215' :  spectrum = {which:'msbsr215', dfile:'lok400_mask1_H_msbsr215_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:16500.0, lau:17000.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.638', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.4', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.650', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr217' :  spectrum = {which:'msbsr217', dfile:'lok400_mask1_H_msbsr217_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17600.0, lau:18100.0, NOFITSKY:0, QFLAG:1, $
                               guess:['redshift=1.710', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr229' :  spectrum = {which:'msbsr229', dfile:'lok400_mask1_H_msbsr229_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                                 lal:17150.0, lau:17500.0, NOFITSKY:0, QFLAG:-1, $
                                 guess:['redshift=1.648', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                                 priors:['REDSHIFT GT 1.640', 'REDSHIFT LT 1.650', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr233a' :  spectrum = {which:'msbsr233a', dfile:'lok400_mask1_H_msbsr233a_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                                 lal:17300.0, lau:17800.0, NOFITSKY:0, QFLAG:-1, $
                                 guess:['redshift=1.667', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                 priors:['REDSHIFT GT 1.660', 'REDSHIFT LT 1.680', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr233b' :  spectrum = {which:'msbsr233b', dfile:'lok400_mask1_H_msbsr233b_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                                 lal:17450.0, lau:17900.0, NOFITSKY:0, QFLAG:-1, $
                                 guess:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                                 priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr239' :  spectrum = {which:'msbsr239', dfile:'lok400_mask1_H_msbsr239_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17600.0, lau:18100.0, NOFITSKY:0, QFLAG:2, $
                               guess:['redshift=1.707', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr244' :  spectrum = {which:'msbsr244', dfile:'lok400_mask1_H_msbsr244_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17450.0, lau:17900.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr248' :  spectrum = {which:'msbsr248', dfile:'lok400_mask1_H_msbsr248_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17650.0, lau:18140.0, NOFITSKY:0, QFLAG:2, $
                               guess:['redshift=1.709', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=-0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr249' :  spectrum = {which:'msbsr249', dfile:'lok400_mask1_H_msbsr249_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:15600.0, lau:16100.0, NOFITSKY:0, QFLAG:3, $
                               guess:['redshift=1.439', 'sig=3.5', 'c1=0.25', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.430', 'REDSHIFT LT 1.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr251' :  spectrum = {which:'msbsr251', dfile:'lok400_mask1_H_msbsr251_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17450.0, lau:17900.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.677', 'sig=3.5', 'c1=0.25', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.670', 'REDSHIFT LT 1.690', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr266' :  spectrum = {which:'msbsr266', dfile:'lok400_mask1_H_msbsr266_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:15750.0, lau:16350.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.449', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.445', 'REDSHIFT LT 1.455', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr314' :  spectrum = {which:'msbsr314', dfile:'lok400_mask1_H_msbsr314_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17700.0, lau:18220.0, NOFITSKY:0, QFLAG:2, $
                               guess:['redshift=1.713', 'sig=3.5', 'c1=.20', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.705', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr316' :  spectrum = {which:'msbsr316', dfile:'lok400_mask1_H_msbsr316_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:16050.0, lau:16500.0, NOFITSKY:0, QFLAG:2, $
                               guess:['redshift=1.471', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.460', 'REDSHIFT LT 1.480', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr320' :  spectrum = {which:'msbsr320', dfile:'lok400_mask1_H_msbsr320_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17650.0, lau:18210.0, NOFITSKY:0, QFLAG:2, $
                               guess:['redshift=1.710', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr334' :  spectrum = {which:'msbsr334', dfile:'lok400_mask1_H_msbsr334_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:16100.0, lau:16500.0, NOFITSKY:0, QFLAG:1, $
                               guess:['redshift=1.472', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=-0.0001' ], $
                               priors:['REDSHIFT GT 1.460', 'REDSHIFT LT 1.480', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsr340' :  spectrum = {which:'msbsr340', dfile:'lok400_mask1_H_msbsr340_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb', 'SIIb', 'SIIr'], border:2, $
                                 lal:16100.0, lau:16700.0, NOFITSKY:0, QFLAG:0, $
                                 guess:['redshift=1.471', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'c4=0.5', 'c5=0.3', 'x0=0.1', 'x1=0.0001' ], $
                                 priors:['REDSHIFT GT 1.460', 'REDSHIFT LT 1.480', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0']}

     'msbsr344' :  spectrum = {which:'msbsr344', dfile:'lok400_mask1_H_msbsr344_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17600.0, lau:18100.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.721', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.710', 'REDSHIFT LT 1.730', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr379a' :  spectrum = {which:'msbsr379a', dfile:'lok400_mask1_H_msbsr379a_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                                lal:17600.0, lau:18200.0, NOFITSKY:0, QFLAG:2, $
                                guess:['redshift=1.726', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.720', 'REDSHIFT LT 1.730', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr391' :  spectrum = {which:'msbsr391', dfile:'lok400_mask1_H_msbsr391_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                                 lal:17450.0, lau:17900.0, NOFITSKY:0, QFLAG:-1, $
                                 guess:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                                 priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr392' :  spectrum = {which:'msbsr392', dfile:'lok400_mask1_H_msbsr392_eps_1d_v10.fits', fitto:['OIIIr', 'OIIIb', 'Hb'], border:2, $
                               lal:17500.0, lau:18150.0, NOFITSKY:0, QFLAG:3, $
                               guess:['redshift=2.615', 'sig=3.5', 'c1=0.5', 'c2=0.15', 'c3=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.605', 'REDSHIFT LT 2.625', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0']}
     
     'msbsr403' :  spectrum = {which:'msbsr403', dfile:'lok400_mask1_H_msbsr403_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb', 'SIIb', 'SIIr'], border:2, $
                               lal:15650.0, lau:16300.0, NOFITSKY:0, QFLAG:0, $
                               guess:['redshift=1.404', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'c4=0.5', 'c5=0.4', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.390', 'REDSHIFT LT 1.410', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0']}
     
     'msbsr408' :  spectrum = {which:'msbsr408', dfile:'lok400_mask1_H_msbsr408_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:15650.0, lau:16300.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.404', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.390', 'REDSHIFT LT 1.410', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr416' :  spectrum = {which:'msbsr416', dfile:'lok400_mask1_H_msbsr416_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17650.0, lau:18200.0, NOFITSKY:0, QFLAG:1, $
                               guess:['redshift=1.707', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsr424' :  spectrum = {which:'msbsr424', dfile:'lok400_mask1_H_msbsr424_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17450.0, lau:17900.0, NOFITSKY:0, QFLAG:-1, $
                               guess:['redshift=1.707', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

     'msbsr427' :  spectrum = {which:'msbsr427', dfile:'lok400_mask1_H_msbsr427_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17650.0, lau:18200.0, NOFITSKY:0, QFLAG:1, $
                               guess:['redshift=1.709', 'sig=3.5', 'c1=0.75', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
    'msbsr446' :  spectrum = {which:'msbsr446', dfile:'lok400_mask1_H_msbsr446_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                               lal:17650.0, lau:18100.0, NOFITSKY:0, QFLAG:2, $
                               guess:['redshift=1.711', 'sig=3.5', 'c1=0.25', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
    
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
pro lok400_mask1_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov29/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov29/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                      ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                             ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = lok400_mask1_H_analyze_settings(which[zz])                                  ;get settings
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
  


