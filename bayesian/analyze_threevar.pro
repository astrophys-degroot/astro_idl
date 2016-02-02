;========================================================================================================================
function nextiter_threevar, xxs, xys, NOUT=nout, PAD=pad, FRAC=frac
  
  IF keyword_set(NOUT) THEN nout = nout[0] ELSE nout = 3       ;set new value
  IF keyword_set(PAD) THEN pad = pad[0] ELSE pad = 3.0         ;set new value
  IF keyword_set(FRAC) THEN frac = frac[0] ELSE frac = 0.00005 ;set new value

  
  nxxs = n_elements(xxs)                                                ;find number of elements
  delta = xxs[1]-xxs[0]                                                 ;shift
  chk = where(xys GT frac*max(xys, maxxysind), nchk)                    ;find elements which qualify
  IF nchk GT 0 THEN BEGIN                                               ;if nonzero # qualify
     
     IF (maxxysind GE 3) AND (maxxysind LE nxxs-4) THEN BEGIN ;if peak value not too close to edge
        
        minind = min(chk)-nout        ;find lowest index 
        IF minind LT 3 THEN BEGIN     ;sanity check
           minind = 0                 ;fix if necessary
           xmin = xxs[minind]         ;set value
        ENDIF ELSE xmin = xxs[minind] ;otherwise set value
        
        maxind = max(chk)+nout         ;find highest index
        IF maxind GT nxxs-4 THEN BEGIN ;sanity check
           maxind = nxxs-1             ;fix highest index
           xmax = xxs[maxind]          ;set value
        ENDIF ELSE xmax = xxs[maxind]  ;otherwise set value

     ENDIF ELSE BEGIN           ;if peak to close to edge

        IF (maxxysind GE 3) THEN BEGIN  ;if peak too close to lower edge
           xmin = xxs[0]-pad*nout*delta ;move out to lower values
           maxind = max(chk)+nout       ;find highest index
           help, xxs
           print, maxind
           ;;;WORK!! somehow maxind was greater than number of
           ;;;elements in xxs
           IF (maxind GT n_elements(xxs)-1) THEN maxind = n_elements(xxs)-1 ;safety net
           xmax = xxs[maxind]   ;get new upper limit
        ENDIF                           ;end too close lower edge

        IF (maxxysind LE nxxs-4) THEN BEGIN  ;if too close to high edge
           minind = min(chk)-nout            ;find lowest index 
           xmin = xxs[minind]                ;get new lower limit
           xmax = xxs[nxxs-1]+pad*nout*delta ;move out to higher values
        ENDIF                                ;end if too close to high edge
        
     ENDELSE                    ;end zero # of qualify

  ENDIF ELSE BEGIN              ;if zero # qualify
     xmin = xxs[0]              ;keep currest lowest
     xmax = xxs[nxxs-1]         ;keep current highest
  ENDELSE                       ;end zero # of qualify
  
  RETURN, [xmin, xmax]          ;return values
END
;========================================================================================================================


;========================================================================================================================
PRO analyze_threevar, xarray, axs, bxs, cxs, VARNAMES=varnames, $
                           NOMARG=nomarg, NOTWOD=notwod, WINSTART=winstart, $
                           FITS=fits, ITERATE=iterate, $
                           VERBOSE=verbose, HELP=help


