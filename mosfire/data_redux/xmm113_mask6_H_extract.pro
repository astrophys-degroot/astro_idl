;========================================================================================================================
function xmm113_mask6_H_extract_settings, pick
  

  CASE pick OF 
     'cl11' :  mask = {which:'cl11', dfile:'XMM113_mask6_H_cl11_eps.fits', wfile:'XMM113_mask6_H_cl11_sig.fits', $
                       rfile:'XMM113_mask6_H_cl11_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=18.5', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 15.0', 'MU LT 25.0', 'SIG GT 0.0']}
     
     'cl1' :  mask = {which:'cl1', dfile:'XMM113_mask6_H_cl1_eps.fits', wfile:'XMM113_mask6_H_cl1_sig.fits', $
                      rfile:'XMM113_mask6_H_cl1_eps.reg', $
                      fit:'full', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=41.5', 'sig=2.7', 'c=115.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 35.0', 'MU LT 45.0', 'SIG GT 0.0']}
     
     'cl3' :  mask = {which:'cl3', dfile:'XMM113_mask6_H_cl3_eps.fits', wfile:'XMM113_mask6_H_cl3_sig.fits', $
                      rfile:'XMM113_mask6_H_cl3_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=64.1', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                      priors:['MU GT 60.0', 'MU LT 70.0', 'SIG GT 0.0']}
 
     'msbs17' :  mask = {which:'msbs17', dfile:'XMM113_mask6_H_msbs17_eps.fits', wfile:'XMM113_mask6_H_msbs17_sig.fits', $
                         rfile:'XMM113_mask6_H_msbs17_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbs310' :  mask = {which:'msbs310', dfile:'XMM113_mask6_H_msbs310_eps.fits', wfile:'XMM113_mask6_H_msbs310_sig.fits', $
                          rfile:'XMM113_mask6_H_msbs310_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs320' :  mask = {which:'msbs320', dfile:'XMM113_mask6_H_msbs320_eps.fits', wfile:'XMM113_mask6_H_msbs320_sig.fits', $
                          rfile:'XMM113_mask6_H_msbs320_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs335' :  mask = {which:'msbs335', dfile:'XMM113_mask6_H_msbs335_eps.fits', wfile:'XMM113_mask6_H_msbs335_sig.fits', $
                          rfile:'XMM113_mask6_H_msbs335_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=29.8', 'sig=4.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
 
     'nby0' :  mask = {which:'nby0', dfile:'XMM113_mask6_H_nby0_eps.fits', wfile:'XMM113_mask6_H_nby0_sig.fits', $
                       rfile:'XMM113_mask6_H_nby0_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_faint', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzadd14' :  mask = {which:'pzadd14', dfile:'XMM113_mask6_H_pzadd14_eps.fits', wfile:'XMM113_mask6_H_pzadd14_sig.fits', $
                          rfile:'XMM113_mask6_H_pzadd14_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzadd18' :  mask = {which:'pzadd18', dfile:'XMM113_mask6_H_pzadd18_eps.fits', wfile:'XMM113_mask6_H_pzadd18_sig.fits', $
                          rfile:'XMM113_mask6_H_pzadd18_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=51.1', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0']}
 
     'pzadd23' :  mask = {which:'pzadd23', dfile:'XMM113_mask6_H_pzadd23_eps.fits', wfile:'XMM113_mask6_H_pzadd23_sig.fits', $
                          rfile:'XMM113_mask6_H_pzadd23_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=107.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 100.0', 'MU LT 110.0', 'SIG GT 0.0']}
 
     'pzadd34' :  mask = {which:'pzadd34', dfile:'XMM113_mask6_H_pzadd34_eps.fits', wfile:'XMM113_mask6_H_pzadd34_sig.fits', $
                          rfile:'XMM113_mask6_H_pzadd34_eps.reg', $
                          fit:'full', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=83.0', 'sig=3.0', 'c=55.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 78.0', 'MU LT 88.0', 'SIG GT 0.0']}
 
     'pzadd72' :  mask = {which:'pzadd72', dfile:'XMM113_mask6_H_pzadd72_eps.fits', wfile:'XMM113_mask6_H_pzadd72_sig.fits', $
                          rfile:'XMM113_mask6_H_pzadd72_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=50.2', 'sig=3.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0']}
 
     'pzadd77' :  mask = {which:'pzadd77', dfile:'XMM113_mask6_H_pzadd77_eps.fits', wfile:'XMM113_mask6_H_pzadd77_sig.fits', $
                          rfile:'XMM113_mask6_H_pzadd77_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'new3' :  mask = {which:'new3', dfile:'XMM113_mask6_H_pzadd77_eps.fits', wfile:'XMM113_mask6_H_pzadd77_sig.fits', $
                       rfile:'XMM113_mask6_H_pzadd77_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:['pzadd77', 'new3'], flip:0, $
                       guess:['mu=46.9', 'sig=3.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 40.0', 'MU LT 52.0', 'SIG GT 0.0']}
 
     'pzadd7' :  mask = {which:'pzadd7', dfile:'XMM113_mask6_H_pzadd7_eps.fits', wfile:'XMM113_mask6_H_pzadd7_sig.fits', $
                         rfile:'XMM113_mask6_H_pzadd7_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzadd86' :  mask = {which:'pzadd86', dfile:'XMM113_mask6_H_pzadd86_eps.fits', wfile:'XMM113_mask6_H_pzadd86_sig.fits', $
                          rfile:'XMM113_mask6_H_pzadd86_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzadd8' :  mask = {which:'pzadd8', dfile:'XMM113_mask6_H_pzadd8_eps.fits', wfile:'XMM113_mask6_H_pzadd8_sig.fits', $
                         rfile:'XMM113_mask6_H_pzadd8_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzadd90' :  mask = {which:'pzadd90', dfile:'XMM113_mask6_H_pzadd90_eps.fits', wfile:'XMM113_mask6_H_pzadd90_sig.fits', $
                          rfile:'XMM113_mask6_H_pzadd90_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=26.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
 
     'pzbsbs1' :  mask = {which:'pzbsbs1', dfile:'XMM113_mask6_H_pzbsbs1_eps.fits', wfile:'XMM113_mask6_H_pzbsbs1_sig.fits', $
                          rfile:'XMM113_mask6_H_pzbsbs1_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzbsbs3' :  mask = {which:'pzbsbs3', dfile:'XMM113_mask6_H_pzbsbs3_eps.fits', wfile:'XMM113_mask6_H_pzbsbs3_sig.fits', $
                          rfile:'XMM113_mask6_H_pzbsbs3_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=45.8', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 40.0', 'MU LT 52.0', 'SIG GT 0.0']}
 
     'pzfsbs26' :  mask = {which:'pzfsbs26', dfile:'XMM113_mask6_H_pzfsbs26_eps.fits', wfile:'XMM113_mask6_H_pzfsbs26_sig.fits', $
                           rfile:'XMM113_mask6_H_pzfsbs26_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs5' :  mask = {which:'pzfsbs5', dfile:'XMM113_mask6_H_pzfsbs5_eps.fits', wfile:'XMM113_mask6_H_pzfsbs5_sig.fits', $
                          rfile:'XMM113_mask6_H_pzfsbs5_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=50.1', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 42.0', 'MU LT 54.0', 'SIG GT 0.0']}
 
     'pzj4745' :  mask = {which:'pzj4745', dfile:'XMM113_mask6_H_pzj4745_eps.fits', wfile:'XMM113_mask6_H_pzj4745_sig.fits', $
                          rfile:'XMM113_mask6_H_pzj4745_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmsbs101' :  mask = {which:'pzmsbs101', dfile:'XMM113_mask6_H_pzmsbs101_eps.fits', wfile:'XMM113_mask6_H_pzmsbs101_sig.fits', $
                            rfile:'XMM113_mask6_H_pzmsbs101_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=12.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 5.0', 'MU LT 15.0', 'SIG GT 0.0']}
     
     'pzmsbs88' :  mask = {which:'pzmsbs88', dfile:'XMM113_mask6_H_pzmsbs88_eps.fits', wfile:'XMM113_mask6_H_pzmsbs88_sig.fits', $
                           rfile:'XMM113_mask6_H_pzmsbs88_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs8' :  mask = {which:'pzmsbs8', dfile:'XMM113_mask6_H_pzmsbs8_eps.fits', wfile:'XMM113_mask6_H_pzmsbs8_sig.fits', $
                          rfile:'XMM113_mask6_H_pzmsbs8_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmsbs97' :  mask = {which:'pzmsbs97', dfile:'XMM113_mask6_H_pzmsbs97_eps.fits', wfile:'XMM113_mask6_H_pzmsbs97_sig.fits', $
                           rfile:'XMM113_mask6_H_pzmsbs97_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=47.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 52.0', 'SIG GT 0.0']}

     'st30' :  mask = {which:'st30', dfile:'XMM113_mask6_H_st30_eps.fits', wfile:'XMM113_mask6_H_st30_sig.fits', $
                       rfile:'XMM113_mask6_H_st30_eps.reg', $
                       fit:'full', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 


     ELSE : BEGIN
        print, 'WARNING!! Choice not found'
        print, '  ****' + pick + '****'
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
pro xmm113_mask6_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/'
  IF which[0] EQ 'all' THEN which = ['cl11', 'cl1', 'cl3', 'eps.fits', 'msbs17', 'msbs310', 'msbs320', 'msbs335', $
                                     'nby0', 'pzadd14', 'pzadd18', 'pzadd23', 'pzadd34', 'pzadd72', 'pzadd77', $
                                     'pzadd7', 'pzadd86', 'pzadd8', 'pzadd90', 'pzbsbs1', 'pzbsbs3', 'pzfsbs26', $
                                     'pzfsbs5', 'pzj4745', 'pzmsbs101', 'pzmsbs88', 'pzmsbs8', 'pzmsbs97', 'st30']
  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = xmm113_mask6_H_extract_settings(which[zz])              ;get settings
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
