;========================================================================================================================
function cdfs44_mask8_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF

     'pzhi26' :  spectrum = {which:'pzhi26', dfile:'cdfs44_mask8_v2_H_pzhi26_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16000.0, lau:16600.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.460', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.455', 'REDSHIFT LT 1.465', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi33' :  spectrum = {which:'pzhi33', dfile:'cdfs44_mask8_v2_H_pzhi33_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.620', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.615', 'REDSHIFT LT 1.625', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi34' :  spectrum = {which:'pzhi34', dfile:'cdfs44_mask8_v2_H_pzhi34_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi37' :  spectrum = {which:'pzhi37', dfile:'cdfs44_mask8_v2_H_pzhi37_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16000.0, lau:16600.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.459', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.455', 'REDSHIFT LT 1.461', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi44' :  spectrum = {which:'pzhi44', dfile:'cdfs44_mask8_v2_H_pzhi44_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], border:2, $
                             lal:17200.0, lau:17910.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=1.660', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.655', 'REDSHIFT LT 1.665', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzhi47' :  spectrum = {which:'pzhi47', dfile:'cdfs44_mask8_v2_H_pzhi47_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16300.0, lau:16900.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.502', 'sig=3.5', 'c1=2.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.497', 'REDSHIFT LT 1.507', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi51' :  spectrum = {which:'pzhi51', dfile:'cdfs44_mask8_v2_H_pzhi51_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi55' :  spectrum = {which:'pzhi55', dfile:'cdfs44_mask8_v2_H_pzhi55_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16200.0, lau:16600.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=1.495', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.490', 'REDSHIFT LT 1.500', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi61' :  spectrum = {which:'pzhi61', dfile:'cdfs44_mask8_v2_H_pzhi61_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed1273' :  spectrum = {which:'pzmed1273', dfile:'cdfs44_mask8_v2_H_pzmed1273_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16400.0, lau:17000.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.525', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.520', 'REDSHIFT LT 1.530', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed300' :  spectrum = {which:'pzmed300', dfile:'cdfs44_mask8_v2_H_pzmed300_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17600.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.623', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.633', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed395' :  spectrum = {which:'pzmed395', dfile:'cdfs44_mask8_v2_H_pzmed395_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed417' :  spectrum = {which:'pzmed417', dfile:'cdfs44_mask8_v2_H_pzmed417_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], border:2, $
                               lal:15200.0, lau:15800.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.333', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.328', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzmed483' :  spectrum = {which:'pzmed483', dfile:'cdfs44_mask8_v2_H_pzmed483_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.618', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed515' :  spectrum = {which:'pzmed515', dfile:'cdfs44_mask8_v2_H_pzmed515_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17600.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.606', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.601', 'REDSHIFT LT 1.611', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed517' :  spectrum = {which:'pzmed517', dfile:'cdfs44_mask8_v2_H_pzmed517_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed547' :  spectrum = {which:'pzmed547', dfile:'cdfs44_mask8_v2_H_pzmed547_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17600.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.606', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.601', 'REDSHIFT LT 1.611', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed557' :  spectrum = {which:'pzmed557', dfile:'cdfs44_mask8_v2_H_pzmed557_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15500.0, lau:16100.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.383', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.377', 'REDSHIFT LT 1.387', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed616' :  spectrum = {which:'pzmed616', dfile:'cdfs44_mask8_v2_H_pzmed616_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed620' :  spectrum = {which:'pzmed620', dfile:'cdfs44_mask8_v2_H_pzmed620_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15500.0, lau:16100.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.380', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.375', 'REDSHIFT LT 1.385', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed622' :  spectrum = {which:'pzmed622', dfile:'cdfs44_mask8_v2_H_pzmed622_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed626' :  spectrum = {which:'pzmed626', dfile:'cdfs44_mask8_v2_H_pzmed626_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed651' :  spectrum = {which:'pzmed651', dfile:'cdfs44_mask8_v2_H_pzmed651_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed671' :  spectrum = {which:'pzmed671', dfile:'cdfs44_mask8_v2_H_pzmed671_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed687' :  spectrum = {which:'pzmed687', dfile:'cdfs44_mask8_v2_H_pzmed687_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed698' :  spectrum = {which:'pzmed698', dfile:'cdfs44_mask8_v2_H_pzmed698_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed699' :  spectrum = {which:'pzmed699', dfile:'cdfs44_mask8_v2_H_pzmed699_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed706' :  spectrum = {which:'pzmed706', dfile:'cdfs44_mask8_v2_H_pzmed706_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.593', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.588', 'REDSHIFT LT 1.598', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed727' :  spectrum = {which:'pzmed727', dfile:'cdfs44_mask8_v2_H_pzmed727_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15300.0, lau:15900.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.352', 'sig=3.5', 'c1=0.2', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.347', 'REDSHIFT LT 1.357', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed733' :  spectrum = {which:'pzmed733', dfile:'cdfs44_mask8_v2_H_pzmed733_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17100.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.541', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.536', 'REDSHIFT LT 1.546', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed761' :  spectrum = {which:'pzmed761', dfile:'cdfs44_mask8_v2_H_pzmed761_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15800.0, lau:16400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.425', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.420', 'REDSHIFT LT 1.430', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed819' :  spectrum = {which:'pzmed819', dfile:'cdfs44_mask8_v2_H_pzmed819_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:14900.0, lau:15500.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.287', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.282', 'REDSHIFT LT 1.292', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}

     'pzmed876' :  spectrum = {which:'pzmed876', dfile:'cdfs44_mask8_v2_H_pzmed876_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed933' :  spectrum = {which:'pzmed933', dfile:'cdfs44_mask8_v2_H_pzmed933_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed935' :  spectrum = {which:'pzmed935', dfile:'cdfs44_mask8_v2_H_pzmed935_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:14500.0, lau:15100.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.230', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.225', 'REDSHIFT LT 1.235', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed955' :  spectrum = {which:'pzmed955', dfile:'cdfs44_mask8_v2_H_pzmed955_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'st18' :  spectrum = {which:'st18', dfile:'cdfs44_mask8_v2_H_st18_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17400.0, QFLAG:99, NOFITSKY:0, $
                           guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
     



 

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
pro cdfs44_mask8_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = ''                                                   ;
  outdir = indir                                               ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['HEY']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = cdfs44_mask8_H_analyze_settings(which[zz])                                  ;get settings
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
  


