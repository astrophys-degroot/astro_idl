;========================================================================================================================
function cdfs44_mask8_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUESS TO 0.0!!!
  
  CASE xwhich OF

     'pzhi26' :  spectrum = {which:'pzhi26', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16000.0, lau:16600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.460', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.455', 'REDSHIFT LT 1.465', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi33' :  spectrum = {which:'pzhi33', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17500.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.620', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.615', 'REDSHIFT LT 1.625', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi34' :  spectrum = {which:'pzhi34', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi37' :  spectrum = {which:'pzhi37', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16000.0, lau:16700.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.459', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.455', 'REDSHIFT LT 1.461', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi44' :  spectrum = {which:'pzhi44', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:17200.0, lau:17910.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.660', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.655', 'REDSHIFT LT 1.665', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi47' :  spectrum = {which:'pzhi47', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                             border:2, lal:16300.0, lau:16900.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.502', 'sig=3.5', 'c1=2.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.497', 'REDSHIFT LT 1.507', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi51' :  spectrum = {which:'pzhi51', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi55' :  spectrum = {which:'pzhi55', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16200.0, lau:16600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.495', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.490', 'REDSHIFT LT 1.500', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzhi61' :  spectrum = {which:'pzhi61', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed1273' :  spectrum = {which:'pzmed1273', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16400.0, lau:17100.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.525', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.520', 'REDSHIFT LT 1.530', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed300' :  spectrum = {which:'pzmed300', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.623', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.616', 'REDSHIFT LT 1.633', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed395' :  spectrum = {which:'pzmed395', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed417' :  spectrum = {which:'pzmed417', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:15200.0, lau:15800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.333', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'c5=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.328', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed483' :  spectrum = {which:'pzmed483', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.618', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed515' :  spectrum = {which:'pzmed515', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17600.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.606', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.601', 'REDSHIFT LT 1.611', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed517' :  spectrum = {which:'pzmed517', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed547' :  spectrum = {which:'pzmed547', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17600.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.606', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.601', 'REDSHIFT LT 1.611', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed557' :  spectrum = {which:'pzmed557', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15500.0, lau:16100.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.383', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.377', 'REDSHIFT LT 1.387', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed616' :  spectrum = {which:'pzmed616', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed620' :  spectrum = {which:'pzmed620', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:15500.0, lau:16100.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.380', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.375', 'REDSHIFT LT 1.385', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed622' :  spectrum = {which:'pzmed622', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed626' :  spectrum = {which:'pzmed626', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, QFLAG:-1, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed651' :  spectrum = {which:'pzmed651', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed671' :  spectrum = {which:'pzmed671', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed687' :  spectrum = {which:'pzmed687', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed698' :  spectrum = {which:'pzmed698', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed699' :  spectrum = {which:'pzmed699', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed706' :  spectrum = {which:'pzmed706', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.593', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.588', 'REDSHIFT LT 1.598', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed727' :  spectrum = {which:'pzmed727', basename:'cdfs44_mask8_v2_H', fitto:['OIIIr','OIIIb','Hb'], $
                               border:2, lal:15300.0, lau:16000.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=2.174', 'sig=3.5', 'c1=0.2', 'c2=0.3', 'c3=0.3', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.170', 'REDSHIFT LT 2.178', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed733' :  spectrum = {which:'pzmed733', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:16500.0, lau:17100.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.541', 'sig=3.5', 'c1=1.0', 'c2=0.40', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.536', 'REDSHIFT LT 1.546', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed761' :  spectrum = {which:'pzmed761', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15800.0, lau:16400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.425', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.420', 'REDSHIFT LT 1.430', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed819' :  spectrum = {which:'pzmed819', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:14900.0, lau:15500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.287', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.282', 'REDSHIFT LT 1.292', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'pzmed876' :  spectrum = {which:'pzmed876', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed933' :  spectrum = {which:'pzmed933', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed935' :  spectrum = {which:'pzmed935', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:14500.0, lau:15100.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.230', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.225', 'REDSHIFT LT 1.235', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmed955' :  spectrum = {which:'pzmed955', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'st18' :  spectrum = {which:'st18', basename:'cdfs44_mask8_v2_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=0.0001', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 0.00001', 'REDSHIFT LT 0.0002', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     

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

