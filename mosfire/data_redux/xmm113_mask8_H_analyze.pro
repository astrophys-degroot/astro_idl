;========================================================================================================================
function xmm113_mask8_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF

     'pzhi31' :  spectrum = {which:'pzhi31', dfile:'xmm113_mask8_v1_H_pzhi31_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16300.0, lau:16900.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.521', 'sig=3.5', 'c1=1.5', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.516', 'REDSHIFT LT 1.526', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi35' :  spectrum = {which:'pzhi35', dfile:'xmm113_mask8_v1_H_pzhi35_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi36' :  spectrum = {which:'pzhi36', dfile:'xmm113_mask8_v1_H_pzhi36_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                             lal:16000.0, lau:16700.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.467', 'sig=3.5', 'c1=2.0', 'c2=1.0', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.462', 'REDSHIFT LT 1.472', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzhi40' :  spectrum = {which:'pzhi40', dfile:'xmm113_mask8_v1_H_pzhi40_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:2, NOFITSKY:2, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi44' :  spectrum = {which:'pzhi44', dfile:'xmm113_mask8_v1_H_pzhi44_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16700.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.568', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.563', 'REDSHIFT LT 1.573', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi46' :  spectrum = {which:'pzhi46', dfile:'xmm113_mask8_v1_H_pzhi46_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15800.0, lau:16500.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.440', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.435', 'REDSHIFT LT 1.445', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi48' :  spectrum = {which:'pzhi48', dfile:'xmm113_mask8_v1_H_pzhi48_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16600.0, lau:17300.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.566', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.561', 'REDSHIFT LT 1.571', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi49' :  spectrum = {which:'pzhi49', dfile:'xmm113_mask8_v1_H_pzhi49_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi54' :  spectrum = {which:'pzhi54', dfile:'xmm113_mask8_v1_H_pzhi54_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16800.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.636', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.631', 'REDSHIFT LT 1.641', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi55' :  spectrum = {which:'pzhi55', dfile:'xmm113_mask8_v1_H_pzhi55_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                             lal:17100.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.641', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.636', 'REDSHIFT LT 1.646', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'pzhi56' :  spectrum = {which:'pzhi56', dfile:'xmm113_mask8_v1_H_pzhi56_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi57' :  spectrum = {which:'pzhi57', dfile:'xmm113_mask8_v1_H_pzhi57_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                             lal:16000.0, lau:16700.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.467', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.461', 'REDSHIFT LT 1.471', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzhi58' :  spectrum = {which:'pzhi58', dfile:'xmm113_mask8_v1_H_pzhi58_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                             lal:17100.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.632', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzhi60' :  spectrum = {which:'pzhi60', dfile:'xmm113_mask8_v1_H_pzhi60_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.630', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.635', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi61' :  spectrum = {which:'pzhi61', dfile:'xmm113_mask8_v1_H_pzhi61_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                             lal:16500.0, lau:17200.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.537', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.532', 'REDSHIFT LT 1.542', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzhi62' :  spectrum = {which:'pzhi62', dfile:'xmm113_mask8_v1_H_pzhi62_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:17000.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzlow2090' :  spectrum = {which:'pzlow2090', dfile:'xmm113_mask8_v1_H_pzlow2090_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed331' :  spectrum = {which:'pzmed331', dfile:'xmm113_mask8_v1_H_pzmed331_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                               lal:16400.0, lau:17100.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.521', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.516', 'REDSHIFT LT 1.526', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'pzmed435' :  spectrum = {which:'pzmed435', dfile:'xmm113_mask8_v1_H_pzmed435_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17600.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.618', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed448' :  spectrum = {which:'pzmed448', dfile:'xmm113_mask8_v1_H_pzmed448_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed449' :  spectrum = {which:'pzmed449', dfile:'xmm113_mask8_v1_H_pzmed449_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed451' :  spectrum = {which:'pzmed451', dfile:'xmm113_mask8_v1_H_pzmed451_eps_1d_v10.fits', fitto:['OIIIr','OIIIb','Hb'], border:2, $
                               lal:16500.0, lau:17200.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.427', 'sig=3.5', 'c1=1.0', 'c2=0.30', 'c3=0.60', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.422', 'REDSHIFT LT 2.432', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'pzmed466' :  spectrum = {which:'pzmed466', dfile:'xmm113_mask8_v1_H_pzmed466_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15000.0, lau:15700.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.303', 'sig=3.5', 'c1=0.4', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.297', 'REDSHIFT LT 1.307', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed493' :  spectrum = {which:'pzmed493', dfile:'xmm113_mask8_v1_H_pzmed493_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17700.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.634', 'sig=3.5', 'c1=0.4', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed614' :  spectrum = {which:'pzmed614', dfile:'xmm113_mask8_v1_H_pzmed614_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed618' :  spectrum = {which:'pzmed618', dfile:'xmm113_mask8_v1_H_pzmed618_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.568', 'sig=3.5', 'c1=1.0', 'c2=0.30', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.563', 'REDSHIFT LT 1.573', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed619' :  spectrum = {which:'pzmed619', dfile:'xmm113_mask8_v1_H_pzmed619_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16400.0, lau:17100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.519', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.514', 'REDSHIFT LT 1.524', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed628' :  spectrum = {which:'pzmed628', dfile:'xmm113_mask8_v1_H_pzmed628_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.567', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.562', 'REDSHIFT LT 1.572', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed695' :  spectrum = {which:'pzmed695', dfile:'xmm113_mask8_v1_H_pzmed695_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed716' :  spectrum = {which:'pzmed716', dfile:'xmm113_mask8_v1_H_pzmed716_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:99, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
 
     'pzmed731' :  spectrum = {which:'pzmed731', dfile:'xmm113_mask8_v1_H_pzmed731_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed752' :  spectrum = {which:'pzmed752', dfile:'xmm113_mask8_v1_H_pzmed752_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17550.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.643', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.638', 'REDSHIFT LT 1.648', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed761' :  spectrum = {which:'pzmed761', dfile:'xmm113_mask8_v1_H_pzmed761_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17600.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.647', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.642', 'REDSHIFT LT 1.652', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed789' :  spectrum = {which:'pzmed789', dfile:'xmm113_mask8_v1_H_pzmed789_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15800.0, lau:16500.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.427', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.422', 'REDSHIFT LT 1.432', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed794' :  spectrum = {which:'pzmed794', dfile:'xmm113_mask8_v1_H_pzmed794_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.573', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.568', 'REDSHIFT LT 1.578', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'st18' :  spectrum = {which:'st18', dfile:'xmm113_mask8_v1_H_st18_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:15100.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
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
pro xmm113_mask8_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = ''                                                   ;
  outdir = indir                                               ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  
  IF which[0] EQ 'all' THEN which = []

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = xmm113_mask8_H_analyze_settings(which[zz])                                  ;get settings
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
  


