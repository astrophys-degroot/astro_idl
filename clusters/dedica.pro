;========================================================================================================================
function psi, val

  xpsi = (1.0-val^2+0.083333*val^4) * exp(-0.25*val^2) ;fvalnction

  RETURN, xpsi
END
;========================================================================================================================


;========================================================================================================================
function kergaussian, xs, MU=mu, SIGMA=sigma, BANDWIDTH=bandwidth, LOG=log

  IF keyword_set(MU) THEN mu = mu[0] ELSE mu = 0.0                             ;set standard kernel value
  IF keyword_set(SIGMA) THEN sigma = sigma[0] ELSE sigma = 1.0                 ;set standard kernel value 
  IF keyword_set(BANDWIDTH) THEN bandwidth = bandwidth[0] ELSE bandwidth = 1.0 ;set standard kernel value

  tsig = sigma*bandwidth                                                           ;effective sigma
  IF keyword_set(LOG) THEN BEGIN                                                   ;if log space desired
     kerret = -1.0*(0.5*alog(2*!pi*(tsig)^2) + (xs-mu)^2/(2.0*(tsig)^2))           ;find kernel 
  ENDIF ELSE BEGIN                                                                 ;if not log space
     kerret = bandwidth*(2*!pi*(tsig)^2)^(-0.5)*exp(-1.0*(xs-mu)^2/(2.0*(tsig)^2)) ;find kernel
  ENDELSE                                                                          ;end normal space

  RETURN, kerret
END
;========================================================================================================================



;========================================================================================================================
function fixedkernel, xdata

  nxdata = n_elements(xdata)                                             ;find number of points
  stats = summary(xdata)                                                 ;finds quartiles based on Tukey, J. W. (1977)
  option1 = sigma(xdata)                                                 ;find std dev
  option2 = (stats[3]-stats[1]/1.34)                                     ;another option
  sigma = 0.9*min([option1, option2])*nxdata^(-0.2)                      ;find sigma aka kernel size

  RETURN, sigma
END
;========================================================================================================================



;========================================================================================================================
function optfixedkernel, xdata, SIGMA=sigma, NITERS=niters

  
  IF keyword_set(SIGMA) THEN sigma = sigma[0] ELSE sigma = 1.0    ;set as large value
  IF keyword_set(NITERS) THEN niters = niters[0] ELSE niters = 10 ;set max value


  ;;;inital items
  nxdata = n_elements(xdata)    ;find number of points
  term3 = nxdata^(-0.2)         ;third term in the equation
  doublesum = 0.0D              ;create variable


  ;;;double summation
  cnt = 0
  WHILE cnt LT NITERS DO BEGIN
     c1 = 3.0 / (8.0*sqrt(!pi)*double(nxdata)^2*sigma^5) ;first constant
     FOR ii=0, nxdata-1, 1 DO BEGIN                      ;first summation
        FOR jj=0, nxdata-1, 1 DO BEGIN                   ;second summation
           bit = (xdata[ii] - xdata[jj]) / sigma         ;feed to function
           doublesum = doublesum + psi(bit)              ;function plus sum total
        ENDFOR                                           ;end second summation
     ENDFOR                                              ;end first summation
     term2 = (c1 * doublesum)^(-0.2)                     ;second term in the equation


     print, term2, term3, term2 * term3
     sigma = term2 * term3
     cnt = cnt + 1
  ENDWHILE

  print, 'Still under construction!!!!'
  print, '  What is alpha(k)!?!?!?!?!?'
  stop
  
  RETURN, sigma
END
;========================================================================================================================



