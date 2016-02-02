;========================================================================================================================
FUNCTION lok400_stack_y_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'brsr10' :  spectrum = {which:'brsr10', basename:'LOK400_mask5_v1-1_Y', fitto:['OIIb','OIIr','CaK','CaH'], $
                             border:2, lal:9950.0, lau:10800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, YERR:'0', $
                             initgss:['redshift=1.705', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'c3=-0.2', 'c4=-0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.715', $
                                     'SIG1 GT 0.0', 'SIG1 LE 10.0', $
                                     'C1 GT 0.0', 'C2 GT 0.0', 'C3 LT 0.0', 'C4 LT 0.0'], NEWVER:'v1-2'}
     
     'brsr1a' :  spectrum = {which:'brsr1a', basename:'LOK400_mask5_v1-1_Y', fitto:['OIIb','OIIr','CaK','CaH'], $
                             border:2, lal:9950.0, lau:10800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, YERR:'0', $
                             initgss:['redshift=1.710', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'c3=-0.2', 'c4=-0.2', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.709', 'REDSHIFT LT 1.711', $
                                     'SIG1 GT 0.0', 'SIG1 LE 10.0', $
                                     'C1 GT 0.0', 'C2 GT 0.0', 'C3 LT 0.0', 'C4 LT 0.0'], NEWVER:'v1-2'}

     'brsr2' :  spectrum = {which:'brsr2', basename:'LOK400_mask5_v1-1_Y', fitto:['OIIb','OIIr','CaK','CaH'], $
                            border:2, lal:9950.0, lau:10800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, YERR:'0', $
                            initgss:['redshift=1.709', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'c3=-0.2', 'c4=-0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.708', 'REDSHIFT LT 1.710', $
                                    'SIG1 GT 0.0', 'SIG1 LE 10.0', $
                                    'C1 GT 0.0', 'C2 GT 0.0', 'C3 LT 0.0', 'C4 LT 0.0'], NEWVER:'v1-2'}

     'brsr3' :  spectrum = {which:'brsr3', basename:'LOK400_mask5_v1-1_Y', fitto:['OIIb','OIIr','CaK','CaH'], $
                            border:2, lal:9950.0, lau:10800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, YERR:'0', $
                            initgss:['redshift=1.700', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'c3=-0.2', 'c4=-0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.715', $
                                    'SIG1 GT 0.0', 'SIG1 LE 10.0', $
                                    'C1 GT 0.0', 'C2 GT 0.0', 'C3 LT 0.0', 'C4 LT 0.0'], NEWVER:'v1-2'}

     'brsr4' :  spectrum = {which:'brsr4', basename:'LOK400_mask5_v1-1_Y', fitto:['OIIb','OIIr','CaK','CaH'], $
                            border:2, lal:9950.0, lau:10800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, YERR:'0', $
                            initgss:['redshift=1.704', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'c3=-0.2', 'c4=-0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.703', 'REDSHIFT LT 1.705', $
                                    'SIG1 GT 0.0', 'SIG1 LE 10.0', $
                                    'C1 GT 0.0', 'C2 GT 0.0', 'C3 LT 0.0', 'C4 LT 0.0'], NEWVER:'v1-2'}

     'brsr7' :  spectrum = {which:'brsr7', basename:'LOK400_mask5_v1-1_Y', fitto:['OIIb','OIIr','CaK','CaH'], $
                           border:2, lal:9950.0, lau:10800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, YERR:'0', $
                           initgss:['redshift=1.700', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'c3=-0.2', 'c4=-0.2', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.715', $
                                   'SIG1 GT 0.0', 'SIG1 LE 10.0', $
                                   'C1 GT 0.0', 'C2 GT 0.0', 'C3 LT 0.0', 'C4 LT 0.0'], NEWVER:'v1-2'}
 
     'brsr8' :  spectrum = {which:'brsr8', basename:'LOK400_mask5_v1-1_Y', fitto:['OIIb','OIIr','CaK','CaH'], $
                            border:2, lal:9950.0, lau:10800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, YERR:'0', $
                            initgss:['redshift=1.700', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'c3=-0.2', 'c4=-0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.715', $
                                    'SIG1 GT 0.0', 'SIG1 LE 10.0', $
                                    'C1 GT 0.0', 'C2 GT 0.0', 'C3 LT 0.0', 'C4 LT 0.0'], NEWVER:'v1-2'}

     'brsr9' :  spectrum = {which:'brsr9', basename:'LOK400_mask5_v1-1_Y', fitto:['OIIb','OIIr','CaK','CaH'], $
                            border:2, lal:9950.0, lau:10800.0, ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, YERR:'0', $
                            initgss:['redshift=1.700', 'sig=2.5', 'c1=0.3', 'c2=0.2', 'c3=-0.2', 'c4=-0.2', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.695', 'REDSHIFT LT 1.715', $
                                    'SIG1 GT 0.0', 'SIG1 LE 10.0', $
                                    'C1 GT 0.0', 'C2 GT 0.0', 'C3 LT 0.0', 'C4 LT 0.0'], NEWVER:'v1-2'}

     


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


