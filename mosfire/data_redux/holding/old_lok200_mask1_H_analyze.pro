;========================================================================================================================
function lok200_mask1_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'bsbsb11' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsb11_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb13' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsb13_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16100.0, lau:16700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb24' :  mask = {which:'bsbsb24', dfile:'LOK200_mask1_1.0_H_bsbsb24_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:1, $
                          guess:['redshift=1.656', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.650', 'REDSHIFT LT 1.660', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb26' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsb26_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16100.0, lau:16700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb36' :  mask = {which:'bsbsb36', dfile:'LOK200_mask1_1.0_H_bsbsb36_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16800.0, lau:17500.0, NOFITSKY:0, QFLAG:2, $
                          guess:['redshift=1.601', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.595', 'REDSHIFT LT 1.605', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb77' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsb77_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb78' :  mask = {which:'bsbsb78', dfile:'LOK200_mask1_1.0_H_bsbsb78_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:14700.0, lau:15400.0, NOFITSKY:0, QFLAG:2, $
                          guess:['redshift=1.260', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.255', 'REDSHIFT LT 1.265', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb81' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsb81_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb85' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsb85_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.606', 'sig=3.5', 'c1=0.9', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.600', 'REDSHIFT LT 1.610', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb89' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsb89_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb92' :  mask = {which:'bsbsb92', dfile:'LOK200_mask1_1.0_H_bsbsb92_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16600.0, lau:17300.0, NOFITSKY:0, QFLAG:1, $
                          guess:['redshift=1.555', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.548', 'REDSHIFT LT 1.558', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsr10' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsr10_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsr12' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsr12_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsr13' :  mask = {which:'bsbsr13', dfile:'LOK200_mask1_1.0_H_bsbsr13_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:1, $
                          guess:['redshift=1.663', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.658', 'REDSHIFT LT 1.668', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsr14' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsr14_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17200.0, lau:17900.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=1.702', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.698', 'REDSHIFT LT 1.708', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsr1' :  mask = {which:'bsbsr1', dfile:'LOK200_mask1_1.0_H_bsbsr1_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:15100.0, lau:15800.0, NOFITSKY:0, QFLAG:2, $
                         guess:['redshift=1.332', 'sig=6.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 1.325', 'REDSHIFT LT 1.335', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsr7' :  mask = {which:'bsbsr7', dfile:'LOK200_mask1_1.0_H_bsbsr7_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:17200.0, lau:17900.0, NOFITSKY:0, QFLAG:2, $
                         guess:['redshift=1.646', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 1.641', 'REDSHIFT LT 1.651', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsr8' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_bsbsr8_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                         guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb11' :  mask = {which:'fsbsb11', dfile:'LOK200_mask1_1.0_H_fsbsb11_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:15250.0, lau:15900.0, NOFITSKY:0, QFLAG:2, $
                          guess:['redshift=1.343', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.337', 'REDSHIFT LT 1.347', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb126' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsb126_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb132' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsb132_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb53' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsb53_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16350.0, lau:16950.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.520', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.515', 'REDSHIFT LT 1.525', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb59' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsb59_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb67' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsb67_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr17' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsr17_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr2' :  mask = {which:'fsbsr2', dfile:'LOK200_mask1_1.0_H_fsbsr2_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:15750.0, lau:16550.0, NOFITSKY:0, QFLAG:2, $
                         guess:['redshift=1.426', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 1.415', 'REDSHIFT LT 1.435', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr32' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsr32_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16500.0, lau:17200.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr35' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsr35_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:15750.0, lau:16400.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr37' :  mask = {which:'fsbsr37', dfile:'LOK200_mask1_1.0_H_fsbsr37_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:15400.0, lau:16100.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=1.362', 'sig=3.5', 'c1=1.5', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.355', 'REDSHIFT LT 1.365', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr52' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsr52_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr66' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsr66_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16900.0, lau:17500.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr6' :  mask = {which:'fsbsr6', dfile:'LOK200_mask1_1.0_H_fsbsr6_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:16500.0, lau:17200.0, NOFITSKY:0, QFLAG:3, $
                         guess:['redshift=1.533', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 1.527', 'REDSHIFT LT 1.537', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr71' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_fsbsr71_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17400.0, lau:17950.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.691', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.690', 'REDSHIFT LT 1.692', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc301' :  mask = {which:'sbsbc301', dfile:'LOK200_mask1_1.0_H_sbsbc301_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:16600.0, lau:17400.0, NOFITSKY:0, QFLAG:3, $
                           guess:['redshift=1.553', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.548', 'REDSHIFT LT 1.558', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc309' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_sbsbc309_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'unk1' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_unk1_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                       lal:15100.0, lau:15800.0, NOFITSKY:0, QFLAG:99, $
                       guess:['redshift=1.326', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                       priors:['REDSHIFT GT 1.321', 'REDSHIFT LT 1.631', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'unk2' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_unk2_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                       lal:15800.0, lau:16500.0, NOFITSKY:0, QFLAG:99, $
                       guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                       priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'unk3' :  mask = {which:'unk3', dfile:'LOK200_mask1_1.0_H_unk3_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                       lal:16300.0, lau:17000.0, NOFITSKY:0, QFLAG:2, $
                       guess:['redshift=1.512', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                       priors:['REDSHIFT GT 1.507', 'REDSHIFT LT 1.517', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'unk4' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_unk4_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                       lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                       guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                       priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'unk5' :  mask = {which:'null', dfile:'LOK200_mask1_1.0_H_unk5_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
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
pro lok200_mask1_H_analyze, which, DRYRUN=dryrun, PYERR=pyerr, OPENPLOT=openplot
  
  ;;;;Must give "which" as a string array!!!
  indir = '/Users/degroota/research/current2_mosfire2012nov28_lok200/LOK200_mask1_1.0/'  ;
  outdir = '/Users/degroota/research/current2_mosfire2012nov28_lok200/LOK200_mask1_1.0/' ;
  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0       ;run program but don't write anything
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  IF which[0] EQ 'all' THEN which = ['cl10']
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN
     values = lok200_mask1_H_analyze_settings(which[zz])
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
  


