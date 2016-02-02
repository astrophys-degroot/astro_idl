;========================================================================================================================
function J1049_mask5_H_extract_settings, pick
  
  CASE pick OF 

     'brsr10' :  mask = {which:'brsr10', dfile:'J1049_20150426_v4_H_brsr10_eps.fits', wfile:'J1049_20150426_v4_H_brsr10_sig.fits', $
                         rfile:'J1049_20150426_v4_H_brsr10_eps.reg', $
                         fit:'full', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.3', 'sig=2.2', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 18.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'brsr8' :  mask = {which:'brsr8', dfile:'J1049_20150426_v4_H_brsr8_eps.fits', wfile:'J1049_20150426_v4_H_brsr8_sig.fits', $
                        rfile:'J1049_20150426_v4_H_brsr8_eps.reg', $
                        fit:'full', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=2.2', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 20.0', 'MU LT 26.0', 'SIG GT 0.0']}
     
     'cllzhq16' :  mask = {which:'cllzhq16', dfile:'J1049_20150426_v4_H_cllzhq16_eps.fits', wfile:'J1049_20150426_v4_H_cllzhq16_sig.fits', $
                           rfile:'J1049_20150426_v4_H_cllzhq16_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.2', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 18.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'cllzhq5' :  mask = {which:'cllzhq5', dfile:'J1049_20150426_v4_H_cllzhq5_eps.fits', wfile:'J1049_20150426_v4_H_cllzhq5_sig.fits', $
                          rfile:'J1049_20150426_v4_H_cllzhq5_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=59.0', 'sig=2.0', 'c=54.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 55.0', 'MU LT 65.0', 'SIG GT 0.0']}
 
     'cllzhq9' :  mask = {which:'cllzhq9', dfile:'J1049_20150426_v4_H_cllzhq9_eps.fits', wfile:'J1049_20150426_v4_H_cllzhq9_sig.fits', $
                          rfile:'J1049_20150426_v4_H_cllzhq9_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cllzlq0' :  mask = {which:'cllzlq0', dfile:'J1049_20150426_v4_H_cllzlq0_eps.fits', wfile:'J1049_20150426_v4_H_cllzlq0_sig.fits', $
                          rfile:'J1049_20150426_v4_H_cllzlq0_eps.reg', $
                          fit:'full', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=62.8', 'sig=3.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 58.0', 'MU LT 68.0', 'SIG GT 0.0']}
     
     'cllzlq4' :  mask = {which:'cllzlq4', dfile:'J1049_20150426_v4_H_cllzlq4_eps.fits', wfile:'J1049_20150426_v4_H_cllzlq4_sig.fits', $
                          rfile:'J1049_20150426_v4_H_cllzlq4_eps.reg', $
                          fit:'full', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=24.8', 'sig=1.8', 'c=32.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 20.0', 'MU LT 28.0', 'SIG GT 0.0']}
     
     'cllzmq0' :  mask = {which:'cllzmq0', dfile:'J1049_20150426_v4_H_cllzmq0_eps.fits', wfile:'J1049_20150426_v4_H_cllzmq0_sig.fits', $
                          rfile:'J1049_20150426_v4_H_cllzmq0_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cllzmq2' :  mask = {which:'cllzmq2', dfile:'J1049_20150426_v4_H_cllzmq2_eps.fits', wfile:'J1049_20150426_v4_H_cllzmq2_sig.fits', $
                          rfile:'J1049_20150426_v4_H_cllzmq2_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cllzmq7' :  mask = {which:'cllzmq7', dfile:'J1049_20150426_v4_H_cllzmq7_eps.fits', wfile:'J1049_20150426_v4_H_cllzmq7_sig.fits', $
                          rfile:'J1049_20150426_v4_H_cllzmq7_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cllzmq8' :  mask = {which:'cllzmq8', dfile:'J1049_20150426_v4_H_cllzmq8_eps.fits', wfile:'J1049_20150426_v4_H_cllzmq8_sig.fits', $
                          rfile:'J1049_20150426_v4_H_cllzmq8_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cllzmq9' :  mask = {which:'cllzmq9', dfile:'J1049_20150426_v4_H_cllzmq9_eps.fits', wfile:'J1049_20150426_v4_H_cllzmq9_sig.fits', $
                          rfile:'J1049_20150426_v4_H_cllzmq9_eps.reg', $
                          fit:'full', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'hpzhq239' :  mask = {which:'hpzhq239', dfile:'J1049_20150426_v4_H_hpzhq239_eps.fits', wfile:'J1049_20150426_v4_H_hpzhq239_sig.fits', $
                           rfile:'J1049_20150426_v4_H_hpzhq239_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=36.8', 'sig=2.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 32.0', 'MU LT 44.0', 'SIG GT 0.0']}
 
     'hpzhqK208' :  mask = {which:'hpzhqK208', dfile:'J1049_20150426_v4_H_hpzhqK208_eps.fits', wfile:'J1049_20150426_v4_H_hpzhqK208_sig.fits', $
                            rfile:'J1049_20150426_v4_H_hpzhqK208_eps.reg', $
                            fit:'full', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'hpzhqK221' :  mask = {which:'hpzhqK221', dfile:'J1049_20150426_v4_H_hpzhqK221_eps.fits', wfile:'J1049_20150426_v4_H_hpzhqK221_sig.fits', $
                            rfile:'J1049_20150426_v4_H_hpzhqK221_eps.reg', $
                            fit:'full', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
'hpzhqK222' :  mask = {which:'hpzhqK222', dfile:'J1049_20150426_v4_H_hpzhqK222_eps.fits', wfile:'J1049_20150426_v4_H_hpzhqK222_sig.fits', $
                            rfile:'J1049_20150426_v4_H_hpzhqK222_eps.reg', $
                            fit:'full', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=35.5', 'sig=2.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'hpzhqK225' :  mask = {which:'hpzhqK225', dfile:'J1049_20150426_v4_H_hpzhqK225_eps.fits', wfile:'J1049_20150426_v4_H_hpzhqK225_sig.fits', $
                            rfile:'J1049_20150426_v4_H_hpzhqK225_eps.reg', $
                            fit:'full', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'hpzhqK35' :  mask = {which:'hpzhqK35', dfile:'J1049_20150426_v4_H_hpzhqK35_eps.fits', wfile:'J1049_20150426_v4_H_hpzhqK35_sig.fits', $
                           rfile:'J1049_20150426_v4_H_hpzhqK35_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'hpzhqK50' :  mask = {which:'hpzhqK50', dfile:'J1049_20150426_v4_H_hpzhqK50_eps.fits', wfile:'J1049_20150426_v4_H_hpzhqK50_sig.fits', $
                           rfile:'J1049_20150426_v4_H_hpzhqK50_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'hpzhqK51' :  mask = {which:'hpzhqK51', dfile:'J1049_20150426_v4_H_hpzhqK51_eps.fits', wfile:'J1049_20150426_v4_H_hpzhqK51_sig.fits', $
                           rfile:'J1049_20150426_v4_H_hpzhqK51_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'hpzmq371' :  mask = {which:'hpzmq371', dfile:'J1049_20150426_v4_H_hpzmq371_eps.fits', wfile:'J1049_20150426_v4_H_hpzmq371_sig.fits', $
                           rfile:'J1049_20150426_v4_H_hpzmq371_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=2.4', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'hpzmqK244' :  mask = {which:'hpzmqK244', dfile:'J1049_20150426_v4_H_hpzmqK244_eps.fits', wfile:'J1049_20150426_v4_H_hpzmqK244_sig.fits', $
                            rfile:'J1049_20150426_v4_H_hpzmqK244_eps.reg', $
                            fit:'full', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'hpzmqK270' :  mask = {which:'hpzmqK270', dfile:'J1049_20150426_v4_H_hpzmqK270_eps.fits', wfile:'J1049_20150426_v4_H_hpzmqK270_sig.fits', $
                            rfile:'J1049_20150426_v4_H_hpzmqK270_eps.reg', $
                            fit:'full', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'hpzmqK38' :  mask = {which:'hpzmqK38', dfile:'J1049_20150426_v4_H_hpzmqK38_eps.fits', wfile:'J1049_20150426_v4_H_hpzmqK38_sig.fits', $
                           rfile:'J1049_20150426_v4_H_hpzmqK38_eps.reg', $
                           fit:'full', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'nr1763' :  mask = {which:'nr1763', dfile:'J1049_20150426_v4_H_nr1763_eps.fits', wfile:'J1049_20150426_v4_H_nr1763_sig.fits', $
                         rfile:'J1049_20150426_v4_H_nr1763_eps.reg', $
                         fit:'full', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'nr2370' :  mask = {which:'nr2370', dfile:'J1049_20150426_v4_H_nr2370_eps.fits', wfile:'J1049_20150426_v4_H_nr2370_sig.fits', $
                         rfile:'J1049_20150426_v4_H_nr2370_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'nr2640' :  mask = {which:'nr2640', dfile:'J1049_20150426_v4_H_nr2640_eps.fits', wfile:'J1049_20150426_v4_H_nr2640_sig.fits', $
                         rfile:'J1049_20150426_v4_H_nr2640_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'nr3331' :  mask = {which:'nr3331', dfile:'J1049_20150426_v4_H_nr3331_eps.fits', wfile:'J1049_20150426_v4_H_nr3331_sig.fits', $
                         rfile:'J1049_20150426_v4_H_nr3331_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=21.0', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'sn' :  mask = {which:'sn', dfile:'J1049_20150426_v4_H_sn_eps.fits', wfile:'J1049_20150426_v4_H_sn_sig.fits', $
                     rfile:'J1049_20150426_v4_H_sn_eps.reg', $
                     fit:'full', border:2, nosky:'hband_faint', $
                     xwhich:0, flip:0, $
                     guess:['mu=57.5', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                     priors:['MU GT 50.0', 'MU LT 65.0', 'SIG GT 0.0']}
 
     'st15HST' :  mask = {which:'st15HST', dfile:'J1049_20150426_v4_H_st15HST_eps.fits', wfile:'J1049_20150426_v4_H_st15HST_sig.fits', $
                          rfile:'J1049_20150426_v4_H_st15HST_eps.reg', $
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
pro J1049_mask5_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/'
  outdir = '/'
  IF which[0] EQ 'all' THEN which = ['brsr10', 'brsr8', 'cllzhq16', 'cllzhq5', 'cllzhq9', 'cllzlq0', 'cllzlq4', $
                                     'cllzmq0', 'cllzmq2', 'cllzmq7', 'cllzmq8', 'cllzmq9', 'eps.fits', 'hpzhq239', $
                                     'hpzhqK208', 'hpzhqK221', 'hpzhqK222', 'hpzhqK225', 'hpzhqK35', 'hpzhqK50', $
                                     'hpzhqK51', 'hpzmq371', 'hpzmqK244', 'hpzmqK270', 'hpzmqK38', 'nr1763', $
                                     'nr2370', 'nr2640', 'nr3331', 'sn', 'st15HST']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = J1049_mask5_H_extract_settings(which[zz])              ;get settings
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
