;========================================================================================================================
function getlambda, xdatahdr, SUBLAMB=sublamb

  naxis1 = fxpar(xdatahdr, 'NAXIS1')
  naxis2 = fxpar(xdatahdr, 'NAXIS2')
  crval1 = fxpar(xdatahdr, 'CRVAL1')
  crval2 = fxpar(xdatahdr, 'CRVAL2')
  cd1_1 = fxpar(xdatahdr, 'CD1_1')
  cd1_2 = fxpar(xdatahdr, 'CD1_2')
  cd2_1 = fxpar(xdatahdr, 'CD2_1')
  cd2_2 = fxpar(xdatahdr, 'CD2_2')


  IF keyword_set(sublamb) THEN BEGIN 
     print, ' You want a subset'
  ENDIF ELSE BEGIN
     lambdas = cd1_1*indgen(naxis1)+crval1
  ENDELSE


  return, lambdas
END
;========================================================================================================================




;========================================================================================================================
function fullstorage, xdata, xweight

  
  xstorage = {spec2d:xdata, $
              weight2d:xweight}
  
  RETURN, xstorage
END
;========================================================================================================================



;========================================================================================================================
function substorage, xdata, xweight

  
  xstorage = {spec2d:xdata, $
              weight2d:xweight, $
              skyprof:xdata, $
              spatprof:xdata, $
              spatproferr:xdata, $
              mask:xdata, $
              stdspec1d:xdata[*,0], $
              stdspecwei1d:xdata[*,0], $
              optspec1d:xdata[*,0], $
              optspecwei1d:xdata[*,0] }
  
  RETURN, xstorage
END
;========================================================================================================================



;========================================================================================================================
function currentiter, xdata, xweight

  
  xstorage = {spatprof:xdata, $
              spatproferr:xdata, $
              spec2d:xdata, $
              weight2d:xweight, $
              mask:xdata, $
              skymask:xdata, $
              spec1d:xdata[*,0], $
              spec1dwei:xdata[*,0] }
  
  RETURN, xstorage
END
;========================================================================================================================



;========================================================================================================================
pro printrow, xcentrow, xrowdown, xrowup

  print, '   Lower row (spatial) for extraction' + strcompress(': ' + string(xcentrow-xrowdown))
  print, '   Center row (spatial) for extraction' + strcompress(': ' + string(xcentrow))
  print, '   Upper row (spatial) for extraction' + strcompress(': ' + string(xcentrow+xrowup))
  print, ' '
  
END
;========================================================================================================================



;========================================================================================================================
pro printcol, xcoldown, xcolup

  print, '   Lower column for extraction' + strcompress(': ' + string(xcoldown))
  print, '   Upper column for extraction' + strcompress(': ' + string(xcolup))
  print, ' '
  
END
;========================================================================================================================



;========================================================================================================================
function extractstdspec, xdata, xrow, RLL=rll, RUL=rul, $
                         VERBOSE=verbose, HELP=help

  if keyword_set(RLL) then rll = rll[0] else rll = xrow - 5                 ;sets new value
  if keyword_set(RUL) then rul = rul[0] else rul = xrow + 5                 ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  
  szxdata = size(xdata)                      ;get array size
  xstdspec = fltarr(szxdata[1])              ;set new array
  IF help EQ 'Y' THEN help, xstdspec         ;print info 
  FOR xx=0UL, szxdata[1]-1, 1 DO BEGIN       ;loop over lambdas
     xstdspec[xx] = total(xdata[xx,rll:rul]) ;find standard extraction
  ENDFOR                                     ;end loop over lambdas
  
  RETURN, xstdspec
END
;========================================================================================================================



;========================================================================================================================
function extractstdspecwei, xwei, xrow, RLL=rll, RUL=rul, $
                            VERBOSE=verbose, HELP=help

  if keyword_set(RLL) then rll = rll[0] else rll = xrow - 5                 ;sets new value
  if keyword_set(RUL) then rul = rul[0] else rul = xrow + 5                 ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  
  szxwei = size(xwei)                                ;get array size
  xstdwei = fltarr(szxwei[1])                        ;set new array
  IF help EQ 'Y' THEN help, xstdwei                  ;print info 
  FOR xx=0UL, szxwei[1]-1, 1 DO BEGIN                ;loop over lambdas
     xstdwei[xx] = (total((xwei[xx,rll:rul])^2))^0.5 ;find standard extraction
  ENDFOR                                             ;end loop over lambdas
  
  RETURN, xstdwei
END
;========================================================================================================================



;========================================================================================================================
pro plotstdspec, xstdspec, xcall, OPTSPEC=optspec, OUTFILE=outfile

  WINDOW, 0, XPOS=100, YPOS=700, XSIZE=1300, YSIZE=300
  title = strcompress(string(xcall) + ' 1D Spec Extracts')
  xs = indgen(n_elements(xstdspec))
  plot, xs, xstdspec, PSYM=0, $
        COLOR='000000'XL, $
        BACKGROUND='FFFFFF'Xl, $
        TITLE=title, $
                                ;XTITLE='Wavelength [Angstroms]', $
        XTITLE='Spatial Position [Pixels]', $
                                ;XRANGE = [1000, 1100], $
        YTITLE='Flux [arbitrary units]', $
        CHARSIZE=1.4, $
        CHARTHICK = 1.75, $
        SYMSIZE=0.5
  IF keyword_set(OPTSPEC) THEN BEGIN
     oplot, xs, optspec, PSYM=0, $
            COLOR='00FF00'XL, $
            SYMSIZE=0.5
  ENDIF
;  legend, ['Standard Extraction', 'Optimal Extraction'], LINESTYLE=[0,0],  $ ;create legend
;          COLOR=['000000'XL, '00FF00'XL], $                                  ;legend options
;          TEXTCOLOR='000000'XL, $                                            ;legend options
;          CHARSIZE=1.3, THICK=2.0, BOX=0, /RIGHT                             ;legend options
  
        
  IF keyword_set(OUTFILE) THEN BEGIN
     set_plot, 'ps'                ;sets plot type
     device, FILENAME=outfile, /COLOR ;creates graphics device
     plot, xs, xstdspec, PSYM=0, $
           COLOR='000000'XL, $
           BACKGROUND='FFFFFF'Xl, $
           TITLE=title, $
                                ;XTITLE='Wavelength [Angstroms]', $
           XTITLE='Spatial Position [Pixels]', $
                                ;XRANGE = [2000, 2100], $
           YTITLE='Flux [arbitrary units]', $
           CHARSIZE = 1.5, $
           CHARTHICK = 3.0, $
           SYMSIZE = 0.5
     IF keyword_set(OPTSPEC) THEN BEGIN
        oplot, xs, optspec, PSYM=0, $
               COLOR = '00FF00'XL, $
               SYMSIZE = 0.5
     ENDIF
     ;legend, ['Standard Extraction', 'Optimal Extraction'], LINESTYLE=[0,0],  $ ;create legend
     ;        COLOR=['000000'XL, '00FF00'XL], $                                  ;legend options
     ;        TEXTCOLOR='000000'XL, $                                            ;legend options
     ;        CHARSIZE=1.2, CHARTHICK = 3.0,$                                    ;legend opts
     ;        THICK=2.0, BOX=0, /RIGHT                                           ;legend options
     device, /CLOSE                                                             ;close device
     set_plot, 'x'                                                              ;reset plot type
  ENDIF
  
  
END
;========================================================================================================================



;========================================================================================================================
pro plotstdsnr, xstdsnr, xcall, OPTSNR=optsnr, OUTFILE=outfile

  WINDOW, 2, XPOS=125, YPOS=525, XSIZE=1300, YSIZE=300
  title = strcompress(string(xcall) + ' 1D Spec SNRs')
  xs = indgen(n_elements(xstdsnr))
  plot, xs, xstdsnr, PSYM=0, $
        COLOR='000000'XL, $
        BACKGROUND='FFFFFF'Xl, $
        TITLE=title, $
                                ;XTITLE='Wavelength [Angstroms]', $
        XTITLE='Spatial Position [Pixels]', $
                                ;XRANGE = [1000, 1100], $
        YTITLE='Flux [arbitrary units]', $
        YRANGE = [0.0, 30.0], $
        CHARSIZE=1.4, $
        CHARTHICK = 1.75, $
        SYMSIZE=0.5
  IF keyword_set(OPTSNR) THEN BEGIN
     oplot, xs, optsnr, PSYM=0, $
            COLOR='00FF00'XL, $
            SYMSIZE=0.5
  ENDIF
                                ;  legend, ['Standard Extraction', 'Optimal Extraction'], LINESTYLE=[0,0],  $ ;create legend
                                ;          COLOR=['000000'XL, '00FF00'XL], $                                  ;legend options
                                ;          TEXTCOLOR='000000'XL, $                                            ;legend options
                                ;         CHARSIZE=1.3, THICK=2.0, BOX=0, /RIGHT                             ;legend options
  

  randomout = {xs:xs, ysstd:xstdsnr, ysopt:optsnr}
  mwrfits, randomout, 'mosfire_stdvsopt.fits', /CREATE

        
  IF keyword_set(OUTFILE) THEN BEGIN
     set_plot, 'ps'                   ;sets plot type
     device, FILENAME=outfile, /COLOR ;creates graphics device
     plot, xs, xstdsnr, PSYM=0, $
           COLOR='000000'XL, $
           BACKGROUND='FFFFFF'Xl, $
           TITLE=title, $
                                ;XTITLE='Wavelength [Angstroms]', $
           XTITLE='Spatial Position [Pixels]', $
                                ;XRANGE = [2000, 2100], $
           YTITLE='Flux [arbitrary units]', $
           YRANGE = [0.0, 30.0], $
           CHARSIZE = 1.5, $
           CHARTHICK = 3.0, $
           SYMSIZE = 0.5
     IF keyword_set(OPTSNR) THEN BEGIN
        oplot, xs, optsnr, PSYM=0, $
               COLOR = '00FF00'XL, $
               SYMSIZE = 0.5
     ENDIF
     ;legend, ['Standard Extraction', 'Optimal Extraction'], LINESTYLE=[0,0],  $ ;create legend
     ;        COLOR=['000000'XL, '00FF00'XL], $                                  ;legend options
     ;        TEXTCOLOR='000000'XL, $                                            ;legend options
     ;        CHARSIZE=1.2, CHARTHICK = 3.0,$                                    ;legend opts
     ;        THICK=2.0, BOX=0, /RIGHT                                           ;legend options
     device, /CLOSE                                                             ;close device
     set_plot, 'x'                                                              ;reset plot type
  ENDIF
  
  
END
;========================================================================================================================



