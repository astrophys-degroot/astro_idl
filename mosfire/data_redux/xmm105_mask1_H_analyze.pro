;========================================================================================================================
function xmm105_mask1_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF

     'clhi1' :  spectrum = {which:'clhi1', dfile:'xmm105_mask1_v1_H_clhi1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16700.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.607', 'sig=3.5', 'c1=0.3', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.602', 'REDSHIFT LT 1.612', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'clhi2' :  spectrum = {which:'clhi2', dfile:'xmm105_mask1_v1_H_clhi2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                            lal:16900.0, lau:17600.0, QFLAG:0, NOFITSKY:0, $
                            guess:['redshift=1.613', 'sig=3.5', 'c1=1.0', 'c2=0.3', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.608', 'REDSHIFT LT 1.618', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'clhi3' :  spectrum = {which:'clhi3', dfile:'xmm105_mask1_v1_H_clhi3_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17600.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.611', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'clhi4' :  spectrum = {which:'clhi4', dfile:'xmm105_mask1_v1_H_clhi4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                            lal:17000.0, lau:17700.0, QFLAG:0, NOFITSKY:0, $
                            guess:['redshift=1.612', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.607', 'REDSHIFT LT 1.617', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:1}
 
     'clhi5' :  spectrum = {which:'clhi5', dfile:'xmm105_mask1_v1_H_clhi5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16800.0, lau:17500.0, QFLAG:1, NOFITSKY:0, $
                            guess:['redshift=1.595', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.590', 'REDSHIFT LT 1.600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'clhi6' :  spectrum = {which:'clhi6', dfile:'xmm105_mask1_v1_H_clhi6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16700.0, lau:17400.0, QFLAG:0, NOFITSKY:0, $
                            guess:['redshift=1.581', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.576', 'REDSHIFT LT 1.586', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'clhi7' :  spectrum = {which:'clhi7', dfile:'xmm105_mask1_v1_H_clhi7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], border:2, $
                            lal:16900.0, lau:17600.0, QFLAG:0, NOFITSKY:0, $
                            guess:['redshift=1.600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.595', 'REDSHIFT LT 1.605', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'clhi8' :  spectrum = {which:'clhi8', dfile:'xmm105_mask1_v1_H_clhi8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16800.0, lau:17500.0, QFLAG:1, NOFITSKY:0, $
                            guess:['redshift=1.601', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.596', 'REDSHIFT LT 1.606', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'clhi9' :  spectrum = {which:'clhi9', dfile:'xmm105_mask1_v1_H_clhi9_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16700.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                            guess:['redshift=1.598', 'sig=3.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.593', 'REDSHIFT LT 1.603', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'cllow0' :  spectrum = {which:'cllow0', dfile:'xmm105_mask1_v1_H_cllow0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                             lal:15800.0, lau:16500.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=1.437', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.432', 'REDSHIFT LT 1.442', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}

     'cllow1' :  spectrum = {which:'cllow1', dfile:'xmm105_mask1_v1_H_cllow1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                             lal:15800.0, lau:16500.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=1.436', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.432', 'REDSHIFT LT 1.442', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'cllow4' :  spectrum = {which:'cllow4', dfile:'xmm105_mask1_v1_H_cllow4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15700.0, lau:16400.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.418', 'sig=3.5', 'c1=0.6', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.413', 'REDSHIFT LT 1.423', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}

     'pzhi12' :  spectrum = {which:'pzhi12', dfile:'xmm105_mask1_v1_H_pzhi12_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16400.0, lau:17100.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.519', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.514', 'REDSHIFT LT 1.524', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi20' :  spectrum = {which:'pzhi20', dfile:'xmm105_mask1_v1_H_pzhi20_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], border:2, $
                             lal:16800.0, lau:17500.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.583', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.578', 'REDSHIFT LT 1.588', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0',  'C4 GT 0.0',  'C5 GT 0.0'], OPENFITS:0}
     
     'pzlow1792' :  spectrum = {which:'pzlow1792', dfile:'xmm105_mask1_v1_H_pzlow1792_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzlow3099' :  spectrum = {which:'pzlow3099', dfile:'xmm105_mask1_v1_H_pzlow3099_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.606', 'sig=3.5', 'c1=0.5', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.601', 'REDSHIFT LT 1.611', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzlow3917' :  spectrum = {which:'pzlow3917', dfile:'xmm105_mask1_v1_H_pzlow3917_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16500.0, lau:17200.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.536', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed262' :  spectrum = {which:'pzmed262', dfile:'xmm105_mask1_v1_H_pzmed262_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed303' :  spectrum = {which:'pzmed303', dfile:'xmm105_mask1_v1_H_pzmed303_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:14800.0, lau:15500.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.291', 'sig=3.5', 'c1=0.4', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.286', 'REDSHIFT LT 1.296', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed375' :  spectrum = {which:'pzmed375', dfile:'xmm105_mask1_v1_H_pzmed375_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15200.0, lau:15900.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.340', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.335', 'REDSHIFT LT 1.345', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed386' :  spectrum = {which:'pzmed386', dfile:'xmm105_mask1_v1_H_pzmed386_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed414' :  spectrum = {which:'pzmed414', dfile:'xmm105_mask1_v1_H_pzmed414_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed463' :  spectrum = {which:'pzmed463', dfile:'xmm105_mask1_v1_H_pzmed463_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16800.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.472', 'sig=3.5', 'c1=0.4', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.467', 'REDSHIFT LT 1.477', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed577' :  spectrum = {which:'pzmed577', dfile:'xmm105_mask1_v1_H_pzmed577_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed578' :  spectrum = {which:'pzmed578', dfile:'xmm105_mask1_v1_H_pzmed578_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16800.0, lau:17500.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.596', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.591', 'REDSHIFT LT 1.601', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed706' :  spectrum = {which:'pzmed706', dfile:'xmm105_mask1_v1_H_pzmed706_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17500.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.606', 'sig=3.5', 'c1=0.3', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.601', 'REDSHIFT LT 1.611', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed761' :  spectrum = {which:'pzmed761', dfile:'xmm105_mask1_v1_H_pzmed761_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16800.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.591', 'sig=3.5', 'c1=0.6', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.586', 'REDSHIFT LT 1.596', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed764' :  spectrum = {which:'pzmed764', dfile:'xmm105_mask1_v1_H_pzmed764_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed766' :  spectrum = {which:'pzmed766', dfile:'xmm105_mask1_v1_H_pzmed766_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15700.0, lau:16400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.434', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.429', 'REDSHIFT LT 1.439', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed817' :  spectrum = {which:'pzmed817', dfile:'xmm105_mask1_v1_H_pzmed817_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed823' :  spectrum = {which:'pzmed823', dfile:'xmm105_mask1_v1_H_pzmed823_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16800.0, lau:17500.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.595', 'REDSHIFT LT 1.605', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed847' :  spectrum = {which:'pzmed847', dfile:'xmm105_mask1_v1_H_pzmed847_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15700.0, lau:16400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.434', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.429', 'REDSHIFT LT 1.439', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed868' :  spectrum = {which:'pzmed868', dfile:'xmm105_mask1_v1_H_pzmed868_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.589', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.584', 'REDSHIFT LT 1.594', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'st4' :  spectrum = {which:'st4', dfile:'xmm105_mask1_v1_H_st4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
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
pro xmm105_mask1_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = ''                                                   ;
  outdir = indir                                               ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  
  IF which[0] EQ 'all' THEN which = []

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = xmm105_mask1_H_analyze_settings(which[zz])                                  ;get settings
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
  


