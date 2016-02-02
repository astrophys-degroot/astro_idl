;========================================================================================================================
function lok200_mask1_H_extract_settings, pick
  
  
  CASE pick OF 

     'bsbsb11' :  mask = {which:'bsbsb11', dfile:'LOK200_mask1_1.0_H_bsbsb11_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb11_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb11_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bsbsb13' :  mask = {which:'bsbsb13', dfile:'LOK200_mask1_1.0_H_bsbsb13_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb13_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb13_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=16.8', 'sig=2.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                          priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'bsbsb24' :  mask = {which:'bsbsb24', dfile:'LOK200_mask1_1.0_H_bsbsb24_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb24_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb24_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=35.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=-0.01'], $
                          priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'bsbsb26' :  mask = {which:'bsbsb26', dfile:'LOK200_mask1_1.0_H_bsbsb26_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb26_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb26_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bsbsb36' :  mask = {which:'bsbsb36', dfile:'LOK200_mask1_1.0_H_bsbsb36_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb36_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb36_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'bsbsb77' :  mask = {which:'bsbsb77', dfile:'LOK200_mask1_1.0_H_bsbsb77_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb77_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb77_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bsbsb78' :  mask = {which:'bsbsb78', dfile:'LOK200_mask1_1.0_H_bsbsb78_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb78_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb78_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=15.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'bsbsb81' :  mask = {which:'bsbsb81', dfile:'LOK200_mask1_1.0_H_bsbsb81_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb81_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb81_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=48.5', 'sig=3.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0', 'C GT 0.0']}
 
     'bsbsb85' :  mask = {which:'bsbsb85', dfile:'LOK200_mask1_1.0_H_bsbsb85_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb85_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb85_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=72.3', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 70.0', 'MU LT 80.0', 'SIG GT 0.0']}
 
     'bsbsb89' :  mask = {which:'bsbsb89', dfile:'LOK200_mask1_1.0_H_bsbsb89_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb89_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb89_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=56.4', 'sig=2.0', 'c=15.0', 'x0=0.1', 'x1=-0.01'], $
                          priors:['MU GT 55.0', 'MU LT 65.0', 'SIG GT 0.0']}
 
     'bsbsb92' :  mask = {which:'bsbsb92', dfile:'LOK200_mask1_1.0_H_bsbsb92_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsb92_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsb92_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=19.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'bsbsr10' :  mask = {which:'bsbsr10', dfile:'LOK200_mask1_1.0_H_bsbsr10_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsr10_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsr10_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=43.1', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 32.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'bsbsr12' :  mask = {which:'bsbsr12', dfile:'LOK200_mask1_1.0_H_bsbsr12_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsr12_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsr12_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=31.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'bsbsr13' :  mask = {which:'bsbsr13', dfile:'LOK200_mask1_1.0_H_bsbsr13_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsr13_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsr13_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=-0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bsbsr14' :  mask = {which:'bsbsr14', dfile:'LOK200_mask1_1.0_H_bsbsr14_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsr14_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_bsbsr14_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=27.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'bsbsr1' :  mask = {which:'bsbsr1', dfile:'LOK200_mask1_1.0_H_bsbsr1_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsr1_sig.fits', $
                         rfile:'LOK200_mask1_1.0_H_bsbsr1_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=48.2', 'sig=2.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0']}
 
     'bsbsr7' :  mask = {which:'bsbsr7', dfile:'LOK200_mask1_1.0_H_bsbsr7_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsr7_sig.fits', $
                         rfile:'LOK200_mask1_1.0_H_bsbsr7_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=27.8', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 25.0', 'MU LT 340.0', 'SIG GT 0.0']}
 
     'bsbsr8' :  mask = {which:'bsbsr8', dfile:'LOK200_mask1_1.0_H_bsbsr8_eps.fits', wfile:'LOK200_mask1_1.0_H_bsbsr8_sig.fits', $
                         rfile:'LOK200_mask1_1.0_H_bsbsr8_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=20.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
  
     'fsbsb11' :  mask = {which:'fsbsb11', dfile:'LOK200_mask1_1.0_H_fsbsb11_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsb11_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsb11_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsb126' :  mask = {which:'fsbsb126', dfile:'LOK200_mask1_1.0_H_fsbsb126_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsb126_sig.fits', $
                           rfile:'LOK200_mask1_1.0_H_fsbsb126_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.2', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsb132' :  mask = {which:'fsbsb132', dfile:'LOK200_mask1_1.0_H_fsbsb132_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsb132_sig.fits', $
                           rfile:'LOK200_mask1_1.0_H_fsbsb132_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'fsbsb53' :  mask = {which:'fsbsb53', dfile:'LOK200_mask1_1.0_H_fsbsb53_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsb53_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsb53_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=16.2', 'sig=3.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'fsbsb59' :  mask = {which:'fsbsb59', dfile:'LOK200_mask1_1.0_H_fsbsb59_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsb59_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsb59_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsb67' :  mask = {which:'fsbsb67', dfile:'LOK200_mask1_1.0_H_fsbsb67_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsb67_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsb67_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.8', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'fsbsr17' :  mask = {which:'fsbsr17', dfile:'LOK200_mask1_1.0_H_fsbsr17_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsr17_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsr17_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=52.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'fsbsr2' :  mask = {which:'fsbsr2', dfile:'LOK200_mask1_1.0_H_fsbsr2_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsr2_sig.fits', $
                         rfile:'LOK200_mask1_1.0_H_fsbsr2_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=2.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 0.0', 'MU LT 5.0', 'SIG GT 0.0']}
 
     'fsbsr32' :  mask = {which:'fsbsr32', dfile:'LOK200_mask1_1.0_H_fsbsr32_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsr32_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsr32_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=54.1', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'fsbsr35' :  mask = {which:'fsbsr35', dfile:'LOK200_mask1_1.0_H_fsbsr35_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsr35_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsr35_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=24.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr37' :  mask = {which:'fsbsr37', dfile:'LOK200_mask1_1.0_H_fsbsr37_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsr37_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsr37_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=21.1', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr52' :  mask = {which:'fsbsr52', dfile:'LOK200_mask1_1.0_H_fsbsr52_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsr52_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsr52_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=32.9', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'fsbsr66' :  mask = {which:'fsbsr66', dfile:'LOK200_mask1_1.0_H_fsbsr66_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsr66_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsr66_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=0.1', 'x0=0.1', 'x1=0.5'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr6' :  mask = {which:'fsbsr6', dfile:'LOK200_mask1_1.0_H_fsbsr6_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsr6_sig.fits', $
                         rfile:'LOK200_mask1_1.0_H_fsbsr6_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:1, $
                         guess:['mu=59.7', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 55.0', 'MU LT 65.0', 'SIG GT 0.0']}
 
     'fsbsr71' :  mask = {which:'fsbsr71', dfile:'LOK200_mask1_1.0_H_fsbsr71_eps.fits', wfile:'LOK200_mask1_1.0_H_fsbsr71_sig.fits', $
                          rfile:'LOK200_mask1_1.0_H_fsbsr71_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=12.0', 'x0=-0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'sbsbc301' :  mask = {which:'sbsbc301', dfile:'LOK200_mask1_1.0_H_sbsbc301_eps.fits', wfile:'LOK200_mask1_1.0_H_sbsbc301_sig.fits', $
                           rfile:'LOK200_mask1_1.0_H_sbsbc301_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.8', 'sig=4.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'sbsbc309' :  mask = {which:'sbsbc309', dfile:'LOK200_mask1_1.0_H_sbsbc309_eps.fits', wfile:'LOK200_mask1_1.0_H_sbsbc309_sig.fits', $
                           rfile:'LOK200_mask1_1.0_H_sbsbc309_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'st15' :  mask = {which:'st15', dfile:'LOK200_mask1_1.0_H_st15_eps.fits', wfile:'LOK200_mask1_1.0_H_st15_sig.fits', $
                       rfile:'LOK200_mask1_1.0_H_st15_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
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
pro lok200_mask1_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask1_1.0/2012nov25/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask1_1.0/2012nov25/H/'
  IF which[0] EQ 'all' THEN which = ['bsbsb11', 'bsbsb13', 'bsbsb24', 'bsbsb26', 'bsbsb36', 'bsbsb77', 'bsbsb78', $
                                     'bsbsb81', 'bsbsb85', 'bsbsb89', 'bsbsb92', 'bsbsr10', 'bsbsr12', 'bsbsr13', $
                                     'bsbsr14', 'bsbsr1', 'bsbsr7', 'bsbsr8', 'eps.fits', 'fsbsb11', 'fsbsb126', $
                                     'fsbsb132', 'fsbsb53', 'fsbsb59', 'fsbsb67', 'fsbsr17', 'fsbsr2', 'fsbsr32', $
                                     'fsbsr35', 'fsbsr37', 'fsbsr52', 'fsbsr66', 'fsbsr6', 'fsbsr71', 'sbsbc301', $
                                     'sbsbc309', 'st15']
  

 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok200_mask1_H_extract_settings(which[zz])              ;get settings
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
