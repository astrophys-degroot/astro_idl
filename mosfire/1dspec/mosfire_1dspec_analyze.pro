;========================================================================================================================
function fwhm, sigma

  fwhm = 2.0*(2.0*alog(2.0))^0.5*sigma ;find FWHM
  
  RETURN, fwhm
END
;========================================================================================================================


;========================================================================================================================
function emissionsig, xfitvalsb, xyy, xwl, lambdasub, weightsub, line, verbose, CHECK=check
  
  
  ;;;get values
  chk = tag_exist(xfitvalsb, 'X0')                 ;check tag name
  IF chk EQ 1 THEN x0 = xfitvalsb.x0 ELSE x0 = 0.0 ;assign value
  chk = tag_exist(xfitvalsb, 'X1')                 ;check tag name
  IF chk EQ 1 THEN x1 = xfitvalsb.x1 ELSE x1 = 0.0 ;assign value
  chk = tag_exist(xfitvalsb, 'X2')                 ;check tag name
  IF chk EQ 1 THEN x2 = xfitvalsb.x2 ELSE x2 = 0.0 ;assign value
  chk = tag_exist(xfitvalsb, 'X3')                 ;check tag name
  IF chk EQ 1 THEN x3 = xfitvalsb.x3 ELSE x3 = 0.0 ;assign value
  chk = tag_exist(xfitvalsb, 'X4')                 ;check tag name
  IF chk EQ 1 THEN x4 = xfitvalsb.x4 ELSE x4 = 0.0 ;assign value
  chk = tag_exist(xfitvalsb, 'X5')                 ;check tag name
  IF chk EQ 1 THEN x5 = xfitvalsb.x5 ELSE x5 = 0.0 ;assign value
  

  ;;;find emission line significance
  chk = tag_exist(xfitvalsb, strcompress('sig' + string(xyy+1), /REMOVE_ALL), INDEX=isig) ;structure index
  chk = tag_exist(xfitvalsb, strcompress('c' + string(xyy+1), /REMOVE_ALL), INDEX=ic)     ;structure index
  fwhm = fwhm(xfitvalsb.(isig))                                                           ;find FWHM
  cent = xwl[xyy] * (xfitvalsb.redshift+1.0)                                              ;find central wavelength
  gausspart = -(lambdasub-cent)^2.0/(2.0*xfitvalsb.(isig)^2)                              ;find exponent values
  shift = lambdasub - xfitvalsb.medxs                                                     ;shift x values
  continuum = x0 + x1*shift + x2*shift^2 + x3*shift^3 + x4*shift^4 + x5*shift^5           ;find continuum
  bayesys = xfitvalsb.(ic)*exp(gausspart) + continuum                                     ;find hypothetical data values
  emission = bayesys - continuum                                                          ;find emission
  
  ll = cent - 0.5*fwhm                                                            ;lower limit
  ul = cent + 0.5*fwhm                                                            ;upper limit
  excess = where((lambdasub GE LL) AND (lambdasub LE UL))                         ;find range
  excess = [min(excess)-1, excess, max(excess)+1]                                 ;bracket range
  sigemissq = (emission[excess] / weightsub[excess])^2                            ;find variance
  sigline = (total(sigemissq))^0.5                                                ;find total sigma
  IF keyword_set(CHECK) THEN BEGIN                                                ;if CHECK keyword_set
     excess2 = [min(excess)-1, excess, max(excess)]                               ;bracket range
     excess3 = [min(excess), excess, max(excess)+1]                               ;bracket range
     excess4 = [min(excess), excess, max(excess)]                                 ;bracket range
     sigemissq2 = (emission[excess2] / weightsub[excess2])^2                      ;find variance squared
     sigemissq3 = (emission[excess3] / weightsub[excess3])^2                      ;find variance squared
     sigemissq4 = (emission[excess4] / weightsub[excess4])^2                      ;find variance squared
     sigline2 = (total(sigemissq2))^0.5                                           ;find total sigma
     sigline3 = (total(sigemissq3))^0.5                                           ;find total sigma
     sigline4 = (total(sigemissq4))^0.5                                           ;find total sigma
     print, sigline, sigline2, sigline3, sigline4                                 ;print info
  ENDIF                                                                           ;end CHECK keyword set
  sigline = string(sigline, FORMAT='(F8.3)')                                      ;find total sigma
  outline = strcompress(' ' + line + ' LINE SIGNIFICANCE: ' + sigline + ' sigma') ;line to print
  IF verbose GE 1 THEN print, outline                                             ;print 
  
  RETURN, sigline               ;return value
