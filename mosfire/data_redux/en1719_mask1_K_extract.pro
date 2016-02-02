;========================================================================================================================
function en1719_mask1_K_extract_settings, pick
  
  CASE pick OF   
     'fsbsb10' :  mask = {which:'fsbsb10', dfile:'en1719_mask1_v1_K_fsbsb10_eps.fits', wfile:'en1719_mask1_v1_K_fsbsb10_sig.fits', $
                          rfile:'en1719_mask1_v1_K_fsbsb10_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=25.8', 'sig=5.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 18.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'man8' :  mask = {which:'man8', dfile:'en1719_mask1_v1_K_man8_eps.fits', wfile:'en1719_mask1_v1_K_man8_sig.fits', $
                       rfile:'en1719_mask1_v1_K_man8_eps.reg', $
                       fit:'gauss3', border:2, nosky:'kband_faint', $
                       xwhich:0, flip:0, $
                       guess:['mu=20.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=-0.01'], $
                       priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'msbsb10' :  mask = {which:'msbsb10', dfile:'en1719_mask1_v1_K_msbsb10_eps.fits', wfile:'en1719_mask1_v1_K_msbsb10_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsb10_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=33.8', 'sig=3.0', 'c=75.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 30.0', 'MU LT 44.0', 'SIG GT 0.0']}
 
     'msbsb121' :  mask = {which:'msbsb121', dfile:'en1719_mask1_v1_K_msbsb121_eps.fits', wfile:'en1719_mask1_v1_K_msbsb121_sig.fits', $
                           rfile:'en1719_mask1_v1_K_msbsb121_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb30' :  mask = {which:'msbsb30', dfile:'en1719_mask1_v1_K_msbsb30_eps.fits', wfile:'en1719_mask1_v1_K_msbsb30_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsb30_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=42.1', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 32.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'msbsb51' :  mask = {which:'msbsb51', dfile:'en1719_mask1_v1_K_msbsb51_eps.fits', wfile:'en1719_mask1_v1_K_msbsb51_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsb51_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=28.7', 'sig=4.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 26.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'msbsb81' :  mask = {which:'msbsb81', dfile:'en1719_mask1_v1_K_msbsb81_eps.fits', wfile:'en1719_mask1_v1_K_msbsb81_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsb81_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=52.1', 'sig=3.0', 'c=55.0', 'x0=-0.2', 'x1=0.01'], $
                          priors:['MU GT 44.0', 'MU LT 56.0', 'SIG GT 0.0']}
 
     'msbsb89' :  mask = {which:'msbsb89', dfile:'en1719_mask1_v1_K_msbsb89_eps.fits', wfile:'en1719_mask1_v1_K_msbsb89_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsb89_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=18.5', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=-0.01'], $
                          priors:['MU GT 12.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'msbsb8' :  mask = {which:'msbsb8', dfile:'en1719_mask1_v1_K_msbsb8_eps.fits', wfile:'en1719_mask1_v1_K_msbsb8_sig.fits', $
                         rfile:'en1719_mask1_v1_K_msbsb8_eps.reg', $
                         fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=45.4', 'sig=2.5', 'c=120.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 38.0', 'MU LT 52.0', 'SIG GT 0.0']}
 
     'msbsb92' :  mask = {which:'msbsb92', dfile:'en1719_mask1_v1_K_msbsb92_eps.fits', wfile:'en1719_mask1_v1_K_msbsb92_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsb92_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=42.8', 'sig=4.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 34.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'unk1' :  mask = {which:'unk1', dfile:'en1719_mask1_v1_K_msbsb92_eps.fits', wfile:'en1719_mask1_v1_K_msbsb92_sig.fits', $
                          rfile:'en1719_mask1_v1_K_unk1_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:['msbsb92', 'unk1'], flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=1.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr104' :  mask = {which:'msbsr104', dfile:'en1719_mask1_v1_K_msbsr104_eps.fits', wfile:'en1719_mask1_v1_K_msbsr104_sig.fits', $
                           rfile:'en1719_mask1_v1_K_msbsr104_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.8', 'sig=4.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 12.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'msbsr16' :  mask = {which:'msbsr16', dfile:'en1719_mask1_v1_K_msbsr16_eps.fits', wfile:'en1719_mask1_v1_K_msbsr16_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsr16_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=47.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 42.0', 'MU LT 56.0', 'SIG GT 0.0']}
 
     'msbsr49' :  mask = {which:'msbsr49', dfile:'en1719_mask1_v1_K_msbsr49_eps.fits', wfile:'en1719_mask1_v1_K_msbsr49_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsr49_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=34.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 28.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'msbsr66' :  mask = {which:'msbsr66', dfile:'en1719_mask1_v1_K_msbsr66_eps.fits', wfile:'en1719_mask1_v1_K_msbsr66_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsr66_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=-0.1', 'x1=-0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr71' :  mask = {which:'msbsr71', dfile:'en1719_mask1_v1_K_msbsr71_eps.fits', wfile:'en1719_mask1_v1_K_msbsr71_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsr71_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr83' :  mask = {which:'msbsr83', dfile:'en1719_mask1_v1_K_msbsr83_eps.fits', wfile:'en1719_mask1_v1_K_msbsr83_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsr83_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.0', 'c=20.0', 'x0=-0.1', 'x1=0.01'], $
                          priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr97' :  mask = {which:'msbsr97', dfile:'en1719_mask1_v1_K_msbsr97_eps.fits', wfile:'en1719_mask1_v1_K_msbsr97_sig.fits', $
                          rfile:'en1719_mask1_v1_K_msbsr97_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=35.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 28.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'rest1296' :  mask = {which:'rest1296', dfile:'en1719_mask1_v1_K_rest1296_eps.fits', wfile:'en1719_mask1_v1_K_rest1296_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest1296_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=19.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 12.0', 'MU LT 26.0', 'SIG GT 0.0']}
     
     'rest1401' :  mask = {which:'rest1401', dfile:'en1719_mask1_v1_K_rest1401_eps.fits', wfile:'en1719_mask1_v1_K_rest1401_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest1401_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=4.0', 'c=20.0', 'x0=0.3', 'x1=-0.01'], $
                           priors:['MU GT 20.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest1441' :  mask = {which:'rest1441', dfile:'en1719_mask1_v1_K_rest1441_eps.fits', wfile:'en1719_mask1_v1_K_rest1441_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest1441_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1745' :  mask = {which:'rest1745', dfile:'en1719_mask1_v1_K_rest1745_eps.fits', wfile:'en1719_mask1_v1_K_rest1745_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest1745_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1771' :  mask = {which:'rest1771', dfile:'en1719_mask1_v1_K_rest1771_eps.fits', wfile:'en1719_mask1_v1_K_rest1771_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest1771_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1792' :  mask = {which:'rest1792', dfile:'en1719_mask1_v1_K_rest1792_eps.fits', wfile:'en1719_mask1_v1_K_rest1792_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest1792_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.1', 'sig=3.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 42.0', 'MU LT 58.0', 'SIG GT 0.0']}
 
     'rest2118' :  mask = {which:'rest2118', dfile:'en1719_mask1_v1_K_rest2118_eps.fits', wfile:'en1719_mask1_v1_K_rest2118_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest2118_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest2250' :  mask = {which:'rest2250', dfile:'en1719_mask1_v1_K_rest2250_eps.fits', wfile:'en1719_mask1_v1_K_rest2250_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest2250_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest2432' :  mask = {which:'rest2432', dfile:'en1719_mask1_v1_K_rest2432_eps.fits', wfile:'en1719_mask1_v1_K_rest2432_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest2432_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest2477' :  mask = {which:'rest2477', dfile:'en1719_mask1_v1_K_rest2477_eps.fits', wfile:'en1719_mask1_v1_K_rest2477_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest2477_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest3200' :  mask = {which:'rest3200', dfile:'en1719_mask1_v1_K_rest3200_eps.fits', wfile:'en1719_mask1_v1_K_rest3200_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest3200_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'rest3458' :  mask = {which:'rest3458', dfile:'en1719_mask1_v1_K_rest3458_eps.fits', wfile:'en1719_mask1_v1_K_rest3458_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest3458_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=28.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 24.0', 'MU LT 38.0', 'SIG GT 0.0']}
 
     'rest361' :  mask = {which:'rest361', dfile:'en1719_mask1_v1_K_rest361_eps.fits', wfile:'en1719_mask1_v1_K_rest361_sig.fits', $
                          rfile:'en1719_mask1_v1_K_rest361_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest4230' :  mask = {which:'rest4230', dfile:'en1719_mask1_v1_K_rest4230_eps.fits', wfile:'en1719_mask1_v1_K_rest4230_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest4230_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4939' :  mask = {which:'rest4939', dfile:'en1719_mask1_v1_K_rest4939_eps.fits', wfile:'en1719_mask1_v1_K_rest4939_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest4939_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'unk2' :  mask = {which:'unk2', dfile:'en1719_mask1_v1_K_rest4939_eps.fits', wfile:'en1719_mask1_v1_K_rest4939_sig.fits', $
                           rfile:'en1719_mask1_v1_K_unk2_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:['rest4939', 'unk2'], flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'rest4946' :  mask = {which:'rest4946', dfile:'en1719_mask1_v1_K_rest4946_eps.fits', wfile:'en1719_mask1_v1_K_rest4946_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest4946_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest4948' :  mask = {which:'rest4948', dfile:'en1719_mask1_v1_K_rest4948_eps.fits', wfile:'en1719_mask1_v1_K_rest4948_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest4948_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.8', 'sig=4.0', 'c=70.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'rest4985' :  mask = {which:'rest4985', dfile:'en1719_mask1_v1_K_rest4985_eps.fits', wfile:'en1719_mask1_v1_K_rest4985_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest4985_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.6', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest5247' :  mask = {which:'rest5247', dfile:'en1719_mask1_v1_K_rest5247_eps.fits', wfile:'en1719_mask1_v1_K_rest5247_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest5247_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=15.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'rest5334' :  mask = {which:'rest5334', dfile:'en1719_mask1_v1_K_rest5334_eps.fits', wfile:'en1719_mask1_v1_K_rest5334_sig.fits', $
                           rfile:'en1719_mask1_v1_K_rest5334_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=21.8', 'sig=2.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 16.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'st21' :  mask = {which:'st21', dfile:'en1719_mask1_v1_K_st21_eps.fits', wfile:'en1719_mask1_v1_K_st21_sig.fits', $
                       rfile:'en1719_mask1_v1_K_st21_eps.reg', $
                       fit:'gauss3', border:2, nosky:'kband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     



     ELSE : BEGIN
        print, 'WARNING!! Detection choice not found'
        stop
     END 
  ENDCASE
           
  chk = where(mask.which EQ pick)                                        ;a double check
  IF chk NE -1 THEN values = mask[chk] ELSE BEGIN                        ;if double check fails
     print, 'WARNING!! THis detection choice does not mask.which:', pick ;print warning
     print, ' Skipping....'                                              ;print info
     values = {which:'-1'}                                               ;create fake
  ENDELSE                                                                ;end if double check fails
  

  RETURN, values                ;returns values
END
;========================================================================================================================



;========================================================================================================================
pro en1719_mask1_K_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;1=open masked 2d spectrum
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask1/2014jun14/K/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask1/2014jun14/K/'

  IF which[0] EQ 'all' THEN which = ['fsbsb10', 'man8', 'msbsb10', 'msbsb121', 'msbsb30', 'msbsb51', $
                                     'msbsb81', 'msbsb89', 'msbsb8', 'msbsb92', 'msbsr104', 'msbsr16', $
                                     'msbsr49', 'msbsr66', 'msbsr71', 'msbsr83', 'msbsr97', 'rest1296', $
                                     'rest1401', 'rest1441', 'rest1745', 'rest1771', 'rest1792', 'rest2118', $
                                     'rest2250', 'rest2432', 'rest2477', 'rest3200', 'rest3458', 'rest361', $
                                     'rest4230', 'rest4939', 'rest4946', 'rest4948', 'rest4985', 'rest5247', $
                                     'rest5334', 'st21']

 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = en1719_mask1_K_extract_settings(which[zz])              ;get settings
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
  ENDFOR                                                                                             ;end loop over all detections
  
END	
;========================================================================================================================
