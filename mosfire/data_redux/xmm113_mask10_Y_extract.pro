;========================================================================================================================
function xmm113_mask10_Y_extract_settings, pick
  
  CASE pick OF 

     'clhq0' :  mask = {which:'clhq0', dfile:'J0224_mask10_v1-3_Y_clhq0_eps.fits', wfile:'J0224_mask10_v1-3_Y_clhq0_sig.fits', $
                        rfile:'J0224_mask10_v1-3_Y_clhq0_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
      'fgllq2' :  mask = {which:'fgllq2', dfile:'J0224_mask10_v1-3_Y_fgllq2_eps.fits', wfile:'J0224_mask10_v1-3_Y_fgllq2_sig.fits', $
                         rfile:'J0224_mask10_v1-3_Y_fgllq2_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fglmq27' :  mask = {which:'fglmq27', dfile:'J0224_mask10_v1-3_Y_fglmq27_eps.fits', wfile:'J0224_mask10_v1-3_Y_fglmq27_sig.fits', $
                          rfile:'J0224_mask10_v1-3_Y_fglmq27_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fglmq35' :  mask = {which:'fglmq35', dfile:'J0224_mask10_v1-3_Y_fglmq35_eps.fits', wfile:'J0224_mask10_v1-3_Y_fglmq35_sig.fits', $
                          rfile:'J0224_mask10_v1-3_Y_fglmq35_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fgluq6' :  mask = {which:'fgluq6', dfile:'J0224_mask10_v1-3_Y_fgluq6_eps.fits', wfile:'J0224_mask10_v1-3_Y_fgluq6_sig.fits', $
                         rfile:'J0224_mask10_v1-3_Y_fgluq6_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhihqms11' :  mask = {which:'pzhihqms11', dfile:'J0224_mask10_v1-3_Y_pzhihqms11_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhihqms11_sig.fits', $
                             rfile:'J0224_mask10_v1-3_Y_pzhihqms11_eps.reg', $
                             fit:'gauss3', border:2, nosky:'hband_mosfire', $
                             xwhich:0, flip:0, $
                             guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                             priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhihqms14' :  mask = {which:'pzhihqms14', dfile:'J0224_mask10_v1-3_Y_pzhihqms14_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhihqms14_sig.fits', $
                             rfile:'J0224_mask10_v1-3_Y_pzhihqms14_eps.reg', $
                             fit:'gauss3', border:2, nosky:'hband_mosfire', $
                             xwhich:0, flip:0, $
                             guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                             priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhihqms17' :  mask = {which:'pzhihqms17', dfile:'J0224_mask10_v1-3_Y_pzhihqms17_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhihqms17_sig.fits', $
                             rfile:'J0224_mask10_v1-3_Y_pzhihqms17_eps.reg', $
                             fit:'gauss3', border:2, nosky:'hband_mosfire', $
                             xwhich:0, flip:0, $
                             guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                             priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhihqms1' :  mask = {which:'pzhihqms1', dfile:'J0224_mask10_v1-3_Y_pzhihqms1_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhihqms1_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhihqms1_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhihqms2' :  mask = {which:'pzhihqms2', dfile:'J0224_mask10_v1-3_Y_pzhihqms2_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhihqms2_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhihqms2_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhimqls0' :  mask = {which:'pzhimqls0', dfile:'J0224_mask10_v1-3_Y_pzhimqls0_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhimqls0_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhimqls0_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhimqms5' :  mask = {which:'pzhimqms5', dfile:'J0224_mask10_v1-3_Y_pzhimqms5_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhimqms5_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhimqms5_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhimqms8' :  mask = {which:'pzhimqms8', dfile:'J0224_mask10_v1-3_Y_pzhimqms8_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhimqms8_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhimqms8_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhiuqhs0' :  mask = {which:'pzhiuqhs0', dfile:'J0224_mask10_v1-3_Y_pzhiuqhs0_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhiuqhs0_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhiuqhs0_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhiuqhs4' :  mask = {which:'pzhiuqhs4', dfile:'J0224_mask10_v1-3_Y_pzhiuqhs4_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhiuqhs4_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhiuqhs4_eps.reg', $
                            fit:'full', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=39.8', 'sig=6.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'pzhiuqls0' :  mask = {which:'pzhiuqls0', dfile:'J0224_mask10_v1-3_Y_pzhiuqls0_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhiuqls0_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhiuqls0_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhiuqls8' :  mask = {which:'pzhiuqls8', dfile:'J0224_mask10_v1-3_Y_pzhiuqls8_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhiuqls8_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhiuqls8_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhiuqls9' :  mask = {which:'pzhiuqls9', dfile:'J0224_mask10_v1-3_Y_pzhiuqls9_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhiuqls9_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhiuqls9_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzhiuqms0' :  mask = {which:'pzhiuqms0', dfile:'J0224_mask10_v1-3_Y_pzhiuqms0_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzhiuqms0_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzhiuqms0_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzlowl158' :  mask = {which:'pzlowl158', dfile:'J0224_mask10_v1-3_Y_pzlowl158_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzlowl158_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzlowl158_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzlowl169' :  mask = {which:'pzlowl169', dfile:'J0224_mask10_v1-3_Y_pzlowl169_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzlowl169_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzlowl169_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzlowl1' :  mask = {which:'pzlowl1', dfile:'J0224_mask10_v1-3_Y_pzlowl1_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzlowl1_sig.fits', $
                          rfile:'J0224_mask10_v1-3_Y_pzlowl1_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmedhmq26' :  mask = {which:'pzmedhmq26', dfile:'J0224_mask10_v1-3_Y_pzmedhmq26_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzmedhmq26_sig.fits', $
                             rfile:'J0224_mask10_v1-3_Y_pzmedhmq26_eps.reg', $
                             fit:'gauss3', border:2, nosky:'hband_mosfire', $
                             xwhich:0, flip:0, $
                             guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                             priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmedlmq39' :  mask = {which:'pzmedlmq39', dfile:'J0224_mask10_v1-3_Y_pzmedlmq39_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzmedlmq39_sig.fits', $
                             rfile:'J0224_mask10_v1-3_Y_pzmedlmq39_eps.reg', $
                             fit:'gauss3', border:2, nosky:'hband_mosfire', $
                             xwhich:0, flip:0, $
                             guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                             priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmedlmq43' :  mask = {which:'pzmedlmq43', dfile:'J0224_mask10_v1-3_Y_pzmedlmq43_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzmedlmq43_sig.fits', $
                             rfile:'J0224_mask10_v1-3_Y_pzmedlmq43_eps.reg', $
                             fit:'gauss3', border:2, nosky:'hband_mosfire', $
                             xwhich:0, flip:0, $
                             guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                             priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmedlmq5' :  mask = {which:'pzmedlmq5', dfile:'J0224_mask10_v1-3_Y_pzmedlmq5_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzmedlmq5_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzmedlmq5_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmedlmq8' :  mask = {which:'pzmedlmq8', dfile:'J0224_mask10_v1-3_Y_pzmedlmq8_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzmedlmq8_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzmedlmq8_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmedluq0' :  mask = {which:'pzmedluq0', dfile:'J0224_mask10_v1-3_Y_pzmedluq0_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzmedluq0_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzmedluq0_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmedluq6' :  mask = {which:'pzmedluq6', dfile:'J0224_mask10_v1-3_Y_pzmedluq6_eps.fits', wfile:'J0224_mask10_v1-3_Y_pzmedluq6_sig.fits', $
                            rfile:'J0224_mask10_v1-3_Y_pzmedluq6_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest3516' :  mask = {which:'rest3516', dfile:'J0224_mask10_v1-3_Y_rest3516_eps.fits', wfile:'J0224_mask10_v1-3_Y_rest3516_sig.fits', $
                           rfile:'J0224_mask10_v1-3_Y_rest3516_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest4004' :  mask = {which:'rest4004', dfile:'J0224_mask10_v1-3_Y_rest4004_eps.fits', wfile:'J0224_mask10_v1-3_Y_rest4004_sig.fits', $
                           rfile:'J0224_mask10_v1-3_Y_rest4004_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'st6' :  mask = {which:'st6', dfile:'J0224_mask10_v1-3_Y_st6_eps.fits', wfile:'J0224_mask10_v1-3_Y_st6_sig.fits', $
                      rfile:'J0224_mask10_v1-3_Y_st6_eps.reg', $
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
pro xmm113_mask10_Y_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/J0224_mask10_v1-3/2015nov17/Y/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/J0224_mask10_v1-3/2015nov17/Y/'
  IF which[0] EQ 'all' THEN which = ['clhq0', 'fgllq2', 'fglmq27', 'fglmq35', 'fgluq6', 'pzhihqms11', 'pzhihqms14', $
                                     'pzhihqms17', 'pzhihqms1', 'pzhihqms2', 'pzhimqls0', 'pzhimqms5', 'pzhimqms8', $
                                     'pzhiuqhs0', 'pzhiuqhs4', 'pzhiuqls0', 'pzhiuqls8', 'pzhiuqls9', 'pzhiuqms0', $
                                     'pzlowl158', 'pzlowl169', 'pzlowl1', 'pzmedhmq26', 'pzmedlmq39', 'pzmedlmq43', $
                                     'pzmedlmq5', 'pzmedlmq8', 'pzmedluq0', 'pzmedluq6', 'rest3516', 'rest4004', 'st6']
  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = xmm113_mask10_Y_extract_settings(which[zz])             ;get settings
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
