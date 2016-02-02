;========================================================================================================================
function cdfs44_mask4_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUESS TO 0.0!!!
  
  CASE xwhich OF
     'bcsbs107' :  spectrum = {which:'bcsbs107', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15800.0, lau:17000.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.517', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.512', 'REDSHIFT LT 1.522', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs112' :  spectrum = {which:'bcsbs112', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16800.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.582', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.576', 'REDSHIFT LT 1.586', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs131' :  spectrum = {which:'bcsbs131', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15100.0, lau:15500.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.304', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.300', 'REDSHIFT LT 1.310', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs23' :  spectrum = {which:'bcsbs23', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:17000.0, lau:17600.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.631', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs48' :  spectrum = {which:'bcsbs48', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:15700.0, lau:16400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs53' :  spectrum = {which:'bcsbs53', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15000.0, lau:16000.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.370', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.365', 'REDSHIFT LT 1.375', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'bcsbs58' :  spectrum = {which:'bcsbs58', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:17400.0, lau:18100.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.713', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.708', 'REDSHIFT LT 1.718', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs67' :  spectrum = {which:'bcsbs67', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16400.0, lau:17000.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.527', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.522', 'REDSHIFT LT 1.532', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs72' :  spectrum = {which:'bcsbs72', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15300.0, lau:15900.0, QFLAG:-1, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.357', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.352', 'REDSHIFT LT 1.362', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'bcsbs74' :  spectrum = {which:'bcsbs74', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.594', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.589', 'REDSHIFT LT 1.599', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs76' :  spectrum = {which:'bcsbs76', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:14900.0, lau:15700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.327', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.322', 'REDSHIFT LT 1.332', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bsbs0' :  spectrum = {which:'bsbs0', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16800.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                            initgss:['redshift=1.589', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.584', 'REDSHIFT LT 1.594', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl0' :  spectrum = {which:'cl0', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:17000.0, lau:17600.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                          initgss:['redshift=1.61500', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.610', 'REDSHIFT LT 1.620', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs147' :  spectrum = {which:'msbs147', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16100.0, lau:16700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.482', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.477', 'REDSHIFT LT 1.487', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs149' :  spectrum = {which:'msbs149', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16700.0, lau:17300.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.564', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.559', 'REDSHIFT LT 1.569', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs214' :  spectrum = {which:'msbs214', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:15900.0, lau:16500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.452', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.447', 'REDSHIFT LT 1.457', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs4' :  spectrum = {which:'msbs4', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:17200.0, lau:17800.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                            initgss:['redshift=1.648', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.643', 'REDSHIFT LT 1.653', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'nby7' :  spectrum = {which:'nby7', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16200.0, lau:16800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                           initgss:['redshift=1.494', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.489', 'REDSHIFT LT 1.499', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs3' :  spectrum = {which:'pzbsbs3', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:15800.0, lau:16400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                              initgss:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.3', 'x1=-0.002' ], $
                              priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs105' :  spectrum = {which:'pzfsbs105', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2,  lal:15250.0, lau:16100.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                                initgss:['redshift=1.354', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.350', 'REDSHIFT LT 1.360', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs114' :  spectrum = {which:'pzfsbs114', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2,  lal:15800.0, lau:16400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                                initgss:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs120' :  spectrum = {which:'pzfsbs120', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2,  lal:16300.0, lau:16900.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                                initgss:['redshift=1.509', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.504', 'REDSHIFT LT 1.514', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs133' :  spectrum = {which:'pzfsbs133', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2,  lal:16100.0, lau:16700.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                                initgss:['redshift=1.469', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.464', 'REDSHIFT LT 1.474', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs136' :  spectrum = {which:'pzfsbs136', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2,  lal:16900.0, lau:17800.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                                initgss:['redshift=1.657', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.652', 'REDSHIFT LT 1.662', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs142' :  spectrum = {which:'pzfsbs142', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2,  lal:17000.0, lau:17600.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                                initgss:['redshift=1.611', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzfsbs157' :  spectrum = {which:'pzfsbs157', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2,  lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs170' :  spectrum = {which:'pzfsbs170', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2,  lal:16500.0, lau:17100.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                                initgss:['redshift=1.536', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs33' :  spectrum = {which:'pzfsbs33', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16200.0, lau:16800.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.494', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.489', 'REDSHIFT LT 1.499', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs65' :  spectrum = {which:'pzfsbs65', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16200.0, lau:16800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.488', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.483', 'REDSHIFT LT 1.498', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs77' :  spectrum = {which:'pzfsbs77', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:14550.0, lau:15100.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.247', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.242', 'REDSHIFT LT 1.252', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs85' :  spectrum = {which:'pzfsbs85', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15400.0, lau:16400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.391', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.386', 'REDSHIFT LT 1.396', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs11' :  spectrum = {which:'pzmsbs11', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15400.0, lau:16400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs61' :  spectrum = {which:'pzmsbs61', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16700.0, lau:17500.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.599', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.594', 'REDSHIFT LT 1.604', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs77' :  spectrum = {which:'pzmsbs77', basename:'CDFS44_mask4_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16200.0, lau:16800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $ $
                               initgss:['redshift=1.488', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.483', 'REDSHIFT LT 1.493', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     




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


