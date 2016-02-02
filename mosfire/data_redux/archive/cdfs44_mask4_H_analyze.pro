;========================================================================================================================
function cdfs44_mask4_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'bcsbs107' :  spectrum = {which:'bcsbs107', dfile:'CDFS44_mask4_1.0_H_bcsbs107_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15800.0, lau:17000.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.517', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.512', 'REDSHIFT LT 1.522', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bcsbs112' :  spectrum = {which:'bcsbs112', dfile:'CDFS44_mask4_1.0_H_bcsbs112_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16800.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.582', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.576', 'REDSHIFT LT 1.586', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bcsbs131' :  spectrum = {which:'bcsbs131', dfile:'CDFS44_mask4_1.0_H_bcsbs131_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15100.0, lau:15500.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.304', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.300', 'REDSHIFT LT 1.310', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bcsbs23' :  spectrum = {which:'bcsbs23', dfile:'CDFS44_mask4_1.0_H_bcsbs23_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17000.0, lau:17600.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.631', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs48' :  spectrum = {which:'bcsbs48', dfile:'CDFS44_mask4_1.0_H_bcsbs48_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15800.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bcsbs53' :  spectrum = {which:'bcsbs53', dfile:'CDFS44_mask4_1.0_H_bcsbs53_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15000.0, lau:16000.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.370', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.365', 'REDSHIFT LT 1.375', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs58' :  spectrum = {which:'bcsbs58', dfile:'CDFS44_mask4_1.0_H_bcsbs58_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17400.0, lau:18100.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.713', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.708', 'REDSHIFT LT 1.718', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs67' :  spectrum = {which:'bcsbs67', dfile:'CDFS44_mask4_1.0_H_bcsbs67_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16400.0, lau:17000.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.527', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.522', 'REDSHIFT LT 1.532', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs72' :  spectrum = {which:'bcsbs72', dfile:'CDFS44_mask4_1.0_H_bcsbs72_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15300.0, lau:15900.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.357', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.352', 'REDSHIFT LT 1.362', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs74' :  spectrum = {which:'bcsbs74', dfile:'CDFS44_mask4_1.0_H_bcsbs74_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.594', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.589', 'REDSHIFT LT 1.599', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bcsbs76' :  spectrum = {which:'bcsbs76', dfile:'CDFS44_mask4_1.0_H_bcsbs76_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:14900.0, lau:15700.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.327', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.322', 'REDSHIFT LT 1.332', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbs0' :  spectrum = {which:'bsbs0', dfile:'CDFS44_mask4_1.0_H_bsbs0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16800.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.589', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.584', 'REDSHIFT LT 1.594', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl0' :  spectrum = {which:'cl0', dfile:'CDFS44_mask4_1.0_H_cl0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:17000.0, lau:17600.0, QFLAG:2, NOFITSKY:0, $
                          guess:['redshift=1.61500', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.610', 'REDSHIFT LT 1.620', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs147' :  spectrum = {which:'msbs147', dfile:'CDFS44_mask4_1.0_H_msbs147_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16100.0, lau:16700.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.482', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.477', 'REDSHIFT LT 1.487', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbs149' :  spectrum = {which:'msbs149', dfile:'CDFS44_mask4_1.0_H_msbs149_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16700.0, lau:17300.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.564', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.559', 'REDSHIFT LT 1.569', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs214' :  spectrum = {which:'msbs214', dfile:'CDFS44_mask4_1.0_H_msbs214_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15900.0, lau:16500.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.452', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.447', 'REDSHIFT LT 1.457', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs4' :  spectrum = {which:'msbs4', dfile:'CDFS44_mask4_1.0_H_msbs4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:17200.0, lau:17800.0, QFLAG:3, NOFITSKY:0, $
                            guess:['redshift=1.648', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.643', 'REDSHIFT LT 1.653', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'nby7' :  spectrum = {which:'nby7', dfile:'CDFS44_mask4_1.0_H_nby7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16200.0, lau:16800.0, QFLAG:-1, NOFITSKY:0, $
                           guess:['redshift=1.494', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.489', 'REDSHIFT LT 1.499', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs3' :  spectrum = {which:'pzbsbs3', dfile:'CDFS44_mask4_1.0_H_pzbsbs3_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15800.0, lau:16400.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.3', 'x1=-0.002' ], $
                              priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs105' :  spectrum = {which:'pzfsbs105', dfile:'CDFS44_mask4_1.0_H_pzfsbs105_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15250.0, lau:16100.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.354', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.350', 'REDSHIFT LT 1.360', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs114' :  spectrum = {which:'pzfsbs114', dfile:'CDFS44_mask4_1.0_H_pzfsbs114_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15800.0, lau:16400.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs120' :  spectrum = {which:'pzfsbs120', dfile:'CDFS44_mask4_1.0_H_pzfsbs120_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16300.0, lau:16900.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.509', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.504', 'REDSHIFT LT 1.514', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs133' :  spectrum = {which:'pzfsbs133', dfile:'CDFS44_mask4_1.0_H_pzfsbs133_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16100.0, lau:16700.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.469', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.464', 'REDSHIFT LT 1.474', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs136' :  spectrum = {which:'pzfsbs136', dfile:'CDFS44_mask4_1.0_H_pzfsbs136_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17800.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.657', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.652', 'REDSHIFT LT 1.662', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs142' :  spectrum = {which:'pzfsbs142', dfile:'CDFS44_mask4_1.0_H_pzfsbs142_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17000.0, lau:17600.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.611', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs157' :  spectrum = {which:'pzfsbs157', dfile:'CDFS44_mask4_1.0_H_pzfsbs157_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs170' :  spectrum = {which:'pzfsbs170', dfile:'CDFS44_mask4_1.0_H_pzfsbs170_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16500.0, lau:17100.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.536', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs33' :  spectrum = {which:'pzfsbs33', dfile:'CDFS44_mask4_1.0_H_pzfsbs33_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16200.0, lau:16800.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.494', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.489', 'REDSHIFT LT 1.499', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs65' :  spectrum = {which:'pzfsbs65', dfile:'CDFS44_mask4_1.0_H_pzfsbs65_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16200.0, lau:16800.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.488', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.483', 'REDSHIFT LT 1.498', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs77' :  spectrum = {which:'pzfsbs77', dfile:'CDFS44_mask4_1.0_H_pzfsbs77_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:14550.0, lau:15100.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.247', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.242', 'REDSHIFT LT 1.252', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs85' :  spectrum = {which:'pzfsbs85', dfile:'CDFS44_mask4_1.0_H_pzfsbs85_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15400.0, lau:16400.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.391', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.386', 'REDSHIFT LT 1.396', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs11' :  spectrum = {which:'pzmsbs11', dfile:'CDFS44_mask4_1.0_H_pzmsbs11_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15400.0, lau:16400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs61' :  spectrum = {which:'pzmsbs61', dfile:'CDFS44_mask4_1.0_H_pzmsbs61_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17500.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.599', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.594', 'REDSHIFT LT 1.604', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs77' :  spectrum = {which:'pzmsbs77', dfile:'CDFS44_mask4_1.0_H_pzmsbs77_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16200.0, lau:16800.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.488', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.483', 'REDSHIFT LT 1.493', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 




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
pro cdfs44_mask4_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = cdfs44_mask4_H_analyze_settings(which[zz])                                  ;get settings
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
  


