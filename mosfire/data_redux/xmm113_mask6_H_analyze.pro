;========================================================================================================================
function xmm113_mask6_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;Guesses listed first take precendence
  
  CASE xwhich OF

     'cl11' :  spectrum = {which:'cl11', dfile:'XMM113_mask6_H_cl11_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr', 'SIIb'], border:2, $
                           lal:17000.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                           guess:['redshift=1.628', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.623', 'REDSHIFT LT 1.633', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'cl1' :  spectrum = {which:'cl1', dfile:'XMM113_mask6_H_cl1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                          lal:17000.0, lau:17650.0, QFLAG:3, NOFITSKY:0, $
                          guess:['redshift=1.635', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.8', 'x1=-0.001' ], $
                          priors:['REDSHIFT GT 1.630', 'REDSHIFT LT 1.640', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl3' :  spectrum = {which:'cl3', dfile:'XMM113_mask6_H_cl3_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                          lal:14500.0, lau:15400.0, QFLAG:1, NOFITSKY:0, $
                          guess:['redshift=2.046', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 2.041', 'REDSHIFT LT 2.051', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'msbs17' :  spectrum = {which:'msbs17', dfile:'XMM113_mask6_H_msbs17_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs310' :  spectrum = {which:'msbs310', dfile:'XMM113_mask6_H_msbs310_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:14700.0, lau:15300.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.288', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.283', 'REDSHIFT LT 1.293', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs320' :  spectrum = {which:'msbs320', dfile:'XMM113_mask6_H_msbs320_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs335' :  spectrum = {which:'msbs335', dfile:'XMM113_mask6_H_msbs335_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16400.0, lau:17000.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.533', 'sig=3.5', 'c1=0.5', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.528', 'REDSHIFT LT 1.538', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'nby0' :  spectrum = {which:'nby0', dfile:'XMM113_mask6_H_nby0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16600.0, lau:17000.0, QFLAG:-1, NOFITSKY:0, $
                           guess:['redshift=1.563', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.558', 'REDSHIFT LT 1.568', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'new3' :  spectrum = {which:'new3', dfile:'XMM113_mask6_H_new3_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                           guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd14' :  spectrum = {which:'pzadd14', dfile:'XMM113_mask6_H_pzadd14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16700.0, lau:17300.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.587', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.582', 'REDSHIFT LT 1.592', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd18' :  spectrum = {which:'pzadd18', dfile:'XMM113_mask6_H_pzadd18_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], border:2, $
                              lal:16200.0, lau:17000.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.520', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.515', 'REDSHIFT LT 1.525', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzadd23' :  spectrum = {which:'pzadd23', dfile:'XMM113_mask6_H_pzadd23_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16600.0, lau:17200.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.556', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.551', 'REDSHIFT LT 1.561', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzadd34' :  spectrum = {which:'pzadd34', dfile:'XMM113_mask6_H_pzadd34_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd72' :  spectrum = {which:'pzadd72', dfile:'XMM113_mask6_H_pzadd72_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], border:2, $
                              lal:16700.0, lau:17500.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     
     'pzadd77' :  spectrum = {which:'pzadd77', dfile:'XMM113_mask6_H_pzadd77_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb','SIIr','SIIb'], border:2, $
                              lal:17000.0, lau:17800.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.611', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzadd7' :  spectrum = {which:'pzadd7', dfile:'XMM113_mask6_H_pzadd7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd86' :  spectrum = {which:'pzadd86', dfile:'XMM113_mask6_H_pzadd86_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17700.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.611', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd8' :  spectrum = {which:'pzadd8', dfile:'XMM113_mask6_H_pzadd8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd90' :  spectrum = {which:'pzadd90', dfile:'XMM113_mask6_H_pzadd90_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzbsbs1' :  spectrum = {which:'pzbsbs1', dfile:'XMM113_mask6_H_pzbsbs1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs3' :  spectrum = {which:'pzbsbs3', dfile:'XMM113_mask6_H_pzbsbs3_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:14500.0, lau:15100.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.237', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.232', 'REDSHIFT LT 1.242', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzfsbs26' :  spectrum = {which:'pzfsbs26', dfile:'XMM113_mask6_H_pzfsbs26_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16600.0, lau:17200.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.555', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.550', 'REDSHIFT LT 1.560', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs5' :  spectrum = {which:'pzfsbs5', dfile:'XMM113_mask6_H_pzfsbs5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], border:2, $
                              lal:16600.0, lau:17400.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'pzj4745' :  spectrum = {which:'pzj4745', dfile:'XMM113_mask6_H_pzj4745_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16600.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.571', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.566', 'REDSHIFT LT 1.576', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs101' :  spectrum = {which:'pzmsbs101', dfile:'XMM113_mask6_H_pzmsbs101_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                                guess:['redshift=1.611', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs88' :  spectrum = {which:'pzmsbs88', dfile:'XMM113_mask6_H_pzmsbs88_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.633', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.628', 'REDSHIFT LT 1.638', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs8' :  spectrum = {which:'pzmsbs8', dfile:'XMM113_mask6_H_pzmsbs8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15200.0, lau:16000.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.330', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.325', 'REDSHIFT LT 1.335', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs97' :  spectrum = {which:'pzmsbs97', dfile:'XMM113_mask6_H_pzmsbs97_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.630', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.635', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'st30' :  spectrum = {which:'st30', dfile:'XMM113_mask6_H_st30_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
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
pro xmm113_mask6_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = xmm113_mask6_H_analyze_settings(which[zz])                                  ;get settings
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
  


