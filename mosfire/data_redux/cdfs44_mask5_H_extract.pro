;========================================================================================================================
function cdfs44_mask5_H_extract_settings, pick
  
  CASE pick OF 
  
     'pzhi29' :  mask = {which:'pzhi29', dfile:'cdfs44_mask5_v2_H_pzhi29_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi29_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi29_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi31' :  mask = {which:'pzhi31', dfile:'cdfs44_mask5_v2_H_pzhi31_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi31_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi31_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi36' :  mask = {which:'pzhi36', dfile:'cdfs44_mask5_v2_H_pzhi36_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi36_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi36_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi39' :  mask = {which:'pzhi39', dfile:'cdfs44_mask5_v2_H_pzhi39_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi39_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi39_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=36.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 26.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'pzhi52' :  mask = {which:'pzhi52', dfile:'cdfs44_mask5_v2_H_pzhi52_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi52_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi52_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi59' :  mask = {which:'pzhi59', dfile:'cdfs44_mask5_v2_H_pzhi59_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi59_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi59_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=52.2', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 44.0', 'MU LT 56.0', 'SIG GT 0.0']}
 
     'pzhi60' :  mask = {which:'pzhi60', dfile:'cdfs44_mask5_v2_H_pzhi60_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi60_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi60_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=25.1', 'sig=4.0', 'c=1.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 20.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'pzhi62' :  mask = {which:'pzhi62', dfile:'cdfs44_mask5_v2_H_pzhi62_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi62_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi62_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi64' :  mask = {which:'pzhi64', dfile:'cdfs44_mask5_v2_H_pzhi64_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi64_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi64_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi67' :  mask = {which:'pzhi67', dfile:'cdfs44_mask5_v2_H_pzhi67_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi67_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi67_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi71' :  mask = {which:'pzhi71', dfile:'cdfs44_mask5_v2_H_pzhi71_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi71_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi71_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=14.2', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzhi72' :  mask = {which:'pzhi72', dfile:'cdfs44_mask5_v2_H_pzhi72_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi72_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi72_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi76' :  mask = {which:'pzhi76', dfile:'cdfs44_mask5_v2_H_pzhi76_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi76_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi76_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi77' :  mask = {which:'pzhi77', dfile:'cdfs44_mask5_v2_H_pzhi77_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi77_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi77_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi79' :  mask = {which:'pzhi79', dfile:'cdfs44_mask5_v2_H_pzhi79_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi79_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi79_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi80' :  mask = {which:'pzhi80', dfile:'cdfs44_mask5_v2_H_pzhi80_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi80_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi80_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi88' :  mask = {which:'pzhi88', dfile:'cdfs44_mask5_v2_H_pzhi88_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi88_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi88_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=26.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi91' :  mask = {which:'pzhi91', dfile:'cdfs44_mask5_v2_H_pzhi91_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi91_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi91_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi95' :  mask = {which:'pzhi95', dfile:'cdfs44_mask5_v2_H_pzhi95_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi95_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi95_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=43.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 40.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'pzhi97' :  mask = {which:'pzhi97', dfile:'cdfs44_mask5_v2_H_pzhi97_eps.fits', wfile:'cdfs44_mask5_v2_H_pzhi97_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_pzhi97_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow1816' :  mask = {which:'pzlow1816', dfile:'cdfs44_mask5_v2_H_pzlow1816_eps.fits', wfile:'cdfs44_mask5_v2_H_pzlow1816_sig.fits', $
                            rfile:'cdfs44_mask5_v2_H_pzlow1816_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed1052' :  mask = {which:'pzmed1052', dfile:'cdfs44_mask5_v2_H_pzmed1052_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed1052_sig.fits', $
                            rfile:'cdfs44_mask5_v2_H_pzmed1052_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1085' :  mask = {which:'pzmed1085', dfile:'cdfs44_mask5_v2_H_pzmed1085_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed1085_sig.fits', $
                            rfile:'cdfs44_mask5_v2_H_pzmed1085_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1095' :  mask = {which:'pzmed1095', dfile:'cdfs44_mask5_v2_H_pzmed1095_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed1095_sig.fits', $
                            rfile:'cdfs44_mask5_v2_H_pzmed1095_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=15.8', 'sig=4.0', 'c=18.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
     
     'pzmed1102' :  mask = {which:'pzmed1102', dfile:'cdfs44_mask5_v2_H_pzmed1102_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed1102_sig.fits', $
                            rfile:'cdfs44_mask5_v2_H_pzmed1102_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1139' :  mask = {which:'pzmed1139', dfile:'cdfs44_mask5_v2_H_pzmed1139_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed1139_sig.fits', $
                            rfile:'cdfs44_mask5_v2_H_pzmed1139_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed1193' :  mask = {which:'pzmed1193', dfile:'cdfs44_mask5_v2_H_pzmed1193_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed1193_sig.fits', $
                            rfile:'cdfs44_mask5_v2_H_pzmed1193_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1229' :  mask = {which:'pzmed1229', dfile:'cdfs44_mask5_v2_H_pzmed1229_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed1229_sig.fits', $
                            rfile:'cdfs44_mask5_v2_H_pzmed1229_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=14.1', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 25.0', 'SIG GT 0.0']}
 
     'pzmed303' :  mask = {which:'pzmed303', dfile:'cdfs44_mask5_v2_H_pzmed303_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed303_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed303_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed370' :  mask = {which:'pzmed370', dfile:'cdfs44_mask5_v2_H_pzmed370_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed370_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed370_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed446' :  mask = {which:'pzmed446', dfile:'cdfs44_mask5_v2_H_pzmed446_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed446_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed446_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed478' :  mask = {which:'pzmed478', dfile:'cdfs44_mask5_v2_H_pzmed478_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed478_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed478_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed552' :  mask = {which:'pzmed552', dfile:'cdfs44_mask5_v2_H_pzmed552_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed552_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed552_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=13.8', 'sig=4.0', 'c=2.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'pzmed577' :  mask = {which:'pzmed577', dfile:'cdfs44_mask5_v2_H_pzmed577_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed577_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed577_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed602' :  mask = {which:'pzmed602', dfile:'cdfs44_mask5_v2_H_pzmed602_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed602_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed602_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed607' :  mask = {which:'pzmed607', dfile:'cdfs44_mask5_v2_H_pzmed607_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed607_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed607_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed909' :  mask = {which:'pzmed909', dfile:'cdfs44_mask5_v2_H_pzmed909_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed909_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed909_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed946' :  mask = {which:'pzmed946', dfile:'cdfs44_mask5_v2_H_pzmed946_eps.fits', wfile:'cdfs44_mask5_v2_H_pzmed946_sig.fits', $
                           rfile:'cdfs44_mask5_v2_H_pzmed946_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'spzg98' :  mask = {which:'spzg98', dfile:'cdfs44_mask5_v2_H_spzg98_eps.fits', wfile:'cdfs44_mask5_v2_H_spzg98_sig.fits', $
                         rfile:'cdfs44_mask5_v2_H_spzg98_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'st31' :  mask = {which:'st31', dfile:'cdfs44_mask5_v2_H_st31_eps.fits', wfile:'cdfs44_mask5_v2_H_st31_sig.fits', $
                       rfile:'cdfs44_mask5_v2_H_st31_eps.reg', $
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
pro cdfs44_mask5_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/'
  IF which[0] EQ 'all' THEN which = ['eps.fits', 'pzhi29', 'pzhi31', 'pzhi36', 'pzhi39', 'pzhi52', 'pzhi59', $
                                     'pzhi60', 'pzhi62', 'pzhi64', 'pzhi67', 'pzhi71', 'pzhi72', 'pzhi76', $
                                     'pzhi77', 'pzhi79', 'pzhi80', 'pzhi88', 'pzhi91', 'pzhi95', 'pzhi97', $
                                     'pzlow1816', 'pzmed1052', 'pzmed1085', 'pzmed1095', 'pzmed1102', 'pzmed1139', $
                                     'pzmed1193', 'pzmed1229', 'pzmed303', 'pzmed370', 'pzmed446', 'pzmed478', $
                                     'pzmed552', 'pzmed577', 'pzmed602', 'pzmed607', 'pzmed909', 'pzmed946', 'spzg98', 'st31']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = cdfs44_mask5_H_extract_settings(which[zz])              ;get settings
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