;+
; NAME:
;       ANALYZE_THREEVAR()
;
; PURPOSE:
;       Take a 3D array from a Bayesian analysis and break it down
;       into most probably values, error and graphs.     
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
;       A. DeGroot, 2014 Sep 10, Univ. Cali, Riverside v1.0.0
;
;
; DESIRED UPGRADES
;       -add smarter limit checks for next iteration if pdf is close
;       to edge of domain     
;
;
;-
  version = '1.0.0'

  IF keyword_set(WINSTART) THEN winstart = winstart[0] ELSE winstart = 0 ;check VARNAMES 
  IF keyword_set(VARNAMES) THEN BEGIN                                    ;check VARNAMES 
     IF n_elements(VARNAMES) NE 3 THEN BEGIN                             ;check # of names
        print, 'WARNING!!! VARNAMES shoudl have exactly 3 elements!!'    ;print info
        varnames = ['a', 'b', 'c']                                       ;default
     ENDIF                                                               ;end check # of names
  ENDIF                                                                  ;end check VARNAMES
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1     ;sets new value


  ;;;sanity check
  nogood = where(xarray NE xarray, nnogood) ;check for NaNs, INFs
  IF nnogood NE 0 THEN xarray[nogood] = 0.0 ;set to zero IF present


  ;;;create storage structure
  results = {amp:0.0D, asm:0.0D, asp:0.0D, bmp:0.0D, bsm:0.0D, bsp:0.0D, cmp:0.0D, csm:0.0D, csp:0.0D} ;structure to fill
  next = {all:0.0D, aul:0.0D, bll:0.0D, bul:0.0D, cll:0.0D, cul:0.0D}                                  ;structure to fill

  
  ;;;reduce the array to 2D and 1D posterior PDFs
  margc = total(xarray, 3)      ;marginalize over c
  margb = total(xarray, 2)      ;marginalize over b
  marga = total(xarray, 1)      ;marginalize over a
  margbc = total(margc, 2)      ;marginalize over b,c: PDF for a
  margac = total(marga, 2)      ;marginalize over a,c: PDF for b
  margab = total(margb, 1)      ;marginalize over a,b: PDF for c
  
  IF keyword_set(HELP) THEN BEGIN ;if help keyword set
     help, margc                  ;helped
     help, margb                  ;helped
     help, marga                  ;helped
     help, margbc                 ;helped
     help, margac                 ;helped
     help, margab                 ;helped
  ENDIF                           ;end if help keyword set
  

  ;;;normalize posterior PDFs
  IF ~keyword_set(NOMARG) THEN BEGIN   ;check NOMARG keyword
     norm = int_tabulated(axs, margbc) ;normalization constant
     margbc = margbc * (1.0/norm)      ;normalize
     norm = int_tabulated(bxs, margac) ;normalization constant
     margac = margac * (1.0/norm)      ;normalize
     norm = int_tabulated(cxs, margab) ;normalization constant
     margab = margab * (1.0/norm)      ;normalize
  ENDIF                                ;end check NOMARG


  ;;;find most probably values and errors
  maxa = max(margbc, inda)                ;find most probable a value
  results.amp = axs[inda]                 ;store most probable value
  sigmasa = sigmas(axs, margbc, LEVELS=1) ;find sigmas
  results.asm = sigmasa[0]                ;store -1sig value
  results.asp = sigmasa[1]                ;store +1sig value
  maxb = max(margac, indb)                ;find most probable slope value
  results.bmp = bxs[indb]                 ;store most probable value
  sigmasb = sigmas(bxs, margac, LEVELS=1) ;find sigmas
  results.bsm = sigmasb[0]                ;store -1sig value
  results.bsp = sigmasb[1]                ;store +1sig value
  maxc = max(margab, indc)                ;find most probable slope value
  results.cmp = cxs[indc]                 ;store most probable value
  sigmasc = sigmas(cxs, margab, LEVELS=1) ;find sigmas
  results.csm = sigmasc[0]                ;store -1sig value
  results.csp = sigmasc[1]                ;store +1sig value
  
  
  ;;;find interation values
  lims = nextiter_threevar(axs, margbc) ;find limits
  next.all = lims[0]                    ;store lower limit
  next.aul = lims[1]                    ;store lower limit
  lims = nextiter_threevar(bxs, margac) ;find limits
  next.bll = lims[0]                    ;store lower limit
  next.bul = lims[1]                    ;store lower limit
  lims = nextiter_threevar(cxs, margab) ;find limits
  next.cll = lims[0]                    ;store lower limit
  next.cul = lims[1]                    ;store lower limit


  ;;;Plot 2D contours posterior PDFs 
  IF ~keyword_set(NOTWOD) THEN BEGIN                              ;check NOTWOD keyword
     window, winstart, XPOS=400, YPOS=350, XSIZE=500, YSIZE=500   ;window options
     contour, margc, axs, bxs, $                                  ;2D posterior distribution plot
              BACKGROUND='FFFFFF'XL, $                            ;plot options
              COLOR='000000'XL, $                                 ;plot options
              XTITLE= varnames[0] + ' [units]', $                 ;plot options
              YTITLE= varnames[1] + ' [units]', $                 ;plot options
              TITLE='2D Posterior PDF', $                         ;plot options
              CHARSIZE=1.4                                        ;plot options
     window, winstart+1, XPOS=450, YPOS=325, XSIZE=500, YSIZE=500 ;window options
     contour, margb, axs, cxs, $                                  ;2D posterior distribution plot
              BACKGROUND='FFFFFF'XL, $                            ;plot options
              COLOR='000000'XL, $                                 ;plot options
              XTITLE=varnames[0] + ' [units]', $                  ;plot options
              YTITLE=varnames[2] + ' [units]', $                  ;plot options
              TITLE='2D Posterior PDF', $                         ;plot options
              CHARSIZE=1.4                                        ;plot options
     window, winstart+2, XPOS=500, YPOS=300, XSIZE=500, YSIZE=500 ;window options
     contour, marga, bxs, cxs, $                                  ;2D posterior distribution plot
              BACKGROUND='FFFFFF'XL, $                            ;plot options
              COLOR='000000'XL, $                                 ;plot options
              XTITLE=varnames[1] + ' [units]', $                  ;plot options
              YTITLE=varnames[2] + ' [units]', $                  ;plot options
              TITLE='2D Posterior PDF', $                         ;plot options
              CHARSIZE=1.4                                        ;plot options
     winstart = winstart + 3                                      ;increase window number
  ENDIF                                                           ;end check NOONED
  

  ;;;plot 1D poster PDFs
  IF ~keyword_set(NOONED) THEN BEGIN         ;check NOONED keyword
     fakeys = [-9999.99, 9999999999.9]       ;fake y data points 

     ;;;first variable
     window, winstart, XPOS=550, YPOS=275, XSIZE=500, YSIZE=500          ;window options
     plot, axs, margbc, $                                                ;1D posterior for intercepts
           BACKGROUND='FFFFFF'XL, $                                      ;plot options
           COLOR='000000'XL, $                                           ;plot options
           XTITLE=varnames[0] + ' [units]', $                            ;plot options
           YTITLE='Probability', $                                       ;plot options
           TITLE='1D Posterior PDF for ' + varnames[0] , $               ;plot options
           CHARSIZE=1.4                                                  ;plot options
     oplot, [axs[inda],axs[inda]], fakeys, COLOR='000000'XL, LINESTYLE=2 ;plot line on most likely value
     oplot, [axs[inda]-sigmasa[0],axs[inda]-sigmasa[0]], fakeys, $       ;plot line on -1sigma
            COLOR='000000'XL, LINESTYLE=1                                ;line options
     oplot, [axs[inda]+sigmasa[1],axs[inda]+sigmasa[1]], fakeys, $       ;plot line on +1sigma
            COLOR='000000'XL, LINESTYLE=1                                ;line options
     ;legend, ['Most Prob Val', '1sigma'], LINESTYLE=[2,1],  $            ;create legend
     ;        COLOR='000000'XL, $                                         ;legend options
     ;        TEXTCOLOR='000000'XL, $                                     ;legend options
     ;        CHARSIZE=1.2, BOX=0, /RIGHT                                 ;legend options

     ;;;second variable
     window, winstart+1, XPOS=600, YPOS=250, XSIZE=500, YSIZE=500        ;window options
     plot, bxs, margac, $                                                ;1D posterior for slope
           BACKGROUND='FFFFFF'XL, $                                      ;plot options
           COLOR='000000'XL, $                                           ;plot options
           XTITLE=varnames[1] + ' [units]', $                            ;plot options
           YTITLE='Probability', $                                       ;plot options
           TITLE='1D Posterior PDF for ' + varnames[1], $                ;plot options
           CHARSIZE=1.4                                                  ;plot options
     oplot, [bxs[indb],bxs[indb]], fakeys, COLOR='000000'XL, LINESTYLE=2 ;plot line on most likely value
     oplot, [bxs[indb]-sigmasb[0],bxs[indb]-sigmasb[0]], fakeys, $       ;plot line on -1sigma
            COLOR='000000'XL, LINESTYLE=1                                ;line options
     oplot, [bxs[indb]+sigmasb[1],bxs[indb]+sigmasb[1]], fakeys, $       ;plot line on +1sigma
            COLOR='000000'XL, LINESTYLE=1                                ;line options
     ;legend, ['Most Prob Val', '1sigma'], LINESTYLE=[2,1],  $            ;create legend
     ;        COLOR='000000'XL, $                                         ;legend options
     ;        TEXTCOLOR='000000'XL, $                                     ;legend options
     ;        CHARSIZE=1.2, BOX=0, /RIGHT                                 ;legend options
     
     ;;;third variable
     window, winstart+2, XPOS=650, YPOS=225, XSIZE=500, YSIZE=500        ;window options
     plot, cxs, margab, $                                                ;1D posterior for slope
           BACKGROUND='FFFFFF'XL, $                                      ;plot options
           COLOR='000000'XL, $                                           ;plot options
           XTITLE=varnames[2] + ' [units]', $                            ;plot options
           YTITLE='Probability', $                                       ;plot options
           TITLE='1D Posterior PDF for ' + varnames[2], $                ;plot options
           CHARSIZE=1.4                                                  ;plot options
     oplot, [cxs[indc],cxs[indc]], fakeys, COLOR='000000'XL, LINESTYLE=2 ;plot line on most likely value
     oplot, [cxs[indc]-sigmasc[0],cxs[indc]-sigmasc[0]], fakeys, $       ;plot line on -1sigma
            COLOR='000000'XL, LINESTYLE=1                                ;line options
     oplot, [cxs[indc]+sigmasc[1],cxs[indc]+sigmasc[1]], fakeys, $       ;plot line on +1sigma
            COLOR='000000'XL, LINESTYLE=1                                ;line options
     ;legend, ['Most Prob Val', '1sigma'], LINESTYLE=[2,1],  $            ;create legend
     ;        COLOR='000000'XL, $                                         ;legend options
     ;        TEXTCOLOR='000000'XL, $                                     ;legend options
     ;        CHARSIZE=1.2, BOX=0, /RIGHT                                 ;legend options

     IF verbose GE 2 THEN BEGIN                                   ;check verbose keyword
        print, '************************************************' ;print
        print, '  Most likeli '+varnames[0]+' value: ', axs[inda] ;print info
        print, '  One sigma errors on '+varnames[0]+':', sigmasa  ;print info
        print, '  Most likely '+varnames[1]+' value: ', bxs[indb] ;print info
        print, '  One sigma errors on '+varnames[1]+':', sigmasb  ;print info
        print, '  Most likely '+varnames[2]+' value: ', cxs[indc] ;print info
        print, '  One sigma errors on '+varnames[2]+':', sigmasc  ;print info
        print, '************************************************' ;print
     ENDIF                                                        ;end check verbose keyword
     
  ENDIF ;end check NOONED

  
  fits = results ;set variable to pass
  iterate = next ;set variable to pass
END
;========================================================================================================================