;========================================================================================================================
function adaptkernel, xdata, kertype, sigma, xs, SENSPARAM=sensparam, FKA=fka, PLOTIT=plotit, $
                      VERBOSE=verbose


  nxdata = n_elements(xdata)    ;find number of points
  
  ;;;step 3: find pilot kernel estimate using fixed kernel
  FOR zz=0, nxdata-1, 1 DO BEGIN                                                      ;first loop to find pilot kernel and bandwidth factor denominator
     CASE kertype OF                                                                  ;which kernel to use
        1 : BEGIN                                                                     ;using a Gaussian kernel
           tmpfpn = kergaussian(xs, MU=xdata[zz], SIGMA=sigma)                        ;pilot estimate
           IF zz NE 0 THEN fpn = fpn + tmpfpn ELSE fpn = tmpfpn                       ;start adding
        END                                                                           ;end using a Gaussian kernel
        ELSE : BEGIN                                                                  ;if kertype not understood
           IF verbose GE 1 THEN BEGIN                                                 ;check VERBOSE value
              print, ' WARNING!! KERTYPE not understood. Using a Gaussian kernel.'    ;print info 
              tmpfpn = kergaussian(xs, MU=xdata[zz], SIGMA=sigma, /LOG)               ;pilot estimate
              IF zz NE 0 THEN fpn = fpn + tmpfpn ELSE fpn = fpn                       ;start adding
           ENDIF                                                                      ;end check VERBOSE
        ENDELSE                                                                       ;end if kertype not understood
     ENDCASE                                                                          ;end which kernel to use
  ENDFOR                                                                              ;end loop over points
  fpn = fpn / nxdata                                                                  ;normalize by number of data
     

  ;;;find bandwidth factors
  fpi = dblarr(nxdata)                        ;create array
  FOR zz=0, nxdata-1, 1 DO BEGIN              ;now find bandwidth factor 
     find = min(abs(xdata[zz]-xs), minind)    ;find closes match for data point in xs variable
     fpi[zz] = fpn[minind]                    ;get ys
  ENDFOR                                      ;end loop over points
  logg = total(alog10(fpi)) / nxdata          ;find bandwidth denominator
  gg = 10^logg                                ;out of log space
  bandwidths = (fpi / gg)^(-1.0*sensparam)    ;find bandwidths
  

  ;;;find adaptive kernel estimate
  FOR zz=0, nxdata-1, 1 DO BEGIN                                                                ;now find bandwidth factor 
     CASE kertype OF                                                                            ;which kernel to use
        1 : BEGIN                                                                               ;using a Gaussian kernel
           tmpfka = kergaussian(xs, MU=xdata[zz], SIGMA=sigma, BANDWIDTH=bandwidths[zz])        ;pilot estimate
           IF zz NE 0 THEN fka = fka + tmpfka ELSE fka = tmpfka                                 ;start adding
        END                                                                                     ;end using a Gaussian kernel
        ELSE : BEGIN                                                                            ;if kertype not understood
           IF verbose GE 1 THEN BEGIN                                                           ;check VERBOSE value
              print, ' WARNING!! KERTYPE not understood. Using a Gaussian kernel.'              ;print info 
              tmpfka = kergaussian(xs, MU=xdata[zz], SIGMA=sigma,  BANDWIDTH=bandwidths[zz])    ;pilot estimate
              IF zz NE 0 THEN fka = fka + tmpfka ELSE fka = fka                                 ;start adding
           ENDIF                                                                                ;end check VERBOSE
        ENDELSE                                                                                 ;end if kertype not understood
     ENDCASE                                                                                    ;end which kernel to use
  ENDFOR                                                                                        ;end loop over points
  fka = fka / nxdata                                                                            ;normalize by number of data
  
 

  IF keyword_set(PLOTIT) THEN BEGIN                    ;if keyword is set
     mywin = window(DIMENSIONS=[500,500])              ;window
     xplot = plot(xs, fpn, 'b-.', THICK=3, /CURRENT, $ ;plot
                  XTITLE='Redshift', $                 ;plot options
                  YTITLE='Density', $                  ;plot options
                  FONT_SIZE=14)                        ;plot options
     xplot = plot(xs, fka, 'g-.', THICK=3, /OVERPLOT)  ;plot 
  ENDIF                                                ;end keyword set


  IF keyword_set(FKA) THEN RETURN, fka ELSE RETURN, sigma*bandwidths
END
;========================================================================================================================



