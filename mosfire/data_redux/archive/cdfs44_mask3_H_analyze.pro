;========================================================================================================================
function cdfs44_mask3_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'bcsbs12' :  spectrum = {which:'bcsbs12', dfile:'CDFS44_mask3_1.0_H_bcsbs12_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.604', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.599', 'REDSHIFT LT 1.609', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bcsbs28' :  spectrum = {which:'bcsbs28', dfile:'CDFS44_mask3_1.0_H_bcsbs28_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'bcsbs51' :  spectrum = {which:'bcsbs51', dfile:'CDFS44_mask3_1.0_H_bcsbs51_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16600.0, lau:17200.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.545', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.540', 'REDSHIFT LT 1.550', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbs1' :  spectrum = {which:'bsbs1', dfile:'CDFS44_mask3_1.0_H_bsbs1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:17200.0, lau:17800.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.654', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.649', 'REDSHIFT LT 1.659', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbs62' :  spectrum = {which:'bsbs62', dfile:'CDFS44_mask3_1.0_H_bsbs62_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16300.0, lau:16900.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.505', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.500', 'REDSHIFT LT 1.510', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl11' :  spectrum = {which:'cl11', dfile:'CDFS44_mask3_1.0_H_cl11_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                           guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs140' :  spectrum = {which:'msbs140', dfile:'CDFS44_mask3_1.0_H_msbs140_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs144' :  spectrum = {which:'msbs144', dfile:'CDFS44_mask3_1.0_H_msbs144_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16400.0, lau:17000.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.526', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.520', 'REDSHIFT LT 1.530', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs165' :  spectrum = {which:'msbs165', dfile:'CDFS44_mask3_1.0_H_msbs165_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15800.0, lau:16400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.425', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.420', 'REDSHIFT LT 1.430', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs2' :  spectrum = {which:'msbs2', dfile:'CDFS44_mask3_1.0_H_msbs2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:17400.0, lau:18000.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.673', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.668', 'REDSHIFT LT 1.678', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'nby8' :  spectrum = {which:'nby8', dfile:'CDFS44_mask3_1.0_H_nby8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                           guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs0' :  spectrum = {which:'pzbsbs0', dfile:'CDFS44_mask3_1.0_H_pzbsbs0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16200.0, lau:16800.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.492', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.487', 'REDSHIFT LT 1.497', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs10' :  spectrum = {which:'pzbsbs10', dfile:'CDFS44_mask3_1.0_H_pzbsbs10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17300.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.597', 'sig=3.5', 'c1=0.3', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.592', 'REDSHIFT LT 1.602', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs13' :  spectrum = {which:'pzbsbs13', dfile:'CDFS44_mask3_1.0_H_pzbsbs13_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15000.0, lau:15500.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.308', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.303', 'REDSHIFT LT 1.313', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs14' :  spectrum = {which:'pzbsbs14', dfile:'CDFS44_mask3_1.0_H_pzbsbs14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17500.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.593', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.588', 'REDSHIFT LT 1.598', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs4' :  spectrum = {which:'pzbsbs4', dfile:'CDFS44_mask3_1.0_H_pzbsbs4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr', 'SIIb'], border:2, $
                              lal:15300.0, lau:16500.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.431', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.10', 'c5=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.426', 'REDSHIFT LT 1.436', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzbsbs6' :  spectrum = {which:'pzbsbs6', dfile:'CDFS44_mask3_1.0_H_pzbsbs6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17500.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.624', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.619', 'REDSHIFT LT 1.629', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs7' :  spectrum = {which:'pzbsbs7', dfile:'CDFS44_mask3_1.0_H_pzbsbs7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15800.0, lau:16400.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.424', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.419', 'REDSHIFT LT 1.429', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs8' :  spectrum = {which:'pzbsbs8', dfile:'CDFS44_mask3_1.0_H_pzbsbs8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16700.0, lau:17300.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.569', 'sig=3.5', 'c1=0.25', 'c2=0.10', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.564', 'REDSHIFT LT 1.574', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs37' :  spectrum = {which:'pzfsbs37', dfile:'CDFS44_mask3_1.0_H_pzfsbs37_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17800.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.657', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.652', 'REDSHIFT LT 1.657', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs51' :  spectrum = {which:'pzfsbs51', dfile:'CDFS44_mask3_1.0_H_pzfsbs51_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs57' :  spectrum = {which:'pzfsbs57', dfile:'CDFS44_mask3_1.0_H_pzfsbs57_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs95' :  spectrum = {which:'pzfsbs95', dfile:'CDFS44_mask3_1.0_H_pzfsbs95_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15400.0, lau:15800.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.389', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.384', 'REDSHIFT LT 1.394', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs13' :  spectrum = {which:'pzmsbs13', dfile:'CDFS44_mask3_1.0_H_pzmsbs13_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15600.0, lau:16200.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.401', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.396', 'REDSHIFT LT 1.416', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs19' :  spectrum = {which:'pzmsbs19', dfile:'CDFS44_mask3_1.0_H_pzmsbs19_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs25' :  spectrum = {which:'pzmsbs25', dfile:'CDFS44_mask3_1.0_H_pzmsbs25_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs26' :  spectrum = {which:'pzmsbs26', dfile:'CDFS44_mask3_1.0_H_pzmsbs26_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16500.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.611', 'sig=3.5', 'c1=0.5', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs27' :  spectrum = {which:'pzmsbs27', dfile:'CDFS44_mask3_1.0_H_pzmsbs27_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.611', 'sig=3.5', 'c1=0.25', 'c2=0.1', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs33' :  spectrum = {which:'pzmsbs33', dfile:'CDFS44_mask3_1.0_H_pzmsbs33_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17500.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.604', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.600', 'REDSHIFT LT 1.610', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs4' :  spectrum = {which:'pzmsbs4', dfile:'CDFS44_mask3_1.0_H_pzmsbs4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs6' :  spectrum = {which:'pzmsbs6', dfile:'CDFS44_mask3_1.0_H_pzmsbs6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 



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
pro cdfs44_mask3_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = cdfs44_mask3_H_analyze_settings(which[zz])                                  ;get settings
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
  


