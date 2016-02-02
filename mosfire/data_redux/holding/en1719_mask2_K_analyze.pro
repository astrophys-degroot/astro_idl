;========================================================================================================================
function en1719_mask1_K_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
;['Hb', 'OIIIr', 'OIIIb']

  CASE xwhich OF
     'fsbsb2' :  mask = {which:'fsbsb2', dfile:'en1719_mask2_K_fsbsb2_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                         guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'fsbsb5' :  mask = {which:'fsbsb5', dfile:'en1719_mask2_K_fsbsb5_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:20900.0, lau:21700.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=2.261', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 2.200', 'REDSHIFT LT 2.300', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
  
'fsbsr11' :  mask = {which:'fsbsr11', dfile:'en1719_mask2_K_fsbsr11_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'man10' :  mask = {which:'man10', dfile:'en1719_mask2_K_man10_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'man21' :  mask = {which:'man21', dfile:'en1719_mask2_K_man21_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'man22' :  mask = {which:'man22', dfile:'en1719_mask2_K_man22_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                   lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:3, $
                   guess:['redshift=2.172', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                   priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'man9' :  mask = {which:'man9', dfile:'en1719_mask2_K_man9_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsb32' :  mask = {which:'msbsb32', dfile:'en1719_mask2_K_msbsb32_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=2.172', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsb33' :  mask = {which:'msbsb33', dfile:'en1719_mask2_K_msbsb33_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:3, $
                     guess:['redshift=2.194', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsb38' :  mask = {which:'msbsb38', dfile:'en1719_mask2_K_msbsb38_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsb4' :  mask = {which:'msbsb4', dfile:'en1719_mask2_K_msbsb4_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:3, $
                     guess:['redshift=2.194', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

'msbsb98' :  mask = {which:'msbsb98', dfile:'en1719_mask2_K_msbsb98_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:3, $
                     guess:['redshift=2.194', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr106' :  mask = {which:'msbsr106', dfile:'en1719_mask2_K_msbsr106_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr25' :  mask = {which:'msbsr25', dfile:'en1719_mask2_K_msbsr25_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr28' :  mask = {which:'msbsr28', dfile:'en1719_mask2_K_msbsr28_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                      lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:3, $
                     guess:['redshift=2.194', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

'msbsr45' :  mask = {which:'msbsr45', dfile:'en1719_mask2_K_msbsr45_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:3, $
                     guess:['redshift=2.194', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr57' :  mask = {which:'msbsr57', dfile:'en1719_mask2_K_msbsr57_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr60' :  mask = {which:'msbsr60', dfile:'en1719_mask2_K_msbsr60_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:3, $
                     guess:['redshift=2.194', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'new1' :  mask = {which:'new1', dfile:'en1719_mask2_K_new1_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1165' :  mask = {which:'rest1165', dfile:'en1719_mask2_K_rest1165_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1184' :  mask = {which:'rest1184', dfile:'en1719_mask2_K_rest1184_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1245' :  mask = {which:'rest1245', dfile:'en1719_mask2_K_rest1245_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1671' :  mask = {which:'rest1671', dfile:'en1719_mask2_K_rest1671_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1756' :  mask = {which:'rest1756', dfile:'en1719_mask2_K_rest1756_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3167' :  mask = {which:'rest3167', dfile:'en1719_mask2_K_rest3167_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3487' :  mask = {which:'rest3487', dfile:'en1719_mask2_K_rest3487_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3632' :  mask = {which:'rest3632', dfile:'en1719_mask2_K_rest3632_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3635' :  mask = {which:'rest3635', dfile:'en1719_mask2_K_rest3635_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3763' :  mask = {which:'rest3763', dfile:'en1719_mask2_K_rest3763_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3771' :  mask = {which:'rest3771', dfile:'en1719_mask2_K_rest3771_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4814' :  mask = {which:'rest4814', dfile:'en1719_mask2_K_rest4814_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4841' :  mask = {which:'rest4841', dfile:'en1719_mask2_K_rest4841_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4865' :  mask = {which:'rest4865', dfile:'en1719_mask2_K_rest4865_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4874' :  mask = {which:'rest4874', dfile:'en1719_mask2_K_rest4874_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4935' :  mask = {which:'rest4935', dfile:'en1719_mask2_K_rest4935_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4995' :  mask = {which:'rest4995', dfile:'en1719_mask2_K_rest4995_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest598' :  mask = {which:'rest598', dfile:'en1719_mask2_K_rest598_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest696' :  mask = {which:'rest696', dfile:'en1719_mask2_K_rest696_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest910' :  mask = {which:'rest910', dfile:'en1719_mask2_K_rest910_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                     lal:20500.0, lau:21300.0, NOFITSKY:0, QFLAG:3, $
                     guess:['redshift=2.194', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                     priors:['REDSHIFT GT 2.135', 'REDSHIFT LT 2.225', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 

 

 
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
  indir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask2/2014jun14/K/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask2/2014jun14/K/' ;
  
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
  