;========================================================================================================================
FUNCTION crossvalidate, xdata, sigmas, kertype ;, xs, $
                                ;VERBOSE=verbose

  nxdata = n_elements(xdata)    ;number of data points
  mfka1 = 0.0D                  ;initialize
  mfka2 = 0.0D                  ;initialize
  
  FOR jj=0UL, nxdata-1, 1 DO BEGIN                                                            ;loop over j
     FOR ii=0UL, nxdata-1, 1 DO BEGIN                                                         ;loop over i
        bit1 = double(-0.5 * ((xdata[ii]-xdata[jj])^2.0 / (sigmas[ii]^2.0 + sigmas[jj]^2.0))) ;exponent in term1
        tmp1 = double(2.0*!pi*(sigmas[ii]^2 + sigmas[jj]^2))^(-0.5)*exp(bit1)                 ;term1
        mfka1 = mfka1 + tmp1                                                                  ;add by double sum
        bit2 = -0.5*(xdata[jj]-xdata[ii])^2.0 / (sigmas[jj]^2.0)                              ;exponent of term2
        tmp2 = (2.0*!pi*sigmas[jj]^2)^(-0.5) * exp(bit2)                                      ;term2
        IF (ii NE jj) THEN mfka2 = mfka2 + tmp2                                               ;when i NE j
     ENDFOR                                                                                   ;end loop over i
  ENDFOR                                                                                      ;end loop over j

  mfka = -1.0*((mfka1 / nxdata^2) - (2.0*mfka2 / (nxdata*(nxdata-1.0))))

  RETURN, mfka
END
;========================================================================================================================


