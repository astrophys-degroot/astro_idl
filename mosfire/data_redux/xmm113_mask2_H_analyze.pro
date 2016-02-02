;========================================================================================================================
function xmm113_mask2_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;Guesses listed first take precendence
  
  CASE xwhich OF
     'bsbs4' :  spectrum = {which:'bsbs4', dfile:'XMM113_mask2_1.0_H_bsbs4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:17000.0, lau:17500.0, QFLAG:3, NOFITSKY:0, $
                            guess:['redshift=1.632', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbs52' :  spectrum = {which:'bsbs52', dfile:'XMM113_mask2_1.0_H_bsbs52_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbs58' :  spectrum = {which:'bsbs58', dfile:'XMM113_mask2_1.0_H_bsbs58_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:17100.0, lau:17600.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.642', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.637', 'REDSHIFT LT 1.647', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbs5' :  spectrum = {which:'bsbs5', dfile:'XMM113_mask2_1.0_H_bsbs5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16600.0, lau:17200.0, QFLAG:2, NOFITSKY:0, $
                            guess:['redshift=1.571', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.7', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl0' :  spectrum = {which:'cl0', dfile:'XMM113_mask2_1.0_H_cl0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17400.0, QFLAG:0, NOFITSKY:0, $
                          guess:['redshift=1.634', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'cl2' :  spectrum = {which:'cl2', dfile:'XMM113_mask2_1.0_H_cl2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], border:2, $
                          lal:17000.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                          guess:['redshift=1.631', 'sig=6.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'cl4' :  spectrum = {which:'cl4', dfile:'XMM113_mask2_1.0_H_cl4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                          guess:['redshift=1.634', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.5', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl7' :  spectrum = {which:'cl7', dfile:'XMM113_mask2_1.0_H_cl7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], border:2, $
                          lal:17100.0, lau:17800.0, QFLAG:0, NOFITSKY:0, $
                          guess:['redshift=1.635', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.3', 'x1=-0.001' ], $
                          priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'fsbs10' :  spectrum = {which:'fsbs10', dfile:'XMM113_mask2_1.0_H_fsbs10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:17200.0, lau:18000.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.709', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.704', 'REDSHIFT LT 1.714', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbs9' :  spectrum = {which:'fsbs9', dfile:'XMM113_mask2_1.0_H_fsbs9_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.611', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbs10' :  spectrum = {which:'msbs10', dfile:'XMM113_mask2_1.0_H_msbs10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16000.0, lau:16600.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.468', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.463', 'REDSHIFT LT 1.473', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs12' :  spectrum = {which:'msbs12', dfile:'XMM113_mask2_1.0_H_msbs12_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16700.0, lau:17300.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.576', 'sig=3.5', 'c1=0.5', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.571', 'REDSHIFT LT 1.581', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbs17' :  spectrum = {which:'msbs17', dfile:'XMM113_mask2_1.0_H_msbs17_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.632', 'sig=3.5', 'c1=0.5', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs397' :  spectrum = {which:'msbs397', dfile:'XMM113_mask2_1.0_H_msbs397_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17300.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs410' :  spectrum = {which:'msbs410', dfile:'XMM113_mask2_1.0_H_msbs410_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs467' :  spectrum = {which:'msbs467', dfile:'XMM113_mask2_1.0_H_msbs467_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs477' :  spectrum = {which:'msbs477', dfile:'XMM113_mask2_1.0_H_msbs477_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16400.0, lau:17200.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.569', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.5', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'new2' :  spectrum = {which:'new2', dfile:'XMM113_mask2_1.0_H_new2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:15300.0, lau:15900.0, QFLAG:3, NOFITSKY:0, $
                           guess:['redshift=1.364', 'sig=3.5', 'c1=0.5', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.359', 'REDSHIFT LT 1.369', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'new3' :  spectrum = {which:'new3', dfile:'XMM113_mask2_1.0_H_new3_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                           guess:['redshift=1.634', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
     
     'pzfsbs35' :  spectrum = {which:'pzfsbs35', dfile:'XMM113_mask2_1.0_H_pzfsbs35_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs0' :  spectrum = {which:'pzmsbs0', dfile:'XMM113_mask2_1.0_H_pzmsbs0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr', 'SIIb'], border:2, $
                              lal:16200.0, lau:17000.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.522', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.25', 'c5=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.517', 'REDSHIFT LT 1.527', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzmsbs14' :  spectrum = {which:'pzmsbs14', dfile:'XMM113_mask2_1.0_H_pzmsbs14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17100.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.634', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs19' :  spectrum = {which:'pzmsbs19', dfile:'XMM113_mask2_1.0_H_pzmsbs19_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs26' :  spectrum = {which:'pzmsbs26', dfile:'XMM113_mask2_1.0_H_pzmsbs26_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15050.0, lau:15600.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.335', 'sig=3.5', 'c1=0.8', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.330', 'REDSHIFT LT 1.340', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs27' :  spectrum = {which:'pzmsbs27', dfile:'XMM113_mask2_1.0_H_pzmsbs27_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17600.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.637', 'sig=3.5', 'c1=0.8', 'c2=0.30', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.632', 'REDSHIFT LT 1.642', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs31' :  spectrum = {which:'pzmsbs31', dfile:'XMM113_mask2_1.0_H_pzmsbs31_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs39' :  spectrum = {which:'pzmsbs39', dfile:'XMM113_mask2_1.0_H_pzmsbs39_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17100.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.557', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.552', 'REDSHIFT LT 1.562', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs42' :  spectrum = {which:'pzmsbs42', dfile:'XMM113_mask2_1.0_H_pzmsbs42_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.487', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.482', 'REDSHIFT LT 1.492', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs43' :  spectrum = {which:'pzmsbs43', dfile:'XMM113_mask2_1.0_H_pzmsbs43_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr', 'SIIb'], border:2, $
                               lal:17000.0, lau:17800.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.629', 'sig=3.5', 'c1=1.0', 'c2=0.50',  'c4=0.20',  'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.634', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'pzmsbs44' :  spectrum = {which:'pzmsbs44', dfile:'XMM113_mask2_1.0_H_pzmsbs44_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:18000.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.711', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.706', 'REDSHIFT LT 1.716', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs47' :  spectrum = {which:'pzmsbs47', dfile:'XMM113_mask2_1.0_H_pzmsbs47_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16600.0, lau:17200.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.569', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs51' :  spectrum = {which:'pzmsbs51', dfile:'XMM113_mask2_1.0_H_pzmsbs51_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.613', 'sig=3.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.608', 'REDSHIFT LT 1.618', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs52' :  spectrum = {which:'pzmsbs52', dfile:'XMM113_mask2_1.0_H_pzmsbs52_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs63' :  spectrum = {which:'pzmsbs63', dfile:'XMM113_mask2_1.0_H_pzmsbs63_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17300.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs80' :  spectrum = {which:'pzmsbs80', dfile:'XMM113_mask2_1.0_H_pzmsbs80_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17300.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.569', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs86' :  spectrum = {which:'pzmsbs86', dfile:'XMM113_mask2_1.0_H_pzmsbs86_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.633', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.628', 'REDSHIFT LT 1.638', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'scist5' :  spectrum = {which:'scist5', dfile:'XMM113_mask2_1.0_H_scist5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:99, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
 


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
pro xmm113_mask2_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = xmm113_mask2_H_analyze_settings(which[zz])                                  ;get settings
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
  


