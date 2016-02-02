;========================================================================================================================
function xmm710_mask1_K_extract_settings, pick
  
  CASE pick OF 
     'noy1174' :  mask = {which:'noy1174', dfile:'xmm710_mask1_K_noy1174_eps.fits', wfile:'xmm710_mask1_K_noy1174_ivar.fits', $
                          crow:43, rowsup:48, rowsdown:43, collow:25, colup:1750, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=42.1', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 33.0', 'MU LT 53.0', 'SIG GT 0.0']}
     
     'noy1198' :  mask = {which:'noy1198', dfile:'xmm710_mask1_K_noy1198_eps.fits', wfile:'xmm710_mask1_K_noy1198_ivar.fits', $
                          crow:34, rowsup:57, rowsdown:34, collow:25, colup:1600, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=35.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 24.0', 'MU LT 44.0', 'SIG GT 0.0']}
     
     'noy161' :  mask = {which:'noy161', dfile:'xmm710_mask1_K_noy161_eps.fits', wfile:'xmm710_mask1_K_noy161_ivar.fits', $
                         crow:20, rowsup:26, rowsdown:20, collow:150, colup:1900, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'noy338' :  mask = {which:'noy338', dfile:'xmm710_mask1_K_noy338_eps.fits', wfile:'xmm710_mask1_K_noy338_ivar.fits', $
                         crow:25, rowsup:20, rowsdown:25, collow:200, colup:1400, fit:'gauss3', border:2, nosky:'kband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 15.0', 'MU LT 35.0', 'SIG GT 0.0']}
     
     'noy508' :  mask = {which:'noy508', dfile:'xmm710_mask1_K_noy508_eps.fits', wfile:'xmm710_mask1_K_noy508_ivar.fits', $
                         crow:53, rowsup:35, rowsdown:53, collow:25, colup:2100, fit:'gauss3', border:2, nosky:'kband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=55.1', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 43.0', 'MU LT 63.0', 'SIG GT 0.0']}
     
     'noy849' :  mask = {which:'noy849', dfile:'xmm710_mask1_K_noy849_eps.fits', wfile:'xmm710_mask1_K_noy849_ivar.fits', $
                         crow:18, rowsup:27, rowsdown:18, collow:25, colup:1400, fit:'gauss3', border:2, nosky:'kband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=20.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 8.0', 'MU LT 28.0', 'SIG GT 0.0']}
     
     'st13' :  mask = {which:'st13', dfile:'xmm710_mask1_K_st13_eps.fits', wfile:'xmm710_mask1_K_st13_ivar.fits', $
                       crow:14, rowsup:32, rowsdown:14, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=11.8', 'sig=2.0', 'c=850.0', 'x0=0.1', 'x1=1.1'], $
                       priors:['MU GT 4.0', 'MU LT 24.0', 'SIG GT 0.0']}
     
     'ykbr101' :  mask = {which:'ykbr101', dfile:'xmm710_mask1_K_ykbr101_eps.fits', wfile:'xmm710_mask1_K_ykbr101_ivar.fits', $
                          crow:26, rowsup:17, rowsdown:26, collow:130, colup:1800, fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=23.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 16.0', 'MU LT 36.0', 'SIG GT 0.0']}
     
     'ykbr122' :  mask = {which:'ykbr122', dfile:'xmm710_mask1_K_ykbr122_eps.fits', wfile:'xmm710_mask1_K_ykbr122_ivar.fits', $
                          crow:31, rowsup:17, rowsdown:31, collow:25, colup:1750, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=30.2', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 21.0', 'MU LT 41.0', 'SIG GT 0.0']}
     
     'ykbr186' :  mask = {which:'ykbr186', dfile:'xmm710_mask1_K_ykbr186_eps.fits', wfile:'xmm710_mask1_K_ykbr186_ivar.fits', $
                          crow:24, rowsup:24, rowsdown:24, collow:000, colup:2080, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=2.5', 'c=400.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykbsr9_1' :  mask = {which:'ykbsr9_1', dfile:'xmm710_mask1_K_ykbsr9_eps.fits', wfile:'xmm710_mask1_K_ykbsr9_ivar.fits', $
                         crow:15, rowsup:31, rowsdown:15, collow:25, colup:1750, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:['ykbsr9', 'ykbsr9_1'], flip:0, $
                         guess:['mu=17.1', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 5.0', 'MU LT 25.0', 'SIG GT 0.0']}
     'ykbsr9_2' :  mask = {which:'ykbsr9_2', dfile:'xmm710_mask1_K_ykbsr9_eps.fits', wfile:'xmm710_mask1_K_ykbsr9_ivar.fits', $
                         crow:28, rowsup:18, rowsdown:28, collow:25, colup:1750, fit:'gauss3', border:2, nosky:'kband_faint', $
                         xwhich:['ykbsr9', 'ykbsr9_2'], flip:0, $
                         guess:['mu=27.1', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 18.0', 'MU LT 38.0', 'SIG GT 0.0']}
     
     'ykfr14' :  mask = {which:'ykfr14', dfile:'xmm710_mask1_K_ykfr14_eps.fits', wfile:'xmm710_mask1_K_ykfr14_ivar.fits', $
                         crow:28, rowsup:17, rowsdown:28, collow:25, colup:1600, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=25.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 18.0', 'MU LT 38.0', 'SIG GT 0.0']}
     
     'ykfr197' :  mask = {which:'ykfr197', dfile:'xmm710_mask1_K_ykfr197_eps.fits', wfile:'xmm710_mask1_K_ykfr197_ivar.fits', $
                          crow:18, rowsup:30, rowsdown:18, collow:25, colup:1400, fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=21.1', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 8.0', 'MU LT 28.0', 'SIG GT 0.0', 'SIG LT 5.0']}
     
     'ykfr266' :  mask = {which:'ykfr266', dfile:'xmm710_mask1_K_ykfr266_eps.fits', wfile:'xmm710_mask1_K_ykfr266_ivar.fits', $
                          crow:23, rowsup:23, rowsdown:23, collow:150, colup:2100, fit:'gauss3', border:2, nosky:'kband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=24.2', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 13.0', 'MU LT 33.0', 'SIG GT 0.0']}
     
     'ykfr277' :  mask = {which:'ykfr277', dfile:'xmm710_mask1_K_ykfr277_eps.fits', wfile:'xmm710_mask1_K_ykfr277_ivar.fits', $
                          crow:24, rowsup:23, rowsdown:24, collow:75, colup:1900, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr27' :  mask = {which:'ykfr27', dfile:'xmm710_mask1_K_ykfr27_eps.fits', wfile:'xmm710_mask1_K_ykfr27_ivar.fits', $
                         crow:18, rowsup:27, rowsdown:18, collow:100, colup:1700, fit:'gauss3', border:2, nosky:'kband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=20.5', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 8.0', 'MU LT 28.0', 'SIG GT 0.0']}
     
     'ykfr337' :  mask = {which:'ykfr337', dfile:'xmm710_mask1_K_ykfr337_eps.fits', wfile:'xmm710_mask1_K_ykfr337_ivar.fits', $
                          crow:17, rowsup:27, rowsdown:17, collow:25, colup:1900, fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=15.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 7.0', 'MU LT 27.0', 'SIG GT 0.0', 'SIG LT 5.0']}
     
     'ykfr459' :  mask = {which:'ykfr459', dfile:'xmm710_mask1_K_ykfr459_eps.fits', wfile:'xmm710_mask1_K_ykfr459_ivar.fits', $
                          crow:39, rowsup:52, rowsdown:39, collow:25, colup:1700, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=38.1', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 29.0', 'MU LT 49.0', 'SIG GT 0.0']}
     
     'ykfr485' :  mask = {which:'ykfr485', dfile:'xmm710_mask1_K_ykfr485_eps.fits', wfile:'xmm710_mask1_K_ykfr485_ivar.fits', $
                          crow:30, rowsup:16, rowsdown:30, collow:30, colup:2000, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=28.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 20.0', 'MU LT 40.0', 'SIG GT 0.0']}
      
     'ykfr490' :  mask = {which:'ykfr490', dfile:'xmm710_mask1_K_ykfr490_eps.fits', wfile:'xmm710_mask1_K_ykfr490_ivar.fits', $
                          crow:20, rowsup:26, rowsdown:20, collow:25, colup:1750, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=18.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 10.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'ykfr525' :  mask = {which:'ykfr525', dfile:'xmm710_mask1_K_ykfr525_eps.fits', wfile:'xmm710_mask1_K_ykfr525_ivar.fits', $
                          crow:24, rowsup:24, rowsdown:24, collow:25, colup:1700, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=21.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'ykfr676' :  mask = {which:'ykfr676', dfile:'xmm710_mask1_K_ykfr676_eps.fits', wfile:'xmm710_mask1_K_ykfr676_ivar.fits', $
                          crow:31, rowsup:19, rowsdown:31, collow:25, colup:1850, fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=29.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 21.0', 'MU LT 41.0', 'SIG GT 0.0']}
     
     'ykfr710' :  mask = {which:'ykfr710', dfile:'xmm710_mask1_K_ykfr710_eps.fits', wfile:'xmm710_mask1_K_ykfr710_ivar.fits', $
                          crow:25, rowsup:20, rowsdown:25, collow:000, colup:2000, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 15.0', 'MU LT 35.0', 'SIG GT 0.0']}
     
     'ykfr844' :  mask = {which:'ykfr844', dfile:'xmm710_mask1_K_ykfr844_eps.fits', wfile:'xmm710_mask1_K_ykfr844_ivar.fits', $
                          crow:22, rowsup:24, rowsdown:22, collow:25, colup:2000, fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=23.4', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 12.0', 'MU LT 32.0', 'SIG GT 0.0', 'SIG LT 5.0']}
     
     'ykfr84' :  mask = {which:'ykfr84', dfile:'xmm710_mask1_K_ykfr84_eps.fits', wfile:'xmm710_mask1_K_ykfr84_ivar.fits', $
                         crow:29, rowsup:20, rowsdown:29, collow:25, colup:1900, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=27.4', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 19.0', 'MU LT 39.0', 'SIG GT 0.0']}
     
     'ykfr86' :  mask = {which:'ykfr86', dfile:'xmm710_mask1_K_ykfr86_eps.fits', wfile:'xmm710_mask1_K_ykfr86_ivar.fits', $
                         crow:20, rowsup:28, rowsdown:20, collow:25, colup:1850, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.1', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'ykfsr106' :  mask = {which:'ykfsr106', dfile:'xmm710_mask1_K_ykfsr106_eps.fits', wfile:'xmm710_mask1_K_ykfsr106_ivar.fits', $
                           crow:28, rowsup:17, rowsdown:28, collow:25, colup:2000, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 38.0', 'SIG GT 0.0']}
     
     'ykfsr114' :  mask = {which:'ykfsr114', dfile:'xmm710_mask1_K_ykfsr114_eps.fits', wfile:'xmm710_mask1_K_ykfsr114_ivar.fits', $
                           crow:42, rowsup:50, rowsdown:42, collow:25, colup:1850, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=44.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 32.0', 'MU LT 52.0', 'SIG GT 0.0']}
 
     'ykfsr117' :  mask = {which:'ykfsr117', dfile:'xmm710_mask1_K_ykfsr117_eps.fits', wfile:'xmm710_mask1_K_ykfsr117_ivar.fits', $
                           crow:30, rowsup:13, rowsdown:30, collow:70, colup:2100, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=27.8', 'sig=4.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'ykfsr119' :  mask = {which:'ykfsr119', dfile:'xmm710_mask1_K_ykfsr119_eps.fits', wfile:'xmm710_mask1_K_ykfsr119_ivar.fits', $
                           crow:35, rowsup:17, rowsdown:35, collow:25, colup:1750, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=4.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 25.0', 'MU LT 45.0', 'SIG GT 0.0']}
       
     'ykfsr126' :  mask = {which:'ykfsr126', dfile:'xmm710_mask1_K_ykfsr126_eps.fits', wfile:'xmm710_mask1_K_ykfsr126_ivar.fits', $
                           crow:23, rowsup:23, rowsdown:23, collow:50, colup:2050, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=4.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 13.0', 'MU LT 33.0', 'SIG GT 0.0']}
     
     'ykfsr13' :  mask = {which:'ykfsr13', dfile:'xmm710_mask1_K_ykfsr13_eps.fits', wfile:'xmm710_mask1_K_ykfsr13_ivar.fits', $
                          crow:17, rowsup:28, rowsdown:17, collow:70, colup:2100, fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=20.2', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 7.0', 'MU LT 27.0', 'SIG GT 0.0', 'SIG LT 5.0']}
     
     'ykfsr14' :  mask = {which:'ykfsr14', dfile:'xmm710_mask1_K_ykfsr14_eps.fits', wfile:'xmm710_mask1_K_ykfsr14_ivar.fits', $
                          crow:30, rowsup:60, rowsdown:30, collow:25, colup:1850, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=32.1', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 20.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'ykfsr25' :  mask = {which:'ykfsr25', dfile:'xmm710_mask1_K_ykfsr25_eps.fits', wfile:'xmm710_mask1_K_ykfsr25_ivar.fits', $
                          crow:24, rowsup:24, rowsdown:24, collow:100, colup:2100, fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0', 'SIG LT 5.0']}
     
     'ykfsr2' :  mask = {which:'ykfsr2', dfile:'xmm710_mask1_K_ykfsr2_eps.fits', wfile:'xmm710_mask1_K_ykfsr2_ivar.fits', $
                         crow:17, rowsup:31, rowsdown:17, collow:25, colup:2100, fit:'gauss3', border:2, nosky:'kband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=15.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 7.0', 'MU LT 27.0', 'SIG GT 0.0']}
     
     'ykfsr4' :  mask = {which:'ykfsr4', dfile:'xmm710_mask1_K_ykfsr4_eps.fits', wfile:'xmm710_mask1_K_ykfsr4_ivar.fits', $
                         crow:33, rowsup:16, rowsdown:33, collow:25, colup:1950, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=31.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 23.0', 'MU LT 43.0', 'SIG GT 0.0']}
     
     'ykfsr52' :  mask = {which:'ykfsr52', dfile:'xmm710_mask1_K_ykfsr52_eps.fits', wfile:'xmm710_mask1_K_ykfsr52_ivar.fits', $
                          crow:19, rowsup:29, rowsdown:19, collow:200, colup:2200, fit:'gauss3', border:2, nosky:'kband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=20.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 9.0', 'MU LT 29.0', 'SIG GT 0.0']}
     
     'ykfsr61' :  mask = {which:'ykfsr61', dfile:'xmm710_mask1_K_ykfsr61_eps.fits', wfile:'xmm710_mask1_K_ykfsr61_ivar.fits', $
                          crow:34, rowsup:11, rowsdown:34, collow:50, colup:2050, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=32.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 24.0', 'MU LT 44.0', 'SIG GT 0.0']}
     
     'ykfsr7' :  mask = {which:'ykfsr7', dfile:'xmm710_mask1_K_ykfsr7_eps.fits', wfile:'xmm710_mask1_K_ykfsr7_ivar.fits', $
                         crow:24, rowsup:19, rowsdown:24, collow:25, colup:1950, fit:'gauss3', border:2, nosky:'kband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr98' :  mask = {which:'ykfsr98', dfile:'xmm710_mask1_K_ykfsr98_eps.fits', wfile:'xmm710_mask1_K_ykfsr98_ivar.fits', $
                          crow:21, rowsup:21, rowsdown:21, collow:25, colup:1750, fit:'gauss3', border:2, nosky:'kband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 11.0', 'MU LT 31.0', 'SIG GT 0.0']}
     
     
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
pro xmm710_mask1_K_extract, which, OMASKED=omasked

  
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;set new value
  
  indir = '/Users/degroota/research/current2_mosfire2012nov28_xmm710/XMM710_mask1_1.0/'
  outdir = '/Users/degroota/research/current2_mosfire2012nov28_xmm710/XMM710_mask1_1.0/'
  IF which[0] EQ 'all' THEN which = ['cl10']

  FOR zz=0, n_elements(which)-1, 1 DO BEGIN
     values = xmm710_mask1_K_extract_settings(which[zz])
     IF values.which NE '-1' THEN BEGIN
        mosfire_1dspec, values.dfile, values.wfile, which[zz], XWHICH=values.xwhich, $
                        CENTROW=values.crow, ROWDOWN=values.rowsdown, ROWUP=values.rowsup, $
                        COLDOWN=values.collow, COLUP=values.colup, $
                        FLIP=values.flip, SPATFIT=values.fit, GUESSES=values.guess, PRIORS=values.priors, $
                        BORDER=values.border, NOSKYLINES=values.nosky, OMASKED=omasked, $
                        INDIR=indir, OUTDIR=outdir
    ENDIF
  ENDFOR

  spawn, 'open ' + strcompress('XMM710_mask1_K_' + which[zz-1] + '_eps_spatprofparams.ps', /REMOVE_ALL)

END	
;========================================================================================================================
