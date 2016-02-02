;========================================================================================================================
function xmm113_mask9_H_extract_settings, pick
  

  CASE pick OF 
  
     'pzhi19' :  mask = {which:'pzhi19', dfile:'xmm113_mask9_v1_H_pzhi19_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi19_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi19_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=16.5', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 12.0', 'MU LT 22.0', 'SIG GT 0.0']}
     
     'pzhi25' :  mask = {which:'pzhi25', dfile:'xmm113_mask9_v1_H_pzhi25_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi25_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi25_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzhi26' :  mask = {which:'pzhi26', dfile:'xmm113_mask9_v1_H_pzhi26_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi26_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi26_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=17.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzhi32' :  mask = {which:'pzhi32', dfile:'xmm113_mask9_v1_H_pzhi32_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi32_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi32_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=26.8', 'sig=3.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
     
     'pzhi41' :  mask = {which:'pzhi41', dfile:'xmm113_mask9_v1_H_pzhi41_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi41_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi41_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=29.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 28.0', 'MU LT 38.0', 'SIG GT 0.0']}
     
     'pzhi42' :  mask = {which:'pzhi42', dfile:'xmm113_mask9_v1_H_pzhi42_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi42_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi42_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=38.2', 'sig=3.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 32.0', 'MU LT 46.0', 'SIG GT 0.0']}
     
     'pzhi45' :  mask = {which:'pzhi45', dfile:'xmm113_mask9_v1_H_pzhi45_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi45_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi45_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi47' :  mask = {which:'pzhi47', dfile:'xmm113_mask9_v1_H_pzhi47_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi47_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi47_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=20.3', 'sig=3.0', 'c=35.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
     
     'pzhi50' :  mask = {which:'pzhi50', dfile:'xmm113_mask9_v1_H_pzhi50_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi50_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi50_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'pzhi59' :  mask = {which:'pzhi59', dfile:'xmm113_mask9_v1_H_pzhi59_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi59_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi59_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=14.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 8.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'pzhi64' :  mask = {which:'pzhi64', dfile:'xmm113_mask9_v1_H_pzhi64_eps.fits', wfile:'xmm113_mask9_v1_H_pzhi64_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_pzhi64_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=32.9', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'pzlow1223' :  mask = {which:'pzlow1223', dfile:'xmm113_mask9_v1_H_pzlow1223_eps.fits', wfile:'xmm113_mask9_v1_H_pzlow1223_sig.fits', $
                            rfile:'xmm113_mask9_v1_H_pzlow1223_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=26.8', 'sig=2.0', 'c=3.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 24.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow2335' :  mask = {which:'pzlow2335', dfile:'xmm113_mask9_v1_H_pzlow2335_eps.fits', wfile:'xmm113_mask9_v1_H_pzlow2335_sig.fits', $
                            rfile:'xmm113_mask9_v1_H_pzlow2335_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow2434' :  mask = {which:'pzlow2434', dfile:'xmm113_mask9_v1_H_pzlow2434_eps.fits', wfile:'xmm113_mask9_v1_H_pzlow2434_sig.fits', $
                            rfile:'xmm113_mask9_v1_H_pzlow2434_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=16.3', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 8.0', 'MU LT 18.0', 'SIG GT 0.0']}
     
     'pzlow2447' :  mask = {which:'pzlow2447', dfile:'xmm113_mask9_v1_H_pzlow2447_eps.fits', wfile:'xmm113_mask9_v1_H_pzlow2447_sig.fits', $
                            rfile:'xmm113_mask9_v1_H_pzlow2447_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow2594' :  mask = {which:'pzlow2594', dfile:'xmm113_mask9_v1_H_pzlow2594_eps.fits', wfile:'xmm113_mask9_v1_H_pzlow2594_sig.fits', $
                            rfile:'xmm113_mask9_v1_H_pzlow2594_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'pzlow985' :  mask = {which:'pzlow985', dfile:'xmm113_mask9_v1_H_pzlow985_eps.fits', wfile:'xmm113_mask9_v1_H_pzlow985_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzlow985_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 15.0', 'MU LT 25.0', 'SIG GT 0.0']}
     
     'pzmed230' :  mask = {which:'pzmed230', dfile:'xmm113_mask9_v1_H_pzmed230_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed230_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed230_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=15.4', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 12.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzmed368' :  mask = {which:'pzmed368', dfile:'xmm113_mask9_v1_H_pzmed368_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed368_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed368_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 16.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'pzmed373' :  mask = {which:'pzmed373', dfile:'xmm113_mask9_v1_H_pzmed373_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed373_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed373_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed409' :  mask = {which:'pzmed409', dfile:'xmm113_mask9_v1_H_pzmed409_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed409_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed409_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=15.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'pzmed446' :  mask = {which:'pzmed446', dfile:'xmm113_mask9_v1_H_pzmed446_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed446_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed446_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed459' :  mask = {which:'pzmed459', dfile:'xmm113_mask9_v1_H_pzmed459_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed459_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed459_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'pzmed471' :  mask = {which:'pzmed471', dfile:'xmm113_mask9_v1_H_pzmed471_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed471_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed471_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=15.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
     
     'pzmed476' :  mask = {which:'pzmed476', dfile:'xmm113_mask9_v1_H_pzmed476_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed476_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed476_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.2', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'pzmed520' :  mask = {which:'pzmed520', dfile:'xmm113_mask9_v1_H_pzmed520_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed520_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed520_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
     
     'pzmed613' :  mask = {which:'pzmed613', dfile:'xmm113_mask9_v1_H_pzmed613_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed613_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed613_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=50.1', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0']}
 
     'pzmed646' :  mask = {which:'pzmed646', dfile:'xmm113_mask9_v1_H_pzmed646_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed646_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed646_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzmed688' :  mask = {which:'pzmed688', dfile:'xmm113_mask9_v1_H_pzmed688_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed688_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed688_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=50.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0']}
     
     'pzmed692' :  mask = {which:'pzmed692', dfile:'xmm113_mask9_v1_H_pzmed692_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed692_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed692_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.8', 'sig=3.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'pzmed746' :  mask = {which:'pzmed746', dfile:'xmm113_mask9_v1_H_pzmed746_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed746_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed746_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed757' :  mask = {which:'pzmed757', dfile:'xmm113_mask9_v1_H_pzmed757_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed757_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed757_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 3.0']}
 
     'pzmed775' :  mask = {which:'pzmed775', dfile:'xmm113_mask9_v1_H_pzmed775_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed775_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed775_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 16.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'pzmed782' :  mask = {which:'pzmed782', dfile:'xmm113_mask9_v1_H_pzmed782_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed782_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed782_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 28.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'pzmed802' :  mask = {which:'pzmed802', dfile:'xmm113_mask9_v1_H_pzmed802_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed802_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed802_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'pzmed808' :  mask = {which:'pzmed808', dfile:'xmm113_mask9_v1_H_pzmed808_eps.fits', wfile:'xmm113_mask9_v1_H_pzmed808_sig.fits', $
                           rfile:'xmm113_mask9_v1_H_pzmed808_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'spzo27' :  mask = {which:'spzo27', dfile:'xmm113_mask9_v1_H_spzo27_eps.fits', wfile:'xmm113_mask9_v1_H_spzo27_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_spzo27_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=25.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'spzo35' :  mask = {which:'spzo35', dfile:'xmm113_mask9_v1_H_spzo35_eps.fits', wfile:'xmm113_mask9_v1_H_spzo35_sig.fits', $
                         rfile:'xmm113_mask9_v1_H_spzo35_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=25.8', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'st24' :  mask = {which:'st24', dfile:'xmm113_mask9_v1_H_st24_eps.fits', wfile:'xmm113_mask9_v1_H_st24_sig.fits', $
                       rfile:'xmm113_mask9_v1_H_st24_eps.reg', $
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
pro xmm113_mask9_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = ''
  outdir = ''
  IF which[0] EQ 'all' THEN which = ['eps.fits', 'pzhi19', 'pzhi25', 'pzhi26', 'pzhi32', 'pzhi41', 'pzhi42', $
                                     'pzhi45', 'pzhi47', 'pzhi50', 'pzhi59', 'pzhi64', 'pzlow1223', 'pzlow2335', $
                                     'pzlow2434', 'pzlow2447', 'pzlow2594', 'pzlow985', 'pzmed230', 'pzmed368', $
                                     'pzmed373', 'pzmed409', 'pzmed446', 'pzmed459', 'pzmed471', 'pzmed476', $
                                     'pzmed520', 'pzmed613', 'pzmed646', 'pzmed688', 'pzmed692', 'pzmed746', $
                                     'pzmed757', 'pzmed775', 'pzmed782', 'pzmed802', 'pzmed808', 'spzo27', $
                                     'spzo35', 'st24']
  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = xmm113_mask9_H_extract_settings(which[zz])              ;get settings
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
