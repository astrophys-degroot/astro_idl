;========================================================================================================================
FUNCTION cdfs44_mask2_h_analyze_settings, xwhich
  
  ;;;;NEVER SET AN INITGSS VALUE TO 0.0!!!
  
  CASE xwhich OF
     'bcsbs103' :  spectrum = {which:'bcsbs103', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16100.0, lau:16700.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.493', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.488', 'REDSHIFT LT 1.498', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs117' :  spectrum = {which:'bcsbs117', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16500.0, lau:17200.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.582', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.577', 'REDSHIFT LT 1.587', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'bcsbs154' :  spectrum = {which:'bcsbs154', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16300.0, lau:16900.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.570', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.565', 'REDSHIFT LT 1.575', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'bcsbs162' :  spectrum = {which:'bcsbs162', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16100.0, lau:16800.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.481', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.476', 'REDSHIFT LT 1.486', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'bsbs76' :  spectrum = {which:'bsbs76', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:15400.0, lau:15900.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.3746', 'sig=3.5', 'c1=0.3', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.369', 'REDSHIFT LT 1.379', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl10' :  spectrum = {which:'cl10', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16900.0, lau:17350.0, ZQFLAG:2, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.6300', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.635', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl2' :  spectrum = {which:'cl2', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                          border:2, lal:16900.0, lau:17400.0, ZQFLAG:1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                          initgss:['redshift=1.62400', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.619', 'REDSHIFT LT 1.629', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs10' :  spectrum = {which:'msbs10', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16800.0, lau:17300.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.6185', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs198' :  spectrum = {which:'msbs198', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16100.0, lau:17000.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.505', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.510', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs5' :  spectrum = {which:'msbs5', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16600.0, lau:17200.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.556', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.551', 'REDSHIFT LT 1.561', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs7' :  spectrum = {which:'msbs7', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16700.0, lau:17400.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.604', 'sig=3.5', 'c1=0.3', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.600', 'REDSHIFT LT 1.608', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs40' :  spectrum = {which:'pzbsbs40', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15000.0, lau:15600.0, ZQFLAG:3, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.332', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.327', 'REDSHIFT LT 1.337', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs42' :  spectrum = {which:'pzbsbs42', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17375.0, ZQFLAG:3, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.620', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.615', 'REDSHIFT LT 1.625', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs130' :  spectrum = {which:'pzfsbs130', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2,  lal:16900.0, lau:17400.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs155' :  spectrum = {which:'pzfsbs155', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16200.0, lau:16800.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.495', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.490', 'REDSHIFT LT 1.500', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs166' :  spectrum = {which:'pzfsbs166', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16900.0, lau:17500.0, ZQFLAG:2, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.62500', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.620', 'REDSHIFT LT 1.630', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs175' :  spectrum = {which:'pzfsbs175', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16800.0, lau:17400.0, ZQFLAG:0, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.576', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.571', 'REDSHIFT LT 1.581', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs76' :  spectrum = {which:'pzfsbs76', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17400.0, lau:18000.0, ZQFLAG:3, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.68600', 'sig=3.5', 'c1=0.2', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.68100', 'REDSHIFT LT 1.69100', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs100' :  spectrum = {which:'pzmsbs100', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                                border:2, lal:16000.0, lau:17000.0, ZQFLAG:3, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                                initgss:['redshift=1.525', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.520', 'REDSHIFT LT 1.530', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs32' :  spectrum = {which:'pzmsbs32', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17200.0, lau:17700.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.659', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.653', 'REDSHIFT LT 1.663', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs41' :  spectrum = {which:'pzmsbs41', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17400.0, lau:18000.0, ZQFLAG:0, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.698', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.693', 'REDSHIFT LT 1.703', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs51' :  spectrum = {which:'pzmsbs51', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16600.0, lau:17300.0, ZQFLAG:3, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs57' :  spectrum = {which:'pzmsbs57', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs67' :  spectrum = {which:'pzmsbs67', basename:'CDFS44_mask2_1.0_H', fitto:['Hb', 'OIIIr','OIIIb'], $
                               border:2, lal:16300.0, lau:17300.0, ZQFLAG:3, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=2.413', 'sig=3.5', 'c1=0.25', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.408', 'REDSHIFT LT 2.418', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs74' :  spectrum = {which:'pzmsbs74', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17200.0, lau:17800.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.654', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.649', 'REDSHIFT LT 1.659', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs78' :  spectrum = {which:'pzmsbs78', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16300.0, lau:16900.0, ZQFLAG:0, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.510', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.505', 'REDSHIFT LT 1.515', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs85' :  spectrum = {which:'pzmsbs85', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:15600.0, lau:16200.0, ZQFLAG:3, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.399', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.394', 'REDSHIFT LT 1.404', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs89' :  spectrum = {which:'pzmsbs89', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16100.0, lau:16700.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.472', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.467', 'REDSHIFT LT 1.477', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs93' :  spectrum = {which:'pzmsbs93', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17600.0, ZQFLAG:-1, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.507', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.502', 'REDSHIFT LT 1.512', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 
     'pzmsbs98' :  spectrum = {which:'pzmsbs98', basename:'CDFS44_mask2_1.0_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17000.0, lau:17600.0, ZQFLAG:3, NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.614', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.609', 'REDSHIFT LT 1.619', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
 


     ELSE : BEGIN
        print, 'WARNING!! Choice not found'
        stop
     END 
  ENDCASE
  
  chk = where(spectrum.which EQ xwhich)
  IF chk NE -1 THEN values = spectrum[chk] ELSE BEGIN
     print, 'This detection tag not found: ', xwhich
     print, ' Skipping....'
     values = {which:'-1', NEWVER:'v1-2'}
  ENDELSE
  
  RETURN, values
END
;========================================================================================================================
  


