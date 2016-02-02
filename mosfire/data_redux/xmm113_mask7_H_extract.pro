;========================================================================================================================
function xmm113_mask7_H_extract_settings, pick
  

  CASE pick OF 
     'bsbs4' :  mask = {which:'bsbs4', dfile:'XMM113_mask7_H_bsbs4_eps.fits', wfile:'XMM113_mask7_H_bsbs4_sig.fits', $
                        rfile:'XMM113_mask7_H_bsbs4_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=36.4', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'cl10' :  mask = {which:'cl10', dfile:'XMM113_mask7_H_cl10_eps.fits', wfile:'XMM113_mask7_H_cl10_sig.fits', $
                       rfile:'XMM113_mask7_H_cl10_eps.reg', $
                       fit:'full', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=37.5', 'sig=3.0', 'c=60.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 30.0', 'MU LT 45.0', 'SIG GT 0.0']}
  
     'fsbs0' :  mask = {which:'fsbs0', dfile:'XMM113_mask7_H_fsbs0_eps.fits', wfile:'XMM113_mask7_H_fsbs0_sig.fits', $
                        rfile:'XMM113_mask7_H_fsbs0_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'fsbs14' :  mask = {which:'fsbs14', dfile:'XMM113_mask7_H_fsbs14_eps.fits', wfile:'XMM113_mask7_H_fsbs14_sig.fits', $
                         rfile:'XMM113_mask7_H_fsbs14_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbs15' :  mask = {which:'fsbs15', dfile:'XMM113_mask7_H_fsbs15_eps.fits', wfile:'XMM113_mask7_H_fsbs15_sig.fits', $
                         rfile:'XMM113_mask7_H_fsbs15_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=37.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 34.0', 'MU LT 44.0', 'SIG GT 0.0']}
 
     'fsbs19' :  mask = {which:'fsbs19', dfile:'XMM113_mask7_H_fsbs19_eps.fits', wfile:'XMM113_mask7_H_fsbs19_sig.fits', $
                         rfile:'XMM113_mask7_H_fsbs19_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.4', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 15.0', 'MU LT 30.0', 'SIG GT 0.0']}
 
     'fore2' :  mask = {which:'fore2', dfile:'XMM113_mask7_H_fsbs19_eps.fits', wfile:'XMM113_mask7_H_fsbs19_sig.fits', $
                         rfile:'XMM113_mask7_H_fsbs19_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:['fsbs19', 'fore2'], flip:0, $
                         guess:['mu=60.0', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 50.0', 'MU LT 70.0', 'SIG GT 0.0']}
 
     'fsbs6' :  mask = {which:'fsbs6', dfile:'XMM113_mask7_H_fsbs6_eps.fits', wfile:'XMM113_mask7_H_fsbs6_sig.fits', $
                        rfile:'XMM113_mask7_H_fsbs6_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'gill1' :  mask = {which:'gill1', dfile:'XMM113_mask7_H_gill1_eps.fits', wfile:'XMM113_mask7_H_gill1_sig.fits', $
                        rfile:'XMM113_mask7_H_gill1_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs11' :  mask = {which:'msbs11', dfile:'XMM113_mask7_H_msbs11_eps.fits', wfile:'XMM113_mask7_H_msbs11_sig.fits', $
                         rfile:'XMM113_mask7_H_msbs11_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=32.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
     
     'new5' :  mask = {which:'new5', dfile:'XMM113_mask7_H_msbs11_eps.fits', wfile:'XMM113_mask7_H_msbs11_sig.fits', $
                         rfile:'XMM113_mask7_H_msbs11_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:['msbs11', 'new5'], flip:0, $
                         guess:['mu=82.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 70.0', 'MU LT 100.0', 'SIG GT 0.0']}
     
     'msbs14' :  mask = {which:'msbs14', dfile:'XMM113_mask7_H_msbs14_eps.fits', wfile:'XMM113_mask7_H_msbs14_sig.fits', $
                         rfile:'XMM113_mask7_H_msbs14_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=30.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
 
     'msbs321' :  mask = {which:'msbs321', dfile:'XMM113_mask7_H_msbs321_eps.fits', wfile:'XMM113_mask7_H_msbs321_sig.fits', $
                          rfile:'XMM113_mask7_H_msbs321_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs346' :  mask = {which:'msbs346', dfile:'XMM113_mask7_H_msbs346_eps.fits', wfile:'XMM113_mask7_H_msbs346_sig.fits', $
                          rfile:'XMM113_mask7_H_msbs346_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=40.1', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 34.0', 'MU LT 46.0', 'SIG GT 0.0']}
 
     'msbs357' :  mask = {which:'msbs357', dfile:'XMM113_mask7_H_msbs357_eps.fits', wfile:'XMM113_mask7_H_msbs357_sig.fits', $
                          rfile:'XMM113_mask7_H_msbs357_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=8.1', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 0.0', 'MU LT 20.0', 'SIG GT 0.0']}
     
     'msbs5' :  mask = {which:'msbs5', dfile:'XMM113_mask7_H_msbs5_eps.fits', wfile:'XMM113_mask7_H_msbs5_sig.fits', $
                        rfile:'XMM113_mask7_H_msbs5_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_faint', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=1.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzadd21' :  mask = {which:'pzadd21', dfile:'XMM113_mask7_H_pzadd21_eps.fits', wfile:'XMM113_mask7_H_pzadd21_sig.fits', $
                          rfile:'XMM113_mask7_H_pzadd21_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=37.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 30.0', 'MU LT 42.0', 'SIG GT 0.0']}
 
     'fore3' :  mask = {which:'fore3', dfile:'XMM113_mask7_H_pzadd21_eps.fits', wfile:'XMM113_mask7_H_pzadd21_sig.fits', $
                          rfile:'XMM113_mask7_H_fore3_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:['pzadd21', 'fore3'], flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzadd25' :  mask = {which:'pzadd25', dfile:'XMM113_mask7_H_pzadd25_eps.fits', wfile:'XMM113_mask7_H_pzadd25_sig.fits', $
                          rfile:'XMM113_mask7_H_pzadd25_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzadd26' :  mask = {which:'pzadd26', dfile:'XMM113_mask7_H_pzadd26_eps.fits', wfile:'XMM113_mask7_H_pzadd26_sig.fits', $
                          rfile:'XMM113_mask7_H_pzadd26_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=36.8', 'sig=2.5', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 35.0', 'MU LT 45.0', 'SIG GT 0.0']}
 
     'pzadd62' :  mask = {which:'pzadd62', dfile:'XMM113_mask7_H_pzadd62_eps.fits', wfile:'XMM113_mask7_H_pzadd62_sig.fits', $
                          rfile:'XMM113_mask7_H_pzadd62_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzadd70' :  mask = {which:'pzadd70', dfile:'XMM113_mask7_H_pzadd70_eps.fits', wfile:'XMM113_mask7_H_pzadd70_sig.fits', $
                          rfile:'XMM113_mask7_H_pzadd70_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=50.4', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'pzadd85' :  mask = {which:'pzadd85', dfile:'XMM113_mask7_H_pzadd85_eps.fits', wfile:'XMM113_mask7_H_pzadd85_sig.fits', $
                          rfile:'XMM113_mask7_H_pzadd85_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzbsbs17' :  mask = {which:'pzbsbs17', dfile:'XMM113_mask7_H_pzbsbs17_eps.fits', wfile:'XMM113_mask7_H_pzbsbs17_sig.fits', $
                           rfile:'XMM113_mask7_H_pzbsbs17_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=21.8', 'sig=3.0', 'c=42.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fore4' :  mask = {which:'fore4', dfile:'XMM113_mask7_H_pzbsbs17_eps.fits', wfile:'XMM113_mask7_H_pzbsbs17_sig.fits', $
                           rfile:'XMM113_mask7_H_fore4_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:['pzbsbs17', 'fore4'], flip:0, $
                           guess:['mu=29.8', 'sig=3.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 26.0', 'MU LT 38.0', 'SIG GT 0.0']}
 
     'pzfsbs25' :  mask = {which:'pzfsbs25', dfile:'XMM113_mask7_H_pzfsbs25_eps.fits', wfile:'XMM113_mask7_H_pzfsbs25_sig.fits', $
                           rfile:'XMM113_mask7_H_pzfsbs25_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=62.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 60.0', 'MU LT 74.0', 'SIG GT 0.0']}
 
     'pzfsbs37' :  mask = {which:'pzfsbs37', dfile:'XMM113_mask7_H_pzfsbs37_eps.fits', wfile:'XMM113_mask7_H_pzfsbs37_sig.fits', $
                           rfile:'XMM113_mask7_H_pzfsbs37_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzj3680' :  mask = {which:'pzj3680', dfile:'XMM113_mask7_H_pzj3680_eps.fits', wfile:'XMM113_mask7_H_pzj3680_sig.fits', $
                          rfile:'XMM113_mask7_H_pzj3680_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs23' :  mask = {which:'pzmsbs23', dfile:'XMM113_mask7_H_pzmsbs23_eps.fits', wfile:'XMM113_mask7_H_pzmsbs23_sig.fits', $
                           rfile:'XMM113_mask7_H_pzmsbs23_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=70.9', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 65.0', 'MU LT 75.0', 'SIG GT 0.0']}
 
     'pzmsbs32' :  mask = {which:'pzmsbs32', dfile:'XMM113_mask7_H_pzmsbs32_eps.fits', wfile:'XMM113_mask7_H_pzmsbs32_sig.fits', $
                           rfile:'XMM113_mask7_H_pzmsbs32_eps.reg', $
                           fit:'full', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.1', 'sig=3.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs79' :  mask = {which:'pzmsbs79', dfile:'XMM113_mask7_H_pzmsbs79_eps.fits', wfile:'XMM113_mask7_H_pzmsbs79_sig.fits', $
                           rfile:'XMM113_mask7_H_pzmsbs79_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmsbs86' :  mask = {which:'pzmsbs86', dfile:'XMM113_mask7_H_pzmsbs86_eps.fits', wfile:'XMM113_mask7_H_pzmsbs86_sig.fits', $
                           rfile:'XMM113_mask7_H_pzmsbs86_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'scist1' :  mask = {which:'scist1', dfile:'XMM113_mask7_H_scist1_eps.fits', wfile:'XMM113_mask7_H_scist1_sig.fits', $
                         rfile:'XMM113_mask7_H_scist1_eps.reg', $
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
pro xmm113_mask7_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/'
  IF which[0] EQ 'all' THEN which = ['bsbs4', 'cl10', 'eps.fits', 'fsbs0', 'fsbs14', 'fsbs15', 'fsbs19', $
                                     'fsbs6', 'gill1', 'msbs11', 'msbs14', 'msbs321', 'msbs346', 'msbs357', $
                                     'msbs5', 'pzadd21', 'pzadd25', 'pzadd26', 'pzadd62', 'pzadd70', 'pzadd85', $
                                     'pzbsbs17', 'pzfsbs25', 'pzfsbs37', 'pzj3680', 'pzmsbs23', 'pzmsbs32', 'pzmsbs79', $
                                     'pzmsbs86', 'scist1']
  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = xmm113_mask7_H_extract_settings(which[zz])              ;get settings
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