END
;========================================================================================================================


;========================================================================================================================
pro addfitinfo, datahdr, xfitvalsb, xfitto, border


  FOR xx=0, n_elements(xfitto)-1, 1 DO BEGIN
     name = strcompress('ZLINE' + string(xx+1), /REMOVE_ALL)
     value = strcompress(xfitto[xx], /REMOVE_ALL)
     comment = strcompress('Line ' + string(xx+1) + ' used to find redshift')
     fxaddpar, datahdr, name, value, comment ; 
 
     tag = strcompress('sig' + string(xx+1),/REMOVE_ALL)
     chk = tag_exist(xfitvalsb, tag, INDEX=ind) 
     name = strcompress(xfitto[xx] +'SIG', /REMOVE_ALL)
     comment =  strcompress('Sigma of ' + xfitto[xx] + ' line in fit, [Ang]')
     fxaddpar, datahdr, name, xfitvalsb.(ind), comment

     tag = strcompress('sig' + string(xx+1) + 'm', /REMOVE_ALL)
     chk = tag_exist(xfitvalsb, tag, INDEX=ind) 
     name = strcompress('d' + xfitto[xx] +'SIG', /REMOVE_ALL)
     comment =  strcompress('Sigma error of ' + xfitto[xx] + ' line in fit, [Ang]')
     fxaddpar, datahdr, name, xfitvalsb.(ind), comment
     
     tag = strcompress('c' + string(xx+1),/REMOVE_ALL)
     chk = tag_exist(xfitvalsb, tag, INDEX=ind) 
     name = strcompress(xfitto[xx] +'C', /REMOVE_ALL)
     comment =  strcompress('Area of ' + xfitto[xx] + ' line in fit, [flux]')
     fxaddpar, datahdr, name, xfitvalsb.(ind), comment
     
     tag = strcompress('c' + string(xx+1) + 'm', /REMOVE_ALL)
     chk = tag_exist(xfitvalsb, tag, INDEX=ind) 
     name = strcompress('d' + xfitto[xx] +'C', /REMOVE_ALL)
     comment =  strcompress('Area error of ' + xfitto[xx] + ' line in fit, [flux]')
     fxaddpar, datahdr, name, xfitvalsb.(ind), comment
  ENDFOR

  FOR xx=0, border-1, 1 DO BEGIN
     name = strcompress('X' + string(xx), /REMOVE_ALL)
     chk = tag_exist(xfitvalsb, name, INDEX=ind) 
     comment = strcompress('X' + string(xx) + ' value in continuum fit')
     fxaddpar, datahdr, name, xfitvalsb.(ind), comment ; 

     tag = strcompress('X' + string(xx) + 'm', /REMOVE_ALL)
     chk = tag_exist(xfitvalsb, tag, INDEX=ind) 
     name = strcompress('dX' + string(xx), /REMOVE_ALL)
     comment = strcompress('X' + string(xx) + ' value error in continuum fit')
     fxaddpar, datahdr, name, xfitvalsb.(ind), comment ; 
  ENDFOR
  
  RETURN
END
;========================================================================================================================



;========================================================================================================================
pro addlineinfo, datahdr, xfitto, xfitvalsb, xyy, xsigline, xfwhm

  
  name = strcompress(xfitto[xyy] +'SGNF', /REMOVE_ALL)
  comment =  strcompress('Significance of ' + xfitto[xyy] + ' line')
  fxaddpar, datahdr, name, xsigline, comment

  name = strcompress(xfitto[xyy] +'FWHM', /REMOVE_ALL)
  comment =  strcompress('FWHM of ' + xfitto[xyy] + ' line, [Ang]')
  fxaddpar, datahdr, name, xfwhm, comment

  RETURN
END
;========================================================================================================================



