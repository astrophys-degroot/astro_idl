;========================================================================================================================
function lok200_mask5_H_extract_settings, pick
  
  CASE pick OF 

 
     'bsbsb4' :  mask = {which:'bsbsb4', dfile:'lok200_mask5_H_bsbsb4_eps.fits', wfile:'lok200_mask5_H_bsbsb4_sig.fits', $
                         rfile:'lok200_mask5_H_bsbsb4_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=52.8', 'sig=4.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 50.0', 'MU LT 62.0', 'SIG GT 0.0']}
 
     'bsbsb84' :  mask = {which:'bsbsb84', dfile:'lok200_mask5_H_bsbsb84_eps.fits', wfile:'lok200_mask5_H_bsbsb84_sig.fits', $
                          rfile:'lok200_mask5_H_bsbsb84_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=16.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 10.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'bsbsr6' :  mask = {which:'bsbsr6', dfile:'lok200_mask5_H_bsbsr6_eps.fits', wfile:'lok200_mask5_H_bsbsr6_sig.fits', $
                         rfile:'lok200_mask5_H_bsbsr6_eps.reg', $
                         fit:'full', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=25.8', 'sig=2.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
  
     'fsbsb119' :  mask = {which:'fsbsb119', dfile:'lok200_mask5_H_fsbsb119_eps.fits', wfile:'lok200_mask5_H_fsbsb119_sig.fits', $
                           rfile:'lok200_mask5_H_fsbsb119_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=42.8', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 54.0', 'SIG GT 0.0']}
     
     'fsbsb11' :  mask = {which:'fsbsb11', dfile:'lok200_mask5_H_fsbsb11_eps.fits', wfile:'lok200_mask5_H_fsbsb11_sig.fits', $
                          rfile:'lok200_mask5_H_fsbsb11_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=40.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 34.0', 'MU LT 54.0', 'SIG GT 0.0']}
     
     'fsbsb94' :  mask = {which:'fsbsb94', dfile:'lok200_mask5_H_fsbsb94_eps.fits', wfile:'lok200_mask5_H_fsbsb94_sig.fits', $
                          rfile:'lok200_mask5_H_fsbsb94_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=24.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr132' :  mask = {which:'fsbsr132', dfile:'lok200_mask5_H_fsbsr132_eps.fits', wfile:'lok200_mask5_H_fsbsr132_sig.fits', $
                           rfile:'lok200_mask5_H_fsbsr132_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr145' :  mask = {which:'fsbsr145', dfile:'lok200_mask5_H_fsbsr145_eps.fits', wfile:'lok200_mask5_H_fsbsr145_sig.fits', $
                           rfile:'lok200_mask5_H_fsbsr145_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr163' :  mask = {which:'fsbsr163', dfile:'lok200_mask5_H_fsbsr163_eps.fits', wfile:'lok200_mask5_H_fsbsr163_sig.fits', $
                           rfile:'lok200_mask5_H_fsbsr163_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=23.8', 'sig=3.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 15.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'fsbsr166' :  mask = {which:'fsbsr166', dfile:'lok200_mask5_H_fsbsr166_eps.fits', wfile:'lok200_mask5_H_fsbsr166_sig.fits', $
                           rfile:'lok200_mask5_H_fsbsr166_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr170c' :  mask = {which:'fsbsr170c', dfile:'lok200_mask5_H_fsbsr170c_eps.fits', wfile:'lok200_mask5_H_fsbsr170c_sig.fits', $
                            rfile:'lok200_mask5_H_fsbsr170c_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=38.8', 'sig=2.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 34.0', 'MU LT 46.0', 'SIG GT 0.0']}
     
     'fsbsr181' :  mask = {which:'fsbsr181', dfile:'lok200_mask5_H_fsbsr181_eps.fits', wfile:'lok200_mask5_H_fsbsr181_sig.fits', $
                           rfile:'lok200_mask5_H_fsbsr181_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 48.0', 'MU LT 64.0', 'SIG GT 0.0']}
 
     'msbsb103' :  mask = {which:'msbsb103', dfile:'lok200_mask5_H_msbsb103_eps.fits', wfile:'lok200_mask5_H_msbsb103_sig.fits', $
                           rfile:'lok200_mask5_H_msbsb103_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb145' :  mask = {which:'msbsb145', dfile:'lok200_mask5_H_msbsb145_eps.fits', wfile:'lok200_mask5_H_msbsb145_sig.fits', $
                           rfile:'lok200_mask5_H_msbsb145_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb153a' :  mask = {which:'msbsb153a', dfile:'lok200_mask5_H_msbsb153a_eps.fits', wfile:'lok200_mask5_H_msbsb153a_sig.fits', $
                            rfile:'lok200_mask5_H_msbsb153a_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=24.8', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 22.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb157' :  mask = {which:'msbsb157', dfile:'lok200_mask5_H_msbsb157_eps.fits', wfile:'lok200_mask5_H_msbsb157_sig.fits', $
                           rfile:'lok200_mask5_H_msbsb157_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=58.8', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 50.0', 'MU LT 64.0', 'SIG GT 0.0']}
 
     'msbsb159' :  mask = {which:'msbsb159', dfile:'lok200_mask5_H_msbsb159_eps.fits', wfile:'lok200_mask5_H_msbsb159_sig.fits', $
                           rfile:'lok200_mask5_H_msbsb159_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=29.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 25.0', 'MU LT 38.0', 'SIG GT 0.0']}
 
     'msbsr173' :  mask = {which:'msbsr173', dfile:'lok200_mask5_H_msbsr173_eps.fits', wfile:'lok200_mask5_H_msbsr173_sig.fits', $
                           rfile:'lok200_mask5_H_msbsr173_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr199' :  mask = {which:'msbsr199', dfile:'lok200_mask5_H_msbsr199_eps.fits', wfile:'lok200_mask5_H_msbsr199_sig.fits', $
                           rfile:'lok200_mask5_H_msbsr199_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'msbsr207' :  mask = {which:'msbsr207', dfile:'lok200_mask5_H_msbsr207_eps.fits', wfile:'lok200_mask5_H_msbsr207_sig.fits', $
                           rfile:'lok200_mask5_H_msbsr207_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=14.8', 'sig=4.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'msbsr217' :  mask = {which:'msbsr217', dfile:'lok200_mask5_H_msbsr217_eps.fits', wfile:'lok200_mask5_H_msbsr217_sig.fits', $
                           rfile:'lok200_mask5_H_msbsr217_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.4', 'sig=4.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 22.0', 'MU LT 38.0', 'SIG GT 0.0']}

     'msbsr217b' :  mask = {which:'msbsr217b', dfile:'lok200_mask5_H_msbsr217_eps.fits', wfile:'lok200_mask5_H_msbsr217_sig.fits', $
                           rfile:'lok200_mask5_H_msbsr217_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:['msbsr217', 'msbsr217b'], flip:0, $
                           guess:['mu=54.4', 'sig=2.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 50.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'msbsr222' :  mask = {which:'msbsr222', dfile:'lok200_mask5_H_msbsr222_eps.fits', wfile:'lok200_mask5_H_msbsr222_sig.fits', $
                           rfile:'lok200_mask5_H_msbsr222_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 44.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'msbsr225' :  mask = {which:'msbsr225', dfile:'lok200_mask5_H_msbsr225_eps.fits', wfile:'lok200_mask5_H_msbsr225_sig.fits', $
                           rfile:'lok200_mask5_H_msbsr225_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 44.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'msbsr231' :  mask = {which:'msbsr231', dfile:'lok200_mask5_H_msbsr231_eps.fits', wfile:'lok200_mask5_H_msbsr231_sig.fits', $
                           rfile:'lok200_mask5_H_msbsr231_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr235' :  mask = {which:'msbsr235', dfile:'lok200_mask5_H_msbsr235_eps.fits', wfile:'lok200_mask5_H_msbsr235_sig.fits', $
                           rfile:'lok200_mask5_H_msbsr235_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'newobj1' :  mask = {which:'newobj1', dfile:'lok200_mask5_H_newobj1_eps.fits', wfile:'lok200_mask5_H_newobj1_sig.fits', $
                          rfile:'lok200_mask5_H_newobj1_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=21.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 16.0', 'MU LT 30.0', 'SIG GT 0.0']}

     'rest453' :  mask = {which:'rest453', dfile:'lok200_mask5_H_rest453_eps.fits', wfile:'lok200_mask5_H_rest453_sig.fits', $
                          rfile:'lok200_mask5_H_rest453_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest486' :  mask = {which:'rest486', dfile:'lok200_mask5_H_rest486_eps.fits', wfile:'lok200_mask5_H_rest486_sig.fits', $
                          rfile:'lok200_mask5_H_rest486_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest488' :  mask = {which:'rest488', dfile:'lok200_mask5_H_rest488_eps.fits', wfile:'lok200_mask5_H_rest488_sig.fits', $
                          rfile:'lok200_mask5_H_rest488_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest495' :  mask = {which:'rest495', dfile:'lok200_mask5_H_rest495_eps.fits', wfile:'lok200_mask5_H_rest495_sig.fits', $
                          rfile:'lok200_mask5_H_rest495_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest519' :  mask = {which:'rest519', dfile:'lok200_mask5_H_rest519_eps.fits', wfile:'lok200_mask5_H_rest519_sig.fits', $
                          rfile:'lok200_mask5_H_rest519_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest531' :  mask = {which:'rest531', dfile:'lok200_mask5_H_rest531_eps.fits', wfile:'lok200_mask5_H_rest531_sig.fits', $
                          rfile:'lok200_mask5_H_rest531_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=20.8', 'sig=2.4', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'sbsbc196' :  mask = {which:'sbsbc196', dfile:'lok200_mask5_H_sbsbc196_eps.fits', wfile:'lok200_mask5_H_sbsbc196_sig.fits', $
                           rfile:'lok200_mask5_H_sbsbc196_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=29.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'st14' :  mask = {which:'st14', dfile:'lok200_mask5_H_st14_eps.fits', wfile:'lok200_mask5_H_st14_sig.fits', $
                       rfile:'lok200_mask5_H_st14_eps.reg', $
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
pro lok200_mask5_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask5/2014jun13/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask5/2014jun13/H/'
  IF which[0] EQ 'all' THEN which = ['bsbsb4', 'bsbsb84', 'bsbsr6', 'eps.fits', 'fsbsb119', 'fsbsb11', 'fsbsb94', $
                                     'fsbsr132', 'fsbsr145', 'fsbsr163', 'fsbsr166', 'fsbsr170c', 'fsbsr181', 'msbsb103', $
                                     'msbsb145', 'msbsb153a', 'msbsb157', 'msbsb159', 'msbsr173', 'msbsr199', 'msbsr207', $
                                     'msbsr217', 'msbsr222', 'msbsr225', 'msbsr231', 'msbsr235', 'newobj1', 'rest453', $
                                     'rest486', 'rest488', 'rest495', 'rest519', 'rest531', 'sbsbc196', 'st14']
  

 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok200_mask5_H_extract_settings(which[zz])              ;get settings
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
