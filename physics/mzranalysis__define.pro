;+
; NAME:
;       mzranalysis()
;
; PURPOSE:
;           
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
;
;-

;====================================================================================================
PRO mzranalysis::getprop, D15AOBJVER=d15aobjver, CURCAT=curcat, DIRCURCAT=dircurcat

  IF arg_present(D15AOBJVER) THEN d15aobjver = self.d15aobjver ;return the data
  IF arg_present(CURCAT) THEN curcat = self.curcat             ;return the data
  IF arg_present(DIRCURCAT) THEN dircurcat = self.dircurcat    ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mzranalysis::workingon, dirsort, sortcat, compcat, compsumcat, bootcat, bootsumcat

  pass = 1                      ;flag

  ;;;determine which permutation of data and analysis
  
  CASE self.working OF          ;what value of input
     

     'onezero' : BEGIN          ;last permuation we worked on
        cls = 'clfour'          ;how many clusters
        sm = 'smcurrent'        ;which stacking method
        sp = 'all'              ;which sample
        qu = 'highq'            ;which quality
        binby = ''              ;which quality
        ver = '1-0'             ;which version
        self.group = 'all'      ;name of group
     END                        ;end last permutation
     'oneone' : BEGIN           ;last permuation we worked on
        cls = 'clfour'          ;how many clusters
        sm = 'smcurrent'        ;which stacking method
        sp = 'envtwo'           ;which sample
        qu = 'highq'            ;which quality
        binby = 'cluster'       ;which quality
        ver = '1-0'             ;which version
        self.group = 'envtwo'   ;name of group
     END                        ;end last permutation
     'onetwo' : BEGIN           ;last permuation we worked on
        cls = 'clfour'          ;how many clusters
        sm = 'smcurrent'        ;which stacking method
        sp = 'envtwo'           ;which sample
        qu = 'highq'            ;which quality
        binby = 'field'         ;which quality
        ver = '1-0'             ;which version
        self.group = 'envtwo'   ;name of group
     END                        ;end last permutation
     


     'one' : BEGIN              ;last permuation we worked on
        cls = 'clthree'         ;how many clusters
        sm = 'smcurrent'        ;which stacking method
        sp = 'all'              ;which sample
        qu = 'highq'            ;which quality
        binby = ''              ;which quality
        ver = '1-0'             ;which version
        self.group = 'all'      ;name of group
     END                        ;end last permutation

     'two' : BEGIN              ;last permuation we worked on
        cls = 'clthree'         ;how many clusters
        sm = 'smcurrent'        ;which stacking method
        sp = 'all'              ;which sample
        qu = 'medq'             ;which quality
        binby = ''              ;which quality
        ver = '1-0'             ;which version
        self.group = 'allplus'  ;name of group
     END                        ;end last permutation

     'three' : BEGIN               ;last permuation we worked on
        cls = 'clthree'            ;how many clusters
        sm = 'smcurrent'           ;which stacking method
        sp = 'all'                 ;which sample
        qu = 'lowq'                ;which quality
        binby = ''                 ;which quality
        ver = '1-0'                ;which version
        self.group = 'allplusplus' ;name of group
     END                           ;end last permutation

     'four' : BEGIN             ;permuation we worked on
        cls = 'clthree'         ;how many clusters
        sm = 'smcurrent'        ;which stacking method
        sp = 'envtwo'           ;which sample
        qu = 'highq'            ;which quality
        binby = 'binfield'      ;which quality
        ver = '1-0'             ;which version
        self.group = 'envtwo'   ;name of group
     END                        ;end last permutation
     
     'five' : BEGIN             ;permuation we worked on
        cls = 'clthree'         ;how many clusters
        sm = 'smcurrent'        ;which stacking method
        sp = 'envtwo'           ;which sample
        qu = 'highq'            ;which quality
        binby = 'bincl'         ;which quality
        ver = '1-0'             ;which version
        self.group = 'envtwo'   ;name of group
     END                        ;end last permutation
     
     'six' : BEGIN              ;permuation we worked on
        cls = 'clthree'         ;how many clusters
        sm = 'smcurrent'        ;which stacking method
        sp = 'envtwo'           ;which sample
        qu = 'medq'             ;which quality
        binby = 'binfield'      ;which quality
        ver = '1-0'             ;which version
        self.group = 'envtwo'   ;name of group
     END                        ;end last permutation
     
     'seven' : BEGIN              ;permuation we worked on
        cls = 'clthree'           ;how many clusters
        sm = 'smcurrent'          ;which stacking method
        sp = 'envtwo'             ;which sample
        qu = 'medq'               ;which quality
        binby = 'bincl'           ;which quality
        ver = '1-0'               ;which version
        self.group = 'envtwo'     ;name of group
     END                          ;end last permutation
     
     'eight' : BEGIN              ;last permuation we worked on
        cls = 'clthree'           ;how many clusters
        sm = 'smcurrent'          ;which stacking method
        sp = 'envtwo'             ;which sample
        qu = 'lowq'               ;which quality
        binby = 'binfield'        ;which quality
        ver = '1-0'               ;which version
        self.group = 'envtwoplus' ;name of group
     END                          ;end last permutation

     'nine' : BEGIN               ;last permuation we worked on
        cls = 'clthree'           ;how many clusters
        sm = 'smcurrent'          ;which stacking method
        sp = 'envtwo'             ;which sample
        qu = 'lowq'               ;which quality
        binby = 'bincl'           ;which quality
        ver = '1-0'               ;which version
        self.group = 'envtwoplus' ;name of group
     END                          ;end last permutation    

     ELSE : BEGIN                               ;input choice not recognized
        print, 'WARNING!! Input not recognized' ;print info
        print, '  Choices are "last"'           ;print info
        pass = 0                                ;switch flag
     ENDELSE                                    ;end input not recognized
  ENDCASE                                       ;end what value of input

  self.dirsort = strcompress(dirsort + '/' + cls + '/' + sm + '/' + sp + '/' + qu + '/' + binby + '/', /REMOVE_ALL)
                                ;print, self.dirsort
  self.sortcat = strcompress(sortcat + '_' + cls + '_' + sm + '_' + sp + '_' + qu + '_v' + ver + '.fits', /REMOVE_ALL)
                                ;print, self.sortcat
  self.compcat = strcompress(compcat + '_' + cls + '_' + sm + '_' + sp + '_' + qu + '_v3-6-1.fits', /REMOVE_ALL)
                                ;print, self.sortcat
  self.compsumcat = strcompress(compsumcat + '_' + cls + '_' + sm + '_' + sp + '_' + qu + '_v3-6-1.fits', /REMOVE_ALL)
                                ;print, self.sortcat
  self.bootcat = strcompress(bootcat + '_' + cls + '_' + sm + '_' + sp + '_' + qu + '.fits', /REMOVE_ALL)
                                ;print, self.bootcat
  self.bootsumcat = strcompress(bootsumcat + '_' + cls + '_' + sm + '_' + sp + '_' + qu + '.fits', /REMOVE_ALL)
                                ;print, self.bootsumcat
  self.fnplspecstack = strcompress(cls + '_' + sm + '_' + sp + '_' + qu + self.fnplspecstack, /REMOVE_ALL)
                                ;print, self.fnplspecstack
  self.fnplmzrindiv = strcompress(cls + '_' + sm + '_' + sp + '_' + qu + self.fnplmzrindiv, /REMOVE_ALL)
                                ;print, self.fnplmzrindiv
  self.fnplmzrstack = strcompress(cls + '_' + sm + '_' + sp + '_' + qu + self.fnplmzrstack, /REMOVE_ALL)
                                ;print, self.fnplmzrstack
  self.fnmzrfit = strcompress(cls + '_' + sm + '_' + sp + '_' + qu + self.fnmzrfit, /REMOVE_ALL)
                                ;print, self.fnmzrfit

  RETURN, pass
END
;====================================================================================================



;====================================================================================================
PRO mzranalysis::readcat, file, INDIR=indir, FILEUNIT=fileunit


  IF keyword_set(INDIR) THEN indir = string(indir[0]) ELSE indir = self.dirsort ;set default
  IF keyword_set(FILEUNIT) THEN fileunit = fix(fileunit[0]) ELSE fileunit = 1   ;set default

  fullname = strcompress(indir + file, /REMOVE_ALL) ;full path to file
  data = mrdfits(fullname, fileunit, hdr)           ;read in file
  self.ncompdata =  n_elements(data.(0))            ;store info
  self.compdata = ptr_new(data)                     ;store info
  self.comphdr = ptr_new(hdr)                       ;store info
  IF keyword_set(HELP) THEN help, data, /STRUC      ;structure help
  
  RETURN
END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::readstack, STACKFILE=stackfile, INDIR=indir, FILEUNIT=fileunit


  IF keyword_set(STACKFILE) THEN BEGIN
     stackfile = string(stackfile[0]) ;set default
     self.compcat = stackfile         ;and reset the default
  ENDIF ELSE stackfile = self.compcat
  IF keyword_set(INDIR) THEN indir = string(indir[0]) ELSE indir = self.dirsort ;set default
  IF keyword_set(FILEUNIT) THEN fileunit = fix(fileunit[0]) ELSE fileunit = 1   ;set default


  print, indir
  print, stackfile
  fullname = strcompress(indir + stackfile, /REMOVE_ALL)                        ;full path to file
  data = mrdfits(fullname, fileunit, hdr)                                       ;read in file
  self.nstackdata =  n_elements(data.(0))                                       ;store info
  self.stackdata = ptr_new(data)                                                ;store info
  self.stackhdr = ptr_new(hdr)                                                  ;store info
  IF keyword_set(HELP) THEN help, data, /STRUC                                  ;structure help
  
  RETURN
