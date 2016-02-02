;========================================================================================================================
function xmm113_mask2_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITGSS TO 0.0!!!
  ;;;Initial guesses listed first take precendence
  
  CASE xwhich OF
     'bsbs4' :  spectrum = {which:'bsbs4', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:17000.0, lau:17500.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                            initgss:['redshift=1.632', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bsbs52' :  spectrum = {which:'bsbs52', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bsbs58' :  spectrum = {which:'bsbs58', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:17100.0, lau:17600.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.642', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.637', 'REDSHIFT LT 1.647', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bsbs5' :  spectrum = {which:'bsbs5', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16600.0, lau:17200.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                            initgss:['redshift=1.571', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.7', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl0' :  spectrum = {which:'cl0', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.634', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl2' :  spectrum = {which:'cl2', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                          border:2, lal:17000.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.631', 'sig=6.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'cl4' :  spectrum = {which:'cl4', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:16900.0, lau:17500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.634', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.5', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl7' :  spectrum = {which:'cl7', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                          border:2, lal:17100.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.635', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.3', 'x1=-0.001' ], $
                          priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbs10' :  spectrum = {which:'fsbs10', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:17200.0, lau:18000.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.709', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.704', 'REDSHIFT LT 1.714', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbs9' :  spectrum = {which:'fsbs9', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                            initgss:['redshift=1.611', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs10' :  spectrum = {which:'msbs10', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16000.0, lau:16600.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.468', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.463', 'REDSHIFT LT 1.473', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs12' :  spectrum = {which:'msbs12', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16700.0, lau:17300.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.576', 'sig=3.5', 'c1=0.5', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.571', 'REDSHIFT LT 1.581', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs17' :  spectrum = {which:'msbs17', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.632', 'sig=3.5', 'c1=0.5', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.627', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs397' :  spectrum = {which:'msbs397', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17300.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs410' :  spectrum = {which:'msbs410', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs467' :  spectrum = {which:'msbs467', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs477' :  spectrum = {which:'msbs477', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16400.0, lau:17200.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                              initgss:['redshift=1.569', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.5', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'new2' :  spectrum = {which:'new2', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:15300.0, lau:15900.0, QFLAG:3, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                           initgss:['redshift=1.364', 'sig=3.5', 'c1=0.5', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.359', 'REDSHIFT LT 1.369', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'new3' :  spectrum = {which:'new3', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17400.0, QFLAG:1, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                           initgss:['redshift=1.634', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs35' :  spectrum = {which:'pzfsbs35', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs0' :  spectrum = {which:'pzmsbs0', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIr', 'SIIb'], $
                              border:2, lal:16200.0, lau:17000.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                              initgss:['redshift=1.522', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.25', 'c5=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.517', 'REDSHIFT LT 1.527', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs14' :  spectrum = {which:'pzmsbs14', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17100.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.634', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.629', 'REDSHIFT LT 1.639', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs19' :  spectrum = {which:'pzmsbs19', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs26' :  spectrum = {which:'pzmsbs26', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15050.0, lau:15600.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.335', 'sig=3.5', 'c1=0.8', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.330', 'REDSHIFT LT 1.340', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs27' :  spectrum = {which:'pzmsbs27', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17600.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.637', 'sig=3.5', 'c1=0.8', 'c2=0.30', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.632', 'REDSHIFT LT 1.642', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs31' :  spectrum = {which:'pzmsbs31', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs39' :  spectrum = {which:'pzmsbs39', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16500.0, lau:17100.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.557', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.552', 'REDSHIFT LT 1.562', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs42' :  spectrum = {which:'pzmsbs42', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16100.0, lau:16700.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.487', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.482', 'REDSHIFT LT 1.492', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs43' :  spectrum = {which:'pzmsbs43', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIr', 'SIIb'], $
                               border:2, lal:17000.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.629', 'sig=3.5', 'c1=1.0', 'c2=0.50',  'c4=0.20',  'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.634', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs44' :  spectrum = {which:'pzmsbs44', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17400.0, lau:18000.0,ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.711', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.706', 'REDSHIFT LT 1.716', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs47' :  spectrum = {which:'pzmsbs47', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16600.0, lau:17200.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.569', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs51' :  spectrum = {which:'pzmsbs51', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, QFLAG:3, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.613', 'sig=3.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.608', 'REDSHIFT LT 1.618', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs52' :  spectrum = {which:'pzmsbs52', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs63' :  spectrum = {which:'pzmsbs63', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17300.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs80' :  spectrum = {which:'pzmsbs80', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17300.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.569', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs86' :  spectrum = {which:'pzmsbs86', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.633', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.628', 'REDSHIFT LT 1.638', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'scist5' :  spectrum = {which:'scist5', basename:'XMM113_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=0.0001', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 0.0000001', 'REDSHIFT LT0.0005', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     


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

