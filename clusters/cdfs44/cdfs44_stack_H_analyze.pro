;========================================================================================================================
function cdfs44_stack_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'field_lowmass' :  spectrum = {which:'field_lowmass', dfile:'cdfs44_spectra_stack_field_lowmass_v3-1.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                                    lal:6450.0, lau:6800.0, QFLAG:99, NOFITSKY:0, SPECVER:'v3-1', $
                                    guess:['redshift=0.0', 'sig=2.5', 'c1=1.0', 'c2=0.2', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=-0.0001' ], $
                                    priors:['REDSHIFT GE 0.0', 'REDSHIFT LE 0.0', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}

     'field_highmass' :  spectrum = {which:'field_highmass', dfile:'cdfs44_spectra_stack_field_highmass_v3-1.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                                    lal:6450.0, lau:6800.0, QFLAG:99, NOFITSKY:0, SPECVER:'v3-1', $
                                    guess:['redshift=0.0', 'sig=2.5', 'c1=1.0', 'c2=0.2', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=-0.0001' ], $
                                    priors:['REDSHIFT GE 0.0', 'REDSHIFT LE 0.0', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}

     'cluster_lowmass' :  spectrum = {which:'cluster_lowmass', dfile:'cdfs44_spectra_stack_cluster_lowmass_v3-1.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                                    lal:6450.0, lau:6800.0, QFLAG:99, NOFITSKY:0, SPECVER:'v3-1', $
                                    guess:['redshift=0.0', 'sig=2.5', 'c1=1.0', 'c2=0.2', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=-0.0001' ], $
                                    priors:['REDSHIFT GE 0.0', 'REDSHIFT LE 0.0', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}

     'cluster_highmass' :  spectrum = {which:'cluster_highmass', dfile:'cdfs44_spectra_stack_cluster_highmass_v3-1.fits', fitto:['Ha','NIIr','NIIb', 'SIIb', 'SIIr'], border:2, $
                                    lal:6450.0, lau:6800.0, QFLAG:99, NOFITSKY:0, SPECVER:'v3-1', $
                                    guess:['redshift=0.0', 'sig=2.5', 'c1=1.0', 'c2=0.2', 'c4=0.2', 'c5=0.2', 'x0=0.1', 'x1=-0.0001' ], $
                                    priors:['REDSHIFT GE 0.0', 'REDSHIFT LE 0.0', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0', 'C4 GT 0.0', 'C5 GT 0.0'], OPENFITS:0}
     

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
pro cdfs44_stack_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/stacks/'  ;
  outdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/stacks/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                 ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                        ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['field_lowmass', 'field_highmass', 'cluster_lowmass', 'cluster_highmass']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = cdfs44_stack_H_analyze_settings(which[zz])                                  ;get settings
     IF values.which NE '-1' THEN BEGIN                                                   ;check settings were found
        IF tag_exist(values, 'priors') EQ 1 THEN priors = values.priors ELSE priors = 0   ;if optional parameters given
        IF tag_exist(values, 'xwhich') EQ 1 THEN xwhich = values.xwhich ELSE xwhich = 0   ;check if tag exists
        mosfire_1dspec_analyze, values.dfile, values.which, XWHICH=xwhich, PYERR=pyerr, $ ;call routine
                                FITTO=values.fitto, BORDER=values.border, $
                                LLOWER=values.lal, LUPPER=values.lau, $
                                NOFITSKY=values.nofitsky, CHKVALS=values.guess, $
                                PRIORS=priors, DRYRUN=dryrun, QFLAG=values.qflag, SPECVER=values.specver, $
                                OPENPLOT=openplot, OPENFITS=values.openfits, INDIR=indir, OUTDIR=outdir
     ENDIF
  ENDFOR                        ;end loop over which elements
  
END	
;========================================================================================================================
  


