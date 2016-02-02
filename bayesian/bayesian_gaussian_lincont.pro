;========================================================================================================================
function muguess, xxs, xys, N=n
  
  IF keyword_set(N) THEN n = n[0] else n = 20.0
  
  boxscore, xxs, VALUES=muvals, /QUIET

  xmumin = muvals[2]
  xmumax = muvals[3]
  xmubin = (xmumax-xmumin) / n 

  ;print, 'muguess', [xmumin, xmumax, xmubin]
  RETURN, [xmumin, xmumax, xmubin]
END
;========================================================================================================================



;========================================================================================================================
function sigguess, xxs, xys, N=n
  
  IF keyword_set(N) THEN n = n[0] else n = 20.0
  
  boxscore, xys, VALUES=ydata, /QUIET
  chk = where((xys GT ydata[0]+1.0*ydata[1]))
  
  boxscore, xxs[chk], VALUES=sigvals, /QUIET
  xsigmin = 0.1
  xsigmax = 3.0*sigvals[1]
  xsigbin = (xsigmax - xsigmin) / n 
  
  RETURN, [xsigmin, xsigmax, xsigbin]
END
;========================================================================================================================


;========================================================================================================================
function cguess, xxs, xys, N=n
  
  IF keyword_set(N) THEN n = n[0] else n = 20.0
  
  cmid = int_tabulated(xxs, xys)
  csig = cmid^0.5
  cmin = 0.1 
  cmax = cmid + 3.0*csig
  IF (cmax LE cmin) OR (cmax NE cmax) THEN cmax = 10.0
  cbin = (cmax-cmin) / n

  RETURN, [cmin, cmax, cbin]
END
;========================================================================================================================


;========================================================================================================================
function aguess, xxs, xys, N=n
  
  IF keyword_set(N) THEN n = n[0] else n = 20.0 ;number of grid points 
  
  nxxs = n_elements(xxs) ;# of x elements
  nxys = n_elements(xys) ;# of y elements
  quartile = floor(0.25*nxxs) ;find 0.25 of # of x ele
  
  x1 = mean(xxs[0:quartile])             ;first quartile in x
  x2 = mean(xxs[nxxs-quartile-1:nxxs-1]) ;last quartile in x
  y1 = mean(xys[0:quartile])             ;first quartile in y
  y2 = mean(xys[nxys-quartile-1:nxys-1]) ;last quartile in y
  slp = (y2-y1) / (x2-x1)                ;rise over run
  IF slp LT 1.0 then slp = slp + 1.0     ;makes range large enough
  slpmin = -2.0*slp                      ;find lower limit 
  slpmax = 3.0*slp                       ;find upper limit
  
  IF slpmin GT slpmax THEN BEGIN ;check that lower isnt greater than upper 
     tmp = slpmin                ;tmp holding 
     slpmin = slpmax             ;make upper, lower
     slpmax = tmp                ;make lower, upper
  ENDIF                          ;end check 
  
  slpbin = (slpmax-slpmin) / n  ;find grid spacing
  
  ;print, 'aguess', [slpmin, slpmax, slpbin] ;return results
  RETURN, [slpmin, slpmax, slpbin] ;return results
END
;========================================================================================================================



;========================================================================================================================
function bguess, xxs, xys, N=n
  
  IF keyword_set(N) THEN n = n[0] else n = 20.0
  
  boxscore, xys, VALUES=ydata, /QUIET
  chk = where(xys LT ydata[0])
  boxscore, xys[chk], VALUES=ydata, /QUIET
  IF ydata[0] LT 1.0 THEN BEGIN
     ydata[0] = ydata[0] + 1.0  ;makes range large enough
     ydata[1] = ydata[1] + 1.0
  ENDIF
  
  xbmin = ydata[0]-3.0*ydata[1]
  xbmax = ydata[0]+3.0*ydata[1]
  xbbin = (xbmax-xbmin) / n 
  
  ;print, 'bguess', [xbmin, xbmax, xbbin]
  RETURN, [xbmin, xbmax, xbbin]
END
;========================================================================================================================



;========================================================================================================================
function makeprior, pxs, xprior
  

  xpriors = pxs
  chk = where((pxs LT xprior.min) OR (pxs GT xprior.max), COMPLEMENT=chk2)
  IF chk[0] NE -1 THEN xpriors[chk] = 0.0
  IF chk2[0] NE -1 THEN xpriors[chk2] = 1.0
  
  RETURN, xpriors
END
;========================================================================================================================