;========================================================================================================================
PRO plotsumprof, xprof1d, CALL=call, ERRORS=errors, YPAD=ypad, $
                 CENTER=center, DITHER=dither, LEGEND=legend
  
  IF keyword_set(YPAD) THEN ypad = ypad[0] ELSE ypad = 0.05     ;set new value
  IF keyword_set(CALL) THEN call = call[0] ELSE call = ''       ;set new value
  title = strcompress(string(call) + ' Summed Spatial Profile') ;guess at title
  
  xs = indgen(n_elements(xprof1d))                            ;find x values
  pad = ypad*(max(xprof1d) - min(xprof1d))                    ;find padding on domain
  fakexs = [-999999.9, 999999.9]                              ;fake y values
  fakeys = [-999999.9, 999999.9]                              ;fake y values
  mywindow = window(LOCATION=[100,175], DIMENSIONS=[500,500]) ;plot window

  CASE keyword_set(ERRORS) OF 
     0 : BEGIN
        myplot = plot(xs, xprof1d, /CURRENT, $
                      TITLE=title, $
                      XRANGE = [min(xs), max(xs)], $
                      XTITLE='Spatial Position [pixels]', $
                      YTITLE='Flux [arbitrary]', $
                      FONT_SIZE = 12, $
                      THICK = 2)
     END
     1 : BEGIN
        myplot = errorplot(xs, xprof1d, errors, /CURRENT, $
                           TITLE=title, $
                           XTITLE='Spatial Position [pixels]', $
                           YTITLE='Flux [arbitrary]', $
                           YRANGE = [min(xprof1d)-ypad, max(xprof1d)+ypad], $
                           FONT_SIZE = 12, $
                           THICK = 2)
     END
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!' 
  ENDCASE
  IF keyword_set(CENTER) THEN BEGIN                                     ;check if CENTER given
     maxxs = [center, center]                                           ;two points for plotting
     myplot = plot(maxxs, fakeys, LINESTYLE=0, /OVERPLOT, $             ;overplot
                   THICK=2.0)                                           ;oplot options
     myplot = plot(fakexs, [0.0,0.0], LINESTYLE=1, /OVERPLOT, $         ;overplot
                   THICK=2.0)                                           ;oplot options
  ENDIF                                                                 ;end check CENTER given
  IF keyword_set(DITHER) THEN BEGIN                                     ;check if DITHER given
     myplot = plot(fix(maxxs-dither), fakeys, LINESTYLE=2, /OVERPLOT, $ ;overplot
                   THICK=2.0)                                           ;oplot options
     myplot = plot(fix(maxxs+dither), fakeys, LINESTYLE=2, /OVERPLOT, $ ;overplot
                   THICK=2.0)                                           ;oplot options
  ENDIF                                                                 ;end check on DITHER
  
  ;in = ' '                                                             ;initialize
  ;xtext = '   Proceed with fitting? [yes]'                             ;text to pass
  ;read, in, PROMPT= xtext                                              ;prompt for tag
  ;IF ((in NE '') OR (in NE 'y') OR (in NE 'yes')) THEN a=1 ELSE stop   ;stop if not true


END
;========================================================================================================================


;========================================================================================================================
function makeskymask, xband, xlambdas, xdata
  

  speclines, xband, VALS=skyvals ;get spectral lines
  xskymask = xdata               ;make a copy
  xskymask[*,*] = 1              ;set all to 1
  
  FOR xx=0UL, n_elements(skyvals.(0))-1 DO BEGIN ;loop over spec lines
     chk = where((xlambdas GE skyvals.lower[xx]) AND (xlambdas LE skyvals.upper[xx]), nchk) ;find sky lines in spectrum
     IF nchk NE 0 THEN xskymask[chk, *] = 0                                                 ;set sky lines areas to zero
  ENDFOR                                                                                    ;end loop over spec lines

  RETURN, xskymask
END
;========================================================================================================================


;========================================================================================================================
function fitskyprof, xdata, xweight, xrow, LL=ll, UL=ul, $
                     VERBOSE=verbose, HELP=help
  

  if keyword_set(LL) then ll = ll[0] else ll = 5                       ;sets new value
  if keyword_set(UL) then ul = ul[0] else ul = 5                       ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0]+1 else verbose = 2 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'                 ;sets new value
  

  print, '  NO ADDITIONAL SKY FITTING DONE AT THIS TIME!!'
  print, ' '
  xskyprof = xdata[*,xrow-ll:xrow+ul]
  xskyprof[*,*] = 0.0
  
  RETURN, xskyprof
END
;========================================================================================================================



;========================================================================================================================
function storecoeffs, xcoeffs, xresults, xrow

  FOR xx=0, n_elements(xresults)-1, 1 DO BEGIN
     xcoeffs[xrow].(xx) = xresults[xx]
  ENDFOR

  return, xcoeffs
END
;========================================================================================================================



;========================================================================================================================
function grabcoeffs, xcoeffs, xrow

  tags = tag_names(xcoeffs)
  FOR yy=0, n_elements(tags)-1, 1 DO BEGIN
     IF yy EQ 0 THEN arrcoeffs = xcoeffs[xrow].(yy) ELSE $
        arrcoeffs = [arrcoeffs, xcoeffs[xrow].(yy)]
  ENDFOR

  return, arrcoeffs
END
;========================================================================================================================



;========================================================================================================================
function makespatprof, xdata, xweight, xrow, xdither, $
                       VERBOSE=verbose, HELP=help
  
  if keyword_set(VERBOSE) then verbose = verbose[0]+1 else verbose = 2 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'                 ;sets new value

  ;;;info
  IF help EQ 'Y' THEN help, xdata                                             ;offer help
  dsize = size(xdata)                                                         ;get size of array
  line = strcompress('   Size of 2D spectra in spatial profile fitting: ' + $ ;cont next line
                     string(dsize[1]) + ' x' + string(dsize[2]))              ;line to print
  IF verbose GE 2 THEN print, line                                            ;print info
  
  
  
  ;;;determine which spatial pixels to use
  spatsum = total(xdata, 1)                                     ;sum data along wavelength
  maxval = max(spatsum, maxind)                                 ;find max location
  chk = abs(maxind - xrow)                                      ;find how off DRP guess is
  IF (chk GT 2.0) THEN BEGIN                                    ;if guess is bad
     line = '  MOSFIRE DRP guess at spatial position is poor!!' ;line to print
     IF verbose GE 2 THEN print, line                           ;print info
  ENDIF                                                         ;end guess is bad
  plotsumprof, spatsum, CENTER=maxind, DITHER=xdither, /LEGEND  ;plot it
  llim = fix(maxind - xdither)                                  ;lower limit to fit
  ulim = fix(maxind + xdither)                                  ;upper limit to fit
  

  ;;;find fraction for each pixel
  spatprof = xdata                                      ;make a copy
  spatprof[*,*] = 0.0                                   ;set all copy to zero
  wavetotals = xdata[*,llim:ulim]                       ;grab subset
  wavetotals = total(wavetotals, 2)                     ;sum over spatial positions
  chk = where(wavetotals GE 0.0)                        ;find non-negative totals
  FOR ii=llim, ulim, 1 DO BEGIN                         ;loop over spatial dir
     spatprof[chk,ii] = xdata[chk,ii] / wavetotals[chk] ;find fraction of light in each pixel
  ENDFOR                                                ;end loop over spatial dir
  chk = where(spatprof NE spatprof)                     ;find NaNs, INFs
  IF chk[0] NE -1 THEN spatprof[chk] = 0.0              ;set to 0
  chk = where(spatprof LT 0.0)                          ;find negatives
  IF chk[0] NE -1 THEN spatprof[chk] = 0.0              ;set to 0
  chk = where(spatprof GT 1.0)                          ;find values above 1
  IF chk[0] NE -1 THEN spatprof[chk] = 0.0              ;set to 0
  

  ;;;find fraction error for each pixel
  spatproferr = xdata                     ;make a copy
  spatproferr[*,*] = 0.0                  ;set all copy to zero
  chk = where(xweight GT 0.0)             ;find nonzero weights
  xweight[chk] = xweight[chk]^(-0.5)      ;find variance (sigma^2)
  errtotals = xweight[*,llim:ulim]        ;grab subset
  errtotals = total(errtotals, 2)         ;sum errors
  errtotals = errtotals^0.5               ;finishing adding in quadrature
  fracerr = errtotals / wavetotals        ;fractional error in total flux
  fracerr = fracerr^2                     ;squared
  chk = where(fracerr NE fracerr)         ;double check
  IF chk[0] NE -1 THEN fracerr[chk] = 0.0 ;set to zero
  
  FOR ii=llim, ulim, 1 DO BEGIN                                                         ;loop over spatial dir
     spatproferr[*,ii] = spatprof[*,ii] * ((xweight[*,ii]/xdata[*,ii])^2 + fracerr)^0.5 ;find error in fraction of light in each pixel
  ENDFOR                                                                                ;end loop over spatial dir
  
  RETURN, {mspatprof:spatprof, mspatproferr:spatproferr} ;return raw spatial profle
END
;========================================================================================================================



;========================================================================================================================
function makespatprofsum, xdata, xskymask, cll, cul, xcentrow, RLL=rll, RUL=rul, $
                          NORMALIZE=normalize, $
                          VERBOSE=verbose, HELP=help
  
  if keyword_set(LL) then ll = ll[0] else ll = 5                       ;sets new value
  if keyword_set(UL) then ul = ul[0] else ul = 5                       ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0]+1 else verbose = 2 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'                 ;sets new value


  xdata = xdata * xskymask       ;apply mask
  bit = xdata[cll:cul,*]         ;take bit
  rows = rll+rul+1               ;# of rows
  prof1d = fltarr(rows)          ;create 1d array
  FOR xx=0UL, rows-1, 1 DO BEGIN 
     prof1d[xx] = total(xdata[cll:cul,xx])
  ENDFOR
  IF keyword_set(NORMALIZE) THEN BEGIN
     norm = total(prof1d)
     prof1d = prof1d / norm
  ENDIF

  RETURN, prof1d                ;return raw spatial profle
END
;========================================================================================================================


;========================================================================================================================
function makespatprofsumerr, xwei, xskymask, cll, cul, xcentrow, RLL=rll, RUL=rul, $
                             NORMALIZE=normalize, $
                             VERBOSE=verbose, HELP=help
  
  if keyword_set(RLL) then rll = rll[0] else rll = 5                   ;sets new value
  if keyword_set(RUL) then rul = rul[0] else rul = 5                   ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0]+1 else verbose = 2 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'                 ;sets new value


  xwei = xwei * xskymask        ;apply mask
  bit = xwei[cll:cul,*]         ;get appropriate columns
  rows = rll+rul+1              ;get appropriate rows
  wei1d = fltarr(rows)
  xwei = 1.0 / xwei
  chk = where(xwei GT 999999999.99, nchk)
  IF nchk NE 0 THEN xwei[chk] = 0.0
  FOR xx=0UL, rows-1, 1 DO BEGIN
     wei1d[xx] = (total(xwei[cll:cul,xx]))^0.5
  ENDFOR
  IF keyword_set(NORMALIZE) THEN BEGIN
     norm = total(wei1d)
     wei1d = wei1d / norm
  ENDIF

  RETURN, wei1d                 ;return weight for spatial profile
