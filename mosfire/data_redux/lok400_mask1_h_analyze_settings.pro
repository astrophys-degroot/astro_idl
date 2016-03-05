;========================================================================================================================
FUNCTION lok400_mask1_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITGSS TO 0.0!!!

  CASE xwhich OF
     'bsbsr3b' :  spectrum = {which:'bsbsr3b', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb', 'SIIb'], $
                              border:2, lal:17600.0, lau:18200.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.707', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'c4=0.3', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 2.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'bsbsr3a' :  spectrum = {which:'bsbsr3a', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                              border:2, lal:17600.0, lau:18200.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.708', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bsbsr5a' :  spectrum = {which:'bsbsr5a', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                              border:2, lal:17500.0, lau:18000.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.705', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.4', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.715', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'SIG1 LT 15.0', 'C1 LT 4.0', 'C2 LT 4.0'], $
                              NEWVER:'v1-2'}

     'bsbsr5e' :  spectrum = {which:'bsbsr5e', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                              border:2, lal:17650.0, lau:18100.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.701', 'sig=3.5', 'c1=0.4.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.705', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'bsbsr8b' :  spectrum = {which:'bsbsr8b', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                              border:2, lal:17750.0, lau:18200.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.722', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.715', 'REDSHIFT LT 1.725', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'SIG1 LT 5.0'], NEWVER:'v1-2'}

     'fore1' :  spectrum = {which:'fore1', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                            lal:17750.0, lau:18200.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.722', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.715', 'REDSHIFT LT 1.725', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'SIG1 LT 5.0'], NEWVER:'v1-2'}

     'fore2' :  spectrum = {which:'fore2', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                            lal:17750.0, lau:18200.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.722', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.715', 'REDSHIFT LT 1.725', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'SIG1 LT 5.0'], NEWVER:'v1-2'}
     
     'fsbsb139' :  spectrum = {which:'fsbsb139', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17475.0, lau:17850.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbsb186' :  spectrum = {which:'fsbsb186', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17475.0, lau:17850.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbsr214' :  spectrum = {which:'fsbsr214', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17750.0, lau:18200.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.733', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.725', 'REDSHIFT LT 1.740', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbsr221' :  spectrum = {which:'fsbsr221', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17950.0, lau:18220.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.677', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.670', 'REDSHIFT LT 1.690', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbsr232' :  spectrum = {which:'fsbsr232', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17450.0, lau:17900.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.708', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'SIG1 LT 10.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsb130' :  spectrum = {which:'msbsb130', basename:'lok400_mask1_H', fitto:['OIIIr', 'OIIIb'], $
                               border:2, lal:15500.0, lau:16000.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=2.143', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.138', 'REDSHIFT LT 2.460', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsb130b' :  spectrum = {which:'msbsb130b', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                                border:2, $ 
                                xwhich:['msbsb130', 'msbsb130b'], $
                                lal:15500.0, lau:16400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.436', 'sig=3.5', 'c1=1.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.425', 'REDSHIFT LT 1.445', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsb207' :  spectrum = {which:'msbsb207', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:16000.0, lau:16400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.454', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.445', 'REDSHIFT LT 1.465', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsb219' :  spectrum = {which:'msbsb219', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17050.0, lau:17500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.621', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.600', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsb227' :  spectrum = {which:'msbsb227', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:16750.0, lau:17300.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.572', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.550', 'REDSHIFT LT 1.590', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr180a' :  spectrum = {which:'msbsr180a', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                                border:2,  lal:16700.0, lau:17200.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.579', 'sig=3.5', 'c1=0.5', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.570', 'REDSHIFT LT 1.590', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr180b' :  spectrum = {which:'msbsr180b', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                                border:2,  lal:15700.0, lau:16200.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.425', 'sig=3.5', 'c1=1.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.415', 'REDSHIFT LT 1.430', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr181' :  spectrum = {which:'msbsr181', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17450.0, lau:17825.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.678', 'sig=3.5', 'c1=1.0', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.670', 'REDSHIFT LT 1.690', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr215' :  spectrum = {which:'msbsr215', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:16500.0, lau:17000.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.638', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.4', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.650', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr217' :  spectrum = {which:'msbsr217', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17600.0, lau:18100.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.710', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr229' :  spectrum = {which:'msbsr229', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17150.0, lau:17500.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.648', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.640', 'REDSHIFT LT 1.650', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr233a' :  spectrum = {which:'msbsr233a', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                                border:2,  lal:17300.0, lau:17800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.667', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.660', 'REDSHIFT LT 1.680', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr233b' :  spectrum = {which:'msbsr233b', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                                border:2,  lal:17450.0, lau:17900.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr239' :  spectrum = {which:'msbsr239', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17600.0, lau:18100.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.707', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr244' :  spectrum = {which:'msbsr244', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17450.0, lau:17900.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr248' :  spectrum = {which:'msbsr248', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17650.0, lau:18140.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.709', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=-0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr249' :  spectrum = {which:'msbsr249', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:15600.0, lau:16100.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.439', 'sig=3.5', 'c1=0.25', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.430', 'REDSHIFT LT 1.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr251' :  spectrum = {which:'msbsr251', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17450.0, lau:17900.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.677', 'sig=3.5', 'c1=0.25', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.670', 'REDSHIFT LT 1.690', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr266' :  spectrum = {which:'msbsr266', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:15750.0, lau:16350.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.449', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.445', 'REDSHIFT LT 1.455', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr314' :  spectrum = {which:'msbsr314', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17700.0, lau:18220.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.713', 'sig=3.5', 'c1=.20', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.705', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr316' :  spectrum = {which:'msbsr316', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:16050.0, lau:16500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.471', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.460', 'REDSHIFT LT 1.480', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr320' :  spectrum = {which:'msbsr320', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17650.0, lau:18210.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.710', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr334' :  spectrum = {which:'msbsr334', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:16100.0, lau:16500.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.472', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=-0.0001' ], $
                               priors:['REDSHIFT GT 1.460', 'REDSHIFT LT 1.480', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr340' :  spectrum = {which:'msbsr340', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb', 'SIIb', 'SIIr'], $
                               border:2, lal:16100.0, lau:16700.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.471', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'c4=0.5', 'c5=0.3', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.460', 'REDSHIFT LT 1.480', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}

     'msbsr344' :  spectrum = {which:'msbsr344', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17600.0, lau:18100.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.721', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.710', 'REDSHIFT LT 1.730', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr379a' :  spectrum = {which:'msbsr379a', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                                border:2,  lal:17600.0, lau:18200.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.726', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.720', 'REDSHIFT LT 1.730', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr391' :  spectrum = {which:'msbsr391', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17450.0, lau:17900.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.701', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.680', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr392' :  spectrum = {which:'msbsr392', basename:'lok400_mask1_H', fitto:['OIIIr', 'OIIIb', 'Hb'], $
                               border:2, lal:17500.0, lau:18150.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=2.615', 'sig=3.5', 'c1=0.5', 'c2=0.15', 'c3=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.605', 'REDSHIFT LT 2.625', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr403' :  spectrum = {which:'msbsr403', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb', 'SIIb', 'SIIr'], $
                               border:2, lal:15650.0, lau:16300.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.404', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'c4=0.5', 'c5=0.4', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.390', 'REDSHIFT LT 1.410', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr408' :  spectrum = {which:'msbsr408', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:15650.0, lau:16300.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.404', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.390', 'REDSHIFT LT 1.410', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr416' :  spectrum = {which:'msbsr416', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17650.0, lau:18200.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.707', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr424' :  spectrum = {which:'msbsr424', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17450.0, lau:17900.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.707', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'msbsr427' :  spectrum = {which:'msbsr427', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17650.0, lau:18200.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.709', 'sig=3.5', 'c1=0.75', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbsr446' :  spectrum = {which:'msbsr446', basename:'lok400_mask1_H', fitto:['Ha', 'NIIr', 'NIIb'], $
                               border:2, lal:17650.0, lau:18100.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.711', 'sig=3.5', 'c1=0.25', 'c2=0.15', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     
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