END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::findtags


  xdata = *self.compdata        ;grab data
  ;help, xdata, /STRUC

  ;;;find the necessary tags
  tags = {tgra:['blurb','MRA', 'RA', 'RAJ2000'], $         ;possible tags
          tgdec:['blast','MDEC', 'DEC', 'DEJ2000'], $      ;possible tags
          tgmass:['ph_lmass'], $                           ;possible tags
                                ;tgemassi:['ph_l68_lmass'], $                     ;possible tags
                                ;tgemassa:['ph_u68_lmass'], $                     ;possible tags
          tgspz1:['SP_SPECZBEST','SP_M_Z'], $              ;possible tags
          tghaflux:['SP_M_HA_FLUX'], $                     ;possible tags
          tgniiflux:['SP_M_NIIR_FLUX'], $                  ;possible tags
          tgeniiflux:['SP_M_NIIR_FLUXERR'], $              ;possible tags
          tgniiflag:['SP_M_NIIR_FLAG'], $                  ;possible tags
          tgclmem:['AN_SHIGAP','AN_ADAPKER','AN_CLMEM'], $ ;possible tags
          tglab1:['SP_M_OBJ'], $                           ;possible tags
          tglab2:['SP_M_MASK'], $                          ;possible tags
          tgch1flux:['PH_IRAC1FLUX'], $                    ;possible tags
          tgch2flux:['PH_IRAC2FLUX'], $                    ;possible tags
          tgch3flux:['PH_IRAC3FLUX'], $                    ;possible tags
          tgch4flux:['PH_IRAC4FLUX'], $                    ;possible tags
          tgiragn:['AN_AGND12']}                           ;possible tags




  nametags = tag_names(tags)                               ;get key names
  selftags = tag_names(self)                               ;get key names

                                ;IF keyword_set(TGMFLAG) THEN self.tgmflag = string(tgmflag[0]) ELSE self.tgmflag = 'MFLAG'                    ;set default
                                ;IF keyword_set(TGAGN) THEN self.tgagn = string(tgagn[0]) ELSE self.tgagn = 'AN_AGND12'                        ;set default
                                ;IF keyword_set(TGELAGN) THEN self.tgelagn = string(tgelagn[0]) ELSE self.tgelagn = 'AN_AGNK06'                ;set default
                                ;IF keyword_set(TGCLMEM) THEN self.tgclmem = string(tgclmem[0]) ELSE self.                ;set default
                                ;IF keyword_set(TGSPZ1) THEN self.tgspz1 = string(tgspz1[0]) ELSE self.tgspz1 = 'SP_SPECZBEST'                 ;set default
                                ;IF keyword_set(TGSPZFLAG1) THEN self.tgspzflag1 = string(tgspzflag1[0]) ELSE self.tgspzflag1 = 'SP_SPECZFLAG' ;set default
                                ;IF keyword_set(TGSPZ2) THEN self.tgspz2 = string(tgspz2[0]) ELSE self.tgspz2 = 'SP_M_Z'                       ;set default
                                ;IF keyword_set(TGHAFLAG) THEN self.tghaflag = string(tghaflag[0]) ELSE self.tghaflag = 'SP_M_HA_FLAG'         ;set default
                                ;IF keyword_set(TGCH1FLUX) THEN self.tgch1flux = string(tgch1flux[0]) ELSE self.tgch1flux = 'ph_irac1flux'     ;set default
                                ;IF keyword_set(TGCH2FLUX) THEN self.tgch2flux = string(tgch2flux[0]) ELSE self.tgch2flux = 'ph_irac2flux'     ;set default
                                ;IF keyword_set(TGCH3FLUX) THEN self.tgch3flux = string(tgch3flux[0]) ELSE self.tgch3flux = 'ph_irac3flux'     ;set default
                                ;IF keyword_set(TGCH4FLUX) THEN self.tgch4flux = string(tgch4flux[0]) ELSE self.tgch4flux = 'ph_irac4flux'     ;set default
                                ;IF keyword_set(TGEMASSI) THEN self.tgemassi = string(tgemassi[0]) ELSE self.tgemassi = 'ph_lmass68'           ;set default
                                ;IF keyword_set(TGEMASSA) THEN self.tgemassa = string(tgemassa[0]) ELSE self.tgemassa = 'ph_umass68'           ;set default


  FOR xx=0, n_elements(nametags)-1, 1 DO BEGIN                      ;loop over tags to find
     cnt = -1                                                       ;start counter
     found = 0                                                      ;create flag
     WHILE (cnt LT n_elements(tags.(xx)) AND (found EQ 0)) DO BEGIN ;search down the list
        cnt = cnt + 1                                               ;up counter
        chk = tag_exist(xdata, tags.(xx)[cnt], INDEX=ind)           ;find necessary tag
        IF (ind NE -1) THEN found = 1                               ;flip flag 
     ENDWHILE                                                       ;end search down the list
     
     chk = where(nametags[xx] EQ selftags) ;find tag location in object structure
     IF (chk[0] NE -1) THEN BEGIN          ;if a match hits
        self.(chk) = tags.(xx)[cnt]        ;set tag string
        bit = nametags[xx]                 ;grab string
        strreplace, bit, 'TG', 'IND'       ;modify string
        chk = where(bit EQ selftags)       ;find tag location in object structure
        self.(chk) = ind                   ;set tag index
     ENDIF                                 ;end a match hits
  ENDFOR                                   ;end loop over tags to find

END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::findstacktags


  xdata = *self.stackdata       ;grab data

  ;;;find the necessary tags
  tags = {tgsnstck:['nstck'], $                                       ;possible tags                        
          tgsmass:['mass'], $                                         ;possible tags
          tgsemassi:['STCKMMIN'], $                                   ;possible tags
          tgsemassa:['STCKMMAX'], $                                   ;possible tags
          tgshaflux:['HA_FLUX', 'HAFLUX'], $                          ;possible tags
          tgsniiflux:['NIIR_FLUX', 'NIIFLUX'], $                      ;possible tags
          tgseniiflux:['NIIR_FLUXERR', 'NIIRFLUXERR', 'NIIREFLUX'], $ ;possible tags
          tgsninbin:['NSTCK'], $                                      ;possible tags
          tgsclmem:['CLUSTER','CLMEM']}                               ;possible tags
  nametags = tag_names(tags)                                          ;get key names
  selftags = tag_names(self)                                          ;get key names

  FOR xx=0, n_elements(nametags)-1, 1 DO BEGIN                      ;loop over tags to find
     cnt = -1                                                       ;start counter
     found = 0                                                      ;create flag
     WHILE (cnt LT n_elements(tags.(xx)) AND (found EQ 0)) DO BEGIN ;search down the list
        cnt = cnt + 1                                               ;up counter
        chk = tag_exist(xdata, tags.(xx)[cnt], INDEX=ind)           ;find necessary tag
        IF (ind NE -1) THEN found = 1                               ;flip flag 
     ENDWHILE                                                       ;end search down the list

     chk = where(nametags[xx] EQ selftags) ;find tag location in object structure
     IF (chk[0] NE -1) THEN BEGIN          ;if a match hits
        self.(chk) = tags.(xx)[cnt]        ;set tag string
        bit = nametags[xx]                 ;grab string
        strreplace, bit, 'TG', 'IND'       ;modify string
        chk = where(bit EQ selftags)       ;find tag location in object structure
        self.(chk) = ind                   ;set tag index
     ENDIF                                 ;end a match hits
  ENDFOR                                   ;end loop over tags to find

END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::plotmzrindiv, ALLTOG=alltog, NSIGULIM=nsigulim, DIFFPLOT=diffplot, $
                               FNPLMZRINDIV=fnplmzrindiv, FNDPLMZR=fndplmzr, LABEL=label
  


  xdata = *self.compdata                                                          ;grab data
  IF keyword_set(ALLTOG) THEN clmems = 0 ELSE clmems = xdata.(self.indclmem)      ;set default
  IF keyword_set(NSIGULIM) THEN nsigulim = float(nsigulim[0]) ELSE nsigulim = 2.0 ;set default

  ;;;set default values
  print, '  Individual point MZR plot...'                                                                        ;print info
  IF keyword_set(FNPLMZRINDIV) THEN fnplmzrindiv = string(fnplmzrindiv[0]) ELSE fnplmzrindiv = self.fnplmzrindiv ;set default value
  fnplmzrindiv = strcompress(self.dirsort + fnplmzrindiv, /REMOVE_ALL)                                           ;add directory

  IF (self.indniiflag NE -1) THEN ulims = where(xdata.(self.indniiflag) GE self.niiflagul)               ;find upper limit points
  IF ulims[0] NE -1 THEN xdata[ulims].(self.indniiflux) = $                                              ;cont next line
     xdata[ulims].(self.indniiflux) + nsigulim*xdata[ulims].(self.indniiflux)                            ;bump up value
  IF keyword_set(LABEL) THEN BEGIN                                                                       ;if label is desired
     IF (self.indlab1 NE -1) THEN label = xdata.(self.indlab1)                                           ;start label
     IF (self.indlab2 NE -1) THEN label = strcompress(xdata.(self.indlab2) + ':' + xdata.(self.indlab1)) ;start label
  ENDIF                                                                                                  ;end label desired

  chk = plot_mzr(xdata.(self.indmass), 'N2', N2RULE='PP04', HAFLUX=xdata.(self.indhaflux), $ ;cont next line
                 NIIFLUX=xdata.(self.indniiflux), $                                          ;cont next line
                 CLMEM=clmems, $                                                             ;cont next line
                 TITLE = 'MZR - KEMCLASS', $                                                 ;cont next line
                 ULIMS=ulims, LABEL=label, OUTFILE=fnplmzrindiv, DOUTFILE=fndmzrplot, $      ;cont next line
                 SHOWST14TR=0, SHOWST14PT=1, SHOWSA14PT=1, $                                 ;cont next line
                 SHOWERB06PTS=1, SHOWERB06TREND=0, SHOWTR04=1, $                             ;cont next line
                 DIFFPLOT=diffplot, SATURATE=1)                                              ;plot mzr
  
                                ;IF (chk[0].(0) NE -99) THEN BEGIN
                                ;kstwo, *chk.clstuff, *chk.fistuff, D, prob    ;2D KS test
                                ;print, D, prob                                ;print info
                                ;kstwo, *chk.clstuff, *chk.grstuff, D, prob    ;2D KS test
                                ;print, D, prob                                ;print info
                                ;kstwo, *chk.grstuff, *chk.fistuff, D, prob    ;2D KS test
                                ;print, D, prob                                ;print info
                                ;ENDIF

  self.mzrmade = 1              ;set as plot made this call
  self.nwin = self.nwin + 1     ;up window number

