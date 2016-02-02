;========================================================================================================================
function lok400_mask2_H_extract_settings, pick
  
  CASE pick OF 

     'bsbsr17' :  mask = {which:'bsbsr17', dfile:'LOK400_mask2_H_bsbsr17_eps.fits', wfile:'LOK400_mask2_H_bsbsr17_sig.fits', $
                          rfile:'LOK400_mask2_H_bsbsr17_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=29.5', 'sig=2.0', 'c=5.0', 'x0=0.9', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bsbsr5b' :  mask = {which:'bsbsr5b', dfile:'LOK400_mask2_H_bsbsr5b_eps.fits', wfile:'LOK400_mask2_H_bsbsr5b_sig.fits', $
                          rfile:'LOK400_mask2_H_bsbsr5b_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=10.3', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 4.0', 'MU LT 15.0', 'SIG GT 0.0']}
 
'bsbsr8a' :  mask = {which:'bsbsr8a', dfile:'LOK400_mask2_H_bsbsr8a_eps.fits', wfile:'LOK400_mask2_H_bsbsr8a_sig.fits', $
                          rfile:'LOK400_mask2_H_bsbsr8a_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=46.8', 'sig=4.0', 'c=35.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}

'bsbsr8b' :  mask = {which:'bsbsr8b', dfile:'LOK400_mask2_H_bsbsr8a_eps.fits', wfile:'LOK400_mask2_H_bsbsr8a_sig.fits', $
                          rfile:'LOK400_mask2_H_bsbsr8a_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:['bsbsr5a', 'bsbsr5b'], flip:0, $
                          guess:['mu=46.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     
     'fsbsb121' :  mask = {which:'fsbsb121', dfile:'LOK400_mask2_H_fsbsb121_eps.fits', wfile:'LOK400_mask2_H_fsbsb121_sig.fits', $
                           rfile:'LOK400_mask2_H_fsbsb121_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}

     'fsbsb173' :  mask = {which:'fsbsb173', dfile:'LOK400_mask2_H_fsbsb173_eps.fits', wfile:'LOK400_mask2_H_fsbsb173_sig.fits', $
                           rfile:'LOK400_mask2_H_fsbsb173_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=4.0', 'c=1.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 32.0', 'SIG GT 0.0']}
     
     'fsbsr123' :  mask = {which:'fsbsr123', dfile:'LOK400_mask2_H_fsbsr123_eps.fits', wfile:'LOK400_mask2_H_fsbsr123_sig.fits', $
                           rfile:'LOK400_mask2_H_fsbsr123_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fsbsr128' :  mask = {which:'fsbsr128', dfile:'LOK400_mask2_H_fsbsr128_eps.fits', wfile:'LOK400_mask2_H_fsbsr128_sig.fits', $
                           rfile:'LOK400_mask2_H_fsbsr128_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr130' :  mask = {which:'fsbsr130', dfile:'LOK400_mask2_H_fsbsr130_eps.fits', wfile:'LOK400_mask2_H_fsbsr130_sig.fits', $
                           rfile:'LOK400_mask2_H_fsbsr130_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.8', 'sig=2.0', 'c=12.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'fsbsr189' :  mask = {which:'fsbsr189', dfile:'LOK400_mask2_H_fsbsr189_eps.fits', wfile:'LOK400_mask2_H_fsbsr189_sig.fits', $
                           rfile:'LOK400_mask2_H_fsbsr189_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=50.8', 'sig=4.0', 'c=7.2', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'fsbsr237a' :  mask = {which:'fsbsr237a', dfile:'LOK400_mask2_H_fsbsr237_eps.fits', wfile:'LOK400_mask2_H_fsbsr237_sig.fits', $
                            rfile:'LOK400_mask2_H_fsbsr237_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:['fsbsr237','fsbsr237a'], flip:0, $
                            guess:['mu=42.4', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 35.0', 'MU LT 50.0', 'SIG GT 0.0']}
     
     'fsbsr237b' :  mask = {which:'fsbsr237b', dfile:'LOK400_mask2_H_fsbsr237_eps.fits', wfile:'LOK400_mask2_H_fsbsr237_sig.fits', $
                            rfile:'LOK400_mask2_H_fsbsr237_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:['fsbsr237','fsbsr237b'], flip:0, $
                            guess:['mu=60.4', 'sig=2.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 52.0', 'MU LT 68.0', 'SIG GT 0.0']}
     
     'fsbsr239' :  mask = {which:'fsbsr239', dfile:'LOK400_mask2_H_fsbsr239_eps.fits', wfile:'LOK400_mask2_H_fsbsr239_sig.fits', $
                           rfile:'LOK400_mask2_H_fsbsr239_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'man1' :  mask = {which:'man1', dfile:'LOK400_mask2_H_man1_eps.fits', wfile:'LOK400_mask2_H_man1_sig.fits', $
                       rfile:'LOK400_mask2_H_man1_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=25.3', 'sig=2.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb109a' :  mask = {which:'msbsb109a', dfile:'LOK400_mask2_H_msbsb109a_eps.fits', wfile:'LOK400_mask2_H_msbsb109a_sig.fits', $
                            rfile:'LOK400_mask2_H_msbsb109a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=23.2', 'sig=2.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsb112' :  mask = {which:'msbsb112', dfile:'LOK400_mask2_H_msbsb112_eps.fits', wfile:'LOK400_mask2_H_msbsb112_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsb112_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=19.5', 'sig=3.0', 'c=20.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsb157' :  mask = {which:'msbsb157', dfile:'LOK400_mask2_H_msbsb157_eps.fits', wfile:'LOK400_mask2_H_msbsb157_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsb157_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=54.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 50.0', 'MU LT 64.0', 'SIG GT 0.0']}
     
     'msbsb158a' :  mask = {which:'msbsb158a', dfile:'LOK400_mask2_H_msbsb158a_eps.fits', wfile:'LOK400_mask2_H_msbsb158a_sig.fits', $
                            rfile:'LOK400_mask2_H_msbsb158a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=15.8', 'sig=2.0', 'c=8.0', 'x0=-0.1', 'x1=0.01'], $
                            priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
     
     'msbsb174' :  mask = {which:'msbsb174', dfile:'LOK400_mask2_H_msbsb174_eps.fits', wfile:'LOK400_mask2_H_msbsb174_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsb174_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=38.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 35.0', 'MU LT 45.0', 'SIG GT 0.0']}

     'msbsb182' :  mask = {which:'msbsb182', dfile:'LOK400_mask2_H_msbsb182_eps.fits', wfile:'LOK400_mask2_H_msbsb182_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsb182_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.1', 'sig=2.2', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'msbsb198' :  mask = {which:'msbsb198', dfile:'LOK400_mask2_H_msbsb198_eps.fits', wfile:'LOK400_mask2_H_msbsb198_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsb198_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=14.1', 'sig=2.0', 'c=30.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
     
     'msbsb224' :  mask = {which:'msbsb224', dfile:'LOK400_mask2_H_msbsb224_eps.fits', wfile:'LOK400_mask2_H_msbsb224_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsb224_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb81' :  mask = {which:'msbsb81', dfile:'LOK400_mask2_H_msbsb81_eps.fits', wfile:'LOK400_mask2_H_msbsb81_sig.fits', $
                          rfile:'LOK400_mask2_H_msbsb81_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=17.2', 'sig=1.4', 'c=120.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsb90' :  mask = {which:'msbsb90', dfile:'LOK400_mask2_H_msbsb90_eps.fits', wfile:'LOK400_mask2_H_msbsb90_sig.fits', $
                          rfile:'LOK400_mask2_H_msbsb90_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=16.4', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr224' :  mask = {which:'msbsr224', dfile:'LOK400_mask2_H_msbsr224_eps.fits', wfile:'LOK400_mask2_H_msbsr224_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr224_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=23.8', 'sig=2.0', 'c=34.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'msbsr226a' :  mask = {which:'msbsr226a', dfile:'LOK400_mask2_H_msbsr226a_eps.fits', wfile:'LOK400_mask2_H_msbsr226a_sig.fits', $
                            rfile:'LOK400_mask2_H_msbsr226a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=16.8', 'sig=2.0', 'c=60.0', 'x0=0.1', 'x1=-0.01'], $
                            priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr242' :  mask = {which:'msbsr242', dfile:'LOK400_mask2_H_msbsr242_eps.fits', wfile:'LOK400_mask2_H_msbsr242_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr242_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr252' :  mask = {which:'msbsr252', dfile:'LOK400_mask2_H_msbsr252_eps.fits', wfile:'LOK400_mask2_H_msbsr252_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr252_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.8', 'sig=2.0', 'c=70.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 15.0', 'MU LT 29.0', 'SIG GT 0.0']}
 
     'msbsr278a' :  mask = {which:'msbsr278a', dfile:'LOK400_mask2_H_msbsr278a_eps.fits', wfile:'LOK400_mask2_H_msbsr278a_sig.fits', $
                            rfile:'LOK400_mask2_H_msbsr278a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr355' :  mask = {which:'msbsr355', dfile:'LOK400_mask2_H_msbsr355_eps.fits', wfile:'LOK400_mask2_H_msbsr355_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr355_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 15.0', 'MU LT 25.0', 'SIG GT 0.0']}
 
     'msbsr358' :  mask = {which:'msbsr358', dfile:'LOK400_mask2_H_msbsr358_eps.fits', wfile:'LOK400_mask2_H_msbsr358_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr358_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=19.8', 'sig=4.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr359' :  mask = {which:'msbsr359', dfile:'LOK400_mask2_H_msbsr359_eps.fits', wfile:'LOK400_mask2_H_msbsr359_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr359_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr395' :  mask = {which:'msbsr395', dfile:'LOK400_mask2_H_msbsr395_eps.fits', wfile:'LOK400_mask2_H_msbsr395_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr395_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=17.5', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr404a' :  mask = {which:'msbsr404a', dfile:'LOK400_mask2_H_msbsr404_eps.fits', wfile:'LOK400_mask2_H_msbsr404_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr404_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:['msbsr404', 'msbsr404a'], flip:0, $
                           guess:['mu=26.8', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 25.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'msbsr404b' :  mask = {which:'msbsr404b', dfile:'LOK400_mask2_H_msbsr404_eps.fits', wfile:'LOK400_mask2_H_msbsr404_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr404_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:['msbsr404', 'msbsr404b'], flip:0, $
                           guess:['mu=56.1', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'msbsr406' :  mask = {which:'msbsr406', dfile:'LOK400_mask2_H_msbsr406_eps.fits', wfile:'LOK400_mask2_H_msbsr406_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr406_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.0', 'c=4.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr413a' :  mask = {which:'msbsr413a', dfile:'LOK400_mask2_H_msbsr413a_eps.fits', wfile:'LOK400_mask2_H_msbsr413a_sig.fits', $
                            rfile:'LOK400_mask2_H_msbsr413a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=26.8', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=-0.03'], $
                            priors:['MU GT 22.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr431' :  mask = {which:'msbsr431', dfile:'LOK400_mask2_H_msbsr431_eps.fits', wfile:'LOK400_mask2_H_msbsr431_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr431_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=17.2', 'sig=4.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr454' :  mask = {which:'msbsr454', dfile:'LOK400_mask2_H_msbsr454_eps.fits', wfile:'LOK400_mask2_H_msbsr454_sig.fits', $
                           rfile:'LOK400_mask2_H_msbsr454_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
'st17' :  mask = {which:'st17', dfile:'LOK400_mask2_H_st17_eps.fits', wfile:'LOK400_mask2_H_st17_sig.fits', $
                       rfile:'LOK400_mask2_H_st17_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
'st5' :  mask = {which:'st5', dfile:'LOK400_mask2_H_st5_eps.fits', wfile:'LOK400_mask2_H_st5_sig.fits', $
                      rfile:'LOK400_mask2_H_st5_eps.reg', $
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
pro lok400_mask2_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask2/2013nov29/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask2/2013nov29/H/'
  IF which[0] EQ 'all' THEN which = ['bsbsr17', 'bsbsr5b', 'bsbsr8a', 'eps.fits', 'fsbsb121', 'fsbsb173', 'fsbsr123', $
                                     'fsbsr128', 'fsbsr130', 'fsbsr189', 'fsbsr237', 'fsbsr239', 'man1', 'msbsb109a', $
                                     'msbsb112', 'msbsb157', 'msbsb158a', 'msbsb174', 'msbsb182', 'msbsb198', 'msbsb224', $
                                     'msbsb81', 'msbsb90', 'msbsr224', 'msbsr226a', 'msbsr242', 'msbsr252', 'msbsr278a', $
                                     'msbsr355', 'msbsr358', 'msbsr359', 'msbsr395', 'msbsr404', 'msbsr406', 'msbsr413a', $
                                     'msbsr431', 'msbsr454', 'st17', 'st5']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok400_mask2_H_extract_settings(which[zz])              ;get settings
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
