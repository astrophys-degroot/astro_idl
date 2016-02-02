;========================================================================================================================
function xmm113_mask1_H_extract_settings, pick
  

  CASE pick OF 
'bsbs46' :  mask = {which:'bsbs46', dfile:'XMM113_mask1_1.0_H_bsbs46_eps.fits', wfile:'XMM113_mask1_1.0_H_bsbs46_sig.fits', $
rfile:'XMM113_mask1_1.0_H_bsbs46_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'cl10' :  mask = {which:'cl10', dfile:'XMM113_mask1_1.0_H_cl10_eps.fits', wfile:'XMM113_mask1_1.0_H_cl10_sig.fits', $
rfile:'XMM113_mask1_1.0_H_cl10_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'cl5' :  mask = {which:'cl5', dfile:'XMM113_mask1_1.0_H_cl5_eps.fits', wfile:'XMM113_mask1_1.0_H_cl5_sig.fits', $
rfile:'XMM113_mask1_1.0_H_cl5_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'cl6' :  mask = {which:'cl6', dfile:'XMM113_mask1_1.0_H_cl6_eps.fits', wfile:'XMM113_mask1_1.0_H_cl6_sig.fits', $
rfile:'XMM113_mask1_1.0_H_cl6_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'cl8' :  mask = {which:'cl8', dfile:'XMM113_mask1_1.0_H_cl8_eps.fits', wfile:'XMM113_mask1_1.0_H_cl8_sig.fits', $
                 rfile:'XMM113_mask1_1.0_H_cl8_eps.reg', $
                 fit:'gauss3', border:2, nosky:'hband_mosfire', $
                 xwhich:0, flip:0, $
                 guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                 priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}