END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::plotbpt, NOIRAGN=noiragn, $
                          TGHAFLUX=tghaflux, TGNIIFLUX=gniiflux, TGIRAGN=tgiragn, $
                          TGHAFLAG=tghaflag, TGNIIFLAG=tgniiflag, $
                          FNBPTPLOT=fnbptplot

  
  xdata = *self.compdata        ;grab data

  ;;;set default values
  print, '  BPT plot being created...'                  ;print info 
  IF ~keyword_set(NOIRAGN) THEN BEGIN                   ;if IR AGN
     chk = tag_exist(xdata, tgagn, INDEX=iragnind)      ;find necessary tag
     text = '   This plot options a IRAC AGN keyword: ' ;text to pass
     IF chk EQ 0 THEN iragnind = tagprompt(xdata, text) ;find necessary tag
  ENDIF                                                 ;end IR AGN
  
  ;;;upper limits
  niiul = where((xdata.(self.indniiflag) GE self.niiflagul), COMPLEMENT=niisnr) ;appropriate flag test
  

  ;;;find plausible metallicity measurements
  N2 = xdata.(self.indniiflux)                                                                                           ;create array
  N2[niiul] = alog10((xdata[niiul].(self.indniiflux)+0.1*xdata[niiul].(self.indeniiflux))/xdata[niiul].(self.indhaflux)) ;find ratio
  N2[niisnr] = alog10((xdata[niisnr].(self.indniiflux))/xdata[niisnr].(self.indhaflux))                                  ;find ratio
  N2chk = where((N2 NE N2) OR (N2 NE 0.0))                                                                               ;find any NaNs or zeros
                                ;IF chk[0] NE -1 THEN N2 = N2[N2chk]                         ;if present, remove
  N2 = N2[N2chk]                ;if present, remove

  ;;;separate by region on BPT
  N2agnul = where(N2 GT 0.2 AND (xdata.(self.indniiflag) GE self.niiflagul))
  N2compul = where((N2 GT -0.2) AND (N2 LT 0.2) AND (xdata.(self.indniiflag) GE self.niiflagul))
  N2sful = where((N2 LT -0.2) AND (xdata.(self.indniiflag) GE self.niiflagul))
  N2agndd = where(N2 GT 0.2 AND (xdata.(self.indniiflag) LT self.niiflagul))
  N2compdd = where((N2 GT -0.2) AND (N2 LT 0.2) AND (xdata.(self.indniiflag) LT self.niiflagul))
  N2sfdd = where((N2 LT -0.2) AND (xdata.(self.indniiflag) LT self.niiflagul))
  

  fakeys = fltarr(n_elements(N2))   ;create array for fake y values
  fakeysul = fltarr(n_elements(N2)) ;create array for fake y values
  fakeys[*] = -0.92                 ;set fake y values
  fakeysul[*] = -0.80               ;set fake y values

  

  ;;;find which detections are also IR AGN selected
  IF ~keyword_set(NOIRAGN) THEN BEGIN               ;cont next line
     IF (iragnind NE -1) THEN BEGIN                 ;if index is real
        iragn = where(xdata[N2chk].(iragnind) EQ 1) ;find IRAC AGN
     ENDIF
  ENDIF
  
  ;;;get models
  model = kewley_2013(1, 1.5)   ;get [NII] related models
  model2 = kewley_2006(1)       ;get [NII] SF related models
  model3 = kewley_2006(2)       ;get [NII] composite related models

  ;;;make the plot
  w = window(LOCATION=[100+50*self.nwin,-25+25*self.nwin])         ;window
  bptplot = plot([1.0], [1.0], '.', /CURRENT, /NODATA, $           ;plot data
                 XTITLE='log([NII/H$\alpha$])', $                  ;plot options
                 XRANGE=[self.bptxmin,self.bptxmax], $             ;plot options
                 YTITLE='log([OIII/H$\beta$])', $                  ;plot options
                 YRANGE=[self.bptymin,self.bptymax], $             ;plot options
                 FONT_SIZE=14, FONT_STYLE=0)                       ;plot options

  bptplot1 = plot(model.lmixxs, model.lmixys, '-', /OVERPLOT, $            ;plot model
                  THICK=2, color='green')                                  ;plot options
  bptplot1 = plot(model.umixxs, model.umixys, '-', /OVERPLOT, $            ;plot model
                  THICK=2, color='green')                                  ;plot options
  bptplot1 = plot(model.lsfxs, model.lsfys, '-', /OVERPLOT, $              ;plot model
                  THICK=2, color='green')                                  ;plot options
  bptplot1 = plot(model.usfxs, model.usfys, '-', /OVERPLOT, $              ;plot model
                  THICK=2, color='green', NAME='Kewley 2013 Scenario 1')   ;plot model
  bptplot2 = plot(model2.xs, model2.ys, '--', /OVERPLOT, $                 ;plot options
                  THICK=2, color='black', NAME='Kewley 2006 Star Forming') ;plot model
  bptplot3 = plot(model3.xs, model3.ys, '-', /OVERPLOT, $                  ;plot options
                  THICK=2, color='black', NAME='Kewley 2006 Composite')    ;plot model

  IF (N2agnul[0] NE -1) THEN mydata = plot(N2[N2agnul], fakeysul[N2agnul], 'r<', $                           ;plot options
                                           /OVERPLOT, SYM_SIZE=2.0, SYM_THICK=2.0, SYM_FILLED=0, $           ;plot options
                                           NAME='  Up lim; AGN')                                             ;plot upper limits
  target2 = [mydata]                                                                                         ;
  IF (N2compul[0] NE -1) THEN mydata = plot(N2[N2compul], fakeysul[N2compul], '<', /OVERPLOT, $              ;plot options
                                            SYM_COLOR='orange', SYM_THICK=2.0, SYM_SIZE=2.0, SYM_FILLED=0, $ ;plot options
                                            NAME='  Up lim; composite')                                      ;plot upper limits
  target2 = [target2, mydata]                                                                                ;
  IF (N2sful[0] NE -1) THEN mydata = plot(N2[N2sful], fakeysul[N2sful], 'g<', $                              ;plot options
                                          /OVERPLOT, SYM_SIZE=2.0, SYM_THICK=2.0, SYM_FILLED=0, $            ;plot options
                                          NAME='  Up lim; Star forming')                                     ;plot upper limits
  target2 = [target2, mydata]                                                                                ;
  IF (N2agndd[0] NE -1) THEN mydata = plot(N2[N2agndd], fakeys[N2agndd], 'r|', $                             ;plot options
                                           /OVERPLOT, SYM_SIZE=2.0, SYM_THICK=2.0, SYM_FILLED=0, $           ;plot options
                                           NAME='  Direct; AGN')                                             ;plot upper limits
  target2 = [target2, mydata]                                                                                ;
  IF (N2compdd[0] NE -1) THEN mydata = plot(N2[N2compdd], fakeys[N2compdd], '|', /OVERPLOT, $                ;plot options
                                            SYM_COLOR='orange', SYM_THICK=2.0, SYM_SIZE=2.0, SYM_FILLED=0, $ ;plot options
                                            NAME='  Direct; composite')                                      ;plot upper limits
  target2 = [target2, mydata]                                                                                ;
  IF (N2sfdd[0] NE -1) THEN mydata = plot(N2[N2sfdd], fakeys[N2sfdd], 'g|', $                                ;plot options
                                          /OVERPLOT, SYM_SIZE=2.0, SYM_THICK=2.0, SYM_FILLED=0, $            ;plot options
                                          NAME='  Direct; Star forming')                                     ;plot upper limits
  target2 = [target2, mydata]                                                                                ;
  
  IF ~keyword_set(NOIRAGN) THEN $                                                        ;cont next line
     IF (iragn[0] NE -1) THEN mydata = plot(N2[iragn], fakeys[iragn], 'tl', /OVERPLOT, $ ;over plot IR AGN
                                            SYM_SIZE=7, SYM_THICK=3, COLOR='green')      ;plot options

  mylegend = legend(TARGET=[bptplot1, bptplot2, bptplot3], $               ;legend
                    POSITION=[self.bptxmax-1.4,self.bptymax-0.1], /DATA, $ ;legend options
                    SHADOW=0, LINESTYLE=6, FONT_SIZE=10)                   ;legend options
  mylegend = legend(TARGET=target2, $                                      ;legend
                    POSITION=[self.bptxmin+0.1,self.bptymax-1.2], /DATA, $ ;legend options
                    SHADOW=0, LINESTYLE=6, FONT_SIZE=10, SAMPLE_WIDTH=0.1) ;legend options

  
  ;bptplot.save, fnbptplot, RESOLUTION=600 ;save plot
  ;self.bptmade = 1                        ;set as plot made this call
  ;self.nwin = self.nwin + 1               ;up window number


