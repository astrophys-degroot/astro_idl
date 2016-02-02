;========================================================================================================================
function xmm710_mask2_K_extract_settings, pick
  
  CASE pick OF  
     'noy1013' :  mask = {which:'noy1013', dfile:'xmm710_mask2_K_noy1013_eps.fits', wfile:'xmm710_mask2_K_noy1013_ivar.fits', $
                          crow:42, rowsup:48, rowsdown:42, collow:10, colup:2000, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=40.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 35.0', 'MU LT 49.0', 'SIG GT 0.0']}
     
     'noy1085' :  mask = {which:'noy1085', dfile:'xmm710_mask2_K_noy1085_eps.fits', wfile:'xmm710_mask2_K_noy1085_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'noy10' :  mask = {which:'noy10', dfile:'xmm710_mask2_K_noy10_eps.fits', wfile:'xmm710_mask2_K_noy10_ivar.fits', $
                        crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'noy1254' :  mask = {which:'noy1254', dfile:'xmm710_mask2_K_noy1254_eps.fits', wfile:'xmm710_mask2_K_noy1254_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'noy360' :  mask = {which:'noy360', dfile:'xmm710_mask2_K_noy360_eps.fits', wfile:'xmm710_mask2_K_noy360_ivar.fits', $
                         crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'noy705' :  mask = {which:'noy705', dfile:'xmm710_mask2_K_noy705_eps.fits', wfile:'xmm710_mask2_K_noy705_ivar.fits', $
                         crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'noy738' :  mask = {which:'noy738', dfile:'xmm710_mask2_K_noy738_eps.fits', wfile:'xmm710_mask2_K_noy738_ivar.fits', $
                         crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'noy760' :  mask = {which:'noy760', dfile:'xmm710_mask2_K_noy760_eps.fits', wfile:'xmm710_mask2_K_noy760_ivar.fits', $
                         crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'noy8' :  mask = {which:'noy8', dfile:'xmm710_mask2_K_noy8_eps.fits', wfile:'xmm710_mask2_K_noy8_ivar.fits', $
                       crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'st13' :  mask = {which:'st13', dfile:'xmm710_mask2_K_st13_eps.fits', wfile:'xmm710_mask2_K_st13_ivar.fits', $
                       crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                       xwhich:0, flip:0, $
                       guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                       priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykbr146' :  mask = {which:'ykbr146', dfile:'xmm710_mask2_K_ykbr146_eps.fits', wfile:'xmm710_mask2_K_ykbr146_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykbr31' :  mask = {which:'ykbr31', dfile:'xmm710_mask2_K_ykbr31_eps.fits', wfile:'xmm710_mask2_K_ykbr31_ivar.fits', $
                         crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykbr69' :  mask = {which:'ykbr69', dfile:'xmm710_mask2_K_ykbr69_eps.fits', wfile:'xmm710_mask2_K_ykbr69_ivar.fits', $
                         crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr210' :  mask = {which:'ykfr210', dfile:'xmm710_mask2_K_ykfr210_eps.fits', wfile:'xmm710_mask2_K_ykfr210_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr220' :  mask = {which:'ykfr220', dfile:'xmm710_mask2_K_ykfr220_eps.fits', wfile:'xmm710_mask2_K_ykfr220_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr265' :  mask = {which:'ykfr265', dfile:'xmm710_mask2_K_ykfr265_eps.fits', wfile:'xmm710_mask2_K_ykfr265_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr274' :  mask = {which:'ykfr274', dfile:'xmm710_mask2_K_ykfr274_eps.fits', wfile:'xmm710_mask2_K_ykfr274_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr276' :  mask = {which:'ykfr276', dfile:'xmm710_mask2_K_ykfr276_eps.fits', wfile:'xmm710_mask2_K_ykfr276_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr353' :  mask = {which:'ykfr353', dfile:'xmm710_mask2_K_ykfr353_eps.fits', wfile:'xmm710_mask2_K_ykfr353_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr435' :  mask = {which:'ykfr435', dfile:'xmm710_mask2_K_ykfr435_eps.fits', wfile:'xmm710_mask2_K_ykfr435_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr581' :  mask = {which:'ykfr581', dfile:'xmm710_mask2_K_ykfr581_eps.fits', wfile:'xmm710_mask2_K_ykfr581_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr63' :  mask = {which:'ykfr63', dfile:'xmm710_mask2_K_ykfr63_eps.fits', wfile:'xmm710_mask2_K_ykfr63_ivar.fits', $
                         crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr682' :  mask = {which:'ykfr682', dfile:'xmm710_mask2_K_ykfr682_eps.fits', wfile:'xmm710_mask2_K_ykfr682_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr818' :  mask = {which:'ykfr818', dfile:'xmm710_mask2_K_ykfr818_eps.fits', wfile:'xmm710_mask2_K_ykfr818_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr825' :  mask = {which:'ykfr825', dfile:'xmm710_mask2_K_ykfr825_eps.fits', wfile:'xmm710_mask2_K_ykfr825_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr826' :  mask = {which:'ykfr826', dfile:'xmm710_mask2_K_ykfr826_eps.fits', wfile:'xmm710_mask2_K_ykfr826_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfr845' :  mask = {which:'ykfr845', dfile:'xmm710_mask2_K_ykfr845_eps.fits', wfile:'xmm710_mask2_K_ykfr845_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr18' :  mask = {which:'ykfsr18', dfile:'xmm710_mask2_K_ykfsr18_eps.fits', wfile:'xmm710_mask2_K_ykfsr18_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr1' :  mask = {which:'ykfsr1', dfile:'xmm710_mask2_K_ykfsr1_eps.fits', wfile:'xmm710_mask2_K_ykfsr1_ivar.fits', $
                         crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr31' :  mask = {which:'ykfsr31', dfile:'xmm710_mask2_K_ykfsr31_eps.fits', wfile:'xmm710_mask2_K_ykfsr31_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr43' :  mask = {which:'ykfsr43', dfile:'xmm710_mask2_K_ykfsr43_eps.fits', wfile:'xmm710_mask2_K_ykfsr43_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr47' :  mask = {which:'ykfsr47', dfile:'xmm710_mask2_K_ykfsr47_eps.fits', wfile:'xmm710_mask2_K_ykfsr47_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr75' :  mask = {which:'ykfsr75', dfile:'xmm710_mask2_K_ykfsr75_eps.fits', wfile:'xmm710_mask2_K_ykfsr75_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr76' :  mask = {which:'ykfsr76', dfile:'xmm710_mask2_K_ykfsr76_eps.fits', wfile:'xmm710_mask2_K_ykfsr76_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr79' :  mask = {which:'ykfsr79', dfile:'xmm710_mask2_K_ykfsr79_eps.fits', wfile:'xmm710_mask2_K_ykfsr79_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                          xwhich:0, flip:0, $
                          guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                          priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'ykfsr96' :  mask = {which:'ykfsr96', dfile:'xmm710_mask2_K_ykfsr96_eps.fits', wfile:'xmm710_mask2_K_ykfsr96_ivar.fits', $
                          crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
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
pro xmm710_mask2_K_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/degroota/research/current2_mosfire2012nov28_xmm710/XMM710_mask2_1.0/'
  outdir = '/Users/degroota/research/current2_mosfire2012nov28_xmm710/XMM710_mask2_1.0/'
  IF which[0] EQ 'all' THEN which = ['cl10']
  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                                          ;loop over all detections
     values = xmm710_mask2_H_extract_settings(which[zz])                                             ;get settings
     IF values.which NE '-1' THEN BEGIN                                                              ;if settings not fake 
        mosfire_1dspec_extract, values.dfile, values.wfile, which[zz], XWHICH=values.xwhich, $       ;cont next line
                                CENTROW=values.crow, ROWDOWN=values.rowsdown, ROWUP=values.rowsup, $ ;cont next line
                                COLDOWN=values.collow, COLUP=values.colup, $                         ;cont next line
                                FLIP=values.flip, SPATFIT=values.fit, GUESSES=values.guess,$         ;cont next line
                                PRIORS=values.priors, DRYRUN=dryrun, $                               ;cont next line
                                BORDER=values.border, NOSKYLINES=values.nosky, OMASKED=omasked, $    ;cont next line
                                INDIR=indir, OUTDIR=outdir                                           ;pass on settings
     ENDIF                                                                                           ;end if settings not fake
  ENDFOR                                                                                             ;end loop over all detections
  

END	
;========================================================================================================================
