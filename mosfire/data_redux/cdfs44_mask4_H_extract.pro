;========================================================================================================================
function cdfs44_mask4_H_extract_settings, pick
  
  CASE pick OF 
 
     'bcsbs107' :  mask = {which:'bcsbs107', dfile:'CDFS44_mask4_1.0_H_bcsbs107_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs107_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_bcsbs107_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 2.0']}
     
     'bcsbs112' :  mask = {which:'bcsbs112', dfile:'CDFS44_mask4_1.0_H_bcsbs112_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs112_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_bcsbs112_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.5', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'bcsbs131' :  mask = {which:'bcsbs131', dfile:'CDFS44_mask4_1.0_H_bcsbs131_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs131_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_bcsbs131_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=35.2', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 30.0', 'MU LT 44.0', 'SIG GT 0.0']}
     
     'bcsbs23' :  mask = {which:'bcsbs23', dfile:'CDFS44_mask4_1.0_H_bcsbs23_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs23_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_bcsbs23_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.2', 'c=4.0', 'x0=-0.1', 'x1=-0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bcsbs48' :  mask = {which:'bcsbs48', dfile:'CDFS44_mask4_1.0_H_bcsbs48_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs48_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_bcsbs48_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=15.2', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 6.0', 'MU LT 16.0', 'SIG GT 1.0']}
 
     'bcsbs53' :  mask = {which:'bcsbs53', dfile:'CDFS44_mask4_1.0_H_bcsbs53_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs53_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_bcsbs53_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bcsbs58' :  mask = {which:'bcsbs58', dfile:'CDFS44_mask4_1.0_H_bcsbs58_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs58_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_bcsbs58_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=52.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'bcsbs67' :  mask = {which:'bcsbs67', dfile:'CDFS44_mask4_1.0_H_bcsbs67_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs67_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_bcsbs67_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bcsbs72' :  mask = {which:'bcsbs72', dfile:'CDFS44_mask4_1.0_H_bcsbs72_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs72_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_bcsbs72_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=24.8', 'sig=3.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bcsbs74' :  mask = {which:'bcsbs74', dfile:'CDFS44_mask4_1.0_H_bcsbs74_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs74_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_bcsbs74_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'bcsbs76' :  mask = {which:'bcsbs76', dfile:'CDFS44_mask4_1.0_H_bcsbs76_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs76_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_bcsbs76_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bcsbs79' :  mask = {which:'bcsbs79', dfile:'CDFS44_mask4_1.0_H_bcsbs79_eps.fits', wfile:'CDFS44_mask4_1.0_H_bcsbs79_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_bcsbs79_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'bsbs0' :  mask = {which:'bsbs0', dfile:'CDFS44_mask4_1.0_H_bsbs0_eps.fits', wfile:'CDFS44_mask4_1.0_H_bsbs0_sig.fits', $
                        rfile:'CDFS44_mask4_1.0_H_bsbs0_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                   xwhich:0, flip:0, $
                   guess:['mu=33.8', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                   priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'cl0' :  mask = {which:'cl0', dfile:'CDFS44_mask4_1.0_H_cl0_eps.fits', wfile:'CDFS44_mask4_1.0_H_cl0_sig.fits', $
                      rfile:'CDFS44_mask4_1.0_H_cl0_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_faint', $
                      xwhich:0, flip:0, $
                      guess:['mu=20.4', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbs147' :  mask = {which:'msbs147', dfile:'CDFS44_mask4_1.0_H_msbs147_eps.fits', wfile:'CDFS44_mask4_1.0_H_msbs147_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_msbs147_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=9.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs149' :  mask = {which:'msbs149', dfile:'CDFS44_mask4_1.0_H_msbs149_eps.fits', wfile:'CDFS44_mask4_1.0_H_msbs149_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_msbs149_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=19.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'msbs214' :  mask = {which:'msbs214', dfile:'CDFS44_mask4_1.0_H_msbs214_eps.fits', wfile:'CDFS44_mask4_1.0_H_msbs214_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_msbs214_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=3.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0', 'SIG LT 5.0']}
 
     'msbs4' :  mask = {which:'msbs4', dfile:'CDFS44_mask4_1.0_H_msbs4_eps.fits', wfile:'CDFS44_mask4_1.0_H_msbs4_sig.fits', $
                        rfile:'CDFS44_mask4_1.0_H_msbs4_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=47.3', 'sig=4.0', 'c=13.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 40.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'nby7' :  mask = {which:'nby7', dfile:'CDFS44_mask4_1.0_H_nby7_eps.fits', wfile:'CDFS44_mask4_1.0_H_nby7_sig.fits', $
                       rfile:'CDFS44_mask4_1.0_H_nby7_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_medium', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=24.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzbsbs3' :  mask = {which:'pzbsbs3', dfile:'CDFS44_mask4_1.0_H_pzbsbs3_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzbsbs3_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_pzbsbs3_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.0', 'c=140.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs105' :  mask = {which:'pzfsbs105', dfile:'CDFS44_mask4_1.0_H_pzfsbs105_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs105_sig.fits', $
                            rfile:'CDFS44_mask4_1.0_H_pzfsbs105_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=3.0', 'c=4.0', 'x0=-0.1', 'x1=0.01'], $
                            priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs114' :  mask = {which:'pzfsbs114', dfile:'CDFS44_mask4_1.0_H_pzfsbs114_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs114_sig.fits', $
                            rfile:'CDFS44_mask4_1.0_H_pzfsbs114_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs120' :  mask = {which:'pzfsbs120', dfile:'CDFS44_mask4_1.0_H_pzfsbs120_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs120_sig.fits', $
                            rfile:'CDFS44_mask4_1.0_H_pzfsbs120_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=41.5', 'sig=4.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                            priors:['MU GT 38.0', 'MU LT 54.0', 'SIG GT 0.0']}
 
     'pzfsbs133' :  mask = {which:'pzfsbs133', dfile:'CDFS44_mask4_1.0_H_pzfsbs133_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs133_sig.fits', $
                            rfile:'CDFS44_mask4_1.0_H_pzfsbs133_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs136' :  mask = {which:'pzfsbs136', dfile:'CDFS44_mask4_1.0_H_pzfsbs136_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs136_sig.fits', $
                            rfile:'CDFS44_mask4_1.0_H_pzfsbs136_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=9.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs142' :  mask = {which:'pzfsbs142', dfile:'CDFS44_mask4_1.0_H_pzfsbs142_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs142_sig.fits', $
                            rfile:'CDFS44_mask4_1.0_H_pzfsbs142_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs157' :  mask = {which:'pzfsbs157', dfile:'CDFS44_mask4_1.0_H_pzfsbs157_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs157_sig.fits', $
                            rfile:'CDFS44_mask4_1.0_H_pzfsbs157_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=62.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 50.0', 'MU LT 70.0', 'SIG GT 0.0']}
 
     'pzfsbs170' :  mask = {which:'pzfsbs170', dfile:'CDFS44_mask4_1.0_H_pzfsbs170_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs170_sig.fits', $
                            rfile:'CDFS44_mask4_1.0_H_pzfsbs170_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
     
'pzfsbs24' :  mask = {which:'pzfsbs24', dfile:'CDFS44_mask4_1.0_H_pzfsbs24_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs24_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzfsbs24_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs33' :  mask = {which:'pzfsbs33', dfile:'CDFS44_mask4_1.0_H_pzfsbs33_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs33_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzfsbs33_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=13.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'pzfsbs59' :  mask = {which:'pzfsbs59', dfile:'CDFS44_mask4_1.0_H_pzfsbs59_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs59_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzfsbs59_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzfsbs65' :  mask = {which:'pzfsbs65', dfile:'CDFS44_mask4_1.0_H_pzfsbs65_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs65_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzfsbs65_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 2.0']}
 
     'pzfsbs77' :  mask = {which:'pzfsbs77', dfile:'CDFS44_mask4_1.0_H_pzfsbs77_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs77_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzfsbs77_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs85' :  mask = {which:'pzfsbs85', dfile:'CDFS44_mask4_1.0_H_pzfsbs85_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzfsbs85_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzfsbs85_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=3.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmsbs11' :  mask = {which:'pzmsbs11', dfile:'CDFS44_mask4_1.0_H_pzmsbs11_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzmsbs11_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzmsbs11_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs24' :  mask = {which:'pzmsbs24', dfile:'CDFS44_mask4_1.0_H_pzmsbs24_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzmsbs24_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzmsbs24_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs61' :  mask = {which:'pzmsbs61', dfile:'CDFS44_mask4_1.0_H_pzmsbs61_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzmsbs61_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzmsbs61_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs77' :  mask = {which:'pzmsbs77', dfile:'CDFS44_mask4_1.0_H_pzmsbs77_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzmsbs77_sig.fits', $
                           rfile:'CDFS44_mask4_1.0_H_pzmsbs77_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs7' :  mask = {which:'pzmsbs7', dfile:'CDFS44_mask4_1.0_H_pzmsbs7_eps.fits', wfile:'CDFS44_mask4_1.0_H_pzmsbs7_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_pzmsbs7_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'scista6' :  mask = {which:'scista6', dfile:'CDFS44_mask4_1.0_H_scista6_eps.fits', wfile:'CDFS44_mask4_1.0_H_scista6_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_scista6_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'scistb3' :  mask = {which:'scistb3', dfile:'CDFS44_mask4_1.0_H_scistb3_eps.fits', wfile:'CDFS44_mask4_1.0_H_scistb3_sig.fits', $
                          rfile:'CDFS44_mask4_1.0_H_scistb3_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 

     
     ELSE : BEGIN
        print, 'WARNING!! Choice not found'
        stop
     END 
  ENDCASE
  
  
  chk = where(mask.which EQ pick)
  IF chk NE -1 THEN values = mask[chk] ELSE BEGIN
     print, 'This detection tag not found: ', pick
     print, ' Skipping....'
     values = {which:'-1'}
  ENDELSE
  
  RETURN, values
END
;========================================================================================================================



;========================================================================================================================
pro cdfs44_mask4_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/'
  IF which[0] EQ 'all' THEN which = ['scistb3']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = cdfs44_mask4_H_extract_settings(which[zz])              ;get settings
     IF values.which NE '-1' THEN BEGIN                               ;if settings not fake 
        chk = tag_exist(values, 'dfile')                              ;check if tag exists
        IF chk EQ 1 THEN dfile = values.dfile                         ;pull value if tag exists
        chk = tag_exist(values, 'wfile')                              ;check if tag exists
        IF chk EQ 1 THEN wfile = values.wfile                         ;set new value
        chk = tag_exist(values, 'rfile')                              ;check if tag exists
        IF chk EQ 1 THEN rfile = values.rfile ELSE rfile = 0          ;set new value
        chk = tag_exist(values, 'xwhich')                             ;check if tag exists
        IF chk EQ 1 THEN xwhich = values.xwhich ELSE xwhich = 0       ;set new value
        chk = tag_exist(values, 'crow')                               ;check if tag exists
        IF chk EQ 1 THEN crow = values.crow ELSE crow = 0             ;pull value if tag exists
        chk = tag_exist(values, 'rowsdown')                           ;check if tag exists
        IF chk EQ 1 THEN rowsdown = values.rowsdown ELSE rowsdown = 0 ;pull value if tag exists
        chk = tag_exist(values, 'rowsup')                             ;check if tag exists
        IF chk EQ 1 THEN rowsup = values.rowsup ELSE rowsup = 0       ;pull value if tag exists
        chk = tag_exist(values, 'collow')                             ;check if tag exists
        IF chk EQ 1 THEN collow = values.collow ELSE collow = 0       ;pull value if tag exists
        chk = tag_exist(values, 'colup')                              ;check if tag exists
        IF chk EQ 1 THEN colup = values.colup ELSE colup = 0          ;pull value if tag exists
        
        mosfire_1dspec_extract, values.dfile, values.wfile, which[zz], XWHICH=xwhich, $              ;cont next line
                                XREG=rfile, $                                                        ;cont next line
                                CENTROW=crow, ROWDOWN=rowsdown, ROWUP=rowsup, $                      ;cont next line
                                COLDOWN=collow, COLUP=colup, $                                       ;cont next line
                                FLIP=values.flip, SPATFIT=values.fit, GUESSES=values.guess,$         ;cont next line
                                PRIORS=values.priors, DRYRUN=dryrun, $                               ;cont next line
                                BORDER=values.border, NOSKYLINES=values.nosky, OMASKED=omasked, $    ;cont next line
                                INDIR=indir, OUTDIR=outdir                                           ;pass on settings
     ENDIF                                                                                           ;end if settings not fake
  ENDFOR                                                                                             ;end loop over all detection  

END	
;========================================================================================================================
