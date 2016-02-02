;========================================================================================================================
function lok200_mask3_H_extract_settings, pick
  
  CASE pick OF 

     'bsbsr12' :  mask = {which:'bsbsr12', dfile:'LOK200_mask3_H_bsbsr12_eps.fits', wfile:'LOK200_mask3_H_bsbsr12_sig.fits', $
                          rfile:'LOK200_mask3_H_bsbsr12_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.2', 'sig=2.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 5.0', 'MU LT 15.0', 'SIG GT 0.0']}
 
     'bsbsr14' :  mask = {which:'bsbsr14', dfile:'LOK200_mask3_H_bsbsr14_eps.fits', wfile:'LOK200_mask3_H_bsbsr14_sig.fits', $
                          rfile:'LOK200_mask3_H_bsbsr14_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=39.8', 'sig=2.0', 'c=70.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 35.0', 'MU LT 45.0', 'SIG GT 0.0']}
 
     'bsbsr7' :  mask = {which:'bsbsr7', dfile:'LOK200_mask3_H_bsbsr7_eps.fits', wfile:'LOK200_mask3_H_bsbsr7_sig.fits', $
                         rfile:'LOK200_mask3_H_bsbsr7_eps.reg', $
                         fit:'full', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=32.1', 'sig=4.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
     
     'bsbsr8a' :  mask = {which:'bsbsr8a', dfile:'LOK200_mask3_H_bsbsr8a_eps.fits', wfile:'LOK200_mask3_H_bsbsr8a_sig.fits', $
                          rfile:'LOK200_mask3_H_bsbsr8a_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=16.1', 'sig=4.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 12.0', 'MU LT 20.0', 'SIG GT 0.0']}
     
     'fsbsr106' :  mask = {which:'fsbsr106', dfile:'LOK200_mask3_H_fsbsr106_eps.fits', wfile:'LOK200_mask3_H_fsbsr106_sig.fits', $
                           rfile:'LOK200_mask3_H_fsbsr106_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr114' :  mask = {which:'fsbsr114', dfile:'LOK200_mask3_H_fsbsr114_eps.fits', wfile:'LOK200_mask3_H_fsbsr114_sig.fits', $
                           rfile:'LOK200_mask3_H_fsbsr114_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=15.2', 'sig=4.0', 'c=9.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'fsbsr166' :  mask = {which:'fsbsr166', dfile:'LOK200_mask3_H_fsbsr166_eps.fits', wfile:'LOK200_mask3_H_fsbsr166_sig.fits', $
                           rfile:'LOK200_mask3_H_fsbsr166_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=-0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr170a' :  mask = {which:'fsbsr170a', dfile:'LOK200_mask3_H_fsbsr170a_eps.fits', wfile:'LOK200_mask3_H_fsbsr170a_sig.fits', $
                            rfile:'LOK200_mask3_H_fsbsr170a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=12.8', 'sig=2.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'fsbsr182' :  mask = {which:'fsbsr182', dfile:'LOK200_mask3_H_fsbsr182_eps.fits', wfile:'LOK200_mask3_H_fsbsr182_sig.fits', $
                           rfile:'LOK200_mask3_H_fsbsr182_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=13.5', 'sig=3.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'fsbsr242' :  mask = {which:'fsbsr242', dfile:'LOK200_mask3_H_fsbsr242_eps.fits', wfile:'LOK200_mask3_H_fsbsr242_sig.fits', $
                           rfile:'LOK200_mask3_H_fsbsr242_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=10.9', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
     
     'msbsb131b' :  mask = {which:'msbsb131b', dfile:'LOK200_mask3_H_msbsb131b_eps.fits', wfile:'LOK200_mask3_H_msbsb131b_sig.fits', $
                            rfile:'LOK200_mask3_H_msbsb131b_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsb134' :  mask = {which:'msbsb134', dfile:'LOK200_mask3_H_msbsb134_eps.fits', wfile:'LOK200_mask3_H_msbsb134_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb134_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.5', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 6.0', 'MU LT 16.0', 'SIG GT 0.0']}
 
     'msbsb135' :  mask = {which:'msbsb135', dfile:'LOK200_mask3_H_msbsb135_eps.fits', wfile:'LOK200_mask3_H_msbsb135_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb135_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsb136a' :  mask = {which:'msbsb136a', dfile:'LOK200_mask3_H_msbsb136a_eps.fits', wfile:'LOK200_mask3_H_msbsb136a_sig.fits', $
                            rfile:'LOK200_mask3_H_msbsb136a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=12.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsb137' :  mask = {which:'msbsb137', dfile:'LOK200_mask3_H_msbsb137_eps.fits', wfile:'LOK200_mask3_H_msbsb137_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb137_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.1', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsb153a' :  mask = {which:'msbsb153a', dfile:'LOK200_mask3_H_msbsb153a_eps.fits', wfile:'LOK200_mask3_H_msbsb153a_sig.fits', $
                            rfile:'LOK200_mask3_H_msbsb153a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=2.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb156' :  mask = {which:'msbsb156', dfile:'LOK200_mask3_H_msbsb156_eps.fits', wfile:'LOK200_mask3_H_msbsb156_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb156_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=4.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 22.0', 'MU LT 35.0', 'SIG GT 0.0']}
     
     'msbsb166' :  mask = {which:'msbsb166', dfile:'LOK200_mask3_H_msbsb166_eps.fits', wfile:'LOK200_mask3_H_msbsb166_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb166_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=17.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}

     'msbsb166b' :  mask = {which:'msbsb166b', dfile:'LOK200_mask3_H_msbsb166_eps.fits', wfile:'LOK200_mask3_H_msbsb166_sig.fits', $
                            rfile:'LOK200_mask3_H_msbsb166_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=26.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 20.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'msbsb175a' :  mask = {which:'msbsb175a', dfile:'LOK200_mask3_H_msbsb175a_eps.fits', wfile:'LOK200_mask3_H_msbsb175a_sig.fits', $
                            rfile:'LOK200_mask3_H_msbsb175a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=16.1', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'msbsb178' :  mask = {which:'msbsb178', dfile:'LOK200_mask3_H_msbsb178_eps.fits', wfile:'LOK200_mask3_H_msbsb178_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb178_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb180' :  mask = {which:'msbsb180', dfile:'LOK200_mask3_H_msbsb180_eps.fits', wfile:'LOK200_mask3_H_msbsb180_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb180_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb181' :  mask = {which:'msbsb181', dfile:'LOK200_mask3_H_msbsb181_eps.fits', wfile:'LOK200_mask3_H_msbsb181_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb181_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb181b' :  mask = {which:'msbsb181b', dfile:'LOK200_mask3_H_msbsb181_eps.fits', wfile:'LOK200_mask3_H_msbsb181_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb181b_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:['msbsb181', 'msbsb181b'], flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb189' :  mask = {which:'msbsb189', dfile:'LOK200_mask3_H_msbsb189_eps.fits', wfile:'LOK200_mask3_H_msbsb189_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb189_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb192' :  mask = {which:'msbsb192', dfile:'LOK200_mask3_H_msbsb192_eps.fits', wfile:'LOK200_mask3_H_msbsb192_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb192_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsb99a' :  mask = {which:'msbsb99a', dfile:'LOK200_mask3_H_msbsb99a_eps.fits', wfile:'LOK200_mask3_H_msbsb99a_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsb99a_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.2', 'sig=1.6', 'c=120.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr189a' :  mask = {which:'msbsr189a', dfile:'LOK200_mask3_H_msbsr189a_eps.fits', wfile:'LOK200_mask3_H_msbsr189a_sig.fits', $
                            rfile:'LOK200_mask3_H_msbsr189a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr235' :  mask = {which:'msbsr235', dfile:'LOK200_mask3_H_msbsr235_eps.fits', wfile:'LOK200_mask3_H_msbsr235_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr235_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=13.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr257' :  mask = {which:'msbsr257', dfile:'LOK200_mask3_H_msbsr257_eps.fits', wfile:'LOK200_mask3_H_msbsr257_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr257_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=10.3', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'msbsr274' :  mask = {which:'msbsr274', dfile:'LOK200_mask3_H_msbsr274_eps.fits', wfile:'LOK200_mask3_H_msbsr274_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr274_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.1', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 4.0', 'MU LT 14.0', 'SIG GT 0.0']}
 
     'msbsr280' :  mask = {which:'msbsr280', dfile:'LOK200_mask3_H_msbsr280_eps.fits', wfile:'LOK200_mask3_H_msbsr280_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr280_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.8', 'sig=4.0', 'c=16.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'msbsr281a' :  mask = {which:'msbsr281a', dfile:'LOK200_mask3_H_msbsr281_eps.fits', wfile:'LOK200_mask3_H_msbsr281_sig.fits', $
                            rfile:'LOK200_mask3_H_msbsr281_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:['msbsr281', 'msbsr281a'], flip:0, $
                            guess:['mu=41.1', 'sig=2.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 35.0', 'MU LT 45.0', 'SIG GT 0.0']}

     'msbsr281b' :  mask = {which:'msbsr281b', dfile:'LOK200_mask3_H_msbsr281_eps.fits', wfile:'LOK200_mask3_H_msbsr281_sig.fits', $
                            rfile:'LOK200_mask3_H_msbsr281b_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:['msbsr281', 'msbsr281b'], flip:0, $
                            guess:['mu=18.8', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}

     'msbsr288' :  mask = {which:'msbsr288', dfile:'LOK200_mask3_H_msbsr288_eps.fits', wfile:'LOK200_mask3_H_msbsr288_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr288_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=17.4', 'sig=4.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 12.0', 'MU LT 22.0', 'SIG GT 0.0']}

     'msbsr291' :  mask = {which:'msbsr291', dfile:'LOK200_mask3_H_msbsr291_eps.fits', wfile:'LOK200_mask3_H_msbsr291_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr291_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr292' :  mask = {which:'msbsr292', dfile:'LOK200_mask3_H_msbsr292_eps.fits', wfile:'LOK200_mask3_H_msbsr292_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr292_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr310' :  mask = {which:'msbsr310', dfile:'LOK200_mask3_H_msbsr310_eps.fits', wfile:'LOK200_mask3_H_msbsr310_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr310_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=14.2', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr313' :  mask = {which:'msbsr313', dfile:'LOK200_mask3_H_msbsr313_eps.fits', wfile:'LOK200_mask3_H_msbsr313_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr313_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.5', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr325' :  mask = {which:'msbsr325', dfile:'LOK200_mask3_H_msbsr325_eps.fits', wfile:'LOK200_mask3_H_msbsr325_sig.fits', $
                           rfile:'LOK200_mask3_H_msbsr325_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=40.2', 'sig=2.0', 'c=80.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 36.0', 'MU LT 46.0', 'SIG GT 0.0']}
 
     'rest451a' :  mask = {which:'rest451a', dfile:'LOK200_mask3_H_rest451a_eps.fits', wfile:'LOK200_mask3_H_rest451a_sig.fits', $
                           rfile:'LOK200_mask3_H_rest451a_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest497a' :  mask = {which:'rest497a', dfile:'LOK200_mask3_H_rest497a_eps.fits', wfile:'LOK200_mask3_H_rest497a_sig.fits', $
                           rfile:'LOK200_mask3_H_rest497a_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=27.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 22.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'st14' :  mask = {which:'st14', dfile:'LOK200_mask3_H_st14_eps.fits', wfile:'LOK200_mask3_H_st14_sig.fits', $
                       rfile:'LOK200_mask3_H_st14_eps.reg', $
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
pro lok200_mask3_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask3/2014may14/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask3/2014may14/H/'
  IF which[0] EQ 'all' THEN which = ['bsbsr12', 'bsbsr14', 'bsbsr7', 'bsbsr8a', 'fsbsr106', 'fsbsr114', $
                                     'fsbsr166', 'fsbsr170a', 'fsbsr182', 'fsbsr242', 'msbsb131b', 'msbsb134', $
                                     'msbsb135', 'msbsb136a', 'msbsb137', 'msbsb153a', 'msbsb156', 'msbsb166', $
                                     'msbsb175a', 'msbsb178', 'msbsb180', 'msbsb181', 'msbsb189', 'msbsb192', $
                                     'msbsb99a', 'msbsr189a', 'msbsr235', 'msbsr257', 'msbsr274', 'msbsr280', $
                                     'msbsr281', 'msbsr288', 'msbsr291', 'msbsr292', 'msbsr310', 'msbsr313', $
                                     'msbsr325', 'rest451a', 'rest497a', 'st14']
  

 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok200_mask3_H_extract_settings(which[zz])              ;get settings
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