END
;========================================================================================================================



;========================================================================================================================
function fitspatprof, xdata, xweight, xskyprof, xstdspec, xspatprof, xspatproferr, $ 
                      SMOITER=smoiter, FITITER=fititer, NORDER=norder, SIGREJ=sigrej, SHRINK=shrink, $
                      VERBOSE=verbose, HELP=help
  
  IF keyword_set(SMOITER) THEN smoiter = smoiter[0] ELSE smoiter = 3 ;sets new value
  IF keyword_set(FITITER) THEN fititer = fititer[0] ELSE fititer = 5 ;sets new value
  IF keyword_set(NORDER) THEN norder = norder[0] ELSE norder = 2     ;sets new value
  IF keyword_set(SIGREJ) THEN sigrej = sigrej[0] ELSE sigrej = 10.0  ;sets new value
  IF keyword_set(SHRINK) THEN shrink = shrink[0] ELSE shrink = 0.025 ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value
  IF keyword_set(HELP) THEN help = 'Y' ELSE help = 'N'               ;sets new value


  ;;;sanity checks
  nspat = n_elements(xspatprof[0,*])                        ;number of spatial positions
  nspatdata = n_elements(xdata[0,*])                        ;number of spatial positions
  nspatwei = n_elements(xweight[0,*])                       ;number of spatial positions
  nspatsky = n_elements(xskyprof[0,*])                      ;number of spatial positions
  IF (nspat NE nspatdata) OR (nspatdata NE nspatwei) OR $   ;cont next line
     (nspatwei NE nspatsky) THEN BEGIN                      ;make sure same number of spatial elements
     print, 'WARNING!!! # of spatial elements not equal!!!' ;print info
     stop                                                   ;end program
  ENDIF                                                     ;end spat element check
  

  ;;;set up structures to store coefficient fitting
  CASE norder OF 
     0 : BEGIN
        coeff = {a0:0.0}
        coefferr = {da0:0.0}
     END
     1 : BEGIN
        coeff = {a0:0.0, a1:0.0}
        coefferr = {da0:0.0, da1:0.0}
     END
     2 : BEGIN
        coeff = {a0:0.0, a1:0.0, a2:0.0, shrink:0.0, med:0.0}
        coefferr = {da0:0.0, da1:0.0, da2:0.0, shrink:0.0, med:0.0}
     END
     3 : BEGIN
        coeff = {a0:0.0, a1:0.0, a2:0.0, a3:0.0}
        coefferr = {da0:0.0, da1:0.0, da2:0.0, da3:0.0}
     END
     4 : BEGIN
        coeff = {a0:0.0, a1:0.0, a2:0.0, a3:0.0, a4:0.0}
        coefferr = {da0:0.0, da1:0.0, da2:0.0, da3:0.0, da4:0.0}
     END
     ELSE : BEGIN
        IF verbose GE 3 THEN print, '   NORDER choice not recognized!! Using default!!' ; 
        coeff = {a0:0.0, a1:0.0, a2:0.0}
        coefferr = {da0:0.0, da1:0.0, da2:0.0}
    END
  ENDCASE
  coeffs = replicate(coeff, nspat)
  coefferrs = replicate(coefferr, nspat)
  IF help EQ 'Y' THEN BEGIN
     help, coeffs, /STRUC
     help, coefferrs, /STRUC
  ENDIF

  
  ;;;set up plot window
  fakexs = [-250.0, 2500.0]
  fakeys = [-0.1, 0.4]
  mywindow = window(LOCATION=[225,50], DIMENSIONS=[600,800])
  plot, fakexs, fakeys, PSYM=1, /NODATA, $
        COLOR='000000'XL, $
        BACKGROUND='FFFFFF'XL, $
        TITLE= 'One Spatial Position Poly Fit to Flux Fraction', $
        XRANGE=fakexs, $
        XTITLE='Spatial Position [Pixels]', $
        YRANGE=fakeys, $
        YTITLE='Starlight Fraction', $
        CHARSIZE=1.5, $
        CHARTHICK=1.75
 
  output_chk = 0
  ;;;fit the spatial profile
  coeffs[*].shrink = shrink     ;store shrink factor
  coefferrs[*].shrink = shrink  ;store shrink factor
  FOR ii=0, n_elements(xspatprof[0,*])-1, 1 DO BEGIN                                                ;loop over spatial profile
     line = '  Now fitting fraction of light as a function on wavelength at spatial position: ' + $ ;cont next line
            string(ii)                                                                              ;info to print
     IF verbose GE 1 THEN print, line                                                               ;print, info
     
     ys = xspatprof[*,ii]                                                        ;get  frac flux subset
     chk = where((ys NE ys) OR (ys NE ys) OR (ys EQ 0.0), nchk, COMPLEMENT=good) ;find bad points
     good1 = good                                                                ;make a copy of good points
     ys[chk] = 0.0                                                               ;kill the NaNs, INFs
     yserr = xspatproferr[*,ii]                                                  ;get frac flux err subset
     good = where(ys GT 0.0, nchk)                                               ;find good points
     IF nchk GT 250 THEN BEGIN                                                   ;if enough point
        xs = dindgen(n_elements(ys))                                             ;get wavelength position values
        modxs = shrink*(xs - median(xs))                                         ;shift wavelength position
        coeffs[ii].med = median(xs)                                              ;store median value
        coefferrs[ii].med = median(xs)                                           ;store median value
        yssky = xskyprof[*,ii]                                                   ;get sky values
        ysdat = xdata[*,ii]                                                      ;get data values
        ysdaterr = xweight[*,ii]                                                 ;get weight values

        oploterror, xs[good], ys[good], yserr[good], PSYM=1, COLOR='000000'XL, ERRCOLOR='000000'XL ;make a window 
        ;;;iterate on smoothing
        jj=0                                                                   ;intialize
        dxs = -1                                                               ;intialize
        dys = -1                                                               ;intialize
        stopsmoiter = 'N'                                                      ;intialize
        WHILE (jj LE smoiter-1) AND (stopsmoiter EQ 'N') DO BEGIN              ;until iterating ends/fails
           IF verbose GE 4 THEN print, '   Now on smoothing iteration: ', jj+1 ;print info

           ;;;iterate on fitting
           kk=0                                                                                           ;intialize
           stopfititer = 'N'                                                                              ;intialize
           WHILE (kk LE fititer-1) AND (stopfititer EQ 'N') DO BEGIN                                      ;until iterating ends/fails
              CASE KK OF                                                                                  ;iteration case
                 0 : BEGIN                                                                                ;if first time 
                    bayesian_quadratic_yerr, modxs[good], ys[good], yserr[good], ITERATE=iterate, $          ;cont next line
                                             WINSTART=3, AMIN=-0.001, AMAX=0.001, $                       ;cont next line
                                             BMIN=-0.01, BMAX=0.01, $                                     ;cont next line
                                             CMIN=-0.2, CMAX=0.5                                          ;fit quadratic      
                 END                                                                                      ;end if first time
                 fititer-1 : BEGIN                                                                        ;if not first, not last
                    bayesian_quadratic_yerr, modxs[good], ys[good], yserr[good], FITS=fits,$                 ;cont next line
                                             WINSTART=3, AMIN=iterate.all, AMAX=iterate.aul, ABINS=50, $ ;cont next line
                                             BMIN=iterate.bll, BMAX=iterate.bul, BBINS=50, $             ;cont next line
                                             CMIN=iterate.cll, CMAX=iterate.cul, CBINS=50                ;fit quadratic   
                 END                                                                                      ;end if not first not last
                 ELSE : BEGIN                                                                             ;if last time
                    bayesian_quadratic_yerr, modxs[good], ys[good], yserr[good], ITERATE=iterate, $          ;cont next line
                                             WINSTART=3, AMIN=iterate.all, AMAX=iterate.aul, $            ;cont next line
                                             BMIN=iterate.bll, BMAX=iterate.bul, $                        ;cont next line
                                             CMIN=iterate.cll, CMAX=iterate.cul                           ;fit quadratic
                 END                                                                                      ;end if last
              ENDCASE                                                                                     ;end iteration case
              kk = kk + 1                                                                                 ;up interation counter
           ENDWHILE                                                                                       ;end fit iteration
           
           ;;;store the fit parameters
           FOR xx=norder, 0, -1 DO BEGIN                              ;loop over order of fit params
              IF xx EQ norder THEN BEGIN                              ;first fit param
                 results = fits.(3*xx)                                ;start array
                 sigmas = 0.5*(fits.(3*xx+1)+fits.(3*xx+2))           ;start array
              ENDIF ELSE BEGIN                                        ;if not first fit param
                 results = [results, fits.(3*xx)]                     ;add to array
                 sigmas = [sigmas, 0.5*(fits.(3*xx+1)+fits.(3*xx+2))] ;add to array
              ENDELSE                                                 ;end if not first
           ENDFOR                                                     ;end loop over order
           coeffs = storecoeffs(coeffs, results, ii)                  ;store values
           coefferrs = storecoeffs(coefferrs, sigmas, ii)             ;store values
           IF verbose GE 4 THEN BEGIN                                 ;check verbose
              print, '    Coefficients of fit: ', results             ;print info
              print, '    Coefficient errors: ', sigmas               ;print info
           ENDIF                                                      ;end check verbose

           ;;;evaluate the fit, discard outliers
           yfit = poly(modxs, results)                                                    ;evaluate the resulting fit
           offby = (ysdat[good]-yssky[good]-xstdspec[good]*yfit[good])^2 * ysdaterr[good] ;find sigmas away from fit
           ditch = where(offby GE sigrej^2, nditch, COMPLEMENT=keep)                      ;we want points <= sig reject

           IF ditch[0] NE -1 THEN BEGIN ;if some points should be tossed 
              IF verbose GE 5 THEN print, '     ditching points!' ;print info
              IF (jj EQ 0) THEN BEGIN ;
                 dxs = xs[good[ditch]] 
                 dys = ys[good[ditch]] 
                 dyserr = ysdaterr[good[ditch]] 
              ENDIF ELSE BEGIN 
                 dxs = [dxs,xs[good[ditch]]] 
                 dys = [dys,ys[good[ditch]]] 
                 dyserr = [dyserr,ysdaterr[good[ditch]]] 
              ENDELSE
              good = good[keep]                         ;keep good points
           ENDIF ELSE BEGIN                             ;if nothing to toss
              IF verbose GE 3 THEN print, '    Escape!' ;print info
              stopsmoiter = 'Y'                         ;we can stop iterating
           ENDELSE                                      ;end if nothing to toss

           sample_output = {xs:xs, ys:ys, ysfit:yfit, dxs:dxs}
           help, sample_output
           mwrfits, sample_output, strcompress('sample_fullspatialfit' + string(ii) + '.fits', /REMOVE_ALL), /CREATE

           ;;;plot data and fit
           window, 2, XPOS=225, YPOS=50, XSIZE=600, YSIZE=800                                            ;window info
           plot, fakexs, yfit, PSYM=1, /NODATA, $                                                        ;no plot data
                 COLOR='000000'XL, $                                                                     ;plot options
                 BACKGROUND='FFFFFF'XL, $                                                                ;plot options
                 TITLE= 'One Spatial Position Poly Fit to Flux Fraction', $                              ;plot options
                 XRANGE=fakexs, $                                                                        ;plot options
                 XTITLE='Spatial Position [Pixels]', $                                                   ;plot options
                 YRANGE=fakeys, $                                                                        ;plot options
                 YTITLE='Starlight Fraction', $                                                          ;plot options
                 CHARSIZE=1.5, $                                                                         ;plot options
                 CHARTHICK=1.75                                                                          ;plot options
           oploterror, xs[good1], ys[good1], yserr[good1], PSYM=1, COLOR='000000'XL, ERRCOLOR='000000'XL ;overplot points
           oplot, xs, yfit, LINESTYLE=0, THICK=2.0, COLOR='00FF00'XL                                     ;overplot fit
           IF dxs[0] NE -1 THEN oplot, dxs, dys, PSYM=7, COLOR='0000FF'XL                                ;over plot x's on bad 
              
           jj = jj + 1                                                                          ;up counter
        ENDWHILE                                                                                ;end iterating fails/ends
     ENDIF ELSE BEGIN                                                                           ;if not enough points
        IF verbose GE 3 THEN print, '  Not enough nonzero points to fit this spatial position!' ;print info
     ENDELSE                                                                                    ;if enough points
  ENDFOR                                                                                        ;end loop spatial profile


  RETURN, coeffs
