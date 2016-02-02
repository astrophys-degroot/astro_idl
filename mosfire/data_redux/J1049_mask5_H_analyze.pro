;========================================================================================================================
function J1049_mask5_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;;Guesses listed first take precendence
  ;;;;Must give "which" as a string array!!!

  
  CASE xwhich OF
     'brsr10' :  spectrum = {which:'brsr10', dfile:'J1049_20150426_v4_H_brsr10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15500.0, lau:16200.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.400', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.395', 'REDSHIFT LT 1.405', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'brsr8' :  spectrum = {which:'brsr8', dfile:'J1049_20150426_v4_H_brsr8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16300.0, lau:17000.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.535', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.530', 'REDSHIFT LT 1.540', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
  
     'cllzhq16' :  spectrum = {which:'cllzhq16', dfile:'J1049_20150426_v4_H_cllzhq16_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16700.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.595', 'sig=3.5', 'c1=0.4', 'c2=0.02', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.590', 'REDSHIFT LT 1.600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cllzhq5' :  spectrum = {which:'cllzhq5', dfile:'J1049_20150426_v4_H_cllzhq5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17400.0, lau:18100.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.717', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.712', 'REDSHIFT LT 1.722', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cllzhq9' :  spectrum = {which:'cllzhq9', dfile:'J1049_20150426_v4_H_cllzhq9_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cllzlq0' :  spectrum = {which:'cllzlq0', dfile:'J1049_20150426_v4_H_cllzlq0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'cllzlq4' :  spectrum = {which:'cllzlq4', dfile:'J1049_20150426_v4_H_cllzlq4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17300.0, lau:18000.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.705', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.710', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:1}
 
     'cllzmq0' :  spectrum = {which:'cllzmq0', dfile:'J1049_20150426_v4_H_cllzmq0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'cllzmq2' :  spectrum = {which:'cllzmq2', dfile:'J1049_20150426_v4_H_cllzmq2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17100.0, lau:17800.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.711', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.706', 'REDSHIFT LT 1.716', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cllzmq7' :  spectrum = {which:'cllzmq7', dfile:'J1049_20150426_v4_H_cllzmq7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17200.0, lau:17900.0, QFLAG:0, NOFITSKY:0, $
                              guess:['redshift=1.711', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.706', 'REDSHIFT LT 1.716', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cllzmq8' :  spectrum = {which:'cllzmq8', dfile:'J1049_20150426_v4_H_cllzmq8_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17200.0, lau:17900.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.707', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.702', 'REDSHIFT LT 1.712', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cllzmq9' :  spectrum = {which:'cllzmq9', dfile:'J1049_20150426_v4_H_cllzmq9_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17200.0, lau:17900.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.712', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.707', 'REDSHIFT LT 1.717', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}

     'hpzhq239' :  spectrum = {which:'hpzhq239', dfile:'J1049_20150426_v4_H_hpzhq239_eps_1d_v10.fits', fitto:['OIIIr', 'OIIIb', 'Hb'], border:2, $
                               lal:15200.0, lau:16000.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.188', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.183', 'REDSHIFT LT 2.193', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'hpzhqK208' :  spectrum = {which:'hpzhqK208', dfile:'J1049_20150426_v4_H_hpzhqK208_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16600.0, lau:17300.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'hpzhqK221' :  spectrum = {which:'hpzhqK221', dfile:'J1049_20150426_v4_H_hpzhqK221_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'hpzhqK225' :  spectrum = {which:'hpzhqK225', dfile:'J1049_20150426_v4_H_hpzhqK225_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17100.0, lau:17800.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.687', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.682', 'REDSHIFT LT 1.692', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'hpzhqK35' :  spectrum = {which:'hpzhqK35', dfile:'J1049_20150426_v4_H_hpzhqK35_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], border:2, $
                               lal:15700.0, lau:16400.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.408', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.20', 'c5=0.20', 'x0=1.0', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.403', 'REDSHIFT LT 1.413', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'hpzhqK50' :  spectrum = {which:'hpzhqK50', dfile:'J1049_20150426_v4_H_hpzhqK50_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'hpzhqK51' :  spectrum = {which:'hpzhqK51', dfile:'J1049_20150426_v4_H_hpzhqK51_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'hpzmq371' :  spectrum = {which:'hpzmq371', dfile:'J1049_20150426_v4_H_hpzmq371_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'hpzmqK244' :  spectrum = {which:'hpzmqK244', dfile:'J1049_20150426_v4_H_hpzmqK244_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:15000.0, lau:15800.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.326', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.321', 'REDSHIFT LT 1.331', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'hpzmqK270' :  spectrum = {which:'hpzmqK270', dfile:'J1049_20150426_v4_H_hpzmqK270_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:17200.0, lau:17900.0, QFLAG:3, NOFITSKY:0, $
                                guess:['redshift=1.712', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.707', 'REDSHIFT LT 1.717', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'hpzmqK38' :  spectrum = {which:'hpzmqK38', dfile:'J1049_20150426_v4_H_hpzmqK38_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16600.0, lau:17300.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.557', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.552', 'REDSHIFT LT 1.562', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'nr1763' :  spectrum = {which:'nr1763', dfile:'J1049_20150426_v4_H_nr1763_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'nr2370' :  spectrum = {which:'nr2370', dfile:'J1049_20150426_v4_H_nr2370_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16000.0, lau:16700.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.456', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.451', 'REDSHIFT LT 1.461', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'nr2640' :  spectrum = {which:'nr2640', dfile:'J1049_20150426_v4_H_nr2640_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'nr3331' :  spectrum = {which:'nr3331', dfile:'J1049_20150426_v4_H_nr3331_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'st15HST' :  spectrum = {which:'st15HST', dfile:'J1049_20150426_v4_H_st15HST_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
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
pro J1049_mask5_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/J1049_20150426_v4/2015apr27/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/J1049_20150426_v4/2015apr27/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                  ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                         ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = J1049_mask5_H_analyze_settings(which[zz])                                  ;get settings
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
  


