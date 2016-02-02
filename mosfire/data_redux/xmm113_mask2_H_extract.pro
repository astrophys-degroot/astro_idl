;========================================================================================================================
function xmm113_mask2_H_extract_settings, pick
  

  CASE pick OF 
     'bsbs4' :  mask = {which:'bsbs4', dfile:'XMM113_mask2_1.0_H_bsbs4_eps.fits', wfile:'XMM113_mask2_1.0_H_bsbs4_sig.fits', $
                        rfile:'XMM113_mask2_1.0_H_bsbs4_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bsbs52' :  mask = {which:'bsbs52', dfile:'XMM113_mask2_1.0_H_bsbs52_eps.fits', wfile:'XMM113_mask2_1.0_H_bsbs52_sig.fits', $
                         rfile:'XMM113_mask2_1.0_H_bsbs52_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=14.8', 'sig=2.2', 'c=100.0', 'x0=0.1', 'x1=-0.01'], $
                         priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'bsbs58' :  mask = {which:'bsbs58', dfile:'XMM113_mask2_1.0_H_bsbs58_eps.fits', wfile:'XMM113_mask2_1.0_H_bsbs58_sig.fits', $
                         rfile:'XMM113_mask2_1.0_H_bsbs58_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=28.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 24.0', 'MU LT 38.0', 'SIG GT 0.0']}
 
     'bsbs5' :  mask = {which:'bsbs5', dfile:'XMM113_mask2_1.0_H_bsbs5_eps.fits', wfile:'XMM113_mask2_1.0_H_bsbs5_sig.fits', $
                        rfile:'XMM113_mask2_1.0_H_bsbs5_eps.reg', $
                        fit:'full', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=32.8', 'sig=2.0', 'c=170.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
     
     'cl0' :  mask = {which:'cl0', dfile:'XMM113_mask2_1.0_H_cl0_eps.fits', wfile:'XMM113_mask2_1.0_H_cl0_sig.fits', $
                      rfile:'XMM113_mask2_1.0_H_cl0_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=32.8', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 26.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'cl2' :  mask = {which:'cl2', dfile:'XMM113_mask2_1.0_H_cl2_eps.fits', wfile:'XMM113_mask2_1.0_H_cl2_sig.fits', $
                      rfile:'XMM113_mask2_1.0_H_cl2_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=16.2', 'sig=2.2', 'c=70.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'cl4' :  mask = {which:'cl4', dfile:'XMM113_mask2_1.0_H_cl4_eps.fits', wfile:'XMM113_mask2_1.0_H_cl4_sig.fits', $
                      rfile:'XMM113_mask2_1.0_H_cl4_eps.reg', $
                      fit:'full', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=25.0', 'sig=1.8', 'c=180.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 20.0', 'MU LT 32.0', 'SIG GT 0.0']}
     
     'cl7' :  mask = {which:'cl7', dfile:'XMM113_mask2_1.0_H_cl7_eps.fits', wfile:'XMM113_mask2_1.0_H_cl7_sig.fits', $
                      rfile:'XMM113_mask2_1.0_H_cl7_eps.reg', $
                      fit:'full', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=32.1', 'sig=2.4', 'c=70.0', 'x0=4.0', 'x1=0.01'], $
                      priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
 
     'fsbs10' :  mask = {which:'fsbs10', dfile:'XMM113_mask2_1.0_H_fsbs10_eps.fits', wfile:'XMM113_mask2_1.0_H_fsbs10_sig.fits', $
                         rfile:'XMM113_mask2_1.0_H_fsbs10_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=38.4', 'sig=3.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 30.0', 'MU LT 44.0', 'SIG GT 0.0']}
     
     'new2' :  mask = {which:'new2', dfile:'XMM113_mask2_1.0_H_fsbs10_eps.fits', wfile:'XMM113_mask2_1.0_H_fsbs10_sig.fits', $
                         rfile:'XMM113_mask2_1.0_H_fsbs10_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:['fsbs10', 'new2'], flip:0, $
                         guess:['mu=12.8', 'sig=4.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
     
     'fsbs9' :  mask = {which:'fsbs9', dfile:'XMM113_mask2_1.0_H_fsbs9_eps.fits', wfile:'XMM113_mask2_1.0_H_fsbs9_sig.fits', $
                        rfile:'XMM113_mask2_1.0_H_fsbs9_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=12.1', 'sig=3.0', 'c=50.0', 'x0=1.1', 'x1=0.01'], $
                        priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbs10' :  mask = {which:'msbs10', dfile:'XMM113_mask2_1.0_H_msbs10_eps.fits', wfile:'XMM113_mask2_1.0_H_msbs10_sig.fits', $
                         rfile:'XMM113_mask2_1.0_H_msbs10_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=25.1', 'sig=1.7', 'c=150.0', 'x0=0.1', 'x1=-2.0'], $
                         priors:['MU GT 20.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'msbs12' :  mask = {which:'msbs12', dfile:'XMM113_mask2_1.0_H_msbs12_eps.fits', wfile:'XMM113_mask2_1.0_H_msbs12_sig.fits', $
                         rfile:'XMM113_mask2_1.0_H_msbs12_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs17' :  mask = {which:'msbs17', dfile:'XMM113_mask2_1.0_H_msbs17_eps.fits', wfile:'XMM113_mask2_1.0_H_msbs17_sig.fits', $
                         rfile:'XMM113_mask2_1.0_H_msbs17_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=15.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs397' :  mask = {which:'msbs397', dfile:'XMM113_mask2_1.0_H_msbs397_eps.fits', wfile:'XMM113_mask2_1.0_H_msbs397_sig.fits', $
                          rfile:'XMM113_mask2_1.0_H_msbs397_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=19.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 16.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'msbs410' :  mask = {which:'msbs410', dfile:'XMM113_mask2_1.0_H_msbs410_eps.fits', wfile:'XMM113_mask2_1.0_H_msbs410_sig.fits', $
                          rfile:'XMM113_mask2_1.0_H_msbs410_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs424' :  mask = {which:'msbs424', dfile:'XMM113_mask2_1.0_H_msbs424_eps.fits', wfile:'XMM113_mask2_1.0_H_msbs424_sig.fits', $
                          rfile:'XMM113_mask2_1.0_H_msbs424_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbs467' :  mask = {which:'msbs467', dfile:'XMM113_mask2_1.0_H_msbs467_eps.fits', wfile:'XMM113_mask2_1.0_H_msbs467_sig.fits', $
                          rfile:'XMM113_mask2_1.0_H_msbs467_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbs477' :  mask = {which:'msbs477', dfile:'XMM113_mask2_1.0_H_msbs477_eps.fits', wfile:'XMM113_mask2_1.0_H_msbs477_sig.fits', $
                          rfile:'XMM113_mask2_1.0_H_msbs477_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzfsbs35' :  mask = {which:'pzfsbs35', dfile:'XMM113_mask2_1.0_H_pzfsbs35_eps.fits', wfile:'XMM113_mask2_1.0_H_pzfsbs35_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzfsbs35_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=10.2', 'sig=3.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 4.0', 'MU LT 14.0', 'SIG GT 0.0']}
 
     'pzfsbs7' :  mask = {which:'pzfsbs7', dfile:'XMM113_mask2_1.0_H_pzfsbs7_eps.fits', wfile:'XMM113_mask2_1.0_H_pzfsbs7_sig.fits', $
                          rfile:'XMM113_mask2_1.0_H_pzfsbs7_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmsbs0' :  mask = {which:'pzmsbs0', dfile:'XMM113_mask2_1.0_H_pzmsbs0_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs0_sig.fits', $
                          rfile:'XMM113_mask2_1.0_H_pzmsbs0_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs14' :  mask = {which:'pzmsbs14', dfile:'XMM113_mask2_1.0_H_pzmsbs14_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs14_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs14_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.2', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'new3' :  mask = {which:'new3', dfile:'XMM113_mask2_1.0_H_pzmsbs14_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs14_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs14_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:['pzmsbs14', 'new3'], flip:0, $
                           guess:['mu=42.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 38.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'pzmsbs19' :  mask = {which:'pzmsbs19', dfile:'XMM113_mask2_1.0_H_pzmsbs19_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs19_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs19_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=15.9', 'sig=1.8', 'c=145.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzmsbs26' :  mask = {which:'pzmsbs26', dfile:'XMM113_mask2_1.0_H_pzmsbs26_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs26_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs26_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=40.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 34.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'pzmsbs27' :  mask = {which:'pzmsbs27', dfile:'XMM113_mask2_1.0_H_pzmsbs27_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs27_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs27_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs31' :  mask = {which:'pzmsbs31', dfile:'XMM113_mask2_1.0_H_pzmsbs31_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs31_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs31_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs34' :  mask = {which:'pzmsbs34', dfile:'XMM113_mask2_1.0_H_pzmsbs34_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs34_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs34_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs39' :  mask = {which:'pzmsbs39', dfile:'XMM113_mask2_1.0_H_pzmsbs39_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs39_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs39_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=10.1', 'sig=2.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 4.0', 'MU LT 14.0', 'SIG GT 0.0']}
 
     'pzmsbs42' :  mask = {which:'pzmsbs42', dfile:'XMM113_mask2_1.0_H_pzmsbs42_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs42_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs42_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs43' :  mask = {which:'pzmsbs43', dfile:'XMM113_mask2_1.0_H_pzmsbs43_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs43_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs43_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmsbs44' :  mask = {which:'pzmsbs44', dfile:'XMM113_mask2_1.0_H_pzmsbs44_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs44_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs44_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=14.2', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'pzmsbs47' :  mask = {which:'pzmsbs47', dfile:'XMM113_mask2_1.0_H_pzmsbs47_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs47_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs47_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs51' :  mask = {which:'pzmsbs51', dfile:'XMM113_mask2_1.0_H_pzmsbs51_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs51_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs51_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=49.8', 'sig=1.8', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 44.0', 'MU LT 58.0', 'SIG GT 0.0']}
 
     'pzmsbs52' :  mask = {which:'pzmsbs52', dfile:'XMM113_mask2_1.0_H_pzmsbs52_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs52_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs52_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=65.2', 'sig=1.8', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 60.0', 'MU LT 70.0', 'SIG GT 0.0']}
 
     'pzmsbs63' :  mask = {which:'pzmsbs63', dfile:'XMM113_mask2_1.0_H_pzmsbs63_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs63_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs63_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs80' :  mask = {which:'pzmsbs80', dfile:'XMM113_mask2_1.0_H_pzmsbs80_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs80_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs80_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=36.2', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 42.0', 'SIG GT 0.0']}
 
     'pzmsbs86' :  mask = {which:'pzmsbs86', dfile:'XMM113_mask2_1.0_H_pzmsbs86_eps.fits', wfile:'XMM113_mask2_1.0_H_pzmsbs86_sig.fits', $
                           rfile:'XMM113_mask2_1.0_H_pzmsbs86_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'scist5' :  mask = {which:'scist5', dfile:'XMM113_mask2_1.0_H_scist5_eps.fits', wfile:'XMM113_mask2_1.0_H_scist5_sig.fits', $
                         rfile:'XMM113_mask2_1.0_H_scist5_eps.reg', $
                         fit:'full', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
 

     ELSE : BEGIN
        print, 'WARNING!! Choice not found'
        print, '  ****' + pick + '****'
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
pro xmm113_mask2_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/'
  IF which[0] EQ 'all' THEN which = ['bsbs4', 'bsbs52', 'bsbs58', 'bsbs5', 'cl0', 'cl2', 'cl4', 'cl7', $
                                     'fsbs10', 'fsbs9', 'msbs10', 'msbs12', 'msbs17', 'msbs397', 'msbs410', $
                                     'msbs424', 'msbs467', 'msbs477', 'pzfsbs35', 'pzfsbs7', 'pzmsbs0', $
                                     'pzmsbs14', 'pzmsbs19', 'pzmsbs26', 'pzmsbs27', 'pzmsbs31', 'pzmsbs34', $
                                     'pzmsbs39', 'pzmsbs42', 'pzmsbs43', 'pzmsbs44', 'pzmsbs47', 'pzmsbs51', $
                                     'pzmsbs52', 'pzmsbs63', 'pzmsbs80', 'pzmsbs86', 'scist5']
  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = xmm113_mask2_H_extract_settings(which[zz])              ;get settings
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
        
        mosfire_1dspec_extract, values.dfile, values.wfile, which[zz], XWHICH=xwhich, $           ;cont next line
                                XREG=rfile, $                                                     ;cont next line
                                CENTROW=crow, ROWDOWN=rowsdown, ROWUP=rowsup, $                   ;cont next line
                                COLDOWN=collow, COLUP=colup, $                                    ;cont next line
                                FLIP=values.flip, SPATFIT=values.fit, GUESSES=values.guess,$      ;cont next line
                                PRIORS=values.priors, DRYRUN=dryrun, $                            ;cont next line
                                BORDER=values.border, NOSKYLINES=values.nosky, OMASKED=omasked, $ ;cont next line
                                INDIR=indir, OUTDIR=outdir                                        ;pass on settings
     ENDIF                                                                                        ;end if settings not fake
  ENDFOR                                                                                          ;end loop over all detection  

END	
;========================================================================================================================
