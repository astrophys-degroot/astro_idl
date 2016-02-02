;========================================================================================================================
function cdfs44_mask6_H_extract_settings, pick
  
  CASE pick OF 
  
     'pzhi53' :  mask = {which:'pzhi53', dfile:'cdfs44_mask6_v2_H_pzhi53_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi53_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi53_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=16.8', 'sig=4.0', 'c=22.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 12.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'pzhi56' :  mask = {which:'pzhi56', dfile:'cdfs44_mask6_v2_H_pzhi56_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi56_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi56_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi57' :  mask = {which:'pzhi57', dfile:'cdfs44_mask6_v2_H_pzhi57_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi57_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi57_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi65' :  mask = {which:'pzhi65', dfile:'cdfs44_mask6_v2_H_pzhi65_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi65_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi65_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi66' :  mask = {which:'pzhi66', dfile:'cdfs44_mask6_v2_H_pzhi66_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi66_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi66_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi68' :  mask = {which:'pzhi68', dfile:'cdfs44_mask6_v2_H_pzhi68_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi68_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi68_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=54.2', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 48.0', 'MU LT 62.0', 'SIG GT 0.0']}
 
     'pzhi69' :  mask = {which:'pzhi69', dfile:'cdfs44_mask6_v2_H_pzhi69_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi69_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi69_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=15.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 22.0', 'SIG GT 0.0']}
 
     'pzhi70' :  mask = {which:'pzhi70', dfile:'cdfs44_mask6_v2_H_pzhi70_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi70_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi70_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi73' :  mask = {which:'pzhi73', dfile:'cdfs44_mask6_v2_H_pzhi73_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi73_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi73_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi75' :  mask = {which:'pzhi75', dfile:'cdfs44_mask6_v2_H_pzhi75_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi75_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi75_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=51.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 40.0', 'MU LT 60.0', 'SIG GT 0.0']}
     
     'pzhi81' :  mask = {which:'pzhi81', dfile:'cdfs44_mask6_v2_H_pzhi81_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi81_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi81_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi82' :  mask = {which:'pzhi82', dfile:'cdfs44_mask6_v2_H_pzhi82_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi82_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi82_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_faint', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzhi87' :  mask = {which:'pzhi87', dfile:'cdfs44_mask6_v2_H_pzhi87_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi87_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi87_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=45.2', 'sig=3.0', 'c=30.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 44.0', 'MU LT 56.0', 'SIG GT 0.0']}
 
     'pzhi90' :  mask = {which:'pzhi90', dfile:'cdfs44_mask6_v2_H_pzhi90_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi90_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi90_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=50.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 44.0', 'MU LT 58.0', 'SIG GT 0.0']}
     
     'pzhi96' :  mask = {which:'pzhi96', dfile:'cdfs44_mask6_v2_H_pzhi96_eps.fits', wfile:'cdfs44_mask6_v2_H_pzhi96_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_pzhi96_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzlow1800' :  mask = {which:'pzlow1800', dfile:'cdfs44_mask6_v2_H_pzlow1800_eps.fits', wfile:'cdfs44_mask6_v2_H_pzlow1800_sig.fits', $
                            rfile:'cdfs44_mask6_v2_H_pzlow1800_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1125' :  mask = {which:'pzmed1125', dfile:'cdfs44_mask6_v2_H_pzmed1125_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed1125_sig.fits', $
                            rfile:'cdfs44_mask6_v2_H_pzmed1125_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed1138' :  mask = {which:'pzmed1138', dfile:'cdfs44_mask6_v2_H_pzmed1138_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed1138_sig.fits', $
                            rfile:'cdfs44_mask6_v2_H_pzmed1138_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed1240' :  mask = {which:'pzmed1240', dfile:'cdfs44_mask6_v2_H_pzmed1240_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed1240_sig.fits', $
                            rfile:'cdfs44_mask6_v2_H_pzmed1240_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed1270' :  mask = {which:'pzmed1270', dfile:'cdfs44_mask6_v2_H_pzmed1270_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed1270_sig.fits', $
                            rfile:'cdfs44_mask6_v2_H_pzmed1270_eps.reg', $
                            fit:'gauss3', border:2, nosky:'hband_faint', $
                            xwhich:0, flip:0, $
                            guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                            priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed578' :  mask = {which:'pzmed578', dfile:'cdfs44_mask6_v2_H_pzmed578_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed578_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed578_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_mosfire', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed598' :  mask = {which:'pzmed598', dfile:'cdfs44_mask6_v2_H_pzmed598_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed598_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed598_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=52.8', 'sig=4.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 44.0', 'MU LT 54.0', 'SIG GT 0.0']}
     
     'pzmed610' :  mask = {which:'pzmed610', dfile:'cdfs44_mask6_v2_H_pzmed610_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed610_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed610_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=14.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'pzmed613' :  mask = {which:'pzmed613', dfile:'cdfs44_mask6_v2_H_pzmed613_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed613_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed613_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=14.2', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 10.0', 'MU LT 24.0', 'SIG GT 0.0']}
     
     'pzmed628' :  mask = {which:'pzmed628', dfile:'cdfs44_mask6_v2_H_pzmed628_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed628_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed628_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed692' :  mask = {which:'pzmed692', dfile:'cdfs44_mask6_v2_H_pzmed692_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed692_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed692_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'pzmed720' :  mask = {which:'pzmed720', dfile:'cdfs44_mask6_v2_H_pzmed720_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed720_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed720_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed781' :  mask = {which:'pzmed781', dfile:'cdfs44_mask6_v2_H_pzmed781_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed781_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed781_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_faint', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed829' :  mask = {which:'pzmed829', dfile:'cdfs44_mask6_v2_H_pzmed829_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed829_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed829_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'pzmed911' :  mask = {which:'pzmed911', dfile:'cdfs44_mask6_v2_H_pzmed911_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed911_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed911_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=42.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 40.0', 'MU LT 56.0', 'SIG GT 0.0']}
 
     'pzmed937' :  mask = {which:'pzmed937', dfile:'cdfs44_mask6_v2_H_pzmed937_eps.fits', wfile:'cdfs44_mask6_v2_H_pzmed937_sig.fits', $
                           rfile:'cdfs44_mask6_v2_H_pzmed937_eps.reg', $
                           fit:'gauss3', border:2, nosky:'hband_medium', $
                           xwhich:0, flip:0, $
                           guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                           priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'spzg117' :  mask = {which:'spzg117', dfile:'cdfs44_mask6_v2_H_spzg117_eps.fits', wfile:'cdfs44_mask6_v2_H_spzg117_sig.fits', $
                          rfile:'cdfs44_mask6_v2_H_spzg117_eps.reg', $
                          fit:'gauss3', border:2, nosky:'hband_medium', $
                          xwhich:0, flip:0, $
                          guess:['mu=52.1', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 44.0', 'MU LT 60.0', 'SIG GT 0.0']}
 
     'spzg43' :  mask = {which:'spzg43', dfile:'cdfs44_mask6_v2_H_spzg43_eps.fits', wfile:'cdfs44_mask6_v2_H_spzg43_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_spzg43_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'spzg71' :  mask = {which:'spzg71', dfile:'cdfs44_mask6_v2_H_spzg71_eps.fits', wfile:'cdfs44_mask6_v2_H_spzg71_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_spzg71_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
     'spzo55' :  mask = {which:'spzo55', dfile:'cdfs44_mask6_v2_H_spzo55_eps.fits', wfile:'cdfs44_mask6_v2_H_spzo55_sig.fits', $
                         rfile:'cdfs44_mask6_v2_H_spzo55_eps.reg', $
                         fit:'gauss3', border:2, nosky:'hband_medium', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'st21' :  mask = {which:'st21', dfile:'cdfs44_mask6_v2_H_st21_eps.fits', wfile:'cdfs44_mask6_v2_H_st21_sig.fits', $
                       rfile:'cdfs44_mask6_v2_H_st21_eps.reg', $
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
pro cdfs44_mask6_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask6_v2/2014nov16/H/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask6_v2/2014nov16/H/'
  IF which[0] EQ 'all' THEN which = ['pzhi53', 'pzhi56', 'pzhi57', 'pzhi65', 'pzhi66', 'pzhi68', 'pzhi69', 'pzhi70', $
                                     'pzhi73', 'pzhi75', 'pzhi81', 'pzhi82', 'pzhi87', 'pzhi90', 'pzhi96', 'pzlow1800', $
                                     'pzmed1125', 'pzmed1138', 'pzmed1240', 'pzmed1270', 'pzmed578', 'pzmed598', $
                                     'pzmed610', 'pzmed613', 'pzmed628', 'pzmed692', 'pzmed720', 'pzmed781', 'pzmed829', $
                                     'pzmed911', 'pzmed937', 'spzg117', 'spzg43', 'spzg71', 'spzo55', 'st21']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = cdfs44_mask6_H_extract_settings(which[zz])              ;get settings
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