END
;========================================================================================================================


;========================================================================================================================
function fitspatprofsum, xprof1d, xwei1d, xspatfit, GUESSES=guesses, PRIORS=priors, $
                         XPROF1DWEI=xprof1dwei, $ 
                         NITER=niter, BORDER=border, $
                         YOFFSET=yoffset, PLOTFIT=plotfit, PLOTPARAMS=plotparams, CALL=call, $
                         VERBOSE=verbose, HELP=help
  
  if keyword_set(NITER) then niter = niter[0] else niter = 5         ;sets new value
  if keyword_set(BORDER) then border = border[0] else border = 2     ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  
  xs = indgen(n_elements(xprof1d))
  CASE xspatfit OF
     'gauss1' : BEGIN
        line = ' Fitting single gaussian to summed spatal profile!'
        if verbose GE 1 THEN print, line
        CASE border OF
           0 : BEGIN
              IF verbose GE 2 THEN print, '  Assuming no background!'
              print, 'NOT DONE YET!!'
           END
           1 : BEGIN
              IF verbose GE 2 THEN print, '  Fitting background to constant!'
              print, 'NOT DONE YET!!'
           END
           2 : BEGIN
              IF verbose GE 2 THEN print, '  Fitting background to linear!'
              fititer = 1
              WHILE fititer LE niter DO BEGIN
                 tick = systime(/SECONDS) 
                 line = strcompress('    Now on iteration: ' + string(fititer) + ' of ' + string(niter))
                 IF verbose GE 2 THEN print, line
                 IF fititer EQ 1 THEN BEGIN
                    bayesian_gaussian_lincont, xs, xprof1d, xwei1d, FITVALS=fitvals, ITERATE=myiter
                 ENDIF ELSE BEGIN
                    bayesian_gaussian_lincont, xs, xprof1d, xwei1d, FITVALS=fitvals, $
                                               MUMIN=myiter.mumin, MUMAX=myiter.mumax, MUBIN=myiter.mubin, $
                                               SIGMIN=myiter.sigmin, SIGMAX=myiter.sigmax, SIGBIN=myiter.sigbin, $
                                               CMIN=myiter.cmin, CMAX=myiter.cmax, CBIN=myiter.cbin, $
                                               AMIN=myiter.amin, AMAX=myiter.amax, ABIN=myiter.abin, $
                                               BMIN=myiter.bmin, BMAX=myiter.bmax, BBIN=myiter.bbin, $
                                               ITERATE=myiter
                 ENDELSE
                 tock = systime(/SECONDS) 
                 fititer = fititer + 1 
                 line = '   ' + strcompress('     Iteration took: ' + string(tock-tick) + 's')
                 IF verbose GE 3 THEN print, line
              ENDWHILE
           END
           ELSE : BEGIN
              IF verbose GE 2 THEN print, '  WARNING!! Background order not recognized! Using default. '
           END
        ENDCASE
     END
     'gauss3' : BEGIN                                                                                     ;three gaussians
        line = '  Fitting three simultaneous gaussians to summed spatal profile!'                         ;info
        if verbose GE 1 THEN print, line                                                                  ;print info
        tick = systime(/SECONDS)                                                                          ;start time
        bayesian_nir_spatial, xs, xprof1d, xwei1d, INSTANCE='MOSFIRE', CALL=call, $                       ;cont next line
                              YOFFSET=yoffset, GUESSES=guesses, PRIORS=priors, BORDER=border, $           ;cont next line
                              FITVALS=fitvals                                                             ;fit with 3 Gaussians
        spawn, 'mv bayesian_nir_spatproffit.ps ' + plotfit                                                ;rename file
        spawn, 'mv bayesian_nir_spatprofparams.pdf ' + plotparams                                         ;rename file

        
        tock = systime(/SECONDS)                                                                          ;end time
        line = '  ' + strcompress('Fitting iteration took: ' + string(tock-tick) + 's')                   ;info
        IF verbose GE 3 THEN print, line                                                                  ;print info
        print, '  ======================================================================================' ;
     END                                                                                                  ;end gauss3 option
     ELSE : BEGIN                                                                                         ;catch fit option
        print, 'WARNING!! Given spatial fit profile not valid.'                                           ;print info
        print, '  Choices are "gauss1" or "gauss3"...'                                                    ;print info
        stop                                                                                              ;stop program
     END                                                                                                  ;end catch fit option
  ENDCASE                                                                                                 ;end fit case
  
  RETURN, fitvals
END
;========================================================================================================================


;========================================================================================================================
function evalspatprof, xdata, xcoeffs, $ 
                       VERBOSE=verbose, HELP=help
  
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  
  xdsize = size(xdata)          ;number of points
  xs = indgen(xdsize[1])        ;x values
  profim = xdata                ;copy data array
  profim[*,*] = 0               ;reset to all zero

  FOR xx=0, xdsize[2]-1, 1 DO BEGIN         ;loop over spatial dir
     tmpcoeffs = grabcoeffs(xcoeffs, xx)    ;get coeffs
     ncoeffs = n_elements(tmpcoeffs)        ;find number of elements
     polycoeffs = tmpcoeffs[0:ncoeffs-3]    ;grab just polynomial coeffs
     shrink = tmpcoeffs[ncoeffs-2]          ;grab shrink factor
     med = tmpcoeffs[ncoeffs-1]             ;grab median xs val
     modxs = shrink*(xs - med)              ;shift and shrink domain
     profim[*,xx] = poly(modxs, polycoeffs) ;fill in profile image
  ENDFOR                                    ;end loop over spatial dir

  chk = where(profim LT 0.000, nchk) ;ensure positivity
  profim[chk] = 0.0                  ;set to zero if negative

  FOR xx=0, xdsize[1]-1, 1 DO BEGIN    ;loop over wavelength dir
     tmp = total(profim[xx,*])         ;find total
     profim[xx,*] = profim[xx,*] / tmp ;ensure normalization
  ENDFOR                               ;end loop over spatial dir
  

  mwrfits, profim, 'temp_profim.fits', /CREATE ;&&&&&&&&&&&&&
  return, profim
END
;========================================================================================================================


;========================================================================================================================
function evalspatprofsum, xdata, xco, which, yoffset, BORDER=border, $ 
                          VERBOSE=verbose, HELP=help
  
  if keyword_set(BORDER) then border = border[0] else border = 2     ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  
  xdsize = size(xdata)
  xs = indgen(xdsize[2])
  profim = xdata
  CASE which OF                                                                     ;which fit was used
     'gauss1' : ys = xco.c1*exp(-(xs-xco.mu1)^2/(2.0*xco.sig1^2))                   ;single gaussian, background subtracted
     'gauss3' : ys = xco.c*exp(-(xs-xco.mu)^2/(2.0*xco.sig^2)) + $                  ;three gaussian
                     (-0.5*xco.c)*exp(-(xs-(xco.mu-yoffset))^2/(2.0*xco.sig^2)) + $ ;cont next round
                     (-0.5*xco.c)*exp(-(xs-(xco.mu+yoffset))^2/(2.0*xco.sig^2))     ;background subtracted
     ELSE : BEGIN                                                                   ;alt to which fit was used
        print, 'WARNING!! Something has gone horribly wrong!!'                      ;print info
        stop                                                                        ;stop run
     END                                                                            ;end alt to which fit was used
  ENDCASE                                                                           ;end choice of fit

  FOR xx=0, xdsize[1]-1, 1 DO BEGIN
     profim[xx,*] = ys
  ENDFOR  

  chk = where(profim LT 0.000, nchk) ;find place where profile is negative
  IF nchk NE 0 THEN profim[chk] = 0.0 ;set those places to zero

  profnorm = total(profim, 2)   ;sum values spatially
  boxscore, profnorm, VALUES=pvals, /QUIET ;get boxscore
  IF alog10(pvals[1]) GT -8.0 THEN BEGIN
     print, 'WARNING!! Profile image isnt uniform!!'
     stop
  ENDIF
  profim = profim / profnorm[0]
  
  RETURN, profim
END
;========================================================================================================================


;========================================================================================================================
function removecosmicrays, xdata, xivar, xskyprof, xspatprof, xstdspec, xmask, $ 
                           SIGREG=sigrej, MAXITER=maxiter, $
                           VERBOSE=verbose, HELP=help
  
  if keyword_set(SIGREJ) then sigrej = sigrej[0] else sigrej = 5.0   ;sets new value
  if keyword_set(MAXITER) then maxiter = maxiter[0] else maxiter = 5 ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 3 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  
  xdsize = size(xdata)
  dchk = where(xmask EQ 0, ndchk)

  FOR xx=0, xdsize[1]-1, 1 DO BEGIN
     iter = 'yes'
     niter = 0
     WHILE iter EQ 'yes' DO BEGIN
        cr = (xdata[xx,*]-xstdspec[xx]*xspatprof[xx,*]-xskyprof[xx,*])^2*xivar[xx,*]*xmask[xx,*]
        chk = where(cr GE sigrej^2.0, nchk, COMPLEMENT=keep)
        CASE nchk OF
           0 : iter = 'no'
           1 : BEGIN
              IF verbose GE 4 THEN print, '    One pixel'
              xmask[xx,chk] = 0
              num = xmask[xx,*]*xspatprof[xx,*]*(xdata[xx,*]-xskyprof[xx,*])*xivar[xx,*]
              num = total(num)
              den = xmask[xx,*]*xspatprof[xx,*]^2*xivar[xx,*]
              den = total(den)
              new = num / den 
              xstdspec[xx] = new
              niter = niter + 1
           END
           ELSE : BEGIN
              IF verbose GE 4 THEN print, '    Two pixels'
              maxcr = max(cr, maxind)
              xmask[xx,maxind] = 0
              num = xmask[xx,*]*xspatprof[xx,*]*(xdata[xx,*]-xskyprof[xx,*])*xivar[xx,*]
              num = total(num)
              den = xmask[xx,*]*xspatprof[xx,*]^2*xivar[xx,*]
              den = total(den)
              new = num / den 
              xstdspec[xx] = new
              niter = niter + 1
           END
        ENDCASE
        IF (nchk EQ 0) OR (niter EQ maxiter) THEN iter = 'no'
     ENDWHILE
  ENDFOR

  RETURN, xmask