;========================================================================================================================
function dedica_analyze, xvals, yvals, ITERMAX=itermax, LOWERLIM=lowerlim, MINDIFF=mindiff, $
                         NITERS=niters

  labels = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', $                        ;cont next line
            'K', $'L', 'M', 'N', 'O', 'P', 'Q', 'R', $                                 ;cont next line
            'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AB', $                            ;cont next line
            'AC', 'AD', 'AE', 'AF', 'AG', 'AI', 'AJ', 'AK']                            ;label for peaks
  IF keyword_set(NITERS) THEN niters = fix(niters[0]) ELSE niters = n_elements(labels) ;default

  


  origyvals = yvals                                             ;copy yvals
  dyvals = deriv(xvals, yvals)                                  ;take first derivative
  ddyvals = deriv(xvals, dyvals)                                ;take second derivative
  analysis = {start:0}                                          ;start structure
  base = ['peak', 'dinflec', 'uinflec', 'dupturn', 'uupturn']   ;base tag names
  vals = replicate('0.', n_elements(base))                      ;to give when adding tags to structure
  
  mywin = window(LOCATION=[500,150], DIMENSIONS=[600,600])        ;define window
  theplot = plot(xvals, yvals, LINESTYLE=0, /CURRENT, $           ;plot
                 THICK=2, $                                       ;plot options
                 TITLE='XMM113 Adaptive Kernel Reconstruction', $ ;plot options
                 XTITLE='Redshift', $                             ;plot options
                 YTITLE='Normalized Probablity', $                ;plot options
                 FONT_SIZE=13)                                    ;plot options

  niters = 0                                    ;start counting
  pcnt = 0                                      ;count peaks
  WHILE niters LT n_elements(labels) DO BEGIN   ;iterate
     curymax = max(yvals, maxind)               ;find maximum
     ccdown = (ddyvals[curymax] LE 0.000000001) ;double check peak is concave down

     IF ccdown EQ 1 THEN BEGIN                                                                          ;if peak is concave down
        godown = 1                                                                                      ;start counter
        inddown = maxind-1                                                                              ;get current index
        cinflecd = 0                                                                                    ;flag
        WHILE (godown EQ 1) DO BEGIN                                                                    ;if still going down
           IF (dyvals[inddown] GT 0.0) AND (inddown GT 0) THEN inddown-- ELSE godown = 0                ;end going down
           IF (ddyvals[inddown] LT 0.0) AND (cinflecd EQ 0) THEN inflecdown = inddown ELSE cinflecd = 1 ;inflection point
        ENDWHILE                                                                                        ;end still going down
        goup = 1                                                                                        ;start counter
        indup = maxind+1                                                                                ;get current index
        cinflecu = 0                                                                                    ;flag
        WHILE goup EQ 1 DO BEGIN                                                                        ;if still going up
           IF (dyvals[indup] LT 0.0) AND (indup LT n_elements(xvals)-1) THEN indup++ ELSE goup = 0      ;end going up
           IF (ddyvals[indup] LT 0.0) AND (cinflecu EQ 0) THEN inflecup = indup ELSE cinflecu = 1       ;inflection point
        ENDWHILE                                                                                        ;end still going up
        
     ENDIF ELSE BEGIN
        print, 'WTF!! Peak is not concave down?!?!' ;end peak concave down
        inddown = 0                                          ;set minimum possible
        inflecdown = 0                                       ;set minimum possible
        indup = n_elements(xvals) - 1                        ;set maximum possible
        inflecup = n_elements(xvals) - 1                     ;set minimum possible
     ENDELSE

     
     IF (curymax GT lowerlim) THEN BEGIN                                                                   ;if peak value is high enough
        print, '  Peak value high enough...'                                                               ;print info
        theplot = plot([xvals[maxind]], [yvals[maxind]], 'rX', SYM_SIZE=3.0, /OVERPLOT)                    ;add to plot
        theplot = plot([xvals[inddown]], [yvals[inddown]], 'ro', SYM_SIZE=2.0, THICK=2.0, /OVERPLOT)       ;add to plot
        theplot = plot([xvals[inflecdown]], [yvals[inflecdown]], 'gs', SYM_SIZE=2.0, THICK=2.0, /OVERPLOT) ;add to plot
        theplot = plot([xvals[indup]], [yvals[indup]], 'ro', SYM_SIZE=2.0, THICK=2.0, /OVERPLOT)           ;add to plot
        theplot = plot([xvals[inflecup]], [yvals[inflecup]], 'gs', SYM_SIZE=2.0, THICK=2.0, /OVERPLOT)     ;add to plot
        IF (abs(origyvals[indup] - curymax) GT mindiff) AND $                                              ;cont next line
           (abs(origyvals[inddown] - curymax) GT mindiff) THEN BEGIN                                       ;if peak is distinct enough
           print, '  Peak distinct enough...'                                                              ;print info
           print, '   Its a real peak...'                                                                  ;print info
           thistags = strcompress(labels[pcnt] + '_' + base, /REMOVE_ALL)                                  ;label the base tags
           add_tags, analysis, thistags, vals, tmpstruc                                                    ;add tags
           analysis = tmpstruc                                                                             ;recapture
           analysis.(5*pcnt+1) = xvals[maxind]                                                             ;store value
           analysis.(5*pcnt+2) = xvals[inflecdown]                                                         ;store value
           analysis.(5*pcnt+3) = xvals[inflecup]                                                           ;store value
           analysis.(5*pcnt+4) = xvals[inddown]                                                            ;store value
           analysis.(5*pcnt+5) = xvals[indup]                                                              ;store value
           yvals[inddown:indup] = 0.0         ;zero out values corresponding to this peak
           pcnt = pcnt + 1                                                                                 ;add to peak count
        ENDIF ELSE yvals[inddown:indup] = 0.0                                                              ;end peak distinct enough
     ENDIF ELSE niters = n_elements(labels)                                                                ;end peak value high enough

     niters = niters + 1        ;up counter
  ENDWHILE                      ;end iterate
  
  RETURN, analysis
END
;========================================================================================================================



;========================================================================================================================
PRO dedica, speczs, KERTYPE=kertype, TYPROBDENSE=typrobdense, ANALYZE=analyze, $
            FACTOR0=factor0, SENSPARAM=sensparam, $
            NITERS=niters, $
            ZMIN=zmin, ZMAX=zmax, BINSIZE=binsize, NPTS=npts, $
            ANITERMAX=anitermax, ANLOWERLIM=anlowerlim, ANMINDIFF=anmindiff, $
            PLOTIT=plotit, PLOTVALS=plotvals, VERBOSE=verboses


