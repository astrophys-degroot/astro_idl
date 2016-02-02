;========================================================================================================================
function xmm105_mask2_H_extract_settings, pick
  
  CASE pick OF  

     'clhi0' :  mask = {which:'clhi0', dfile:'xmm105_mask2_v1_H_clhi0_eps.fits', wfile:'xmm105_mask2_v1_H_clhi0_sig.fits', $
                        rfile:'xmm105_mask2_v1_H_clhi0_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=3.0', 'c=36.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'cllow3' :  mask = {which:'cllow3', dfile:'xmm105_mask2_v1_H_cllow3_eps.fits', wfile:'xmm105_mask2_v1_H_cllow3_sig.fits', $
                         rfile:'xmm105_mask2_v1_H_cllow3_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 18.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'cllow9' :  mask = {which:'cllow9', dfile:'xmm105_mask2_v1_H_cllow9_eps.fits', wfile:'xmm105_mask2_v1_H_cllow9_sig.fits', $
                         rfile:'xmm105_mask2_v1_H_cllow9_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=44.5', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 40.0', 'MU LT 50.0', 'SIG GT 0.0']}
  
     'fg32' :  mask = {which:'fg32', dfile:'xmm105_mask2_v1_H_fg32_eps.fits', wfile:'xmm105_mask2_v1_H_fg32_sig.fits', $
                       rfile:'xmm105_mask2_v1_H_fg32_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_medium', $
                       xwhich:0, flip:0, $
                       guess:['mu=60.8', 'sig=3.0', 'c=18.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 55.0', 'MU LT 65.0', 'SIG GT 0.0']}
     
     'pzhi15' :  mask = {which:'pzhi15', dfile:'xmm105_mask2_v1_H_pzhi15_eps.fits', wfile:'xmm105_mask2_v1_H_pzhi15_sig.fits', $
                         rfile:'xmm105_mask2_v1_H_pzhi15_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=25.5', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzhi17' :  mask = {which:'pzhi17', dfile:'xmm105_mask2_v1_H_pzhi17_eps.fits', wfile:'xmm105_mask2_v1_H_pzhi17_sig.fits', $
                         rfile:'xmm105_mask2_v1_H_pzhi17_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=28.7', 'sig=3.0', 'c=18.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 24.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi18' :  mask = {which:'pzhi18', dfile:'xmm105_mask2_v1_H_pzhi18_eps.fits', wfile:'xmm105_mask2_v1_H_pzhi18_sig.fits', $
                         rfile:'xmm105_mask2_v1_H_pzhi18_eps.reg', $
                         fit:'full', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=56.0', 'sig=3.0', 'c=21.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 50.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'pzlow2861' :  mask = {which:'pzlow2861', dfile:'xmm105_mask2_v1_H_pzlow2861_eps.fits', wfile:'xmm105_mask2_v1_H_pzlow2861_sig.fits', $
                            rfile:'xmm105_mask2_v1_H_pzlow2861_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=26.2', 'sig=3.0', 'c=16.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 24.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzlow2912' :  mask = {which:'pzlow2912', dfile:'xmm105_mask2_v1_H_pzlow2912_eps.fits', wfile:'xmm105_mask2_v1_H_pzlow2912_sig.fits', $
                            rfile:'xmm105_mask2_v1_H_pzlow2912_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.5', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 4.0']}
 
     'pzlow3738' :  mask = {which:'pzlow3738', dfile:'xmm105_mask2_v1_H_pzlow3738_eps.fits', wfile:'xmm105_mask2_v1_H_pzlow3738_sig.fits', $
                            rfile:'xmm105_mask2_v1_H_pzlow3738_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=24.0', 'sig=3.0', 'c=51.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 18.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'pzmed304' :  mask = {which:'pzmed304', dfile:'xmm105_mask2_v1_H_pzmed304_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed304_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed304_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.4', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 32.0', 'SIG GT 0.0']}
     
     'pzmed346' :  mask = {which:'pzmed346', dfile:'xmm105_mask2_v1_H_pzmed346_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed346_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed346_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.6', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'pzmed368' :  mask = {which:'pzmed368', dfile:'xmm105_mask2_v1_H_pzmed368_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed368_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed368_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed423' :  mask = {which:'pzmed423', dfile:'xmm105_mask2_v1_H_pzmed423_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed423_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed423_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=17.5', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzmed429' :  mask = {which:'pzmed429', dfile:'xmm105_mask2_v1_H_pzmed429_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed429_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed429_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 22.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzmed441' :  mask = {which:'pzmed441', dfile:'xmm105_mask2_v1_H_pzmed441_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed441_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed441_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.4', 'sig=3.0', 'c=33.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzmed450' :  mask = {which:'pzmed450', dfile:'xmm105_mask2_v1_H_pzmed450_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed450_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed450_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=37.5', 'sig=2.6', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 32.0', 'MU LT 44.0', 'SIG GT 0.0']}
     
     'pzmed458' :  mask = {which:'pzmed458', dfile:'xmm105_mask2_v1_H_pzmed458_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed458_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed458_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.2', 'sig=2.0', 'c=24.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzmed472' :  mask = {which:'pzmed472', dfile:'xmm105_mask2_v1_H_pzmed472_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed472_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed472_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'pzmed496' :  mask = {which:'pzmed496', dfile:'xmm105_mask2_v1_H_pzmed496_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed496_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed496_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.5', 'sig=2.4', 'c=18.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'pzmed513' :  mask = {which:'pzmed513', dfile:'xmm105_mask2_v1_H_pzmed513_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed513_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed513_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=2.5', 'c=19.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'pzmed549' :  mask = {which:'pzmed549', dfile:'xmm105_mask2_v1_H_pzmed549_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed549_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed549_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=34.2', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'pzmed553' :  mask = {which:'pzmed553', dfile:'xmm105_mask2_v1_H_pzmed553_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed553_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed553_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.2', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzmed569' :  mask = {which:'pzmed569', dfile:'xmm105_mask2_v1_H_pzmed569_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed569_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed569_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=57.8', 'sig=3.0', 'c=26.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 50.0', 'MU LT 65.0', 'SIG GT 0.0']}
 
     'pzmed659' :  mask = {which:'pzmed659', dfile:'xmm105_mask2_v1_H_pzmed659_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed659_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed659_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=24.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzmed664' :  mask = {which:'pzmed664', dfile:'xmm105_mask2_v1_H_pzmed664_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed664_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed664_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed690' :  mask = {which:'pzmed690', dfile:'xmm105_mask2_v1_H_pzmed690_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed690_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed690_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed692' :  mask = {which:'pzmed692', dfile:'xmm105_mask2_v1_H_pzmed692_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed692_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed692_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.5', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzmed730' :  mask = {which:'pzmed730', dfile:'xmm105_mask2_v1_H_pzmed730_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed730_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed730_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.8', 'sig=3.0', 'c=28.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzmed776' :  mask = {which:'pzmed776', dfile:'xmm105_mask2_v1_H_pzmed776_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed776_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed776_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed778' :  mask = {which:'pzmed778', dfile:'xmm105_mask2_v1_H_pzmed778_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed778_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed778_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=21.8', 'sig=2.4', 'c=80.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 26.0', 'SIG GT 0.0']}
     
     'pzmed826' :  mask = {which:'pzmed826', dfile:'xmm105_mask2_v1_H_pzmed826_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed826_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed826_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'pzmed856' :  mask = {which:'pzmed856', dfile:'xmm105_mask2_v1_H_pzmed856_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed856_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed856_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.8', 'sig=2.6', 'c=26.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 16.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'pzmed859' :  mask = {which:'pzmed859', dfile:'xmm105_mask2_v1_H_pzmed859_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed859_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed859_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.0', 'sig=2.4', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 22.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
'pzmed863' :  mask = {which:'pzmed863', dfile:'xmm105_mask2_v1_H_pzmed863_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed863_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed863_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed938' :  mask = {which:'pzmed938', dfile:'xmm105_mask2_v1_H_pzmed938_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed938_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed938_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=27.8', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'pzmed941' :  mask = {which:'pzmed941', dfile:'xmm105_mask2_v1_H_pzmed941_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed941_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed941_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed967' :  mask = {which:'pzmed967', dfile:'xmm105_mask2_v1_H_pzmed967_eps.fits', wfile:'xmm105_mask2_v1_H_pzmed967_sig.fits', $
                           rfile:'xmm105_mask2_v1_H_pzmed967_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'st6' :  mask = {which:'st6', dfile:'xmm105_mask2_v1_H_st6_eps.fits', wfile:'xmm105_mask2_v1_H_st6_sig.fits', $
                      rfile:'xmm105_mask2_v1_H_st6_eps.reg', $
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
pro xmm105_mask2_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/xmm105_mask2_v1/2014nov17/H/'
  outdir = indir
  IF which[0] EQ 'all' THEN which = ['clhi0', 'cllow3', 'cllow9', 'fg32', 'pzhi15', 'pzhi17', 'pzhi18', $
                                     'pzlow2861', 'pzlow2912', 'pzlow3738', 'pzmed304', 'pzmed346', 'pzmed368', $
                                     'pzmed423', 'pzmed429', 'pzmed441', 'pzmed450', 'pzmed458', 'pzmed472', 'pzmed496', $
                                     'pzmed513', 'pzmed549', 'pzmed553', 'pzmed569', 'pzmed659', 'pzmed664', 'pzmed690', $
                                     'pzmed692', 'pzmed730', 'pzmed776', 'pzmed778', 'pzmed826', 'pzmed856', 'pzmed859', $
                                     'pzmed863', 'pzmed938', 'pzmed941', 'pzmed967', 'st6']
  

  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = xmm105_mask2_H_extract_settings(which[zz])              ;get settings
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
