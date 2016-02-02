;========================================================================================================================
function lok200_mask5_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;;Guesses listed first take precendence
  ;;;;Must give "which" as a string array!!!

  
  CASE xwhich OF
     'bsbsb4' :  spectrum = {which:'bsbsb4', dfile:'lok200_mask5_H_bsbsb4_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:14700.0, lau:15300.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=2.051', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.046', 'REDSHIFT LT 2.056', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'bsbsb84' :  spectrum = {which:'bsbsb84', dfile:'lok200_mask5_H_bsbsb84_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'bsbsr6' :  spectrum = {which:'bsbsr6', dfile:'lok200_mask5_H_bsbsr6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:17300.0, lau:17900.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=1.647', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.642', 'REDSHIFT LT 1.652', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsb119' :  spectrum = {which:'fsbsb119', dfile:'lok200_mask5_H_fsbsb119_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsb11' :  spectrum = {which:'fsbsb11', dfile:'lok200_mask5_H_fsbsb11_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15200.0, lau:15800.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.343', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.339', 'REDSHIFT LT 1.346', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsb94' :  spectrum = {which:'fsbsb94', dfile:'lok200_mask5_H_fsbsb94_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:14700.0, lau:15300.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.260', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.255', 'REDSHIFT LT 1.265', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr132' :  spectrum = {which:'fsbsr132', dfile:'lok200_mask5_H_fsbsr132_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr145' :  spectrum = {which:'fsbsr145', dfile:'lok200_mask5_H_fsbsr145_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17800.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.647', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.642', 'REDSHIFT LT 1.652', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr163' :  spectrum = {which:'fsbsr163', dfile:'lok200_mask5_H_fsbsr163_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15300.0, lau:15900.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.354', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.349', 'REDSHIFT LT 1.359', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr166' :  spectrum = {which:'fsbsr166', dfile:'lok200_mask5_H_fsbsr166_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:14700.0, lau:15300.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=2.035', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.030', 'REDSHIFT LT 2.040', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'fsbsr170c' :  spectrum = {which:'fsbsr170c', dfile:'lok200_mask5_H_fsbsr170c_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsr181' :  spectrum = {which:'fsbsr181', dfile:'lok200_mask5_H_fsbsr181_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:14700.0, lau:15300.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.995', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.990', 'REDSHIFT LT 2.000', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'msbsb103' :  spectrum = {which:'msbsb103', dfile:'lok200_mask5_H_msbsb103_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb153a' :  spectrum = {which:'msbsb153a', dfile:'lok200_mask5_H_msbsb153a_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsb157' :  spectrum = {which:'msbsb157', dfile:'lok200_mask5_H_msbsb157_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:14750.0, lau:15350.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=2.056', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'c3=0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.051', 'REDSHIFT LT 2.061', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'msbsb159' :  spectrum = {which:'msbsb159', dfile:'lok200_mask5_H_msbsb159_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb', 'SIIr','SIIb'], border:2, $
                               lal:14700.0, lau:15300.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.252', 'sig=3.5', 'c1=0.7', 'c2=0.20', 'c4=0.20', 'c5=0.20', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.247', 'REDSHIFT LT 1.257', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
 
     'msbsr173' :  spectrum = {which:'msbsr173', dfile:'lok200_mask5_H_msbsr173_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsr199' :  spectrum = {which:'msbsr199', dfile:'lok200_mask5_H_msbsr199_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr207' :  spectrum = {which:'msbsr207', dfile:'lok200_mask5_H_msbsr207_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr217' :  spectrum = {which:'msbsr217', dfile:'lok200_mask5_H_msbsr217_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsr217b' :  spectrum = {which:'msbsr217b', dfile:'lok200_mask5_H_msbsr217b_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                                lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                                guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                                priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr222' :  spectrum = {which:'msbsr222', dfile:'lok200_mask5_H_msbsr222_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17000.0, lau:17600.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.655', 'sig=3.5', 'c1=0.5', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.650', 'REDSHIFT LT 1.660', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr225' :  spectrum = {which:'msbsr225', dfile:'lok200_mask5_H_msbsr225_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr235' :  spectrum = {which:'msbsr235', dfile:'lok200_mask5_H_msbsr235_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                               lal:14750.0, lau:15350.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.056', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.051', 'REDSHIFT LT 2.061', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'newobj1' :  spectrum = {which:'newobj1', dfile:'lok200_mask5_H_newobj1_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                               lal:14750.0, lau:15350.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=2.052', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.047', 'REDSHIFT LT 2.057', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'rest453' :  spectrum = {which:'rest453', dfile:'lok200_mask5_H_rest453_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:17300.0, lau:17900.0, QFLAG:3, NOFITSKY:0, $
                              guess:['redshift=1.687', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.682', 'REDSHIFT LT 1.692', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest486' :  spectrum = {which:'rest486', dfile:'lok200_mask5_H_rest486_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                               lal:15000.0, lau:15600.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.100', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.095', 'REDSHIFT LT 2.105', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'rest488' :  spectrum = {which:'rest488', dfile:'lok200_mask5_H_rest488_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest495' :  spectrum = {which:'rest495', dfile:'lok200_mask5_H_rest495_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest519' :  spectrum = {which:'rest519', dfile:'lok200_mask5_H_rest519_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                               lal:14800.0, lau:15500.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.082', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.077', 'REDSHIFT LT 2.087', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'rest531' :  spectrum = {which:'rest531', dfile:'lok200_mask5_H_rest531_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                               lal:14700.0, lau:15400.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=2.071', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.066', 'REDSHIFT LT 2.076', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'sbsbc196' :  spectrum = {which:'sbsbc196', dfile:'lok200_mask5_H_sbsbc196_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'st14' :  spectrum = {which:'st14', dfile:'lok200_mask5_H_st14_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
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
pro lok200_mask5_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask5/2014jun13/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask5/2014jun13/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                             ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                    ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = lok200_mask5_H_analyze_settings(which[zz])                                  ;get settings
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
  

