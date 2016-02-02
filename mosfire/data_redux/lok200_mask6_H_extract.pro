;========================================================================================================================
function lok200_mask6_H_extract_settings, pick
  
  CASE pick OF 

 
     'fsbsb100' :  mask = {which:'fsbsb100', dfile:'lok200_mask6_H_fsbsb100_eps.fits', wfile:'lok200_mask6_H_fsbsb100_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsb100_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=11.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsb116' :  mask = {which:'fsbsb116', dfile:'lok200_mask6_H_fsbsb116_eps.fits', wfile:'lok200_mask6_H_fsbsb116_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsb116_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsb131' :  mask = {which:'fsbsb131', dfile:'lok200_mask6_H_fsbsb131_eps.fits', wfile:'lok200_mask6_H_fsbsb131_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsb131_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=37.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 32.0', 'MU LT 44.0', 'SIG GT 0.0']}
     
     'fsbsb135' :  mask = {which:'fsbsb135', dfile:'lok200_mask6_H_fsbsb135_eps.fits', wfile:'lok200_mask6_H_fsbsb135_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsb135_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=16.8', 'sig=2.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'fsbsr140' :  mask = {which:'fsbsr140', dfile:'lok200_mask6_H_fsbsr140_eps.fits', wfile:'lok200_mask6_H_fsbsr140_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsr140_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr172' :  mask = {which:'fsbsr172', dfile:'lok200_mask6_H_fsbsr172_eps.fits', wfile:'lok200_mask6_H_fsbsr172_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsr172_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=38.8', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 32.0', 'MU LT 46.0', 'SIG GT 0.0']}
 
     'fsbsr173' :  mask = {which:'fsbsr173', dfile:'lok200_mask6_H_fsbsr173_eps.fits', wfile:'lok200_mask6_H_fsbsr173_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsr173_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=2.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr176' :  mask = {which:'fsbsr176', dfile:'lok200_mask6_H_fsbsr176_eps.fits', wfile:'lok200_mask6_H_fsbsr176_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsr176_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=48.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 38.0', 'MU LT 56.0', 'SIG GT 0.0']}
 
     'fsbsr185' :  mask = {which:'fsbsr185', dfile:'lok200_mask6_H_fsbsr185_eps.fits', wfile:'lok200_mask6_H_fsbsr185_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsr185_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=50.5', 'sig=3.0', 'c=5.0', 'x0=0.1', 'x1=-0.01'], $
                           priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 0.0']}

     'fsbsr204' :  mask = {which:'fsbsr204', dfile:'lok200_mask6_H_fsbsr204_eps.fits', wfile:'lok200_mask6_H_fsbsr204_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsr204_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=3.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'fsbsr213' :  mask = {which:'fsbsr213', dfile:'lok200_mask6_H_fsbsr213_eps.fits', wfile:'lok200_mask6_H_fsbsr213_sig.fits', $
                           rfile:'lok200_mask6_H_fsbsr213_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=11.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb155' :  mask = {which:'msbsb155', dfile:'lok200_mask6_H_msbsb155_eps.fits', wfile:'lok200_mask6_H_msbsb155_sig.fits', $
                           rfile:'lok200_mask6_H_msbsb155_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=32.1', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'msbsb169' :  mask = {which:'msbsb169', dfile:'lok200_mask6_H_msbsb169_eps.fits', wfile:'lok200_mask6_H_msbsb169_sig.fits', $
                           rfile:'lok200_mask6_H_msbsb169_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=28.8', 'sig=2.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsb187' :  mask = {which:'msbsb187', dfile:'lok200_mask6_H_msbsb187_eps.fits', wfile:'lok200_mask6_H_msbsb187_sig.fits', $
                           rfile:'lok200_mask6_H_msbsb187_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=2.7', 'c=10.0', 'x0=-0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr204' :  mask = {which:'msbsr204', dfile:'lok200_mask6_H_msbsr204_eps.fits', wfile:'lok200_mask6_H_msbsr204_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr204_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr211' :  mask = {which:'msbsr211', dfile:'lok200_mask6_H_msbsr211_eps.fits', wfile:'lok200_mask6_H_msbsr211_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr211_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 4.0', 'MU LT 16.0', 'SIG GT 0.0']}
 
     'msbsr215' :  mask = {which:'msbsr215', dfile:'lok200_mask6_H_msbsr215_eps.fits', wfile:'lok200_mask6_H_msbsr215_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr215_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.1', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 4.0', 'MU LT 16.0', 'SIG GT 0.0']}
 
     'msbsr226' :  mask = {which:'msbsr226', dfile:'lok200_mask6_H_msbsr226_eps.fits', wfile:'lok200_mask6_H_msbsr226_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr226_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr232' :  mask = {which:'msbsr232', dfile:'lok200_mask6_H_msbsr232_eps.fits', wfile:'lok200_mask6_H_msbsr232_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr232_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'msbsr235' :  mask = {which:'msbsr235', dfile:'lok200_mask6_H_msbsr235_eps.fits', wfile:'lok200_mask6_H_msbsr235_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr235_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr236' :  mask = {which:'msbsr236', dfile:'lok200_mask6_H_msbsr236_eps.fits', wfile:'lok200_mask6_H_msbsr236_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr236_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr238' :  mask = {which:'msbsr238', dfile:'lok200_mask6_H_msbsr238_eps.fits', wfile:'lok200_mask6_H_msbsr238_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr238_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=11.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 6.0', 'MU LT 18.0', 'SIG GT 0.0']}
 
     'msbsr254' :  mask = {which:'msbsr254', dfile:'lok200_mask6_H_msbsr254_eps.fits', wfile:'lok200_mask6_H_msbsr254_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr254_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=54.3', 'sig=4.0', 'c=10.0', 'x0=-0.3', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 65.0', 'SIG GT 0.0']}
 
     'msbsr261' :  mask = {which:'msbsr261', dfile:'lok200_mask6_H_msbsr261_eps.fits', wfile:'lok200_mask6_H_msbsr261_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr261_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbsr266' :  mask = {which:'msbsr266', dfile:'lok200_mask6_H_msbsr266_eps.fits', wfile:'lok200_mask6_H_msbsr266_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr266_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=51.8', 'sig=2.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 44.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'msbsr281' :  mask = {which:'msbsr281', dfile:'lok200_mask6_H_msbsr281_eps.fits', wfile:'lok200_mask6_H_msbsr281_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr281_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=46.8', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 42.0', 'MU LT 56.0', 'SIG GT 0.0']}
 
     'msbsr288' :  mask = {which:'msbsr288', dfile:'lok200_mask6_H_msbsr288_eps.fits', wfile:'lok200_mask6_H_msbsr288_sig.fits', $
                           rfile:'lok200_mask6_H_msbsr288_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest471' :  mask = {which:'rest471', dfile:'lok200_mask6_H_rest471_eps.fits', wfile:'lok200_mask6_H_rest471_sig.fits', $
                          rfile:'lok200_mask6_H_rest471_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest503' :  mask = {which:'rest503', dfile:'lok200_mask6_H_rest503_eps.fits', wfile:'lok200_mask6_H_rest503_sig.fits', $
                          rfile:'lok200_mask6_H_rest503_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest528' :  mask = {which:'rest528', dfile:'lok200_mask6_H_rest528_eps.fits', wfile:'lok200_mask6_H_rest528_sig.fits', $
                          rfile:'lok200_mask6_H_rest528_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=18.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest536' :  mask = {which:'rest536', dfile:'lok200_mask6_H_rest536_eps.fits', wfile:'lok200_mask6_H_rest536_sig.fits', $
                          rfile:'lok200_mask6_H_rest536_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'rest574' :  mask = {which:'rest574', dfile:'lok200_mask6_H_rest574_eps.fits', wfile:'lok200_mask6_H_rest574_sig.fits', $
                          rfile:'lok200_mask6_H_rest574_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'rest580' :  mask = {which:'rest580', dfile:'lok200_mask6_H_rest580_eps.fits', wfile:'lok200_mask6_H_rest580_sig.fits', $
                          rfile:'lok200_mask6_H_rest580_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'sbsbc196' :  mask = {which:'sbsbc196', dfile:'lok200_mask6_H_sbsbc196_eps.fits', wfile:'lok200_mask6_H_sbsbc196_sig.fits', $
                           rfile:'lok200_mask6_H_sbsbc196_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=42.1', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 34.0', 'MU LT 46.0', 'SIG GT 0.0']}
     
     'st6' :  mask = {which:'st6', dfile:'lok200_mask6_H_st6_eps.fits', wfile:'lok200_mask6_H_st6_sig.fits', $
                      rfile:'lok200_mask6_H_st6_eps.reg', $
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
pro lok200_mask6_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask6/2014jun13/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask6/2014jun13/H/'
  IF which[0] EQ 'all' THEN which = []
  

 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok200_mask6_H_extract_settings(which[zz])              ;get settings
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
