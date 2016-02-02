;========================================================================================================================
function cdfs44_mask2_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'bcsbs103' :  spectrum = {which:'bcsbs103', dfile:'CDFS44_mask2_1.0_H_bcsbs103_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.493', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.488', 'REDSHIFT LT 1.498', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs117' :  spectrum = {which:'bcsbs117', dfile:'CDFS44_mask2_1.0_H_bcsbs117_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17200.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.582', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.577', 'REDSHIFT LT 1.587', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs154' :  spectrum = {which:'bcsbs154', dfile:'CDFS44_mask2_1.0_H_bcsbs154_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16300.0, lau:16900.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.570', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.565', 'REDSHIFT LT 1.575', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs162' :  spectrum = {which:'bcsbs162', dfile:'CDFS44_mask2_1.0_H_bcsbs162_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16800.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.481', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.476', 'REDSHIFT LT 1.486', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbs76' :  spectrum = {which:'bsbs76', dfile:'CDFS44_mask2_1.0_H_bsbs76_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15400.0, lau:15900.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.374', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.369', 'REDSHIFT LT 1.379', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl10' :  spectrum = {which:'cl10', dfile:'CDFS44_mask2_1.0_H_cl10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17350.0, QFLAG:2, NOFITSKY:0, $
                           guess:['redshift=1.6300', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.635', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl2' :  spectrum = {which:'cl2', dfile:'CDFS44_mask2_1.0_H_cl2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:16900.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                          guess:['redshift=1.62400', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.619', 'REDSHIFT LT 1.629', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
 
     'msbs10' :  spectrum = {which:'msbs10', dfile:'CDFS44_mask2_1.0_H_msbs10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16800.0, lau:17300.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.6185', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.613', 'REDSHIFT LT 1.623', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs198' :  spectrum = {which:'msbs198', dfile:'CDFS44_mask2_1.0_H_msbs198_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16100.0, lau:17000.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.505', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.510', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbs5' :  spectrum = {which:'msbs5', dfile:'CDFS44_mask2_1.0_H_msbs5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16600.0, lau:17200.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.556', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.551', 'REDSHIFT LT 1.561', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs7' :  spectrum = {which:'msbs7', dfile:'CDFS44_mask2_1.0_H_msbs7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:15100.0, lau:15700.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.334', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.329', 'REDSHIFT LT 1.339', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzbsbs40' :  spectrum = {which:'pzbsbs40', dfile:'CDFS44_mask2_1.0_H_pzbsbs40_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15000.0, lau:15600.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.332', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.327', 'REDSHIFT LT 1.337', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs42' :  spectrum = {which:'pzbsbs42', dfile:'CDFS44_mask2_1.0_H_pzbsbs42_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17375.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.620', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.615', 'REDSHIFT LT 1.625', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs130' :  spectrum = {which:'pzfsbs130', dfile:'CDFS44_mask2_1.0_H_pzfsbs130_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs155' :  spectrum = {which:'pzfsbs155', dfile:'CDFS44_mask2_1.0_H_pzfsbs155_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16200.0, lau:16800.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.495', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.490', 'REDSHIFT LT 1.500', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs166' :  spectrum = {which:'pzfsbs166', dfile:'CDFS44_mask2_1.0_H_pzfsbs166_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.62500', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.620', 'REDSHIFT LT 1.630', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs175' :  spectrum = {which:'pzfsbs175', dfile:'CDFS44_mask2_1.0_H_pzfsbs175_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16800.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                                guess:['redshift=1.576', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.571', 'REDSHIFT LT 1.581', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs76' :  spectrum = {which:'pzfsbs76', dfile:'CDFS44_mask2_1.0_H_pzfsbs76_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:18000.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.68600', 'sig=3.5', 'c1=0.2', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.68100', 'REDSHIFT LT 1.69100', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs100' :  spectrum = {which:'pzmsbs100', dfile:'CDFS44_mask2_1.0_H_pzmsbs100_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16000.0, lau:17000.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.525', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.520', 'REDSHIFT LT 1.530', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs32' :  spectrum = {which:'pzmsbs32', dfile:'CDFS44_mask2_1.0_H_pzmsbs32_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17700.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.659', 'sig=3.5', 'c1=0.4', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.653', 'REDSHIFT LT 1.663', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs41' :  spectrum = {which:'pzmsbs41', dfile:'CDFS44_mask2_1.0_H_pzmsbs41_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:18000.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.698', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.693', 'REDSHIFT LT 1.703', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
 
     'pzmsbs51' :  spectrum = {which:'pzmsbs51', dfile:'CDFS44_mask2_1.0_H_pzmsbs51_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17300.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs57' :  spectrum = {which:'pzmsbs57', dfile:'CDFS44_mask2_1.0_H_pzmsbs57_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs67' :  spectrum = {which:'pzmsbs67', dfile:'CDFS44_mask2_1.0_H_pzmsbs67_eps_1d_v10.fits', fitto:['Hb', 'OIIIr','OIIIb'], border:2, $
                               lal:16300.0, lau:17300.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=2.413', 'sig=3.5', 'c1=0.25', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.408', 'REDSHIFT LT 2.418', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs74' :  spectrum = {which:'pzmsbs74', dfile:'CDFS44_mask2_1.0_H_pzmsbs74_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17800.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.654', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.649', 'REDSHIFT LT 1.659', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs78' :  spectrum = {which:'pzmsbs78', dfile:'CDFS44_mask2_1.0_H_pzmsbs78_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16300.0, lau:16900.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.510', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.505', 'REDSHIFT LT 1.515', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs85' :  spectrum = {which:'pzmsbs85', dfile:'CDFS44_mask2_1.0_H_pzmsbs85_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15600.0, lau:16200.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.399', 'sig=3.5', 'c1=0.4', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.394', 'REDSHIFT LT 1.404', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs89' :  spectrum = {which:'pzmsbs89', dfile:'CDFS44_mask2_1.0_H_pzmsbs89_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16100.0, lau:16700.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.472', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.467', 'REDSHIFT LT 1.477', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs93' :  spectrum = {which:'pzmsbs93', dfile:'CDFS44_mask2_1.0_H_pzmsbs93_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17600.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.507', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.502', 'REDSHIFT LT 1.512', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs98' :  spectrum = {which:'pzmsbs98', dfile:'CDFS44_mask2_1.0_H_pzmsbs98_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17600.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.614', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.609', 'REDSHIFT LT 1.619', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
 


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
pro cdfs44_mask2_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = cdfs44_mask2_H_analyze_settings(which[zz])                                  ;get settings
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
  


