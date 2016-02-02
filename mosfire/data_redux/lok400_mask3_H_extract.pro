;========================================================================================================================
function lok400_mask3_H_extract_settings, pick
  
  CASE pick OF 

     'bsbsr5c' :  mask = {which:'bsbsr5c', dfile:'LOK400_mask3_H_bsbsr5c_eps.fits', wfile:'LOK400_mask3_H_bsbsr5c_sig.fits', $
                          rfile:'LOK400_mask3_H_bsbsr5c_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=12.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 5.0', 'MU LT 15.0', 'SIG GT 0.0']}
     
     'fsbsb123' :  mask = {which:'fsbsb123', dfile:'LOK400_mask3_H_fsbsb123_eps.fits', wfile:'LOK400_mask3_H_fsbsb123_sig.fits', $
                           rfile:'LOK400_mask3_H_fsbsb123_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 5.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'fsbsr144' :  mask = {which:'fsbsr144', dfile:'LOK400_mask3_H_fsbsr144_eps.fits', wfile:'LOK400_mask3_H_fsbsr144_sig.fits', $
                           rfile:'LOK400_mask3_H_fsbsr144_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb105' :  mask = {which:'msbsb105', dfile:'LOK400_mask3_H_msbsb105_eps.fits', wfile:'LOK400_mask3_H_msbsb105_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsb105_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=150.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb128' :  mask = {which:'msbsb128', dfile:'LOK400_mask3_H_msbsb128_eps.fits', wfile:'LOK400_mask3_H_msbsb128_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsb128_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=42.1', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 35.0', 'MU LT 55.0', 'SIG GT 0.0']}
 
     'msbsb134' :  mask = {which:'msbsb134', dfile:'LOK400_mask3_H_msbsb134_eps.fits', wfile:'LOK400_mask3_H_msbsb134_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsb134_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=4.0', 'c=80.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb140' :  mask = {which:'msbsb140', dfile:'LOK400_mask3_H_msbsb140_eps.fits', wfile:'LOK400_mask3_H_msbsb140_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsb140_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=42.1', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 32.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'msbsb142a' :  mask = {which:'msbsb142a', dfile:'LOK400_mask3_H_msbsb142a_eps.fits', wfile:'LOK400_mask3_H_msbsb142a_sig.fits', $
                            rfile:'LOK400_mask3_H_msbsb142a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb143' :  mask = {which:'msbsb143', dfile:'LOK400_mask3_H_msbsb143_eps.fits', wfile:'LOK400_mask3_H_msbsb143_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsb143_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=29.0', 'sig=2.5', 'c=125.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'msbsb153' :  mask = {which:'msbsb153', dfile:'LOK400_mask3_H_msbsb153_eps.fits', wfile:'LOK400_mask3_H_msbsb153_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsb153_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb175' :  mask = {which:'msbsb175', dfile:'LOK400_mask3_H_msbsb175_eps.fits', wfile:'LOK400_mask3_H_msbsb175_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsb175_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb188' :  mask = {which:'msbsb188', dfile:'LOK400_mask3_H_msbsb188_eps.fits', wfile:'LOK400_mask3_H_msbsb188_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsb188_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr221' :  mask = {which:'msbsr221', dfile:'LOK400_mask3_H_msbsr221_eps.fits', wfile:'LOK400_mask3_H_msbsr221_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr221_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=55.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 65.0', 'SIG GT 0.0']}
 
     'msbsr238' :  mask = {which:'msbsr238', dfile:'LOK400_mask3_H_msbsr238_eps.fits', wfile:'LOK400_mask3_H_msbsr238_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr238_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=40.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 32.0', 'MU LT 48.0', 'SIG GT 0.0']}
 
     'msbsr240' :  mask = {which:'msbsr240', dfile:'LOK400_mask3_H_msbsr240_eps.fits', wfile:'LOK400_mask3_H_msbsr240_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr240_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=1.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr243' :  mask = {which:'msbsr243', dfile:'LOK400_mask3_H_msbsr243_eps.fits', wfile:'LOK400_mask3_H_msbsr243_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr243_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr257a' :  mask = {which:'msbsr257a', dfile:'LOK400_mask3_H_msbsr257a_eps.fits', wfile:'LOK400_mask3_H_msbsr257a_sig.fits', $
                            rfile:'LOK400_mask3_H_msbsr257a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr263' :  mask = {which:'msbsr263', dfile:'LOK400_mask3_H_msbsr263_eps.fits', wfile:'LOK400_mask3_H_msbsr263_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr263_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr269' :  mask = {which:'msbsr269', dfile:'LOK400_mask3_H_msbsr269_eps.fits', wfile:'LOK400_mask3_H_msbsr269_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr269_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr277' :  mask = {which:'msbsr277', dfile:'LOK400_mask3_H_msbsr277_eps.fits', wfile:'LOK400_mask3_H_msbsr277_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr277_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=1.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'msbsr278b' :  mask = {which:'msbsr278b', dfile:'LOK400_mask3_H_msbsr278b_eps.fits', wfile:'LOK400_mask3_H_msbsr278b_sig.fits', $
                            rfile:'LOK400_mask3_H_msbsr278b_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr279a' :  mask = {which:'msbsr279a', dfile:'LOK400_mask3_H_msbsr279a_eps.fits', wfile:'LOK400_mask3_H_msbsr279a_sig.fits', $
                            rfile:'LOK400_mask3_H_msbsr279a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr280' :  mask = {which:'msbsr280', dfile:'LOK400_mask3_H_msbsr280_eps.fits', wfile:'LOK400_mask3_H_msbsr280_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr280_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr285' :  mask = {which:'msbsr285', dfile:'LOK400_mask3_H_msbsr285_eps.fits', wfile:'LOK400_mask3_H_msbsr285_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr285_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr293' :  mask = {which:'msbsr293', dfile:'LOK400_mask3_H_msbsr293_eps.fits', wfile:'LOK400_mask3_H_msbsr293_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr293_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr310' :  mask = {which:'msbsr310', dfile:'LOK400_mask3_H_msbsr310_eps.fits', wfile:'LOK400_mask3_H_msbsr310_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr310_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.8', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'msbsr312a' :  mask = {which:'msbsr312a', dfile:'LOK400_mask3_H_msbsr312a_eps.fits', wfile:'LOK400_mask3_H_msbsr312a_sig.fits', $
                            rfile:'LOK400_mask3_H_msbsr312a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr315' :  mask = {which:'msbsr315', dfile:'LOK400_mask3_H_msbsr315_eps.fits', wfile:'LOK400_mask3_H_msbsr315_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr315_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=40.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 35.0', 'MU LT 45.0', 'SIG GT 0.0']}
 
     'msbsr317' :  mask = {which:'msbsr317', dfile:'LOK400_mask3_H_msbsr317_eps.fits', wfile:'LOK400_mask3_H_msbsr317_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr317_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr323' :  mask = {which:'msbsr323', dfile:'LOK400_mask3_H_msbsr323_eps.fits', wfile:'LOK400_mask3_H_msbsr323_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr323_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'msbsr335a' :  mask = {which:'msbsr335a', dfile:'LOK400_mask3_H_msbsr335a_eps.fits', wfile:'LOK400_mask3_H_msbsr335a_sig.fits', $
                            rfile:'LOK400_mask3_H_msbsr335a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr336' :  mask = {which:'msbsr336', dfile:'LOK400_mask3_H_msbsr336_eps.fits', wfile:'LOK400_mask3_H_msbsr336_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr336_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr342' :  mask = {which:'msbsr342', dfile:'LOK400_mask3_H_msbsr342_eps.fits', wfile:'LOK400_mask3_H_msbsr342_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr342_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr350' :  mask = {which:'msbsr350', dfile:'LOK400_mask3_H_msbsr350_eps.fits', wfile:'LOK400_mask3_H_msbsr350_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr350_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr376' :  mask = {which:'msbsr376', dfile:'LOK400_mask3_H_msbsr376_eps.fits', wfile:'LOK400_mask3_H_msbsr376_sig.fits', $
                           rfile:'LOK400_mask3_H_msbsr376_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'st1' :  mask = {which:'st1', dfile:'LOK400_mask3_H_st1_eps.fits', wfile:'LOK400_mask3_H_st1_sig.fits', $
                      rfile:'LOK400_mask3_H_st1_eps.reg', $
                      fit:'full', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'st9' :  mask = {which:'st9', dfile:'LOK400_mask3_H_st9_eps.fits', wfile:'LOK400_mask3_H_st9_sig.fits', $
                      rfile:'LOK400_mask3_H_st9_eps.reg', $
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
pro lok400_mask3_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/'
  IF which[0] EQ 'all' THEN which = ['bsbsr5c', 'fsbsb123', 'fsbsr144', 'msbsb105', 'msbsb128', 'msbsb134', $
                                     'msbsb140', 'msbsb142a', 'msbsb143', 'msbsb153', 'msbsb175', 'msbsb188', $
                                     'msbsr221', 'msbsr238', 'msbsr240', 'msbsr243', 'msbsr257a', 'msbsr263', $
                                     'msbsr269', 'msbsr277', 'msbsr278b', 'msbsr279a', 'msbsr280', 'msbsr285', $
                                     'msbsr293', 'msbsr310', 'msbsr312a', 'msbsr315', 'msbsr317', 'msbsr323', $
                                     'msbsr335a', 'msbsr336', 'msbsr342', 'msbsr350', 'msbsr376', 'st1', 'st9']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok400_mask3_H_extract_settings(which[zz])              ;get settings
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