END
;========================================================================================================================



;========================================================================================================================
function optspectra, xmask, xspatprof, xdata, xskyprof, xivar, $ 
                           VERBOSE=verbose, HELP=help

  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 3 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  
  xdsize = size(xdata)
  final = fltarr(xdsize[1])
  FOR xx=0, xdsize[1]-1, 1 DO BEGIN
     num = xmask[xx,*]*xspatprof[xx,*]*(xdata[xx,*]-xskyprof[xx,*])*xivar[xx,*]
     num = total(num)
     den = xmask[xx,*]*xspatprof[xx,*]^2*xivar[xx,*]
     den = total(den)
     final[xx] = num / den 
  ENDFOR

  chk = where(final NE final, nchk)
  IF nchk NE 0 THEN final[chk] = 0.0
  
  return, final
END
;========================================================================================================================



;========================================================================================================================
function optvariance, xmask, xspatprof, xivar, $ 
                           VERBOSE=verbose, HELP=help

  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 3 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  
  xdsize = size(xmask)
  final = fltarr(xdsize[1])
  FOR xx=0, xdsize[1]-1, 1 DO BEGIN
     num = xmask[xx,*] * xspatprof[xx,*]
     num = total(num)
     den = xmask[xx,*]*xspatprof[xx,*]^2*xivar[xx,*]
     den = total(den)
     final[xx] = num / den 
  ENDFOR

  chk = where(final NE final, nchk)
  IF nchk NE 0 THEN final[chk] = 0.0
  chk = where(final GT 99999999.9, nchk)
  IF nchk NE 0 THEN final[chk] = 0.0
  
  return, final
END
;========================================================================================================================



;========================================================================================================================
function addgauss1info, xrehdr, xfspatprofsum

  ;;;add info to spectrum header
  fxaddpar, xrehdr, 'fitmu', xfspatprofsum.mu1, 'Value of mu in spatial fit'
  fxaddpar, xrehdr, 'fitsig', xfspatprofsum.sig1, 'Value of sigma in spatial fit'
  fxaddpar, xrehdr, 'fitx0', xfspatprofsum.a1, 'Value of x0 in spatial fit'
  
  RETURN, xrehdr
END
;========================================================================================================================



;========================================================================================================================
function addgauss3info, xrehdr, xfspatprofsum

  ;;;add info to spectrum header
  fxaddpar, xrehdr, 'fitmu', xfspatprofsum.mu, 'Value of mu for central peak in spatial fit'
  fxaddpar, xrehdr, 'fitsig', xfspatprofsum.sig, 'Value of sigma (center) in spatial fit'
  fxaddpar, xrehdr, 'fitc', xfspatprofsum.c, 'Value of c (center) in spatial fit'
  fxaddpar, xrehdr, 'fitx0', xfspatprofsum.x0, 'Value of x0 in spatial fit'
  IF tag_exist(xfspatprofsum, 'X1') EQ 1 THEN fxaddpar, xrehdr, 'fitx1', xfspatprofsum.x1, 'Value of x1 in spatial fit'
  IF tag_exist(xfspatprofsum, 'X2') EQ 1 THEN fxaddpar, xrehdr, 'fitx2', xfspatprofsum.x2, 'Value of x2 in spatial fit'
  IF tag_exist(xfspatprofsum, 'X3') EQ 1 THEN fxaddpar, xrehdr, 'fitx3', xfspatprofsum.x3, 'Value of x3 in spatial fit'
  IF tag_exist(xfspatprofsum, 'X4') EQ 1 THEN fxaddpar, xrehdr, 'fitx4', xfspatprofsum.x4, 'Value of x4 in spatial fit'
  IF tag_exist(xfspatprofsum, 'X5') EQ 1 THEN fxaddpar, xrehdr, 'fitx5', xfspatprofsum.x5, 'Value of x5 in spatial fit'
  fxaddpar, xrehdr, 'medxs', xfspatprofsum.medxs, 'Median x value used as origin in spatial fit'
  
  RETURN, xrehdr
END
;========================================================================================================================



;========================================================================================================================
function addfullinfo, xrehdr, xfspatprof

 
  ;;;add info to spectrum header 
  fxaddpar, xrehdr, 'shrink', xfspatprof[0].shrink, 'Shrink value for wavelengths (multiply by)' ;add value
  fxaddpar, xrehdr, 'medwave', xfspatprof[0].med, 'Median wavelength used as origin in fit'      ;add value
  FOR xx=0, n_elements(xfspatprof)-1, 1 DO BEGIN                                                 ;loop over lines in spatial profile
     FOR yy=0, n_elements(tag_names(xfspatprof))-3, 1 DO BEGIN                                   ;loop over tags
        bit9 = 'a???'                                                                            ;starting string
        strreplace, bit9, '???', strcompress(string(yy), /REMOVE_ALL)                            ;replace 
        bit9 = strcompress(bit9, /REMOVE_ALL)                                                    ;remove whitespace
        bit8 = 'da???'                                                                           ;starting string
        strreplace, bit8, '???', strcompress(string(yy), /REMOVE_ALL)                            ;replace
        bit8 = strcompress(bit8, /REMOVE_ALL)                                                    ;remove whitespace
        bit0 = 'a???_###'                                                                        ;starting string
        strreplace, bit0, '???', strcompress(string(yy), /REMOVE_ALL)                            ;replace
        strreplace, bit0, '###', strcompress(string(xx), /REMOVE_ALL)                            ;replace
        bit0 = strcompress(bit0, /REMOVE_ALL)                                                    ;remove whitespace
        bit1 = 'da???_###'                                                                       ;starting string
        strreplace, bit1, '???', strcompress(string(yy), /REMOVE_ALL)                            ;replace
        strreplace, bit1, '###', strcompress(string(xx), /REMOVE_ALL)                            ;replace
        bit1 = strcompress(bit1, /REMOVE_ALL)                                                    ;remove whitespace
        bit2 = 'Value of a??? in spatial fit, line ###'                                          ;starting string
        strreplace, bit2, '???', strcompress(string(yy), /REMOVE_ALL)                            ;replace
        strreplace, bit2, '###', strcompress(string(xx), /REMOVE_ALL)                            ;replace
        bit1 = strcompress(bit2)                                                                 ;remove whitespace
        bit3 = 'Value of da??? in spatial fit, line ###'                                         ;starting string
        strreplace, bit3, '???', strcompress(string(yy), /REMOVE_ALL)                            ;replace
        strreplace, bit3, '###', strcompress(string(xx), /REMOVE_ALL)                            ;replace
        bit1 = strcompress(bit3)                                                                 ;remove whitespace
        IF tag_exist(xfspatprof, bit9, IND=xind) EQ 1 THEN fxaddpar, xrehdr, bit0, xfspatprof[xx].(xind), bit2 
        IF tag_exist(xfspatprof, bit8, IND=xind) EQ 1 THEN fxaddpar, xrehdr, bit1, xfspatprof[xx].(xind), bit3 
     ENDFOR                     ;end loop over tags
  ENDFOR                        ;end loop over lines in spatial profile
  
  RETURN, xrehdr
END
;========================================================================================================================



;========================================================================================================================
pro mosfire_1dspec_extract, xdata, xweight, call, XREG=XREG, XWHICH=xwhich, WTYPE=wtype, $
                            ITERS=iters, FITITER=fititer, $
                            CENTROW=centrow, ROWDOWN=rowdown, ROWUP=rowup, $
                            COLDOWN=coldown, COLUP=colup, FLIP=flip, $
                            SPATFIT=spatfit, GUESSES=guesses, PRIORS=priors, $
                            BORDER=border, NOSKYLINES=noskylines, OMASKED=omasked, OPARAMS=oparams, $
                            DRYRUN=dryrun, INDIR=indir, OUTDIR=outdir, VERBOSE=verbose, HELP=help

