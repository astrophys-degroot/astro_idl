;========================================================================================================================
function lok200_mask1_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;;Guesses listed first take precendence
  ;;;;Must give "which" as a string array!!!

  
  CASE xwhich OF
     'bsbsb11' :  spectrum = {which:'bsbsb11', dfile:'LOK200_mask1_1.0_H_bsbsb11_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15100.0, lau:15700.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.325', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.320', 'REDSHIFT LT 1.330', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bsbsb13' :  spectrum = {which:'bsbsb13', dfile:'LOK200_mask1_1.0_H_bsbsb13_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsb24' :  spectrum = {which:'bsbsb24', dfile:'LOK200_mask1_1.0_H_bsbsb24_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17100.0, lau:17700.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.656', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.651', 'REDSHIFT LT 1.661', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsb26' :  spectrum = {which:'bsbsb26', dfile:'LOK200_mask1_1.0_H_bsbsb26_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], border:2, $
                              lal:17500.0, lau:18100.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.706', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.701', 'REDSHIFT LT 1.711', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'bsbsb36' :  spectrum = {which:'bsbsb36', dfile:'LOK200_mask1_1.0_H_bsbsb36_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsb77' :  spectrum = {which:'bsbsb77', dfile:'LOK200_mask1_1.0_H_bsbsb77_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsb78' :  spectrum = {which:'bsbsb78', dfile:'LOK200_mask1_1.0_H_bsbsb78_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:14600.0, lau:15200.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.262', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.257', 'REDSHIFT LT 1.267', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bsbsb81' :  spectrum = {which:'bsbsb81', dfile:'LOK200_mask1_1.0_H_bsbsb81_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsb85' :  spectrum = {which:'bsbsb85', dfile:'LOK200_mask1_1.0_H_bsbsb85_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsb89' :  spectrum = {which:'bsbsb89', dfile:'LOK200_mask1_1.0_H_bsbsb89_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsb92' :  spectrum = {which:'bsbsb92', dfile:'LOK200_mask1_1.0_H_bsbsb92_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16600.0, lau:17200.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.555', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.550', 'REDSHIFT LT 1.560', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsr10' :  spectrum = {which:'bsbsr10', dfile:'LOK200_mask1_1.0_H_bsbsr10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsr12' :  spectrum = {which:'bsbsr12', dfile:'LOK200_mask1_1.0_H_bsbsr12_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bsbsr13' :  spectrum = {which:'bsbsr13', dfile:'LOK200_mask1_1.0_H_bsbsr13_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17200.0, lau:17800.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.664', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.659', 'REDSHIFT LT 1.669', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsr14' :  spectrum = {which:'bsbsr14', dfile:'LOK200_mask1_1.0_H_bsbsr14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:99, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
 
     'bsbsr1' :  spectrum = {which:'bsbsr1', dfile:'LOK200_mask1_1.0_H_bsbsr1_eps_1d_v10.fits', fitto:['OIIIr', 'OIIIb', 'Hb'], border:2, $
                             lal:14900.0, lau:15500.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=2.058', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.053', 'REDSHIFT LT 2.063', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'bsbsr7' :  spectrum = {which:'bsbsr7', dfile:'LOK200_mask1_1.0_H_bsbsr7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:17200.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.647', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.642', 'REDSHIFT LT 1.652', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsr8' :  spectrum = {which:'bsbsr8', dfile:'LOK200_mask1_1.0_H_bsbsr8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsb11' :  spectrum = {which:'fsbsb11', dfile:'LOK200_mask1_1.0_H_fsbsb11_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                              lal:15200.0, lau:15800.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=2.073', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 2.068', 'REDSHIFT LT 2.078', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsb126' :  spectrum = {which:'fsbsb126', dfile:'LOK200_mask1_1.0_H_fsbsb126_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                               lal:15100.0, lau:15700.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=2.064', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.059', 'REDSHIFT LT 2.069', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsb132' :  spectrum = {which:'fsbsb132', dfile:'LOK200_mask1_1.0_H_fsbsb132_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15700.0, lau:16300.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.428', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.423', 'REDSHIFT LT 1.433', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsb53' :  spectrum = {which:'fsbsb53', dfile:'LOK200_mask1_1.0_H_fsbsb53_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16400.0, lau:17000.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.519', 'sig=3.5', 'c1=0.7', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.514', 'REDSHIFT LT 1.524', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsb59' :  spectrum = {which:'fsbsb59', dfile:'LOK200_mask1_1.0_H_fsbsb59_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsb67' :  spectrum = {which:'fsbsb67', dfile:'LOK200_mask1_1.0_H_fsbsb67_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsr17' :  spectrum = {which:'fsbsr17', dfile:'LOK200_mask1_1.0_H_fsbsr17_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr2' :  spectrum = {which:'fsbsr2', dfile:'LOK200_mask1_1.0_H_fsbsr2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15800.0, lau:16400.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.426', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.424', 'REDSHIFT LT 1.434', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsr32' :  spectrum = {which:'fsbsr32', dfile:'LOK200_mask1_1.0_H_fsbsr32_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr35' :  spectrum = {which:'fsbsr35', dfile:'LOK200_mask1_1.0_H_fsbsr35_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr37' :  spectrum = {which:'fsbsr37', dfile:'LOK200_mask1_1.0_H_fsbsr37_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15300.0, lau:15900.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.362', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.356', 'REDSHIFT LT 1.366', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr52' :  spectrum = {which:'fsbsr52', dfile:'LOK200_mask1_1.0_H_fsbsr52_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr66' :  spectrum = {which:'fsbsr66', dfile:'LOK200_mask1_1.0_H_fsbsr66_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15900.0, lau:16300.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr6' :  spectrum = {which:'fsbsr6', dfile:'LOK200_mask1_1.0_H_fsbsr6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr71' :  spectrum = {which:'fsbsr71', dfile:'LOK200_mask1_1.0_H_fsbsr71_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'sbsbc301' :  spectrum = {which:'sbsbc301', dfile:'LOK200_mask1_1.0_H_sbsbc301_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                               lal:14850.0, lau:15450.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=2.068', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.063', 'REDSHIFT LT 2.073', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'sbsbc309' :  spectrum = {which:'sbsbc309', dfile:'LOK200_mask1_1.0_H_sbsbc309_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17300.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.558', 'sig=3.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.553', 'REDSHIFT LT 1.563', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}

     ELSE : BEGIN
        print, 'WARNING!! Choice not found'
        stop
     END 
  ENDCASE
  
  chk = where(spectrum.which EQ xwhich)
  IF chk NE -1 THEN values = spectrum[chk] ELSE BEGIN
     print, 'This detection tag not found: ', xwhich
     print, ' Skipping....'
     values = {which:'-1'}
  ENDELSE
  
  RETURN, values
END
;========================================================================================================================



;========================================================================================================================
pro lok200_mask1_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask1_1.0/2012nov25/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask1_1.0/2012nov25/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                      ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                             ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = lok200_mask1_H_analyze_settings(which[zz])                                  ;get settings
     IF values.which NE '-1' THEN BEGIN                                                   ;check settings were found
        IF tag_exist(values, 'priors') EQ 1 THEN priors = values.priors ELSE priors = 0   ;if optional parameters given
        IF tag_exist(values, 'xwhich') EQ 1 THEN xwhich = values.xwhich ELSE xwhich = 0   ;check if tag exists
        mosfire_1dspec_analyze, values.dfile, values.which, XWHICH=xwhich, PYERR=pyerr, $ ;call routine
                                FITTO=values.fitto, BORDER=values.border, $
                                LLOWER=values.lal, LUPPER=values.lau, $
                                NOFITSKY=values.nofitsky, CHKVALS=values.guess, $
                                PRIORS=priors, DRYRUN=dryrun, QFLAG=values.qflag, $
                                OPENPLOT=openplot, OPENFITS=values.openfits, INDIR=indir, OUTDIR=outdir
     ENDIF
  ENDFOR                        ;end loop over which elements
  
END	
;========================================================================================================================
  

