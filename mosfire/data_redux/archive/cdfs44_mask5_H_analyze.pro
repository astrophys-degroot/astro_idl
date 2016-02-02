;========================================================================================================================
function cdfs44_mask5_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
 
     'pzhi29' :  spectrum = {which:'pzhi29', dfile:'cdfs44_mask5_v2_H_pzhi29_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi31' :  spectrum = {which:'pzhi31', dfile:'cdfs44_mask5_v2_H_pzhi31_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb' ,'SIIb', 'SIIr'], border:2, $
                             lal:16000.0, lau:16600.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=1.458', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.453', 'REDSHIFT LT 1.463', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzhi36' :  spectrum = {which:'pzhi36', dfile:'cdfs44_mask5_v2_H_pzhi36_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16300.0, lau:16900.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.504', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.509', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi39' :  spectrum = {which:'pzhi39', dfile:'cdfs44_mask5_v2_H_pzhi39_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:17100.0, lau:17500.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.634', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi52' :  spectrum = {which:'pzhi52', dfile:'cdfs44_mask5_v2_H_pzhi52_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15600.0, lau:16200.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.420', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.415', 'REDSHIFT LT 1.425', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi59' :  spectrum = {which:'pzhi59', dfile:'cdfs44_mask5_v2_H_pzhi59_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16100.0, lau:16700.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.487', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.482', 'REDSHIFT LT 1.492', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi60' :  spectrum = {which:'pzhi60', dfile:'cdfs44_mask5_v2_H_pzhi60_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16800.0, lau:17200.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.574', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.569', 'REDSHIFT LT 1.579', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi62' :  spectrum = {which:'pzhi62', dfile:'cdfs44_mask5_v2_H_pzhi62_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:17000.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.618', 'sig=3.5', 'c1=0.6', 'c2=0.3', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi64' :  spectrum = {which:'pzhi64', dfile:'cdfs44_mask5_v2_H_pzhi64_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16200.0, lau:16600.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.495', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.490', 'REDSHIFT LT 1.500', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi67' :  spectrum = {which:'pzhi67', dfile:'cdfs44_mask5_v2_H_pzhi67_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15200.0, lau:15600.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.341', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.336', 'REDSHIFT LT 1.346', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi71' :  spectrum = {which:'pzhi71', dfile:'cdfs44_mask5_v2_H_pzhi71_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi72' :  spectrum = {which:'pzhi72', dfile:'cdfs44_mask5_v2_H_pzhi72_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi76' :  spectrum = {which:'pzhi76', dfile:'cdfs44_mask5_v2_H_pzhi76_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16000.0, lau:16600.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.464', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.459', 'REDSHIFT LT 1.469', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi77' :  spectrum = {which:'pzhi77', dfile:'cdfs44_mask5_v2_H_pzhi77_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi79' :  spectrum = {which:'pzhi79', dfile:'cdfs44_mask5_v2_H_pzhi79_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16400.0, lau:17000.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.524', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.520', 'REDSHIFT LT 1.528', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi80' :  spectrum = {which:'pzhi80', dfile:'cdfs44_mask5_v2_H_pzhi80_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi88' :  spectrum = {which:'pzhi88', dfile:'cdfs44_mask5_v2_H_pzhi88_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16200.0, lau:16800.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.494', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.490', 'REDSHIFT LT 1.498', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi91' :  spectrum = {which:'pzhi91', dfile:'cdfs44_mask5_v2_H_pzhi91_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi95' :  spectrum = {which:'pzhi95', dfile:'cdfs44_mask5_v2_H_pzhi95_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15300.0, lau:15700.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.352', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.347', 'REDSHIFT LT 1.357', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi97' :  spectrum = {which:'pzhi97', dfile:'cdfs44_mask5_v2_H_pzhi97_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzlow1816' :  spectrum = {which:'pzlow1816', dfile:'cdfs44_mask5_v2_H_pzlow1816_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15200.0, lau:15600.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.341', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.336', 'REDSHIFT LT 1.346', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed1052' :  spectrum = {which:'pzmed1052', dfile:'cdfs44_mask5_v2_H_pzmed1052_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed1085' :  spectrum = {which:'pzmed1085', dfile:'cdfs44_mask5_v2_H_pzmed1085_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed1095' :  spectrum = {which:'pzmed1095', dfile:'cdfs44_mask5_v2_H_pzmed1095_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15200.0, lau:15800.0, QFLAG:1, NOFITSKY:0, $
                                guess:['redshift=1.334', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.330', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed1102' :  spectrum = {which:'pzmed1102', dfile:'cdfs44_mask5_v2_H_pzmed1102_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed1139' :  spectrum = {which:'pzmed1139', dfile:'cdfs44_mask5_v2_H_pzmed1139_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed1193' :  spectrum = {which:'pzmed1193', dfile:'cdfs44_mask5_v2_H_pzmed1193_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17100.0, lau:17500.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.626', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.618', 'REDSHIFT LT 1.628', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed1229' :  spectrum = {which:'pzmed1229', dfile:'cdfs44_mask5_v2_H_pzmed1229_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed303' :  spectrum = {which:'pzmed303', dfile:'cdfs44_mask5_v2_H_pzmed303_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed370' :  spectrum = {which:'pzmed370', dfile:'cdfs44_mask5_v2_H_pzmed370_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed446' :  spectrum = {which:'pzmed446', dfile:'cdfs44_mask5_v2_H_pzmed446_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16200.0, lau:16800.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.503', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.508', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed478' :  spectrum = {which:'pzmed478', dfile:'cdfs44_mask5_v2_H_pzmed478_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed552' :  spectrum = {which:'pzmed552', dfile:'cdfs44_mask5_v2_H_pzmed552_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed577' :  spectrum = {which:'pzmed577', dfile:'cdfs44_mask5_v2_H_pzmed577_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed602' :  spectrum = {which:'pzmed602', dfile:'cdfs44_mask5_v2_H_pzmed602_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16300.0, lau:16900.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.502', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.497', 'REDSHIFT LT 1.507', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed607' :  spectrum = {which:'pzmed607', dfile:'cdfs44_mask5_v2_H_pzmed607_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed909' :  spectrum = {which:'pzmed909', dfile:'cdfs44_mask5_v2_H_pzmed909_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed946' :  spectrum = {which:'pzmed946', dfile:'cdfs44_mask5_v2_H_pzmed946_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.536', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'spzg98' :  spectrum = {which:'spzg98', dfile:'cdfs44_mask5_v2_H_spzg98_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'st31' :  spectrum = {which:'st31', dfile:'cdfs44_mask5_v2_H_st31_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
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
pro cdfs44_mask5_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = ''                                                   ;
  outdir = indir                                               ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['HEY']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = cdfs44_mask5_H_analyze_settings(which[zz])                                  ;get settings
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
  


