;========================================================================================================================
function lok200_mask4_H_extract_settings, pick
  
  CASE pick OF 

     'fsbsb132' :  mask = {which:'fsbsb132', dfile:'LOK200_mask4_H_fsbsb132_eps.fits', wfile:'LOK200_mask4_H_fsbsb132_sig.fits', $
                           rfile:'LOK200_mask4_H_fsbsb132_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.9', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'fsbsb138' :  mask = {which:'fsbsb138', dfile:'LOK200_mask4_H_fsbsb138_eps.fits', wfile:'LOK200_mask4_H_fsbsb138_sig.fits', $
                           rfile:'LOK200_mask4_H_fsbsb138_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fsbsb152' :  mask = {which:'fsbsb152', dfile:'LOK200_mask4_H_fsbsb152_eps.fits', wfile:'LOK200_mask4_H_fsbsb152_sig.fits', $
                           rfile:'LOK200_mask4_H_fsbsb152_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsb45' :  mask = {which:'fsbsb45', dfile:'LOK200_mask4_H_fsbsb45_eps.fits', wfile:'LOK200_mask4_H_fsbsb45_sig.fits', $
                          rfile:'LOK200_mask4_H_fsbsb45_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=24.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr123' :  mask = {which:'fsbsr123', dfile:'LOK200_mask4_H_fsbsr123_eps.fits', wfile:'LOK200_mask4_H_fsbsr123_sig.fits', $
                           rfile:'LOK200_mask4_H_fsbsr123_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr133' :  mask = {which:'fsbsr133', dfile:'LOK200_mask4_H_fsbsr133_eps.fits', wfile:'LOK200_mask4_H_fsbsr133_sig.fits', $
                           rfile:'LOK200_mask4_H_fsbsr133_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=29.2', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr170b' :  mask = {which:'fsbsr170b', dfile:'LOK200_mask4_H_fsbsr170b_eps.fits', wfile:'LOK200_mask4_H_fsbsr170b_sig.fits', $
                            rfile:'LOK200_mask4_H_fsbsr170b_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fsbsr234' :  mask = {which:'fsbsr234', dfile:'LOK200_mask4_H_fsbsr234_eps.fits', wfile:'LOK200_mask4_H_fsbsr234_sig.fits', $
                           rfile:'LOK200_mask4_H_fsbsr234_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb102' :  mask = {which:'msbsb102', dfile:'LOK200_mask4_H_msbsb102_eps.fits', wfile:'LOK200_mask4_H_msbsb102_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsb102_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb105' :  mask = {which:'msbsb105', dfile:'LOK200_mask4_H_msbsb105_eps.fits', wfile:'LOK200_mask4_H_msbsb105_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsb105_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.2', 'sig=4.0', 'c=11.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 24.0', 'SIG GT 0.0']}
     
     'msbsb108' :  mask = {which:'msbsb108', dfile:'LOK200_mask4_H_msbsb108_eps.fits', wfile:'LOK200_mask4_H_msbsb108_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsb108_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 4.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsb131a' :  mask = {which:'msbsb131a', dfile:'LOK200_mask4_H_msbsb131a_eps.fits', wfile:'LOK200_mask4_H_msbsb131a_sig.fits', $
                            rfile:'LOK200_mask4_H_msbsb131a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=42.1', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 40.0', 'MU LT 54.0', 'SIG GT 0.0']}
 
     'msbsb153b' :  mask = {which:'msbsb153b', dfile:'LOK200_mask4_H_msbsb153b_eps.fits', wfile:'LOK200_mask4_H_msbsb153b_sig.fits', $
                            rfile:'LOK200_mask4_H_msbsb153b_eps.reg', $
                            fit:'full', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=19.8', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb175b' :  mask = {which:'msbsb175b', dfile:'LOK200_mask4_H_msbsb175b_eps.fits', wfile:'LOK200_mask4_H_msbsb175b_sig.fits', $
                            rfile:'LOK200_mask4_H_msbsb175b_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=14.5', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
     
     'msbsb177' :  mask = {which:'msbsb177', dfile:'LOK200_mask4_H_msbsb177_eps.fits', wfile:'LOK200_mask4_H_msbsb177_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsb177_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
 
     'msbsb188' :  mask = {which:'msbsb188', dfile:'LOK200_mask4_H_msbsb188_eps.fits', wfile:'LOK200_mask4_H_msbsb188_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsb188_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=28.8', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsb198' :  mask = {which:'msbsb198', dfile:'LOK200_mask4_H_msbsb198_eps.fits', wfile:'LOK200_mask4_H_msbsb198_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsb198_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=25.8', 'sig=2.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'msbsb222' :  mask = {which:'msbsb222', dfile:'LOK200_mask4_H_msbsb222_eps.fits', wfile:'LOK200_mask4_H_msbsb222_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsb222_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.1', 'sig=3.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'msbsb53' :  mask = {which:'msbsb53', dfile:'LOK200_mask4_H_msbsb53_eps.fits', wfile:'LOK200_mask4_H_msbsb53_sig.fits', $
                          rfile:'LOK200_mask4_H_msbsb53_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=14.3', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
     
     'msbsr131' :  mask = {which:'msbsr131', dfile:'LOK200_mask4_H_msbsr131_eps.fits', wfile:'LOK200_mask4_H_msbsr131_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr131_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'msbsr133' :  mask = {which:'msbsr133', dfile:'LOK200_mask4_H_msbsr133_eps.fits', wfile:'LOK200_mask4_H_msbsr133_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr133_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=21.8', 'sig=3.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'msbsr138' :  mask = {which:'msbsr138', dfile:'LOK200_mask4_H_msbsr138_eps.fits', wfile:'LOK200_mask4_H_msbsr138_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr138_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr142' :  mask = {which:'msbsr142', dfile:'LOK200_mask4_H_msbsr142_eps.fits', wfile:'LOK200_mask4_H_msbsr142_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr142_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=10.5', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 6.0', 'MU LT 14.0', 'SIG GT 0.0']}
 
     'msbsr153' :  mask = {which:'msbsr153', dfile:'LOK200_mask4_H_msbsr153_eps.fits', wfile:'LOK200_mask4_H_msbsr153_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr153_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr155' :  mask = {which:'msbsr155', dfile:'LOK200_mask4_H_msbsr155_eps.fits', wfile:'LOK200_mask4_H_msbsr155_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr155_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr169' :  mask = {which:'msbsr169', dfile:'LOK200_mask4_H_msbsr169_eps.fits', wfile:'LOK200_mask4_H_msbsr169_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr169_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr210' :  mask = {which:'msbsr210', dfile:'LOK200_mask4_H_msbsr210_eps.fits', wfile:'LOK200_mask4_H_msbsr210_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr210_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'msbsr221' :  mask = {which:'msbsr221', dfile:'LOK200_mask4_H_msbsr221_eps.fits', wfile:'LOK200_mask4_H_msbsr221_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr221_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=48.9', 'sig=3.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 42.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'msbsr275' :  mask = {which:'msbsr275', dfile:'LOK200_mask4_H_msbsr275_eps.fits', wfile:'LOK200_mask4_H_msbsr275_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr275_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr293' :  mask = {which:'msbsr293', dfile:'LOK200_mask4_H_msbsr293_eps.fits', wfile:'LOK200_mask4_H_msbsr293_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr293_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=40.4', 'sig=2.0', 'c=22.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 34.0', 'MU LT 46.0', 'SIG GT 0.0']}
 
     'msbsr295a' :  mask = {which:'msbsr295a', dfile:'LOK200_mask4_H_msbsr295a_eps.fits', wfile:'LOK200_mask4_H_msbsr295a_sig.fits', $
                            rfile:'LOK200_mask4_H_msbsr295a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr298' :  mask = {which:'msbsr298', dfile:'LOK200_mask4_H_msbsr298_eps.fits', wfile:'LOK200_mask4_H_msbsr298_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr298_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=15.8', 'sig=1.5', 'c=80.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr300' :  mask = {which:'msbsr300', dfile:'LOK200_mask4_H_msbsr300_eps.fits', wfile:'LOK200_mask4_H_msbsr300_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr300_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=7.8', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 4.0', 'MU LT 15.0', 'SIG GT 0.0']}
 
     'msbsr302' :  mask = {which:'msbsr302', dfile:'LOK200_mask4_H_msbsr302_eps.fits', wfile:'LOK200_mask4_H_msbsr302_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr302_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=7.8', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 5.0', 'MU LT 15.0', 'SIG GT 0.0']}
 
     'msbsr315' :  mask = {which:'msbsr315', dfile:'LOK200_mask4_H_msbsr315_eps.fits', wfile:'LOK200_mask4_H_msbsr315_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr315_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=10.8', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 5.0', 'MU LT 15.0', 'SIG GT 0.0']}
 
     'msbsr326' :  mask = {which:'msbsr326', dfile:'LOK200_mask4_H_msbsr326_eps.fits', wfile:'LOK200_mask4_H_msbsr326_sig.fits', $
                           rfile:'LOK200_mask4_H_msbsr326_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest451b' :  mask = {which:'rest451b', dfile:'LOK200_mask4_H_rest451b_eps.fits', wfile:'LOK200_mask4_H_rest451b_sig.fits', $
                           rfile:'LOK200_mask4_H_rest451b_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=36.5', 'sig=2.0', 'c=26.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 45.0', 'SIG GT 0.0']}
 
     'st11' :  mask = {which:'st11', dfile:'LOK200_mask4_H_st11_eps.fits', wfile:'LOK200_mask4_H_st11_sig.fits', $
                       rfile:'LOK200_mask4_H_st11_eps.reg', $
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
pro lok200_mask4_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask4/2014jun13/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask4/2014jun13/H/'
  IF which[0] EQ 'all' THEN which = []
  

 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok200_mask4_H_extract_settings(which[zz])              ;get settings
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
