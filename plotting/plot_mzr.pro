;========================================================================================================================
FUNCTION ERBCOMP, erbwhich, fakexs


  ;;;get the data
  pubmzr = obj_new('erb2006')   ;create object
  pubmzr.boxscore               ;load data from paper
  pubmzr.getprop, MZRDATA=mymzr ;get data from paper
  
  ;;;add the trend as desired
  CASE erbwhich OF                                                                   ;how to add
     1 : mzrtrend = errorplot(mymzr.xsmod, mymzr.ys, mymzr.xserrmod, mymzr.yserr, $  ;plot points
                              'D', SYM_COLOR='teal', SYM_FILLED=0, SYM_SIZE='1.5', $ ;plot values
                              ERRORBAR_COLOR='teal', $                               ;plot values
                              SYM_THICK=2, /OVERPLOT, NAME=' Erb 2006')                   ;plot options
     
     2 : BEGIN                                                                    ;plot trend
        mzrys = pubmzr.mzrfit(fakexs)                                             ;find trend values
        mzrtrend = plot(fakexs, mzrys, '-.', SYM_THICK=3, /OVERPLOT, NAME='Erb 2006') ;plot options
     END                                                                          ;plot the trend

     3 : BEGIN                        ;plot trend
        mzrys = pubmzr.mzrfit(fakexs) ;find trend values
        mzrtrend = mzrys              ;trend 
     END                              ;plot the trend

     ELSE : BEGIN
        print, 'WTF!!'
     ENDELSE

  ENDCASE

  RETURN, mzrtrend
END
;========================================================================================================================


;========================================================================================================================
FUNCTION STEIDELCOMP, steidelwhich, fakexs


  ;;;get the data
  pubmzr = obj_new('steidel2014') ;create object
  pubmzr.boxscore                 ;load data from paper
  pubmzr.getprop, MZRDATA=mymzr   ;get data from paper
  
  ;;;add the trend as desired
  CASE steidelwhich OF          ;how to add
     1 : BEGIN
        xerrors = transpose([[mymzr.xserrmodn],[mymzr.xserrmodp]])                    ;
        yerrors = transpose([[mymzr.yserrn],[mymzr.yserrp]])                          ;
        mzrtrend = errorplot(mymzr.xsmod, mymzr.ys, xerrors, yerrors, $               ;plot points
                             'S', SYM_COLOR='orange', SYM_FILLED=0, SYM_SIZE='2.0', $ ;plot values
                             ERRORBAR_COLOR='orange', $                               ;plot values
                             SYM_THICK=2, /OVERPLOT, NAME=' Steidel 2014')                 ;plot options
     END
     
     2 : BEGIN                                                                        ;plot trend
        mzrys = pubmzr.mzrfit('N2', fakexs)                                           ;find trend values
        mzrtrend = plot(fakexs, mzrys, '..', SYM_THICK=2, /OVERPLOT, NAME='Steidel 2014') ;plot options
     END                                                                              ;plot the trend

     ELSE : BEGIN
        print, 'WTF!!'
     ENDELSE
  ENDCASE

  RETURN, mzrtrend
END
;========================================================================================================================


;========================================================================================================================
FUNCTION SANDERSCOMP, sanderswhich, fakexs


  ;;;get the data
  pubmzr = obj_new('sanders2014') ;create object
  pubmzr.boxscore                 ;load data from paper
  pubmzr.getprop, N2DATA=mymzr    ;get data from paper
  
  ;;;add the trend as desired
  CASE sanderswhich OF          ;how to add
     1 : BEGIN
        xerrors = transpose([[mymzr.xserrn],[mymzr.xserrp]])                         ;
        yerrors = transpose([[mymzr.yserrn],[mymzr.yserrp]])                         ;
        mzrtrend = errorplot(mymzr.xs, mymzr.ys, xerrors, yerrors, $                 ;plot points
                             'td', SYM_COLOR='purple', SYM_FILLED=0, SYM_SIZE=2.0, $ ;plot values
                             ERRORBAR_COLOR='purple', $                              ;plot values
                             SYM_THICK=2, /OVERPLOT, NAME=' Sanders 2015')                ;plot options
     END
     
     2 : BEGIN                  ;plot trend
                                ;mzrys = pubmzr.mzrfit('N2', fakexs)                                           ;find trend values
                                ;mzrtrend = plot(fakexs, mzrys, '..', THICK=2, /OVERPLOT, NAME='Sanders 2014') ;plot options
     END                        ;plot the trend

     ELSE : BEGIN
        print, 'WTF!!'
     ENDELSE
  ENDCASE

  RETURN, mzrtrend