END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::plotiragn, FNIRAGNPLOT=fniragnplot


  ;;;set default values
  print, '  IRAC AGN diagnostic plot...'       ;print info
  IF keyword_set(FNIRAGNPLOT) THEN BEGIN       ;if new plot name given
     fniragnplot = string(fniragnplot[0])      ;take new name
     self.fniragnplot = string(fniragnplot[0]) ;store new name
  ENDIF ELSE fniragnplot = self.fniragnplot    ;set default value


  ;;;read catalog and fine appropriate data
                                ;self.readcat                  ;read in file
                                ;self.sample                   ;get sample
  xdata = *self.compdata        ;grab data
                                ;xdata = xdata[*self.sample]   ;grab subset
  ;help, xdata
  ;chk = tag_exist(xdata, self.tgch1flux, INDEX=ch1find)    ;find necessary tag
  ;text = '   This plot requires a IRAC CH1 flux keyword: ' ;text to pass
  ;IF chk EQ 0 THEN ch1find = tagprompt(xdata, text)        ;find necessary tag
  ;chk = tag_exist(xdata, self.tgch2flux, INDEX=ch2find)    ;find necessary tag
  ;text = '   This plot requires a IRAC CH2 flux keyword: ' ;text to pass
  ;IF chk EQ 0 THEN ch2find = tagprompt(xdata, text)        ;find necessary tag
  ;chk = tag_exist(xdata, self.tgch3flux, INDEX=ch3find)    ;find necessary tag
  ;text = '   This plot requires a IRAC CH3 flux keyword: ' ;text to pass
  ;IF chk EQ 0 THEN ch3find = tagprompt(xdata, text)        ;find necessary tag
  ;chk = tag_exist(xdata, self.tgch4flux, INDEX=ch4find)    ;find necessary tag
  ;text = '   This plot requires a IRAC CH4 flux keyword: ' ;text to pass
  ;IF chk EQ 0 THEN ch4find = tagprompt(xdata, text)        ;find necessary tag

  print, self.indch1flux
  print, self.indch2flux
  print, self.indch3flux
  print, self.indch4flux

  ;chk = tag_exist(xdata, self.tgagn, INDEX=agnind)                       ;find necessary tag
  ;text = '   This plot options a IR AGN diagnostic keyword: '            ;text to pass
  ;IF chk EQ 0 THEN agnind = tagprompt(xdata, text)                       ;find necessary tag
  ;chk = tag_exist(xdata, self.tgelagn, INDEX=elagnind)                   ;find necessary tag
  ;text = '   This plot options a emission line AGN diagnostic keyword: ' ;text to pass
  ;IF chk EQ 0 THEN elagnind = tagprompt(xdata, text)                     ;find necessary tag
  ;chk = tag_exist(xdata, 'SP_SPECZBEST', INDEX=spzfind)                  ;find necessary tag
  ;text = '   This plot options a redshift keyword: '                     ;text to pass
  ;IF chk EQ 0 THEN spzfind = tagprompt(xdata, text)                      ;find necessary tag
  ;chk = tag_exist(xdata, 'SP_SPECZFLAG', INDEX=qspzind)                  ;find necessary tag
  ;text = '   This plot options a spec-z quality keyword: '               ;text to pass
  ;IF chk EQ 0 THEN qspzind = tagprompt(xdata, text)                      ;find necessary tag  
  ;chk = tag_exist(xdata, self.tgclmem, INDEX=clmemind)                   ;find necessary tag
  ;text = '   This plot options a cluster member keyword: '               ;text to pass
  ;IF chk EQ 0 THEN clmemind = tagprompt(xdata, text)                     ;find necessary tag

  print, self.indiragn

  ;;;create flag arrays for subset
  clyes = intarr(n_elements(xdata.(0)))  ;create array
  fiyes = intarr(n_elements(xdata.(0)))  ;create array
  hqyes = intarr(n_elements(xdata.(0)))  ;create array
  mqyes = intarr(n_elements(xdata.(0)))  ;create array
  lqyes = intarr(n_elements(xdata.(0)))  ;create array
  agnyes = intarr(n_elements(xdata.(0))) ;create array


  ;;;find subsets and fill subset arrarys
  IF (self.indspz1 NE 0) THEN BEGIN                                                                     ;
     specz = where((xdata.(self.indspz1) GE 0.0) AND (xdata.(self.indspz1) LE 5.0), COMPLEMENT=nospecz) ;has real redshift
     cl = where(xdata.(self.indclmem) EQ 1, COMPLEMENT=field)                                           ;has cluster redshift
     IF cl[0] NE -1 THEN clyes[specz[cl]] = 1                                                           ;
     IF field[0] NE -1 THEN fiyes[specz[field]] = 1                                                     ; 
  ENDIF

  help, specz
  help, nospecz
  help, cl
  help, field

  ;IF (qspzind NE -1) THEN BEGIN
  ;   chk = where((xdata.(qspzind) EQ 0) OR (xdata.(qspzind) EQ 1)) ;good quality 
  ;   IF (chk[0] NE -1) THEN hqyes[chk] = 1                         ;flag it
  ;   chk = where((xdata.(qspzind) EQ 2))                           ;good quality 
  ;   IF (chk[0] NE -1) THEN mqyes[chk] = 1                         ;flag it
  ;   chk = where((xdata.(qspzind) EQ 3))                           ;good quality 
  ;   IF (chk[0] NE -1) THEN lqyes[chk] = 1                         ;flag it
  ;ENDIF 

  ;agnyes = where(xdata.(agnind) EQ 1)     ;find agn
                                ;elagnyes = where(xdata.(elagnind) EQ 2) ;find agn
  
  ;;;find plausible flux ratio measurements
  xs = alog10(xdata.(self.indch3flux)/xdata.(self.indch1flux)) ;find ratio
  xschk = where((xs NE xs))                                    ;find any NaNs
  IF (xschk[0] NE -1) THEN xs[xschk] = -99.0                   ;if present, remove
  ys = alog10(xdata.(self.indch4flux)/xdata.(self.indch2flux)) ;find ratio
  yschk = where((ys NE ys))                                    ;find any NaNs
  IF (yschk[0] NE -1) THEN ys[xschk] = -99.0                   ;if present, remove


  ;;;plot it all
  model1 = donley_2012(1)                                                ;get region populated by AGNs
  w = window(LOCATION=[100+50*self.nwin,-25+25*self.nwin])               ;window
  iragnplot = plot([1.0], [1.0], '.', /CURRENT, /NODATA, $               ;plot data
                   XTITLE='log($f_{5.8 \mu m}/f_{3.6 \mu m}$)', $        ;plot options
                   XRANGE=[self.iragnxmin,self.iragnxmax], $             ;plot options
                   YTITLE='log($f_{8.0 \mu m}/f_{4.5 \mu m}$)', $        ;plot options
                   YRANGE=[self.iragnymin,self.iragnymax], FONT_SIZE=16) ;plot options
  limit1 = plot(model1.xs, model1.ys, '-', /OVERPLOT, THICK=2)           ;plot model
  IF (self.indspz1 NE -1) THEN BEGIN
     nozpoints = plot(xs[nospecz], ys[nospecz], 'o', /OVERPLOT, $
                      COLOR='gray', /SYM_FILLED, SYM_SIZE=0.3) 
     IF (qspzind NE -1) THEN BEGIN
        fihq = where((fiyes EQ 1) AND (hqyes EQ 1))
        IF (fihq[0] NE -1) THEN prsfullfov = plot(xs[fihq], ys[fihq], /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'blue', /SYM_FILLED, SYM_SIZE=1.5)
        fimq = where((fiyes EQ 1) AND (mqyes EQ 1))
        IF (fimq[0] NE -1) THEN prsfullfov = plot(xs[fimq], ys[fimq], /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'blue', /SYM_FILLED, SYM_SIZE=1.25)
        filq = where((fiyes EQ 1) AND (lqyes EQ 1))
        IF (filq[0] NE -1) THEN prsfullfov = plot(xs[filq], ys[filq], /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'blue', /SYM_FILLED, SYM_SIZE=1.0)
        clhq = where((clyes EQ 1) AND (hqyes EQ 1))
        IF (clhq[0] NE -1) THEN prsfullfov = plot([xs[clhq]], [ys[clhq]], /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'red', /SYM_FILLED, SYM_SIZE=1.5)
        clmq = where((clyes EQ 1) AND (mqyes EQ 1))
        IF (clmq[0] NE -1) THEN prsfullfov = plot([xs[clmq]], [ys[clmq]], /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'red', /SYM_FILLED, SYM_SIZE=1.25)
        cllq = where((clyes EQ 1) AND (lqyes EQ 1))
        IF (cllq[0] NE -1) THEN prsfullfov = plot([xs[cllq]], [ys[cllq]], /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'red', /SYM_FILLED, SYM_SIZE=1.0)
     ENDIF ELSE BEGIN
        
        fimem = where(fiyes EQ 1)
        zpoints = plot(xs[fimem], ys[fimem], 'o', /OVERPLOT, $
                       COLOR='blue', /SYM_FILLED, SYM_SIZE=1.0) 
        clmem = where(clyes EQ 1)
        zpoints = plot(xs[clmem], ys[clmem], 'o', /OVERPLOT, $
                       COLOR='red', /SYM_FILLED, SYM_SIZE=1.0) 
     ENDELSE
  ENDIF ELSE points = plot(xs, ys, 'o', /OVERPLOT, /SYM_FILLED, SYM_SIZE=0.60)

  IF (agnind NE -1) THEN BEGIN
     agn = plot(xs[agnyes], ys[agnyes], 'td', /OVERPLOT, COLOR = 'green', /SYM_FILLED, SYM_SIZE=1.25)
  ENDIF
  IF (elagnind NE -1) AND (elagnyes[0] NE -1) THEN BEGIN
     agn = plot(xs[elagnyes], ys[elagnyes], 'tu', /OVERPLOT, COLOR = 'green', /SYM_FILLED, SYM_SIZE=1.25)
  ENDIF

  iragnplot.save, fniragnplot, RESOLUTION=600 ;save plot
  self.iragnmade = 1                          ;set as plot made this call
  self.nwin = self.nwin + 1                   ;up window number

END
;====================================================================================================


