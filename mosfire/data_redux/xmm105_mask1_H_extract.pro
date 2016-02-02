;========================================================================================================================
function xmm105_mask1_H_extract_settings, pick
  
  CASE pick OF  

     'clhi1' :  mask = {which:'clhi1', dfile:'xmm105_mask1_v1_H_clhi1_eps.fits', wfile:'xmm105_mask1_v1_H_clhi1_sig.fits', $
                        rfile:'xmm105_mask1_v1_H_clhi1_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=28.7', 'sig=3.0', 'c=50.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
     
     'clhi2' :  mask = {which:'clhi2', dfile:'xmm105_mask1_v1_H_clhi2_eps.fits', wfile:'xmm105_mask1_v1_H_clhi2_sig.fits', $
                        rfile:'xmm105_mask1_v1_H_clhi2_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=3.0', 'c=22.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'clhi3' :  mask = {which:'clhi3', dfile:'xmm105_mask1_v1_H_clhi3_eps.fits', wfile:'xmm105_mask1_v1_H_clhi3_sig.fits', $
                        rfile:'xmm105_mask1_v1_H_clhi3_eps.reg', $
                        fit:'full', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=42.0', 'sig=2.6', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 34.0', 'MU LT 48.0', 'SIG GT 0.0']}
     
     'clhi4' :  mask = {which:'clhi4', dfile:'xmm105_mask1_v1_H_clhi4_eps.fits', wfile:'xmm105_mask1_v1_H_clhi4_sig.fits', $
                        rfile:'xmm105_mask1_v1_H_clhi4_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=50.1', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 40.0', 'MU LT 54.0', 'SIG GT 0.0']}
 
     'clhi5' :  mask = {which:'clhi5', dfile:'xmm105_mask1_v1_H_clhi5_eps.fits', wfile:'xmm105_mask1_v1_H_clhi5_sig.fits', $
                        rfile:'xmm105_mask1_v1_H_clhi5_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=25.4', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'clhi6' :  mask = {which:'clhi6', dfile:'xmm105_mask1_v1_H_clhi6_eps.fits', wfile:'xmm105_mask1_v1_H_clhi6_sig.fits', $
                        rfile:'xmm105_mask1_v1_H_clhi6_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=58.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 54.0', 'MU LT 66.0', 'SIG GT 0.0']}
     
     'clhi7' :  mask = {which:'clhi7', dfile:'xmm105_mask1_v1_H_clhi7_eps.fits', wfile:'xmm105_mask1_v1_H_clhi7_sig.fits', $
                        rfile:'xmm105_mask1_v1_H_clhi7_eps.reg', $
                        fit:'full', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'clhi8' :  mask = {which:'clhi8', dfile:'xmm105_mask1_v1_H_clhi8_eps.fits', wfile:'xmm105_mask1_v1_H_clhi8_sig.fits', $
                        rfile:'xmm105_mask1_v1_H_clhi8_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=27.8', 'sig=3.0', 'c=24.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 22.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'clhi9' :  mask = {which:'clhi9', dfile:'xmm105_mask1_v1_H_clhi9_eps.fits', wfile:'xmm105_mask1_v1_H_clhi9_sig.fits', $
                        rfile:'xmm105_mask1_v1_H_clhi9_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=3.0', 'c=70.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'cllow0' :  mask = {which:'cllow0', dfile:'xmm105_mask1_v1_H_cllow0_eps.fits', wfile:'xmm105_mask1_v1_H_cllow0_sig.fits', $
                         rfile:'xmm105_mask1_v1_H_cllow0_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=24.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 18.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'cllow1' :  mask = {which:'cllow1', dfile:'xmm105_mask1_v1_H_cllow1_eps.fits', wfile:'xmm105_mask1_v1_H_cllow1_sig.fits', $
                         rfile:'xmm105_mask1_v1_H_cllow1_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=50.2', 'sig=2.8', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0']}
     
     'cllow4' :  mask = {which:'cllow4', dfile:'xmm105_mask1_v1_H_cllow4_eps.fits', wfile:'xmm105_mask1_v1_H_cllow4_sig.fits', $
                         rfile:'xmm105_mask1_v1_H_cllow4_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=59.5', 'sig=2.6', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 55.0', 'MU LT 65.0', 'SIG GT 0.0']}
  
     'fg43' :  mask = {which:'fg43', dfile:'xmm105_mask1_v1_H_fg43_eps.fits', wfile:'xmm105_mask1_v1_H_fg43_sig.fits', $
                       rfile:'xmm105_mask1_v1_H_fg43_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi12' :  mask = {which:'pzhi12', dfile:'xmm105_mask1_v1_H_pzhi12_eps.fits', wfile:'xmm105_mask1_v1_H_pzhi12_sig.fits', $
                         rfile:'xmm105_mask1_v1_H_pzhi12_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 18.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'pzhi20' :  mask = {which:'pzhi20', dfile:'xmm105_mask1_v1_H_pzhi20_eps.fits', wfile:'xmm105_mask1_v1_H_pzhi20_sig.fits', $
                         rfile:'xmm105_mask1_v1_H_pzhi20_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=27.8', 'sig=3.0', 'c=18.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
 
     'pzlow1792' :  mask = {which:'pzlow1792', dfile:'xmm105_mask1_v1_H_pzlow1792_eps.fits', wfile:'xmm105_mask1_v1_H_pzlow1792_sig.fits', $
                            rfile:'xmm105_mask1_v1_H_pzlow1792_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=44.5', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 40.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'pzlow3099' :  mask = {which:'pzlow3099', dfile:'xmm105_mask1_v1_H_pzlow3099_eps.fits', wfile:'xmm105_mask1_v1_H_pzlow3099_sig.fits', $
                            rfile:'xmm105_mask1_v1_H_pzlow3099_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow3917' :  mask = {which:'pzlow3917', dfile:'xmm105_mask1_v1_H_pzlow3917_eps.fits', wfile:'xmm105_mask1_v1_H_pzlow3917_sig.fits', $
                            rfile:'xmm105_mask1_v1_H_pzlow3917_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=3.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed262' :  mask = {which:'pzmed262', dfile:'xmm105_mask1_v1_H_pzmed262_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed262_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed262_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
     
     'pzmed303' :  mask = {which:'pzmed303', dfile:'xmm105_mask1_v1_H_pzmed303_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed303_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed303_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=19.5', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
     
     'pzmed375' :  mask = {which:'pzmed375', dfile:'xmm105_mask1_v1_H_pzmed375_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed375_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed375_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=43.8', 'sig=2.6', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 50.0', 'SIG GT 0.0']}
     
     'pzmed386' :  mask = {which:'pzmed386', dfile:'xmm105_mask1_v1_H_pzmed386_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed386_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed386_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=28.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed414' :  mask = {which:'pzmed414', dfile:'xmm105_mask1_v1_H_pzmed414_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed414_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed414_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=54.4', 'sig=3.0', 'c=35.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 50.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'pzmed463' :  mask = {which:'pzmed463', dfile:'xmm105_mask1_v1_H_pzmed463_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed463_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed463_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=28.0', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed577' :  mask = {which:'pzmed577', dfile:'xmm105_mask1_v1_H_pzmed577_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed577_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed577_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=18.5', 'sig=3.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 324.0', 'SIG GT 0.0']}
     
     'pzmed578' :  mask = {which:'pzmed578', dfile:'xmm105_mask1_v1_H_pzmed578_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed578_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed578_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'pzmed706' :  mask = {which:'pzmed706', dfile:'xmm105_mask1_v1_H_pzmed706_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed706_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed706_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.5', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed761' :  mask = {which:'pzmed761', dfile:'xmm105_mask1_v1_H_pzmed761_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed761_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed761_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=29.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 22.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed764' :  mask = {which:'pzmed764', dfile:'xmm105_mask1_v1_H_pzmed764_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed764_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed764_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'pzmed766' :  mask = {which:'pzmed766', dfile:'xmm105_mask1_v1_H_pzmed766_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed766_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed766_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'pzmed817' :  mask = {which:'pzmed817', dfile:'xmm105_mask1_v1_H_pzmed817_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed817_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed817_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=27.8', 'sig=3.0', 'c=18.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'pzmed823' :  mask = {which:'pzmed823', dfile:'xmm105_mask1_v1_H_pzmed823_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed823_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed823_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=28.8', 'sig=3.0', 'c=17.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 32.0', 'SIG GT 0.0']}
 
     'pzmed847' :  mask = {which:'pzmed847', dfile:'xmm105_mask1_v1_H_pzmed847_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed847_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed847_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.85', 'sig=3.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'pzmed868' :  mask = {which:'pzmed868', dfile:'xmm105_mask1_v1_H_pzmed868_eps.fits', wfile:'xmm105_mask1_v1_H_pzmed868_sig.fits', $
                           rfile:'xmm105_mask1_v1_H_pzmed868_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'st4' :  mask = {which:'st4', dfile:'xmm105_mask1_v1_H_st4_eps.fits', wfile:'xmm105_mask1_v1_H_st4_sig.fits', $
                      rfile:'xmm105_mask1_v1_H_st4_eps.reg', $
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
pro xmm105_mask1_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/xmm105_mask1_v1/2014nov17/H/'
  outdir = indir
  IF which[0] EQ 'all' THEN which = ['clhi1', 'clhi2', 'clhi3', 'clhi4', 'clhi5', 'clhi6', 'clhi7', 'clhi8', $
                                     'clhi9', 'cllow0', 'cllow1', 'cllow4', 'eps.fits', 'fg43', 'pzhi12', 'pzhi20', $
                                     'pzlow1792', 'pzlow3099', 'pzlow3917', 'pzmed262', 'pzmed303', 'pzmed375', $
                                     'pzmed386', 'pzmed414', 'pzmed463', 'pzmed577', 'pzmed578', 'pzmed706', $
                                     'pzmed761', 'pzmed764', 'pzmed766', 'pzmed817', 'pzmed823', 'pzmed847', $
                                     'pzmed868', 'st4']
  

  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = xmm105_mask1_H_extract_settings(which[zz])              ;get settings
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
