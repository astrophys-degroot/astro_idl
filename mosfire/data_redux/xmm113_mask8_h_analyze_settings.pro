;========================================================================================================================
function xmm113_mask8_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUESS TO 0.0!!!
  
  CASE xwhich OF

     'pzhi31' :  spectrum = {which:'pzhi31', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16300.0, lau:16900.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.521', 'sig=3.5', 'c1=1.5', 'c2=0.20', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.516', 'REDSHIFT LT 1.526', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi35' :  spectrum = {which:'pzhi35', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16900.0, lau:17600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20','x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi36' :  spectrum = {which:'pzhi36', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                             border:2, lal:16000.0, lau:16700.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.467', 'sig=3.5', 'c1=2.0', 'c2=1.0', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.462', 'REDSHIFT LT 1.472', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi40' :  spectrum = {which:'pzhi40', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi44' :  spectrum = {which:'pzhi44', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16700.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.568', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.563', 'REDSHIFT LT 1.573', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi46' :  spectrum = {which:'pzhi46', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:15800.0, lau:16500.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.440', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.435', 'REDSHIFT LT 1.445', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi48' :  spectrum = {which:'pzhi48', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16600.0, lau:17300.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.566', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.561', 'REDSHIFT LT 1.571', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi49' :  spectrum = {which:'pzhi49', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi54' :  spectrum = {which:'pzhi54', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16800.0, lau:17500.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.636', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.631', 'REDSHIFT LT 1.641', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi55' :  spectrum = {which:'pzhi55', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                             border:2, lal:17100.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.641', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.636', 'REDSHIFT LT 1.646', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi56' :  spectrum = {which:'pzhi56', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi57' :  spectrum = {which:'pzhi57', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                             border:2, lal:16000.0, lau:16700.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.467', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.461', 'REDSHIFT LT 1.471', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi58' :  spectrum = {which:'pzhi58', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                             border:2, lal:17100.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.632', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi60' :  spectrum = {which:'pzhi60', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.630', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.635', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi61' :  spectrum = {which:'pzhi61', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                             border:2, lal:16500.0, lau:17200.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.537', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.532', 'REDSHIFT LT 1.542', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi62' :  spectrum = {which:'pzhi62', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
                             border:2, lal:17000.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow2090' :  spectrum = {which:'pzlow2090', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed331' :  spectrum = {which:'pzmed331', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                               border:2, lal:16400.0, lau:17100.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.521', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.516', 'REDSHIFT LT 1.526', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed435' :  spectrum = {which:'pzmed435', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
                               border:2, lal:16900.0, lau:17700.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.618', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed448' :  spectrum = {which:'pzmed448', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed449' :  spectrum = {which:'pzmed449', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed451' :  spectrum = {which:'pzmed451', basename:'xmm113_mask8_v1_H', fitto:['OIIIr','OIIIb','Hb'], $
                               border:2, lal:16500.0, lau:17200.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=2.427', 'sig=3.5', 'c1=1.0', 'c2=0.30', 'c3=0.60', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.422', 'REDSHIFT LT 2.432', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed466' :  spectrum = {which:'pzmed466', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15000.0, lau:15700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.303', 'sig=3.5', 'c1=0.4', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.297', 'REDSHIFT LT 1.307', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed493' :  spectrum = {which:'pzmed493', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.634', 'sig=3.5', 'c1=0.4', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed614' :  spectrum = {which:'pzmed614', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed618' :  spectrum = {which:'pzmed618', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.568', 'sig=3.5', 'c1=1.0', 'c2=0.30', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.563', 'REDSHIFT LT 1.573', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed619' :  spectrum = {which:'pzmed619', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16400.0, lau:17100.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.519', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.514', 'REDSHIFT LT 1.524', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed628' :  spectrum = {which:'pzmed628', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.567', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.562', 'REDSHIFT LT 1.572', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed695' :  spectrum = {which:'pzmed695', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed716' :  spectrum = {which:'pzmed716', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed731' :  spectrum = {which:'pzmed731', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed752' :  spectrum = {which:'pzmed752', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17550.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.643', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.638', 'REDSHIFT LT 1.648', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed761' :  spectrum = {which:'pzmed761', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17600.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.647', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.642', 'REDSHIFT LT 1.652', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed789' :  spectrum = {which:'pzmed789', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15800.0, lau:16500.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.427', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.422', 'REDSHIFT LT 1.432', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed794' :  spectrum = {which:'pzmed794', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:16700.0, lau:17400.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.573', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.568', 'REDSHIFT LT 1.578', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'st18' :  spectrum = {which:'st18', basename:'xmm113_mask8_v1_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:15100.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                           initgss:['redshift=0.0002', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
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



