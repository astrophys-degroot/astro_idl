;========================================================================================================================
function en1719_mask1_K_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
;['Hb', 'OIIIr', 'OIIIb']

  CASE xwhich OF
     'fsbsb10' :  mask = {which:'fsbsb10', dfile:'en1719_mask1_v1_K_fsbsb10_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:20100.0, lau:20999.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=2.172', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'man8' :  mask = {which:'man8', dfile:'en1719_mask1_v1_K_man8_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                       lal:20500.0, lau:22000.0, NOFITSKY:0, QFLAG:0, $
                       guess:['redshift=2.188', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                       priors:['REDSHIFT GT 2.150', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb10' :  mask = {which:'msbsb10', dfile:'en1719_mask1_v1_K_msbsb10_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:20500.0, lau:22000.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=2.188', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 2.150', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb121' :  mask = {which:'msbsb121', dfile:'en1719_mask1_v1_K_msbsb121_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=2.188', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 2.150', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb30' :  mask = {which:'msbsb30', dfile:'en1719_mask1_v1_K_msbsb30_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=2.188', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 2.150', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb51' :  mask = {which:'msbsb51', dfile:'en1719_mask1_v1_K_msbsb51_eps_1d_v10.fits', fitto:['Hb', 'OIIIr', 'OIIIb'], border:2, $
                          lal:20100.0, lau:21100.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=3.209', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 3.150', 'REDSHIFT LT 3.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
     'msbsb81' :  mask = {which:'msbsb81', dfile:'en1719_mask1_v1_K_msbsb81_eps_1d_v10.fits', fitto:['Hb', 'OIIIr', 'OIIIb'], border:2, $
                          lal:21200.0, lau:22100.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
  
     'msbsb89' :  mask = {which:'msbsb89', dfile:'en1719_mask1_v1_K_msbsb89_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb8' :  mask = {which:'msbsb8', dfile:'en1719_mask1_v1_K_msbsb8_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:21200.0, lau:22100.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
  
'msbsb92' :  mask = {which:'msbsb92', dfile:'en1719_mask1_v1_K_msbsb92_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr104' :  mask = {which:'msbsr104', dfile:'en1719_mask1_v1_K_msbsr104_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr16' :  mask = {which:'msbsr16', dfile:'en1719_mask1_v1_K_msbsr16_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:21200.0, lau:22100.0, NOFITSKY:0, QFLAG:99, $
                     guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
  
'msbsr49' :  mask = {which:'msbsr49', dfile:'en1719_mask1_v1_K_msbsr49_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20800.0, lau:21500.0, NOFITSKY:0, QFLAG:99, $
                     guess:['redshift=2.210', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 2.150', 'REDSHIFT LT 2.350', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
  
'msbsr66' :  mask = {which:'msbsr66', dfile:'en1719_mask1_v1_K_msbsr66_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:22000.0, lau:22700.0, NOFITSKY:0, QFLAG:99, $
                     guess:['redshift=2.400', 'sig=3.5', 'c1=0.5', 'c2=0.5', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 2.350', 'REDSHIFT LT 2.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
  
'msbsr71' :  mask = {which:'msbsr71', dfile:'en1719_mask1_v1_K_msbsr71_eps_1d_v10.fits', fitto:['Hb', 'OIIIr', 'OIIIb'], border:2, $
                     lal:20200.0, lau:21000.0, NOFITSKY:0, QFLAG:99, $
                     guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
  
'msbsr83' :  mask = {which:'msbsr83', dfile:'en1719_mask1_v1_K_msbsr83_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr97' :  mask = {which:'msbsr97', dfile:'en1719_mask1_v1_K_msbsr97_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1296' :  mask = {which:'rest1296', dfile:'en1719_mask1_v1_K_rest1296_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1401' :  mask = {which:'rest1401', dfile:'en1719_mask1_v1_K_rest1401_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1441' :  mask = {which:'rest1441', dfile:'en1719_mask1_v1_K_rest1441_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20200.0, lau:21000.0, NOFITSKY:0, QFLAG:99, $
                     guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1745' :  mask = {which:'rest1745', dfile:'en1719_mask1_v1_K_rest1745_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                      lal:20200.0, lau:21000.0, NOFITSKY:0, QFLAG:99, $
                      guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1771' :  mask = {which:'rest1771', dfile:'en1719_mask1_v1_K_rest1771_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1792' :  mask = {which:'rest1792', dfile:'en1719_mask1_v1_K_rest1792_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest2118' :  mask = {which:'rest2118', dfile:'en1719_mask1_v1_K_rest2118_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest2250' :  mask = {which:'rest2250', dfile:'en1719_mask1_v1_K_rest2250_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest2432' :  mask = {which:'rest2432', dfile:'en1719_mask1_v1_K_rest2432_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest2477' :  mask = {which:'rest2477', dfile:'en1719_mask1_v1_K_rest2477_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3200' :  mask = {which:'rest3200', dfile:'en1719_mask1_v1_K_rest3200_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                      lal:20900.0, lau:21700.0, NOFITSKY:0, QFLAG:99, $
                      guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3458' :  mask = {which:'rest3458', dfile:'en1719_mask1_v1_K_rest3458_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4230' :  mask = {which:'rest4230', dfile:'en1719_mask1_v1_K_rest4230_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:22000.0, lau:22700.0, NOFITSKY:0, QFLAG:99, $
                     guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4939' :  mask = {which:'rest4939', dfile:'en1719_mask1_v1_K_rest4939_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                      lal:20200.0, lau:21000.0, NOFITSKY:0, QFLAG:99, $
                      guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                      priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4946' :  mask = {which:'rest4946', dfile:'en1719_mask1_v1_K_rest4946_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20200.0, lau:21000.0, NOFITSKY:0, QFLAG:99, $
                     guess:['redshift=3.390', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 3.350', 'REDSHIFT LT 3.450', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4948' :  mask = {which:'rest4948', dfile:'en1719_mask1_v1_K_rest4948_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4985' :  mask = {which:'rest4985', dfile:'en1719_mask1_v1_K_rest4985_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest5247' :  mask = {which:'rest5247', dfile:'en1719_mask1_v1_K_rest5247_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest5334' :  mask = {which:'rest5334', dfile:'en1719_mask1_v1_K_rest5334_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 

 
    ELSE : BEGIN
        print, 'WARNING!! Choice not found'
        stop
     END 
  ENDCASE
  

  chk = where(mask.which EQ xwhich)
  IF chk NE -1 THEN values = mask[chk] ELSE BEGIN
     print, 'This detection tag not found: ', xwhich
     print, ' Skipping....'
     values = {which:'-1'}
  ENDELSE
  
  RETURN, values
END
;========================================================================================================================



;========================================================================================================================
pro en1719_mask1_K_analyze, which, DRYRUN=dryrun, PYERR=pyerr, OPENPLOT=openplot
  
  ;;;;Must give "which" as a string array!!!
  indir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask1_v1/2014jun14/K/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask1_v1/2014jun14/K/' ;
  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0       ;run program but don't write anything
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  IF which[0] EQ 'all' THEN which = ['cl10']
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN
     values = en1719_mask1_K_analyze_settings(which[zz])
     IF tag_exist(values, 'priors') EQ 1 THEN priors = values.priors ELSE priors = 0
     IF values.which NE '-1' THEN BEGIN
        mosfire_1dspec_analyze, values.dfile, values.which, PYERR=pyerr, $
                                FITTO=values.fitto, BORDER=values.border, $
                                LLOWER=values.lal, LUPPER=values.lau, $
                                NOFITSKY=values.nofitsky, CHKVALS=values.guess, $
                                PRIORS=priors, DRYRUN=dryrun, QFLAG=values.qflag, $
                                OPENPLOT=openplot, INDIR=indir, OUTDIR=outdir
     ENDIF
  ENDFOR
  

END	
;========================================================================================================================
  


