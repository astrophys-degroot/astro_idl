;========================================================================================================================
function lok200_mask2_H_analyze_settings, xwhich
  
  ;;;;NEVER SET A GUESS TO 0.0!!!
  
  CASE xwhich OF
     'bsbsb27' :  mask = {which:'bsbsb27', dfile:'LOK200_mask2_1.0_H_bsbsb27_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17200.0, lau:17900.0, NOFITSKY:0, QFLAG:0, $
                          guess:['redshift=1.644', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.639', 'REDSHIFT LT 1.650', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb37' :  mask = {which:'bsbsb37', dfile:'LOK200_mask2_1.0_H_bsbsb37_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17200.0, lau:18000.0, NOFITSKY:0, QFLAG:1, $
                          guess:['redshift=1.659', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.653', 'REDSHIFT LT 1.663', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb4' :  mask = {which:'bsbsb4', dfile:'LOK200_mask2_1.0_H_bsbsb4_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:15175.0, lau:15800.0, NOFITSKY:0, QFLAG:2, $
                         guess:['redshift=1.326', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 1.321', 'REDSHIFT LT 1.331', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb55' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_bsbsb55_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17100.0, lau:17800.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.646', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.640', 'REDSHIFT LT 1.650', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb68' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_bsbsb68_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb80' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_bsbsb80_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:15500.0, lau:16200.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb84' :  mask = {which:'bsbsb84', dfile:'LOK200_mask2_1.0_H_bsbsb84_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=1.654', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.650', 'REDSHIFT LT 1.658', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'bsbsb86' :  mask = {which:'bsbsb86', dfile:'LOK200_mask2_1.0_H_bsbsb86_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:1, $
                          guess:['redshift=1.646', 'sig=3.5', 'c1=3.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.640', 'REDSHIFT LT 1.650', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb110' :  mask = {which:'fsbsb110', dfile:'LOK200_mask2_1.0_H_fsbsb110_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:16700.0, lau:17400.0, NOFITSKY:0, QFLAG:2, $
                           guess:['redshift=1.571', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.565', 'REDSHIFT LT 1.575', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb156' :  mask = {which:'fsbsb156', dfile:'LOK200_mask2_1.0_H_fsbsb156_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:16900.0, lau:17600.0, NOFITSKY:0, QFLAG:3, $
                           guess:['redshift=1.587', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.582', 'REDSHIFT LT 1.592', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb169' :  mask = {which:'fsbsb169', dfile:'LOK200_mask2_1.0_H_fsbsb169_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:17900.0, lau:18200.0, NOFITSKY:0, QFLAG:3, $
                           guess:['redshift=1.749', 'sig=3.5', 'c1=0.5', 'c2=0.25', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.743', 'REDSHIFT LT 1.753', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb71' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_fsbsb71_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb90' :  mask = {which:'fsbsb90', dfile:'LOK200_mask2_1.0_H_fsbsb90_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsb96' :  mask = {which:'fsbsb96', dfile:'LOK200_mask2_1.0_H_fsbsb96_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:15650.0, lau:16500.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr11' :  mask = {which:'fsbsr11', dfile:'LOK200_mask2_1.0_H_fsbsr11_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16700.0, lau:17400.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=1.561', 'sig=3.5', 'c1=2.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.555', 'REDSHIFT LT 1.565', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr12' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_fsbsr12_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr20' :  mask = {which:'fsbsr20', dfile:'LOK200_mask2_1.0_H_fsbsr20_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16050.0, lau:16800.0, NOFITSKY:0, QFLAG:2, $
                          guess:['redshift=1.469', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.463', 'REDSHIFT LT 1.473', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr46' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_fsbsr46_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17500.0, lau:18100.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr51' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_fsbsr51_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'fsbsr69' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_fsbsr69_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:16500.0, lau:17200.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc112' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_sbsbc112_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc177' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_sbsbc177_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:16800.0, lau:17500.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc196' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_sbsbc196_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc212' :  mask = {which:'sbsbc212', dfile:'LOK200_mask2_1.0_H_sbsbc212_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc265' :  mask = {which:'sbsbc265', dfile:'LOK200_mask2_1.0_H_sbsbc265_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                           lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                           guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                           priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc38' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_sbsbc38_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                          guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc67' :  mask = {which:'sbsbc67', dfile:'LOK200_mask2_1.0_H_sbsbc67_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:15100.0, lau:15800.0, NOFITSKY:0, QFLAG:3, $
                          guess:['redshift=1.319', 'sig=3.5', 'c1=1.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.314', 'REDSHIFT LT 1.324', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc87' :  mask = {which:'sbsbc87', dfile:'LOK200_mask2_1.0_H_sbsbc87_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                          lal:15200.0, lau:15900.0, NOFITSKY:0, QFLAG:2, $
                          guess:['redshift=1.340', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                          priors:['REDSHIFT GT 1.335', 'REDSHIFT LT 1.345', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'sbsbc9' :  mask = {which:'sbsbc9', dfile:'LOK200_mask2_1.0_H_sbsbc9_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                         lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                         guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                         priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'unk6' :  mask = {which:'unk6', dfile:'LOK200_mask2_1.0_H_unk6_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                       lal:16900.0, lau:17600.0, NOFITSKY:0, QFLAG:2, $
                       guess:['redshift=1.595', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                       priors:['REDSHIFT GT 1.590', 'REDSHIFT LT 1.600', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     'unk7' :  mask = {which:'null', dfile:'LOK200_mask2_1.0_H_unk7_eps_1d_v10.fits', fitto:['Ha', 'NIIr', 'NIIb'], border:2, $
                       lal:17000.0, lau:17700.0, NOFITSKY:0, QFLAG:99, $
                       guess:['redshift=1.626', 'sig=3.5', 'c1=5.0', 'c2=0.75', 'x0=0.1', 'x1=0.0001' ], $
                       priors:['REDSHIFT GT 1.605', 'REDSHIFT LT 1.645', 'SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0']}
     ELSE : BEGIN
        print, 'WARNING!! Choice not found'
        stop
     END 
  ENDCASE
  

  chk = where(mask.which EQ xwhich)
  IF chk NE -1 THEN values = mask[chk] ELSE BEGIN
     print, 'This detection tag not found: ', xwhich
     print, ' Skipping....'
     values = {which:'-1'}
  ENDELSE
  
  RETURN, values
END
;========================================================================================================================



;========================================================================================================================
pro lok200_mask2_H_analyze, which, DRYRUN=dryrun, PYERR=pyerr, OPENPLOT=openplot
  
  ;;;;Must give "which" as a string array!!!
  indir = '/Users/degroota/research/current2_mosfire2012nov28_lok200/LOK200_mask2_1.0/'  ;
  outdir = '/Users/degroota/research/current2_mosfire2012nov28_lok200/LOK200_mask2_1.0/' ;
  
  IF keyword_set(DRYRUN) THEN dryrun = 1 else dryrun = 0       ;run program but don't write anything
  IF keyword_set(PYERR) THEN pyerr = 0 else pyerr = 1          ;set value
  IF keyword_set(OPENPLOT) THEN openplot = 1 else openplot = 0 ;set value
  
  IF which[0] EQ 'all' THEN which = ['cl10']
  FOR zz=0, n_elements(which)-1, 1 DO BEGIN
     values = lok200_mask2_H_analyze_settings(which[zz])
     IF tag_exist(values, 'priors') EQ 1 THEN priors = values.priors ELSE priors = 0
     IF values.which NE '-1' THEN BEGIN
        mosfire_1dspec_analyze, values.dfile, values.which, PYERR=pyerr, $
                                FITTO=values.fitto, BORDER=values.border, $
                                LLOWER=values.lal, LUPPER=values.lau, $
                                NOFITSKY=values.nofitsky, CHKVALS=values.guess, $
                                PRIORS=priors, DRYRUN=dryrun, QFLAG=values.qflag, $
                                OPENPLOT=openplot, INDIR=indir, OUTDIR=outdir
     ENDIF
  ENDFOR
  

END	
;========================================================================================================================
  