END
;========================================================================================================================



;========================================================================================================================
function PLOT_MZR, mass, metalrule, CLMEM=clmem, NS=ns, $ ;, DEMETALLICITY=dmetallitcity, $
                   EMASS=emass, DIFFPLOT=diffplot, $
                   HAFLUX=haflux, NIIFLUX=niiflux, $
                   N2RULE=n2rule, ULIMS=ulims, LABEL=label, $
                   XMIN=xmin, XMAX=xmas, YMIN=ymin, YMAX=ymax, CLCOLOR=clcolor, FICOLOR=ficolor, $
                   TITLE=title, $
                   QMAX=qmax, STACK=stack, SATURATE=saturate, $
                   FITINFO=fitinfo, $
                   SHOWERB06PTS=showerb06pts, SHOWERB06TREND=showerb06trend, $
                   SHOWTR04=showtr04, $
                   SHOWST14TR=showst14tr, SHOWST14PT=showst14pt, $
                   SHOWSA14PT=showsa14pt, $
                   SHOWMEAN=showmean, MEANMASS=meanmass, MEANN2=meann2, $ 
                   SHOWMED=showmed, MEDMASS=medmass, MEDN2=medn2, $ 
                   NULLVAL=nullval, OUTFILE=outfile, DOUTFILE=doutfile, VERBOSE=verbose

