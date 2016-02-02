;========================================================================================================================
function en1240_mask1_J_extract_settings, pick
  
  CASE pick OF 
'bsbsr10' :  mask = {which:'bsbsr10', dfile:'en1240_mask1_v1-0_J_bsbsr10_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr10_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr10_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr12' :  mask = {which:'bsbsr12', dfile:'en1240_mask1_v1-0_J_bsbsr12_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr12_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr12_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr16' :  mask = {which:'bsbsr16', dfile:'en1240_mask1_v1-0_J_bsbsr16_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr16_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr16_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr21' :  mask = {which:'bsbsr21', dfile:'en1240_mask1_v1-0_J_bsbsr21_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr21_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr21_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr26' :  mask = {which:'bsbsr26', dfile:'en1240_mask1_v1-0_J_bsbsr26_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr26_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr26_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr29' :  mask = {which:'bsbsr29', dfile:'en1240_mask1_v1-0_J_bsbsr29_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr29_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr29_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr30' :  mask = {which:'bsbsr30', dfile:'en1240_mask1_v1-0_J_bsbsr30_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr30_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr30_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr32' :  mask = {which:'bsbsr32', dfile:'en1240_mask1_v1-0_J_bsbsr32_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr32_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr32_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr35' :  mask = {which:'bsbsr35', dfile:'en1240_mask1_v1-0_J_bsbsr35_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr35_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr35_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr36' :  mask = {which:'bsbsr36', dfile:'en1240_mask1_v1-0_J_bsbsr36_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr36_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr36_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr45' :  mask = {which:'bsbsr45', dfile:'en1240_mask1_v1-0_J_bsbsr45_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr45_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr45_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr52' :  mask = {which:'bsbsr52', dfile:'en1240_mask1_v1-0_J_bsbsr52_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr52_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr52_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr53' :  mask = {which:'bsbsr53', dfile:'en1240_mask1_v1-0_J_bsbsr53_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr53_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr53_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr54' :  mask = {which:'bsbsr54', dfile:'en1240_mask1_v1-0_J_bsbsr54_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr54_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr54_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr55' :  mask = {which:'bsbsr55', dfile:'en1240_mask1_v1-0_J_bsbsr55_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr55_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr55_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr59' :  mask = {which:'bsbsr59', dfile:'en1240_mask1_v1-0_J_bsbsr59_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr59_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr59_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr61' :  mask = {which:'bsbsr61', dfile:'en1240_mask1_v1-0_J_bsbsr61_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr61_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr61_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr63' :  mask = {which:'bsbsr63', dfile:'en1240_mask1_v1-0_J_bsbsr63_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr63_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr63_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr65' :  mask = {which:'bsbsr65', dfile:'en1240_mask1_v1-0_J_bsbsr65_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr65_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr65_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr72' :  mask = {which:'bsbsr72', dfile:'en1240_mask1_v1-0_J_bsbsr72_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr72_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr72_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr73' :  mask = {which:'bsbsr73', dfile:'en1240_mask1_v1-0_J_bsbsr73_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr73_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr73_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr80' :  mask = {which:'bsbsr80', dfile:'en1240_mask1_v1-0_J_bsbsr80_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr80_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr80_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr81' :  mask = {which:'bsbsr81', dfile:'en1240_mask1_v1-0_J_bsbsr81_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr81_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr81_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'bsbsr91' :  mask = {which:'bsbsr91', dfile:'en1240_mask1_v1-0_J_bsbsr91_eps.fits', wfile:'en1240_mask1_v1-0_J_bsbsr91_sig.fits', $
rfile:'en1240_mask1_v1-0_J_bsbsr91_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'eps.fits' :  mask = {which:'eps.fits', dfile:'en1240_mask1_v1-0_J_eps.fits', wfile:'en1240_mask1_v1-0_J_sig.fits', $
rfile:'en1240_mask1_v1-0_J_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest2475' :  mask = {which:'rest2475', dfile:'en1240_mask1_v1-0_J_rest2475_eps.fits', wfile:'en1240_mask1_v1-0_J_rest2475_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest2475_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest2525' :  mask = {which:'rest2525', dfile:'en1240_mask1_v1-0_J_rest2525_eps.fits', wfile:'en1240_mask1_v1-0_J_rest2525_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest2525_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest2669' :  mask = {which:'rest2669', dfile:'en1240_mask1_v1-0_J_rest2669_eps.fits', wfile:'en1240_mask1_v1-0_J_rest2669_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest2669_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest2677' :  mask = {which:'rest2677', dfile:'en1240_mask1_v1-0_J_rest2677_eps.fits', wfile:'en1240_mask1_v1-0_J_rest2677_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest2677_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest2689' :  mask = {which:'rest2689', dfile:'en1240_mask1_v1-0_J_rest2689_eps.fits', wfile:'en1240_mask1_v1-0_J_rest2689_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest2689_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest2728' :  mask = {which:'rest2728', dfile:'en1240_mask1_v1-0_J_rest2728_eps.fits', wfile:'en1240_mask1_v1-0_J_rest2728_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest2728_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest3508' :  mask = {which:'rest3508', dfile:'en1240_mask1_v1-0_J_rest3508_eps.fits', wfile:'en1240_mask1_v1-0_J_rest3508_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest3508_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest4697' :  mask = {which:'rest4697', dfile:'en1240_mask1_v1-0_J_rest4697_eps.fits', wfile:'en1240_mask1_v1-0_J_rest4697_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest4697_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest4776' :  mask = {which:'rest4776', dfile:'en1240_mask1_v1-0_J_rest4776_eps.fits', wfile:'en1240_mask1_v1-0_J_rest4776_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest4776_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest4781' :  mask = {which:'rest4781', dfile:'en1240_mask1_v1-0_J_rest4781_eps.fits', wfile:'en1240_mask1_v1-0_J_rest4781_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest4781_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest4788' :  mask = {which:'rest4788', dfile:'en1240_mask1_v1-0_J_rest4788_eps.fits', wfile:'en1240_mask1_v1-0_J_rest4788_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest4788_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest4942' :  mask = {which:'rest4942', dfile:'en1240_mask1_v1-0_J_rest4942_eps.fits', wfile:'en1240_mask1_v1-0_J_rest4942_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest4942_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest5016' :  mask = {which:'rest5016', dfile:'en1240_mask1_v1-0_J_rest5016_eps.fits', wfile:'en1240_mask1_v1-0_J_rest5016_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest5016_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest5086' :  mask = {which:'rest5086', dfile:'en1240_mask1_v1-0_J_rest5086_eps.fits', wfile:'en1240_mask1_v1-0_J_rest5086_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest5086_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest5105' :  mask = {which:'rest5105', dfile:'en1240_mask1_v1-0_J_rest5105_eps.fits', wfile:'en1240_mask1_v1-0_J_rest5105_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest5105_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest5138' :  mask = {which:'rest5138', dfile:'en1240_mask1_v1-0_J_rest5138_eps.fits', wfile:'en1240_mask1_v1-0_J_rest5138_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest5138_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'rest5187' :  mask = {which:'rest5187', dfile:'en1240_mask1_v1-0_J_rest5187_eps.fits', wfile:'en1240_mask1_v1-0_J_rest5187_sig.fits', $
rfile:'en1240_mask1_v1-0_J_rest5187_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'st28' :  mask = {which:'st28', dfile:'en1240_mask1_v1-0_J_st28_eps.fits', wfile:'en1240_mask1_v1-0_J_st28_sig.fits', $
rfile:'en1240_mask1_v1-0_J_st28_eps.reg', $
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
pro en1240_mask1_J_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/en1240_mask1_v1-0/2014aug16/J/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/en1240_mask1_v1-0/2014aug16/J/'
  IF which[0] EQ 'all' THEN which = ['bsbsr10', 'bsbsr12', 'bsbsr16', 'bsbsr21', 'bsbsr26', 'bsbsr29', 'bsbsr30', $
                                     'bsbsr32', 'bsbsr35', 'bsbsr36', 'bsbsr45', 'bsbsr52', 'bsbsr53', 'bsbsr54', $
                                     'bsbsr55', 'bsbsr59', 'bsbsr61', 'bsbsr63', 'bsbsr65', 'bsbsr72', 'bsbsr73', $
                                     'bsbsr80', 'bsbsr81', 'bsbsr91', 'eps.fits', 'rest2475', 'rest2525', 'rest2669', $
                                     'rest2677', 'rest2689', 'rest2728', 'rest3508', 'rest4697', 'rest4776', $
                                     'rest4781', 'rest4788', 'rest4942', 'rest5016', 'rest5086', 'rest5105', 'rest5138', $
                                     'rest5187', 'st28']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = en1240_mask1_J_extract_settings(which[zz])              ;get settings
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
