;========================================================================================================================
function lok400_mask4_H_extract_settings, pick
  
  CASE pick OF 

     'cl11' :  mask = {which:'cl11', dfile:'lok400_mask4_v1_H_cl11_eps.fits', wfile:'lok400_mask4_v1_H_cl11_sig.fits', $
                       rfile:'lok400_mask4_v1_H_cl11_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=30.5', 'sig=1.6', 'c=75.0', 'x0=5.0', 'x1=-0.5'], $
                       priors:['MU GT 26.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cl12' :  mask = {which:'cl12', dfile:'lok400_mask4_v1_H_cl12_eps.fits', wfile:'lok400_mask4_v1_H_cl12_sig.fits', $
                       rfile:'lok400_mask4_v1_H_cl12_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_faint', $
                       xwhich:0, flip:0, $
                       guess:['mu=31.1', 'sig=2.4', 'c=80.0', 'x0=5.1', 'x1=-0.7'], $
                       priors:['MU GT 26.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fg10' :  mask = {which:'fg10', dfile:'lok400_mask4_v1_H_fg10_eps.fits', wfile:'lok400_mask4_v1_H_fg10_sig.fits', $
                       rfile:'lok400_mask4_v1_H_fg10_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=2.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhi16' :  mask = {which:'pzhi16', dfile:'lok400_mask4_v1_H_pzhi16_eps.fits', wfile:'lok400_mask4_v1_H_pzhi16_sig.fits', $
                         rfile:'lok400_mask4_v1_H_pzhi16_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi7' :  mask = {which:'pzhi7', dfile:'lok400_mask4_v1_H_pzhi7_eps.fits', wfile:'lok400_mask4_v1_H_pzhi7_sig.fits', $
                        rfile:'lok400_mask4_v1_H_pzhi7_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow204' :  mask = {which:'pzlow204', dfile:'lok400_mask4_v1_H_pzlow204_eps.fits', wfile:'lok400_mask4_v1_H_pzlow204_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzlow204_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=2.5', 'c=70.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow205' :  mask = {which:'pzlow205', dfile:'lok400_mask4_v1_H_pzlow205_eps.fits', wfile:'lok400_mask4_v1_H_pzlow205_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzlow205_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.8', 'sig=2.8', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 22.0', 'SIG GT 0.0']}
     
     'pzlow222' :  mask = {which:'pzlow222', dfile:'lok400_mask4_v1_H_pzlow222_eps.fits', wfile:'lok400_mask4_v1_H_pzlow222_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzlow222_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=17.8', 'sig=2.5', 'c=80.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'pzlow236' :  mask = {which:'pzlow236', dfile:'lok400_mask4_v1_H_pzlow236_eps.fits', wfile:'lok400_mask4_v1_H_pzlow236_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzlow236_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=20.0', 'x0=3.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzmed124' :  mask = {which:'pzmed124', dfile:'lok400_mask4_v1_H_pzmed124_eps.fits', wfile:'lok400_mask4_v1_H_pzmed124_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzmed124_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed133' :  mask = {which:'pzmed133', dfile:'lok400_mask4_v1_H_pzmed133_eps.fits', wfile:'lok400_mask4_v1_H_pzmed133_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzmed133_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=34.8', 'sig=2.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'pzmed152' :  mask = {which:'pzmed152', dfile:'lok400_mask4_v1_H_pzmed152_eps.fits', wfile:'lok400_mask4_v1_H_pzmed152_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzmed152_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=100.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed153' :  mask = {which:'pzmed153', dfile:'lok400_mask4_v1_H_pzmed153_eps.fits', wfile:'lok400_mask4_v1_H_pzmed153_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzmed153_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=30.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed170' :  mask = {which:'pzmed170', dfile:'lok400_mask4_v1_H_pzmed170_eps.fits', wfile:'lok400_mask4_v1_H_pzmed170_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzmed170_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=19.8', 'sig=2.0', 'c=70.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed191' :  mask = {which:'pzmed191', dfile:'lok400_mask4_v1_H_pzmed191_eps.fits', wfile:'lok400_mask4_v1_H_pzmed191_sig.fits', $
                           rfile:'lok400_mask4_v1_H_pzmed191_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1' :  mask = {which:'pzmed1', dfile:'lok400_mask4_v1_H_pzmed1_eps.fits', wfile:'lok400_mask4_v1_H_pzmed1_sig.fits', $
                         rfile:'lok400_mask4_v1_H_pzmed1_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=54.8', 'sig=2.0', 'c=18.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 50.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'pzmed2' :  mask = {which:'pzmed2', dfile:'lok400_mask4_v1_H_pzmed2_eps.fits', wfile:'lok400_mask4_v1_H_pzmed2_sig.fits', $
                         rfile:'lok400_mask4_v1_H_pzmed2_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=19.8', 'sig=3.0', 'c=70.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'pzmed56' :  mask = {which:'pzmed56', dfile:'lok400_mask4_v1_H_pzmed56_eps.fits', wfile:'lok400_mask4_v1_H_pzmed56_sig.fits', $
                          rfile:'lok400_mask4_v1_H_pzmed56_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=46.8', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 40.0', 'MU LT 52.0', 'SIG GT 0.0']}
 
     'rest1057' :  mask = {which:'rest1057', dfile:'lok400_mask4_v1_H_rest1057_eps.fits', wfile:'lok400_mask4_v1_H_rest1057_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest1057_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.2', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'rest1173' :  mask = {which:'rest1173', dfile:'lok400_mask4_v1_H_rest1173_eps.fits', wfile:'lok400_mask4_v1_H_rest1173_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest1173_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=30.8', 'sig=2.0', 'c=350.0', 'x0=35.1', 'x1=-1.0'], $
                           priors:['MU GT 28.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest1596' :  mask = {which:'rest1596', dfile:'lok400_mask4_v1_H_rest1596_eps.fits', wfile:'lok400_mask4_v1_H_rest1596_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest1596_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=31.8', 'sig=2.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
     
     'rest1700' :  mask = {which:'rest1700', dfile:'lok400_mask4_v1_H_rest1700_eps.fits', wfile:'lok400_mask4_v1_H_rest1700_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest1700_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest1723' :  mask = {which:'rest1723', dfile:'lok400_mask4_v1_H_rest1723_eps.fits', wfile:'lok400_mask4_v1_H_rest1723_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest1723_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest1927' :  mask = {which:'rest1927', dfile:'lok400_mask4_v1_H_rest1927_eps.fits', wfile:'lok400_mask4_v1_H_rest1927_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest1927_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=45.2', 'sig=2.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'rest2551' :  mask = {which:'rest2551', dfile:'lok400_mask4_v1_H_rest2551_eps.fits', wfile:'lok400_mask4_v1_H_rest2551_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest2551_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest3099' :  mask = {which:'rest3099', dfile:'lok400_mask4_v1_H_rest3099_eps.fits', wfile:'lok400_mask4_v1_H_rest3099_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest3099_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=17.8', 'sig=1.5', 'c=150.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'rest3216' :  mask = {which:'rest3216', dfile:'lok400_mask4_v1_H_rest3216_eps.fits', wfile:'lok400_mask4_v1_H_rest3216_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest3216_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.5', 'sig=2.0', 'c=200.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 16.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'rest3299' :  mask = {which:'rest3299', dfile:'lok400_mask4_v1_H_rest3299_eps.fits', wfile:'lok400_mask4_v1_H_rest3299_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest3299_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.8', 'sig=2.0', 'c=220.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 12.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'rest3331' :  mask = {which:'rest3331', dfile:'lok400_mask4_v1_H_rest3331_eps.fits', wfile:'lok400_mask4_v1_H_rest3331_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest3331_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4548' :  mask = {which:'rest4548', dfile:'lok400_mask4_v1_H_rest4548_eps.fits', wfile:'lok400_mask4_v1_H_rest4548_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest4548_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=31.8', 'sig=2.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest4580' :  mask = {which:'rest4580', dfile:'lok400_mask4_v1_H_rest4580_eps.fits', wfile:'lok400_mask4_v1_H_rest4580_sig.fits', $
                           rfile:'lok400_mask4_v1_H_rest4580_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest4' :  mask = {which:'rest4', dfile:'lok400_mask4_v1_H_rest4_eps.fits', wfile:'lok400_mask4_v1_H_rest4_sig.fits', $
                        rfile:'lok400_mask4_v1_H_rest4_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_faint', $
                        xwhich:0, flip:0, $
                        guess:['mu=31.1', 'sig=2.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'rest960' :  mask = {which:'rest960', dfile:'lok400_mask4_v1_H_rest960_eps.fits', wfile:'lok400_mask4_v1_H_rest960_sig.fits', $
                          rfile:'lok400_mask4_v1_H_rest960_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'st10' :  mask = {which:'st10', dfile:'lok400_mask4_v1_H_st10_eps.fits', wfile:'lok400_mask4_v1_H_st10_sig.fits', $
rfile:'lok400_mask4_v1_H_st10_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'st4' :  mask = {which:'st4', dfile:'lok400_mask4_v1_H_st4_eps.fits', wfile:'lok400_mask4_v1_H_st4_sig.fits', $
rfile:'lok400_mask4_v1_H_st4_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'targ16' :  mask = {which:'targ16', dfile:'lok400_mask4_v1_H_targ16_eps.fits', wfile:'lok400_mask4_v1_H_targ16_sig.fits', $
                    rfile:'lok400_mask4_v1_H_targ16_eps.reg', $
                    fit:'gauss3', border:2, nosky:'hband_mosfire', $
                    xwhich:0, flip:0, $
                    guess:['mu=11.8', 'sig=2.0', 'c=80.0', 'x0=0.1', 'x1=0.01'], $
                    priors:['MU GT 4.0', 'MU LT 16.0', 'SIG GT 0.0']}
 
'targ1' :  mask = {which:'targ1', dfile:'lok400_mask4_v1_H_targ1_eps.fits', wfile:'lok400_mask4_v1_H_targ1_sig.fits', $
                   rfile:'lok400_mask4_v1_H_targ1_eps.reg', $
                   fit:'gauss3', border:2, nosky:'hband_mosfire', $
                   xwhich:0, flip:0, $
                   guess:['mu=32.1', 'sig=1.5', 'c=70.0', 'x0=0.1', 'x1=0.01'], $
                   priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
'targ25' :  mask = {which:'targ25', dfile:'lok400_mask4_v1_H_targ25_eps.fits', wfile:'lok400_mask4_v1_H_targ25_sig.fits', $
                    rfile:'lok400_mask4_v1_H_targ25_eps.reg', $
                    fit:'gauss3', border:2, nosky:'hband_mosfire', $
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
pro lok400_mask4_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask4/2014nov17/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask4/2014nov17/H/'
  IF which[0] EQ 'all' THEN which = ['cl11', 'cl12', 'eps.fits', 'fg10', 'pzhi16', 'pzhi7', 'pzlow204', $
                                     'pzlow205', 'pzlow222', 'pzlow236', 'pzmed124', 'pzmed133', 'pzmed152', $
                                     'pzmed153', 'pzmed170', 'pzmed191', 'pzmed1', 'pzmed2', 'pzmed56', 'rest1057', $
                                     'rest1173', 'rest1596', 'rest1700', 'rest1723', 'rest1927', 'rest2551', 'rest3099', $
                                     'rest3216', 'rest3299', 'rest3331', 'rest4548', 'rest4580', 'rest4', 'rest960', $
                                     'st10', 'st4', 'targ16', 'targ1', 'targ25']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok400_mask4_H_extract_settings(which[zz])              ;get settings
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
