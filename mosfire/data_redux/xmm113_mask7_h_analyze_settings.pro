;========================================================================================================================
function xmm113_mask7_h_analyze_settings, xwhich
  
  ;;;;NEVER SET A INITIAL GUESS TO 0.0!!!
  ;;;Initial guesses listed first take precendence
  
  CASE xwhich OF
     'bsbs4' :  spectrum = {which:'bsbs4', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:15000.0, lau:15600.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.318', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.313', 'REDSHIFT LT 1.323', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'cl10' :  spectrum = {which:'cl10', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], $
                           border:2, lal:17000.0, lau:17800.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.636', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c4=0.2', 'c5=0.2', 'x0=0.5', 'x1=-0.0001' ], $
                           priors:['REDSHIFT GT 1.631', 'REDSHIFT LT 1.641', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], NEWVER:'v1-2'}
     
     'fore2' :  spectrum = {which:'fore2', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fore3' :  spectrum = {which:'fore3', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fore4' :  spectrum = {which:'fore4', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbs0' :  spectrum = {which:'fsbs0', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:15300.0, lau:15900.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.355', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.350', 'REDSHIFT LT 1.360', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbs14' :  spectrum = {which:'fsbs14', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.623', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.618', 'REDSHIFT LT 1.628', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbs15' :  spectrum = {which:'fsbs15', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:15800.0, lau:16400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.444', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.439', 'REDSHIFT LT 1.449', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'fsbs19' :  spectrum = {which:'fsbs19', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'gill1' :  spectrum = {which:'gill1', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16900.0, lau:17350.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.615', 'sig=3.5', 'c1=0.5', 'c2=0.3', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.610', 'REDSHIFT LT 1.620', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs11' :  spectrum = {which:'msbs11', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:14550.0, lau:15000.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.236', 'sig=3.5', 'c1=1.0', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.231', 'REDSHIFT LT 1.241', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs14' :  spectrum = {which:'msbs14', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs321' :  spectrum = {which:'msbs321', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16700.0, lau:17300.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=1.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs346' :  spectrum = {which:'msbs346', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:17300.0, lau:17900.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.691', 'sig=5.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.01' ], $
                              priors:['REDSHIFT GT 1.686', 'REDSHIFT LT 1.696', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs357' :  spectrum = {which:'msbs357', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'msbs5' :  spectrum = {which:'msbs5', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                            border:2, lal:16600.0, lau:17200.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                            initgss:['redshift=1.557', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.552', 'REDSHIFT LT 1.562', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'new5' :  spectrum = {which:'new5', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                           border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                           initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd21' :  spectrum = {which:'pzadd21', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd25' :  spectrum = {which:'pzadd25', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:17000.0, lau:17600.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.628', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.623', 'REDSHIFT LT 1.633', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd26' :  spectrum = {which:'pzadd26', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd62' :  spectrum = {which:'pzadd62', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:17200.0, lau:17800.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.651', 'sig=3.5', 'c1=0.4', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.646', 'REDSHIFT LT 1.656', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd70' :  spectrum = {which:'pzadd70', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzadd85' :  spectrum = {which:'pzadd85', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17500.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.612', 'sig=3.0', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.001' ], $
                              priors:['REDSHIFT GT 1.607', 'REDSHIFT LT 1.617', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzbsbs17' :  spectrum = {which:'pzbsbs17', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17400.0, lau:18000.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.693', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.688', 'REDSHIFT LT 1.698', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs25' :  spectrum = {which:'pzfsbs25', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:14900.0, lau:15500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.307', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.302', 'REDSHIFT LT 1.312', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzfsbs37' :  spectrum = {which:'pzfsbs37', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzj3680' :  spectrum = {which:'pzj3680', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                              border:2, lal:16900.0, lau:17500.0, ZQFLAG:'2', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                              initgss:['redshift=1.611', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.606', 'REDSHIFT LT 1.616', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs23' :  spectrum = {which:'pzmsbs23', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs32' :  spectrum = {which:'pzmsbs32', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:17300.0, lau:17900.0, ZQFLAG:'1', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.704', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.699', 'REDSHIFT LT 1.709', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs79' :  spectrum = {which:'pzmsbs79', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.631', 'sig=3.5', 'c1=0.5', 'c2=0.3', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.626', 'REDSHIFT LT 1.636', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'pzmsbs86' :  spectrum = {which:'pzmsbs86', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                               border:2, lal:16900.0, lau:17400.0, ZQFLAG:'3', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                               initgss:['redshift=1.631', 'sig=3.5', 'c1=0.6', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.625', 'REDSHIFT LT 1.637', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
     'scist1' :  spectrum = {which:'scist1', basename:'XMM113_mask7_H', fitto:['Ha','NIIr','NIIb'], $
                             border:2, lal:16900.0, lau:17400.0, ZQFLAG:'0', NOFITSKY:0, OPENFITS:1, DRYRUN:0, $
                             initgss:['redshift=0.0001', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 0.00000001', 'REDSHIFT LT 0.005', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
     
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