;========================================================================================================================
function breakdown, xjlike
  
  szjlike = size(xjlike)
  graphables = {ys1:fltarr(szjlike[1]), $
                ys2:fltarr(szjlike[2]), $
                ys3:fltarr(szjlike[3]), $
                ys4:fltarr(szjlike[4]), $
                ys5:fltarr(szjlike[5]), $
                cont1:fltarr(szjlike[1], szjlike[2]), $ 
                cont2:fltarr(szjlike[1], szjlike[3]), $ 
                cont3:fltarr(szjlike[1], szjlike[4]), $ 
                cont4:fltarr(szjlike[1], szjlike[5]), $ 
                cont5:fltarr(szjlike[2], szjlike[3]), $ 
                cont6:fltarr(szjlike[2], szjlike[4]), $ 
                cont7:fltarr(szjlike[2], szjlike[5]), $ 
                cont8:fltarr(szjlike[3], szjlike[4]), $ 
                cont9:fltarr(szjlike[3], szjlike[5]), $ 
                cont10:fltarr(szjlike[4], szjlike[5]) }
  
  spot4 = total(xjlike, 5)
  spot3 = total(spot4, 4)
  spot2 = total(spot3, 3)
  graphables.cont1 = spot2
  spot1 = total(spot2, 2)
  graphables.ys1 = spot1
  spot1 = total(spot2, 1)
  graphables.ys2 = spot1
  spot2 = total(spot3, 2)
  graphables.cont2 = spot2
  spot2 = total(spot3, 1)
  graphables.cont5 = spot2
  spot1 = total(spot2, 1)
  graphables.ys3 = spot1
  spot3 = total(spot4, 3)
  spot2 = total(spot3, 2)
  graphables.cont3 = spot2
  spot1 = total(spot2, 1)
  graphables.ys4 = spot1

  spot4 = total(xjlike, 1)
  spot3 = total(spot4, 1)
  spot2 = total(spot3, 1)
  graphables.cont10 = spot2
  spot1 = total(spot2, 1)
  graphables.ys5 = spot1
  spot2 = total(spot3, 2)
  graphables.cont9 = spot2
  spot2 = total(spot3, 3)
  graphables.cont8 = spot2
  spot3 = total(spot4, 2)
  spot2 = total(spot3, 2)
  graphables.cont7 = spot2
  spot2 = total(spot3, 3)
  graphables.cont6 = spot2
  
  spot4 = total(xjlike, 2)
  spot3 = total(spot4, 2)
  spot2 = total(spot3, 2)
  graphables.cont4 = spot2
  
  RETURN, graphables
END
;========================================================================================================================


;========================================================================================================================
function nextiter, xxs, xys, NOUT=nout
  
  IF keyword_set(NOUT) THEN nout = nout[0] ELSE nout = 1

  
  nxxs = n_elements(xxs)
  chk = where(xys GT 0.0001*max(xys), nchk)
  IF nchk GT 0 THEN BEGIN
     minind = min(chk)-nout
     IF minind LT 0 THEN BEGIN
        minind = 0
        xmin = xxs[minind]
     ENDIF ELSE xmin = xxs[minind]
     maxind = max(chk)+nout
     IF maxind GT nxxs-1 THEN BEGIN
        maxind = nxxs-1
        xmax = xxs[maxind]
     ENDIF ELSE xmax = xxs[maxind]
     xbin = (xmax-xmin) / 20.0
  ENDIF ELSE BEGIN
                                ;print, 'Shit everything is all zeroes'
     xmin = xxs[0]
     xmax = xxs[nxxs-1]
     xbin = (xmax-xmin) / 20.0
  ENDELSE

  RETURN, [xmin, xmax, xbin]
END
;========================================================================================================================