;+
; NAME:
;       PLOT_MZR()
;
; PURPOSE:
;       Take a mass and metallicity and plot it. Additional features
;       include plotting errors, legends, stacked points, upper limits
;       etc     
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
;       A. DeGroot, 2014 Oct 8, Univ. Cali, Riverside v1-3-0
;          -added group environment option
;       A. DeGroot, 2014 Oct 8, Univ. Cali, Riverside v1.0.0
;          -inception
;
;
; DESIRED UPGRADES
;      -stacks improvement
;      -error bars
;      -comparison set
;      -upper limits
;
;-
  version = '1-3-0'


  IF keyword_set(N2RULE) THEN n2rule = n2rule[0] ELSE n2rule = 'PP04'      ;set default 
  IF keyword_set(XMIN) THEN xmin = float(xmin[0]) ELSE xmin = 8.3          ;set default 
  IF keyword_set(XMAX) THEN xmax = float(xmax[0]) ELSE xmax = 11.5         ;set default 
  IF keyword_set(YMIN) THEN ymin = float(ymin[0]) ELSE ymin = 7.7          ;set default 
  IF keyword_set(YMAX) THEN ymax = float(ymax[0]) ELSE ymax = 9.5          ;set default
  IF keyword_set(CLCOLOR) THEN clcolor = clcolor[0] ELSE clcolor = 'red'   ;set default 
  IF keyword_set(GRCOLOR) THEN grcolor = grcolor[0] ELSE grcolor = 'green' ;set default 
  IF keyword_set(FICOLOR) THEN ficolor = ficolor[0] ELSE ficolor = 'blue'  ;set default 
  IF keyword_set(TITLE) THEN title = title[0] ELSE title = 0               ;set default 
  IF keyword_set(QMAX) THEN qmax = qmax[0] ELSE qmax = 2                   ;set default 
  IF keyword_set(NULLVAL) THEN nullval = nullval[0] ELSE nullval = -99.0   ;set default 
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 3       ;set default 
  


  ;;;general usage
  fakexs = ((xmax-xmin)/ 101.0) * indgen(101.0) + xmin ;fakexs

  ;;;sanity checks
  nspec = n_elements(mass)                                                                                  ;number of good points
  IF keyword_set(EMASS) THEN emass = emass ELSE emass = [[replicate([0.3],nspec)],[replicate([0.3],nspec)]] ;
  

  CASE metalrule OF             ;which metallicity
     
     'N2' : BEGIN                                                                                         ;using Halpha and [NII]
        IF (n_elements(mass) NE n_elements(haflux)) THEN BEGIN                                            ;if unequal size arrays
           print, 'WARNING!! Number of stellar masses given not equal number of Halpha fluxes given. '    ;print info
           stop                                                                                           ;stop run
        ENDIF                                                                                             ;end unequal size arrays
        IF (~keyword_set(HAFLUX) OR ~keyword_set(NIIFLUX)) THEN BEGIN                                     ;must set both keywords
           print, '  For the N2 metallicity indicator you must set both "HAFLUX" and "NIIFLUX" keywords.' ;print info
           stop                                                                                           ;stop run
        ENDIF                                                                                             ;end set both keyword
        CASE n2rule OF                                                                                    ;which N2 conversion
           'PP04' : BEGIN                                                                                 ;Pattini & Pagel 2004
              IF verbose GE 2 THEN print, '  Using conversion from Pettini & Pagel 2004'                  ;print info
              metals = pettini_pagel_2004(haflux, niiflux)                                                ;get metallicity
           END                                                                                            ;end Pattini & Pagel 2004
           'M08' : BEGIN                                                                                  ;Maiolino 2008
              IF verbose GE 2 THEN print, '  Using conversion from Maiolino 2008'                         ;print info
              print, 'WARNING!!! This still needs to be verified!!'                                       ;print info
                                ;metals = maiolino_2008(haflux, niiflux, N2=1)                                               ;get metallicity
           END                  ;end Maiolino 2008
           'ST14' : BEGIN       ;steidel 2014
              IF verbose GE 2 THEN print, '  Using conversion from Steidel et al. 2014'     ;print info
              print, 'WARNING!!! This still needs to be verified!!'                         ;print info
              myconv = obj_new('steidel2014')                                               ;create object
              metals = myconv.convertmetallicity('N2', HAFLUX=haflux, NIIFLUX=niiflux)      ;get metallicity
              obj_destroy, myconv                                                           ;destroy object
           END                                                                              ;end Steidel 2014
           ELSE : BEGIN                                                                     ;N2 conversion not understood
              print, 'WARNING!! Conversion rule choice of N2->12+LOG(O/H) not understood. ' ;print info
              print, '  Please choose another. Choices are PP04, and M08'                   ;print info
              stop                                                                          ;stop run
           END                                                                              ;end N2 conversion not understood
        ENDCASE                                                                             ;end which N2 conversion
        saturatehard = 9.014                                                                ;saturation value of 12+log(O/H)
        saturatesoft = 8.786                                                                ;saturation value of 12+log(O/H)
        solarabund = 8.69                                                                   ;solar abundance value of 12+log(O/H), Asplund 2009
     END                                                                                    ;end using Halpha and [NII]

     'R23' : BEGIN              ;using [OII] and [OIII]
        print, 'Not yet coded'  ;print info
     END                        ;end using [OII] and [OIII]
     
     'O3N2' : BEGIN             ;using [OIII] and [NII]
        print, 'not yet coded'  ;print info
     END                        ;end using [OIII] and [NII]

     ELSE : BEGIN                                                               ;metallicity not found
        print, 'WARNING!! Choice of conversion to 12+LOG(O/H) not understood. ' ;print info
        print, '  Please choose another. Choices are N2, R23, and O3N2'         ;print info
        stop                                                                    ;stop run
     ENDELSE                                                                    ;end metallicity not found
  ENDCASE                                                                       ;end which metallicity

  ;;;cut sample to window limits
  chk = where((mass LT xmin) OR (mass GT xmax) OR $                        ;cont next line
              (metals LT ymin+0.125) OR (metals GT ymax), COMPLEMENT=keep) ;find outside limits
  IF chk[0] NE -1 THEN BEGIN                                               ;if something outside limits
     mass = mass[keep]
     metals = metals[keep]
     ulims = ulims[keep]
     IF keyword_set(LABEL) THEN label = label[keep] 
     ;IF keyword_set(CLMEM) THEN clmem = clmem[keep] 
                                ;dmass = dmass[keep]
                                ;dmetallitcity =  dmetallitcity[keep]
     ;haflux = haflux[keep]
     ;niiflux = niiflux[keep]
  ENDIF                         ;end something outside limits

  ;;;Find environment(s) subset if possible
  IF keyword_set(CLMEM) THEN BEGIN          ;if cluster member keyword set
     cl = where((clmem EQ 1), nclall)       ;find cluster members
     group = where((clmem EQ 2), ngrall)    ;find group members
     field = where((clmem EQ 0), nfieldall) ;find field members
  ENDIF ELSE BEGIN                          ;end cluster member keyword set
     field = indgen(n_elements(mass))       ;get all entries
     nfieldall = n_elements(field)          ;total cluster numbers
     group = [-1]                           ;null entry
     cl = [-1]                              ;null entry
     nclall = 0                             ;
  ENDELSE                                   ;end if cluster member keyword not set


  ;;;Find upper limit subset if possible 
  IF keyword_set(ULIMS) THEN BEGIN                  ;if upper limits keyword set
     ulims = where(ulims EQ 1)
     match2, cl, ulims, clind, ulimsind             ;find common elements
     tmpcl = where(clind EQ -1, COMPLEMENT=tmpclul) ;find real and upper limits
     clul = cl[tmpclul]                             ;get actual indices
     cl = cl[tmpcl]                                 ;get actual indices

     IF (group[0] NE -1) THEN BEGIN                             ;if also sorted by environment
        match2, group, ulims, groupind, ulimsind                ;find common elements
        tmpgroup = where(groupind EQ -1, COMPLEMENT=tmpgroupul) ;find real and upper limits
        groupul = group[tmpgroupul]                             ;get actual indices
        group = group[tmpgroup]                                 ;get actual indices
     ENDIF                                                      ;end if sorted by environment

     IF (field[0] NE -1) THEN BEGIN                             ;if also sorted by environment
        match2, field, ulims, fieldind, ulimsind                ;find common elements
        tmpfield = where(fieldind EQ -1, COMPLEMENT=tmpfieldul) ;find real and upper limits
        fieldul = field[tmpfieldul]                             ;get actual indices
        field = field[tmpfield]                                 ;get actual indices
     ENDIF ELSE fieldul = [-1]                                  ;end if sorted by environment

  ENDIF ELSE BEGIN              ;end upper limits keyword set
     clul = [-1]                ;null array
     groupul = [-1]             ;null array
     fieldul = [-1]             ;null array
  ENDELSE                       ;end if upper limits keyword not set

  ;;;plot data for field
  myplot1 = SCATTERPLOT(mass[field], metals[field], SYMBOL='o', $                                          ;plot values
                        TITLE=title, $                                                                     ;plot options
                        XTITLE='log(M/Msolar)', $                                                          ;plot options
                        XRANGE=[xmin,xmax], $                                                              ;plot options
                        YTITLE='12 +  log(O/H)', $                                                         ;plot options
                        YRANGE=[ymin,ymax], $                                                              ;plot options
                        SYM_SIZE=1.0, /SYM_FILLED, SYM_COLOR=ficolor, $                                    ;plot options
                        MARGIN=[0.13,0.1,0.16,0.03], $                                                        ;plot options
                        FONT_SIZE=16, $                                                                    ;plot options
                        NAME=strcompress('This work (field): ' + $                                         ;
                                         strcompress('N=' + string(nfieldall) + $                          ;
                                                     '(' + string(n_elements(field)) + ')', /REMOVE_ALL))) ;plot options
  IF (fieldul[0] NE -1) THEN BEGIN                                                                                  ;if field membership given
     FOR xx=0, n_elements(fieldul)-1, 1 DO BEGIN                                                                    ;loop over upper lims
        myarrow = arrow([mass[fieldul[xx]], mass[fieldul[xx]]], [metals[fieldul[xx]], metals[fieldul[xx]]-0.125], $ ;plot upper limits
                        COLOR=ficolor, /DATA, /CURRENT, $                                                           ;plot options
                        HEAD_SIZE=0.4, HEAD_INDENT=0.0, LINE_THICK=1.5)                                             ;plot options
     ENDFOR                                                                                                         ;end loop 
  ENDIF 
  

  ;;;plot data for group
  IF (group[0] NE -1) THEN BEGIN                                                                                              ;if cluster membership given
     myplot2 = SCATTERPLOT(mass[group], metals[group], /OVERPLOT, SYMBOL='o', $                                               ;plot values
                           SYM_SIZE=1.0, /SYM_FILLED, SYM_COLOR=grcolor, $                                                    ;plot options
                           NAME=strcompress('This work (group): '+ $
                                            strcompress('N=' + string(ngrall) + '(' + string(n_elements(group)) + ')', /REMOVE_ALL))) ;plot options

     IF (groupul[0] NE -1) THEN BEGIN                                                                                 ;if groupuster membership given
        FOR xx=0, n_elements(groupul)-1, 1 DO BEGIN                                                                   ;loop over upper lims
           myarrow = arrow([mass[groupul[xx]], mass[groupul[xx]]], [metals[groupul[xx]], metals[groupul[xx]]-0.125], $ ;plot upper limits
                           COLOR=grcolor, /DATA, /CURRENT, $                                                          ;plot options
                           HEAD_SIZE=0.4, HEAD_INDENT=0.0, LINE_THICK=1.5)                                              ;plot options
        ENDFOR                                                                                                        ;end loop 
     ENDIF                                                                                                            ;end if group upper lims

     IF ~keyword_set(STACK) THEN targets = [myplot1, myplot2] ELSE targets = [] ;target list for legend
  ENDIF ELSE BEGIN                                                              ;end cluster membership given
     IF ~keyword_set(STACK) THEN targets = [myplot1] ELSE targets = []          ;target list for legend
  ENDELSE                                                                       ;end cluster membership not given
  
  
  ;;;plot data for cl
  IF (cl[0] NE -1) THEN BEGIN                                                                                           ;if cluster membership given
     myplot3 = SCATTERPLOT(mass[cl], metals[cl], /OVERPLOT, SYMBOL='o', $                                               ;plot values
                           SYM_SIZE=1.0, /SYM_FILLED, SYM_COLOR=clcolor, $                                              ;plot options
                           NAME=strcompress('This work (cluster): ' + $
                                            strcompress('N=' + string(nclall) + '(' + string(n_elements(cl)) + ')', /REMOVE_ALL))) ;plot options

     IF (clul[0] NE -1) THEN BEGIN                                                                        ;if cluster membership given
        FOR xx=0, n_elements(clul)-1, 1 DO BEGIN                                                          ;loop over upper lims
           myarrow = arrow([mass[clul[xx]], mass[clul[xx]]], [metals[clul[xx]], metals[clul[xx]]-0.125], $ ;plot upper limits
                           COLOR=clcolor, /DATA, /CURRENT, $                                              ;plot options
                           HEAD_SIZE=0.4, HEAD_INDENT=0.0, LINE_THICK=1.5)                                  ;plot options
        ENDFOR                                                                                            ;end loop 
     ENDIF                                                                                                ;end if cl upper lims

     IF ~keyword_set(STACK) THEN targets = [targets, myplot3] ELSE targets = [] ;target list for legend
  ENDIF ELSE BEGIN                                                              ;end cluster membership given
     IF ~keyword_set(STACK) THEN targets = [myplot1] ELSE targets = []          ;target list for legend
  ENDELSE                                                                       ;end cluster membership not given


  ;;;plot labels
  If keyword_set(LABEL) THEN BEGIN              ;if label keyword is set
     mylabel = text(mass, metals, label, /DATA) ;label things
  ENDIF                                         ;end label keyword set


  ;;;plot mean, median data if desired
  IF keyword_set(SHOWMEAN) THEN BEGIN                                                    ;show the mean points
     myplot3 = SCATTERPLOT(meanmass, (8.9+0.57*alog10(meann2)), /OVERPLOT, SYMBOL='o', $ ;plot values
                           SYM_SIZE=1.0, /SYM_FILLED, SYM_COLOR='orange', $              ;plot options
                           NAME='mean_bins')                                             ;plot options
  ENDIF                                                                                  ;end show the mean points
  IF keyword_set(SHOWMED) THEN BEGIN                                                     ;show the med points
     myplot3 = SCATTERPLOT(medmass, (8.9+0.57*alog10(medn2)), /OVERPLOT, SYMBOL='o', $   ;plot values
                           SYM_SIZE=1.0, /SYM_FILLED, SYM_COLOR='magenta', $             ;plot options
                           NAME='med_bins')                                              ;plot options
  ENDIF                                                                                  ;end show the med points

  ;;;plot published data
  targets3 = []
  If keyword_set(saturate) THEN  BEGIN
     myplot = plot([xmin-0.1,xmax+0.1], [saturatesoft,saturatesoft], '-', THICK=2, /OVERPLOT, NAME='AGN CUT')          ;plot options
     targets3 = [targets3, myplot]                                                                                       ;add to legend target
     ;myplot = plot([xmin-0.1,xmax+0.1], [saturatesoft,saturatesoft], '--', THICK=2, /OVERPLOT, NAME='COMPOSITE CUT')   ;plot options
     ;targets = [targets, myplot]                                                                                       ;add to legend target
     myplot = plot([xmin-0.1,xmax+0.1], [solarabund,solarabund], ':', THICK=2, /OVERPLOT, NAME='Solar Abundance') ;plot options
     targets3 = [targets3, myplot]                                                                                       ;add to legend target
  ENDIF
  
  IF keyword_set(SHOWTR04) THEN BEGIN                          ;show Steidel work
     pubmzr = obj_new('tremonti2004')                          ;create object 
     fakexs = ((xmax-xmin)/ 101.0) * indgen(101.0) + xmin      ;fakexs
     mzrys = pubmzr.mzrfit('R23', fakexs)                      ;find trend values
     mzrtrend = plot(fakexs, mzrys, '-.', $                    ;plot values
                     THICK=2, /OVERPLOT, NAME='Tremonti 2004') ;plot options
     targets3 = [targets3, mzrtrend]                           ;add to legend target
  ENDIF                                                        ;end show Steidel work

  
  targets2 = []
  IF keyword_set(SHOWERB06PTS) THEN BEGIN ;show Erb 2006 points 
     mzrpoints = erbcomp(1)               ;add points
     targets2 = [targets2, mzrpoints]     ;add to legend targets
  ENDIF                                   ;end show Erb work
  
  IF keyword_set(SHOWERB06TREND) THEN BEGIN ;show Erb work
     mzrtrend = erbcomp(2, fakexs)          ;add trend line
     mzrys = erbcomp(3, fakexs)             ;get points
     targets = [targets, mzrtrend]          ;add to legend targets   
  ENDIF                                     ;end show Erb work

  IF keyword_set(SHOWST14PT) THEN BEGIN ;show Steidel work
     mzrpoints = steidelcomp(1)         ;comparison
     targets2 = [targets2, mzrpoints]   ;add to legend targets
  ENDIF                                 ;end show Steidel work

  IF keyword_set(SHOWST14TR) THEN BEGIN ;show Steidel work
     mzrtrend = steidelcomp(2, fakexs)  ;comparison
     targets2 = [targets2, mzrtrend]    ;add to legend targets
  ENDIF                                 ;end show Steidel work

  IF keyword_set(SHOWSA14PT) THEN BEGIN ;show Sanders work
     mzrpoints = sanderscomp(1)         ;comparison
     targets2 = [targets2, mzrpoints]   ;add to legend targets
  ENDIF                                 ;end show Sanders work

  IF keyword_set(STACK) THEN BEGIN                                                                     ;if error are put on each point
     myerror = errorplot(mass, metals, emass, replicate([0.18],nspec)/ns^0.5, '.', THICK=2, /OVERPLOT) ;plot errors
  ENDIF ELSE myerror = errorplot([xmax-0.3], [ymax-0.3], [0.1], [0.18], '.', THICK=2, /OVERPLOT)      ;sample error bar
  

  
  IF keyword_set(FITINFO) THEN BEGIN                                                      ;fit info is provided
     CASE fitinfo.name OF                                                                 ;what is the fit that was performed
        'tr04' : BEGIN                                                                    ;tremonti constant offset
           mypub = obj_new('tremonti2004')                                                ;creat object
           xs = indgen(101.0)*((xmax-xmin+2.0)/100.0) + xmin                              ;create fake xs
           fit = mypub.mzrfit('R23', xs)                                                  ;grab fit 
           ys = fit+fitinfo.mpv                                                           ;y values
           myplot = plot(xs, ys, '-', /OVERPLOT)                                          ;plot best fit
           myplot = plot([xs,reverse(xs),xs[0]], $                                        ;plot best fit error
                         [ys+fitinfo.pmpv,reverse(ys-fitinfo.nmpv),ys[0]+fitinfo.pmpv], $ ;plot options
                         COLOR='gray', TRANSPARENCY=100, $                                ;plot options
                         FILL_COLOR='gray', FILL_BACKGROUND=1, FILL_TRANSPARENCY=70, $    ;plot options
                         NAME='This work', /OVERPLOT)                                     ;plot options
        END                                                                               ;end tremonti
     ENDCASE                                                                              ;end which fit performed
     targets = [targets, myplot]                                                          ;add to legend targets   
  ENDIF                                                                                   ;end fit info provided
  

  ;;;legend stuff
  mylegend = legend(TARGET=targets, POSITION=[xmin+0.15,ymax-0.1], /DATA, $ ;legend
                    SHADOW=0, LINESTYLE=6, SAMPLE_WIDTH=0.0, FONT_SIZE=11)   ;legend options
  mylegend = legend(TARGET=targets2, POSITION=[xmax-1.4,ymax-0.1], /DATA, $ ;legend
                    SHADOW=0, LINESTYLE=6, SAMPLE_WIDTH=0.0, FONT_SIZE=11)   ;legend options
  mylegend = legend(TARGET=targets3, POSITION=[xmin+0.15,ymax-0.27], /DATA, $ ;legend
                    SHADOW=0, LINESTYLE=6, SAMPLE_WIDTH=0.075, FONT_SIZE=11)   ;legend options
  

  ;;;add right Y-axis
  newmax = 10^((ymax-8.90)/0.57)
  newmin = 10^((ymin-8.90)/0.57)
  possmajor = [0.00001, 0.0001, 0.001, 0.01, 0.1, 1.0, 10.0, 100.0, 1000.0, 10000.0]
  thesemajor = where((possmajor GE newmin) AND (possmajor LE newmax))
  possmajor = possmajor[thesemajor]  
  majorname = strarr(n_elements(possmajor))
  FOR ii=0, n_elements(possmajor)-1, 1 DO BEGIN
     majorname[ii] = strcompress(string(possmajor[ii], FORMAT='(F6.2)'), /REMOVE_ALL)
  ENDFOR
  offsets = 8.90+0.57*alog10(possmajor)

  fullmajorname = []
  fullmajorval = []
  FOR ii=0, n_elements(possmajor)-1, 1 DO BEGIN
     fullmajorval = [fullmajorval, possmajor[ii]]
     next = (findgen(8)+2)*possmajor[ii]
     ;print, next
     fullmajorval = [fullmajorval, next]
     ;print, fullmajorval
     fullmajorname = [fullmajorname, strcompress(string(possmajor[ii], FORMAT='(F6.2)'), /REMOVE_ALL)]
     nextname = replicate('',8)
     fullmajorname = [fullmajorname, nextname]
  ENDFOR
  offsetsminor = 8.90+0.57*alog10(fullmajorval)
  keep = where((offsetsminor GE ymin) AND (offsetsminor LE ymax))
  IF keep[0] NE -1 THEN BEGIN
     offsetsminor = offsetsminor[keep]
     fullmajorname = fullmajorname[keep]
  ENDIF
  
  ax = myplot.axes              ;get the axis object
  ax[3].HIDE = 1                ;hide the right axis
  yaxis = axis('Y', $           ;remake the right axis minor ticks
               TITLE='[NII]$\lambda6585$/H$\alpha$', $
               LOCATION='right', $
               MAJOR=n_elements(offsetsminor), $
               TICKVALUES=offsetsminor, $
               TICKNAME=fullmajorname, $
               MINOR=0, $
               TICKLEN=0.02, $
               TICKFONT_SIZE=16, $
               STYLE=1)
  yaxis = axis('Y', $           ;remkae the right axis major ticks
               LOCATION='right', $
               MAJOR=n_elements(offsets), $
               TICKVALUES=offsets, $
               TICKNAME=majorname, $
               MINOR=0, $
               TICKFONT_SIZE=16, $
               TICKLEN=0.04, $
               STYLE=1)


  IF keyword_set(OUTFILE) THEN myplot1.save, outfile, RESOLUTION=1200 ;save plot



  IF keyword_set(DIFFPLOT) THEN BEGIN
     ksstuff = {clstuff:ptr_new(), grstuff:ptr_new(), fistuff:ptr_new()}
     mywin = window()
     
     clmasses = [mass[cl], mass[clul]]
     clmetals = [metals[cl], metals[clul]]
     diffs = clmetals
     diffs[*] = 0
     FOR zz=0, n_elements(diffs)-1, 1 DO BEGIN
        chk = min(abs(clmasses[zz] - fakexs), minind)
        diffs[zz] = clmetals[zz] - mzrys(minind)
     ENDFOR
     chk = where(diffs NE diffs, COMPLEMENT=keep)
     IF chk[0] NE -1 THEN diffs = diffs[keep]
     ksstuff.clstuff = ptr_new(diffs)
     pdf = histogram(diffs, BINSIZE=0.1, MIN=-0.5, LOCATIONS=xbin)
                                ;cdf = total(pdf, /CUMULATIVE) / n_elements(diffs)
     pdf = float(pdf) / float(n_elements(diffs))

     myplot2 = plot(xbin, pdf, COLOR=clcolor, $
                    FILL_BACKGROUND=1, FILL_COLOR=clcolor, FILL_TRANSPARENCY=60, /STAIRSTEP, $
                    TITLE='CLTHREE Metallicity Differences (All Masses)', $
                    XTITLE='$\Delta$ 12 + log(O/H)', $
                    YTITLE='Normalized Frequency', $
                    /CURRENT)
     
     IF (group[0] NE -1) THEN BEGIN ;if group membership exists
        groupmasses = [mass[group], mass[groupul]]
        groupmetals = [metals[group], metals[groupul]]
        diffs = groupmetals
        diffs[*] = 0
        FOR zz=0, n_elements(diffs)-1, 1 DO BEGIN
           chk = min(abs(groupmasses[zz] - fakexs), minind)
           diffs[zz] = groupmetals[zz] - mzrys(minind)
        ENDFOR
        chk = where(diffs NE diffs, COMPLEMENT=keep)
        IF chk[0] NE -1 THEN diffs = diffs[keep]
        ksstuff.grstuff = ptr_new(diffs)
        pdf = histogram(diffs, BINSIZE=0.1, MIN=-0.5, LOCATIONS=xbin)
        pdf = float(pdf) / float(n_elements(diffs))
        myplot2 = plot(xbin, pdf, COLOR=grcolor, $
                       FILL_BACKGROUND=1, FILL_COLOR=grcolor, FILL_TRANSPARENCY=60, /STAIRSTEP, $
                       /CURRENT, /OVERPLOT)
     ENDIF                      ;if group exists


     IF (field[0] NE -1) THEN BEGIN ;if field membership exists
        fieldmasses = [mass[field], mass[fieldul]]
        fieldmetals = [metals[field], metals[fieldul]]
        diffs = fieldmetals
        diffs[*] = 0
        FOR zz=0, n_elements(diffs)-1, 1 DO BEGIN
           chk = min(abs(fieldmasses[zz] - fakexs), minind)
           diffs[zz] = fieldmetals[zz] - mzrys(minind)
        ENDFOR
        chk = where(diffs NE diffs, COMPLEMENT=keep)
        ksstuff.fistuff = ptr_new(diffs)
        IF chk[0] NE -1 THEN diffs = diffs[keep]
        pdf = histogram(diffs, BINSIZE=0.1, MIN=-0.5, LOCATIONS=xbin)
        pdf = float(pdf) / float(n_elements(diffs))
        myplot2 = plot(xbin, pdf, COLOR=fieldcolor, $
                       FILL_BACKGROUND=1, FILL_COLOR=ficolor, FILL_TRANSPARENCY=60, /STAIRSTEP, $
                       /CURRENT, /OVERPLOT)
     ENDIF                      ;if field exist
     returning = ksstuff
     IF keyword_set(DOUTFILE) THEN myplot2.save, doutfile, RESOLUTION=600 ;save plot

  ENDIF ELSE returning = ptr_new({thing:-99})

  RETURN, returning
  
END
;========================================================================================================================



;========================================================================================================================
PRO CALL_PLOT_MZR

  file = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/CDFS44_pz_specz_full_v3-0.fits'
  data = mrdfits(file, 1, hdr)
  chk = where(data.qflag_mosfire NE -1)
  data = data[chk]
  
  metallicity = 'N2'
  dmass = 1
  demetallicity = 1
  

  chk = plot_mzr(data.lmass, metallicity, HAFLUX=data.ha_flux, NIIFLUX=data.niir_flux, $
                 CLMEM=data.clmem, QUALITY=data.qflag_mosfire) 



END
;========================================================================================================================
