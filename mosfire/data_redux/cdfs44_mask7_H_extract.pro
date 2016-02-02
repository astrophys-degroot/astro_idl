;========================================================================================================================
function cdfs44_mask7_H_extract_settings, pick
  
  CASE pick OF 
     'pzhi17' :  mask = {which:'pzhi17', dfile:'cdfs44_mask7_v2_H_pzhi17_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi17_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi17_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=51.1', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'pzhi19' :  mask = {which:'pzhi19', dfile:'cdfs44_mask7_v2_H_pzhi19_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi19_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi19_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=14.5', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
     
     'pzhi24' :  mask = {which:'pzhi24', dfile:'cdfs44_mask7_v2_H_pzhi24_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi24_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi24_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi38' :  mask = {which:'pzhi38', dfile:'cdfs44_mask7_v2_H_pzhi38_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi38_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi38_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi40' :  mask = {which:'pzhi40', dfile:'cdfs44_mask7_v2_H_pzhi40_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi40_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi40_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=39.8', 'sig=2.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 34.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'pzhi42' :  mask = {which:'pzhi42', dfile:'cdfs44_mask7_v2_H_pzhi42_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi42_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi42_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=27.8', 'sig=2.0', 'c=70.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi48' :  mask = {which:'pzhi48', dfile:'cdfs44_mask7_v2_H_pzhi48_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi48_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi48_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=42.8', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 34.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'pzhi50' :  mask = {which:'pzhi50', dfile:'cdfs44_mask7_v2_H_pzhi50_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi50_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi50_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi54' :  mask = {which:'pzhi54', dfile:'cdfs44_mask7_v2_H_pzhi54_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi54_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi54_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=46.8', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 42.0', 'MU LT 54.0', 'SIG GT 0.0']}
     
     'pzhi93' :  mask = {which:'pzhi93', dfile:'cdfs44_mask7_v2_H_pzhi93_eps.fits', wfile:'cdfs44_mask7_v2_H_pzhi93_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_pzhi93_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=51.8', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 44.0', 'MU LT 56.0', 'SIG GT 0.0']}
     
     'pzlow1674' :  mask = {which:'pzlow1674', dfile:'cdfs44_mask7_v2_H_pzlow1674_eps.fits', wfile:'cdfs44_mask7_v2_H_pzlow1674_sig.fits', $
                            rfile:'cdfs44_mask7_v2_H_pzlow1674_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow1869' :  mask = {which:'pzlow1869', dfile:'cdfs44_mask7_v2_H_pzlow1869_eps.fits', wfile:'cdfs44_mask7_v2_H_pzlow1869_sig.fits', $
                            rfile:'cdfs44_mask7_v2_H_pzlow1869_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow2736' :  mask = {which:'pzlow2736', dfile:'cdfs44_mask7_v2_H_pzlow2736_eps.fits', wfile:'cdfs44_mask7_v2_H_pzlow2736_sig.fits', $
                            rfile:'cdfs44_mask7_v2_H_pzlow2736_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1170' :  mask = {which:'pzmed1170', dfile:'cdfs44_mask7_v2_H_pzmed1170_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed1170_sig.fits', $
                            rfile:'cdfs44_mask7_v2_H_pzmed1170_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1181' :  mask = {which:'pzmed1181', dfile:'cdfs44_mask7_v2_H_pzmed1181_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed1181_sig.fits', $
                            rfile:'cdfs44_mask7_v2_H_pzmed1181_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1195' :  mask = {which:'pzmed1195', dfile:'cdfs44_mask7_v2_H_pzmed1195_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed1195_sig.fits', $
                            rfile:'cdfs44_mask7_v2_H_pzmed1195_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1223' :  mask = {which:'pzmed1223', dfile:'cdfs44_mask7_v2_H_pzmed1223_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed1223_sig.fits', $
                            rfile:'cdfs44_mask7_v2_H_pzmed1223_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed1227' :  mask = {which:'pzmed1227', dfile:'cdfs44_mask7_v2_H_pzmed1227_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed1227_sig.fits', $
                            rfile:'cdfs44_mask7_v2_H_pzmed1227_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed200' :  mask = {which:'pzmed200', dfile:'cdfs44_mask7_v2_H_pzmed200_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed200_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed200_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed211' :  mask = {which:'pzmed211', dfile:'cdfs44_mask7_v2_H_pzmed211_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed211_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed211_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}

     'pzmed258' :  mask = {which:'pzmed258', dfile:'cdfs44_mask7_v2_H_pzmed258_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed258_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed258_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed283' :  mask = {which:'pzmed283', dfile:'cdfs44_mask7_v2_H_pzmed283_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed283_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed283_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed306' :  mask = {which:'pzmed306', dfile:'cdfs44_mask7_v2_H_pzmed306_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed306_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed306_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed341' :  mask = {which:'pzmed341', dfile:'cdfs44_mask7_v2_H_pzmed341_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed341_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed341_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed384' :  mask = {which:'pzmed384', dfile:'cdfs44_mask7_v2_H_pzmed384_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed384_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed384_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed444' :  mask = {which:'pzmed444', dfile:'cdfs44_mask7_v2_H_pzmed444_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed444_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed444_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed464' :  mask = {which:'pzmed464', dfile:'cdfs44_mask7_v2_H_pzmed464_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed464_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed464_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 28.0', 'MU LT 42.0', 'SIG GT 0.0']}
     
     'pzmed580' :  mask = {which:'pzmed580', dfile:'cdfs44_mask7_v2_H_pzmed580_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed580_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed580_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed640' :  mask = {which:'pzmed640', dfile:'cdfs44_mask7_v2_H_pzmed640_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed640_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed640_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed649' :  mask = {which:'pzmed649', dfile:'cdfs44_mask7_v2_H_pzmed649_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed649_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed649_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed776' :  mask = {which:'pzmed776', dfile:'cdfs44_mask7_v2_H_pzmed776_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed776_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed776_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed797' :  mask = {which:'pzmed797', dfile:'cdfs44_mask7_v2_H_pzmed797_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed797_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed797_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed799' :  mask = {which:'pzmed799', dfile:'cdfs44_mask7_v2_H_pzmed799_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed799_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed799_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed825' :  mask = {which:'pzmed825', dfile:'cdfs44_mask7_v2_H_pzmed825_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed825_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed825_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed836' :  mask = {which:'pzmed836', dfile:'cdfs44_mask7_v2_H_pzmed836_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed836_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed836_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed871' :  mask = {which:'pzmed871', dfile:'cdfs44_mask7_v2_H_pzmed871_eps.fits', wfile:'cdfs44_mask7_v2_H_pzmed871_sig.fits', $
                           rfile:'cdfs44_mask7_v2_H_pzmed871_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'spzg29' :  mask = {which:'spzg29', dfile:'cdfs44_mask7_v2_H_spzg29_eps.fits', wfile:'cdfs44_mask7_v2_H_spzg29_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_spzg29_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'spzg76' :  mask = {which:'spzg76', dfile:'cdfs44_mask7_v2_H_spzg76_eps.fits', wfile:'cdfs44_mask7_v2_H_spzg76_sig.fits', $
                         rfile:'cdfs44_mask7_v2_H_spzg76_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'spzo2' :  mask = {which:'spzo2', dfile:'cdfs44_mask7_v2_H_spzo2_eps.fits', wfile:'cdfs44_mask7_v2_H_spzo2_sig.fits', $
                        rfile:'cdfs44_mask7_v2_H_spzo2_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'st20' :  mask = {which:'st20', dfile:'cdfs44_mask7_v2_H_st20_eps.fits', wfile:'cdfs44_mask7_v2_H_st20_sig.fits', $
                       rfile:'cdfs44_mask7_v2_H_st20_eps.reg', $
                       fit:'full', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
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
pro cdfs44_mask7_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = ''
  outdir = indir
  IF which[0] EQ 'all' THEN which = ['pzhi17', 'pzhi19', 'pzhi24', 'pzhi38', 'pzhi40', 'pzhi42', 'pzhi48', $
                                     'pzhi50', 'pzhi54', 'pzhi93', 'pzlow1674', 'pzlow1869', 'pzlow2736', $
                                     'pzmed1170', 'pzmed1181', 'pzmed1195', 'pzmed1223', 'pzmed1227', $
                                     'pzmed200', 'pzmed211', 'pzmed258', 'pzmed283', 'pzmed306', 'pzmed341', $
                                     'pzmed384', 'pzmed444', 'pzmed464', 'pzmed580', 'pzmed640', 'pzmed649', $
                                     'pzmed776', 'pzmed797', 'pzmed799', 'pzmed825', 'pzmed836', 'pzmed871', $
                                     'spzg29', 'spzg76', 'spzo2', 'st20']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = cdfs44_mask7_H_extract_settings(which[zz])              ;get settings
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