;========================================================================================================================
pro plotPDF, xxs, xys, which, $
             NONORM=nonorm, NOSIGMA=nosigma, $
             WINNUM=winnum, OUTPLOT=outplot, $
             VERBOSE=verbose
  
  IF keyword_set(WINNUM) THEN winnum = winnum[0] ELSE winnum = 3     ;sets new value
  IF keyword_set(OUTPLOT) THEN outplot = 'Y' ELSE outplot = 'N'      ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1 ;sets new value

  CASE which OF
     1 : BEGIN
        tmpxtit = 'Mu [pixels]'            ;plot options
        tmpytit = 'Probability'            ;plot options
        tmptit = '1D Posterior PDF for Mu' ;plot options
     END
     2 : BEGIN
        tmpxtit = 'Sigma [pixels]'            ;plot options
        tmpytit = 'Probability'               ;plot options
        tmptit = '1D Posterior PDF for Sigma' ;plot options
     END
     3 : BEGIN
        tmpxtit = 'a [Units]'             ;plot options
        tmpytit = 'Probability'           ;plot options
        tmptit = '1D Posterior PDF for a' ;plot options
     END
     4 : BEGIN
        tmpxtit = 'b [Units]'             ;plot options
        tmpytit = 'Probability'           ;plot options
        tmptit = '1D Posterior PDF for b' ;plot options
     END
     5 : BEGIN
        tmpxtit = 'c [Units]'             ;plot options
        tmpytit = 'Probability'           ;plot options
        tmptit = '1D Posterior PDF for c' ;plot options
     END
     ELSE : print, 'WARNING!! WHICH not recognized!!'
  ENDCASE
  
  CASE keyword_set(NONORM) OF
     0 : BEGIN
        chk = where(xys GT 0.0, nchk)
        IF nchk GT 1 THEN BEGIN
           norm = int_tabulated(xxs, xys) ;normalization constant
           xys = xys * (1.0/norm)         ;normalize
        ENDIF ELSE BEGIN
           line = 'WARNING!! Only 1 nonzero point: skipping normalization!!'
           IF verbose GE 3 then print, line
        ENDELSE
     END
     1 : xys = xys 
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
  ENDCASE


  ;;;Plot stuff
  tmpxpos = 200 + winnum*50
  tmpypos = 00 + winnum*50
  window, winnum, XPOS=tmpxpos, YPOS=tmpypos, XSIZE=500, YSIZE=500 ;window options
  plot, xxs, xys, $                                                ;1D posterior for intercepts
        BACKGROUND='FFFFFF'XL, $                                   ;plot options
        COLOR='000000'XL, $                                        ;plot options
        XTITLE=tmpxtit, $                                          ;plot options
        ;XTICKFORMAT='(F6.1)', $                                    ;plot options
        YTITLE=tmpytit, $                                          ;plot options
        TITLE=tmptit, $                                            ;plot options
        CHARSIZE=1.4                                               ;plot options
  
  CASE keyword_set(NOSIGMA) OF
     0 : BEGIN
        fakeys = [0.5*min(xys), 1.5*max(xys)]                                        ;fake data points 
        maxed = max(xys, maxind)                                                     ;find most probable intercept value
        if verbose GE 3 THEN print,  '   Most likeli intercept value: ', xxs[maxind] ;print info
        sigmas = sigmas(xxs, xys, LEVELS=1)                                          ;find sigmas
        if verbose GE 3 THEN print, '   One sigma errors on intercept:', sigmas      ;print info
        oplot, [xxs[maxind],xxs[maxind]], fakeys, COLOR='000000'XL, LINESTYLE=2      ;plot line on most likely value
        oplot, [xxs[maxind]-sigmas[0],xxs[maxind]-sigmas[0]], fakeys, $              ;plot line on -1sigma
               COLOR='000000'XL, LINESTYLE=1                                         ;line options
        oplot, [xxs[maxind]+sigmas[1],xxs[maxind]+sigmas[1]], fakeys, $              ;plot line on +1sigma
               COLOR='000000'XL, LINESTYLE=1                                         ;line options
        legend, ['Most Prob Val', '1sigma'], LINESTYLE=[2,1],  $                     ;create legend
                COLOR='000000'XL, $                                                  ;legend options
                TEXTCOLOR='000000'XL, $                                              ;legend options
                CHARSIZE=1.2, BOX=0, /RIGHT                                          ;legend options
     END
     1 : xys = xys 
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
  ENDCASE
END
;========================================================================================================================




;========================================================================================================================
pro plotPDF2D, xxs1, xxs2, xys
  
  
  IF plotfit EQ 'Y' THEN BEGIN                           ;check PLOTFIT keyword
     window, 0, XPOS=200, YPOS=400, XSIZE=500, YSIZE=500 ;window options
     contour, xys, xxs1, xxs2, $                         ;2D posterior distribution plot
              BACKGROUND='FFFFFF'XL, $                   ;plot options
              COLOR='000000'XL, $                        ;plot options
              XTITLE='intercept [units]', $              ;plot options
              YTITLE='slope [units]', $                  ;plot options
              TITLE='2D Posterior PDF', $                ;plot options
              CHARSIZE=1.4                               ;plot options
     
  ENDIF
 
  
