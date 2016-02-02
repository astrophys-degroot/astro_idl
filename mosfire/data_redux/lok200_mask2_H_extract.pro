;========================================================================================================================
function lok200_mask2_H_extract_settings, pick
  
  CASE pick OF 

 
     'bsbsb27' :  mask = {which:'bsbsb27', dfile:'LOK200_mask2_1.0_H_bsbsb27_eps.fits', wfile:'LOK200_mask2_1.0_H_bsbsb27_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_bsbsb27_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=65.2', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 60.0', 'MU LT 70.0', 'SIG GT 0.0']}
 
     'bsbsb37' :  mask = {which:'bsbsb37', dfile:'LOK200_mask2_1.0_H_bsbsb37_eps.fits', wfile:'LOK200_mask2_1.0_H_bsbsb37_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_bsbsb37_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=43.1', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 34.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'bsbsb4' :  mask = {which:'bsbsb4', dfile:'LOK200_mask2_1.0_H_bsbsb4_eps.fits', wfile:'LOK200_mask2_1.0_H_bsbsb4_sig.fits', $
                         rfile:'LOK200_mask2_1.0_H_bsbsb4_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=65.1', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 60.0', 'MU LT 70.0', 'SIG GT 0.0']}

     'bsbsb55' :  mask = {which:'bsbsb55', dfile:'LOK200_mask2_1.0_H_bsbsb55_eps.fits', wfile:'LOK200_mask2_1.0_H_bsbsb55_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_bsbsb55_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 4.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'bsbsb68' :  mask = {which:'bsbsb68', dfile:'LOK200_mask2_1.0_H_bsbsb68_eps.fits', wfile:'LOK200_mask2_1.0_H_bsbsb68_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_bsbsb68_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=28.8', 'sig=4.0', 'c=18.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 20.0', 'MU LT 35.0', 'SIG GT 0.0']}
 
     'bsbsb80' :  mask = {which:'bsbsb80', dfile:'LOK200_mask2_1.0_H_bsbsb80_eps.fits', wfile:'LOK200_mask2_1.0_H_bsbsb80_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_bsbsb80_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'bsbsb84' :  mask = {which:'bsbsb84', dfile:'LOK200_mask2_1.0_H_bsbsb84_eps.fits', wfile:'LOK200_mask2_1.0_H_bsbsb84_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_bsbsb84_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.8', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 4.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'bsbsb86' :  mask = {which:'bsbsb86', dfile:'LOK200_mask2_1.0_H_bsbsb86_eps.fits', wfile:'LOK200_mask2_1.0_H_bsbsb86_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_bsbsb86_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=32.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 24.0', 'MU LT 38.0', 'SIG GT 0.0']}
  
     'fsbsb110' :  mask = {which:'fsbsb110', dfile:'LOK200_mask2_1.0_H_fsbsb110_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsb110_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_fsbsb110_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsb137' :  mask = {which:'fsbsb137', dfile:'LOK200_mask2_1.0_H_fsbsb137_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsb137_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_fsbsb137_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=3.0', 'c=2.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fsbsb156' :  mask = {which:'fsbsb156', dfile:'LOK200_mask2_1.0_H_fsbsb156_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsb156_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_fsbsb156_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 4.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'fsbsb169' :  mask = {which:'fsbsb169', dfile:'LOK200_mask2_1.0_H_fsbsb169_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsb169_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_fsbsb169_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fsbsb71' :  mask = {which:'fsbsb71', dfile:'LOK200_mask2_1.0_H_fsbsb71_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsb71_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsb71_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=52.8', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 44.0', 'MU LT 58.0', 'SIG GT 0.0']}
     
     'fsbsb90' :  mask = {which:'fsbsb90', dfile:'LOK200_mask2_1.0_H_fsbsb90_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsb90_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsb90_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}

     'fsbsb96' :  mask = {which:'fsbsb96', dfile:'LOK200_mask2_1.0_H_fsbsb96_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsb96_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsb96_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr11' :  mask = {which:'fsbsr11', dfile:'LOK200_mask2_1.0_H_fsbsr11_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsr11_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsr11_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 4.0', 'MU LT 16.0', 'SIG GT 0.0']}
 
     'fsbsr12' :  mask = {which:'fsbsr12', dfile:'LOK200_mask2_1.0_H_fsbsr12_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsr12_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsr12_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=59.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 50.0', 'MU LT 70.0', 'SIG GT 0.0']}
 
     'fsbsr15' :  mask = {which:'fsbsr15', dfile:'LOK200_mask2_1.0_H_fsbsr15_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsr15_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsr15_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=32.1', 'sig=2.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 26.0', 'MU LT 38.0', 'SIG GT 0.0']}
 
     'fsbsr20' :  mask = {which:'fsbsr20', dfile:'LOK200_mask2_1.0_H_fsbsr20_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsr20_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsr20_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr33' :  mask = {which:'fsbsr33', dfile:'LOK200_mask2_1.0_H_fsbsr33_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsr33_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsr33_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=2.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fsbsr46' :  mask = {which:'fsbsr46', dfile:'LOK200_mask2_1.0_H_fsbsr46_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsr46_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsr46_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr51' :  mask = {which:'fsbsr51', dfile:'LOK200_mask2_1.0_H_fsbsr51_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsr51_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsr51_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr58' :  mask = {which:'fsbsr58', dfile:'LOK200_mask2_1.0_H_fsbsr58_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsr58_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsr58_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr69' :  mask = {which:'fsbsr69', dfile:'LOK200_mask2_1.0_H_fsbsr69_eps.fits', wfile:'LOK200_mask2_1.0_H_fsbsr69_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_fsbsr69_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'sbsbc112' :  mask = {which:'sbsbc112', dfile:'LOK200_mask2_1.0_H_sbsbc112_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc112_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_sbsbc112_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=8.5', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 4.0', 'MU LT 14.0', 'SIG GT 0.0']}
 
     'sbsbc134' :  mask = {which:'sbsbc134', dfile:'LOK200_mask2_1.0_H_sbsbc134_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc134_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_sbsbc134_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'sbsbc137' :  mask = {which:'sbsbc137', dfile:'LOK200_mask2_1.0_H_sbsbc137_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc137_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_sbsbc137_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'sbsbc153' :  mask = {which:'sbsbc153', dfile:'LOK200_mask2_1.0_H_sbsbc153_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc153_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_sbsbc153_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'sbsbc177' :  mask = {which:'sbsbc177', dfile:'LOK200_mask2_1.0_H_sbsbc177_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc177_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_sbsbc177_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'sbsbc196' :  mask = {which:'sbsbc196', dfile:'LOK200_mask2_1.0_H_sbsbc196_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc196_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_sbsbc196_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'sbsbc212' :  mask = {which:'sbsbc212', dfile:'LOK200_mask2_1.0_H_sbsbc212_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc212_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_sbsbc212_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'sbsbc265' :  mask = {which:'sbsbc265', dfile:'LOK200_mask2_1.0_H_sbsbc265_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc265_sig.fits', $
                           rfile:'LOK200_mask2_1.0_H_sbsbc265_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=42.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 34.0', 'MU LT 52.0', 'SIG GT 0.0']}
 
     'sbsbc38' :  mask = {which:'sbsbc38', dfile:'LOK200_mask2_1.0_H_sbsbc38_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc38_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_sbsbc38_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 4.0', 'MU LT 24.0', 'SIG GT 0.0']}
     
     'sbsbc67' :  mask = {which:'sbsbc67', dfile:'LOK200_mask2_1.0_H_sbsbc67_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc67_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_sbsbc67_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 4.0', 'MU LT 24.0', 'SIG GT 0.0']}

     'sbsbc87' :  mask = {which:'sbsbc87', dfile:'LOK200_mask2_1.0_H_sbsbc87_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc87_sig.fits', $
                          rfile:'LOK200_mask2_1.0_H_sbsbc87_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=5.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 0.0', 'MU LT 10.0', 'SIG GT 0.0']}
 
     'sbsbc9' :  mask = {which:'sbsbc9', dfile:'LOK200_mask2_1.0_H_sbsbc9_eps.fits', wfile:'LOK200_mask2_1.0_H_sbsbc9_sig.fits', $
                         rfile:'LOK200_mask2_1.0_H_sbsbc9_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'st11' :  mask = {which:'st11', dfile:'LOK200_mask2_1.0_H_st11_eps.fits', wfile:'LOK200_mask2_1.0_H_st11_sig.fits', $
                       rfile:'LOK200_mask2_1.0_H_st11_eps.reg', $
                       fit:'full', border:2, nosky:'hband_mosfire', $
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
pro lok200_mask2_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask2_1.0/2012nov25/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask2_1.0/2012nov25/H/'
  IF which[0] EQ 'all' THEN which = ['']
  

 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok200_mask2_H_extract_settings(which[zz])              ;get settings
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
