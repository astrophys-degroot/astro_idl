;========================================================================================================================
function xmm113_mask7_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;Guesses listed first take precendence
  
  CASE xwhich OF
     'bsbs4' :  spectrum = {which:'bsbs4', dfile:'XMM113_mask7_H_bsbs4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:15000.0, lau:15600.0, QFLAG:3, NOFITSKY:0, $
                            guess:['redshift=1.318', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.313', 'REDSHIFT LT 1.323', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'cl10' :  spectrum = {which:'cl10', dfile:'XMM113_mask7_H_cl10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], border:2, $
                           lal:17000.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                           guess:['redshift=1.636', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.5', 'x1=-0.0001' ], $
                           priors:['REDSHIFT GT 1.631', 'REDSHIFT LT 1.641', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'fore2' :  spectrum = {which:'fore2', dfile:'XMM113_mask7_H_fore2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fore3' :  spectrum = {which:'fore3', dfile:'XMM113_mask7_H_fore3_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fore4' :  spectrum = {which:'fore4', dfile:'XMM113_mask7_H_fore4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbs0' :  spectrum = {which:'fsbs0', dfile:'XMM113_mask7_H_fsbs0_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:15300.0, lau:15900.0, QFLAG:3, NOFITSKY:0, $
                            guess:['redshift=1.355', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.350', 'REDSHIFT LT 1.360', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbs14' :  spectrum = {which:'fsbs14', dfile:'XMM113_mask7_H_fsbs14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.623', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.618', 'REDSHIFT LT 1.628', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbs15' :  spectrum = {which:'fsbs15', dfile:'XMM113_mask7_H_fsbs15_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:15800.0, lau:16400.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.444', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.439', 'REDSHIFT LT 1.449', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbs19' :  spectrum = {which:'fsbs19', dfile:'XMM113_mask7_H_fsbs19_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'gill1' :  spectrum = {which:'gill1', dfile:'XMM113_mask7_H_gill1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17350.0, QFLAG:1, NOFITSKY:0, $
                            guess:['redshift=1.615', 'sig=3.5', 'c1=0.5', 'c2=0.3', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.610', 'REDSHIFT LT 1.620', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs11' :  spectrum = {which:'msbs11', dfile:'XMM113_mask7_H_msbs11_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:14550.0, lau:15000.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=1.236', 'sig=3.5', 'c1=1.0', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.231', 'REDSHIFT LT 1.241', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbs14' :  spectrum = {which:'msbs14', dfile:'XMM113_mask7_H_msbs14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbs321' :  spectrum = {which:'msbs321', dfile:'XMM113_mask7_H_msbs321_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs346' :  spectrum = {which:'msbs346', dfile:'XMM113_mask7_H_msbs346_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17300.0, lau:17900.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.691', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.686', 'REDSHIFT LT 1.696', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs357' :  spectrum = {which:'msbs357', dfile:'XMM113_mask7_H_msbs357_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbs5' :  spectrum = {which:'msbs5', dfile:'XMM113_mask7_H_msbs5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16600.0, lau:17200.0, QFLAG:2, NOFITSKY:0, $
                            guess:['redshift=1.557', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.552', 'REDSHIFT LT 1.562', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'new5' :  spectrum = {which:'new5', dfile:'XMM113_mask7_H_new5_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                           guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzadd21' :  spectrum = {which:'pzadd21', dfile:'XMM113_mask7_H_pzadd21_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd25' :  spectrum = {which:'pzadd25', dfile:'XMM113_mask7_H_pzadd25_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17000.0, lau:17600.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.628', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.623', 'REDSHIFT LT 1.633', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd26' :  spectrum = {which:'pzadd26', dfile:'XMM113_mask7_H_pzadd26_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd62' :  spectrum = {which:'pzadd62', dfile:'XMM113_mask7_H_pzadd62_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17200.0, lau:17800.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.651', 'sig=3.5', 'c1=0.4', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.646', 'REDSHIFT LT 1.656', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd70' :  spectrum = {which:'pzadd70', dfile:'XMM113_mask7_H_pzadd70_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzadd85' :  spectrum = {which:'pzadd85', dfile:'XMM113_mask7_H_pzadd85_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17500.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.612', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.607', 'REDSHIFT LT 1.617', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzbsbs17' :  spectrum = {which:'pzbsbs17', dfile:'XMM113_mask7_H_pzbsbs17_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:18000.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.693', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.688', 'REDSHIFT LT 1.698', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs25' :  spectrum = {which:'pzfsbs25', dfile:'XMM113_mask7_H_pzfsbs25_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:14900.0, lau:15500.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.307', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.302', 'REDSHIFT LT 1.312', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzfsbs37' :  spectrum = {which:'pzfsbs37', dfile:'XMM113_mask7_H_pzfsbs37_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzj3680' :  spectrum = {which:'pzj3680', dfile:'XMM113_mask7_H_pzj3680_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17500.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.611', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs23' :  spectrum = {which:'pzmsbs23', dfile:'XMM113_mask7_H_pzmsbs23_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmsbs32' :  spectrum = {which:'pzmsbs32', dfile:'XMM113_mask7_H_pzmsbs32_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17300.0, lau:17900.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.704', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.699', 'REDSHIFT LT 1.709', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs79' :  spectrum = {which:'pzmsbs79', dfile:'XMM113_mask7_H_pzmsbs79_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.631', 'sig=3.5', 'c1=0.5', 'c2=0.3', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmsbs86' :  spectrum = {which:'pzmsbs86', dfile:'XMM113_mask7_H_pzmsbs86_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.631', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'scist1' :  spectrum = {which:'scist1', dfile:'XMM113_mask7_H_scist1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=0.0000000001', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 0.0000000001', 'REDSHIFT LT 0.000005', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     



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
pro xmm113_mask7_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = xmm113_mask7_H_analyze_settings(which[zz])                                  ;get settings
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
  