;====================================================================================================
FUNCTION mzranalysis::mcmass, howmany, WHICH=which, DMASSFILE=dmassfile

  IF keyword_set(WHICH) THEN which = fix(which[0]) ELSE which = 2

  ;;;get the data and sort out what we have
  xdata = *self.compdata        ;grab data

  masses = xdata.(self.indmass)                           ;get masses
  IF mean(xdata.(self.indemassi)) GT 4.0 THEN BEGIN       ;not actual mass errors
     emassi = masses - xdata.(self.indemassi)             ;get real errors
  ENDIF ELSE emassi = xdata.(self.indemassi)              ;actual mass errors
  chk = where(emassi EQ 0.0 OR emassi NE emassi)          ;if nonsensical errors
  IF chk[0] NE -1 THEN emassi[chk] = 0.05                 ;set to default error
  IF mean(xdata.(self.indemassa)) GT 4.0 THEN BEGIN       ;actual mass errors
     emassa = xdata.(self.indemassa) - masses             ;actual mass errors
  ENDIF ELSE emassa = xdata.(self.indemassa)              ;actual mass errors
  chk = where(emassa EQ 0.0 OR emassa NE emassa)          ;if nonsensical errors
  IF chk[0] NE -1 THEN emassa[chk] = 0.05                 ;set to default error
  nmasses = n_elements(masses)
  allmasses = fltarr(howmany,nmasses)
  seed = 12345


  CASE which OF
     1: BEGIN      
        randoms = uniformran(howmany, nmasses)
        FOR xx=0, nmasses-1, 1 DO BEGIN
           gausscdf, emassi[xx], lowcdf, lowdiffs
           gausscdf, emassa[xx], hicdf, hidiffs

           splitlo = where(randoms[*,xx] LE 0.5, nsplitlo, COMPLEMENT=splithi, NCOMPLEMENT=nsplithi)
           FOR yy=0, nsplitlo-1, 1 DO BEGIN
              min = min(abs(lowcdf - randoms[splitlo[yy],xx]), minind)
              allmasses[splitlo[yy],xx] = masses[xx] + lowdiffs[minind]
           ENDFOR
           FOR yy=0, nsplithi-1, 1 DO BEGIN
              min = min(abs(hicdf - randoms[splithi[yy],xx]), minind)
              allmasses[splithi[yy],xx] = masses[xx] + hidiffs[minind]
           ENDFOR
        ENDFOR
     END

     2 : BEGIN
        IF keyword_set(DMASSFILE) THEN dmassfile = string(dmassfile[0]) ELSE dmassfile = 'stellarmass_errorpdfs_v1-0.fits'
        dmassdata = mrdfits(dmassfile, 1, hdr)
                                ;help, dmassdata, /STRUC
                                ;help, masses
                                ;print, masses

        ;;;the random draws
        unidevs = uniformran(nmasses, howmany, SEED=seed)
        help, unidevs
        FOR ii=0, nmasses-1, 1 DO BEGIN
                                ;print, masses[ii]
           thisdmass = abs(masses[ii]-dmassdata.(0))
                                ;print, thisdmass
           thisdmass = min(abs(masses[ii]-dmassdata.(0)), minind)
                                ;print, thisdmass, minind
                                ;print, ''
                                ;print, dmassdata[minind]         
           FOR jj=0, howmany-1, 1 DO BEGIN
                                ;print, unidevs[ii,jj]
              thispertur = min(abs(unidevs[ii,jj]-dmassdata[minind].dmasscdf), perturind)
                                ;print, thispertur, perturind, dmassdata[minind].dmass[perturind]
              allmasses[jj,ii] = masses[ii] + dmassdata[minind].dmass[perturind]
           ENDFOR
                                ;print, masses[ii], allmasses[*,ii]
                                ;stop
        ENDFOR
                                ; stop
     END

     ELSE : BEGIN
     ENDELSE
  ENDCASE
                                ;print, allmasses

                                ;stop
  RETURN, transpose(allmasses)
END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::storenew, MASSES=masses

  xdata = *self.compdata        ;grab data

  IF keyword_set(MASSES) THEN xdata.(self.indmass) = masses ;set in new values

 
END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::makebins, BINSET=binset, NINBIN=ninbin


  xdata = *self.compdata        ;grab data
  
  CASE binset OF                                         ;what is bin set
     'all' : chk = indgen(n_elements(xdata.(0)))         ;subset to bin by
     'field' : chk = where(xdata.(self.indclmem) EQ 0)   ;subset to bin by
     'cluster' : chk = where(xdata.(self.indclmem) EQ 1) ;subset to bin by
     'group' : chk = where(xdata.(self.indclmem) EQ 2)   ;subset to bin by
     ELSE: BEGIN                                         ;no match
        print, 'WARNING!! binset no understood!!'        ;print info
     ENDELSE                                             ;end no match
  ENDCASE                                                ;end what is bin set
  IF (chk[0] NE -1) THEN data = xdata[chk]               ;grab subset
  masses = data.(self.indmass)                           ;grab masses
  
  bins = equalbins(masses, /INCENDS, NINBIN=ninbin) ;get bin size
  self.massbins = ptr_new(bins)                     ;store data

END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::specsort, GROUP=group

  COMPILE_OPT idl2

  IF keyword_set(GROUP) THEN group = strlowcase(string(group[0])) ELSE group = self.group ;set default
  
  xdata = *self.compdata                                                                                  ;grab data
  massbins = *self.massbins                                                                               ;grab data  
  ;print, massbins
  zbins = [1.2,1.8]                                                                                       ;sanity 
  passing = [self.tglab1, self.tglab2, self.tghaflux, self.tgniiflux]                                     ;structure tag info to put in output
  CASE group OF                                                                                           ;which group are we working with ;
     'all' : densebins = [-0.5, 3.5]                                                                      ;need this ;
     'allplus' : densebins = [-0.5, 3.5]                                                                  ;need this ;
     'allplusplus': densebins = [-0.5, 3.5]                                                               ;need this ;
     'envtwo' : densebins = [-0.5, 0.5, 1.5]                                                              ;need this ;
     'envtwoplus' : densebins = [-0.5, 0.5, 1.5]                                                          ;need this ;
     'envtwoplusplus' :densebins = [-0.5, 0.5, 1.5]                                                       ;need this ;
     ELSE : BEGIN                                                                                         ;group choice not valid ;
        print, 'WARNING!! GROUP keyword value not valid'                                                  ;print info ;
        print, '  Choices are: "all", "allplus", "allplusplus", "envtwo", "envtwoplus", "envtwoplusplus"' ;print info ;
     ENDELSE                                                                                              ;end group choice not valid ;
  ENDCASE                                                                                                 ;end which group ;

  
  ;;;now make the source
  mysort = obj_new('sortdata', xdata, self.tgspz1, zbins, $   ;call the sort data object
                   NAME2=self.tgmass, BINS2=massbins, $       ;object input
                   NAME3=self.tgclmem, BINS3=densebins, $     ;object input
                   TOPASS=passing, DITCHFIRST=1)              ;object input
  mysort.getprop, SRDOBJVER=myver, BINNAMES=mybins            ;verify its working
  passchk = mysort.chknames()                                 ;
  passchk = mysort.chkbins(MIN2=7.0)                          ;
  passchk = mysort.chkorder()                                 ;
  mysort.prepouts, FILL2=massbins[0], FILL3=densebins[0]      ;
  mysort.fillouts, DIRECTORY=self.tglab2                      ;
  print, self.sortcat
  
  mysort.writeouts, OUTFILE=self.sortcat, DIROUT=self.dirsort ;
  mysort.getprop, KEYSTRUC=mykey                              ;get the key struc
  obj_destroy, mysort                                         ;destroy object
  
  chk = where(mykey.nbin GE 1)                                 ;find bins with enough to stack
  IF (chk[0] NE -1) THEN self.subset = ptr_new(mykey[chk].key) ;store subsets
  

END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::binbootstrap, perbin, VERSION=version
  
  ;;;default values
  IF keyword_set(VERSION) THEN version = string(version[0]) ELSE version = 'v3-6-1' ;set default
  
  ;;;read in file
  metadata = mrdfits(self.dirsort + self.sortcat, 1, hdr)
  keys = metadata.key
  key_values = keys[UNIQ(keys, SORT(keys))]
  ;print, key_values

  ;;;the bootstrap
  print, '  Boostrapping...setup....'
  ;;;%%%%% the random draws from the uniform deviates is return the
  ;;;same values for the low mass bin every time. no idea why yet. 

  seedval = (systime(/SECONDS)*2.0 mod (3279))
  ;print, seedval
  fullurands = uniformran(perbin, n_elements(key_values), SEED=seedval)
  ;help, fullurands
                                ;print, urands

  FOR ii=0, n_elements(key_values)-1, 1 DO BEGIN
     
     these = where(metadata.key EQ key_values[ii], nthese)
     ;print, nthese
     split = double(1.0/nthese)
     ;print, split

     urands = fullurands[*,ii]
     ;help, urands
                                ;FOR ii=0, perbin-1, 1 DO BEGIN
     repick = fix(urands/split)
     ;print, repick
     temp = metadata[these[repick]]
     IF ii NE 0 THEN BEGIN
        outdata = [outdata, temp]
     ENDIF ELSE BEGIN
        outdata = temp
     ENDELSE
  ENDFOR

                                ;help, outdata, /STRUC
                                ;stop
  outfile = strcompress(self.dirsort + self.bootcat, /REMOVE_ALL)
  mwrfits, outdata, outfile, /CREATE ;

  
END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::findstats, VERSION=version


  IF keyword_set(VERSION) THEN version = string(version[0]) ELSE version = 'v3-6-1' ;set default
  
  metadata = mrdfits(self.dirsort + self.sortcat, 1, hdr)
  keys = metadata.key
  key_values = keys[UNIQ(keys, SORT(keys))]

  med_mass = []
  mean_mass = []
  med_n2 = []
  mean_n2 = []
  FOR ii=0, n_elements(key_values)-1, 1 DO BEGIN
     these = where(metadata.key EQ key_values[ii])
     med_mass = [med_mass, median(metadata[these].ph_lmass)]
     mean_mass = [mean_mass, mean(metadata[these].ph_lmass)]
     med_n2 = [med_n2, median(metadata[these].SP_M_NIIR_FLUX/metadata[these].SP_M_HA_FLUX)]
     mean_n2 = [mean_n2, mean(metadata[these].SP_M_NIIR_FLUX/metadata[these].SP_M_HA_FLUX)]
  ENDFOR

  self.binmedmass = ptr_new(med_mass)
  self.binmeanmass = ptr_new(mean_mass)
  self.binmedn2 = ptr_new(med_n2)
  self.binmeann2 = ptr_new(mean_n2)

END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::specstack, SUBSETS=subsets, SM=sm, BOOTSTRAP=bootstrap, PERTURB=perturb


  IF keyword_set(SUBSETS) THEN subsets = (string(subsets)) ELSE subsets = *self.subset ;set default
  IF keyword_set(SM) THEN sm = strlowcase(string(sm[0])) ELSE sm = 'smcurrent'         ;set default
  IF keyword_set(BOOTSTRAP) THEN thisfile = self.bootcat ELSE thisfile = self.sortcat  ;set default
  IF keyword_set(PERTURB) THEN perturb = 1 ELSE perturb = 0                            ;set default
  
  FOR xx=n_elements(subsets)-1, 0, -1 DO BEGIN                                                ;loop over subsets to stack
     mystkset = obj_new('specstackset', PRESET=sm)                                            ;initiate object
     mystkset.getprop, PRESET=presets                                                         ;get property
     myspecs = mystkset.readfile(thisfile, INDIR=self.dirsort)                                ;read the file
     mypresets = mystkset.getpresets(presets)                                                 ;read the file
     mypresets.perturb = perturb                                                              ;modify the perturb setting as necessary
     status = mystkset.makestack(myspecs, mypresets, OUTDIR=self.dirsort, ENV=self.tgclmem, $ ;cont next line
                                 SUBSET=subsets[xx], SPECVER='v3-6-0', NEWSPECVER='v3-6-1')   ;make the stacks   
     obj_destroy, mystkset
  ENDFOR