;+
; NAME:
;       DEDICA()
;
; PURPOSE:
;       Algorithm taken from Pisani et al 1993 to identify probability
;       of a cluster being present.    
;
; CALLING SEQUENCE:
;       
;      
; INPUTS:
;        
;
; OPTIONAL INPUTS:
;       
;
; KEYWORD PARAMETERS:
;        
;
; OUTPUTS:
;       
;
; OPTIONAL OUTPUTS:
;
;
; COMMON BLOCKS:
;       
;
; PROCEDURES USED:
;       
;
; COMMENTS:
;        
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1-0-0'

  ;print, speczs

  ;;;set default and initial values
  IF keyword_set(KERTYPE) THEN kertype = kertype[0] ELSE kertype = 1                 ;set value [1=Gaussian]
  IF keyword_set(TYPROBDENSE) THEN typrobdense = typrobdense[0] ELSE typrobdense = 3 ;set value [1=fixed]
  IF keyword_set(FACTOR0) THEN factor0 = factor0[0] ELSE factor0 = 4.0               ;set value
  IF keyword_set(DECFAC) THEN decfac = decfac[0] ELSE decfac = 0.90                  ;set value
  IF keyword_set(SENSPARAM) THEN sensparam = sensparam[0] ELSE sensparam = 0.5       ;set value
  IF keyword_set(NITERS) THEN niters = niters[0] ELSE niters = 30                    ;set value
  IF keyword_set(ZMIN) THEN zmin = zmin[0] ELSE zmin = 0.0                           ;set value
  IF keyword_set(ZMAX) THEN zmax = zmax[0] ELSE zmax = 3.0                           ;set value
  IF keyword_set(BINSIZE) THEN binsize = binsize[0] ELSE binsize = 0.1               ;set value
  IF keyword_set(NPTS) THEN npts = npts[0] ELSE npts = 50000                         ;set value
  IF keyword_set(ANITERMAX) THEN anitermax = anitermax[0] ELSE anitermax = 99        ;set value
  IF keyword_set(ANLOWERLIM) THEN anlowerlim = anlowerlim[0] ELSE anlowerlim = 0.4   ;set value
  IF keyword_set(ANMINDIFF) THEN anmindiff = anmindiff[0] ELSE anmindiff = 0.08      ;set value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 3                 ;set value
  

  ;;;sanity checks
  chk = (sensparam GT 0.0) AND (sensparam LE 1.0)                                                      ;check range
  IF chk NE 1 THEN BEGIN                                                                               ;if check fails
     IF verbose GE 1 THEN print, ' WARNING!!! SENSPARAM value not valid. Using dfault value 0.5.'      ;print info
     sensparam = 0.5                                                                                   ;reset to default
  ENDIF                                                                                                ;end if check fails
  chk = (zmin LE 0.0)                                                                                  ;relative check  
  IF chk EQ 1 THEN BEGIN                                                                               ;if check fails
     IF verbose GE 1 THEN print, ' WARNING!!! ZMIN value is not valid. Setting zmin=0.0'               ;print info
     zmin = 0.0                                                                                        ;reset to default
  ENDIF                                                                                                ;end if check fails
  chk = (zmax GE 10.0)                                                                                 ;relative check  
  IF chk EQ 1 THEN BEGIN                                                                               ;if check fails
     IF verbose GE 1 THEN print, ' WARNING!!! ZMAX value is not valid. Setting zmax=3.0'               ;print info
     zmax = 3.0                                                                                        ;reset to default
  ENDIF                                                                                                ;end if check fails
  chk = (zmin LT zmax)                                                                                 ;relative check  
  IF chk NE 1 THEN BEGIN                                                                               ;if check fails
     IF verbose GE 1 THEN print, ' WARNING!!! ZMIN value is greater than ZMAX value. Setting zmin=0.0' ;print info
     zmin = 0.0                                                                                        ;reset to default
  ENDIF                                                                                                ;end if check fails
  chk = decfac^niters                                                                                  ;amount of original 
  IF chk LT 0.001 THEN BEGIN                                                                           ;if check fails
     IF verbose GE 1 THEN print, ' WARNING!!! Total decrement in sigma is too great'                   ;print info
     IF verbose GE 1 THEN print, '  Increase decfac parameter or decrease niters parameter'            ;print info
     stop                                                                                              ;stop funning
  ENDIF

  
  ;;;inital setup
  nspeczs = n_elements(speczs)                                                                    ;find # of data points
  xs = ((zmax-zmin)/npts)*ulindgen(npts+1) + zmin                                                 ;x values
  plotvals = {XS:fltarr(n_elements(xs)), YS:fltarr(n_elements(xs))}                               ;create structure
  CASE kertype OF                                                                                 ;which kernel to use
     1 : IF verbose GE 1 THEN print, ' Using a Gaussian kernel.'                                  ;print info
     ELSE : BEGIN                                                                                 ;if kertype not understood
        IF verbose GE 1 THEN print, ' WARNING!! KERTYPE not understood. Using a Gaussian kernel.' ;print info   
     ENDELSE                                                                                      ;end if kertype not understood
  ENDCASE                                                                                         ;end which kernel to use
  

  CASE TYPROBDENSE OF
     1 : BEGIN
        IF verbose GE 1 THEN print, ' Using a fixed kernel size.'   ;print info
        kersize = fixedkernel(speczs)                               ;find fixed size
        IF verbose GE 2 THEN print, '  Fixed kernel size:', kersize ;print info

        FOR zz=0, nspeczs-1, 1 DO BEGIN                                                       ;loop over data
           CASE kertype OF                                                                    ;which kernel to use
              1 : BEGIN                                                                       ;using a Gaussian kernel
                 tmpft = kergaussian(xs, MU=speczs[zz], SIGMA=kersize)                        ;pilot estimate
                 IF zz EQ 0 THEN ft = tmpft ELSE ft = ft + tmpft                              ;add it all up
              END                                                                             ;end using a Gaussian kernel
              ELSE : BEGIN                                                                    ;if kertype not understood
                 a=1                                                                          ;nothing
              ENDELSE                                                                         ;end if kertype not understood
           ENDCASE                                                                            ;end which kernel to use
        ENDFOR                                                                                ;end loop over points
        ftmax = max(ft)                                                                       ;find max value
        ft = ft / ftmax                                                                       ;get most prob value to 1
     END
     2 : BEGIN
        IF verbose GE 1 THEN print, ' Using an optimal fixed kernel size.'  ;print info
        kersize = optfixedkernel(speczs)                                    ;find fixed size
        IF verbose GE 2 THEN print, '  Optimal fixed kernel size:', kersize ;print info
     END
     3 : BEGIN
        IF verbose GE 1 THEN print, ' Using an adaptive kernel estimate.' ;print info

        ;;;step 1: initial guess of kernel size
        sigma = factor0*fixedkernel(speczs)        ;find intial guess
        print, '  Initial guess for sigma:', sigma ;print info
        
        ;;;iterate to adjust parameters
        cnt = 0                                                           ;intialize counter
        found = 0                                                         ;initialize flag
        moved = 0                                                         ;initialize flag
        allsigma = dblarr(niters)                                         ;make array
        allmfka = dblarr(niters)                                          ;make array

        WHILE (cnt LT niters) DO BEGIN                                    ;start iteration loop
           IF verbose GE 3 THEN print, '   Now on iteration number:', cnt ;print info

           ;;;step 2: half * guess of kernel size at every iteration
           IF (cnt NE 0) THEN sigma = decfac*sigma ELSE sigma = sigma ;cut kernel size in half
           allsigma[cnt] = sigma                                      ;store sigma
           IF verbose GE 3 THEN print, '    Sigma is now:', sigma     ;print info

           ;;;step 3: find the adaptive kernel estimate for this step
           sigmas = adaptkernel(speczs, kertype, sigma, xs, SENSPARAM=sensparam, $ ;cont next line
                                VERBOSE=verbose)                                   ;find fixed size
           
           ;;;step 4: calculate least squares cross-validation
           mfka = crossvalidate(speczs, sigmas, kertype) ;find cross-validation
           allmfka[cnt] = mfka                           ;store value

           IF (cnt NE 0) THEN BEGIN                               ;if not the first pass 
              IF ((mfka LT bestmfka) AND (found EQ 0)) THEN BEGIN ;if new guess is better
                 bestmfka = mfka                                  ;store new best
                 bestsigma = sigma                                ;store new best
                 moved = 1                                        ;we have moved at least once
              ENDIF ELSE BEGIN                                    ;end if new guess is better
                 IF (moved EQ 1) THEN found = 1                   ;flip the flag only if we have moved
              ENDELSE                                             ;end new guess not better
           ENDIF ELSE BEGIN                                       ;end not first pass
              bestsigma = sigma                                   ;must be best since its the only one
              bestmfka = mfka                                     ;must be best since its the only one
           ENDELSE                                                ;end if first pass
           
           cnt = cnt +  1       ;increase counter
        ENDWHILE                ;end iteration loop
        
        bestfka = adaptkernel(speczs, kertype, bestsigma, xs, SENSPARAM=sensparam, $ ;cont next line
                              /FKA, VERBOSE=verbose)                                 ;find fixed size
        bestmax = max(bestfka)                                                       ;find max value
        bestfka = bestfka / bestmax                                                  ;put highest peak at 1.0
        plotvals.xs = xs                                                             ;store x-values
        plotvals.ys = bestfka                                                        ;store y-values

     END
     ELSE : BEGIN
     ENDELSE
  ENDCASE


  IF keyword_set(PLOTIT) THEN BEGIN
     chk = where(allmfka GE 0.0, nchk)
     IF (chk[0] NE -1) THEN BEGIN
        subsigma = allsigma[chk]
        submfka = allmfka[chk]
        rfakexs = max(subsigma)-min(subsigma)
        fakexs = [min(subsigma)-2.0*rfakexs, max(subsigma)+2.0*rfakexs]
        rfakeys = max(submfka)-min(submfka)
        fakeys = [min(submfka)-2.0*rfakeys, max(submfka)+2.0*rfakeys]
        mywin = window(LOCATION=[400,50], DIMENSIONS=[600,600])
        theplot = plot(subsigma, submfka, 'gD', SYM_SIZE=1.5, /SYM_FILLED, /CURRENT, $
                       TITLE='Cross-Validation Selection of Sigma', $
                       XTITLE='Sigma', $
                       XRANGE=[min(subsigma)-0.4*rfakexs, max(subsigma)+0.4*rfakexs] , $
                       YTITLE='Least-Squares Cross-Validation', $
                                ;YRANGE=[min(submfka)-0.4*rfakeys, max(submfka)+0.4*rfakeys] )
                       YRANGE=[0, max(submfka)+0.4*rfakeys] )
        otheplot = plot(fakexs, [bestmfka, bestmfka], LINESTYLE=0, /OVERPLOT)
        otheplot = plot([bestsigma, bestsigma], fakeys, LINESTYLE=0, /OVERPLOT)
        

        mywin = window(LOCATION=[450,100], DIMENSIONS=[600,600])
        theplot = plot(xs, bestfka, LINESTYLE=0, /CURRENT, $
                       THICK=2, $
                       TITLE='Adaptive Kernel Reconstruction', $
                       XTITLE='Redshift', $
                       YTITLE='Normalized Probablity', $
                       FONT_SIZE=13)
     ENDIF
  ENDIF

  
  IF keyword_set(ANALYZE) THEN analyze = dedica_analyze(xs, bestfka, ITERMAX=anitermax, LOWERLIM=anlowerlim, $
                                                        MINDIFF=anmindiff)
  RETURN
