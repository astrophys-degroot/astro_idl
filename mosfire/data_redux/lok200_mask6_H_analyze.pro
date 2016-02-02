;========================================================================================================================
function lok200_mask6_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;;Guesses listed first take precendence
  ;;;;Must give "which" as a string array!!!

  
  CASE xwhich OF
     'fsbsb100' :  spectrum = {which:'fsbsb100', dfile:'lok200_mask6_H_fsbsb100_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsb116' :  spectrum = {which:'fsbsb116', dfile:'lok200_mask6_H_fsbsb116_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsb131' :  spectrum = {which:'fsbsb131', dfile:'lok200_mask6_H_fsbsb131_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                               lal:15750.0, lau:16450.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=2.269', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 2.264', 'REDSHIFT LT 2.274', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'fsbsb135' :  spectrum = {which:'fsbsb135', dfile:'lok200_mask6_H_fsbsb135_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsr140' :  spectrum = {which:'fsbsr140', dfile:'lok200_mask6_H_fsbsr140_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr172' :  spectrum = {which:'fsbsr172', dfile:'lok200_mask6_H_fsbsr172_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17300.0, lau:17800.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.654', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.649', 'REDSHIFT LT 1.659', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr173' :  spectrum = {which:'fsbsr173', dfile:'lok200_mask6_H_fsbsr173_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fsbsr176' :  spectrum = {which:'fsbsr176', dfile:'lok200_mask6_H_fsbsr176_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15400.0, lau:16000.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.373', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.369', 'REDSHIFT LT 1.379', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsr185' :  spectrum = {which:'fsbsr185', dfile:'lok200_mask6_H_fsbsr185_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:14700.0, lau:15300.0, QFLAG:0, NOFITSKY:0, $
                             guess:['redshift=2.037', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.032', 'REDSHIFT LT 2.042', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'fsbsr204' :  spectrum = {which:'fsbsr204', dfile:'lok200_mask6_H_fsbsr204_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'fsbsr213' :  spectrum = {which:'fsbsr213', dfile:'lok200_mask6_H_fsbsr213_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:14700.0, lau:15400.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=2.069', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.064', 'REDSHIFT LT 2.074', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'msbsb155' :  spectrum = {which:'msbsb155', dfile:'lok200_mask6_H_msbsb155_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:15300.0, lau:15900.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=2.159', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.154', 'REDSHIFT LT 2.164', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
     
     'msbsb169' :  spectrum = {which:'msbsb169', dfile:'lok200_mask6_H_msbsb169_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsb187' :  spectrum = {which:'msbsb187', dfile:'lok200_mask6_H_msbsb187_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15300.0, lau:15900.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.370', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.365', 'REDSHIFT LT 1.375', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr204' :  spectrum = {which:'msbsr204', dfile:'lok200_mask6_H_msbsr204_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17650.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.648', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.643', 'REDSHIFT LT 1.653', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr211' :  spectrum = {which:'msbsr211', dfile:'lok200_mask6_H_msbsr211_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsr215' :  spectrum = {which:'msbsr215', dfile:'lok200_mask6_H_msbsr215_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr226' :  spectrum = {which:'msbsr226', dfile:'lok200_mask6_H_msbsr226_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17800.0, QFLAG:3, NOFITSKY:0, $
                               guess:['redshift=1.662', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.657', 'REDSHIFT LT 1.667', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr232' :  spectrum = {which:'msbsr232', dfile:'lok200_mask6_H_msbsr232_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr235' :  spectrum = {which:'msbsr235', dfile:'lok200_mask6_H_msbsr235_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:14700.0, lau:15400.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=2.055', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.050', 'REDSHIFT LT 2.060', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'msbsr236' :  spectrum = {which:'msbsr236', dfile:'lok200_mask6_H_msbsr236_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsr238' :  spectrum = {which:'msbsr238', dfile:'lok200_mask6_H_msbsr238_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'msbsr254' :  spectrum = {which:'msbsr254', dfile:'lok200_mask6_H_msbsr254_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:14700.0, lau:15400.0, QFLAG:1, NOFITSKY:0, $
                             guess:['redshift=2.058', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.053', 'REDSHIFT LT 2.063', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'msbsr261' :  spectrum = {which:'msbsr261', dfile:'lok200_mask6_H_msbsr261_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr266' :  spectrum = {which:'msbsr266', dfile:'lok200_mask6_H_msbsr266_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'msbsr281' :  spectrum = {which:'msbsr281', dfile:'lok200_mask6_H_msbsr281_eps_1d_v10.fits', fitto:['OIIIr','OIIIb', 'Hb'], border:2, $
                             lal:14750.0, lau:15400.0, QFLAG:2, NOFITSKY:0, $
                             guess:['redshift=2.050', 'sig=3.5', 'c1=0.4', 'c2=0.2', 'c3=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 2.045', 'REDSHIFT LT 2.055', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C3 GT 0.0'], OPENFITS:0}
 
     'rest471' :  spectrum = {which:'rest471', dfile:'lok200_mask6_H_rest471_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest503' :  spectrum = {which:'rest503', dfile:'lok200_mask6_H_rest503_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'rest528' :  spectrum = {which:'rest528', dfile:'lok200_mask6_H_rest528_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest536' :  spectrum = {which:'rest536', dfile:'lok200_mask6_H_rest536_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                              guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest574' :  spectrum = {which:'rest574', dfile:'lok200_mask6_H_rest574_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16100.0, lau:16700.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.471', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.466', 'REDSHIFT LT 1.476', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest580' :  spectrum = {which:'rest580', dfile:'lok200_mask6_H_rest580_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:16600.0, lau:17300.0, QFLAG:1, NOFITSKY:0, $
                              guess:['redshift=1.550', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.545', 'REDSHIFT LT 1.555', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'sbsbc196' :  spectrum = {which:'sbsbc196', dfile:'lok200_mask6_H_sbsbc196_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'st6' :  spectrum = {which:'st6', dfile:'lok200_mask6_H_st6_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
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
pro lok200_mask6_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask6/2014jun14/H'                                                   ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask6/2014jun14/H'                                                  ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = lok200_mask6_H_analyze_settings(which[zz])                                  ;get settings
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


