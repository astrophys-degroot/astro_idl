;========================================================================================================================
function en1719_mask2_K_extract_settings, pick
  
  CASE pick OF   
     'fsbsb2' :  mask = {which:'fsbsb2', dfile:'en1719_mask2_K_fsbsb2_eps.fits', wfile:'en1719_mask2_K_fsbsb2_sig.fits', $
                         rfile:'en1719_mask2_K_fsbsb2_eps.reg', $
                         fit:'gauss3', border:2, nosky:'kband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=20.8', 'sig=4.0', 'c=20.0', 'x0=-0.2', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'fsbsb5' :  mask = {which:'fsbsb5', dfile:'en1719_mask2_K_fsbsb5_eps.fits', wfile:'en1719_mask2_K_fsbsb5_sig.fits', $
                         rfile:'en1719_mask2_K_fsbsb5_eps.reg', $
                         fit:'gauss3', border:2, nosky:'kband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=25.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 16.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'fsbsr11' :  mask = {which:'fsbsr11', dfile:'en1719_mask2_K_fsbsr11_eps.fits', wfile:'en1719_mask2_K_fsbsr11_sig.fits', $
                          rfile:'en1719_mask2_K_fsbsr11_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=24.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'man10' :  mask = {which:'man10', dfile:'en1719_mask2_K_man10_eps.fits', wfile:'en1719_mask2_K_man10_sig.fits', $
                        rfile:'en1719_mask2_K_man10_eps.reg', $
                        fit:'gauss3', border:2, nosky:'kband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=36.8', 'sig=4.0', 'c=25.0', 'x0=0.1', 'x1=-0.01'], $
                        priors:['MU GT 34.0', 'MU LT 46.0', 'SIG GT 0.0']}
     
     'man9' :  mask = {which:'man9', dfile:'en1719_mask2_K_man10_eps.fits', wfile:'en1719_mask2_K_man10_sig.fits', $
                        rfile:'en1719_mask2_K_man10_eps.reg', $
                        fit:'gauss3', border:2, nosky:'kband_mosfire', $
                        xwhich:['man10', 'man9'], flip:0, $
                        guess:['mu=68.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 58.0', 'MU LT 72.0', 'SIG GT 0.0']}
 
     'man1' :  mask = {which:'man1', dfile:'en1719_mask2_K_man1_eps.fits', wfile:'en1719_mask2_K_man1_sig.fits', $
                       rfile:'en1719_mask2_K_man1_eps.reg', $
                       fit:'gauss3', border:2, nosky:'kband_faint', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'man21' :  mask = {which:'man21', dfile:'en1719_mask2_K_man21_eps.fits', wfile:'en1719_mask2_K_man21_sig.fits', $
                        rfile:'en1719_mask2_K_man21_eps.reg', $
                        fit:'gauss3', border:2, nosky:'kband_faint', $
                        xwhich:0, flip:0, $
                        guess:['mu=15.8', 'sig=4.0', 'c=15.0', 'x0=-0.2', 'x1=0.01'], $
                        priors:['MU GT 12.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'man22' :  mask = {which:'man22', dfile:'en1719_mask2_K_man22_eps.fits', wfile:'en1719_mask2_K_man22_sig.fits', $
                        rfile:'en1719_mask2_K_man22_eps.reg', $
                        fit:'gauss3', border:2, nosky:'kband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=52.8', 'sig=4.0', 'c=20.0', 'x0=-0.1', 'x1=-0.01'], $
                        priors:['MU GT 48.0', 'MU LT 64.0', 'SIG GT 0.0']}
 
     'new1' :  mask = {which:'new1', dfile:'en1719_mask2_K_man22_eps.fits', wfile:'en1719_mask2_K_man22_sig.fits', $
                        rfile:'en1719_mask2_K_man22_eps.reg', $
                        fit:'gauss3', border:2, nosky:'kband_mosfire', $
                        xwhich:['man22', 'new1'], flip:0, $
                        guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=-0.1', 'x1=-0.01'], $
                        priors:['MU GT 16.0', 'MU LT 28.0', 'SIG GT 0.0']}

     'msbsb32' :  mask = {which:'msbsb32', dfile:'en1719_mask2_K_msbsb32_eps.fits', wfile:'en1719_mask2_K_msbsb32_sig.fits', $
                          rfile:'en1719_mask2_K_msbsb32_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=34.5', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 22.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest3487' :  mask = {which:'rest3487', dfile:'en1719_mask2_K_msbsb32_eps.fits', wfile:'en1719_mask2_K_msbsb32_sig.fits', $
                          rfile:'en1719_mask2_K_msbsb32_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:['msbsb32', 'rest3487'], flip:0, $
                          guess:['mu=4.5', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=-0.01'], $
                          priors:['MU GT 0.0', 'MU LT 10.0', 'SIG GT 0.0']}
 
     'msbsb33' :  mask = {which:'msbsb33', dfile:'en1719_mask2_K_msbsb33_eps.fits', wfile:'en1719_mask2_K_msbsb33_sig.fits', $
                          rfile:'en1719_mask2_K_msbsb33_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb38' :  mask = {which:'msbsb38', dfile:'en1719_mask2_K_msbsb38_eps.fits', wfile:'en1719_mask2_K_msbsb38_sig.fits', $
                          rfile:'en1719_mask2_K_msbsb38_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=42.8', 'sig=4.0', 'c=40.0', 'x0=-0.2', 'x1=0.01'], $
                          priors:['MU GT 34.0', 'MU LT 52.0', 'SIG GT 0.0']}
 
     'msbsb4' :  mask = {which:'msbsb4', dfile:'en1719_mask2_K_msbsb4_eps.fits', wfile:'en1719_mask2_K_msbsb4_sig.fits', $
                         rfile:'en1719_mask2_K_msbsb4_eps.reg', $
                         fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=26.8', 'sig=4.0', 'c=45.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb98' :  mask = {which:'msbsb98', dfile:'en1719_mask2_K_msbsb98_eps.fits', wfile:'en1719_mask2_K_msbsb98_sig.fits', $
                          rfile:'en1719_mask2_K_msbsb98_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=35.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 32.0', 'MU LT 46.0', 'SIG GT 0.0']}
 
     'rest696' :  mask = {which:'rest696', dfile:'en1719_mask2_K_msbsb98_eps.fits', wfile:'en1719_mask2_K_msbsb98_sig.fits', $
                          rfile:'en1719_mask2_K_msbsb98_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:['msbsb98', 'rest696'], flip:0, $
                          guess:['mu=70.2', 'sig=5.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 60.0', 'MU LT 74.0', 'SIG GT 0.0']}
     
     'msbsr106' :  mask = {which:'msbsr106', dfile:'en1719_mask2_K_msbsr106_eps.fits', wfile:'en1719_mask2_K_msbsr106_sig.fits', $
                           rfile:'en1719_mask2_K_msbsr106_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr25' :  mask = {which:'msbsr25', dfile:'en1719_mask2_K_msbsr25_eps.fits', wfile:'en1719_mask2_K_msbsr25_sig.fits', $
                          rfile:'en1719_mask2_K_msbsr25_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=30.8', 'sig=3.0', 'c=50.0', 'x0=0.1', 'x1=-0.01'], $
                          priors:['MU GT 22.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest3763' :  mask = {which:'rest3763', dfile:'en1719_mask2_K_msbsr25_eps.fits', wfile:'en1719_mask2_K_msbsr25_sig.fits', $
                          rfile:'en1719_mask2_K_rest3763_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:['msbsr25', 'rest3763'], flip:0, $
                          guess:['mu=15.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'msbsr28' :  mask = {which:'msbsr28', dfile:'en1719_mask2_K_msbsr28_eps.fits', wfile:'en1719_mask2_K_msbsr28_sig.fits', $
                          rfile:'en1719_mask2_K_msbsr28_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr45' :  mask = {which:'msbsr45', dfile:'en1719_mask2_K_msbsr45_eps.fits', wfile:'en1719_mask2_K_msbsr45_sig.fits', $
                          rfile:'en1719_mask2_K_msbsr45_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=20.8', 'sig=4.0', 'c=30.0', 'x0=-0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'msbsr57' :  mask = {which:'msbsr57', dfile:'en1719_mask2_K_msbsr57_eps.fits', wfile:'en1719_mask2_K_msbsr57_sig.fits', $
                          rfile:'en1719_mask2_K_msbsr57_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=28.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 18.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr60' :  mask = {which:'msbsr60', dfile:'en1719_mask2_K_msbsr60_eps.fits', wfile:'en1719_mask2_K_msbsr60_sig.fits', $
                          rfile:'en1719_mask2_K_msbsr60_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1165' :  mask = {which:'rest1165', dfile:'en1719_mask2_K_rest1165_eps.fits', wfile:'en1719_mask2_K_rest1165_sig.fits', $
                           rfile:'en1719_mask2_K_rest1165_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1184' :  mask = {which:'rest1184', dfile:'en1719_mask2_K_rest1184_eps.fits', wfile:'en1719_mask2_K_rest1184_sig.fits', $
                           rfile:'en1719_mask2_K_rest1184_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=3.0', 'c=65.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1245' :  mask = {which:'rest1245', dfile:'en1719_mask2_K_rest1245_eps.fits', wfile:'en1719_mask2_K_rest1245_sig.fits', $
                           rfile:'en1719_mask2_K_rest1245_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.5', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'rest1671' :  mask = {which:'rest1671', dfile:'en1719_mask2_K_rest1671_eps.fits', wfile:'en1719_mask2_K_rest1671_sig.fits', $
                           rfile:'en1719_mask2_K_rest1671_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'rest1756' :  mask = {which:'rest1756', dfile:'en1719_mask2_K_rest1756_eps.fits', wfile:'en1719_mask2_K_rest1756_sig.fits', $
                           rfile:'en1719_mask2_K_rest1756_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=29.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest3167' :  mask = {which:'rest3167', dfile:'en1719_mask2_K_rest3167_eps.fits', wfile:'en1719_mask2_K_rest3167_sig.fits', $
                           rfile:'en1719_mask2_K_rest3167_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'rest3635' :  mask = {which:'rest3635', dfile:'en1719_mask2_K_rest3635_eps.fits', wfile:'en1719_mask2_K_rest3635_sig.fits', $
                           rfile:'en1719_mask2_K_rest3635_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=21.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
     
     'rest3632' :  mask = {which:'rest3632', dfile:'en1719_mask2_K_rest3635_eps.fits', wfile:'en1719_mask2_K_rest3635_sig.fits', $
                           rfile:'en1719_mask2_K_rest3635_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:['rest3635', 'rest3632'], flip:0, $
                           guess:['mu=47.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 55.0', 'SIG GT 0.0']}
     
     'rest3771' :  mask = {which:'rest3771', dfile:'en1719_mask2_K_rest3771_eps.fits', wfile:'en1719_mask2_K_rest3771_sig.fits', $
                           rfile:'en1719_mask2_K_rest3771_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.8', 'sig=5.0', 'c=25.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'rest401' :  mask = {which:'rest401', dfile:'en1719_mask2_K_rest401_eps.fits', wfile:'en1719_mask2_K_rest401_sig.fits', $
                          rfile:'en1719_mask2_K_rest401_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=28.8', 'sig=3.0', 'c=240.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4795' :  mask = {which:'rest4795', dfile:'en1719_mask2_K_rest4795_eps.fits', wfile:'en1719_mask2_K_rest4795_sig.fits', $
                           rfile:'en1719_mask2_K_rest4795_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4814' :  mask = {which:'rest4814', dfile:'en1719_mask2_K_rest4814_eps.fits', wfile:'en1719_mask2_K_rest4814_sig.fits', $
                           rfile:'en1719_mask2_K_rest4814_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=27.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest4841' :  mask = {which:'rest4841', dfile:'en1719_mask2_K_rest4841_eps.fits', wfile:'en1719_mask2_K_rest4841_sig.fits', $
                           rfile:'en1719_mask2_K_rest4841_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=4.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 44.0', 'MU LT 58.0', 'SIG GT 0.0']}
 
     'rest4865' :  mask = {which:'rest4865', dfile:'en1719_mask2_K_rest4865_eps.fits', wfile:'en1719_mask2_K_rest4865_sig.fits', $
                           rfile:'en1719_mask2_K_rest4865_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest486' :  mask = {which:'rest486', dfile:'en1719_mask2_K_rest486_eps.fits', wfile:'en1719_mask2_K_rest486_sig.fits', $
                          rfile:'en1719_mask2_K_rest486_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=16.2', 'sig=3.0', 'c=90.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 12.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'rest4874' :  mask = {which:'rest4874', dfile:'en1719_mask2_K_rest4874_eps.fits', wfile:'en1719_mask2_K_rest4874_sig.fits', $
                           rfile:'en1719_mask2_K_rest4874_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4935' :  mask = {which:'rest4935', dfile:'en1719_mask2_K_rest4935_eps.fits', wfile:'en1719_mask2_K_rest4935_sig.fits', $
                           rfile:'en1719_mask2_K_rest4935_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=27.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4995' :  mask = {which:'rest4995', dfile:'en1719_mask2_K_rest4995_eps.fits', wfile:'en1719_mask2_K_rest4995_sig.fits', $
                           rfile:'en1719_mask2_K_rest4995_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest598' :  mask = {which:'rest598', dfile:'en1719_mask2_K_rest598_eps.fits', wfile:'en1719_mask2_K_rest598_sig.fits', $
                          rfile:'en1719_mask2_K_rest598_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=18.8', 'sig=4.0', 'c=90.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 12.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'rest910' :  mask = {which:'rest910', dfile:'en1719_mask2_K_rest910_eps.fits', wfile:'en1719_mask2_K_rest910_sig.fits', $
                          rfile:'en1719_mask2_K_rest910_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest973' :  mask = {which:'rest973', dfile:'en1719_mask2_K_rest973_eps.fits', wfile:'en1719_mask2_K_rest973_sig.fits', $
                          rfile:'en1719_mask2_K_rest973_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=19.8', 'sig=2.5', 'c=120.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
'st28' :  mask = {which:'st28', dfile:'en1719_mask2_K_st28_eps.fits', wfile:'en1719_mask2_K_st28_sig.fits', $
rfile:'en1719_mask2_K_st28_eps.reg', $
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
pro en1719_mask2_K_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;1=open masked 2d spectrum
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask2/2014jun14/K/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask2/2014jun14/K/'

  IF which[0] EQ 'all' THEN which = ['fsbsb2', 'fsbsb5', 'fsbsr11', 'man10', 'man1', 'man21', $
                                     'man22', 'msbsb32', 'msbsb33', 'msbsb38', 'msbsb4', 'msbsb98', $
                                     'msbsr106', 'msbsr25', 'msbsr28', 'msbsr45', 'msbsr57', 'msbsr60', $
                                     'rest1165', 'rest1184', 'rest1245', 'rest1671', 'rest1756', 'rest3167', $
                                     'rest3635', 'rest3771', 'rest401', 'rest4795', 'rest4814', 'rest4841', $
                                     'rest4865', 'rest486', 'rest4874', 'rest4935', 'rest4995', 'rest598', $
                                     'rest910', 'rest973', 'st28']

 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = en1719_mask2_K_extract_settings(which[zz])              ;get settings
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
