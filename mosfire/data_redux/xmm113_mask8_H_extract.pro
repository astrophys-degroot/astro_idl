;========================================================================================================================
function xmm113_mask8_H_extract_settings, pick
  

  CASE pick OF 
 
     'pzhi31' :  mask = {which:'pzhi31', dfile:'xmm113_mask8_v1_H_pzhi31_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi31_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi31_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=54.82', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 50.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'pzhi35' :  mask = {which:'pzhi35', dfile:'xmm113_mask8_v1_H_pzhi35_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi35_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi35_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi36' :  mask = {which:'pzhi36', dfile:'xmm113_mask8_v1_H_pzhi36_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi36_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi36_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=3.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi40' :  mask = {which:'pzhi40', dfile:'xmm113_mask8_v1_H_pzhi40_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi40_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi40_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=26.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 22.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'pzhi44' :  mask = {which:'pzhi44', dfile:'xmm113_mask8_v1_H_pzhi44_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi44_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi44_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=17.2', 'sig=3.0', 'c=3.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzhi46' :  mask = {which:'pzhi46', dfile:'xmm113_mask8_v1_H_pzhi46_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi46_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi46_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=25.8', 'sig=3.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 22.0', 'MU LT 32.0', 'SIG GT 0.0']}
     
     'pzhi48' :  mask = {which:'pzhi48', dfile:'xmm113_mask8_v1_H_pzhi48_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi48_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi48_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=24.1', 'sig=3.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'pzhi49' :  mask = {which:'pzhi49', dfile:'xmm113_mask8_v1_H_pzhi49_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi49_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi49_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=15.4', 'sig=3.0', 'c=22.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 12.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzhi54' :  mask = {which:'pzhi54', dfile:'xmm113_mask8_v1_H_pzhi54_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi54_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi54_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=15.5', 'sig=3.0', 'c=17.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzhi55' :  mask = {which:'pzhi55', dfile:'xmm113_mask8_v1_H_pzhi55_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi55_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi55_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=34.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'pzhi56' :  mask = {which:'pzhi56', dfile:'xmm113_mask8_v1_H_pzhi56_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi56_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi56_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=30.8', 'sig=3.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
     
     'pzhi57' :  mask = {which:'pzhi57', dfile:'xmm113_mask8_v1_H_pzhi57_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi57_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi57_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=47.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 40.0', 'MU LT 55.0', 'SIG GT 0.0']}
     
     'pzhi58' :  mask = {which:'pzhi58', dfile:'xmm113_mask8_v1_H_pzhi58_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi58_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi58_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=39.4', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 32.0', 'MU LT 46.0', 'SIG GT 0.0']}
     
     'pzhi60' :  mask = {which:'pzhi60', dfile:'xmm113_mask8_v1_H_pzhi60_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi60_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi60_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=45.1', 'sig=3.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 35.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'pzhi61' :  mask = {which:'pzhi61', dfile:'xmm113_mask8_v1_H_pzhi61_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi61_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi61_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=26.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 20.0', 'MU LT 32.0', 'SIG GT 0.0']}
     
     'pzhi62' :  mask = {which:'pzhi62', dfile:'xmm113_mask8_v1_H_pzhi62_eps.fits', wfile:'xmm113_mask8_v1_H_pzhi62_sig.fits', $
                         rfile:'xmm113_mask8_v1_H_pzhi62_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=32.1', 'sig=3.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 32.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'pzlow2090' :  mask = {which:'pzlow2090', dfile:'xmm113_mask8_v1_H_pzlow2090_eps.fits', wfile:'xmm113_mask8_v1_H_pzlow2090_sig.fits', $
                            rfile:'xmm113_mask8_v1_H_pzlow2090_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=40.4', 'sig=3.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 35.0', 'MU LT 45.0', 'SIG GT 0.0']}
 
     'pzmed331' :  mask = {which:'pzmed331', dfile:'xmm113_mask8_v1_H_pzmed331_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed331_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed331_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=3.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'pzmed435' :  mask = {which:'pzmed435', dfile:'xmm113_mask8_v1_H_pzmed435_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed435_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed435_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed448' :  mask = {which:'pzmed448', dfile:'xmm113_mask8_v1_H_pzmed448_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed448_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed448_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 32.0', 'SIG GT 0.0']}
     
     'pzmed449' :  mask = {which:'pzmed449', dfile:'xmm113_mask8_v1_H_pzmed449_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed449_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed449_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=45.1', 'sig=3.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 55.0', 'SIG GT 0.0']}
     
     'pzmed451' :  mask = {which:'pzmed451', dfile:'xmm113_mask8_v1_H_pzmed451_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed451_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed451_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.5', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed466' :  mask = {which:'pzmed466', dfile:'xmm113_mask8_v1_H_pzmed466_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed466_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed466_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 26.0', 'SIG GT 0.0']}
     
     'pzmed493' :  mask = {which:'pzmed493', dfile:'xmm113_mask8_v1_H_pzmed493_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed493_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed493_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=17.8', 'sig=3.0', 'c=2.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
'pzmed614' :  mask = {which:'pzmed614', dfile:'xmm113_mask8_v1_H_pzmed614_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed614_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed614_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed618' :  mask = {which:'pzmed618', dfile:'xmm113_mask8_v1_H_pzmed618_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed618_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed618_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed619' :  mask = {which:'pzmed619', dfile:'xmm113_mask8_v1_H_pzmed619_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed619_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed619_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzmed628' :  mask = {which:'pzmed628', dfile:'xmm113_mask8_v1_H_pzmed628_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed628_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed628_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed695' :  mask = {which:'pzmed695', dfile:'xmm113_mask8_v1_H_pzmed695_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed695_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed695_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT =24.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed716' :  mask = {which:'pzmed716', dfile:'xmm113_mask8_v1_H_pzmed716_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed716_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed716_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed731' :  mask = {which:'pzmed731', dfile:'xmm113_mask8_v1_H_pzmed731_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed731_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed731_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=14.3', 'sig=3.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzmed752' :  mask = {which:'pzmed752', dfile:'xmm113_mask8_v1_H_pzmed752_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed752_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed752_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'pzmed761' :  mask = {which:'pzmed761', dfile:'xmm113_mask8_v1_H_pzmed761_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed761_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed761_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=3.0', 'c=11.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'pzmed789' :  mask = {which:'pzmed789', dfile:'xmm113_mask8_v1_H_pzmed789_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed789_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed789_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=6.8', 'sig=3.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 2.0', 'MU LT 14.0', 'SIG GT 0.0']}
 
     'pzmed794' :  mask = {which:'pzmed794', dfile:'xmm113_mask8_v1_H_pzmed794_eps.fits', wfile:'xmm113_mask8_v1_H_pzmed794_sig.fits', $
                           rfile:'xmm113_mask8_v1_H_pzmed794_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'st18' :  mask = {which:'st18', dfile:'xmm113_mask8_v1_H_st18_eps.fits', wfile:'xmm113_mask8_v1_H_st18_sig.fits', $
                       rfile:'xmm113_mask8_v1_H_st18_eps.reg', $
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
pro xmm113_mask8_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = ''
  outdir = ''
  IF which[0] EQ 'all' THEN which = ['pzhi31', 'pzhi35', 'pzhi36', 'pzhi40', 'pzhi44', 'pzhi46', 'pzhi48', 'pzhi49', $
                                     'pzhi54', 'pzhi55', 'pzhi56', 'pzhi57', 'pzhi58', 'pzhi60', 'pzhi61', 'pzhi62', $
                                     'pzlow2090', 'pzmed331', 'pzmed435', 'pzmed448', 'pzmed449', 'pzmed451', $
                                     'pzmed466', 'pzmed493', 'pzmed614', 'pzmed618', 'pzmed619', 'pzmed628', 'pzmed695', $
                                     'pzmed716', 'pzmed731', 'pzmed752', 'pzmed761', 'pzmed789', 'pzmed794', 'st18']
  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = xmm113_mask8_H_extract_settings(which[zz])              ;get settings
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
