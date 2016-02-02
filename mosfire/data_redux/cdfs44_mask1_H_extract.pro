;========================================================================================================================
function cdfs44_mask1_H_extract_settings, pick
  
  CASE pick OF 

     'bcsbs109' :  mask = {which:'bcsbs109', dfile:'CDFS44_mask1_1.0_H_bcsbs109_eps.fits', wfile:'CDFS44_mask1_1.0_H_bcsbs109_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_bcsbs109_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bcsbs113' :  mask = {which:'bcsbs113', dfile:'CDFS44_mask1_1.0_H_bcsbs113_eps.fits', wfile:'CDFS44_mask1_1.0_H_bcsbs113_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_bcsbs113_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bcsbs37' :  mask = {which:'bcsbs37', dfile:'CDFS44_mask1_1.0_H_bcsbs37_eps.fits', wfile:'CDFS44_mask1_1.0_H_bcsbs37_sig.fits', $
                          rfile:'CDFS44_mask1_1.0_H_bcsbs37_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=29.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 2.0', 'SIG LT 5.0']}
     
     'bcsbs69' :  mask = {which:'bcsbs69', dfile:'CDFS44_mask1_1.0_H_bcsbs69_eps.fits', wfile:'CDFS44_mask1_1.0_H_bcsbs69_sig.fits', $
                          rfile:'CDFS44_mask1_1.0_H_bcsbs69_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 8.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'bcsbs78' :  mask = {which:'bcsbs78', dfile:'CDFS44_mask1_1.0_H_bcsbs78_eps.fits', wfile:'CDFS44_mask1_1.0_H_bcsbs78_sig.fits', $
                          rfile:'CDFS44_mask1_1.0_H_bcsbs78_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bsbs2' :  mask = {which:'bsbs2', dfile:'CDFS44_mask1_1.0_H_bsbs2_eps.fits', wfile:'CDFS44_mask1_1.0_H_bsbs2_sig.fits', $
                        rfile:'CDFS44_mask1_1.0_H_bsbs2_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=57.8', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 55.0', 'MU LT 65.0', 'SIG GT 0.0']}
 
     'bsbs66' :  mask = {which:'bsbs66', dfile:'CDFS44_mask1_1.0_H_bsbs66_eps.fits', wfile:'CDFS44_mask1_1.0_H_bsbs66_sig.fits', $
                         rfile:'CDFS44_mask1_1.0_H_bsbs66_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=19.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'cl12' :  mask = {which:'cl12', dfile:'CDFS44_mask1_1.0_H_cl12_eps.fits', wfile:'CDFS44_mask1_1.0_H_cl12_sig.fits', $
                       rfile:'CDFS44_mask1_1.0_H_cl12_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=46.8', 'sig=2.5', 'c=25.0', 'x0=0.1', 'x1=-0.01'], $
                       priors:['MU GT 40.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'cl1' :  mask = {which:'cl1', dfile:'CDFS44_mask1_1.0_H_cl1_eps.fits', wfile:'CDFS44_mask1_1.0_H_cl1_sig.fits', $
                      rfile:'CDFS44_mask1_1.0_H_cl1_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_medium', $
                      xwhich:0, flip:0, $
                      guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cl3' :  mask = {which:'cl3', dfile:'CDFS44_mask1_1.0_H_cl3_eps.fits', wfile:'CDFS44_mask1_1.0_H_cl3_sig.fits', $
                      rfile:'CDFS44_mask1_1.0_H_cl3_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=22.8', 'sig=3.0', 'c=80.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cl4' :  mask = {which:'cl4', dfile:'CDFS44_mask1_1.0_H_cl4_eps.fits', wfile:'CDFS44_mask1_1.0_H_cl4_sig.fits', $
                      rfile:'CDFS44_mask1_1.0_H_cl4_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_medium', $
                      xwhich:0, flip:0, $
                      guess:['mu=10.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 6.0', 'MU LT 16.0', 'SIG GT 0.0']}
 
     'cl5' :  mask = {which:'cl5', dfile:'CDFS44_mask1_1.0_H_cl5_eps.fits', wfile:'CDFS44_mask1_1.0_H_cl5_sig.fits', $
                      rfile:'CDFS44_mask1_1.0_H_cl5_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'cl6' :  mask = {which:'cl6', dfile:'CDFS44_mask1_1.0_H_cl6_eps.fits', wfile:'CDFS44_mask1_1.0_H_cl6_sig.fits', $
                      rfile:'CDFS44_mask1_1.0_H_cl6_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_medium', $
                      xwhich:0, flip:0, $
                      guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'cl7' :  mask = {which:'cl7', dfile:'CDFS44_mask1_1.0_H_cl7_eps.fits', wfile:'CDFS44_mask1_1.0_H_cl7_sig.fits', $
                      rfile:'CDFS44_mask1_1.0_H_cl7_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_faint', $
                      xwhich:0, flip:0, $
                      guess:['mu=29.8', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
     
     'cl8' :  mask = {which:'cl8', dfile:'CDFS44_mask1_1.0_H_cl8_eps.fits', wfile:'CDFS44_mask1_1.0_H_cl8_sig.fits', $
                      rfile:'CDFS44_mask1_1.0_H_cl8_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_faint', $
                      xwhich:0, flip:0, $
                      guess:['mu=28.1', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cl9' :  mask = {which:'cl9', dfile:'CDFS44_mask1_1.0_H_cl9_eps.fits', wfile:'CDFS44_mask1_1.0_H_cl9_sig.fits', $
                      rfile:'CDFS44_mask1_1.0_H_cl9_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=32.5', 'sig=4.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                      priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'msbs3' :  mask = {which:'msbs3', dfile:'CDFS44_mask1_1.0_H_msbs3_eps.fits', wfile:'CDFS44_mask1_1.0_H_msbs3_sig.fits', $
                        rfile:'CDFS44_mask1_1.0_H_msbs3_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'nby6' :  mask = {which:'nby6', dfile:'CDFS44_mask1_1.0_H_nby6_eps.fits', wfile:'CDFS44_mask1_1.0_H_nby6_sig.fits', $
                       rfile:'CDFS44_mask1_1.0_H_nby6_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_medium', $
                       xwhich:0, flip:0, $
                       guess:['mu=24.9', 'sig=3.0', 'c=7.0', 'x0=-0.1', 'x1=0.01'], $
                       priors:['MU GT 24.0', 'MU LT 35.0', 'SIG GT 0.0']}
 
     'pzbsbs25' :  mask = {which:'pzbsbs25', dfile:'CDFS44_mask1_1.0_H_pzbsbs25_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzbsbs25_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzbsbs25_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzbsbs30' :  mask = {which:'pzbsbs30', dfile:'CDFS44_mask1_1.0_H_pzbsbs30_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzbsbs30_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzbsbs30_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzbsbs31' :  mask = {which:'pzbsbs31', dfile:'CDFS44_mask1_1.0_H_pzbsbs31_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzbsbs31_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzbsbs31_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.5', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs115' :  mask = {which:'pzfsbs115', dfile:'CDFS44_mask1_1.0_H_pzfsbs115_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzfsbs115_sig.fits', $
                            rfile:'CDFS44_mask1_1.0_H_pzfsbs115_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=19.1', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzfsbs134' :  mask = {which:'pzfsbs134', dfile:'CDFS44_mask1_1.0_H_pzfsbs134_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzfsbs134_sig.fits', $
                            rfile:'CDFS44_mask1_1.0_H_pzfsbs134_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=28.1', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
     
     'pzfsbs64' :  mask = {which:'pzfsbs64', dfile:'CDFS44_mask1_1.0_H_pzfsbs64_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzfsbs64_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzfsbs64_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzfsbs87' :  mask = {which:'pzfsbs87', dfile:'CDFS44_mask1_1.0_H_pzfsbs87_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzfsbs87_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzfsbs87_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzmsbs22' :  mask = {which:'pzmsbs22', dfile:'CDFS44_mask1_1.0_H_pzmsbs22_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs22_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs22_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=37.1', 'sig=4.0', 'c=12.0', 'x0=-0.1', 'x1=-0.01'], $
                           priors:['MU GT 34.0', 'MU LT 46.0', 'SIG GT 0.0']}
     
     'pzmsbs23' :  mask = {which:'pzmsbs23', dfile:'CDFS44_mask1_1.0_H_pzmsbs23_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs23_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs23_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.5', 'sig=4.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'pzmsbs28' :  mask = {which:'pzmsbs28', dfile:'CDFS44_mask1_1.0_H_pzmsbs28_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs28_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs28_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'pzmsbs31' :  mask = {which:'pzmsbs31', dfile:'CDFS44_mask1_1.0_H_pzmsbs31_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs31_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs31_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.2', 'sig=3.0', 'c=9.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'pzmsbs34' :  mask = {which:'pzmsbs34', dfile:'CDFS44_mask1_1.0_H_pzmsbs34_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs34_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs34_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs38' :  mask = {which:'pzmsbs38', dfile:'CDFS44_mask1_1.0_H_pzmsbs38_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs38_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs38_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=2.2', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs43' :  mask = {which:'pzmsbs43', dfile:'CDFS44_mask1_1.0_H_pzmsbs43_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs43_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs43_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=27.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'pzmsbs44' :  mask = {which:'pzmsbs44', dfile:'CDFS44_mask1_1.0_H_pzmsbs44_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs44_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs44_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.1', 'sig=3.0', 'c=9.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzmsbs45' :  mask = {which:'pzmsbs45', dfile:'CDFS44_mask1_1.0_H_pzmsbs45_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs45_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs45_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs46' :  mask = {which:'pzmsbs46', dfile:'CDFS44_mask1_1.0_H_pzmsbs46_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs46_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs46_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=2.0', 'c=19.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'pzmsbs56' :  mask = {which:'pzmsbs56', dfile:'CDFS44_mask1_1.0_H_pzmsbs56_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs56_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs56_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=-0.1', 'x1=-0.01'], $
                           priors:['MU GT 16.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'pzmsbs60' :  mask = {which:'pzmsbs60', dfile:'CDFS44_mask1_1.0_H_pzmsbs60_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs60_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs60_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=60.1', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 50.0', 'MU LT 64.0', 'SIG GT 0.0']}
 
     'pzmsbs70' :  mask = {which:'pzmsbs70', dfile:'CDFS44_mask1_1.0_H_pzmsbs70_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs70_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs70_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=9.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'pzmsbs72' :  mask = {which:'pzmsbs72', dfile:'CDFS44_mask1_1.0_H_pzmsbs72_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs72_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs72_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.9', 'sig=4.0', 'c=11.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 25.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'pzmsbs76' :  mask = {which:'pzmsbs76', dfile:'CDFS44_mask1_1.0_H_pzmsbs76_eps.fits', wfile:'CDFS44_mask1_1.0_H_pzmsbs76_sig.fits', $
                           rfile:'CDFS44_mask1_1.0_H_pzmsbs76_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'scistb3' :  mask = {which:'scistb3', dfile:'CDFS44_mask1_1.0_H_scistb3_eps.fits', wfile:'CDFS44_mask1_1.0_H_scistb3_sig.fits', $
                          rfile:'CDFS44_mask1_1.0_H_scistb3_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
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
pro cdfs44_mask1_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/'
  IF which[0] EQ 'all' THEN which = ['scistb3']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = cdfs44_mask1_H_extract_settings(which[zz])              ;get settings
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