;========================================================================================================================
pro plotspec1d, xxs, xys, YERR=yerr, FILLERR=fillerr, $
                PAD=pad, XMIN=xmin, XMAX=xmax, YMIN=ymin, YMAX=ymax, $
                VALSMP=valsmp, VALSBAYES=valsbayes
  
  IF keyword_set(PAD) THEN pad = pad[0] ELSE pad = 0.02                                   ;sets new value
  IF keyword_set(XMIN) THEN xmin = xmin[0] ELSE xmin = min(xxs) - pad*(max(xxs)-min(xxs)) ;sets new value
  IF keyword_set(XMAX) THEN xmax = xmax[0] ELSE xmax = max(xxs) + pad*(max(xxs)-min(xxs)) ;sets new value
  IF keyword_set(YMIN) THEN ymin = ymin[0] ELSE ymin = min(xys) - pad*(max(xys)-min(xys)) ;sets new value
  IF keyword_set(YMAX) THEN ymax = ymax[0] ELSE ymax = max(xys) - pad*(max(xys)-min(xys)) ;sets new value
  IF keyword_set(OUTPLOT) THEN outplot = 'Y' ELSE outplot = 'N'                           ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                      ;sets new value
  

  ;;;Find plot area
  chk = where((xxs GE xmin) AND (xxs LE xmax), nchk)
  
  w = window(LOCATION=[200,25], DIMENSIONS=[1000,400]) ;set window
  CASE keyword_set(YERR) OF 
     0 : BEGIN
        myplot = plot(xxs[chk], xys[chk], /NODATA, $       ;plot values 
                      /CURRENT,  LINESTYLE=0, $            ;plot options     
                      XTITLE = 'Wavelength [Angstroms]', $ ;plot options
                      XRANGE = [xmin, xmax], $             ;plot options
                      YTITLE = 'Flux [arbitrary units]', $ ;plot options
                      YRANGE = [ymin, ymax], $             ;plot options
                      TITLE = '1D Spetrum and Errors', $   ;plot options
                      SYM_SIZE = 1.5, $                    ;plot options
                      FONT_SIZE = 14)                      ;plot options
        
     END
     1 : BEGIN
        CASE keyword_set(FILLERR) OF
           0 : BEGIN
              myplot = errorplot(xxs[chk], xys[chk], yerr[chk], $         ;plot values
                                 /CURRENT, LINESTYLE=0, $                 ;plot options               
                                 XTITLE = 'Obs Wavelength [Angstroms]', $ ;plot options
                                 XRANGE = [xmin, xmax], $                 ;plot options
                                 YTITLE = 'Flux [arbitrary units]', $     ;plot options
                                 YRANGE = [ymin, ymax], $                 ;plot options
                                 TITLE = '1D Spetrum, Errors and Fit', $  ;plot options
                                 SYM_SIZE = 1.5, $                        ;plot options
                                 FONT_SIZE = 14)                          ;plot options
           END
           1: BEGIN
              myplot = plot(xxs[chk], xys[chk], /NODATA, $           ;plot values
                            /CURRENT, LINESTYLE=0, $                 ;plot options
                            XTITLE = 'Obs Wavelength [Angstroms]', $ ;plot options
                            XRANGE = [xmin, xmax], $                 ;plot options
                            YTITLE = 'Flux [arbitrary units]', $     ;plot options
                            YRANGE = [ymin, ymax], $                 ;plot options
                            TITLE = '1D Spetrum and Errors', $       ;plot options
                            SYM_SIZE = 1.5, $                        ;plot options
                            FONT_SIZE = 14)                          ;plot options
              
              xyslow = (xys-yerr)
              xyshigh = (xys+yerr)
              IF nchk GT 0 THEN BEGIN
                 polyxs = [xxs[chk], reverse(xxs[chk])]
                 polyys = [xyslow[chk], reverse(xyshigh[chk])]
              ENDIF
              tmpchk = where(polyys GE ymax, nchk)
              IF nchk NE 0 then polyys[tmpchk] = ymax
              tmpchk = where(polyys LE ymin, nchk)
              IF nchk NE 0 then polyys[tmpchk] = ymin
              
              polyfill, polyxs, polyys, /DATA, $ ;fill error bars
                        COLOR = '666666'XL       ;plot options
           END
        ENDCASE
     END 
     
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
  ENDCASE
  myfit = plot(xxs[chk], xys[chk], /OVERPLOT, $ ;plot values
               LINESTYLE=0, THICK = 1.8)        ;plot options

  IF keyword_set(VALSBAYES) THEN BEGIN
     print, 'holy shit im here!!!!!'
     gausspart = -(xxs-valsbayes.mu1)^2.0/(2.0*valsbayes.sig1^2)             ;find exponent values
     bayesys = valsbayes.c1*exp(gausspart) + valsbayes.a1*xxs + valsbayes.b1 ;find hypothetical data values
     myfit= plot(xxs[chk], bayesys, /OVERPLOT, $                             ;plot values 
                 LINESTYLE=0, THICK = 2.0)                                   ;plot options
  ENDIF

  IF keyword_set(VALSMP) THEN BEGIN                           ;check if MPFIT vals given
     gausspart = gaussmp(xxs, valsmp[2:4])                    ;eval gauss part
     mpys = gausspart + valsmp[1]*xxs + valsmp[0]             ;eval all
     myfit = plot(xxs[chk], mpys, /OVERPLOT, $                ;plot fit
                  LINESTYLE=0, THICK = 2.0)                   ;plot options
     legend, ['Bayesian', 'MPFIT'], LINESTYLE=[0,0], BOX=0, $ ;legend
             COLORS=['FF0000'XL, '00FF00'XL], $               ;legend options
             CHARSIZE = 1.4, $                                ;plot options
             TEXTCOLORS='000000'XL                            ;legend options
  ENDIF ELSE BEGIN                                            ;end check MPFIT vals
     IF keyword_set(VALSBAYES) THEN BEGIN
        legend, ['Bayesian'], LINESTYLE=[0], BOX=0, $ ;legend
                COLORS=['FF0000'XL], $                ;legend options
                CHARSIZE = 1.4, $                     ;plot options
                TEXTCOLORS='000000'XL                 ;legend options
     ENDIF
  ENDELSE

