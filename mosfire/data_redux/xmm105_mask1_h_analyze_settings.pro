;========================================================================================================================
function xmm105_mask1_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUESS TO 0.0!!!
  
  CASE xwhich OF

     'clhi1' :  spectrum = {which:'clhi1', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16700.0, lau:17400.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.607', 'sig=3.5', 'c1=0.3', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.602', 'REDSHIFT LT 1.612', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'clhi2' :  spectrum = {which:'clhi2', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                            border:2, lal:16900.0, lau:17600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.613', 'sig=3.5', 'c1=1.0', 'c2=0.3', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.608', 'REDSHIFT LT 1.618', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'clhi3' :  spectrum = {which:'clhi3', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16900.0, lau:17600.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.611', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'clhi4' :  spectrum = {which:'clhi4', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                            border:2, lal:17000.0, lau:17700.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.612', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.607', 'REDSHIFT LT 1.617', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'clhi5' :  spectrum = {which:'clhi5', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
                            border:2, lal:16800.0, lau:17500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.595', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.590', 'REDSHIFT LT 1.600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'clhi6' :  spectrum = {which:'clhi6', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
                            border:2, lal:16700.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.581', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.576', 'REDSHIFT LT 1.586', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'clhi7' :  spectrum = {which:'clhi7', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                            border:2, lal:16900.0, lau:17600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.595', 'REDSHIFT LT 1.605', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'clhi8' :  spectrum = {which:'clhi8', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                            border:2, lal:16800.0, lau:17600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.601', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.596', 'REDSHIFT LT 1.606', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'clhi9' :  spectrum = {which:'clhi9', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16700.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.598', 'sig=3.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.593', 'REDSHIFT LT 1.603', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cllow0' :  spectrum = {which:'cllow0', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                             border:2, lal:15800.0, lau:16500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.437', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.432', 'REDSHIFT LT 1.442', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}

     'cllow1' :  spectrum = {which:'cllow1', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                             border:2, lal:15800.0, lau:16500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.436', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.432', 'REDSHIFT LT 1.442', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'cllow4' :  spectrum = {which:'cllow4', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:15700.0, lau:16400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.418', 'sig=3.5', 'c1=0.6', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.413', 'REDSHIFT LT 1.423', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'pzhi12' :  spectrum = {which:'pzhi12', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16400.0, lau:17100.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.519', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.514', 'REDSHIFT LT 1.524', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi20' :  spectrum = {which:'pzhi20', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16800.0, lau:17500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.583', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.578', 'REDSHIFT LT 1.588', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0',  'C4 GT 0.0',  'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow1792' :  spectrum = {which:'pzlow1792', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow3099' :  spectrum = {which:'pzlow3099', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.606', 'sig=3.5', 'c1=0.5', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.601', 'REDSHIFT LT 1.611', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow3917' :  spectrum = {which:'pzlow3917', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16500.0, lau:17200.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.536', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed262' :  spectrum = {which:'pzmed262', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed303' :  spectrum = {which:'pzmed303', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:14800.0, lau:15500.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.291', 'sig=3.5', 'c1=0.4', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.286', 'REDSHIFT LT 1.296', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed375' :  spectrum = {which:'pzmed375', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15200.0, lau:15900.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.340', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.335', 'REDSHIFT LT 1.345', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed386' :  spectrum = {which:'pzmed386', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed414' :  spectrum = {which:'pzmed414', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed463' :  spectrum = {which:'pzmed463', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16100.0, lau:16800.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.472', 'sig=3.5', 'c1=0.4', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.467', 'REDSHIFT LT 1.477', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed577' :  spectrum = {which:'pzmed577', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed578' :  spectrum = {which:'pzmed578', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
                               border:2, lal:16800.0, lau:17500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.596', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.591', 'REDSHIFT LT 1.601', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed706' :  spectrum = {which:'pzmed706', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17500.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.606', 'sig=3.5', 'c1=0.3', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.601', 'REDSHIFT LT 1.611', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed761' :  spectrum = {which:'pzmed761', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16800.0, lau:17500.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.591', 'sig=3.5', 'c1=0.6', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.586', 'REDSHIFT LT 1.596', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed764' :  spectrum = {which:'pzmed764', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed766' :  spectrum = {which:'pzmed766', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15700.0, lau:16400.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.434', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.429', 'REDSHIFT LT 1.439', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed817' :  spectrum = {which:'pzmed817', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed823' :  spectrum = {which:'pzmed823', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16800.0, lau:17500.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.595', 'REDSHIFT LT 1.605', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed847' :  spectrum = {which:'pzmed847', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15700.0, lau:16400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.434', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.429', 'REDSHIFT LT 1.439', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed868' :  spectrum = {which:'pzmed868', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
                               border:2, lal:16700.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.589', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.584', 'REDSHIFT LT 1.594', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'st4' :  spectrum = {which:'st4', basename:'xmm105_mask1_v1_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                          initgss:['redshift=0.0001', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 0.0000000001', 'REDSHIFT LT 0.05', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     

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