END
;====================================================================================================



;====================================================================================================
PRO mzranalysis::collatespecstack, STACKSPEC=stackspec, ACTUALSPEC=actualspec, SUMMATION=summation, $
                                   VERSION=version

  IF keyword_set(VERSION) THEN version = string(version[0]) ELSE version = 'v3-6-1' ;set default

  IF keyword_set(STACKSPEC) THEN BEGIN
     compcat = strcompress(self.dirsort + self.compcat,  /REMOVE_ALL)                          ;file name
     compsumcat = strcompress(self.dirsort + self.compsumcat,  /REMOVE_ALL)                    ;file name
     xin = strcompress(self.dirsort + 'compos_spectstk_1d*' + version + '*.fits', /REMOVE_ALL) ;file name
     
     spectra_collate, xin, OUTFILE=compcat

     IF keyword_set(SUMMATION) THEN BEGIN
        curdata = mrdfits(compcat, 1, hdr)
        continuing = file_test(compsumcat)
        IF continuing EQ 0 THEN BEGIN
           mwrfits, curdata, compsumcat, /CREATE
        ENDIF ELSE BEGIN           
           sumdata = mrdfits(compsumcat, 1, hdr)
           sumdata = [sumdata, curdata]
           mwrfits, sumdata, compsumcat, /CREATE 
        ENDELSE
     ENDIF
  ENDIF
  
  
  IF keyword_set(ACTUALSPEC) THEN BEGIN
     print, '  Getting all the actual spectra'
     checking = ['A','B','C','D','E','F','G','H','I','J','K','L','M', $
                 'N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

     base = 'compos_spectstk_1d_bin*_' + version + '.fits'
                                ;print, base
     FOR ii=0, n_elements(checking)-1, 1 DO BEGIN
        thisone = base
        strreplace, thisone, '*', checking[ii]
                                ;print, thisone
        searchstr = strcompress(self.dirsort + thisone, /REMOVE_ALL)
                                ;print, searchstr

        test = file_test(searchstr)
                                ;print, test
        IF test EQ 1 THEN BEGIN
           keepdata = mrdfits(searchstr, 1, hdr, /SILENT)
                                ;help, keepdata, /STRUC
           addthis = {bin:checking[ii], lambdas:keepdata.lambdas, spec1d:keepdata.spec1d, $
                      spec1dwei:keepdata.spec1dwei, spec1dflag:keepdata.spec1dflag}
           
           IF checking[ii] NE 'A' THEN BEGIN
              added = [added, addthis]
           ENDIF ELSE BEGIN
              added = [addthis]
           ENDELSE
        ENDIF
     ENDFOR
     bootsumfile = strcompress(self.dirsort + self.bootsumcat, /REMOVE_ALL)
     continuing = file_test(bootsumfile)
     IF continuing EQ 0 THEN BEGIN
        mwrfits, added, bootsumfile, /CREATE
     ENDIF ELSE BEGIN
        currentdata = mrdfits(bootsumfile, 1, hdr)
        currentdata = [currentdata, added]
        mwrfits, currentdata, bootsumfile, /CREATE
     ENDELSE
  ENDIF

END
;====================================================================================================



;====================================================================================================
PRO mzranalysis::plotspecstack, SUBSET=subset, INDIR=indir 

  COMPILE_OPT idl2
  
  IF keyword_set(SUBSET) THEN subset = (string(subset)) ELSE subset = *self.subset          ;set default
  IF keyword_set(INDIR) THEN indir = strlowcase(string(indir[0])) ELSE indir = self.dirsort ;set default
  fnplspecstack = strcompress(indir + self.fnplspecstack, /REMOVE_ALL)                      ;set default
  composite_spec_plots

  data = *self.stackdata                                                       ;copy data
  envbins = uniq(fix(data.(self.indsclmem)), sort(fix(data.(self.indsclmem)))) ;find unique environemnt values
  self.valsclmem = ptr_new(data[envbins].(self.indsclmem))                     ;store those values
  envbins = n_elements(envbins)                                                ;find number of those values

;END
;PRO mzranalysis::storage
  specs = strarr(envbins, ceil(n_elements(subset)/float(envbins)))
  checking = ['A','B','C','D','E','F','G','H','I','J','K','L','M', $
              'N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
  count = 0
  keepup = 0
  FOR xx=0, n_elements(subset)-1, 1 DO BEGIN
     chk = checking[count+keepup] EQ subset[count]
     IF chk EQ 1 THEN BEGIN
        specs[count+keepup] = subset[xx]
     ENDIF ELSE BEGIN
        WHILE chk EQ 0 DO BEGIN
           specs[count+keepup] = 'EMPTY'
           chk = checking[count+keepup] EQ subset[count]
           IF chk NE 1 THEN keepup = keepup + 1 ELSE specs[count+keepup] = subset[count]
        ENDWHILE
     ENDELSE
     count = count + 1
  ENDFOR
  specs = transpose(specs)
  

  ;;;set default values
  options = {FILE:'hithere', AUXFILE:'hithere2', NWIN:1, WEPSILON:750.0, $
             bcgrasex:'', bcgdecsex:'', bcgradeg:0.0D, bcgdecdeg:0.0D, $
             g1rasex:'', g1decsex:'', g1radeg:0.0D, g1decdeg:0.0D, $
             g2rasex:'', g2decsex:'', g2radeg:0.0D, g2decdeg:0.0D, $
             g3rasex:'', g3decsex:'', g3radeg:0.0D, g3decdeg:0.0D, $
             g4rasex:'00:00:00.00', g4decsex:'-00:00:00.0', g4radeg:0.0D, g4decdeg:0.0D, $
             zmincluster:1.622, zmaxcluster:1.644, zming1:0.0, zmaxg1:0.0, $
             pzmincluster:0.0, pzmaxcluster:0.0, $
             histzmin:0.5, histzmax:3.0, histzbinsz:0.05, histzminnar:1.5, histzmaxnar:1.7, histzbinsznar:0.01, $
             rsxmin:16.0, rsxmax:24.0, rsymin:-2.0, rsymax:6.0, $
             sbsxmin:16.0, sbsxmax:24.0, sbsymin:-1.5, sbsymax:2.0, $
             whichclin:'D', $
             bptxmin:-2.0, bptxmax:0.99, bptymin:-1.1, bptymax:1.5, $
             iracagnxmin:-0.45, iracagnxmax:0.85, iracagnymin:-0.65, iracagnymax:1.35, $
             wavemin:6470, wavemax:6770, $
             pzangsize:5.7750887*1.0 }


  ;;;Mass-metallicty relation binned spectra
  base = 'compos_spectstk_1d_bin???_v3-6-1.fits' ;base name
  FOR xx=0, n_elements(specs)-1, 1 DO BEGIN      ;loop over subsets
     bit = base                                  ;copy base
     strreplace, bit, '???', specs[xx]           ;replace the wildcard
     bit = strcompress(indir + bit, /REMOVE_ALL) ;remove whitespace
     specs[xx] = bit                             ;store the result
  ENDFOR                                         ;end loop over subsets

  ;;;choose which plotting routine to use
  size = size(specs)            ;size of array
  CASE size[0] OF               ;how many dimensions

     1 : BEGIN                                                     ;one dimension
        chk = stackspec1xn(specs, options, FILENAME=fnplspecstack) ;plot stacked spectra
        IF chk EQ 1 THEN print, '    ...created successfully'      ;print info
     END                                                           ;end one dimension

     2 : BEGIN                                                     ;two dimensions
        chk = stackspec2xn(specs, options, FILENAME=fnplspecstack) ;plot stacked spectra
        IF chk EQ 1 THEN print, '    ...created successfully'      ;print info
     END                                                           ;end two dimensions
     
     ELSE : BEGIN
        print, 'Not yet able to handle this size of array'
     ENDELSE
  ENDCASE                       ;end how many dimensions

END
;====================================================================================================





;====================================================================================================
PRO mzranalysis::fitmzrstack, WHICH=which, ISERROR=iserror, $ 
                              SAVE=save, STARTOVER=startover, HELP=help

  IF keyword_set(WHICH) THEN which = strlowcase(string(which[0])) ELSE which = 'tr04' ;set default

  ;;;read catalog and fine appropriate data
  self.readstack                                                               ;file name
  data = *self.stackdata                                                       ;copy data
  envbins = uniq(fix(data.(self.indsclmem)), sort(fix(data.(self.indsclmem)))) ;find unique environemnt values
  self.valsclmem = ptr_new(data[envbins].(self.indsclmem))                     ;store those values
  
  ;;;If mass errors given are the actual errors or the data values off by the error
  IF keyword_set(ISERROR) THEN BEGIN                        ;if keyword is set
     emassi = data.(self.indsemassi)                        ;take errors as is
     emassa = data.(self.indsemassa)                        ;take errors as is
  ENDIF ELSE BEGIN                                          ;keyword not set
     emassi = data.(self.indsmass) - data.(self.indsemassi) ;find distance from mean
     emassa = data.(self.indsemassa) - data.(self.indsmass) ;find distance from mean
  ENDELSE                                                   ;end keyword not set
  masserr = mean([[emassi], [emassa]], DIMENSION=2)         ;take average for now


  ;;;convert line fluxes to metallicity, get metallicity errors
  metals = pettini_pagel_2004(data.(self.indshaflux), data.(self.indsniiflux)) ;get metallicity
  dmetals = 0.18 / data.(self.indsninbin)^0.5                                  ;systematic error dividing by sqrt(sample size)

  
  ;;;load object and use fitting routine
  FOR xx=0, n_elements(envvals)-1, 1 DO BEGIN              ;loop over sets to fit
     thisfit = where(data.(self.indsclmem) EQ envvals[xx]) ;find subset

     CASE which OF                                                                   ;which fit to perform
        'tr04' : BEGIN                                                               ;Tremonti 2004 constant offset
           mypub = obj_new('tremonti2004')                                           ;create object instance
           mypub.getprop, TR04OBJVER=myver                                           ;get version number
           result = mypub.mymzrfit(data[thisfit].(self.indsmass), metals[thisfit], $ ;cont next line
                                   masserr[thisfit], dmetals[thisfit], $             ;cont next line
                                   /PLOTDATA, /PLOTPOST)                             ;fit a constant offset from Tremonti's fit
        END                                                                          ;end Tremonti 2004 constant

        ELSE : BEGIN                                          ;no match
           print, 'WARNING!! Choice of fit not understood...' ;print info
           print, '  Choices are: "tr04"'                     ;print info
        ENDELSE                                               ;end no match
     ENDCASE                                                  ;end which fit
     
     add_tag, result, 'envval', envvals[xx], newstruc                          ;add a new tag
     result = 0                                                                ;erase previous
     result = newstruc                                                         ;grab new 
     IF (xx EQ 0) THEN outresult = result ELSE outresult = [outresult, result] ;store it up
  ENDFOR                                                                       ;end loop over sets to fit


  self.fitinfo = ptr_new(result) ;store fit result

  IF keyword_set(SAVE) THEN BEGIN                                                     ;if we want to save file
     filechk = file_test(strcompress(self.dirsort + self.fnmzrfit))                   ;check if file exists
     IF filechk EQ 0 THEN BEGIN                                                       ;if file doesnt exist
        mwrfits, outresult, strcompress(self.dirsort + self.fnmzrfit), /CREATE        ;save file
     ENDIF ELSE BEGIN                                                                 ;end file doesnt
        IF keyword_set(STARTOVER) THEN BEGIN                                          ;if start over
           mwrfits, outresult, strcompress(self.dirsort + self.fnmzrfit), /CREATE     ;save file
        ENDIF ELSE BEGIN                                                              ;not start over
           vals = mrdfits(strcompress(self.dirsort + self.fnmzrfit), 1, hdr, /SILENT) ;read in file
           outresult = [vals, outresult]                                              ;add to file
           mwrfits, outresult, strcompress(self.dirsort + self.fnmzrfit), /CREATE     ;save file
        ENDELSE                                                                       ;end not start over
     ENDELSE                                                                          ;end file exists
  ENDIF                                                                               ;end if we want to save file

END
;====================================================================================================




;====================================================================================================
PRO mzranalysis::plotmzrstack, FNPLMZRSTACK=fnplmzrstack, ISERROR=iserror, $
                               LABEL=label, $
                               HELP=help

  
  IF keyword_set(ISERROR) THEN iserror = string(iserror) ELSE iserror = 0                   ;set default value
 
  ;;;set default values
  print, '  Stacked points MZR plot...'      ;print info
  IF keyword_set(FNPLMZRSTACK) THEN fnplmzrstack = string(fnplmzrstack[0]) ELSE fnplmzrstack = self.fnplmzrstack ;set default value
  fnplmzrstack = strcompress(self.dirsort + fnplmzrstack)                                                        ;append directory

  ;;;read catalog and fine appropriate data
  self.readstack                ;file name
  data = *self.stackdata        ;copy data
  help, data, /STRUC
  
  
  ;;;grab median and mean mass, N2 values in case we want them
  medmass = *self.binmedmass
  meanmass = *self.binmeanmass
  medn2 = *self.binmedn2
  meann2 = *self.binmeann2


  ;;;If mass errors given are the actual errors or the data values off by the error
  IF keyword_set(ISERROR) THEN BEGIN                        ;if keyword is set
     emassi = data.(self.indsemassi)                        ;take errors as is
     emassa = data.(self.indsemassa)                        ;take errors as is
  ENDIF ELSE BEGIN                                          ;keyword not set
     emassi = data.(self.indsmass) - data.(self.indsemassi) ;find distance from mean
     emassa = data.(self.indsemassa) - data.(self.indsmass) ;find distance from mean
  ENDELSE                                                   ;end keyword not set
  masserr = transpose([[emassi], [emassa]])                 ;

  ;;;deal with upper limits
  ulims = intarr(n_elements(data.(self.indsmass)))                                                ;create array 
  IF (self.indsniiflag NE -1) THEN BEGIN                                                          ; 
     chk = where(data.(self.indsniiflag) GE self.niiflagul)                                       ; 
     IF (ulims[0] EQ -1) THEN ulims[chk] = 1                                                      ;
  ENDIF ELSE BEGIN                                                                                ;find upper limit points
     ulims = 0                                                                                    ;if no upper limits
  ENDELSE                                                                                         ;
  IF keyword_set(LABEL) THEN BEGIN                                                                ;if label is desired
     IF (lab1ind NE -1) THEN label = data.(self.indlab1)                                          ;start label
     IF (lab2ind NE -1) THEN label = strcompress(data.(self.indlab2) + ':' + data.(self.indlab1)) ;start label
  ENDIF                                                                                           ;end label desired
  IF total(ulims) EQ 0 THEN ulims = 0                                                             ;check if an upper limits exists
 
  chk = plot_mzr(data.(self.indsmass), 'N2', N2RULE='PP04', $                      ;cont next line
                 HAFLUX=data.(self.indshaflux), NIIFLUX=data.(self.indsniiflux), $ ;
                 STACK=1, CLMEM=data.(self.indsclmem), EMASS=masserr, $            ; 
                 NS=data.(self.indsninbin), TITLE = 'KEMCLASS ALL STACK', $        ;
                 ULIMS=ulims, LABEL=label, OUTFILE=fnplmzrstack, SATURATE=1, $     ;
                 FITINFO=*self.fitinfo, $                                          ;
                 SHOWST14PT=1, SHOWST14TR=0, SHOWSA14=1, $                         ;
                 SHOWMEAN=1, MEANMASS=meanmass, MEANN2=meann2, $                   ;
                 SHOWMED=1, MEDMASS=medmass, MEDN2=medn2, $ 
                 SHOWERB06PTS=1, SHOWERB06TREND=0, SHOWTR04=1)                     ;plot mzr

END
;====================================================================================================






















;====================================================================================================
PRO mzranalysis::comparemetallicity, TGHAFLUX=tghaflux, TGNIIFLUX=gniiflux, $
                                     XMIN=xmin, XMAX=xmax, YMIN=ymin, YMAX=ymax


  IF keyword_set(XMIN) THEN xmin = float(xmin[0]) ELSE xmin = 8.0 ;set default 
  IF keyword_set(XMAX) THEN xmax = float(xmax[0]) ELSE xmax = 9.0 ;set default 
  IF keyword_set(YMIN) THEN ymin = float(ymin[0]) ELSE ymin = 8.0 ;set default 
  IF keyword_set(YMAX) THEN ymax = float(ymax[0]) ELSE ymax = 9.0 ;set default


  ;;;read catalog and fine appropriate data
  self.readcat                                           ;read in file
  self.sample                                            ;get sample
  data = *self.curdata                                   ;copy data
  data = data[*self.cleansample]                         ;grab subset
  chk = tag_exist(data, self.tghaflux, INDEX=hafind)     ;find necessary tag
  text = '   This plot requires a Halpha flux keyword: ' ;text to pass
  IF chk EQ 0 THEN hafind = tagprompt(data, text)        ;find necessary tag
  chk = tag_exist(data, self.tgniiflux, INDEX=niifind)   ;find necessary tag
  text = '   This plot requires a NII flux keyword: '    ;text to pass
  IF chk EQ 0 THEN niifind = tagprompt(data, text)       ;find necessary tag

  chk = where((data.(hafind) LT 0) OR (data.(hafind) NE data.(hafind)), COMPLEMENT=keep)
  IF (chk[0] NE -1) THEN data = data[keep]
  chk = where((data.(niifind) LT 0) OR (data.(niifind) NE data.(niifind)), COMPLEMENT=keep)
  IF (chk[0] NE -1) THEN data = data[keep]

  myst14 = obj_new('steidel2014')                                                           ;create object 
  steideloh = myst14.convertmetallicity('N2', HAFLUX=data.(hafind), NIIFLUX=data.(niifind)) ;get metallicity
  print, steideloh
  
  ppoh = pettini_pagel_2004(data.(hafind), data.(niifind)) ;get metallicity
  print, ppoh

  maiolinooh = maiolino_2008(data.(hafind), data.(niifind), /N2) ;get metallicity
  print, maiolinooh


  compare1 = plot(ppoh, steideloh, 'ro', $
                  /SYM_FILLED, FONT_SIZE=14, $
                  XRANGE=[xmin,xmax], $
                  XTITLE='Pettini 2004 12+log(O/H)', $
                  YRANGE=[ymin,ymax], $
                  YTITLE='Steidel 2014 12+log(O/H)')
  compare1 = plot([-99.0,99.0], [-99.0,99.0], '-', THICK=2, /OVERPLOT)


  compare2 = plot(ppoh, maiolinooh, 'ro', $
                  /SYM_FILLED, FONT_SIZE=14, $
                  XRANGE=[xmin,xmax], $
                  XTITLE='Pettini 2004 12+log(O/H)', $
                  YRANGE=[ymin,ymax], $
                  YTITLE='Maiolino 2004 12+log(O/H)')
  compare2 = plot([-99.0,99.0], [-99.0,99.0], '-', THICK=2, /OVERPLOT)


  compare3 = plot(maiolinooh, steideloh, 'ro', $
                  /SYM_FILLED, FONT_SIZE=14, $
                  XRANGE=[xmin,xmax], $
                  XTITLE='Maiolino 2004 12+log(O/H)', $
                  YRANGE=[ymin,ymax], $
                  YTITLE='Steidel 2014 12+log(O/H)')
  compare3 = plot([-99.0,99.0], [-99.0,99.0], '-', THICK=2, /OVERPLOT)


END
;====================================================================================================





;====================================================================================================
PRO mzranalysis::linkplots


  line = strcompress(strcompress(self.dirplot + self.fnbptplot, /REMOVE_ALL) + ' ' + $ ;cont next line
                     strcompress(self.dirart + self.fnbptplot, /REMOVE_ALL))           ;create spawn line
  IF self.bptmade THEN spawn, 'ln -s ' + line                                          ;spawn the command

  line = strcompress(strcompress(self.dirplot + self.fniragnplot, /REMOVE_ALL) + ' ' + $ ;cont next line
                     strcompress(self.dirart + self.fniragnplot, /REMOVE_ALL))           ;create spawn line
  IF self.iragnmade THEN spawn, 'ln -s ' + line                                          ;spawn the command

  line = strcompress(strcompress(self.dirplot + self.fnmzrplot, /REMOVE_ALL) + ' ' + $ ;cont next line
                     strcompress(self.dirart + self.fnmzrplot, /REMOVE_ALL))           ;create spawn line
  IF self.mzrmade THEN spawn, 'ln -s ' + line                                          ;spawn the command


END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::plotall

  self.plotbpt
  self.plotiragn
                                ;self.comparemetallicity
  self.plotmzr

END
;====================================================================================================


;====================================================================================================
PRO mzranalysis::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mzranalysis::init, CURCAT=curcat, DIRCURCAT=dircurcat, DIRSTACK=dirstack, DIRPLOT=dirplot, DIRART=dirart, $
                            TGAGN=tgagn, TGHAFLUX=tghaflux, TGNIIFLUX=tgniiflux, WORKING=working                            
  

  self.d15aobjver = 'v1-4-0'    ;code version


  IF keyword_set(WORKING) THEN self.working = strlowcase(string(working[0])) ELSE self.working = 'one'           ;set default
  IF keyword_set(CURCAT) THEN self.curcat = string(curcat[0]) ELSE self.curcat = 'kemclass_pz_specz_v0-4-1.fits' ;set default

  
  IF keyword_set(FNPLSPECSTACK) THEN self.fnplspecstack = string(fnplspecstack[0]) ELSE self.fnplspecstack = '_specstack.jpeg' ;set default
  IF keyword_set(FNPLMZRINDIV) THEN self.fnplmzrindiv = string(fnplmzrindiv[0]) ELSE self.fnplmzrindiv = '_mzrindiv.jpeg'      ;set default
  IF keyword_set(FNMZRFIT) THEN self.fnmzrfit = string(fnmzrfit[0]) ELSE self.fnmzrfit = '_mzrfit.fits'                        ;set default
  IF keyword_set(FNPLMZRSTACK) THEN self.fnplmzrstack = string(fnplmzrstack[0]) ELSE self.fnplmzrstack = '_mzrstack.jpeg'      ;set default




  IF keyword_set(DIRCURCAT) THEN self.dircurcat = string(dircurcat[0]) ELSE $                                      ;
     self.dircurcat = '/Users/adegroot/research/clusters/combination/catalogs/'                                    ;set default
  IF keyword_set(SORTCAT) THEN self.sortcat = string(sortcat[0]) ELSE self.sortcat = 'MOSFIRE_sort'                ;set default
  IF keyword_set(DIRSORT) THEN self.dirsort = string(dirsort[0]) ELSE $                                            ;
     self.dirsort = '/Users/adegroot/research/clusters/combination/spectroscopy/stacks'                            ;set default
  IF keyword_set(COMPCAT) THEN self.compcat = string(compcat[0]) ELSE self.compcat = 'MOSFIRE_comp'                ;set default
  IF keyword_set(COMPSUMCAT) THEN self.compsumcat = string(compsumcat[0]) ELSE self.compsumcat = 'MOSFIRE_compsum' ;set default
  IF keyword_set(BOOTCAT) THEN self.bootcat = string(bootcat[0]) ELSE self.bootcat = 'MOSFIRE_boot'                ;set default
  IF keyword_set(BOOTSUMCAT) THEN self.bootsumcat = string(bootsumcat[0]) ELSE self.bootsumcat = 'MOSFIRE_bootsum' ;set default
  IF keyword_set(DIRPLOT) THEN self.dirplot = string(dirplot[0]) ELSE $                                            ;
     self.dirplot = '/Users/adegroot/research/clusters/combination/graphics/'                                      ;set default
  IF keyword_set(DIRART) THEN self.dirart = string(dirart[0]) ELSE $                                               ;
     self.dirart = '/Users/adegroot/research/articles/2015a_mzr/'                                                  ;set default

  working = self.workingon(self.dirsort, self.sortcat, self.compcat, self.compsumcat, self.bootcat, self.bootsumcat)
  IF (working NE 1) THEN stop
  
  IF keyword_set(NIIFLAGUL) THEN self.niiflagul = string(niiflagul[0]) ELSE self.niiflagul = 32 ;





  self.nwin = 0                                                                                                       ;set default
  IF keyword_set(BPTMADE) THEN self.bptmade = string(bptmade[0]) ELSE self.bptmade = 0                                ;set default
  IF keyword_set(FNBPTPLOT) THEN self.fnbptplot = string(fnbptplot[0]) ELSE self.fnbptplot = 'cdfs44_bptall_v1-3.eps' ;set default
  IF keyword_set(BPTXMIN) THEN self.bptxmin = float(bptxmin[0]) ELSE self.bptxmin = -2.0                              ;set default
  IF keyword_set(BPTXMAX) THEN self.bptxmax = float(bptxmax[0]) ELSE self.bptxmax = 1.0                               ;set default
  IF keyword_set(BPTYMIN) THEN self.bptymin = float(bptymin[0]) ELSE self.bptymin = -1.1                              ;set default
  IF keyword_set(BPTYMAX) THEN self.bptymax = float(bptymax[0]) ELSE self.bptymax = 1.5                               ;set default


  IF keyword_set(IRAGNMADE) THEN self.iragnmade = string(iragnmade[0]) ELSE self.iragnmade = 0                                  ;set default
  IF keyword_set(FNIRAGNPLOT) THEN self.fniragnplot = string(fniragnplot[0]) ELSE self.fniragnplot = 'cdfs44_iragnall_v1-3.eps' ;set default
  IF keyword_set(IRAGNXMIN) THEN self.iragnxmin = float(iragnxmin[0]) ELSE self.iragnxmin = -0.45                               ;set default
  IF keyword_set(IRAGNXMAX) THEN self.iragnxmax = float(iragnxmax[0]) ELSE self.iragnxmax = 0.85                                ;set default
  IF keyword_set(IRAGNYMIN) THEN self.iragnymin = float(iragnymin[0]) ELSE self.iragnymin = -0.65                               ;set default
  IF keyword_set(IRAGNYMAX) THEN self.iragnymax = float(iragnymax[0]) ELSE self.iragnymax = 1.35                                ;set default


  IF keyword_set(MZRMADE) THEN self.mzrmade = string(mzrmade[0]) ELSE self.mzrmade = 0                                        ;set default
  IF keyword_set(FNDMZRPLOT) THEN self.fndmzrplot = string(fndmzrplot[0]) ELSE self.fndmzrplot = 'clthree_dmzrindiv_v1-3.jpg' ;set default




  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO mzranalysis__define

  void = {mzranalysis, d15aobjver:'A', WORKING:'A', $
          COMPCAT:'A', DIRCOMP:'A', COMPDATA:ptr_new(), COMPHDR:ptr_new(), NCOMPDATA:0, $
          COMPSUMCAT:'A', $
          STACKCAT:'A', STACKDATA:ptr_new(), STACKHDR:ptr_new(), NSTACKDATA:0, $
          BOOTCAT:'A', BOOTDATA:ptr_new(), BOOTHDR:ptr_new(), NBOOTDATA:0, $
          BOOTSUMCAT:'A', BOOTSUMDATA:ptr_new(), BOOTSUMHDR:ptr_new(), NBOOTSUMDATA:0, $
          TGRA:'A', INDRA:-99, TGDEC:'A', INDDEC:-99, TGMASS:'A', $
          INDMASS:-99, TGEMASSI:'A', INDEMASSI:-99, TGEMASSA:'A', INDEMASSA:-99, $ 
          TGSPZ1:'A', INDSPZ1:-99, $
          TGCLMEM:'A', INDCLMEM:-99, TGLAB1:'A', INDLAB1:-99, TGLAB2:'A', INDLAB2:-99,  $
          TGHAFLUX:'A', INDHAFLUX:-99, $
          TGNIIFLUX:'A', INDNIIFLUX:-99, TGENIIFLUX:'A', INDENIIFLUX:-99, TGNIIFLAG:'A', INDNIIFLAG:-99, $
          
          TGSNSTCK:'A', INDSNSTCK:-99,  TGSMASS:'A', INDSMASS:-99, $
          TGSEMASSI:'A', INDSEMASSI:-99, TGSEMASSA:'A', INDSEMASSA:-99, $ 
          TGSCLMEM:'A', INDSCLMEM:-99, VALSCLMEM:ptr_new(), $
          TGSHAFLUX:'A', INDSHAFLUX:-99, $
          TGSNIIFLUX:'A', INDSNIIFLUX:-99, TGSENIIFLUX:'A', INDSENIIFLUX:-99, TGSNIIFLAG:'A', INDSNIIFLAG:-99, $
          TGSNINBIN:'A', INDSNINBIN:-99, $
          NIIFLAGUL:0, $
          MASSBINS:ptr_new(), SUBSET:ptr_new(), $
          FITINFO:ptr_new(), $ 
          FNPLSPECSTACK:'A', FNPLMZRINDIV:'A', FNMZRFIT:'A', FNPLMZRSTACK:'A', $
          
          BINMEDMASS:ptr_new(), BINMEANMASS:ptr_new(), BINMEDN2:ptr_new(), BINMEANN2:ptr_new(), $

          TGCH1FLUX:0, INDCH1FLUX:0, TGCH2FLUX:0, INDCH2FLUX:0, $
          TGCH3FLUX:0, INDCH3FLUX:0, TGCH4FLUX:0, INDCH4FLUX:0, $
          TGIRAGN:0, INDIRAGN:0, $

          curcat:'A', dircurcat:'A', curdata:ptr_new(), curhdr:ptr_new(), ncurdata:0, $
          dirplot:'A', dirart:'A', sample:ptr_new(), cleansample:ptr_new(), GROUP:'A', $
          SORTCAT:'A', DIRSORT:'A', $
          NWIN:0, $
          TGMFLAG:0, $
          TGSPZFLAG1:0, TGSPZ2:0, TGHAFLAG:0, $
          TGAGN:0, TGELAGN:0, $
          BPTMADE:0, FNBPTPLOT:'A', BPTXMIN:0.0, BPTXMAX:0.0, BPTYMIN:0.0, BPTYMAX:0.0, $
          IRAGNMADE:0, FNIRAGNPLOT:'A', IRAGNXMIN:0.0, IRAGNXMAX:0.0, IRAGNYMIN:0.0, IRAGNYMAX:0.0, $
          MZRMADE:0, FNDMZRPLOT:'A'}

  RETURN
END
;====================================================================================================

