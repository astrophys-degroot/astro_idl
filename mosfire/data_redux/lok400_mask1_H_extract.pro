;========================================================================================================================
function lok400_mask1_H_extract_settings, pick
  
  CASE pick OF 

     'bsbsr3b' :  mask = {which:'bsbsr3b', dfile:'lok400_mask1_H_bsbsr3b_eps.fits', wfile:'lok400_mask1_H_bsbsr3b_sig.fits', $
                          rfile:'lok400_mask1_H_bsbsr3b_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=5.8', 'sig=1.0', 'c=1.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 0.0', 'MU LT 14.0', 'SIG GT 0.0']}
     
     'bsbsr3a' :  mask = {which:'bsbsr3a', dfile:'lok400_mask1_H_bsbsr3b_eps.fits', wfile:'lok400_mask1_H_bsbsr3b_sig.fits', $
                          rfile:'lok400_mask1_H_bsbsr3a_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:['bsbsr3b', 'bsbsr3a'], flip:0, $
                          guess:['mu=8.2', 'sig=2.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 0.0', 'MU LT 15.0', 'SIG GT 0.0']}
     
     'bsbsr5a' :  mask = {which:'bsbsr5a', dfile:'lok400_mask1_H_bsbsr5a_eps.fits', wfile:'lok400_mask1_H_bsbsr5a_sig.fits', $
                          rfile:'lok400_mask1_H_bsbsr5a_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=31.8', 'sig=3.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 28.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'bsbsr5e' :  mask = {which:'bsbsr5e', dfile:'lok400_mask1_H_bsbsr5e_eps.fits', wfile:'lok400_mask1_H_bsbsr5e_sig.fits', $
                          rfile:'lok400_mask1_H_bsbsr5e_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.8', 'sig=4.0', 'c=1.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 4.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'bsbsr8b' :  mask = {which:'bsbsr8b', dfile:'lok400_mask1_H_bsbsr8b_eps.fits', wfile:'lok400_mask1_H_bsbsr8b_sig.fits', $
                          rfile:'lok400_mask1_H_bsbsr8b_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=18.1', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=-0.01'], $
                          priors:['MU GT 10.0', 'MU LT 26.0', 'SIG GT 0.0']}
  
     'fsbsb139' :  mask = {which:'fsbsb139', dfile:'lok400_mask1_H_fsbsb139_eps.fits', wfile:'lok400_mask1_H_fsbsb139_sig.fits', $
                           rfile:'lok400_mask1_H_fsbsb139_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.8', 'sig=2.0', 'c=15.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 0.0', 'MU LT 16.0', 'SIG GT 0.0']}
     
     'fsbsr214' :  mask = {which:'fsbsr214', dfile:'lok400_mask1_H_fsbsr214_eps.fits', wfile:'lok400_mask1_H_fsbsr214_sig.fits', $
                           rfile:'lok400_mask1_H_fsbsr214_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=-0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fsbsr221' :  mask = {which:'fsbsr221', dfile:'lok400_mask1_H_fsbsr221_eps.fits', wfile:'lok400_mask1_H_fsbsr221_sig.fits', $
                           rfile:'lok400_mask1_H_fsbsr221_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'fsbsr232' :  mask = {which:'fsbsr232', dfile:'lok400_mask1_H_fsbsr232_eps.fits', wfile:'lok400_mask1_H_fsbsr232_sig.fits', $
                           rfile:'lok400_mask1_H_fsbsr232_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=3.0', 'c=2.0', 'x0=-0.1', 'x1=-0.01'], $
                           priors:['MU GT 16.0', 'MU LT 32.0', 'SIG GT 0.0', 'SIG LT 4.0']}
     
     'msbsb130' :  mask = {which:'msbsb130', dfile:'lok400_mask1_H_msbsb130_eps.fits', wfile:'lok400_mask1_H_msbsb130_sig.fits', $
                           rfile:'lok400_mask1_H_msbsb130_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.2', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'msbsb207' :  mask = {which:'msbsb207', dfile:'lok400_mask1_H_msbsb207_eps.fits', wfile:'lok400_mask1_H_msbsb207_sig.fits', $
                           rfile:'lok400_mask1_H_msbsb207_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.5', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 26.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'msbsb219' :  mask = {which:'msbsb219', dfile:'lok400_mask1_H_msbsb219_eps.fits', wfile:'lok400_mask1_H_msbsb219_sig.fits', $
                           rfile:'lok400_mask1_H_msbsb219_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=37.8', 'sig=3.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'msbsb227' :  mask = {which:'msbsb227', dfile:'lok400_mask1_H_msbsb227_eps.fits', wfile:'lok400_mask1_H_msbsb227_sig.fits', $
                           rfile:'lok400_mask1_H_msbsb227_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 20.0', 'MU LT 35.0', 'SIG GT 0.0']}
     
     'msbsr180a' :  mask = {which:'msbsr180a', dfile:'lok400_mask1_H_msbsr180_eps.fits', wfile:'lok400_mask1_H_msbsr180_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr180_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:['msbsr180','msbsr180a'], flip:0, $
                           guess:['mu=10.2', 'sig=2.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 6.0', 'MU LT 18.0', 'SIG GT 0.0']}
     
     'msbsr180b' :  mask = {which:'msbsr180b', dfile:'lok400_mask1_H_msbsr180_eps.fits', wfile:'lok400_mask1_H_msbsr180_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr180_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:['msbsr180','msbsr180b'], flip:0, $
                           guess:['mu=35.2', 'sig=2.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 44.0', 'SIG GT 0.0']}
     
     'msbsr181' :  mask = {which:'msbsr181', dfile:'lok400_mask1_H_msbsr181_eps.fits', wfile:'lok400_mask1_H_msbsr181_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr181_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr215' :  mask = {which:'msbsr215', dfile:'lok400_mask1_H_msbsr215_eps.fits', wfile:'lok400_mask1_H_msbsr215_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr215_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.3', 'sig=4.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'msbsr217' :  mask = {which:'msbsr217', dfile:'lok400_mask1_H_msbsr217_eps.fits', wfile:'lok400_mask1_H_msbsr217_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr217_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=19.8', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'msbsr229' :  mask = {which:'msbsr229', dfile:'lok400_mask1_H_msbsr229_eps.fits', wfile:'lok400_mask1_H_msbsr229_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr229_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'msbsr233a' :  mask = {which:'msbsr233a', dfile:'lok400_mask1_H_msbsr233_eps.fits', wfile:'lok400_mask1_H_msbsr233_sig.fits', $
                            rfile:'lok400_mask1_H_msbsr233a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:['msbsr233', 'msbsr233a'], flip:0, $
                            guess:['mu=22.8', 'sig=2.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr233b' :  mask = {which:'msbsr233b', dfile:'lok400_mask1_H_msbsr233_eps.fits', wfile:'lok400_mask1_H_msbsr233_sig.fits', $
                            rfile:'lok400_mask1_H_msbsr233_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:['msbsr233','msbsr233b'], flip:0, $
                            guess:['mu=42.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 40.0', 'MU LT 50.0', 'SIG GT 0.0', 'SIG LT 4.0']}
     
     'msbsr239' :  mask = {which:'msbsr239', dfile:'lok400_mask1_H_msbsr239_eps.fits', wfile:'lok400_mask1_H_msbsr239_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr239_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=-0.2', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr244' :  mask = {which:'msbsr244', dfile:'lok400_mask1_H_msbsr244_eps.fits', wfile:'lok400_mask1_H_msbsr244_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr244_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.2', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 5.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr248' :  mask = {which:'msbsr248', dfile:'lok400_mask1_H_msbsr248_eps.fits', wfile:'lok400_mask1_H_msbsr248_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr248_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=43.1', 'sig=4.0', 'c=10.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 35.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'msbsr249' :  mask = {which:'msbsr249', dfile:'lok400_mask1_H_msbsr249_eps.fits', wfile:'lok400_mask1_H_msbsr249_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr249_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=46.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 40.0', 'MU LT 55.0', 'SIG GT 0.0']}
 
     'fore1' :  mask = {which:'fore1', dfile:'lok400_mask1_H_msbsr249_eps.fits', wfile:'lok400_mask1_H_msbsr249_sig.fits', $
                           rfile:'lok400_mask1_H_fore1_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:['msbsr249', 'fore1'], flip:0, $
                           guess:['mu=76.1', 'sig=2.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 70.0', 'MU LT 80.0', 'SIG GT 0.0']}
     
     'msbsr251' :  mask = {which:'msbsr251', dfile:'lok400_mask1_H_msbsr251_eps.fits', wfile:'lok400_mask1_H_msbsr251_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr251_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.1', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr266' :  mask = {which:'msbsr266', dfile:'lok400_mask1_H_msbsr266_eps.fits', wfile:'lok400_mask1_H_msbsr266_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr266_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.5', 'c=20.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr314' :  mask = {which:'msbsr314', dfile:'lok400_mask1_H_msbsr314_eps.fits', wfile:'lok400_mask1_H_msbsr314_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr314_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr316' :  mask = {which:'msbsr316', dfile:'lok400_mask1_H_msbsr316_eps.fits', wfile:'lok400_mask1_H_msbsr316_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr316_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.8', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'msbsr320' :  mask = {which:'msbsr320', dfile:'lok400_mask1_H_msbsr320_eps.fits', wfile:'lok400_mask1_H_msbsr320_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr320_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.3', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr334' :  mask = {which:'msbsr334', dfile:'lok400_mask1_H_msbsr334_eps.fits', wfile:'lok400_mask1_H_msbsr334_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr334_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=20.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr340' :  mask = {which:'msbsr340', dfile:'lok400_mask1_H_msbsr340_eps.fits', wfile:'lok400_mask1_H_msbsr340_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr340_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=45.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 58.0', 'SIG GT 0.0']}
  
     'msbsr344' :  mask = {which:'msbsr344', dfile:'lok400_mask1_H_msbsr344_eps.fits', wfile:'lok400_mask1_H_msbsr344_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr344_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr379a' :  mask = {which:'msbsr379a', dfile:'lok400_mask1_H_msbsr379a_eps.fits', wfile:'lok400_mask1_H_msbsr379a_sig.fits', $
                            rfile:'lok400_mask1_H_msbsr379a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr391' :  mask = {which:'msbsr391', dfile:'lok400_mask1_H_msbsr391_eps.fits', wfile:'lok400_mask1_H_msbsr391_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr391_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=30.2', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 25.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'fore2' :  mask = {which:'fore2', dfile:'lok400_mask1_H_msbsr391_eps.fits', wfile:'lok400_mask1_H_msbsr391_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr391_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:['msbsr391','fore2'], flip:0, $
                           guess:['mu=76.8', 'sig=3.0', 'c=17.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 70.0', 'MU LT 90.0', 'SIG GT 0.0']}
 
     'msbsr392' :  mask = {which:'msbsr392', dfile:'lok400_mask1_H_msbsr392_eps.fits', wfile:'lok400_mask1_H_msbsr392_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr392_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.2', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr403' :  mask = {which:'msbsr403', dfile:'lok400_mask1_H_msbsr403_eps.fits', wfile:'lok400_mask1_H_msbsr403_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr403_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr408' :  mask = {which:'msbsr408', dfile:'lok400_mask1_H_msbsr408_eps.fits', wfile:'lok400_mask1_H_msbsr408_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr408_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=1.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 16.0', 'MU LT 24.0', 'SIG GT 2.0', 'SIG LT 4.0']}
 
     'msbsr416' :  mask = {which:'msbsr416', dfile:'lok400_mask1_H_msbsr416_eps.fits', wfile:'lok400_mask1_H_msbsr416_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr416_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.5', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 25.0', 'SIG GT 0.0']}
 
     'msbsr424' :  mask = {which:'msbsr424', dfile:'lok400_mask1_H_msbsr424_eps.fits', wfile:'lok400_mask1_H_msbsr424_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr424_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'msbsr427' :  mask = {which:'msbsr427', dfile:'lok400_mask1_H_msbsr427_eps.fits', wfile:'lok400_mask1_H_msbsr427_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr427_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=48.9', 'sig=3.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'fsbsb186' :  mask = {which:'fsbsb186', dfile:'lok400_mask1_H_msbsr427_eps.fits', wfile:'lok400_mask1_H_msbsr427_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr427_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:['msbsr427','fsbsb186'], flip:0, $
                           guess:['mu=82.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 70.0', 'MU LT 90.0', 'SIG GT 0.0']}
     
     'msbsr446' :  mask = {which:'msbsr446', dfile:'lok400_mask1_H_msbsr446_eps.fits', wfile:'lok400_mask1_H_msbsr446_sig.fits', $
                           rfile:'lok400_mask1_H_msbsr446_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
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
pro lok400_mask1_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov29/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov29/H/'
  IF which[0] EQ 'all' THEN which = ['bsbsr3b', 'bsbsr5a', 'bsbsr5e', 'bsbsr8b', 'fsbsb139', 'fsbsr214', $
                                     'fsbsr221', 'fsbsr232', 'msbsb130', 'msbsb207', 'msbsb219', 'msbsb227', $
                                     'msbsr180', 'msbsr181', 'msbsr215', 'msbsr217', 'msbsr229', 'msbsr233', $
                                     'msbsr239', 'msbsr244', 'msbsr248', 'msbsr249', 'msbsr251', 'msbsr266', $
                                     'msbsr314', 'msbsr316', 'msbsr320', 'msbsr334', 'msbsr340', 'msbsr344', $
                                     'msbsr379a', 'msbsr391', 'msbsr392', 'msbsr403', 'msbsr408', 'msbsr416', $
                                     'msbsr424', 'msbsr427', 'msbsr446']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok400_mask1_H_extract_settings(which[zz])              ;get settings
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