;+
; NAME:
;       MOSFIRE_1DSPEC_EXTRACT()
;
; PURPOSE:
;       Optimally extacta a 1D spectrum from a 2D specturm, 2D spetrum
;       weight data products provided by the MOSFIRE DRP. Optimal
;       extaction is performed as outlined in Horne 1986. Briefly a
;       spatial profile is created and fit which in turn yields a
;       gaussian weighting scheme that is used across the spatial
;       axis. This is used in place of a uniform weighting as done in
;       a standard spectra extraction. Comparison to a standard
;       extraction is also plotted.      
;
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;       xs: data points' x values
;       ys: data points' y values
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
;       A. DeGroot, 2014 May 29, Univ. Cali, Riverside v3.2.3
;          -more plotting correction
;       A. DeGroot, 2014 May 29, Univ. Cali, Riverside v3.2.1
;          -correct plotting window order and location
;       A. DeGroot, 2014 May 29, Univ. Cali, Riverside v3.2.0
;          -add MASKNAME and SLITSZP to spectrum header 
;          -first try at SNR comparison plot
;       A. DeGroot, 2014 May 29, Univ. Cali, Riverside v3.1.0
;          -writes file containing spatial profile sum and errors
;       A. DeGroot, 2014 May 29, Univ. Cali, Riverside v3.0.0
;          -now does full optimal extraction as per Horne 1986
;       A. DeGroot, 2014 May 29, Univ. Cali, Riverside v2.4.0
;          -now handles images with NaNs present
;       A. DeGroot, 2014 May 29, Univ. Cali, Riverside v2.3.0
;          -fixed bug with header parameters: header now includes slit
;           and object values so multiple objects in the slit are split properly
;       A. DeGroot, 2014 Feb 14, Univ. Cali, Riverside v2.2.0
;          -additional parameters kept in header
;          -multiple objects in same slit now handled better
;          -added ability to do a dry run (everything but write the final file)
;       A. DeGroot, 2014 Feb 14, Univ. Cali, Riverside v2.1.0
;          -new bayesian fit that reduced # of parameters in fit
;       A. DeGroot, 2014 Feb 14, Univ. Cali, Riverside v2.0.0
;          -added ability to fit 3 gaussians simultaneously
;       A. DeGroot, 2014 Jan 17, Univ. Cali, Riverside v1.1.0
;          -reorder code and fixed minor items, added FIT keyword
;       A. DeGroot, 2014 Jan 17, Univ. Cali, Riverside v1.0.0
;
; DESIRED UPGRADES
;       -need to fix that variance is given as the weight and not sigma!
;       -add plot of full optimal extraction fit
;       -add ability to give take a second or more region in region
;       file to block certain parts of region
;       -add slit sizes in [bars] to spectrum header 
;       -extraction flag      
;
;
;-
  version = '3.2.2'


  if keyword_set(WTYPE) then wtype = wtype[0] else wtype = 'sig'            ;how many extraction iterations
  if keyword_set(ITERS) then iters = iters[0] else iters = 1                ;how many extraction iterations
  if keyword_set(FITITER) then fititer = fititer[0] else fititer = 1        ;how many MCMC fitting iterations
  if keyword_set(FLIP) then flip = -1.0 else flip = 1.0                     ;sets new value
  if keyword_set(SPATFIT) then spatfit = spatfit[0] else spatfit = 'gauss1' ;sets new value
  if keyword_set(BORDER) then border = border[0] else border = 2            ;sets new value
  if keyword_set(INDIR) then indir = indir[0] else indir = ' '              ;sets new value
  if keyword_set(OUTDIR) then outdir = outdir[0] else outdir = ' '          ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2        ;sets new value
  check_dir, 1                                                              ;compile module
  ;loadct, 13                                                                ;color table
  
  ;;;check directories and files
  xxdata = xdata
  xxweight = xweight
  IF indir NE ' ' THEN check_indir, indir, xdata, VERBOSE=1, NOTE='INDIR'   ;check indir
  IF indir NE ' ' THEN check_indir, indir, xweight, VERBOSE=1, NOTE='INDIR' ;check indir
  IF keyword_set(XREG) AND (indir NE ' ') THEN $                            ;cont next line
     check_indir, indir, xreg, VERBOSE=1, NOTE='INDIR+XREG'                 ;check indir
  IF outdir NE ' ' THEN check_outdir, outdir, VERBOSE=1                     ;check outdir
  
  IF verbose GE 1 THEN BEGIN
     print, '****************************************************************************************'
     print, ' 2D Spectrum: ', xdata
     print, ' 2D Weight: ', xweight
     IF keyword_set(XREG) THEN print, ' 2D extraction region: ', xreg
     print, '  ======================================================================================'
  ENDIF
  
  ;;;Read in files
  data = readfits(xdata, datahdr, /SILENT)       ;read in data
  specszpix = fxpar(datahdr, 'NAXIS2')           ;airmass of observation
  data = data*flip                               ;flip data over xaxis if desired
  weight = readfits(xweight, 0, weihdr, /SILENT) ;read in data
  wtype = strlowcase(wtype)                      ;make sure its all lower case
  
  ;;;sanity checks
  chk = where(data NE data)          ;check for NaNs
  IF chk[0] NE -1 THEN data[chk] = 0 ;set NaNs to zero

  CASE wtype OF                                                                        ;deal with differnt types of weight files
     'sig' : BEGIN                                                                     ;if MOSFIRE drp version 20140612
        chk = where((weight NE 0) AND (weight EQ weight), nchk)                        ;find all nonzero reals
        weight[chk] = weight[chk]^(-2.0)                                               ;make it inverse variance
        chk = where(weight NE weight)                                                  ;find nonreals
        IF chk[0] NE -1 THEN weight[chk] = 0.0                                         ;set to real
     END                                                                               ;end 'sig'
     'ivar' : BEGIN                                                                    ;if prior to MOSFIRE drp version 20140612
        line = 'Nothing to be changed because pipeline was written for ivar!!'         ;info
        IF verbose GE 3 THEN print, line                                               ;print info
     END                                                                               ;end 'ivar'
     ELSE : BEGIN                                                                      ;alternative
        print, 'WARNING!!! Weight image type not understood!! Please supply another!!' ;print info
        print, '  Choices are "sig" or "ivar".'                                        ;print info
        stop                                                                           ;stop routine
     END                                                                               ;end alternative
  ENDCASE                                                                              ;end deal with different type of weight files

  IF keyword_set(HELP) THEN BEGIN                ;check HELP keyword
     help, data                                  ;give help output
     help, weight                                ;give help output
  ENDIF                                          ;end check HELP keyword

  
  ;;;Get wavelength info
  lambdas = getlambda(datahdr)       ;get data from header
  drpcrow = fxpar(datahdr, 'CRVAL2') ;get data from header


  ;;;read in region file if provided and do a bit of work
  IF keyword_set(XREG) THEN BEGIN             ;if region file given
     line = ' '                               ;intialize variable
     nlines = file_lines(xreg)                ;find number of lines
     openr, lun, xreg, /GET_LUN               ;open reg file to read
     FOR xx=0, nlines-1, 1 DO BEGIN           ;loop over lines in file
        readf, lun, line                      ;read line
     ENDFOR                                   ;end loop over line in file
     close, lun                               ;close file
     free_lun, lun                            ;free memory unit
  
     bits = strsplit(line, '(,),,', /EXTRACT)                                   ;split line
     IF bits[n_elements(bits)-1] NE 0 THEN print, 'WHY IS THERE ROTATION!?!?!?' ;sanity chk
     zccol = float(bits[1])                                                     ;pick value
     zdcol = float(bits[3])                                                     ;pick value
     zcrow = float(bits[2])                                                     ;pick value
     zdrow = float(bits[4])                                                     ;pick value
     defcoldown = fix(zccol - 0.5*zdcol)                                        ;how many columns down
     IF defcoldown LT 0 THEN defcoldown = 0                                     ;sanity check
     defcolup = fix(zccol + 0.5*zdcol)                                          ;how many columns up
     defcrow = fix(zcrow)                                                       ;convert to int
     defrowdown = fix(0.5*zdrow)                                                ;how many rows down
     IF (defcrow-defrowdown LT 0) THEN defrowdown = defcrow                     ;sanity check
     defrowup = fix(0.5*zdrow)                                                  ;convert to int
  ENDIF ELSE BEGIN                                                              ;end if region file given
     defcoldown = 0
     defcolup = n_elements(data[*,0])-1 
     defrdown = 0.5*(n_elements(data[0,*])-1) 
     defcolup = 0.5*(n_elements(data[0,*])-1) 
  ENDELSE
  IF keyword_set(CENTROW) THEN centrow = centrow[0] ELSE centrow = defcrow ;set new value

  ;;;Determine which part of spectrum to use
  CASE (keyword_set(COLUP) AND keyword_set(COLDOWN)) OF                                ;check COL keywords
     1 : BEGIN                                                                         ;if both keywords set
        IF verbose GE 1 THEN print, '  Both keywords, COLUP and COLDOW, are set.'      ;print info
        IF verbose GE 1 THEN printcol, coldown, colup                                  ;print info
        colup = colup[0]                                                               ;set value
        coldown = coldown[0]                                                           ;set value
     END                                                                               ;end both set
     0 : BEGIN                                                                         ;if not both set
        CASE (keyword_set(COLUP) OR keyword_set(COLDOWN)) OF                           ;check if one set
           1 : BEGIN                                                                   ;yes one is set
              IF verbose GE 2 THEN print, '  One keyword, COLUP or COLDOW, is set.'    ;print info
              IF keyword_set(COLUP) EQ 1 THEN BEGIN                                    ;if COLUP keyword set
                 coldown = defcoldown                                                  ;set lower column 
                 colup = colup[0]                                                      ;set upper column
                 IF verbose GE 1 THEN printcol, coldown, colup                         ;print info
              ENDIF                                                                    ;end COLUP keyword set
              IF keyword_set(COLDOWN) EQ 1 THEN BEGIN                                  ;if COLDOWN keyword set
                 coldown = coldown[0]                                                  ;set lower column 
                 colup = defcolup                                                      ;set upper column
                 IF verbose GE 1 THEN printcol, coldown, colup                         ;print info
              ENDIF                                                                    ;end COLDOWN keyword set
           END                                                                         ;end yes one is set
           0 : BEGIN                                                                   ;if neither is set
              line = '  Neither keyword, COLUP or COLDOW, is set. Using region file.'  ;text line
              IF verbose GE 2 THEN print, line                                         ;print info
              coldown = defcoldown                                                     ;set lower column 
              colup = defcolup                                                         ;set upper column
              IF verbose GE 1 THEN printcol, coldown, colup                            ;print info
           END                                                                         ;end if neither is set
           ELSE : BEGIN                                                                ;alt 
              print, 'WARNING!! Something has gone horribly wrong!!'                   ;print warning
              stop                                                                     ;stop code
           END                                                                         ;end alt
        ENDCASE                                                                        ;end check if one set
     END                                                                               ;end if not both set
     ELSE : BEGIN                                                                      ;alt 
        print, 'WARNING!! Something has gone horribly wrong!!'                         ;print warning
        stop                                                                           ;stop code
     END                                                                               ;end alt
  ENDCASE                                                                              ;end check both set

  CASE (keyword_set(ROWUP) AND keyword_set(ROWDOWN)) OF                                 ;check ROW keywords
     1 : BEGIN                                                                          ;if both keywords set
        IF verbose GE 1 THEN print, '  Both keywords, ROWUP and ROWDOW, are set.'       ;print info
        IF verbose GE 1 THEN printrow, centrow, rowdown, rowup                          ;print info
        rowup = rowup[0]                                                                ;set value
        rowdown = rowdown[0]                                                            ;set value
     END                                                                                ;end both set
     0 : BEGIN                                                                          ;if not both set
        CASE (keyword_set(ROWUP) OR keyword_set(ROWDOWN)) OF                            ;check if one set
           1 : BEGIN                                                                    ;yes one is set
              IF verbose GE 2 THEN print, '  One keyword, ROWUP or ROWDOW, is set.'     ;print info
              IF keyword_set(ROWUP) EQ 1 THEN BEGIN                                     ;if ROWUP keyword set
                 rowdown = defrowdown                                                   ;set lower row 
                 rowup = rowup[0]                                                       ;set upper row
                 IF verbose GE 1 THEN printrow, rowdown, rowup                          ;print info
              ENDIF                                                                     ;end ROWUP keyword set
              IF keyword_set(ROWDOWN) EQ 1 THEN BEGIN                                   ;if ROWDOWN keyword set
                 rowdown = rowdown[0]                                                   ;set lower row 
                 rowup = defrowup                                                       ;set upper row
                 IF verbose GE 1 THEN printrow, rowdown, rowup                          ;print info
              ENDIF                                                                     ;end ROWDOWN keyword set
           END                                                                          ;end yes one is set
           0 : BEGIN                                                                    ;if neither is set
              line = '  Neither keyword, ROWUP or ROWDOWN, is set. Using region file.'  ;text line
              IF verbose GE 2 THEN print, line                                          ;print info
              rowdown = defrowdown                                                      ;set lower row 
              rowup = defrowup                                                          ;set upper row
              IF verbose GE 1 THEN printrow, centrow, rowdown, rowup                    ;print info
           END                                                                          ;end if neither is set
           ELSE : BEGIN                                                                 ;alt 
              print, 'WARNING!! Something has gone horribly wrong!!'                    ;print warning
              stop                                                                      ;stop code
           END                                                                          ;end alt
        ENDCASE                                                                         ;end check if one set
     END                                                                                ;end if not both set
     ELSE : BEGIN                                                                       ;alt 
        print, 'WARNING!! Something has gone horribly wrong!!'                          ;print warning
        stop                                                                            ;stop code
     END                                                                                ;end alt
  ENDCASE                                                                               ;end check both set
  print, '  ======================================================================================'


  ;;;Prep data storage stuff
  fullstore = fullstorage(data, weight) ;create data storage
  
  ;;;Grab subsets data, weight arrays, mak other arrays to be filled
  ;;;0.18"/pixel in the spatial direction for MOSFIRE
  yoffset = fxpar(datahdr, 'YOFFSET')               ;get from headr
  yoffset = (2.0*yoffset) / 0.18                    ;change from arcsec to pixels 
  ndata = data[*,centrow-rowdown:centrow+rowup]     ;get row subset
  nweight = weight[*,centrow-rowdown:centrow+rowup] ;get row subset
  substore = substorage(ndata, nweight)             ;store row subset
  curiter = currentiter(ndata, nweight)             ;store row subset
  curiter.mask[*,*] = 1                             ;create a mask to be filled in


  ;;;Extract standard spectrum, variance of std spec
  CASE keyword_set(XWHICH) OF                                                   ;check if two objects
     0 : drpcrow = abs(fxpar(datahdr, 'CRVAL2'))                                ;if not two objects
     1 : BEGIN                                                                  ;if two objects
        line = 'WHICH keyword set!! Using CENTROW as center for std spectrum'   ;info
        IF verbose GE 2 THEN print, line                                        ;print info
        drpcrow = centrow[0]                                                    ;use user defined center row
     END                                                                        ;end if two objects
     ELSE : BEGIN                                                               ;alternative 
        print, 'WARNING!! Something has gone very wrong!!'                      ;print info
        stop                                                                    ;stop run
     END                                                                        ;end alternative 
  ENDCASE                                                                       ;end check of two objects
  dither = fxpar(datahdr, 'YOFFSET')                                            ;dither size in arcsec
  pixscl = fxpar(datahdr, 'PSCALE')                                             ;pixel scale
  ymax = fxpar(datahdr, 'NAXIS2')                                               ;# of wavelength elements
  ditherpix = dither / pixscl                                                   ;dither size in pixels
  stdrowdown = drpcrow - (dither / pixscl)                                      ;standard row down
  IF stdrowdown LT 0 THEN stdrowdown = 0                                        ;safety check
  stdrowup = drpcrow + (dither / pixscl)                                        ;standard row up
  IF stdrowup GT ymax THEN stdrowup = ymax - 1                                  ;safety check
  stdspec = extractstdspec(data, centrow, RLL=stdrowdown, RUL=stdrowup)         ;extract standard speck
  substore.stdspec1d = stdspec                                                  ;store standard spec
  curiter.spec1d = stdspec                                                      ;store standard spec
  stdspecwei = extractstdspecwei(weight, centrow, RLL=stdrowdown, RUL=stdrowup) ;extract standard weights
  substore.stdspecwei1d = stdspecwei                                            ;store standard weights
  IF keyword_set(HELP) THEN BEGIN                                               ;chk keyword
     help, stdspec                                                              ;offer help
     help, stdspecwei                                                           ;offer help
  ENDIF                                                                         ;end check keyword

  
  ;;;create sky line mask
  CASE keyword_set(NOSKYLINES) OF 
     1 : BEGIN
        line = '  Masking ' + noskylines[0] + ' sky lines in summed profile!'
        IF verbose GE 2 THEN print, line
        curiter.skymask = makeskymask(noskylines[0], lambdas, ndata) ;make a mask for sky lines
     END
     0 : BEGIN
        IF verbose GE 2 THEN print, '  Not masking skylines in spatial profile construction.'
        noskylines = 'NONE'
        skymask = ndata
        skymask[*,*] = 1
        curiter.skymask = skymask
     END
     ELSE : print, 'WARNING!! Something has gone very wrong here!!'
  ENDCASE
  print, '  ======================================================================================'

  maskedout = curiter.spec2d * curiter.skymask
  outfile = xdata
  strreplace, outfile, '.fits', '_masked.fits'
  IF keyword_set(XWHICH) THEN strreplace, outfile, xwhich[0], xwhich[1] ;replace
  mwrfits, maskedout, outfile, datahdr, /CREATE
  IF keyword_set(OMASKED) THEN spawn, 'ds9 ' + outfile + ' &'
  print, ' '

  ;;;looping over iterations
  ziters = 0                     ;intialize counter
  WHILE ziters LT iters DO BEGIN ;iterate
     IF verbose GE 1 THEN print, ' Now on overall iteration: ' + string(fix(ziters+1)) ;info
     print, '  ======================================================================================'

     ;;;Fit sky i.e. thebackground
     skyprof = fitskyprof(data, weight, centrow, LL=rowdown, UL=rowup)                            ;fit sky profile
     substore.skyprof = skyprof                                                                   ;store sky profile
     print, '  ======================================================================================'

    ;;;Spatial Profile
     CASE spatfit OF                                                                                 ;check spatial fit keyword
        'gauss1' : BEGIN                                                                             ;spatfit keyword option
           mspatprofsum = makespatprofsum(curiter.spec2d, curiter.skymask, coldown, colup, $         ;cont next line
                                          centrow, RLL=rowdown, RUL=rowup)                           ;make spatial profile
           mspatprofsumerr = makespatprofsumerr(curiter.weight2d, curiter.skymask, coldown, colup, $ ;cont next line
                                                centrow, RLL=rowdown, RUL=rowup)                     ;make spatial profile
           substore.spatprof = mspatprofsum                                                          ;store data
           plotsumprof, mspatprofsum, CALL=call, ERRORS=mspatprofsumerr                              ;plot data
           
           fspatprofsum = fitspatprofsum(mspatprofsum, mspatprofsumerr, spatfit, $     ;cont next line
                                         BORDER=border, NITER=fititer, VERBOSE=3)      ;fits summed spatial profile
           espatprofsum = evalspatprofsum(curiter.spec2d, fspatprofsum, BORDER=border) ;evalute spatial profile
           substore.spatprof = espatprofsum                                            ;store spatial profile
           curiter.spatprof = espatprofsum                                             ;store in iteration
           IF ~keyword_set(NOSVSPAT) THEN BEGIN                                        ;unless not want to save the spatprof data
              outspat = {spatprof:mspatprofsum, espatprof:mspatprofsumerr}             ;summed spatial profile data
              outspatfile = xdata                                                      ;copy file name
              strreplace, outspatfile, 'eps.fits', 'spatprof.fits'                     ;alter file name
              mwrfits, outspat, outspatfile, /CREATE                                   ;first save
              outspat = mrdfits(outspatfile, 1, sumhdr, /SILENT)                       ;read in data again
              rehdr = addgauss1info(sumhdr, fspatprofsum)                              ;add 1 gauss fit to header
              mwrfits, outspat, outspatfile, sumhdr, /CREATE                           ;resave with header info
           ENDIF                                                                       ;end not want save
        END                                                                            ;end BOTH set

        'gauss3' : BEGIN                                                                             ;spatfit keyword option
           mspatprofsum = makespatprofsum(curiter.spec2d, curiter.skymask, coldown, colup, $         ;cont next line
                                          centrow, RLL=rowdown, RUL=rowup)                           ;make spatial profile
           mspatprofsumerr = makespatprofsumerr(curiter.weight2d, curiter.skymask, coldown, colup, $ ;cont next line
                                                centrow, RLL=rowdown, RUL=rowup)                     ;make spatial profile error
           substore.spatprof = mspatprofsum                                                          ;store data
           plotsumprof, mspatprofsum, CALL=call, ERRORS=mspatprofsumerr                              ;plot data
           
           plotfit = xdata                                                                               ;copy file in name
           strreplace, plotfit, '.fits', '_spatproffit.ps'                                               ;alter for plots
           IF keyword_set(XWHICH) THEN strreplace, plotfit, xwhich[0], xwhich[1]                         ;replace
           plotparams = xdata                                                                            ;copy file in name
           strreplace, plotparams, '.fits', '_spatprofparams.pdf'                                        ;alter for plots
           IF keyword_set(XWHICH) THEN strreplace, plotparams, xwhich[0], xwhich[1]                      ;replace
           fspatprofsum = fitspatprofsum(mspatprofsum, mspatprofsumerr, spatfit, $                       ;cont next line
                                         GUESSES=guesses, PRIORS=priors, $                               ;cont next line
                                         PLOTFIT=plotfit, PLOTPARAMS=plotparams, CALL=call, $            ;cont next line
                                         BORDER=border, YOFFSET=yoffset,  NITER=fititer, VERBOSE=3)      ;fits summed spatial profile
           espatprofsum = evalspatprofsum(curiter.spec2d, fspatprofsum, spatfit, yoffset, BORDER=border) ;evalute spatial profile
           substore.spatprof = espatprofsum                                                              ;store spatial profile
           curiter.spatprof = espatprofsum                                                               ;store in iteration
           IF ~keyword_set(NOSVSPAT) THEN BEGIN                                                          ;unless not want to save the spatprof data
              outspat = {spatprof:mspatprofsum, espatprof:mspatprofsumerr}                               ;summed spatial profile data
              outspatfile = xdata                                                                        ;copy file name
              strreplace, outspatfile, 'eps.fits', 'spatprof.fits'                                       ;alter file name
              mwrfits, outspat, outspatfile, /CREATE                                                     ;first save
              outspat = mrdfits(outspatfile, 1, sumhdr, /SILENT)                                         ;read in data again
              rehdr = addgauss3info(sumhdr, fspatprofsum)                                                ;add 3 gauss fit to header
              mwrfits, outspat, outspatfile, sumhdr, /CREATE                                             ;resave with header info
           ENDIF                                                                                         ;end not want save
        END                                                                                              ;end BOTH set
        
        'full' : BEGIN                                                                 ;SPATFIT='full' option
           spatprof = makespatprof(ndata, curiter.weight2d, drpcrow, ditherpix)        ;fractional spartial profile 
           substore.spatprof = spatprof.mspatprof                                      ;store data
           substore.spatproferr = spatprof.mspatproferr                                ;store data
           fspatprof = fitspatprof(ndata, curiter.weight2d, skyprof, curiter.spec1d, $ ;cont next line
                                   spatprof.mspatprof, spatprof.mspatproferr)          ;fit spartial profile
           espatprof = evalspatprof(ndata, fspatprof)                                  ;evalute spatial profile           
           substore.spatprof = espatprof                                               ;store spatial profile
           curiter.spatprof = espatprof                                                ;store in iteration
        END                                                                            ;end SPATFIT='full'

        ELSE: BEGIN                                              ;alternate to SPATFIT
           print, 'WARNING!! Something has gone horribly wrong!' ;print info
           stop                                                  ;stop run
        END                                                      ;end alt to SPATFIT
     ENDCASE

     
     ;;;Cosmic Rays
     mask = removecosmicrays(ndata, curiter.weight2d, skyprof, curiter.spatprof, $ ;cont next line
                             curiter.spec1d, curiter.mask)                         ;remove comsic rays
     
     curiter.skymask = curiter.skymask * mask ;add rejected pixels to sky mask 
     substore.mask = mask                     ;store bad pixel mask
     curiter.mask = mask                      ;store in iteration
     

     ;;;Extract 1D Spectrum
     optspec = optspectra(curiter.mask, curiter.spatprof, ndata, skyprof, curiter.weight2d) ;extract optimal spectra
     chk = where((optspec-curiter.spec1d) GT 0.001, nchk)                                   ;check if any change occured
     IF nchk EQ 0 THEN ziters = iters                                                       ;stop iterating if nothing changed
     substore.optspec1d = optspec                                                           ;store optimal spectra
     curiter.spec1d = optspec                                                               ;store in iteration
     optvar = optvariance(curiter.mask, curiter.spatprof, curiter.weight2d)                 ;extract optimal variance


     ;;;;HUGE ISSUE TO FIX IN THE FUTURE!!! We want sigma not variance
     substore.optspecwei1d = optvar                                                   ;store optimal variance
     curiter.spec1dwei = optvar                                                         ;store in iteration
     
     ziters = ziters + 1        ;increase iteration number
     print, '  ' ;spacer
     print, '  ' ;spacer
  ENDWHILE                      ;end loop over iterations
  

  ;;;prep outputs if two objects present
  outplot = xdata                                                                ;copy name
  strreplace, outplot, '.fits', '.ps'                                            ;change suffix
  outplot2 = xdata                                                               ;copy name
  strreplace, outplot2, 'eps.fits', 'snrs.ps'                                     ;change suffix
  outdata = xdata                                                                ;copy name
  strreplace, outdata, '.fits', '_1d_v10.fits'                                   ;change suffix
  IF keyword_set(XWHICH) THEN BEGIN                                              ;if two objects in slit
     out = xwhich[0]                                                             ;get first object
     in = xwhich[1]                                                              ;get second object
     strreplace, outplot, out, in                                                ;create new name for plot
     strreplace, outdata, out, in                                                ;create new name for file
  ENDIF                                                                          ;end if two objects in slit
  output = {lambdas:lambdas, spec1d:curiter.spec1d, spec1dwei:curiter.spec1dwei} ;create output
  IF keyword_set(HELP) THEN boxscore, output.spec1d                              ;offer help
  

  ;;;Make plots
  plotstdspec, substore.stdspec1d, call, $                           ;cont next line
               OPTSPEC=optspec, OUTFILE=outplot                      ;store standard extraction 1d spec
  stdsnr = substore.stdspec1d^2 * substore.stdspecwei1d              ;calculate SNR, weight is inverse variance
  stdsnr = (stdsnr)^0.5                                              ;back to SNR
  optsnr = stdsnr                                                    ;copy array
  optsnr[*] = 0.0                                                    ;rest to zero
  chk = where(substore.optspecwei1d NE 0.0)                          ;find zero weights
  optsnr[chk] = substore.optspec1d[chk] / substore.optspecwei1d[chk] ;calculate SNR
  optsnr = (optsnr^2)^0.5                                            ;ensure positivity
  chk = where((optsnr NE optsnr) OR (optsnr GT 99999999.9))          ;find crazy values
  IF chk[0] NE -1 THEN optsnr[chk] = 0.0                             ;set to zero
  plotstdsnr, stdsnr, call, OPTSNR=optsnr, OUTFILE=outplot2          ;store standard extraction 1d spec
  

  ;;;Write data products
  mwrfits, output, outdata, /CREATE                                 ;write file
  renew = mrdfits(outdata, 1, rehdr, /SILENT)                       ;read in file: now we have a header
  spawn, 'whoami', whoami                                           ;get who ran this code
  time = SYSTIME()                                                  ;get the date
  targra = fxpar(datahdr, 'TARGRA')                                 ;target RA as listed in header
  targdec = fxpar(datahdr, 'TARGDEC')                               ;target Dec as listed in header
  targepoc = fxpar(datahdr, 'TARGEPOC')                             ;target epoch as listed in header
  targequi = fxpar(datahdr, 'TARGEQUI')                             ;target equinox as listed in header
  object = fxpar(datahdr, 'OBJECT')                                 ;slit name object observed in
  crpix1 = fxpar(datahdr, 'CRPIX1')                                 ;get reference pixel
  crpix2 = fxpar(datahdr, 'CRPIX2')                                 ;get reference pixel
  crval1 = fxpar(datahdr, 'CRVAL1')                                 ;get ref pixel value
  crval2 = fxpar(datahdr, 'CRVAL2')                                 ;get ref pixel value
  cunit1 = fxpar(datahdr, 'CUNIT1')                                 ;get units of change along wavelength axis
  cd11 = fxpar(datahdr, 'CD1_1')                                    ;get wavelength change along wavelength axis
  cd12 = fxpar(datahdr, 'CD1_2')                                    ;get spatial change along wavelength axis
  cd21 = fxpar(datahdr, 'CD2_1')                                    ;get wavelength change along spatial axis
  cd22 = fxpar(datahdr, 'CD2_2')                                    ;get spatial change along spatial axis
  truitime = fxpar(datahdr, 'TRUITIME')                             ;true iteration time?
  filter = fxpar(datahdr, 'FILTER')                                 ;filter of observation
  airmass = fxpar(datahdr, 'AIRMASS')                               ;airmass of observation
  maskname = fxpar(datahdr, 'MASKNAME')                             ;airmass of observation
  IF keyword_set(XWHICH) THEN thing = xwhich[1] ELSE thing = object ;end if two objects in slit


  IF keyword_set(XWHICH) THEN BEGIN
     mobinslit = 'Y'
  ENDIF ELSE BEGIN
     mobinslit = 'N'
  ENDELSE
  fxaddpar, rehdr, 'MOBINSLIT', mobinslit, 'multiple objects in slit?'
  fxaddpar, rehdr, 'TARGRA', targra, 'target RA as listed in header'
  fxaddpar, rehdr, 'TARGDEC', targdec, 'target DEC as listed in header'
  fxaddpar, rehdr, 'TARGEQUI', targequi, 'target equinox as listed in header'
  fxaddpar, rehdr, 'TARGEPOC', targepoc, 'target epoch as listed in header'
  fxaddpar, rehdr, 'MASKNAME', maskname, 'name of slit mask'
  fxaddpar, rehdr, 'SLIT', object, 'slit name object observed in'
  fxaddpar, rehdr, 'OBJECT', thing, 'slit name object observed in'
  fxaddpar, rehdr, 'SPECSZP', specszpix, 'final spectrum y-size [pixels]'
  fxaddpar, rehdr, 'FILTER', strcompress(filter, /REMOVE_ALL), 'filter of observation'
  fxaddpar, rehdr, 'AIRMASS', airmass, 'airmass of observation'
  fxaddpar, rehdr, 'TRUITIME', truitime, 'true iteration time per dither [s]?'
  fxaddpar, rehdr, 'CRPIX1', crpix1, 'Reference pixel'
  fxaddpar, rehdr, 'CRPIX2', crpix2, 'Reference pixel'
  fxaddpar, rehdr, 'CRVAL1', crval1, 'Wavelength of reference pixel [Angstrom]'
  fxaddpar, rehdr, 'CRVAL2', crval2, 'Spatial of reference pixel [pixels]'
  fxaddpar, rehdr, 'CD1_1', cd11, '[Ang/pixel] change along wavlength axis'
  fxaddpar, rehdr, 'CD1_2', cd12, '[Ang/pixel] change along spatial axis'
  fxaddpar, rehdr, 'CD2_1', cd21, '[pixel/pixel] change along wavlength axis'
  fxaddpar, rehdr, 'CD2_2', cd22, '[pixel/pixel] change along spatial axis'
  fxaddpar, rehdr, 'CUNIT1', cunit1, 'Unit of change'
  fxaddpar, rehdr, 'spec2d', xxdata, '2D spectrum given for extraction'
  fxaddpar, rehdr, 'weight2d', xxweight, '2D spectrum weight given for extraction'
  fxaddpar, rehdr, 'vMOE', version, 'Version # of MOSFIRE Optimal Extraction'
  fxaddpar, rehdr, 'centrow', centrow, 'Central column used in extraction'
  fxaddpar, rehdr, 'rowdown', centrow-rowdown, 'Lower row used in extraction'
  fxaddpar, rehdr, 'rowup', centrow+rowup, 'Upper row used in extraction'
  fxaddpar, rehdr, 'coldown', coldown, 'Lower column used in extraction'
  fxaddpar, rehdr, 'colup', colup, 'Upper column used in extraction'
  fxaddpar, rehdr, 'iters', iters, '# of iteration in optimal extraction'
  fxaddpar, rehdr, 'fititer', fititer, '# of iterations used in fitting spatial profile'
  fxaddpar, rehdr, 'border', border, 'background order used in fitting spatial profile'
  fxaddpar, rehdr, 'nosky', noskylines, 'bright skylines omitted in spatial fit'
  fxaddpar, rehdr, 'author', whoami[0], 'Who performed extraction'
  fxaddpar, rehdr, 'date', time, 'Date of extraction.'
  CASE spatfit OF 
     'gauss1' : rehdr = addgauss1info(rehdr, fspatprofsum)
     'gauss3' : rehdr = addgauss3info(rehdr, fspatprofsum)
     'full' : rehdr = addfullinfo(rehdr, fspatprof)
     ELSE : BEGIN
        print, 'WARNING!! SPATFIT keyword value not found!'
        stop
     END
  END
  
  IF NOT keyword_set(DRYRUN) THEN BEGIN                                                                ;check if not a dry run
     print, ' Writing file...'                                                                         ;print info
     mwrfits, output, outdata, rehdr, /CREATE, /SILENT                                                 ;write file
     print, '****************************************************************************************' ;
  ENDIF                                                                                                ;end if not a dry run
  

END
;========================================================================================================================



;========================================================================================================================
pro mosfire_1dspec_example
  
  print, 'Not yet written!!'

END
;========================================================================================================================
