;========================================================================================================================
function lok400_mask4_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  ;;;;Guesses listed first take precendence
  ;;;;Must give "which" as a string array!!!

  
  CASE xwhich OF
     'cl11' :  spectrum = {which:'cl11', dfile:'lok400_mask4_v1_H_cl11_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:17500.0, lau:18100.0, QFLAG:0, NOFITSKY:0, $
                           guess:['redshift=1.703', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.698', 'REDSHIFT LT 1.708', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'cl12' :  spectrum = {which:'cl12', dfile:'lok400_mask4_v1_H_cl12_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:17400.0, lau:18000.0, QFLAG:-1, NOFITSKY:0, $
                           guess:['redshift=1.705', 'sig=3.5', 'c1=0.5', 'c2=0.4', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.700', 'REDSHIFT LT 1.710', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'fg10' :  spectrum = {which:'fg10', dfile:'lok400_mask4_v1_H_fg10_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                           lal:17300.0, lau:17900.0, QFLAG:2, NOFITSKY:0, $
                           guess:['redshift=1.704', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.699', 'REDSHIFT LT 1.709', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzhi16' :  spectrum = {which:'pzhi16', dfile:'lok400_mask4_v1_H_pzhi16_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:17000.0, lau:17600.0, QFLAG:3, NOFITSKY:0, $
                             guess:['redshift=1.615', 'sig=3.5', 'c1=0.3', 'c2=0.20', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.610', 'REDSHIFT LT 1.620', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzhi7' :  spectrum = {which:'pzhi7', dfile:'lok400_mask4_v1_H_pzhi7_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16750.0, lau:17350.0, QFLAG:0, NOFITSKY:0, $
                            guess:['redshift=1.625', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.620', 'REDSHIFT LT 1.630', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzlow204' :  spectrum = {which:'pzlow204', dfile:'lok400_mask4_v1_H_pzlow204_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16200.0, lau:16800.0, QFLAG:1, NOFITSKY:0, $
                               guess:['redshift=1.488', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.483', 'REDSHIFT LT 1.493', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzlow205' :  spectrum = {which:'pzlow205', dfile:'lok400_mask4_v1_H_pzlow205_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzlow222' :  spectrum = {which:'pzlow222', dfile:'lok400_mask4_v1_H_pzlow222_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17300.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzlow236' :  spectrum = {which:'pzlow236', dfile:'lok400_mask4_v1_H_pzlow236_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed124' :  spectrum = {which:'pzmed124', dfile:'lok400_mask4_v1_H_pzmed124_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed133' :  spectrum = {which:'pzmed133', dfile:'lok400_mask4_v1_H_pzmed133_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15900.0, lau:16500.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.456', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.451', 'REDSHIFT LT 1.461', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed153' :  spectrum = {which:'pzmed153', dfile:'lok400_mask4_v1_H_pzmed153_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed170' :  spectrum = {which:'pzmed170', dfile:'lok400_mask4_v1_H_pzmed170_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'pzmed191' :  spectrum = {which:'pzmed191', dfile:'lok400_mask4_v1_H_pzmed191_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed1' :  spectrum = {which:'pzmed1', dfile:'lok400_mask4_v1_H_pzmed1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed2' :  spectrum = {which:'pzmed2', dfile:'lok400_mask4_v1_H_pzmed2_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                             lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                             guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                             priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'pzmed56' :  spectrum = {which:'pzmed56', dfile:'lok400_mask4_v1_H_pzmed56_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                              lal:15000.0, lau:15600.0, QFLAG:2, NOFITSKY:0, $
                              guess:['redshift=1.304', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                              priors:['REDSHIFT GT 1.300', 'REDSHIFT LT 1.308', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest1057' :  spectrum = {which:'rest1057', dfile:'lok400_mask4_v1_H_rest1057_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest1173' :  spectrum = {which:'rest1173', dfile:'lok400_mask4_v1_H_rest1173_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest1596' :  spectrum = {which:'rest1596', dfile:'lok400_mask4_v1_H_rest1596_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
     
     'rest1700' :  spectrum = {which:'rest1700', dfile:'lok400_mask4_v1_H_rest1700_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17200.0, lau:17800.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.648', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.643', 'REDSHIFT LT 1.653', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest1927' :  spectrum = {which:'rest1927', dfile:'lok400_mask4_v1_H_rest1927_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:17400.0, lau:18000.0, QFLAG:0, NOFITSKY:0, $
                               guess:['redshift=1.716', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.711', 'REDSHIFT LT 1.721', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest2551' :  spectrum = {which:'rest2551', dfile:'lok400_mask4_v1_H_rest2551_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest3099' :  spectrum = {which:'rest3099', dfile:'lok400_mask4_v1_H_rest3099_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:15900.0, lau:16500.0, QFLAG:2, NOFITSKY:0, $
                               guess:['redshift=1.454', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.449', 'REDSHIFT LT 1.459', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest3216' :  spectrum = {which:'rest3216', dfile:'lok400_mask4_v1_H_rest3216_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest3299' :  spectrum = {which:'rest3299', dfile:'lok400_mask4_v1_H_rest3299_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest3331' :  spectrum = {which:'rest3331', dfile:'lok400_mask4_v1_H_rest3331_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest4548' :  spectrum = {which:'rest4548', dfile:'lok400_mask4_v1_H_rest4548_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest4580' :  spectrum = {which:'rest4580', dfile:'lok400_mask4_v1_H_rest4580_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                               lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                               guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                               priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'rest4' :  spectrum = {which:'rest4', dfile:'lok400_mask4_v1_H_rest4_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
                            lal:16900.0, lau:17400.0, QFLAG:-1, NOFITSKY:0, $
                            guess:['redshift=1.62600', 'sig=3.5', 'c1=1.0', 'c2=0.50', 'x0=0.1', 'x1=0.0001' ], $
                            priors:['REDSHIFT GT 1.61600', 'REDSHIFT LT 1.63600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], OPENFITS:0}
 
     'targ1' :  spectrum = {which:'targ1', dfile:'lok400_mask4_v1_H_targ1_eps_1d_v10.fits', fitto:['Ha','NIIr','NIIb'], border:2, $
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
pro lok400_mask4_H_analyze, which, PYERR=pyerr, OPENPLOT=openplot


  indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask4/2014nov17/H/'  ;
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask4/2014nov17/H/' ;
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1                                      ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0                             ;set value
  
  
  IF which[0] EQ 'all' THEN which = ['hey']

  
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN                                               ;loop over which elements
     values = lok400_mask4_H_analyze_settings(which[zz])                                  ;get settings
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
  


