;========================================================================================================================
function cdfs44_mask8_H_extract_settings, pick
  
  CASE pick OF  
     'pzhi26' :  mask = {which:'pzhi26', dfile:'cdfs44_mask8_v2_H_pzhi26_eps.fits', wfile:'cdfs44_mask8_v2_H_pzhi26_sig.fits', $
                         rfile:'cdfs44_mask8_v2_H_pzhi26_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi33' :  mask = {which:'pzhi33', dfile:'cdfs44_mask8_v2_H_pzhi33_eps.fits', wfile:'cdfs44_mask8_v2_H_pzhi33_sig.fits', $
                         rfile:'cdfs44_mask8_v2_H_pzhi33_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=49.3', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 42.0', 'MU LT 54.0', 'SIG GT 0.0']}
     
     'pzhi34' :  mask = {which:'pzhi34', dfile:'cdfs44_mask8_v2_H_pzhi34_eps.fits', wfile:'cdfs44_mask8_v2_H_pzhi34_sig.fits', $
                         rfile:'cdfs44_mask8_v2_H_pzhi34_eps.reg', $
                         fit:'full', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=30.4', 'sig=2.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'pzhi37' :  mask = {which:'pzhi37', dfile:'cdfs44_mask8_v2_H_pzhi37_eps.fits', wfile:'cdfs44_mask8_v2_H_pzhi37_sig.fits', $
                         rfile:'cdfs44_mask8_v2_H_pzhi37_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi44' :  mask = {which:'pzhi44', dfile:'cdfs44_mask8_v2_H_pzhi44_eps.fits', wfile:'cdfs44_mask8_v2_H_pzhi44_sig.fits', $
                         rfile:'cdfs44_mask8_v2_H_pzhi44_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=40.8', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 36.0', 'MU LT 46.0', 'SIG GT 0.0']}
 
     'pzhi47' :  mask = {which:'pzhi47', dfile:'cdfs44_mask8_v2_H_pzhi47_eps.fits', wfile:'cdfs44_mask8_v2_H_pzhi47_sig.fits', $
                         rfile:'cdfs44_mask8_v2_H_pzhi47_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi51' :  mask = {which:'pzhi51', dfile:'cdfs44_mask8_v2_H_pzhi51_eps.fits', wfile:'cdfs44_mask8_v2_H_pzhi51_sig.fits', $
                         rfile:'cdfs44_mask8_v2_H_pzhi51_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=31.1', 'sig=2.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'pzhi55' :  mask = {which:'pzhi55', dfile:'cdfs44_mask8_v2_H_pzhi55_eps.fits', wfile:'cdfs44_mask8_v2_H_pzhi55_sig.fits', $
                         rfile:'cdfs44_mask8_v2_H_pzhi55_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi61' :  mask = {which:'pzhi61', dfile:'cdfs44_mask8_v2_H_pzhi61_eps.fits', wfile:'cdfs44_mask8_v2_H_pzhi61_sig.fits', $
                         rfile:'cdfs44_mask8_v2_H_pzhi61_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=15.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
'pzmed1134' :  mask = {which:'pzmed1134', dfile:'cdfs44_mask8_v2_H_pzmed1134_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed1134_sig.fits', $
                            rfile:'cdfs44_mask8_v2_H_pzmed1134_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=45.8', 'sig=4.0', 'c=200.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 40.0', 'MU LT 54.0', 'SIG GT 0.0']}
 
     'pzmed1273' :  mask = {which:'pzmed1273', dfile:'cdfs44_mask8_v2_H_pzmed1273_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed1273_sig.fits', $
                            rfile:'cdfs44_mask8_v2_H_pzmed1273_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed300' :  mask = {which:'pzmed300', dfile:'cdfs44_mask8_v2_H_pzmed300_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed300_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed300_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed395' :  mask = {which:'pzmed395', dfile:'cdfs44_mask8_v2_H_pzmed395_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed395_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed395_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed417' :  mask = {which:'pzmed417', dfile:'cdfs44_mask8_v2_H_pzmed417_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed417_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed417_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=50.8', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 44.0', 'MU LT 56.0', 'SIG GT 0.0']}
     
     'pzmed483' :  mask = {which:'pzmed483', dfile:'cdfs44_mask8_v2_H_pzmed483_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed483_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed483_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed515' :  mask = {which:'pzmed515', dfile:'cdfs44_mask8_v2_H_pzmed515_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed515_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed515_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed517' :  mask = {which:'pzmed517', dfile:'cdfs44_mask8_v2_H_pzmed517_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed517_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed517_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed547' :  mask = {which:'pzmed547', dfile:'cdfs44_mask8_v2_H_pzmed547_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed547_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed547_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed557' :  mask = {which:'pzmed557', dfile:'cdfs44_mask8_v2_H_pzmed557_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed557_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed557_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmed614' :  mask = {which:'pzmed614', dfile:'cdfs44_mask8_v2_H_pzmed614_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed614_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed614_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=2.1'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed616' :  mask = {which:'pzmed616', dfile:'cdfs44_mask8_v2_H_pzmed616_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed616_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed616_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}

     'pzmed620' :  mask = {which:'pzmed620', dfile:'cdfs44_mask8_v2_H_pzmed620_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed620_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed620_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed622' :  mask = {which:'pzmed622', dfile:'cdfs44_mask8_v2_H_pzmed622_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed622_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed622_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed626' :  mask = {which:'pzmed626', dfile:'cdfs44_mask8_v2_H_pzmed626_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed626_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed626_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed651' :  mask = {which:'pzmed651', dfile:'cdfs44_mask8_v2_H_pzmed651_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed651_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed651_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed671' :  mask = {which:'pzmed671', dfile:'cdfs44_mask8_v2_H_pzmed671_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed671_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed671_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed687' :  mask = {which:'pzmed687', dfile:'cdfs44_mask8_v2_H_pzmed687_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed687_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed687_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed688' :  mask = {which:'pzmed688', dfile:'cdfs44_mask8_v2_H_pzmed688_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed688_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed688_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed698' :  mask = {which:'pzmed698', dfile:'cdfs44_mask8_v2_H_pzmed698_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed698_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed698_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed699' :  mask = {which:'pzmed699', dfile:'cdfs44_mask8_v2_H_pzmed699_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed699_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed699_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed706' :  mask = {which:'pzmed706', dfile:'cdfs44_mask8_v2_H_pzmed706_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed706_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed706_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed727' :  mask = {which:'pzmed727', dfile:'cdfs44_mask8_v2_H_pzmed727_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed727_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed727_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed733' :  mask = {which:'pzmed733', dfile:'cdfs44_mask8_v2_H_pzmed733_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed733_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed733_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed761' :  mask = {which:'pzmed761', dfile:'cdfs44_mask8_v2_H_pzmed761_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed761_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed761_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed819' :  mask = {which:'pzmed819', dfile:'cdfs44_mask8_v2_H_pzmed819_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed819_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed819_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed876' :  mask = {which:'pzmed876', dfile:'cdfs44_mask8_v2_H_pzmed876_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed876_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed876_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed933' :  mask = {which:'pzmed933', dfile:'cdfs44_mask8_v2_H_pzmed933_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed933_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed933_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed935' :  mask = {which:'pzmed935', dfile:'cdfs44_mask8_v2_H_pzmed935_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed935_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed935_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'pzmed955' :  mask = {which:'pzmed955', dfile:'cdfs44_mask8_v2_H_pzmed955_eps.fits', wfile:'cdfs44_mask8_v2_H_pzmed955_sig.fits', $
                           rfile:'cdfs44_mask8_v2_H_pzmed955_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'st18' :  mask = {which:'st18', dfile:'cdfs44_mask8_v2_H_st18_eps.fits', wfile:'cdfs44_mask8_v2_H_st18_sig.fits', $
                       rfile:'cdfs44_mask8_v2_H_st18_eps.reg', $
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
pro cdfs44_mask8_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = ''
  outdir = indir
  IF which[0] EQ 'all' THEN which = ['pzhi26', 'pzhi33', 'pzhi34', 'pzhi37', 'pzhi44', 'pzhi47', 'pzhi51', $
                                     'pzhi55', 'pzhi61', 'pzmed1134', 'pzmed1273', 'pzmed300', 'pzmed395', $
                                     'pzmed417', 'pzmed483', 'pzmed515', 'pzmed517', 'pzmed547', 'pzmed557', $
                                     'pzmed614', 'pzmed616', 'pzmed620', 'pzmed622', 'pzmed626', 'pzmed651', $
                                     'pzmed671', 'pzmed687', 'pzmed688', 'pzmed698', 'pzmed699', 'pzmed706', $
                                     'pzmed727', 'pzmed733', 'pzmed761', 'pzmed819', 'pzmed876', 'pzmed933', $
                                     'pzmed935', 'pzmed955', 'st18']
  

  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = cdfs44_mask8_H_extract_settings(which[zz])              ;get settings
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
