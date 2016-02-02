;========================================================================================================================
function xmm105_mask2_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUESS TO 0.0!!!
  
  CASE xwhich OF

     'clhi0' :  spectrum = {which:'clhi0', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                            initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cllow3' :  spectrum = {which:'cllow3', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
                             border:2, lal:15800.0, lau:16500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.438', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.433', 'REDSHIFT LT 1.443', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'cllow9' :  spectrum = {which:'cllow9', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:15700.0, lau:16500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.421', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.416', 'REDSHIFT LT 1.426', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'fg32' :  spectrum = {which:'fg32', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                           border:2, lal:16600.0, lau:17300.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                           initgss:['redshift=1.545', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'c4=0.50', 'c5=0.50', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.540', 'REDSHIFT LT 1.550', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi15' :  spectrum = {which:'pzhi15', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17600.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.604', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.600', 'REDSHIFT LT 1.610', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi17' :  spectrum = {which:'pzhi17', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16900.0, lau:17600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.593', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.588', 'REDSHIFT LT 1.598', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi18' :  spectrum = {which:'pzhi18', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16500.0, lau:17200.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.544', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.539', 'REDSHIFT LT 1.549', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow2861' :  spectrum = {which:'pzlow2861', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow2912' :  spectrum = {which:'pzlow2912', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow3738' :  spectrum = {which:'pzlow3738', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                                border:2, lal:15100.0, lau:15800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.327', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.322', 'REDSHIFT LT 1.332', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed304' :  spectrum = {which:'pzmed304', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed346' :  spectrum = {which:'pzmed346', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:16600.0, lau:17300.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.546', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.541', 'REDSHIFT LT 1.551', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed368' :  spectrum = {which:'pzmed368', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed423' :  spectrum = {which:'pzmed423', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed429' :  spectrum = {which:'pzmed429', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed441' :  spectrum = {which:'pzmed441', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15500.0, lau:16200.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.388', 'sig=3.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.384', 'REDSHIFT LT 1.392', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed450' :  spectrum = {which:'pzmed450', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16500.0, lau:17200.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed458' :  spectrum = {which:'pzmed458', basename:'xmm105_mask2_v1_H', fitto:['OIIIr','OIIIb','Hb'], $
                               border:2, lal:17000.0, lau:17800.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=2.545', 'sig=3.5', 'c1=0.4', 'c2=0.30', 'c3=0.30', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.540', 'REDSHIFT LT 2.550', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed472' :  spectrum = {which:'pzmed472', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed496' :  spectrum = {which:'pzmed496', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
                               border:2, lal:16500.0, lau:17200.0, QFLAG:2, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.538', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.533', 'REDSHIFT LT 1.543', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed513' :  spectrum = {which:'pzmed513', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17400.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.614', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.609', 'REDSHIFT LT 1.619', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed549' :  spectrum = {which:'pzmed549', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed553' :  spectrum = {which:'pzmed553', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
                               border:2, lal:17000.0, lau:17600.0, QFLAG:2, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.618', 'sig=3.5', 'c1=0.7', 'c2=0.2', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed569' :  spectrum = {which:'pzmed569', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed659' :  spectrum = {which:'pzmed659', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16800.0, lau:17500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.579', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.574', 'REDSHIFT LT 1.584', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed664' :  spectrum = {which:'pzmed664', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed690' :  spectrum = {which:'pzmed690', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16800.0, lau:17500.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.590', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.585', 'REDSHIFT LT 1.595', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed692' :  spectrum = {which:'pzmed692', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed730' :  spectrum = {which:'pzmed730', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], $
                               border:2, lal:15900.0, lau:16600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.438', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.433', 'REDSHIFT LT 1.443', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed776' :  spectrum = {which:'pzmed776', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16500.0, lau:17300.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed778' :  spectrum = {which:'pzmed778', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15700.0, lau:16400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.415', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'x0=0.3', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.410', 'REDSHIFT LT 1.420', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed826' :  spectrum = {which:'pzmed826', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16800.0, lau:17500.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.588', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.583', 'REDSHIFT LT 1.593', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed856' :  spectrum = {which:'pzmed856', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed859' :  spectrum = {which:'pzmed859', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed938' :  spectrum = {which:'pzmed938', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16100.0, lau:16800.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.479', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.474', 'REDSHIFT LT 1.484', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed941' :  spectrum = {which:'pzmed941', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed967' :  spectrum = {which:'pzmed967', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.618', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'st6' :  spectrum = {which:'st6', basename:'xmm105_mask2_v1_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=0.0001', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 0.00000001', 'REDSHIFT LT 0.05', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
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

