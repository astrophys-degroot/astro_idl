;========================================================================================================================
function getflux, xline, xhdr, NPTS=npts

  IF keyword_set(NPTS) THEN npts = npts[0] ELSE npts = 1000 ;# of integration points
  
  ;;;gather info
  xline = strcompress(xline, /REMOVE_ALL)                    ;remove whitespace
  zz = fxpar(xhdr, 'Z')                                      ;get redshift
  sig = fxpar(xhdr, strcompress(xline + 'SIG', /REMOVE_ALL)) ;sigma 
  c = fxpar(xhdr, strcompress(xline + 'C', /REMOVE_ALL))     ;constant 
  wl = emissionlines(xline)                                  ;wavelength
  wl = wl * (zz + 1.0)                                       ;observed wavelength
  
  ;;;make fake xs
  xs = ((10.0*sig)/(npts))*findgen(npts) - 5.0*sig + wl ;x points
  ys = c*exp(-1.0*(xs-wl)^2/(2.0*sig^2))                ;y values
  flux = int_tabulated(xs, ys, /DOUBLE)                 ;integrate 

  RETURN, flux
END
;========================================================================================================================



;========================================================================================================================
function mosfire_1dspec_measure, xdata, xhdr, xcat, xx, $
                                 FLUX=flux, $
                                 ERRFLUX=errflux, NERRITER=nerriter


  IF keyword_set(NERRITER) THEN nerriter = nerriter[0] ELSE nerriter = 500


  
  ;;;find flux of lines
  IF keyword_set(FLUX) THEN BEGIN
     lines = fxpar(xhdr, 'ZLINE*') ;find lines present
     FOR yy=0, n_elements(lines)-1, 1 DO BEGIN
        flux = getflux(lines[yy], xhdr)
        tag = strcompress(lines[yy] + '_FLUX', /REMOVE_ALL)
        ind = tagind(xcat, tag)
        xcat[xx].(ind) = flux
     ENDFOR
  ENDIF 
     

  ;;;find flux error in lines by Monte Carlo method
  IF keyword_set(ERRFLUX) THEN BEGIN
     llow = fxpar(xhdr, 'LLOWER')    ;get value from header
     lhig = fxpar(xhdr, 'LUPPER')    ;get value from header
     lines = fxpar(xhdr, 'ZLINE*')   ;find lines present
     priors = fxpar(xhdr, 'PRIOR*')  ;find lines present
     guesses = fxpar(xhdr, 'GUESS*') ;find lines present
     border = fxpar(xhdr, 'BORDER')  ;get value from header  
     
     nofitsky = fxpar(xhdr, 'NOFITSKY')                           ;check NOFITSKY value
     IF keyword_set(NOFITSKY) THEN BEGIN                          ;check to avoid fitting sky
        skylines = fxpar(xhdr, 'NOSKY')                           ;get which sky to avoid
        speclines, skylines, VALS=skyvals                         ;get skyline values
        cplamb = xdata.lambdas                                    ;copy 
        cplamb[*] = 1.0                                           ;set flags to one
        FOR xx=0, n_elements(skyvals.(0))-1, 1 DO BEGIN           ;loop over skylines
           chk = where((xdata.lambdas GE skyvals.lower[xx]) AND $ ;cont next line
                       (xdata.lambdas LE skyvals.upper[xx]))      ;find bad wavelengths
           IF chk[0] NE -1 THEN cplamb[chk] = 0                   ;set flag to zero
        ENDFOR                                                    ;end loop over skylines 
     ENDIF ELSE BEGIN                                             ;if not avoid sky lines
        cplamb = xdata.lambdas                                    ;copy
        cplamb[*] = 1.0                                           ;set all flags to one
     ENDELSE                                                      ;end not avoid
     bit = where((xdata.lambdas GE llow) AND $                    ;cont next line
                 (xdata.lambdas LE lhig) AND $                    ;cont next line
                 (cplamb EQ 1))                                   ;find subset
     
     
                                ;FOR yy=0, nerriter-1, 1 DO BEGIN
     FOR yy=0, 1, 1 DO BEGIN
        
        IF yy EQ 0 THEN BEGIN
           bayesian_spectral, xdata.lambdas[bit], xdata.spec1d[bit], xdata.spec1dwei[bit], FEATURES=lines, $
                              BORDER=border, FITVALS=fitvalsb, VARIES=varies, GUESSES=guesses, PRIORS=priors
           totsfit = fitvalsb
        ENDIF ELSE BEGIN
           bayesian_spectral, xdata.lambdas[bit], xdata.spec1d[bit], xdata.spec1dwei[bit], FEATURES=lines, $
                              BORDER=border, FITVALS=fitvalsb, VARIES=varies, GUESSES=guesses, PRIORS=priors
           totsfit = [totsfit, fitvalsb]
        ENDELSE
        ;help, totsfit, /STRUC
        ;print, totsfit
     ENDFOR
  ENDIF
     


  RETURN, xcat
END
;========================================================================================================================