END
;========================================================================================================================




;========================================================================================================================
pro bplotfit, xxs, xys, xyerr, xvals, $
             WINNUM=winnum, OUTPLOT=outplot, $
             VERBOSE=verbose
  
  IF keyword_set(WINNUM) THEN winnum = winnum[0] ELSE winnum = 7     ;sets new value
  IF keyword_set(OUTPLOT) THEN outplot = 'Y' ELSE outplot = 'N'      ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1 ;sets new value
  
  fitxs = (max(xxs)-min(xxs))*indgen(101)/100.0 + min(xxs)
  fitys = xvals.c1*exp(-(fitxs-xvals.mu1)^2/(2.0*xvals.sig1^2)) + xvals.a1*fitxs + xvals.b1

  window, winnum, XPOS=625, YPOS=175, XSIZE=500, YSIZE=500 ;window options
  ploterror, xxs, xys, xyerr, PSYM=2, $                    ;plot values 
             COLOR = '000000'XL, $                         ;plot options
             ERRCOLOR = '000000'XL, $                      ;plot options
             BACKGROUND = 'FFFFFF'XL, $                    ;plot options
             CHARSIZE = 1.4, $                             ;plot options
             XTITLE = 'Spatial Position [pixels]', $       ;plot options
             YTITLE = 'Flux [arbitrary units]', $          ;plot options
             TITLE = 'Gaussian Data and Bayesian Fit', $   ;plot options
             SYMSIZE = 1.5, $
             CHARTHICK = 1.4
  oplot, fitxs, fitys, COLOR='000000'XL, $ ;plot best fit line 
         LINESTYLE = 0, $                  ;line options
         THICK = 2.5                       ;line options


END
;========================================================================================================================



;========================================================================================================================
pro bayesian_gaussian_lincont, xs, ys, yerr, FITVALS=fitvals, ITERATE=iterate, $
                               MUPRIOR=muprior, SIGPRIOR=sigprior, APRIOR=aprior, BPRIOR=bprior, CPRIOR=cprior,$
                               MUMIN=mumin, MUMAX=mumax, MUBIN=mubin, $
                               SIGMIN=sigmin, SIGMAX=sigmax, SIGBIN=sigbin, $
                               CMIN=cmin, CMAX=cmax, CBIN=cbin, $
                               AMIN=amin, AMAX=amax, ABIN=abin, $
                               BMIN=bmin, BMAX=bmax, BBIN=bbin, $
                               NOPLOTFIT=noplotfit, PLOTDATA=plotdata, $
                               VERBOSE=verbose, HELP=help


