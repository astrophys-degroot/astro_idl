;========================================================================================================================
function xmm113_mask9_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUESS TO 0.0!!!
  
  CASE xwhich OF

     'pzhi19' :  spectrum = {which:'pzhi19', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16000.0, lau:16700.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.465', 'sig=3.5', 'c1=1.0', 'c2=0.50','c4=0.40','c5=0.40', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.460', 'REDSHIFT LT 1.470', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi25' :  spectrum = {which:'pzhi25', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi26' :  spectrum = {which:'pzhi26', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:17400.0, lau:18000.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.695', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.690', 'REDSHIFT LT 1.700', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi32' :  spectrum = {which:'pzhi32', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:17500.0, lau:18200.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.715', 'sig=3.5', 'c1=0.8', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.710', 'REDSHIFT LT 1.720', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi41' :  spectrum = {which:'pzhi41', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:17100.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.639', 'sig=3.5', 'c1=0.7', 'c2=0.20', 'c4=0.40', 'c5=0.40', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.634', 'REDSHIFT LT 1.644', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi42' :  spectrum = {which:'pzhi42', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi45' :  spectrum = {which:'pzhi45', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:17100.0, lau:17900.0, QFLAG:1, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.631', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'c4=0.40', 'c5=0.40', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi47' :  spectrum = {which:'pzhi47', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi50' :  spectrum = {which:'pzhi50', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17600.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.631', 'sig=3.5', 'c1=0.6', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi59' :  spectrum = {which:'pzhi59', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:17100.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.630', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.635', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi64' :  spectrum = {which:'pzhi64', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17600.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.633', 'sig=3.5', 'c1=0.3', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.628', 'REDSHIFT LT 1.638', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow1223' :  spectrum = {which:'pzlow1223', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow2335' :  spectrum = {which:'pzlow2335', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow2434' :  spectrum = {which:'pzlow2434', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow2447' :  spectrum = {which:'pzlow2447', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow2594' :  spectrum = {which:'pzlow2594', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow985' :  spectrum = {which:'pzlow985', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17600.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.614', 'sig=3.5', 'c1=0.6', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.609', 'REDSHIFT LT 1.619', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed230' :  spectrum = {which:'pzmed230', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed368' :  spectrum = {which:'pzmed368', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed373' :  spectrum = {which:'pzmed373', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed409' :  spectrum = {which:'pzmed409', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17600.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.642', 'sig=3.5', 'c1=0.5', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.637', 'REDSHIFT LT 1.647', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed446' :  spectrum = {which:'pzmed446', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed459' :  spectrum = {which:'pzmed459', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed471' :  spectrum = {which:'pzmed471', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.569', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed476' :  spectrum = {which:'pzmed476', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed520' :  spectrum = {which:'pzmed520', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.616', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.611', 'REDSHIFT LT 1.621', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed613' :  spectrum = {which:'pzmed613', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.616', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.611', 'REDSHIFT LT 1.621', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed646' :  spectrum = {which:'pzmed646', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.572', 'sig=3.5', 'c1=0.6', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.567', 'REDSHIFT LT 1.577', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed688' :  spectrum = {which:'pzmed688', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed692' :  spectrum = {which:'pzmed692', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15000.0, lau:15700.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.316', 'sig=3.5', 'c1=0.5', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.311', 'REDSHIFT LT 1.321', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed746' :  spectrum = {which:'pzmed746', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16000.0, lau:16700.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed757' :  spectrum = {which:'pzmed757', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed775' :  spectrum = {which:'pzmed775', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15000.0, lau:15700.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.328', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.323', 'REDSHIFT LT 1.333', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed782' :  spectrum = {which:'pzmed782', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed802' :  spectrum = {which:'pzmed802', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed808' :  spectrum = {which:'pzmed808', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17700.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.633', 'sig=3.5', 'c1=0.6', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.628', 'REDSHIFT LT 1.638', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'spzo27' :  spectrum = {which:'spzo27', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'spzo35' :  spectrum = {which:'spzo35', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16800.0, lau:17500.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.623', 'sig=3.5', 'c1=0.4', 'c2=0.3', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.618', 'REDSHIFT LT 1.631', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'st24' :  spectrum = {which:'st24', basename:'xmm113_mask9_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                           border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                           initgss:['redshift=0.0001', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 0.00000001', 'REDSHIFT LT 0.05', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     


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
