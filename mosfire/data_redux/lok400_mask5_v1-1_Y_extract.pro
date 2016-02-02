;========================================================================================================================
function lok400_mask5_Y_extract_settings, pick
  
  CASE pick OF 

     'brsr10' :  mask = {which:'brsr10', dfile:'LOK400_mask5_v1-1_Y_brsr10_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr10_sig.fits', $
                         rfile:'LOK400_mask5_v1-1_Y_brsr10_eps.reg', $
                         fit:'gauss3', border:2, nosky:'yband_mosfire', $
                         xwhich:0, flip:0, $
                         guess:['mu=27.8', 'sig=2.0', 'c=8.3', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 24.0', 'MU LT 32.0', 'SIG GT 0.0']}
     
     'brsr1a' :  mask = {which:'brsr1a', dfile:'LOK400_mask5_v1-1_Y_brsr1_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr1_sig.fits', $
                         rfile:'LOK400_mask5_v1-1_Y_brsr1a_eps.reg', $
                         fit:'full', border:2, nosky:'yband_mosfire', $
                         xwhich:['brsr1', 'brsr1a'], flip:0, $
                         guess:['mu=15.0', 'sig=2.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}

'brsr1b' :  mask = {which:'brsr1b', dfile:'LOK400_mask5_v1-1_Y_brsr1_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr1_sig.fits', $
                         rfile:'LOK400_mask5_v1-1_Y_brsr1b_eps.reg', $
                         fit:'full', border:2, nosky:'yband_mosfire', $
                         xwhich:['brsr1', 'brsr1b'], flip:0, $
                         guess:['mu=25.8', 'sig=4.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                         priors:['MU GT 24.0', 'MU LT 36.0', 'SIG GT 0.0']}
     
     'brsr2' :  mask = {which:'brsr2', dfile:'LOK400_mask5_v1-1_Y_brsr2_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr2_sig.fits', $
                        rfile:'LOK400_mask5_v1-1_Y_brsr2_eps.reg', $
                        fit:'gauss3', border:2, nosky:'yband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=19.8', 'sig=3.0', 'c=12.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 14.0', 'MU LT 24.0', 'SIG GT 0.0']}
 
     'brsr3' :  mask = {which:'brsr3', dfile:'LOK400_mask5_v1-1_Y_brsr3_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr3_sig.fits', $
                        rfile:'LOK400_mask5_v1-1_Y_brsr3_eps.reg', $
                        fit:'gauss3', border:2, nosky:'yband_medium', $
                        xwhich:0, flip:0, $
                        guess:['mu=14.5', 'sig=2.0', 'c=7.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 10.0', 'MU LT 20.0', 'SIG GT 0.0']}
 
     'brsr4' :  mask = {which:'brsr4', dfile:'LOK400_mask5_v1-1_Y_brsr4_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr4_sig.fits', $
                        rfile:'LOK400_mask5_v1-1_Y_brsr4_eps.reg', $
                        fit:'gauss3', border:2, nosky:'yband_faint', $
                        xwhich:0, flip:0, $
                        guess:['mu=54.5', 'sig=2.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 50.0', 'MU LT 60.0', 'SIG GT 0.0']}
     ;'brsr4' :  mask = {which:'brsr4', dfile:'LOK400_mask5_v1-1_Y_brsr4_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr4_sig.fits', $
     ;                   rfile:'LOK400_mask5_v1-1_Y_brsr4_eps.reg', $
     ;                   fit:'gauss3', border:2, nosky:'yband_faint', $
     ;                   xwhich:0, flip:0, $
     ;                   guess:['mu=27.5', 'sig=2.0', 'c=6.0', 'x0=0.1', 'x1=0.01'], $
     ;                   priors:['MU GT 22.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'brsr7' :  mask = {which:'brsr7', dfile:'LOK400_mask5_v1-1_Y_brsr7_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr7_sig.fits', $
                        rfile:'LOK400_mask5_v1-1_Y_brsr7_eps.reg', $
                        fit:'gauss3', border:2, nosky:'yband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=26.8', 'sig=2.0', 'c=4.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 22.0', 'MU LT 30.0', 'SIG GT 0.0']}
     
     'brsr8' :  mask = {which:'brsr8', dfile:'LOK400_mask5_v1-1_Y_brsr8_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr8_sig.fits', $
                        rfile:'LOK400_mask5_v1-1_Y_brsr8_eps.reg', $
                        fit:'gauss3', border:2, nosky:'yband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=30.3', 'sig=2.0', 'c=4.5', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 26.0', 'MU LT 34.0', 'SIG GT 0.0']}
     
     'brsr9' :  mask = {which:'brsr9', dfile:'LOK400_mask5_v1-1_Y_brsr9_eps.fits', wfile:'LOK400_mask5_v1-1_Y_brsr9_sig.fits', $
                        rfile:'LOK400_mask5_v1-1_Y_brsr9_eps.reg', $
                        fit:'gauss3', border:2, nosky:'yband_mosfire', $
                        xwhich:0, flip:0, $
                        guess:['mu=50.6', 'sig=2.2', 'c=5.0', 'x0=0.1', 'x1=0.01'], $
                        priors:['MU GT 44.0', 'MU LT 56.0', 'SIG GT 0.0']}
     
'fgbrsb1' :  mask = {which:'fgbrsb1', dfile:'LOK400_mask5_v1-1_Y_fgbrsb1_eps.fits', wfile:'LOK400_mask5_v1-1_Y_fgbrsb1_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_fgbrsb1_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzhqK114' :  mask = {which:'hpzhqK114', dfile:'LOK400_mask5_v1-1_Y_hpzhqK114_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzhqK114_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzhqK114_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzhqK159' :  mask = {which:'hpzhqK159', dfile:'LOK400_mask5_v1-1_Y_hpzhqK159_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzhqK159_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzhqK159_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzhqK166' :  mask = {which:'hpzhqK166', dfile:'LOK400_mask5_v1-1_Y_hpzhqK166_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzhqK166_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzhqK166_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzhqK202' :  mask = {which:'hpzhqK202', dfile:'LOK400_mask5_v1-1_Y_hpzhqK202_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzhqK202_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzhqK202_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzhqK223' :  mask = {which:'hpzhqK223', dfile:'LOK400_mask5_v1-1_Y_hpzhqK223_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzhqK223_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzhqK223_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzhqK224' :  mask = {which:'hpzhqK224', dfile:'LOK400_mask5_v1-1_Y_hpzhqK224_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzhqK224_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzhqK224_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzhqK38' :  mask = {which:'hpzhqK38', dfile:'LOK400_mask5_v1-1_Y_hpzhqK38_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzhqK38_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzhqK38_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzhqK40' :  mask = {which:'hpzhqK40', dfile:'LOK400_mask5_v1-1_Y_hpzhqK40_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzhqK40_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzhqK40_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzhqK45' :  mask = {which:'hpzhqK45', dfile:'LOK400_mask5_v1-1_Y_hpzhqK45_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzhqK45_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzhqK45_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmq388' :  mask = {which:'hpzmq388', dfile:'LOK400_mask5_v1-1_Y_hpzmq388_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmq388_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmq388_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmq389' :  mask = {which:'hpzmq389', dfile:'LOK400_mask5_v1-1_Y_hpzmq389_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmq389_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmq389_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmq404' :  mask = {which:'hpzmq404', dfile:'LOK400_mask5_v1-1_Y_hpzmq404_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmq404_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmq404_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmq412' :  mask = {which:'hpzmq412', dfile:'LOK400_mask5_v1-1_Y_hpzmq412_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmq412_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmq412_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmq452' :  mask = {which:'hpzmq452', dfile:'LOK400_mask5_v1-1_Y_hpzmq452_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmq452_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmq452_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmqK100' :  mask = {which:'hpzmqK100', dfile:'LOK400_mask5_v1-1_Y_hpzmqK100_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmqK100_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmqK100_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmqK191' :  mask = {which:'hpzmqK191', dfile:'LOK400_mask5_v1-1_Y_hpzmqK191_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmqK191_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmqK191_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmqK193' :  mask = {which:'hpzmqK193', dfile:'LOK400_mask5_v1-1_Y_hpzmqK193_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmqK193_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmqK193_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmqK344' :  mask = {which:'hpzmqK344', dfile:'LOK400_mask5_v1-1_Y_hpzmqK344_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmqK344_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmqK344_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmqK35' :  mask = {which:'hpzmqK35', dfile:'LOK400_mask5_v1-1_Y_hpzmqK35_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmqK35_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmqK35_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmqK36' :  mask = {which:'hpzmqK36', dfile:'LOK400_mask5_v1-1_Y_hpzmqK36_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmqK36_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmqK36_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'hpzmqK95' :  mask = {which:'hpzmqK95', dfile:'LOK400_mask5_v1-1_Y_hpzmqK95_eps.fits', wfile:'LOK400_mask5_v1-1_Y_hpzmqK95_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_hpzmqK95_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'nr1772' :  mask = {which:'nr1772', dfile:'LOK400_mask5_v1-1_Y_nr1772_eps.fits', wfile:'LOK400_mask5_v1-1_Y_nr1772_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_nr1772_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'nr2168' :  mask = {which:'nr2168', dfile:'LOK400_mask5_v1-1_Y_nr2168_eps.fits', wfile:'LOK400_mask5_v1-1_Y_nr2168_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_nr2168_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'nr2334' :  mask = {which:'nr2334', dfile:'LOK400_mask5_v1-1_Y_nr2334_eps.fits', wfile:'LOK400_mask5_v1-1_Y_nr2334_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_nr2334_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'nr2456' :  mask = {which:'nr2456', dfile:'LOK400_mask5_v1-1_Y_nr2456_eps.fits', wfile:'LOK400_mask5_v1-1_Y_nr2456_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_nr2456_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'nr4330' :  mask = {which:'nr4330', dfile:'LOK400_mask5_v1-1_Y_nr4330_eps.fits', wfile:'LOK400_mask5_v1-1_Y_nr4330_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_nr4330_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'st8' :  mask = {which:'st8', dfile:'LOK400_mask5_v1-1_Y_st8_eps.fits', wfile:'LOK400_mask5_v1-1_Y_st8_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_st8_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
xwhich:0, flip:0, $
guess:['mu=22.8', 'sig=4.0', 'c=10.0', 'x0=0.1', 'x1=0.01'], $
priors:['MU GT 14.0', 'MU LT 34.0', 'SIG GT 0.0']}
 
'tg55' :  mask = {which:'tg55', dfile:'LOK400_mask5_v1-1_Y_tg55_eps.fits', wfile:'LOK400_mask5_v1-1_Y_tg55_sig.fits', $
rfile:'LOK400_mask5_v1-1_Y_tg55_eps.reg', $
fit:'gauss3', border:2, nosky:'yband_mosfire', $
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
pro lok400_mask5_Y_extract, which, DRYRUN=dryrun, OMASKED=omasked, OPARAMS=oparams, WHICHMASK=whichmask

  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0    ;run program but don't write anything
  IF keyword_set(OMASKED) THEN omasked = 1 else omasked = 0 ;1=open masked 2d spectrum
  IF keyword_set(OPARAMS) THEN omasked = 1 else omasked = 0 ;1=open MCMC histograms for parameters

  
  CASE whichmask OF
     1 : BEGIN
        indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/2015feb23/Y/'
        outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/2015feb23/Y/'
     END

     2 : BEGIN
        indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/2015nov17/Y/'
        outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/2015nov17/Y/'
     END

     ELSE : BEGIN
        indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/2015feb23/Y/'
        outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/2015feb23/Y/'
     ENDELSE
  ENDCASE
  IF which[0] EQ 'all' THEN which = ['brsr10', 'brsr1', 'brsr2', 'brsr3', 'brsr4', 'brsr7', 'brsr8', 'brsr9', $
                                     'eps.fits', 'fgbrsb1', 'hpzhqK114', 'hpzhqK159', 'hpzhqK166', 'hpzhqK202', $
                                     'hpzhqK223', 'hpzhqK224', 'hpzhqK38', 'hpzhqK40', 'hpzhqK45', 'hpzmq388', $
                                     'hpzmq389', 'hpzmq404', 'hpzmq412', 'hpzmq452', 'hpzmqK100', 'hpzmqK191', $
                                     'hpzmqK193', 'hpzmqK344', 'hpzmqK35', 'hpzmqK36', 'hpzmqK95', 'nr1772', $
                                     'nr2168', 'nr2334', 'nr2456', 'nr4330', 'st8', 'tg55']
  
 FOR zz=0, n_elements(which)-1, 1 DO BEGIN                           ;loop over all detections
    values = lok400_mask5_Y_extract_settings(which[zz])              ;get settings
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