END
;========================================================================================================================



;========================================================================================================================
pro mosfire_1dspec_analyze, xdata, call, OPENFITS=openfits, FITTO=fitto, $
                            LLOWER=llower, LUPPER=lupper, $
                            YLOWER=ylower, YUPPER=yupper, $
                            CHKVALS=chkvals, MPCHECK=mpcheck, $
                            PRIORS=priors, XWHICH=xwhich, $
                            FITITER=fititer, BORDER=border, $
                            NOFITSKY=nofitsky, PYERR=pyerr, $
                            DRYRUN=dryrun, SPECVER=specver, NEWSPECVER=newspecver, QFLAG=qflag, $
                            WINNUM=winnum, INDIR=indir, OUTDIR=outdir, OPENPLOT=openplot, $
                            VERBOSE=verbose, HELP=help

;+
; NAME:
;       MOSFIRE_1DSPEC_ANALYZE()
;
; PURPOSE:
;
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;       xdata: extracted 1D spectrum file
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;       verbose: how much info is printed to screen during run 
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;
; COMMON BLOCKS:
;
; PROCEDURES USED:
;
; COMMENTS:
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2014 Jan 22, Univ. Cali, Riverside v1.2.0
;          -debugging keywords
;       A. DeGroot, 2014 Jan 22, Univ. Cali, Riverside v1.1.0
;          -added the 'dry run' feature
;       A. DeGroot, 2014 Jan 22, Univ. Cali, Riverside v1.0.0
;
;
; DESIRED UPGRADES
;       -need to fix calculation of line significance
;       -work on version control numbering!!!! definitely a high
;       priority 
;       -add option for two objects in spectra
;       -add option for summed spatial profile even when doing full extraction?
;       -add comment keyword
;
;-
  version = '1.1.0'


