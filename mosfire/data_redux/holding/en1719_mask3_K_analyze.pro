;========================================================================================================================
function en1719_mask3_K_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
;['Hb', 'OIIIr', 'OIIIb']

  CASE xwhich OF
     'fsbsr26' :  mask = {which:'fsbsr26', dfile:'en1719_mask3_v2_K_fsbsr26_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:20300.0, lau:20900.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=2.261', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 2.200', 'REDSHIFT LT 2.300', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'man6' :  mask = {which:'man6', dfile:'en1719_mask3_v2_K_man6_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                       lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                       guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                       priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb107' :  mask = {which:'msbsb107', dfile:'en1719_mask3_v2_K_msbsb107_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                        lal:20500.0, lau:21200.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=2.261', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 2.200', 'REDSHIFT LT 2.300', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
      
     'msbsb127b' :  mask = {which:'msbsb127b', dfile:'en1719_mask3_v2_K_msbsb127b_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                            lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                            guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
     'msbsb84' :  mask = {which:'msbsb84', dfile:'en1719_mask3_v2_K_msbsb84_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     
'msbsr1' :  mask = {which:'msbsr1', dfile:'en1719_mask3_v2_K_msbsr1_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr65' :  mask = {which:'msbsr65', dfile:'en1719_mask3_v2_K_msbsr65_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'msbsr6' :  mask = {which:'msbsr6', dfile:'en1719_mask3_v2_K_msbsr6_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1120' :  mask = {which:'rest1120', dfile:'en1719_mask3_v2_K_rest1120_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1179' :  mask = {which:'rest1179', dfile:'en1719_mask3_v2_K_rest1179_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1220' :  mask = {which:'rest1220', dfile:'en1719_mask3_v2_K_rest1220_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1221' :  mask = {which:'rest1221', dfile:'en1719_mask3_v2_K_rest1221_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1305' :  mask = {which:'rest1305', dfile:'en1719_mask3_v2_K_rest1305_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1483' :  mask = {which:'rest1483', dfile:'en1719_mask3_v2_K_rest1483_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1504' :  mask = {which:'rest1504', dfile:'en1719_mask3_v2_K_rest1504_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1556' :  mask = {which:'rest1556', dfile:'en1719_mask3_v2_K_rest1556_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1564' :  mask = {which:'rest1564', dfile:'en1719_mask3_v2_K_rest1564_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1689' :  mask = {which:'rest1689', dfile:'en1719_mask3_v2_K_rest1689_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1762' :  mask = {which:'rest1762', dfile:'en1719_mask3_v2_K_rest1762_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest1947' :  mask = {which:'rest1947', dfile:'en1719_mask3_v2_K_rest1947_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest2185' :  mask = {which:'rest2185', dfile:'en1719_mask3_v2_K_rest2185_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest2212' :  mask = {which:'rest2212', dfile:'en1719_mask3_v2_K_rest2212_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest2290' :  mask = {which:'rest2290', dfile:'en1719_mask3_v2_K_rest2290_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:20700.0, lau:20900.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=2.261', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 2.200', 'REDSHIFT LT 2.300', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3158' :  mask = {which:'rest3158', dfile:'en1719_mask3_v2_K_rest3158_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3502' :  mask = {which:'rest3502', dfile:'en1719_mask3_v2_K_rest3502_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                      lal:20600.0, lau:20900.0, NOFITSKY:0, QFLAG:3, $
                      guess:['redshift=2.261', 'sig=3.5', 'c1=0.05', 'c2=0.05', 'x0=0.1', 'x1=0.0001' ], $
                      priors:['REDSHIFT GT 2.200', 'REDSHIFT LT 2.300', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}

'rest3679' :  mask = {which:'rest3679', dfile:'en1719_mask3_v2_K_rest3679_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest3766' :  mask = {which:'rest3766', dfile:'en1719_mask3_v2_K_rest3766_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4286' :  mask = {which:'rest4286', dfile:'en1719_mask3_v2_K_rest4286_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4640' :  mask = {which:'rest4640', dfile:'en1719_mask3_v2_K_rest4640_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4692' :  mask = {which:'rest4692', dfile:'en1719_mask3_v2_K_rest4692_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4715' :  mask = {which:'rest4715', dfile:'en1719_mask3_v2_K_rest4715_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4715b' :  mask = {which:'rest4715b', dfile:'en1719_mask3_v2_K_rest4715b_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4757' :  mask = {which:'rest4757', dfile:'en1719_mask3_v2_K_rest4757_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4804' :  mask = {which:'rest4804', dfile:'en1719_mask3_v2_K_rest4804_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4840' :  mask = {which:'rest4840', dfile:'en1719_mask3_v2_K_rest4840_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4925' :  mask = {which:'rest4925', dfile:'en1719_mask3_v2_K_rest4925_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest4963' :  mask = {which:'rest4963', dfile:'en1719_mask3_v2_K_rest4963_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest5225' :  mask = {which:'rest5225', dfile:'en1719_mask3_v2_K_rest5225_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest5229' :  mask = {which:'rest5229', dfile:'en1719_mask3_v2_K_rest5229_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest5249' :  mask = {which:'rest5249', dfile:'en1719_mask3_v2_K_rest5249_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest864' :  mask = {which:'rest864', dfile:'en1719_mask3_v2_K_rest864_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
 
'rest910' :  mask = {which:'rest910', dfile:'en1719_mask3_v2_K_rest910_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
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
pro en1719_mask3_K_analyze, which, DRYRUN=dryrun, PYERR=pyerr, OPENPLOT=openplot
  
  ;;;;Must give "which" as a string array!!!
  indir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask2/2014jun14/K/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/EN1719_mask2/2014jun14/K/' ;
  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0       ;run program but don't write anything
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  IF which[0] EQ 'all' THEN which = ['cl10']
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN
     values = en1719_mask3_K_analyze_settings(which[zz])
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
  