;+
; NAME:
;       BAYESIAN_GAUSSIAN_LINCONT()
;
; PURPOSE:
;       Fits a Gaussian function with a linear background of the form
;       f(x) = c*exp(-(x-mu)^2/(2*sigma^2)) + ax + b       
;
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
;       A. DeGroot, 2014 Jan 17, Univ. Cali, Riverside v1.0.1
;          -added check against NaNs when guessing C values
;       A. DeGroot, 2014 Jan 17, Univ. Cali, Riverside v1.0.0
;
;
; DESIRED UPGRADES
;       Add option of double precision calculations
;       Need to include prior's
;
;-
  version = '1.0.1'


  if keyword_set(NOPLOTFIT) then plotfit = 'n' else plotfit = 'y'    ;sets new value
  if keyword_set(PLOTDATA) then plotdata = 'y' else plotdata = 'n'   ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1 ;sets new value
  if keyword_set(HELP) then help = help[0] else help = 'n'           ;sets new value

  if verbose GE 4 THEN BEGIN                             ;check VERBOSE keyword
     print, xs                                           ;print info
     print, ys                                           ;print info
     print, ' '                                          ;space
  ENDIF                                                  ;end check VERBOSE keyword
  
  
  ;;;sanity checks
  nxs = n_elements(xs)                                               ;find # of elements
  nys = n_elements(ys)                                               ;find # of elements
  if (nxs NE nys) then print, 'WARNING: # of xs not equal # of ys'   ;print warning 
  
  CASE (keyword_set(mumin) AND keyword_set(mumax) AND keyword_set(mubin)) OF 
     0 : BEGIN
        mus = muguess(xs, ys)
        CASE (keyword_set(mumin) OR keyword_set(mumax) OR keyword_set(mubin)) OF 
           0 : BEGIN
              if verbose GE 3 THEN print, '   No MU* keywords given. Taking best guess!'
              mumin = mus[0]
              mumax = mus[1]
              mubin = mus[2]
              mus = dindgen((mumax-mumin)/mubin+1.0) * mubin + mumin ;find test points
           END
           1 : BEGIN
              if verbose GE 3 THEN BEGIN
                 print, '   SOME MU* keywords given. Using given, taking best guess for others!'
              ENDIF
              if keyword_set(MUMIN) then mumin = mumin[0] else mumin = mus[0] ;sets new value
              if keyword_set(MUMAX) then mumax = mumax[0] else mumax = mus[1] ;sets new value
              if keyword_set(MUBIN) then mubin = mubin[0] else mubin = mus[2] ;sets new value
              mus = dindgen((mumax-mumin)/mubin+1.0) * mubin + mumin          ;find test points
           END
           ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
        ENDCASE
     END
     1 : BEGIN
        if keyword_set(MUMIN) then mumin = mumin[0] else mumin = -1.00 ;sets new value
        if keyword_set(MUMAX) then mumax = mumax[0] else mumax = 1.00  ;sets new value
        if keyword_set(MUBIN) then mubin = mubin[0] else mubin = 0.02  ;sets new value
        mus = dindgen((mumax-mumin)/mubin+1.0) * mubin + mumin         ;find test points
     END 
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
  ENDCASE
  
  CASE (keyword_set(sigmin) AND keyword_set(sigmax) AND keyword_set(sigbin)) OF 
     0 : BEGIN
        sigs = sigguess(xs, ys)
        CASE (keyword_set(sigmin) OR keyword_set(sigmax) OR keyword_set(sigbin)) OF 
           0 : BEGIN
              if verbose GE 3 THEN print, '   No SIG* keywords given. Taking best guess!'
              sigmin = sigs[0]
              sigmax = sigs[1]
              sigbin = sigs[2]
           END
           1 : BEGIN
              if verbose GE 3 THEN BEGIN
                 print, '   SOME SIG* keywords given. Using given, taking best guess for others!'
              ENDIF
              if keyword_set(SIGMIN) then sigmin = sigmin[0] else sigmin = sigs[0] ;sets new value
              if keyword_set(SIGMAX) then sigmax = sigmax[0] else sigmax = sigs[1] ;sets new value
              if keyword_set(SIGBIN) then sigbin = sigbin[0] else sigbin = sigs[2] ;sets new value
           END
           ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
        ENDCASE
     END
     1 : BEGIN
        if keyword_set(SIGMIN) then sigmin = sigmin[0] else sigmin = 0.01 ;sets new value
        if keyword_set(SIGMAX) then sigmax = sigmax[0] else sigmax = 3.00 ;sets new value
        if keyword_set(SIGBIN) then sigbin = sigbin[0] else sigbin = 0.05 ;sets new value
     END 
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
  ENDCASE

  CASE (keyword_set(cmin) AND keyword_set(cmax) AND keyword_set(cbin)) OF 
     0 : BEGIN
        cs = cguess(xs, ys)
        CASE (keyword_set(cmin) OR keyword_set(cmax) OR keyword_set(cbin)) OF 
           0 : BEGIN
              if verbose GE 3 THEN print, '   No C* keywords given. Taking best guess!'
              cmin = cs[0]
              cmax = cs[1]
              cbin = cs[2]
           END
           1 : BEGIN
              if verbose GE 3 THEN BEGIN
                 print, '   SOME C* keywords given. Using given, taking best guess for others!'
              ENDIF
              if keyword_set(CMIN) then cmin = cmin[0] else cmin = cs[0] ;sets new value
              if keyword_set(CMAX) then cmax = cmax[0] else cmax = cs[1] ;sets new value
              if keyword_set(CBIN) then cbin = cbin[0] else cbin = cs[2] ;sets new value
           END
           ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
        ENDCASE
     END
     1 : BEGIN
        if keyword_set(CMIN) then cmin = cmin[0] else cmin = 0.01 ;sets new value
        if keyword_set(CMAX) then cmax = cmax[0] else cmax = 10.0 ;sets new value
        if keyword_set(CBIN) then cbin = cbin[0] else cbin = 0.1  ;sets new value
     END 
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
  ENDCASE

  CASE (keyword_set(amin) AND keyword_set(amax) AND keyword_set(abin)) OF 
     0 : BEGIN
        as = aguess(xs, ys)
        CASE (keyword_set(amin) OR keyword_set(amax) OR keyword_set(abin)) OF 
           0 : BEGIN
              if verbose GE 3 THEN print, '   No A* keywords given. Taking best guess!'
              amin = as[0]
              amax = as[1]
              abin = as[2]
           END
           1 : BEGIN
              if verbose GE 3 THEN BEGIN
                 print, '   SOME A* keywords given. Using given, taking best guess for others!'
              ENDIF
              if keyword_set(AMIN) then amin = amin[0] else amin = as[0] ;sets new value
              if keyword_set(AMAX) then amax = amax[0] else amax = as[1] ;sets new value
              if keyword_set(ABIN) then abin = abin[0] else abin = as[2] ;sets new value
           END
           ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
        ENDCASE
     END
     1 : BEGIN
        if keyword_set(AMIN) then amin = amin[0] else amin = -1.00 ;sets new value
        if keyword_set(AMAX) then amax = amax[0] else amax = 1.00  ;sets new value
        if keyword_set(ABIN) then abin = abin[0] else abin = 0.02  ;sets new value
     END 
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
  ENDCASE

  CASE (keyword_set(bmin) AND keyword_set(bmax) AND keyword_set(bbin)) OF 
     0 : BEGIN
        bs = bguess(xs, ys)
        CASE (keyword_set(bmin) OR keyword_set(bmax) OR keyword_set(bbin)) OF 
           0 : BEGIN
              if verbose GE 3 THEN print, '   No B* keywords given. Taking best guess!'
              bmin = bs[0]
              bmax = bs[1]
              bbin = bs[2]
           END
           1 : BEGIN
              if verbose GE 3 THEN BEGIN
                 print, '   SOME B* keywords given. Using given, taking best guess for others!'
              ENDIF
              if keyword_set(BMIN) then bmin = bmin[0] else bmin = bs[0] ;sets new value
              if keyword_set(BMAX) then bmax = bmax[0] else bmax = bs[1] ;sets new value
              if keyword_set(BBIN) then bbin = bbin[0] else bbin = bs[2] ;sets new value
           END
           ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
        ENDCASE
     END
     1 : BEGIN
        if keyword_set(BMIN) then bmin = bmin[0] else bmin = -1.00 ;sets new value
        if keyword_set(BMAX) then bmax = bmax[0] else bmax = 1.00  ;sets new value
        if keyword_set(BBIN) then bbin = bbin[0] else bbin = 0.02  ;sets new value
     END 
     ELSE : print, 'WARNING!! Something has gone horribly wrong!!'
  ENDCASE

  ;;;make our test point grids, priors
  nmus = n_elements(mus)                                                  ;find # of test points
  IF keyword_set(muprior) THEN mup = makeprior(mus, muprior) ELSE BEGIN $ ;create prior array
     mup = mus                                                            ;copy 
     mup[*] = 1.0                                                         ;set everything to 1
  ENDELSE                                                                 ;end no prior given

  
  sigs = dindgen((sigmax-sigmin)/sigbin+1.0) * sigbin + sigmin                ;find test points
  nsigs = n_elements(sigs)                                                    ;find # of test points
  IF keyword_set(sigprior) THEN sigp = makeprior(sigs, sigprior) ELSE BEGIN $ ;create prior array
     sigp = sigs                                                              ;copy 
     sigp[*] = 1.0                                                            ;set everything to 1
  ENDELSE                                                                     ;end no prior given
 
  cs = dindgen((cmax-cmin)/cbin+1.0) * cbin + cmin                    ;find test points
  ncs = n_elements(cs)                                                ;find # of test points
  IF keyword_set(cprior) THEN cp = makeprior(cs, cprior) ELSE BEGIN $ ;create prior array
     cp = cs                                                          ;copy 
     cp[*] = 1.0                                                      ;set everything to 1
  ENDELSE                                                             ;end no prior given
  
  as = dindgen((amax-amin)/abin+1.0) * abin + amin                    ;find test points
  nas = n_elements(as)                                                ;find # of test points
  IF keyword_set(aprior) THEN ap = makeprior(as, aprior) ELSE BEGIN $ ;create prior array
     ap = as                                                          ;copy 
     ap[*] = 1.0                                                      ;set everything to 1
  ENDELSE                                                             ;end no prior given
  
  bs = dindgen((bmax-bmin)/bbin+1.0) * bbin + bmin                    ;find test points
  nbs = n_elements(bs)                                                ;find # of test points
  IF keyword_set(bprior) THEN bp = makeprior(bs, bprior) ELSE BEGIN $ ;create prior array
     bp = bs                                                          ;copy 
     bp[*] = 1.0                                                      ;set everything to 1
  ENDELSE                                                             ;end no prior given

  IF help EQ 'Y' THEN BEGIN                   ;check HELP keyword
     help, mus                                ;print info
     help, sigs                               ;print info
     help, as                                 ;print info
     help, bs                                 ;print info
  ENDIF                                       ;end check HELP keyword
  IF verbose GE 3 THEN BEGIN                  ;check VERBOSE value
     print, 'Test x values values: ', mus     ;print info
     print, 'Test x values values: ', sigs    ;print info
     print, 'Test slope values: ', as         ;print info
     print, 'Test intercept values: ', bs     ;print info
     print, 'Test normalization values: ', bs ;print info
     print, ''                                ;print info
  ENDIF                                       ;end check VERBOSE value
  

  ;;;find likelihood of test points
  test = fltarr(n_elements(xs))                                         ;array to be filled
  jlike = fltarr(nmus, nsigs, nas, nbs, ncs)                            ;joint likelihood array to be filled
  prior = fltarr(nmus, nsigs, nas, nbs, ncs)                            ;prior array to be filled
  denom = 2.0*yerr^2                                                    ;find denom in exp
  tock = SYSTIME(/SECONDS)                                              ;start time
  FOR zz=0UL, nmus-1, 1 DO BEGIN                                        ;loop over the mean 
     line = strcompress('  Step ' + string(zz) + ' of ' + string(nmus)) ;line to print
     IF (verbose GE 4) AND (zz mod 5 EQ 0) THEN print, line             ;print info
     FOR yy=0UL, nsigs-1, 1 DO BEGIN                                    ;loop over sigmas
        FOR xx=0UL, nas-1, 1 DO BEGIN                                   ;loop over background slope
           FOR ww=0UL, nbs-1, 1 DO BEGIN                                ;loop over background int
              FOR vv=0UL, ncs-1, 1 DO BEGIN                             ;loop over constanst
                 
                 inner = -(xs-mus[zz])^2.0/(2.0*sigs[yy]^2)                         ;find exponent values
                 unf = where((inner LT -87.0) OR (inner GT 87.0), COMPLEMENT=nofl)  ;find underflow or overflow problem
                 IF nofl[0] NE -1 THEN BEGIN                                        ;if good values to be calc
                    test[nofl] = cs[vv]*exp(inner[nofl]) + as[xx]*xs[nofl] + bs[ww] ;find hypothetical data values
                    IF unf[0] NE -1 THEN test[unf] = as[xx]*xs[unf] + bs[ww]        ;find hypothetical data values
                 ENDIF ELSE BEGIN                                                   ;end if good values to be calculated
                    test[*] = as[xx]*xs + bs[ww]                                    ;set all to zero 
                 ENDELSE                                                            ;end no good values
                 
                 likeli = (-1.0*(ys-test)^2/denom) ;find likelihood of points
                 tmpjlike = total(likeli)          ;joint likelihood
                 jlike[zz,yy,xx,ww,vv] = tmpjlike  ;store value
                 
                 prior[zz,yy,xx,ww,vv] = mup[zz]*sigp[yy]*ap[xx]*bp[ww]*cp[vv] ;joint prior
                 
              ENDFOR                                             ;end loop over constant
           ENDFOR                                                ;end loop over background int
        ENDFOR                                                   ;end loop over background slope
     ENDFOR                                                      ;end loop over sigmas
  ENDFOR                                                         ;end loop over mean
  tick = SYSTIME(/SECONDS)                                       ;end time
  IF verbose GE 1 THEN print, '  Bayesian run time: ', tick-tock ;print time
  
  
  ;;;post calculation cleanup
  boxscore, jlike, VALUES=jvals, /QUIET    ;find statistics
  boxscore, prior, /QUIET                  ;find statistics
  jlike = jlike - jvals[3]                 ;subtract largest value
  jlike = exp(jlike)                       ;out of LOG space
  nogood = where(jlike NE jlike, nnogood)  ;check for NaNs, INFs
  IF nnogood NE 0 THEN jlike[nogood] = 0.0 ;set to zero if present
                                ;jlike = jlike * prior                    ;include priors
  
  ;;;Make some plots
  data = breakdown(jlike)              ;find all 1D PDF and 2D PDF contours
  plotPDF, mus, data.ys1, 1, WINNUM=2  ;plot PDF
  plotPDF, sigs, data.ys2, 2, WINNUM=3 ;plot PDF
  plotPDF, as, data.ys3, 3, WINNUM=4   ;plot PDF
  plotPDF, bs, data.ys4, 4, WINNUM=5   ;plot PDF
  plotPDF, cs, data.ys5, 5, WINNUM=6   ;plot PDF

  
  ;;;Find most probable values, plot, and return them
  mp = max(data.ys1, mpmuind)                                      ;find peak in PDF 
  mpmu = mus[mpmuind]                                              ;get most likely value
  sigmu = sigmas(mus, data.ys1, LEVELS=1)                          ;find sigmas
  mp = max(data.ys2, mpsigind)                                     ;find peak in PDF 
  mpsig = sigs[mpsigind]                                           ;get most likely value
  sigsig = sigmas(sigs, data.ys2, LEVELS=1)                        ;find sigmas
  mp = max(data.ys3, mpaind)                                       ;find peak in PDF 
  mpa = as[mpaind]                                                 ;get most likely value
  siga = sigmas(as, data.ys3, LEVELS=1)                            ;find sigmas
  mp = max(data.ys4, mpbind)                                       ;find peak in PDF 
  mpb = bs[mpbind]                                                 ;get most likely value
  sigb = sigmas(bs, data.ys4, LEVELS=1)                            ;find sigmas
  mp = max(data.ys5, mpcind)                                       ;find peak in PDF 
  mpc = cs[mpcind]                                                 ;get most likely value
  sigc = sigmas(cs, data.ys5, LEVELS=1)                            ;find sigmas
  fitvals = {mu1:mpmu, mum1:sigmu[0], mup1:sigmu[1], $             ;cont next line
             sig1:mpsig, sigm1:sigsig[0], sigp1:sigsig[1], $       ;cont next line
             a1:mpa, am1:siga[0], ap1:siga[1], $                   ;cont next line
             b1:mpb, bm1:sigb[0], bp1:sigb[1], $                   ;cont next line
             c1:mpc, cm1:sigc[0], cp1:sigc[1]}                     ;store values
  ;print, plotfit
  if plotfit EQ 'y' THEN bplotfit, xs, ys, yerr, fitvals, WINNUM=7 ;plot fit
  

  ;;;Set up values for next iteration
  iterate = {mumin:0.0, mumax:0.0, mubin:0.0, $
             sigmin:0.0, sigmax:0.0, sigbin:0.0, $
             amin:0.0, amax:0.0, abin:0.0, $
             bmin:0.0, bmax:0.0, bbin:0.0, $
             cmin:0.0, cmax:0.0, cbin:0.0}
  vals = nextiter(mus, data.ys1)
  IF vals[0] NE 0.0 THEN iterate.mumin = vals[0] ELSE iterate.mumin = 0.001
  iterate.mumax = vals[1]
  iterate.mubin = vals[2]
  vals = nextiter(sigs, data.ys2)
  iterate.sigmin = vals[0]
  iterate.sigmax = vals[1]
  iterate.sigbin = vals[2]
  vals = nextiter(as, data.ys3)
  iterate.amin = vals[0]
  iterate.amax = vals[1]
  iterate.abin = vals[2]
  vals = nextiter(bs, data.ys4)
  iterate.bmin = vals[0]
  iterate.bmax = vals[1]
  iterate.bbin = vals[2]
  vals = nextiter(cs, data.ys5)
  iterate.cmin = vals[0]
  iterate.cmax = vals[1]
  iterate.cbin = vals[2]

  RETURN
END
;========================================================================================================================




;========================================================================================================================
pro bayesian_gaussian_lincont_example

  xs = [1.0, 1.4, 2.1, 2.9]
  ys = [3.1, 4.1, 5.0, 7.1]
  xerr = [0.11, 0.12, 0.10, 0.11]*1.0
  yerr = [0.10, 0.11, 0.12, 0.11]*1.0
  intmin = 0.0
  intmax = 2.0
  intbin = 0.005
  slpmin = 1.5
  slpmax = 2.5
  slpbin = 0.005
  txmin = -2.0
  txmax = 7.0
  txbin = 0.05

  bayesian_linear_xyerr, xs, ys, xerr, yerr, $
                         INTMIN=intmin, INTMAX=intmax, INTBIN=intbin, $
                         SLPMIN=slpmin, SLPMAX=slpmax, SLPBIN=slpbin, $
                         TXMIN=txmin, TXMAX=txmax, TXBIN=txbin, $
                         /PLOTFIT, /PLOTDATA 
  
end
;========================================================================================================================