;;;;;################################################

  ;;;housekeeping tasks
  IF keyword_set(FITTO) THEN fitto = fitto ELSE fitto = ['Ha']                       ;sets new value
  IF keyword_set(BORDER) THEN border = border[0] ELSE border = 2                     ;sets new value
  IF keyword_set(SPECVER) THEN specver = specver[0] ELSE specver = 'v10'             ;sets new value
  IF keyword_set(NEWSPECVER) THEN newspecver = newspecver[0] ELSE newspecver = 'v11' ;sets new value
  IF keyword_set(INDIR) THEN indir = indir[0] ELSE indir = ' '                       ;sets new value
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = ' '                   ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2                 ;sets new value
  check_dir, 1                                                                       ;compile module
  loadct, 13                                                                         ;color table
  
  
  print, ' '                                                                    ;spacer
  line = strcompress( ' Now working on file: ' + xdata)                         ;info
  IF verbose GE 2 THEN print, line                                              ;print info
  

  ;;;Directories and files
  IF indir NE ' ' THEN check_indir, indir, xdata, VERBOSE=verbose, NOTE='INDIR' ;check indir
  IF outdir NE ' ' THEN check_outdir, outdir, VERBOSE=verbose                   ;check outdir
  data = mrdfits(xdata, 1, datahdr, /SILENT)                                    ;read in file
  IF keyword_set(help) THEN help, data, /STRUC                                  ;offer help
  IF call EQ 'null' THEN BEGIN                                                  ;if no redshift determined
     fxaddpar, datahdr, 'Z', -99, 'Redshift of detection'                       ;add value to header
     outfile = xdata                                                            ;copy in file
     tester = strcompress('*' + specver + '*', /REMOVE_ALL)                     ;string to test for
     test = strmatch(outfile, tester)                                           ;text outfile
     IF test EQ 1 THEN BEGIN                                                    ;if test passes
        strreplace, outfile, specver, 'v11'                                      ;replace name
        mwrfits, data, outfile, datahdr, /CREATE                                ;write out new
     ENDIF ELSE BEGIN                                                           ;end test passes
        print, 'Outfile name not unique!! Original file would be overwritten!!' ;print info
        print, '  Not writing file!!'                                           ;print info
     ENDELSE                                                                    ;end alt to test passing
    
     RETURN
  ENDIF
  

  ;;;Open images for evaluation
  IF keyword_set(OPENFITS) THEN BEGIN                                                        ;if OPENFITS keyword present
     line = 'ds9 -geometry 1280x720 -zscale -zoom 2 *' + call + '*_eps.fits '                ;part of ds9 call
     line = line + '-zscale -zoom 2 *' + call + '*_eps_masked.fits '                         ;part of ds9 call
     line = line + '-zscale -zoom 2 *' + call + '*_snrs.fits '                               ;part of ds9 call
     line = line + '-frame new -minmax -scale sqrt -zoom 2 *'+ call + '*_snrs_masked.fits &' ;part of ds9 call
     spawn, line                                                                             ;open FITS files 
     stop
  ENDIF                         ;end OPENFITS keyword present

  ;;;set upper and lower bounds
  IF keyword_set(LLOWER) THEN llower = llower[0] ELSE llower = min(data.lambdas)         ;sets new value
  IF keyword_set(LUPPER) THEN lupper = lupper[0] ELSE lupper = max(data.lambdas)         ;sets new value
  chk = where((data.lambdas GE llower) AND (data.lambdas LE lupper), nchk)               ;find subset
  IF keyword_set(YLOWER) THEN ylower = ylower[0] ELSE ylower = 1.1*min(data.spec1d[chk]) ;sets new value
  IF keyword_set(YUPPER) THEN yupper = yupper[0] ELSE yupper = 1.1*max(data.spec1d[chk]) ;sets new value

  
  ;;;Subset of wavelength range and remove sky lines if wanted 
  IF keyword_set(NOFITSKY) THEN BEGIN                                                            ;check to avoid fitting sky
     skylines = fxpar(datahdr, 'NOSKY')                                                          ;get which sky to avoid
     speclines, skylines, VALS=skyvals                                                           ;get skyline values
     cplamb = data.lambdas                                                                       ;copy 
     cplamb[*] = 1.0                                                                             ;set flags to one
     FOR xx=0, n_elements(skyvals.(0))-1, 1 DO BEGIN                                             ;loop over skylines
        chk = where((data.lambdas GE skyvals.lower[xx]) AND (data.lambdas LE skyvals.upper[xx])) ;find bad wavelengths
        IF chk[0] NE -1 THEN cplamb[chk] = 0                                                     ;set flag to zero
     ENDFOR                                                                                      ;end loop over skylines 
  ENDIF ELSE BEGIN                                                                               ;if not avoid sky lines
     cplamb = data.lambdas                                                                       ;copy
     cplamb[*] = 1.0                                                                             ;set all flags to one
  ENDELSE                                                                                        ;end not avoid
  bit = where((data.lambdas GE llower) AND (data.lambdas LE lupper) AND (cplamb EQ 1))           ;find subset
  

  ;;;Prep and stuff
  nfitto = n_elements(fitto)           ;find how many features to fit
  wl = fltarr(nfitto)                  ;make array for wavelengths
  FOR yy=0, nfitto-1, 1 DO BEGIN       ;loop over features
     wl[yy] = emissionlines(fitto[yy]) ;store wavelength
  ENDFOR                               ;end loop over features
  
  ;;;Fit emission line(s)
  plotspec1d, data.lambdas[bit], data.spec1d[bit], YERR=data.spec1dwei[bit] ;plot spectrum

  IF (~keyword_set(DRYRUN)) THEN BEGIN
     plotfit = xdata
     plotparam = xdata
     strreplace, plotfit, '.fits', '_lines.ps'                                ;change suffix
     IF keyword_set(XWHICH) THEN strreplace, plotfit, xwhich[0], xwhich[1]    ;replace in file name
     strreplace, plotparam, '.fits', '_lineparams.ps'                         ;change suffix
     IF keyword_set(XWHICH) THEN strreplace, plotparam, xwhich[0], xwhich[1] ;replace in file name
     bayesian_spectral, data.lambdas[bit], data.spec1d[bit], data.spec1dwei[bit], FEATURES=fitto, BORDER=border, $
                        FITVALS=fitvalsb, GUESSES=chkvals, PRIORS=priors, CALL=call, PDATA=pdata, $
                        PLOTFIT=plotfit, PLOTPARAM=plotparam, /PFIT
  ENDIF ELSE BEGIN
     bayesian_spectral, data.lambdas[bit], data.spec1d[bit], data.spec1dwei[bit], FEATURES=fitto, BORDER=border, $
                        FITVALS=fitvalsb, GUESSES=chkvals, PRIORS=priors, CALL=call, /PFIT
  ENDELSE
  IF keyword_set(HELP) THEN help, fitvalsb, /STRUC ;print help


  ;;;redshift output
  bit1 = string(fitvalsb.redshift, FORMAT='(F7.5)')                       ;format
  minerr = 0.00001                                                        ;min error 
  dredshift = (fitvalsb.redshiftm GT minerr) ? fitvalsb.redshift : minerr ;set error
  bit2 = string(dredshift, FORMAT='(F0.5)')                               ;format 
  outline = strcompress(' REDSHIFT: ' + bit1 + ' +/- ' + bit2)            ;line to print
  IF verbose GE 1 THEN print, outline                                     ;print 
  fxaddpar, datahdr, 'Z', bit1, 'Redshift of detection'                   ;add value to header
  fxaddpar, datahdr, 'dZ', bit2, 'Redshift error of detection'            ;add value to header


  ;;;wavelength info into header
  fxaddpar, datahdr, 'LMEDIAN', fitvalsb.medxs, 'Wavelength at origin for continuum fit, [Ang]'
  fxaddpar, datahdr, 'LLOWER', llower, 'Lower wavelength for contiuum fit, [Ang]'
  fxaddpar, datahdr, 'LUPPER', lupper, 'Upper wavelength for contiuum fit, [Ang]'
  

  ;;;other fit values into header
  addfitinfo, datahdr, fitvalsb, fitto, border ;add fit info


  ;;;emission line info into header
  FOR yy=0, nfitto-1, 1 DO BEGIN                                                           ;loop over lines fit to
     sigline = emissionsig(fitvalsb, yy, wl, $                                             ;cont next line
                           data.lambdas[bit], data.spec1dwei[bit], fitto[yy], verbose)     ;lines significance
     chk = tag_exist(fitvalsb, strcompress('sig' + string(yy+1), /REMOVE_ALL), INDEX=isig) ;structure index
     fwhm = fwhm(fitvalsb.(isig))                                                          ;line FWHM
     addlineinfo, datahdr, fitto, fitvalsb, yy, sigline, fwhm                              ;add info
  ENDFOR                                                                                   ;end loop over lines fit to


  ;;;Other run info into header
  fxaddpar, datahdr, 'NOFITSKY', nofitsky, 'Whether sky line regions included in fit' ;add value
  FOR yy=0, n_elements(chkvals)-1, 1 DO BEGIN                                         ;loop over priors
     name = strcompress('GUESS' + string(yy+1), /REMOVE_ALL)                          ;name in header
     fxaddpar, datahdr, name, chkvals[yy], 'Initial guess used in fitting'            ;add value
  ENDFOR                                                                              ;end loop over priors
  FOR yy=0, n_elements(priors)-1, 1 DO BEGIN                                          ;loop over priors
     name = strcompress('PRIOR' + string(yy+1), /REMOVE_ALL)                          ;name in header
     fxaddpar, datahdr, name, priors[yy], 'Priors used in fitting'                    ;add value
  ENDFOR                                                                              ;end loop over priors
  test = strmatch(call, '*_*')                                                        ;text outfile
  IF test EQ 1 THEN value = 'Y' ELSE value = 'N'                                      ;determine value
  fxaddpar, datahdr, 'MULTOBJ', value, 'Multiple objects in slit?'                    ;add value 
  fxaddpar, datahdr, 'QFLAG', qflag, 'Quality of analysis, high=bad'                  ;add value 
  

  ;      ;;;Check with MPFIT.pro if so desired
  ;      IF keyword_set(MPCHECK) THEN BEGIN
  ;         fitvalsmp = mpfitfun('MYGAUSS_LINCONT', data.lambdas[bit], data.spec1d[bit], data.spec1dwei[bit], mpcheck, /QUIET)
  ;         plotspec1d, data.lambdas[bit], data.spec1d[bit], YERR=data.spec1dwei[bit], VALSMP=fitvalsmp, VALSBAYES=fitvalsb
  ;      ENDIF ELSE BEGIN
  ;         plotspec1d, data.lambdas[bit], data.spec1d[bit], YERR=data.spec1dwei[bit], VALSBAYES=fitvalsb
  ;      ENDELSE
  
  
  ;;;plot the spectra and fit
  outplot = xdata                                                       ;copy file name
  strreplace, outplot, '.fits', '.ps'                                   ;change file suffix
  IF keyword_set(XWHICH) THEN strreplace, outplot, xwhich[0], xwhich[1] ;replace 
  nosky = fxpar(datahdr, 'NOSKY')                                       ;get no sky value
  test = strmatch(nosky, '*yband*')                                     ;test sky line
  IF test NE 0 THEN ysky = nosky ELSE ysky = 0                          ;set value
  test = strmatch(nosky, '*jband*')                                     ;test sky line
  IF test NE 0 THEN jsky = nosky ELSE jsky = 0                          ;set value
  test = strmatch(nosky, '*hband*')                                     ;test sky line
  IF test NE 0 THEN hsky = nosky ELSE hsky = 0                          ;set value
  test = strmatch(nosky, '*kband*')                                     ;test sky line
  IF test NE 0 THEN ksky = nosky ELSE ksky = 0                          ;set value
  spectra_1d, data, datahdr, ZZ=float(bit1), YERR=keyword_set(PYERR), $ ;plot analysis
              DOMAIN=[llower, lupper], $                                ;plot options
              RANGE=[ylower, yupper], $                                 ;plot options
              BAYESFIT=fitto, $                                         ;plot options
              YSKY=ysky, JSKY=jsky, HSKY=hsky, KSKY=ksky, $             ;plot options
              /SHADESKY, /BALMER, /NONBALMER, $                         ;plot options
              /INFO, PSNAME=outplot                                     ;plot options
  

  outfile = xdata                                                            ;copy in file
  tester = strcompress('*' + specver + '*', /REMOVE_ALL)                     ;string to test for
  test = strmatch(outfile, tester)                                           ;text outfile
  IF (test EQ 1) THEN BEGIN                                                  ;if test passes
     strreplace, outfile, specver, newspecver                                ;replace name
     IF keyword_set(XWHICH) THEN strreplace, outfile, xwhich[0], xwhich[1]   ;replace
     IF (~keyword_set(DRYRUN)) THEN mwrfits, data, outfile, datahdr, /CREATE ;write out new
  ENDIF ELSE BEGIN                                                           ;end test passes
     print, 'Outfile name not unique!! Original file would be overwritten!!' ;print info
     print, '  Not writing file!!'                                           ;print info
  ENDELSE                                                                    ;end alt to test passing
  
  IF keyword_set(OPENPLOT) THEN spawn, 'open ' + outplot

  RETURN
END
;========================================================================================================================
