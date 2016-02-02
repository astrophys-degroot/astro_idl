;========================================================================================================================
function cdfs44_mask2_H_extract_settings, pick
  
  CASE pick OF 
     'bcsbs103' :  mask = {which:'bcsbs103', dfile:'CDFS44_mask2_1.0_H_bcsbs103_eps.fits', wfile:'CDFS44_mask2_1.0_H_bcsbs103_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_bcsbs103_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=42.4', 'sig=4.0', 'c=15.0', 'x0=10.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'bcsbs117' :  mask = {which:'bcsbs117', dfile:'CDFS44_mask2_1.0_H_bcsbs117_eps.fits', wfile:'CDFS44_mask2_1.0_H_bcsbs117_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_bcsbs117_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=40.9', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 35.0', 'MU LT 45.0', 'SIG GT 0.0']}
 
     'bcsbs154' :  mask = {which:'bcsbs154', dfile:'CDFS44_mask2_1.0_H_bcsbs154_eps.fits', wfile:'CDFS44_mask2_1.0_H_bcsbs154_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_bcsbs154_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=20.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'bcsbs162' :  mask = {which:'bcsbs162', dfile:'CDFS44_mask2_1.0_H_bcsbs162_eps.fits', wfile:'CDFS44_mask2_1.0_H_bcsbs162_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_bcsbs162_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=7.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
 
     'bsbs76' :  mask = {which:'bsbs76', dfile:'CDFS44_mask2_1.0_H_bsbs76_eps.fits', wfile:'CDFS44_mask2_1.0_H_bsbs76_sig.fits', $
                         rfile:'CDFS44_mask2_1.0_H_bsbs76_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=38.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 3.0']}
     
     'cl10' :  mask = {which:'cl10', dfile:'CDFS44_mask2_1.0_H_cl10_eps.fits', wfile:'CDFS44_mask2_1.0_H_cl10_sig.fits', $
                       rfile:'CDFS44_mask2_1.0_H_cl10_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_medium', $
                       xwhich:0, flip:0, $
                       guess:['mu=54.5', 'sig=3.0', 'c=11.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 2.0']}
 
     'cl2' :  mask = {which:'cl2', dfile:'CDFS44_mask2_1.0_H_cl2_eps.fits', wfile:'CDFS44_mask2_1.0_H_cl2_sig.fits', $
                      rfile:'CDFS44_mask2_1.0_H_cl2_eps.reg', $
                      fit:'gauss3', border:2, nosky:'hband_mosfire', $
                      xwhich:0, flip:0, $
                      guess:['mu=9.4', 'sig=4.0', 'c=25.0', 'x0=-0.4', 'x1=0.01'], $
                      priors:['MU GT 8.0', 'MU LT 16.0', 'SIG GT 0.0']}
  
     'msbs10' :  mask = {which:'msbs10', dfile:'CDFS44_mask2_1.0_H_msbs10_eps.fits', wfile:'CDFS44_mask2_1.0_H_msbs10_sig.fits', $
                         rfile:'CDFS44_mask2_1.0_H_msbs10_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs198' :  mask = {which:'msbs198', dfile:'CDFS44_mask2_1.0_H_msbs198_eps.fits', wfile:'CDFS44_mask2_1.0_H_msbs198_sig.fits', $
                          rfile:'CDFS44_mask2_1.0_H_msbs198_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.0', 'c=4.0', 'x0=0.1', 'x1=-0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs5' :  mask = {which:'msbs5', dfile:'CDFS44_mask2_1.0_H_msbs5_eps.fits', wfile:'CDFS44_mask2_1.0_H_msbs5_sig.fits', $
                        rfile:'CDFS44_mask2_1.0_H_msbs5_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=47.9', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0']}
 
     'msbs7' :  mask = {which:'msbs7', dfile:'CDFS44_mask2_1.0_H_msbs7_eps.fits', wfile:'CDFS44_mask2_1.0_H_msbs7_sig.fits', $
                        rfile:'CDFS44_mask2_1.0_H_msbs7_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_faint', $
                        xwhich:0, flip:0, $
                        guess:['mu=70.5', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 65.0', 'MU LT 75.0', 'SIG GT 0.0']}
 
'pzbsbs22' :  mask = {which:'pzbsbs22', dfile:'CDFS44_mask2_1.0_H_pzbsbs22_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzbsbs22_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzbsbs22_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzbsbs40' :  mask = {which:'pzbsbs40', dfile:'CDFS44_mask2_1.0_H_pzbsbs40_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzbsbs40_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzbsbs40_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzbsbs42' :  mask = {which:'pzbsbs42', dfile:'CDFS44_mask2_1.0_H_pzbsbs42_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzbsbs42_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzbsbs42_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=46.2', 'sig=3.0', 'c=22.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 35.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'pzfsbs130' :  mask = {which:'pzfsbs130', dfile:'CDFS44_mask2_1.0_H_pzfsbs130_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzfsbs130_sig.fits', $
                            rfile:'CDFS44_mask2_1.0_H_pzfsbs130_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=29.1', 'sig=4.0', 'c=8.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 28.0', 'MU LT 42.0', 'SIG GT 0.0']}
 
     'pzfsbs155' :  mask = {which:'pzfsbs155', dfile:'CDFS44_mask2_1.0_H_pzfsbs155_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzfsbs155_sig.fits', $
                            rfile:'CDFS44_mask2_1.0_H_pzfsbs155_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=24.3', 'sig=4.0', 'c=8.0', 'x0=-0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs166' :  mask = {which:'pzfsbs166', dfile:'CDFS44_mask2_1.0_H_pzfsbs166_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzfsbs166_sig.fits', $
                            rfile:'CDFS44_mask2_1.0_H_pzfsbs166_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_medium', $
                            xwhich:0, flip:0, $
                            guess:['mu=25.8', 'sig=4.0', 'c=11.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 24.0', 'MU LT 38.0', 'SIG GT 0.0']}
 
     'pzfsbs175' :  mask = {which:'pzfsbs175', dfile:'CDFS44_mask2_1.0_H_pzfsbs175_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzfsbs175_sig.fits', $
                            rfile:'CDFS44_mask2_1.0_H_pzfsbs175_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=27.8', 'sig=4.0', 'c=18.0', 'x0=0.1', 'x1=-0.01'], $
                            priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
 
     'pzfsbs76' :  mask = {which:'pzfsbs76', dfile:'CDFS44_mask2_1.0_H_pzfsbs76_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzfsbs76_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzfsbs76_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=34.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 30.0', 'MU LT 44.0', 'SIG GT 0.0']}
     
     'pzmsbs100' :  mask = {which:'pzmsbs100', dfile:'CDFS44_mask2_1.0_H_pzmsbs100_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs100_sig.fits', $
                            rfile:'CDFS44_mask2_1.0_H_pzmsbs100_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_mosfire', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs32' :  mask = {which:'pzmsbs32', dfile:'CDFS44_mask2_1.0_H_pzmsbs32_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs32_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs32_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=57.5', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 50.0', 'MU LT 64.0', 'SIG GT 0.0']}
     
     'pzmsbs41' :  mask = {which:'pzmsbs41', dfile:'CDFS44_mask2_1.0_H_pzmsbs41_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs41_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs41_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=45.5', 'sig=3.0', 'c=18.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 36.0', 'MU LT 52.0', 'SIG GT 0.0']}
 
     'pzmsbs51' :  mask = {which:'pzmsbs51', dfile:'CDFS44_mask2_1.0_H_pzmsbs51_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs51_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs51_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=46.8', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0']}
 
     'pzmsbs57' :  mask = {which:'pzmsbs57', dfile:'CDFS44_mask2_1.0_H_pzmsbs57_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs57_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs57_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=46.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'pzmsbs67' :  mask = {which:'pzmsbs67', dfile:'CDFS44_mask2_1.0_H_pzmsbs67_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs67_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs67_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=12.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 8.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzmsbs74' :  mask = {which:'pzmsbs74', dfile:'CDFS44_mask2_1.0_H_pzmsbs74_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs74_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs74_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs78' :  mask = {which:'pzmsbs78', dfile:'CDFS44_mask2_1.0_H_pzmsbs78_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs78_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs78_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzmsbs85' :  mask = {which:'pzmsbs85', dfile:'CDFS44_mask2_1.0_H_pzmsbs85_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs85_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs85_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=19.5', 'sig=3.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
     
     'pzmsbs89' :  mask = {which:'pzmsbs89', dfile:'CDFS44_mask2_1.0_H_pzmsbs89_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs89_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs89_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=50.1', 'sig=4.0', 'c=20.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 44.0', 'MU LT 58.0', 'SIG GT 0.0']}
 
     'pzmsbs93' :  mask = {which:'pzmsbs93', dfile:'CDFS44_mask2_1.0_H_pzmsbs93_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs93_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs93_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=21.1', 'sig=4.0', 'c=14.0', 'x0=-0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'pzmsbs95' :  mask = {which:'pzmsbs95', dfile:'CDFS44_mask2_1.0_H_pzmsbs95_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs95_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs95_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmsbs98' :  mask = {which:'pzmsbs98', dfile:'CDFS44_mask2_1.0_H_pzmsbs98_eps.fits', wfile:'CDFS44_mask2_1.0_H_pzmsbs98_sig.fits', $
                           rfile:'CDFS44_mask2_1.0_H_pzmsbs98_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'scistb9' :  mask = {which:'scistb9', dfile:'CDFS44_mask2_1.0_H_scistb9_eps.fits', wfile:'CDFS44_mask2_1.0_H_scistb9_sig.fits', $
                          rfile:'CDFS44_mask2_1.0_H_scistb9_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
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
pro cdfs44_mask2_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/'
  IF which[0] EQ 'all' THEN which = ['scistb3']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = cdfs44_mask2_H_extract_settings(which[zz])              ;get settings
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
