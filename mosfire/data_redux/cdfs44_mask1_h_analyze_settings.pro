;========================================================================================================================
FUNCTION cdfs44_mask1_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'bcsbs109' :  spectrum = {which:'bcsbs109', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17500.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs113' :  spectrum = {which:'bcsbs113', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17300.0, lau:18100.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.699', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.694', 'REDSHIFT LT 1.704', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs37' :  spectrum = {which:'bcsbs37', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16800.0, lau:17350.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                              initgss:['redshift=1.616', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.611', 'REDSHIFT LT 1.621', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs69' :  spectrum = {which:'bcsbs69', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:15800.0, lau:16400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                              initgss:['redshift=1.442', 'sig=3.5', 'c1=0.75', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.432', 'REDSHIFT LT 1.452', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'bcsbs78' :  spectrum = {which:'bcsbs78', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16100.0, lau:16700.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                              initgss:['redshift=1.477', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.4270', 'REDSHIFT LT 1.527', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'bsbs2' :  spectrum = {which:'bsbs2', basename:'CDFS44_mask1_1.0_H', fitto:['Ha'], $
                            border:2, lal:16700.0, lau:17400.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                            initgss:['redshift=1.57000', 'sig=3.5', 'c1=1.0', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.5650', 'REDSHIFT LT 1.5750', 'SIG1 GT 0.0', 'C1 GT 0.0'], NEWVER:'v1-2'}

     'bsbs66' :  spectrum = {which:'bsbs66', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:14900.0, lau:15400.0, ZQFLAG:'2', NOFITSKY:0,  OPENFITS:0, DRYRUN:0, $
                             initgss:['redshift=1.288', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.238', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl12' :  spectrum = {which:'cl12', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16800.0, lau:17300.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                           initgss:['redshift=1.620', 'sig=2.5', 'c1=3.3', 'c2=1.2', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.615', 'REDSHIFT LT 1.625', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'cl1' :  spectrum = {which:'cl1', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:16900.0, lau:17700.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.6290', 'sig=3.5', 'c1=0.5', 'c2=0.35', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.6240', 'REDSHIFT LT 1.6340', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'cl3' :  spectrum = {which:'cl3', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                          border:2, lal:17000.0, lau:17700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.626', 'sig=2.5', 'c1=0.75', 'c2=0.4', 'c4=0.2', 'c5=0.2', 'x0=0.4', 'x1=-0.0005' ], $
                          priors:['REDSHIFT GT 1.620', 'REDSHIFT LT 1.632', 'SIG1 LT 4.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
  
     'cl4' :  spectrum = {which:'cl4', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:16900.0, lau:17400.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.62100', 'sig=3.5', 'c1=0.75', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.62600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl5' :  spectrum = {which:'cl5', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIb'], $
                          border:2, lal:16900.0, lau:17675.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.62700', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.622', 'REDSHIFT LT 1.632', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0'], NEWVER:'v1-2'}
  
     'cl6' :  spectrum = {which:'cl6',  basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                          border:2, lal:16900.0, lau:17600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.60600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.30', 'c5=0.30', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.60100', 'REDSHIFT LT 1.61100', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
 
     'cl7' :  spectrum = {which:'cl7', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:17000.0, lau:17600.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.6320', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.6270', 'REDSHIFT LT 1.63700', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl8' :  spectrum = {which:'cl8', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:15200.0, lau:15700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.347', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.342', 'REDSHIFT LT 1.352', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl9' :  spectrum = {which:'cl9', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:15400.0, lau:16100.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                          initgss:['redshift=1.396', 'sig=3.5', 'c1=0.40', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.391', 'REDSHIFT LT 1.401', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs3' :  spectrum = {which:'msbs3', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16100.0, lau:16900.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                            initgss:['redshift=1.517', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.512', 'REDSHIFT LT 1.522', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'nby6' :  spectrum = {which:'nby6', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                           border:2, lal:15900.0, lau:16600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                           initgss:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}

     'pzbsbs25' :  spectrum = {which:'pzbsbs25', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                               border:2, lal:15900.0, lau:16600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.432', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.427', 'REDSHIFT LT 1.437', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs30' :  spectrum = {which:'pzbsbs30', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], $
                               border:2, lal:15900.0, lau:16600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.459', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.454', 'REDSHIFT LT 1.464', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs31' :  spectrum = {which:'pzbsbs31', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17200.0, lau:17900.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.635', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs115' :  spectrum = {which:'pzfsbs115', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16100.0, lau:16700.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.488', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.483', 'REDSHIFT LT 1.493', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs134' :  spectrum = {which:'pzfsbs134', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16500.0, lau:17100.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                                initgss:['redshift=1.538', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.533', 'REDSHIFT LT 1.543', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs64' :  spectrum = {which:'pzfsbs64', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs87' :  spectrum = {which:'pzfsbs87', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.60600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.60100', 'REDSHIFT LT 1.61100', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs22' :  spectrum = {which:'pzmsbs22', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.619', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.614', 'REDSHIFT LT 1.624', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs23' :  spectrum = {which:'pzmsbs23', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:16500.0, lau:17200.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.536', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.30', 'c5=0.30', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs28' :  spectrum = {which:'pzmsbs28', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16500.0, lau:17100.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.534', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.531', 'REDSHIFT LT 1.541', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs31' :  spectrum = {which:'pzmsbs31', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17200.0, lau:17750.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.661', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.656', 'REDSHIFT LT 1.667', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
    
     'pzmsbs34' :  spectrum = {which:'pzmsbs34', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16200.0, lau:17000.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.503', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.508', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
    
     'pzmsbs38' :  spectrum = {which:'pzmsbs38', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16500.0, lau:17100.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.548', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.543', 'REDSHIFT LT 1.553', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs43' :  spectrum = {which:'pzmsbs43', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16400.0, lau:17000.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.540', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.535', 'REDSHIFT LT 1.545', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs44' :  spectrum = {which:'pzmsbs44', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16100.0, lau:16700.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.488', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.483', 'REDSHIFT LT 1.493', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'pzmsbs46' :  spectrum = {which:'pzmsbs46', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:17000.0, lau:17600.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.614', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.609', 'REDSHIFT LT 1.619', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}

     'pzmsbs56' :  spectrum = {which:'pzmsbs56', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15000.0, lau:15500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.310', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.305', 'REDSHIFT LT 1.315', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs60' :  spectrum = {which:'pzmsbs60', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15400.0, lau:15900.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.380', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.375', 'REDSHIFT LT 1.385', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}

     'pzmsbs70' :  spectrum = {which:'pzmsbs70', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:16100.0, lau:16800.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.479', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.474', 'REDSHIFT LT 1.484', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs72' :  spectrum = {which:'pzmsbs72', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], $
                               border:2, lal:15100.0, lau:15800.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.333', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.328', 'REDSHIFT LT 1.338', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}

     'pzmsbs76' :  spectrum = {which:'pzmsbs76', basename:'CDFS44_mask1_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17400.0, lau:18100.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
                               initgss:['redshift=1.698', 'sig=3.5', 'c1=0.2', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.693', 'REDSHIFT LT 1.703', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
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


