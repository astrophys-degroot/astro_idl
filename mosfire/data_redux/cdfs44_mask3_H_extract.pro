;========================================================================================================================
function cdfs44_mask3_H_extract_settings, pick
  
  CASE pick OF 
     'bcsbs12' :  mask = {which:'bcsbs12', dfile:'CDFS44_mask3_1.0_H_bcsbs12_eps.fits', wfile:'CDFS44_mask3_1.0_H_bcsbs12_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_bcsbs12_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=32.8', 'sig=4.0', 'c=0.5', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 28.0', 'MU LT 36.0', 'SIG GT 0.0', 'C GT 0.0']}
 
     'bcsbs28' :  mask = {which:'bcsbs28', dfile:'CDFS44_mask3_1.0_H_bcsbs28_eps.fits', wfile:'CDFS44_mask3_1.0_H_bcsbs28_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_bcsbs28_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=32.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 30.0', 'MU LT 42.0', 'SIG GT 0.0']}
 
     'bcsbs49' :  mask = {which:'bcsbs49', dfile:'CDFS44_mask3_1.0_H_bcsbs49_eps.fits', wfile:'CDFS44_mask3_1.0_H_bcsbs49_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_bcsbs49_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=54.3', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 44.0', 'MU LT 58.0', 'SIG GT 0.0']}
 
     'bcsbs51' :  mask = {which:'bcsbs51', dfile:'CDFS44_mask3_1.0_H_bcsbs51_eps.fits', wfile:'CDFS44_mask3_1.0_H_bcsbs51_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_bcsbs51_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=24.5', 'sig=4.0', 'c=8.0', 'x0=-0.1', 'x1=0.01'], $
                          priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'bcsbs52' :  mask = {which:'bcsbs52', dfile:'CDFS44_mask3_1.0_H_bcsbs52_eps.fits', wfile:'CDFS44_mask3_1.0_H_bcsbs52_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_bcsbs52_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=28.1', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 25.0', 'MU LT 35.0', 'SIG GT 0.0']}
 
     'bsbs1' :  mask = {which:'bsbs1', dfile:'CDFS44_mask3_1.0_H_bsbs1_eps.fits', wfile:'CDFS44_mask3_1.0_H_bsbs1_sig.fits', $
                        rfile:'CDFS44_mask3_1.0_H_bsbs1_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=69.4', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 60.0', 'MU LT 74.0', 'SIG GT 0.0']}
 
     'bsbs62' :  mask = {which:'bsbs62', dfile:'CDFS44_mask3_1.0_H_bsbs62_eps.fits', wfile:'CDFS44_mask3_1.0_H_bsbs62_sig.fits', $
                         rfile:'CDFS44_mask3_1.0_H_bsbs62_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=15.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'cl11' :  mask = {which:'cl11', dfile:'CDFS44_mask3_1.0_H_cl11_eps.fits', wfile:'CDFS44_mask3_1.0_H_cl11_sig.fits', $
                       rfile:'CDFS44_mask3_1.0_H_cl11_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_faint', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 2.0', 'C GT 0.0']}
     
     'msbs140' :  mask = {which:'msbs140', dfile:'CDFS44_mask3_1.0_H_msbs140_eps.fits', wfile:'CDFS44_mask3_1.0_H_msbs140_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_msbs140_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=61.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 55.0', 'MU LT 65.0', 'SIG GT 0.0']}
 
     'msbs144' :  mask = {which:'msbs144', dfile:'CDFS44_mask3_1.0_H_msbs144_eps.fits', wfile:'CDFS44_mask3_1.0_H_msbs144_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_msbs144_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'msbs165' :  mask = {which:'msbs165', dfile:'CDFS44_mask3_1.0_H_msbs165_eps.fits', wfile:'CDFS44_mask3_1.0_H_msbs165_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_msbs165_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=36.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'msbs2' :  mask = {which:'msbs2', dfile:'CDFS44_mask3_1.0_H_msbs2_eps.fits', wfile:'CDFS44_mask3_1.0_H_msbs2_sig.fits', $
                        rfile:'CDFS44_mask3_1.0_H_msbs2_eps.reg', $
                        fit:'gauss3', border:2, nosky:'hband_faint', $
                        xwhich:0, flip:0, $
                        guess:['mu=35.1', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 30.0', 'MU LT 40.0', 'SIG GT 0.0']}
 
     'nby8' :  mask = {which:'nby8', dfile:'CDFS44_mask3_1.0_H_nby8_eps.fits', wfile:'CDFS44_mask3_1.0_H_nby8_sig.fits', $
                       rfile:'CDFS44_mask3_1.0_H_nby8_eps.reg', $
                       fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=15.8', 'sig=4.0', 'c=25.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 4.0', 'MU LT 18.0', 'SIG GT 0.0']}
     
     'pzbsbs0' :  mask = {which:'pzbsbs0', dfile:'CDFS44_mask3_1.0_H_pzbsbs0_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzbsbs0_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_pzbsbs0_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzbsbs10' :  mask = {which:'pzbsbs10', dfile:'CDFS44_mask3_1.0_H_pzbsbs10_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzbsbs10_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzbsbs10_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=28.8', 'sig=3.0', 'c=14.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 24.0', 'MU LT 38.0', 'SIG GT 0.0']}
 
     'pzbsbs13' :  mask = {which:'pzbsbs13', dfile:'CDFS44_mask3_1.0_H_pzbsbs13_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzbsbs13_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzbsbs13_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzbsbs14' :  mask = {which:'pzbsbs14', dfile:'CDFS44_mask3_1.0_H_pzbsbs14_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzbsbs14_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzbsbs14_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 28.0', 'SIG GT 0.0']}
 
     'pzbsbs4' :  mask = {which:'pzbsbs4', dfile:'CDFS44_mask3_1.0_H_pzbsbs4_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzbsbs4_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_pzbsbs4_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=2.8', 'c=11.0', 'x0=-0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 26.0', 'SIG GT 0.0']}
     
     'pzbsbs6' :  mask = {which:'pzbsbs6', dfile:'CDFS44_mask3_1.0_H_pzbsbs6_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzbsbs6_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_pzbsbs6_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=57.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 46.0', 'MU LT 58.0', 'SIG GT 0.0']}
 
     'pzbsbs7' :  mask = {which:'pzbsbs7', dfile:'CDFS44_mask3_1.0_H_pzbsbs7_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzbsbs7_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_pzbsbs7_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 2.0']}
 
     'pzbsbs8' :  mask = {which:'pzbsbs8', dfile:'CDFS44_mask3_1.0_H_pzbsbs8_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzbsbs8_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_pzbsbs8_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=47.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 38.0', 'MU LT 50.0', 'SIG GT 0.0']}
 
     'pzfsbs37' :  mask = {which:'pzfsbs37', dfile:'CDFS44_mask3_1.0_H_pzfsbs37_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzfsbs37_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzfsbs37_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzfsbs51' :  mask = {which:'pzfsbs51', dfile:'CDFS44_mask3_1.0_H_pzfsbs51_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzfsbs51_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzfsbs51_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=3.0', 'c=7.0', 'x0=-0.1', 'x1=-0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzfsbs57' :  mask = {which:'pzfsbs57', dfile:'CDFS44_mask3_1.0_H_pzfsbs57_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzfsbs57_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzfsbs57_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=24.8', 'sig=3.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 20.0', 'MU LT 30.0', 'SIG GT 0.0']}
   
     'pzfsbs95' :  mask = {which:'pzfsbs95', dfile:'CDFS44_mask3_1.0_H_pzfsbs95_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzfsbs95_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzfsbs95_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 2.0']}
 
     'pzmsbs13' :  mask = {which:'pzmsbs13', dfile:'CDFS44_mask3_1.0_H_pzmsbs13_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzmsbs13_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzmsbs13_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=14.1', 'sig=4.0', 'c=11.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzmsbs19' :  mask = {which:'pzmsbs19', dfile:'CDFS44_mask3_1.0_H_pzmsbs19_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzmsbs19_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzmsbs19_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=43.8', 'sig=4.0', 'c=9.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 38.0', 'MU LT 54.0', 'SIG GT 0.0']}
 
     'pzmsbs25' :  mask = {which:'pzmsbs25', dfile:'CDFS44_mask3_1.0_H_pzmsbs25_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzmsbs25_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzmsbs25_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=26.8', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 2.0']}
 
     'pzmsbs26' :  mask = {which:'pzmsbs26', dfile:'CDFS44_mask3_1.0_H_pzmsbs26_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzmsbs26_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzmsbs26_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 2.0']}
 
     'pzmsbs27' :  mask = {which:'pzmsbs27', dfile:'CDFS44_mask3_1.0_H_pzmsbs27_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzmsbs27_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzmsbs27_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs29' :  mask = {which:'pzmsbs29', dfile:'CDFS44_mask3_1.0_H_pzmsbs29_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzmsbs29_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzmsbs29_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmsbs33' :  mask = {which:'pzmsbs33', dfile:'CDFS44_mask3_1.0_H_pzmsbs33_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzmsbs33_sig.fits', $
                           rfile:'CDFS44_mask3_1.0_H_pzmsbs33_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=47.1', 'sig=4.0', 'c=26.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 45.0', 'MU LT 55.0', 'SIG GT 0.0']}
 
     'pzmsbs4' :  mask = {which:'pzmsbs4', dfile:'CDFS44_mask3_1.0_H_pzmsbs4_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzmsbs4_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_pzmsbs4_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=27.8', 'sig=4.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 22.0', 'MU LT 38.0', 'SIG GT 2.0']}
 
     'pzmsbs6' :  mask = {which:'pzmsbs6', dfile:'CDFS44_mask3_1.0_H_pzmsbs6_eps.fits', wfile:'CDFS44_mask3_1.0_H_pzmsbs6_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_pzmsbs6_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_faint', $
                          xwhich:0, flip:0, $
                          guess:['mu=35.8', 'sig=4.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 30.0', 'MU LT 42.0', 'SIG GT 0.0']}
     
'scista0' :  mask = {which:'scista0', dfile:'CDFS44_mask3_1.0_H_scista0_eps.fits', wfile:'CDFS44_mask3_1.0_H_scista0_sig.fits', $
                          rfile:'CDFS44_mask3_1.0_H_scista0_eps.reg', $
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
pro cdfs44_mask3_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/'
  IF which[0] EQ 'all' THEN which = ['scistb3']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = cdfs44_mask3_H_extract_settings(which[zz])              ;get settings
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