'cl9' :  mask = {which:'cl9', dfile:'XMM113_mask1_1.0_H_cl9_eps.fits', wfile:'XMM113_mask1_1.0_H_cl9_sig.fits', $
rfile:'XMM113_mask1_1.0_H_cl9_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'eps.fits' :  mask = {which:'eps.fits', dfile:'XMM113_mask1_1.0_H_eps.fits', wfile:'XMM113_mask1_1.0_H_sig.fits', $
rfile:'XMM113_mask1_1.0_H_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'fsbs7' :  mask = {which:'fsbs7', dfile:'XMM113_mask1_1.0_H_fsbs7_eps.fits', wfile:'XMM113_mask1_1.0_H_fsbs7_sig.fits', $
rfile:'XMM113_mask1_1.0_H_fsbs7_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbs1' :  mask = {which:'msbs1', dfile:'XMM113_mask1_1.0_H_msbs1_eps.fits', wfile:'XMM113_mask1_1.0_H_msbs1_sig.fits', $
rfile:'XMM113_mask1_1.0_H_msbs1_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbs22' :  mask = {which:'msbs22', dfile:'XMM113_mask1_1.0_H_msbs22_eps.fits', wfile:'XMM113_mask1_1.0_H_msbs22_sig.fits', $
rfile:'XMM113_mask1_1.0_H_msbs22_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbs28' :  mask = {which:'msbs28', dfile:'XMM113_mask1_1.0_H_msbs28_eps.fits', wfile:'XMM113_mask1_1.0_H_msbs28_sig.fits', $
rfile:'XMM113_mask1_1.0_H_msbs28_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'msbs341' :  mask = {which:'msbs341', dfile:'XMM113_mask1_1.0_H_msbs341_eps.fits', wfile:'XMM113_mask1_1.0_H_msbs341_sig.fits', $
rfile:'XMM113_mask1_1.0_H_msbs341_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs10' :  mask = {which:'pzbsbs10', dfile:'XMM113_mask1_1.0_H_pzbsbs10_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs10_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs10_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs11' :  mask = {which:'pzbsbs11', dfile:'XMM113_mask1_1.0_H_pzbsbs11_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs11_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs11_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs12' :  mask = {which:'pzbsbs12', dfile:'XMM113_mask1_1.0_H_pzbsbs12_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs12_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs12_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs13' :  mask = {which:'pzbsbs13', dfile:'XMM113_mask1_1.0_H_pzbsbs13_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs13_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs13_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs14' :  mask = {which:'pzbsbs14', dfile:'XMM113_mask1_1.0_H_pzbsbs14_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs14_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs14_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs15' :  mask = {which:'pzbsbs15', dfile:'XMM113_mask1_1.0_H_pzbsbs15_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs15_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs15_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs16' :  mask = {which:'pzbsbs16', dfile:'XMM113_mask1_1.0_H_pzbsbs16_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs16_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs16_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs18' :  mask = {which:'pzbsbs18', dfile:'XMM113_mask1_1.0_H_pzbsbs18_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs18_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs18_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs2' :  mask = {which:'pzbsbs2', dfile:'XMM113_mask1_1.0_H_pzbsbs2_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs2_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs2_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs4' :  mask = {which:'pzbsbs4', dfile:'XMM113_mask1_1.0_H_pzbsbs4_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs4_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs4_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs6' :  mask = {which:'pzbsbs6', dfile:'XMM113_mask1_1.0_H_pzbsbs6_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs6_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs6_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs7' :  mask = {which:'pzbsbs7', dfile:'XMM113_mask1_1.0_H_pzbsbs7_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs7_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs7_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzbsbs8' :  mask = {which:'pzbsbs8', dfile:'XMM113_mask1_1.0_H_pzbsbs8_eps.fits', wfile:'XMM113_mask1_1.0_H_pzbsbs8_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzbsbs8_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzfsbs30' :  mask = {which:'pzfsbs30', dfile:'XMM113_mask1_1.0_H_pzfsbs30_eps.fits', wfile:'XMM113_mask1_1.0_H_pzfsbs30_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzfsbs30_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs100' :  mask = {which:'pzmsbs100', dfile:'XMM113_mask1_1.0_H_pzmsbs100_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs100_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs100_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs28' :  mask = {which:'pzmsbs28', dfile:'XMM113_mask1_1.0_H_pzmsbs28_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs28_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs28_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs45' :  mask = {which:'pzmsbs45', dfile:'XMM113_mask1_1.0_H_pzmsbs45_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs45_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs45_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs48' :  mask = {which:'pzmsbs48', dfile:'XMM113_mask1_1.0_H_pzmsbs48_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs48_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs48_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs50' :  mask = {which:'pzmsbs50', dfile:'XMM113_mask1_1.0_H_pzmsbs50_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs50_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs50_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs54' :  mask = {which:'pzmsbs54', dfile:'XMM113_mask1_1.0_H_pzmsbs54_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs54_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs54_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs67' :  mask = {which:'pzmsbs67', dfile:'XMM113_mask1_1.0_H_pzmsbs67_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs67_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs67_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs70' :  mask = {which:'pzmsbs70', dfile:'XMM113_mask1_1.0_H_pzmsbs70_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs70_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs70_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs83' :  mask = {which:'pzmsbs83', dfile:'XMM113_mask1_1.0_H_pzmsbs83_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs83_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs83_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs87' :  mask = {which:'pzmsbs87', dfile:'XMM113_mask1_1.0_H_pzmsbs87_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs87_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs87_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs94' :  mask = {which:'pzmsbs94', dfile:'XMM113_mask1_1.0_H_pzmsbs94_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs94_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs94_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'pzmsbs95' :  mask = {which:'pzmsbs95', dfile:'XMM113_mask1_1.0_H_pzmsbs95_eps.fits', wfile:'XMM113_mask1_1.0_H_pzmsbs95_sig.fits', $
rfile:'XMM113_mask1_1.0_H_pzmsbs95_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'scist2' :  mask = {which:'scist2', dfile:'XMM113_mask1_1.0_H_scist2_eps.fits', wfile:'XMM113_mask1_1.0_H_scist2_sig.fits', $
rfile:'XMM113_mask1_1.0_H_scist2_eps.reg', $
fit:'gauss3', border:2, nosky:'hband_mosfire', $
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
pro xmm113_mask1_H_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/'
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/'
  IF which[0] EQ 'all' THEN which = ['bsbs4', 'bsbs52', 'bsbs58', 'bsbs5', 'cl0', 'cl2', 'cl4', 'cl7', $
                                     'fsbs10', 'fsbs9', 'msbs10', 'msbs12', 'msbs17', 'msbs397', 'msbs410', $
                                     'msbs424', 'msbs467', 'msbs477', 'pzfsbs35', 'pzfsbs7', 'pzmsbs0', $
                                     'pzmsbs14', 'pzmsbs19', 'pzmsbs26', 'pzmsbs27', 'pzmsbs31', 'pzmsbs34', $
                                     'pzmsbs39', 'pzmsbs42', 'pzmsbs43', 'pzmsbs44', 'pzmsbs47', 'pzmsbs51', $
                                     'pzmsbs52', 'pzmsbs63', 'pzmsbs80', 'pzmsbs86', 'scist5']
  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
     values = xmm113_mask1_H_extract_settings(which[zz])              ;get settings
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
