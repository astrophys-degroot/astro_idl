;========================================================================================================================
function en1747_mask1_K_extract_settings, pick
  
  CASE pick OF 
     'bsbsb0' :  mask = {which:'bsbsb0', dfile:'en1747_mask1_K_bsbsb0_eps.fits', wfile:'en1747_mask1_K_bsbsb0_sig.fits', $
                         crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
'bsbsb2' :  mask = {which:'bsbsb2', dfile:'en1747_mask1_K_bsbsb2_eps.fits', wfile:'en1747_mask1_K_bsbsb2_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsb4' :  mask = {which:'bsbsb4', dfile:'en1747_mask1_K_bsbsb4_eps.fits', wfile:'en1747_mask1_K_bsbsb4_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr3' :  mask = {which:'bsbsr3', dfile:'en1747_mask1_K_bsbsr3_eps.fits', wfile:'en1747_mask1_K_bsbsr3_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr5' :  mask = {which:'bsbsr5', dfile:'en1747_mask1_K_bsbsr5_eps.fits', wfile:'en1747_mask1_K_bsbsr5_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'man11' :  mask = {which:'man11', dfile:'en1747_mask1_K_man11_eps.fits', wfile:'en1747_mask1_K_man11_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'man12' :  mask = {which:'man12', dfile:'en1747_mask1_K_man12_eps.fits', wfile:'en1747_mask1_K_man12_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'man13' :  mask = {which:'man13', dfile:'en1747_mask1_K_man13_eps.fits', wfile:'en1747_mask1_K_man13_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'man16' :  mask = {which:'man16', dfile:'en1747_mask1_K_man16_eps.fits', wfile:'en1747_mask1_K_man16_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'man9' :  mask = {which:'man9', dfile:'en1747_mask1_K_man9_eps.fits', wfile:'en1747_mask1_K_man9_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsb11b' :  mask = {which:'msbsb11b', dfile:'en1747_mask1_K_msbsb11b_eps.fits', wfile:'en1747_mask1_K_msbsb11b_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsb29' :  mask = {which:'msbsb29', dfile:'en1747_mask1_K_msbsb29_eps.fits', wfile:'en1747_mask1_K_msbsb29_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsb47' :  mask = {which:'msbsb47', dfile:'en1747_mask1_K_msbsb47_eps.fits', wfile:'en1747_mask1_K_msbsb47_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsb51b' :  mask = {which:'msbsb51b', dfile:'en1747_mask1_K_msbsb51b_eps.fits', wfile:'en1747_mask1_K_msbsb51b_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsb55' :  mask = {which:'msbsb55', dfile:'en1747_mask1_K_msbsb55_eps.fits', wfile:'en1747_mask1_K_msbsb55_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsb61' :  mask = {which:'msbsb61', dfile:'en1747_mask1_K_msbsb61_eps.fits', wfile:'en1747_mask1_K_msbsb61_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsb68' :  mask = {which:'msbsb68', dfile:'en1747_mask1_K_msbsb68_eps.fits', wfile:'en1747_mask1_K_msbsb68_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr103' :  mask = {which:'msbsr103', dfile:'en1747_mask1_K_msbsr103_eps.fits', wfile:'en1747_mask1_K_msbsr103_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr15' :  mask = {which:'msbsr15', dfile:'en1747_mask1_K_msbsr15_eps.fits', wfile:'en1747_mask1_K_msbsr15_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr39' :  mask = {which:'msbsr39', dfile:'en1747_mask1_K_msbsr39_eps.fits', wfile:'en1747_mask1_K_msbsr39_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr50' :  mask = {which:'msbsr50', dfile:'en1747_mask1_K_msbsr50_eps.fits', wfile:'en1747_mask1_K_msbsr50_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr56a' :  mask = {which:'msbsr56a', dfile:'en1747_mask1_K_msbsr56a_eps.fits', wfile:'en1747_mask1_K_msbsr56a_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr65' :  mask = {which:'msbsr65', dfile:'en1747_mask1_K_msbsr65_eps.fits', wfile:'en1747_mask1_K_msbsr65_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr68' :  mask = {which:'msbsr68', dfile:'en1747_mask1_K_msbsr68_eps.fits', wfile:'en1747_mask1_K_msbsr68_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr69a' :  mask = {which:'msbsr69a', dfile:'en1747_mask1_K_msbsr69a_eps.fits', wfile:'en1747_mask1_K_msbsr69a_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr76a' :  mask = {which:'msbsr76a', dfile:'en1747_mask1_K_msbsr76a_eps.fits', wfile:'en1747_mask1_K_msbsr76a_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr83' :  mask = {which:'msbsr83', dfile:'en1747_mask1_K_msbsr83_eps.fits', wfile:'en1747_mask1_K_msbsr83_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbsr85' :  mask = {which:'msbsr85', dfile:'en1747_mask1_K_msbsr85_eps.fits', wfile:'en1747_mask1_K_msbsr85_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest1041' :  mask = {which:'rest1041', dfile:'en1747_mask1_K_rest1041_eps.fits', wfile:'en1747_mask1_K_rest1041_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest1056' :  mask = {which:'rest1056', dfile:'en1747_mask1_K_rest1056_eps.fits', wfile:'en1747_mask1_K_rest1056_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest1063' :  mask = {which:'rest1063', dfile:'en1747_mask1_K_rest1063_eps.fits', wfile:'en1747_mask1_K_rest1063_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest1082' :  mask = {which:'rest1082', dfile:'en1747_mask1_K_rest1082_eps.fits', wfile:'en1747_mask1_K_rest1082_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest1112' :  mask = {which:'rest1112', dfile:'en1747_mask1_K_rest1112_eps.fits', wfile:'en1747_mask1_K_rest1112_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest173' :  mask = {which:'rest173', dfile:'en1747_mask1_K_rest173_eps.fits', wfile:'en1747_mask1_K_rest173_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest280' :  mask = {which:'rest280', dfile:'en1747_mask1_K_rest280_eps.fits', wfile:'en1747_mask1_K_rest280_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest720' :  mask = {which:'rest720', dfile:'en1747_mask1_K_rest720_eps.fits', wfile:'en1747_mask1_K_rest720_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest796' :  mask = {which:'rest796', dfile:'en1747_mask1_K_rest796_eps.fits', wfile:'en1747_mask1_K_rest796_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest951' :  mask = {which:'rest951', dfile:'en1747_mask1_K_rest951_eps.fits', wfile:'en1747_mask1_K_rest951_sig.fits', $
crow:24, rowsup:28, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'st2' :  mask = {which:'st2', dfile:'en1747_mask1_K_st2_eps.fits', wfile:'en1747_mask1_K_st2_sig.fits', $
crow:24, rowsup:20, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'st8' :  mask = {which:'st8', dfile:'en1747_mask1_K_st8_eps.fits', wfile:'en1747_mask1_K_st8_sig.fits', $
crow:24, rowsup:20, rowsdown:24, collow:300, colup:2100, fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=40.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 

     ELSE : BEGIN
        print, 'WARNING!! Detection choice not found'
        stop
     END 
  ENDCASE
           
  chk = where(mask.which EQ pick)                                        ;a double check
  IF chk NE -1 THEN values = mask[chk] ELSE BEGIN                        ;if double check fails
     print, 'WARNING!! THis detection choice does not mask.which:', pick ;print warning
     print, ' Skipping....'                                              ;print info
     values = {which:'-1'}                                               ;create fake
  ENDELSE                                                                ;end if double check fails
  

  RETURN, values                ;returns values
END
;========================================================================================================================



;========================================================================================================================
pro en1747_mask1_K_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;1=open masked 2d spectrum
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/EN1747_mask1/2014may14/K/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/EN1747_mask1/2014may14/K/'

  IF which[0] EQ 'all' THEN which = ['bsbsb0', 'bsbsb2', 'bsbsb4', 'bsbsr3', 'bsbsr5', 'man11', $
                                     'man12', 'man13', 'man16', 'man9', 'msbsb11b', 'msbsb29', $
                                     'msbsb47', 'msbsb51b', 'msbsb55', 'msbsb61', 'msbsb68', $
                                     'msbsr103', 'msbsr15', 'msbsr39', 'msbsr50', 'msbsr56a', $
                                     'msbsr65', 'msbsr68', 'msbsr69a', 'msbsr76a', 'msbsr83', $
                                     'msbsr85', 'rest1041', 'rest1056', 'rest1063', 'rest1082', $
                                     'rest1112', 'rest173', 'rest280', 'rest720', 'rest796', $
                                     'rest951', 'st2', 'st8' ]

  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                                          ;loop over all detections
     values = en1747_mask1_K_extract_settings(which[zz])                                             ;get settings
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
