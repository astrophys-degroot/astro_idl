;========================================================================================================================
function en1719_mask3_K_extract_settings, pick
  
  CASE pick OF   
     'fsbsr26' :  mask = {which:'fsbsr26', dfile:'en1719_mask3_v2_K_fsbsr26_eps.fits', wfile:'en1719_mask3_v2_K_fsbsr26_sig.fits', $
                          rfile:'en1719_mask3_v2_K_fsbsr26_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=25.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 20.0', 'MU LT 32.0', 'SIG GT 0.0']}
     
     'man6' :  mask = {which:'man6', dfile:'en1719_mask3_v2_K_man6_eps.fits', wfile:'en1719_mask3_v2_K_man6_sig.fits', $
                       rfile:'en1719_mask3_v2_K_man6_eps.reg', $
                       fit:'gauss3', border:2, nosky:'kband_faint', $
                       xwhich:0, flip:0, $
                       guess:['mu=20.8', 'sig=2.0', 'c=10.0', 'x0=0.01', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0', 'SIG LT 7.0']}
     
     'msbsb107' :  mask = {which:'msbsb107', dfile:'en1719_mask3_v2_K_msbsb107_eps.fits', wfile:'en1719_mask3_v2_K_msbsb107_sig.fits', $
                           rfile:'en1719_mask3_v2_K_msbsb107_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=18.0', 'x0=-0.2', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'msbsb127b' :  mask = {which:'msbsb127b', dfile:'en1719_mask3_v2_K_msbsb127b_eps.fits', wfile:'en1719_mask3_v2_K_msbsb127b_sig.fits', $
                            rfile:'en1719_mask3_v2_K_msbsb127b_eps.reg', $
                            fit:'gauss3', border:2, nosky:'kband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=15.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsb84' :  mask = {which:'msbsb84', dfile:'en1719_mask3_v2_K_msbsb84_eps.fits', wfile:'en1719_mask3_v2_K_msbsb84_sig.fits', $
                          rfile:'en1719_mask3_v2_K_msbsb84_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr1' :  mask = {which:'msbsr1', dfile:'en1719_mask3_v2_K_msbsr1_eps.fits', wfile:'en1719_mask3_v2_K_msbsr1_sig.fits', $
                         rfile:'en1719_mask3_v2_K_msbsr1_eps.reg', $
                         fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=32.0', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'msbsr65' :  mask = {which:'msbsr65', dfile:'en1719_mask3_v2_K_msbsr65_eps.fits', wfile:'en1719_mask3_v2_K_msbsr65_sig.fits', $
                          rfile:'en1719_mask3_v2_K_msbsr65_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=14.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr6' :  mask = {which:'msbsr6', dfile:'en1719_mask3_v2_K_msbsr6_eps.fits', wfile:'en1719_mask3_v2_K_msbsr6_sig.fits', $
                         rfile:'en1719_mask3_v2_K_msbsr6_eps.reg', $
                         fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1120' :  mask = {which:'rest1120', dfile:'en1719_mask3_v2_K_rest1120_eps.fits', wfile:'en1719_mask3_v2_K_rest1120_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1120_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1179' :  mask = {which:'rest1179', dfile:'en1719_mask3_v2_K_rest1179_eps.fits', wfile:'en1719_mask3_v2_K_rest1179_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1179_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1220' :  mask = {which:'rest1220', dfile:'en1719_mask3_v2_K_rest1220_eps.fits', wfile:'en1719_mask3_v2_K_rest1220_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1220_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=41.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 38.0', 'MU LT 52.0', 'SIG GT 0.0', 'x1 LT 0.1']}

     'rest910' :  mask = {which:'rest910', dfile:'en1719_mask3_v2_K_rest1220_eps.fits', wfile:'en1719_mask3_v2_K_rest1220_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1220_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:['rest1220', 'rest910'], flip:0, $
                           guess:['mu=72.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 70.0', 'MU LT 82.0', 'SIG GT 0.0']}
 
     'rest1221' :  mask = {which:'rest1221', dfile:'en1719_mask3_v2_K_rest1221_eps.fits', wfile:'en1719_mask3_v2_K_rest1221_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1221_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=30.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 22.0', 'MU LT 36.0', 'SIG GT 0.0']}
     
     'rest1305' :  mask = {which:'rest1305', dfile:'en1719_mask3_v2_K_rest1305_eps.fits', wfile:'en1719_mask3_v2_K_rest1305_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1305_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1483' :  mask = {which:'rest1483', dfile:'en1719_mask3_v2_K_rest1483_eps.fits', wfile:'en1719_mask3_v2_K_rest1483_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1483_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=63.8', 'sig=4.0', 'c=5.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 52.0', 'MU LT 68.0', 'SIG GT 0.0']}
 
     'rest1504' :  mask = {which:'rest1504', dfile:'en1719_mask3_v2_K_rest1504_eps.fits', wfile:'en1719_mask3_v2_K_rest1504_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1504_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 22.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'rest1556' :  mask = {which:'rest1556', dfile:'en1719_mask3_v2_K_rest1556_eps.fits', wfile:'en1719_mask3_v2_K_rest1556_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1556_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=19.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'rest1564' :  mask = {which:'rest1564', dfile:'en1719_mask3_v2_K_rest1564_eps.fits', wfile:'en1719_mask3_v2_K_rest1564_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1564_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0', 'SIG LT 7.0', 'c LT 10.0']}
 
     'rest1689' :  mask = {which:'rest1689', dfile:'en1719_mask3_v2_K_rest1689_eps.fits', wfile:'en1719_mask3_v2_K_rest1689_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1689_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=30.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'rest1762' :  mask = {which:'rest1762', dfile:'en1719_mask3_v2_K_rest1762_eps.fits', wfile:'en1719_mask3_v2_K_rest1762_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1762_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 10.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'rest1947' :  mask = {which:'rest1947', dfile:'en1719_mask3_v2_K_rest1947_eps.fits', wfile:'en1719_mask3_v2_K_rest1947_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest1947_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=2.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest2185' :  mask = {which:'rest2185', dfile:'en1719_mask3_v2_K_rest2185_eps.fits', wfile:'en1719_mask3_v2_K_rest2185_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest2185_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest2212' :  mask = {which:'rest2212', dfile:'en1719_mask3_v2_K_rest2212_eps.fits', wfile:'en1719_mask3_v2_K_rest2212_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest2212_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=29.8', 'sig=4.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 22.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest2290' :  mask = {which:'rest2290', dfile:'en1719_mask3_v2_K_rest2290_eps.fits', wfile:'en1719_mask3_v2_K_rest2290_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest2290_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=3.0', 'c=4=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'rest3158' :  mask = {which:'rest3158', dfile:'en1719_mask3_v2_K_rest3158_eps.fits', wfile:'en1719_mask3_v2_K_rest3158_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest3158_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest3502' :  mask = {which:'rest3502', dfile:'en1719_mask3_v2_K_rest3502_eps.fits', wfile:'en1719_mask3_v2_K_rest3502_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest3502_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest3679' :  mask = {which:'rest3679', dfile:'en1719_mask3_v2_K_rest3679_eps.fits', wfile:'en1719_mask3_v2_K_rest3679_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest3679_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest3766' :  mask = {which:'rest3766', dfile:'en1719_mask3_v2_K_rest3766_eps.fits', wfile:'en1719_mask3_v2_K_rest3766_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest3766_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4286' :  mask = {which:'rest4286', dfile:'en1719_mask3_v2_K_rest4286_eps.fits', wfile:'en1719_mask3_v2_K_rest4286_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4286_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 18.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest4640' :  mask = {which:'rest4640', dfile:'en1719_mask3_v2_K_rest4640_eps.fits', wfile:'en1719_mask3_v2_K_rest4640_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4640_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=2.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 28.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'rest4692' :  mask = {which:'rest4692', dfile:'en1719_mask3_v2_K_rest4692_eps.fits', wfile:'en1719_mask3_v2_K_rest4692_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4692_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 32.0', 'SIG GT 0.0']}
     
     'rest4715' :  mask = {which:'rest4715', dfile:'en1719_mask3_v2_K_rest4715_eps.fits', wfile:'en1719_mask3_v2_K_rest4715_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4715_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=37.1', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 32.0', 'MU LT 48.0', 'SIG GT 0.0']}
     'rest4715b' :  mask = {which:'rest4715b', dfile:'en1719_mask3_v2_K_rest4715_eps.fits', wfile:'en1719_mask3_v2_K_rest4715_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4715_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:['rest4715', 'rest4715b'], flip:0, $
                           guess:['mu=54.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 50.0', 'MU LT 56.0', 'SIG GT 0.0']}
 
     'rest4757' :  mask = {which:'rest4757', dfile:'en1719_mask3_v2_K_rest4757_eps.fits', wfile:'en1719_mask3_v2_K_rest4757_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4757_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=5.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 16.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'rest4804' :  mask = {which:'rest4804', dfile:'en1719_mask3_v2_K_rest4804_eps.fits', wfile:'en1719_mask3_v2_K_rest4804_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4804_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4840' :  mask = {which:'rest4840', dfile:'en1719_mask3_v2_K_rest4840_eps.fits', wfile:'en1719_mask3_v2_K_rest4840_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4840_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4925' :  mask = {which:'rest4925', dfile:'en1719_mask3_v2_K_rest4925_eps.fits', wfile:'en1719_mask3_v2_K_rest4925_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4925_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=5.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 16.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'rest4963' :  mask = {which:'rest4963', dfile:'en1719_mask3_v2_K_rest4963_eps.fits', wfile:'en1719_mask3_v2_K_rest4963_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest4963_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=31.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 28.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'rest5225' :  mask = {which:'rest5225', dfile:'en1719_mask3_v2_K_rest5225_eps.fits', wfile:'en1719_mask3_v2_K_rest5225_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest5225_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest5229' :  mask = {which:'rest5229', dfile:'en1719_mask3_v2_K_rest5229_eps.fits', wfile:'en1719_mask3_v2_K_rest5229_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest5229_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.8', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'rest5249' :  mask = {which:'rest5249', dfile:'en1719_mask3_v2_K_rest5249_eps.fits', wfile:'en1719_mask3_v2_K_rest5249_sig.fits', $
                           rfile:'en1719_mask3_v2_K_rest5249_eps.reg', $
                           fit:'gauss3', border:2, nosky:'kband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=20.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 16.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'rest864' :  mask = {which:'rest864', dfile:'en1719_mask3_v2_K_rest864_eps.fits', wfile:'en1719_mask3_v2_K_rest864_sig.fits', $
                          rfile:'en1719_mask3_v2_K_rest864_eps.reg', $
                          fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'st17' :  mask = {which:'st17', dfile:'en1719_mask3_v2_K_st17_eps.fits', wfile:'en1719_mask3_v2_K_st17_sig.fits', $
                       rfile:'en1719_mask3_v2_K_st17_eps.reg', $
                       fit:'gauss3', border:2, nosky:'kband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=16.5', 'sig=3.2', 'c=2000.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'st9' :  mask = {which:'st9', dfile:'en1719_mask3_v2_K_st9_eps.fits', wfile:'en1719_mask3_v2_K_st9_sig.fits', $
                      rfile:'en1719_mask3_v2_K_st9_eps.reg', $
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
pro en1719_mask3_K_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;1=open masked 2d spectrum
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask3_v1/2014jun14/K/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask3_v1/2014jun14/K/'

  IF which[0] EQ 'all' THEN which = ['fsbsr26', 'man6', 'msbsb107', 'msbsb127b', 'msbsb84', 'msbsr1', $
                                     'msbsr65', 'msbsr6', 'rest1120', 'rest1179', 'rest1220', 'rest1221', $
                                     'rest1305', 'rest1483', 'rest1504', 'rest1556', 'rest1564', 'rest1689', $
                                     'rest1762', 'rest1947', 'rest2185', 'rest2212', 'rest2290', 'rest3158', $
                                     'rest3502', 'rest3679', 'rest3766', 'rest4286', 'rest4640', 'rest4692', $
                                     'rest4715', 'rest4757', 'rest4804', 'rest4840', 'rest4925', 'rest4963', $
                                     'rest5225', 'rest5229', 'rest5249', 'rest864', 'st17', 'st9']

 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = en1719_mask3_K_extract_settings(which[zz])              ;get settings
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