END
;========================================================================================================================



;========================================================================================================================
PRO call_dedica 

  file = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/CDFS44_pz_specz_full_v3-8-4.fits'
  outfile = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/CDFS44_pz_specz_full_v3-8-5.fits'

  ;file = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/xmm113_pz_specz_full_v3-1-4.fits'
  ;outfile = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/xmm113_pz_specz_full_v3-1-5.fits'

  ;file = '/Users/adegroot/research/clusters/xmm/xmm105/catalogs/xmm105_pz_specz_full_v3-0-4.fits'
  ;outfile = '/Users/adegroot/research/clusters/xmm/xmm105/catalogs/xmm105_pz_specz_full_v3-0-5.fits'

  xdata = mrdfits(file, 1, hdr)
                                ;help, data, /STRUC

  chk = tag_exist(xdata, 'SP_M_Z', INDEX=spzbind)   ;find necessary tag
  text = '   This plot requires a spec-z keyword: ' ;text to pass
  IF chk EQ 0 THEN spzbind = tagprompt(xdata, text) ;find necessary tag

  chk = where((xdata.(spzbind) GE 0.0) AND (xdata.(spzbind) LT 10.0)) ;make a sanity cut
  IF (chk[0] NE -1) THEN speczs = xdata[chk].(spzbind)                ;keep good objects
  
  analysis = 1                                                       ;start variable as something
  dedica, speczs, NITERS=45, FACTOR0=2.25, ANALYZE=analysis, /PLOTIT ;get stuff
  add_tag, xdata, 'AN_DEDICA', 'ZZ', tmpstruc                        ;add tag to structure
  xdata = tmpstruc                                                   ;recapture structure

  print, analysis
  labels = ['A', 'B', 'C', 'D', 'E', 'F']                                                          ;peak labels
  FOR xx=0, n_elements(labels)-1, 1 DO BEGIN                                                       ;loop over peaks
     bit1 = strcompress(labels[xx] + '_DINFLEC', /REMOVE_ALL)                                      ;tag name
     bit2 = strcompress(labels[xx] + '_UINFLEC', /REMOVE_ALL)                                      ;tag name
     chk = tag_exist(analysis, bit1, INDEX=ind1)                                                   ;find necessary tag
     chk = tag_exist(analysis, bit2, INDEX=ind2)                                                   ;find necessary tag
     IF (ind1 NE -1) AND (ind2 NE -1) THEN BEGIN                                                   ;sanity check
        yes = where((xdata.(spzbind) GE analysis.(ind1)) AND (xdata.(spzbind) LE analysis.(ind2))) ;in range
        IF (yes[0] NE -1) THEN xdata[yes].AN_DEDICA = labels[xx]                                   ;store value
     ENDIF                                                                                         ;sanity check
  ENDFOR                                                                                           ;end loop over peaks

  mwrfits, xdata, outfile, /CREATE

