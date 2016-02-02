;========================================================================================================================
FUNCTION cdfs44_mask5_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITGSS TO 0.0!!!
  
  CASE xwhich OF
 
     'pzhi29' :  spectrum = {which:'pzhi29', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi31' :  spectrum = {which:'pzhi31', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb','SIIb', 'SIIr'], $
                             border:2, lal:16000.0, lau:16600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.458', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.453', 'REDSHIFT LT 1.463', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
    
     'pzhi36' :  spectrum = {which:'pzhi36', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb','SIIb', 'SIIr'], $
                            border:2, lal:16300.0, lau:16900.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.504', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.509', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi39' :  spectrum = {which:'pzhi39', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:17100.0, lau:17500.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.634', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi52' :  spectrum = {which:'pzhi52', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:15600.0, lau:16200.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.420', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.415', 'REDSHIFT LT 1.425', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi59' :  spectrum = {which:'pzhi59', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16100.0, lau:16700.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.487', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.482', 'REDSHIFT LT 1.492', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi60' :  spectrum = {which:'pzhi60', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16800.0, lau:17200.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.574', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.569', 'REDSHIFT LT 1.579', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi62' :  spectrum = {which:'pzhi62', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:17000.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.618', 'sig=3.5', 'c1=0.6', 'c2=0.3', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi64' :  spectrum = {which:'pzhi64', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16200.0, lau:16600.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.495', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.490', 'REDSHIFT LT 1.500', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi67' :  spectrum = {which:'pzhi67', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:15200.0, lau:15600.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.341', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.336', 'REDSHIFT LT 1.346', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi71' :  spectrum = {which:'pzhi71', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi72' :  spectrum = {which:'pzhi72', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi76' :  spectrum = {which:'pzhi76', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16000.0, lau:16600.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.464', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.459', 'REDSHIFT LT 1.469', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi77' :  spectrum = {which:'pzhi77', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi79' :  spectrum = {which:'pzhi79', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16400.0, lau:17000.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.524', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.520', 'REDSHIFT LT 1.528', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi80' :  spectrum = {which:'pzhi80', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi88' :  spectrum = {which:'pzhi88', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16200.0, lau:16800.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.494', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.490', 'REDSHIFT LT 1.498', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi91' :  spectrum = {which:'pzhi91', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi95' :  spectrum = {which:'pzhi95', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:15300.0, lau:15700.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.352', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.347', 'REDSHIFT LT 1.357', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi97' :  spectrum = {which:'pzhi97', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzlow1816' :  spectrum = {which:'pzlow1816', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15200.0, lau:15600.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.341', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.336', 'REDSHIFT LT 1.346', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed1052' :  spectrum = {which:'pzmed1052', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed1085' :  spectrum = {which:'pzmed1085', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed1095' :  spectrum = {which:'pzmed1095', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15200.0, lau:15800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.334', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.330', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed1102' :  spectrum = {which:'pzmed1102', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed1139' :  spectrum = {which:'pzmed1139', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed1193' :  spectrum = {which:'pzmed1193', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17300.0, lau:18000.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.689', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.684', 'REDSHIFT LT 1.694', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed1229' :  spectrum = {which:'pzmed1229', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, ZQFLAG:'-3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed303' :  spectrum = {which:'pzmed303', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed370' :  spectrum = {which:'pzmed370', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed446' :  spectrum = {which:'pzmed446', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16200.0, lau:16800.0, QFLAG:1, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.503', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.508', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed478' :  spectrum = {which:'pzmed478', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed552' :  spectrum = {which:'pzmed552', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed577' :  spectrum = {which:'pzmed577', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed602' :  spectrum = {which:'pzmed602', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16300.0, lau:16900.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.502', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.497', 'REDSHIFT LT 1.507', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed607' :  spectrum = {which:'pzmed607', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15700.0, lau:16400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.444', 'sig=3.5', 'c1=0.2', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.441', 'REDSHIFT LT 1.451', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed909' :  spectrum = {which:'pzmed909', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed946' :  spectrum = {which:'pzmed946', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17100.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.536', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'spzg98' :  spectrum = {which:'spzg98', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0,  ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'st31' :  spectrum = {which:'st31', basename:'cdfs44_mask5_v2_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17400.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     

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




  