END
;========================================================================================================================



;========================================================================================================================
PRO test_dedica 

  zmin = 0.0
  zmax = 3.0
  npts = 1000
  xs = ((zmax-zmin)/npts)*indgen(npts+1) + zmin ;x values

  mu1 = 0.3
  sig1 = 0.05
  mu2 = 0.5
  sig2 = 0.05
  mu3 = 0.7
  sig3 = 0.05
  mu4 = 1.8
  sig4 = 0.15
  mu5 = 1.8
  sig5 = 0.45
  tmp = (2*!pi*sig1^2)^(-0.5)*exp(-1.0*(mu1-xs)^2/(2*sig1^2))
  tot = tmp
  tmp = (2*!pi*sig2^2)^(-0.5)*exp(-1.0*(mu2-xs)^2/(2*sig2^2))
  tot = tot + tmp
  tmp = (2*!pi*sig3^2)^(-0.5)*exp(-1.0*(mu3-xs)^2/(2*sig3^2))
  tot = tot + tmp
  tmp = (2*!pi*sig4^2)^(-0.5)*exp(-1.0*(mu4-xs)^2/(2*sig4^2))
  tot = tot + tmp
  tmp = (2*!pi*sig5^2)^(-0.5)*exp(-1.0*(mu5-xs)^2/(2*sig5^2))
  tot = tot + tmp

  total = int_tabulated(xs, tot, /DOUBLE)
  tot = tot / total

  result = total(tot, /CUMULATIVE)
  w = window(LOCATION=[150,50])
  xplots = plot(xs, tot, '-', /CURRENT)
  ;xplots = plot(xs, result, '-', /CURRENT, /OVERPLOT)

  max = max(result)
  x = randomu(seed, 500) * max
  data = x
  data[*] = 0.0
  FOR xx=0, 500-1, 1 DO BEGIN
     chk = min(abs(x[xx]-result), minind)
     data[xx] = xs[minind]
  ENDFOR  
  h = histogram(data, binsize=0.1)
  xs = indgen(n_elements(h))
  ;histplot = PLOT(xs, h, /CURRENT, /STAIRSTEP)


  chk = dedica(data, /PLOTIT)

END
;========================================================================================================================
