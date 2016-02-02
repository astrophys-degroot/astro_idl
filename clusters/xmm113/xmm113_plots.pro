;========================================================================================================================
FUNCTION SPECZHISTALL, xdata, xoptions

  print, '  Histogram of spectroscopically confirmed members...'        ;print info
  chk = tag_exist(xdata, 'SPECZBEST', INDEX=spzind)                     ;find necessary tag
  text = '   This plot requires a spectroscopic redshift keyword: '     ;text to pass
  IF chk EQ 0 THEN spzind = tagprompt(xdata, text)                      ;find necessary tag
  chk = tag_exist(xdata, 'SPECZFLAG', INDEX=flgind)                     ;find necessary tag
  text = '   This plot options a spectroscopic redshift flag keyword: ' ;text to pass
  IF chk EQ 0 THEN flgind = tagprompt(xdata, text)                      ;find necessary tag


  pdf = histogram(xdata.(spzind), LOCATIONS=xbin, MIN=xoptions.histzmin, $
                  MAX=xoptions.histzmax, BINSIZE=xoptions.histzbinsz)
  help, xdata.(spzind)
  help, xbin
  pdfnarrow = histogram(xdata.(spzind), LOCATIONS=xbinnarrow, MIN=xoptions.histzminnar, $
                        MAX=xoptions.histzmaxnar, BINSIZE=xoptions.histzbinsznar)
  IF flgind[0] NE -1 THEN BEGIN
     chk = where((xdata.speczflag EQ 0) OR (xdata.speczflag EQ 1) OR (xdata.speczflag EQ 2))
     gpdf = histogram(xdata[chk].(spzind), LOCATIONS=gxbin, MIN=xoptions.histzmin, $
                      MAX=xoptions.histzmax, BINSIZE=xoptions.histzbinsz)
     gpdfnarrow = histogram(xdata[chk].(spzind), LOCATIONS=xbinnarrow, MIN=xoptions.histzminnar, $
                            MAX=xoptions.histzmaxnar, BINSIZE=xoptions.histzbinsznar)
  ENDIF

  w = window(LOCATION=[100+50*xoptions.nwin,25+25*xoptions.nwin])
  phistspecz = PLOT(xbin, pdf, /CURRENT, /HISTOGRAM, $
                    FONT_SIZE = 14, $
                    TITLE='Spectroscopic Redshift Distribution', $
                    XTITLE='Redshift', $ 
                    XRANGE=[xoptions.histzmin,xoptions.histzmax], $
                    YTITLE='Number', $
                    MAX_VALUE=60, $
                    COLOR='blue', THICK=2.0)
  IF flgind[0] NE -1 THEN phistspeczgood = PLOT(xbin, gpdf, /CURRENT, /HISTOGRAM, $
                                                /FILL_BACKGROUND, FILL_COLOR='blue', $ 
                                                /OVERPLOT, $
                                                COLOR='blue', THICK=2.0)
  phistspeznar = PLOT(xbinnarrow, pdfnarrow, /CURRENT, /HISTOGRAM, $
                      FONT_SIZE = 14, $
                      XTITLE='Redshift', $
                      XRANGE=[xoptions.histzminnar, xoptions.histzmaxnar], $
                      YTITLE='Number', $
                      MAX_VALUE=60, $
                      COLOR='blue', THICK=2.0, $
                      POSITION=[0.65,0.52,0.88,0.84])
  IF flgind[0] NE -1 THEN phistspecznargood = PLOT(xbinnarrow, gpdfnarrow, /CURRENT, /HISTOGRAM, $
                                                   /FILL_BACKGROUND, FILL_COLOR='blue', $ 
                                                   /OVERPLOT, $
                                                   COLOR='blue', THICK=2.0)
  
  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION SPECZHISTBCG, xdata, xoptions


  print, '  Histogram of spectroscopically confirmed members near BCG...' ;print info
  chk = tag_exist(xdata, 'SPECZBEST', INDEX=spzind)                       ;find necessary tag
  text = '   This plot requires a spectroscopic redshift keyword: '       ;text to pass
  IF chk EQ 0 THEN spzind = tagprompt(xdata, text)                        ;find necessary tag
  chk = tag_exist(xdata, 'RABEST', INDEX=raind)                           ;find necessary tag
  text = '   This plot requires an RA keyword: '                          ;text to pass
  IF chk EQ 0 THEN spzind = tagprompt(xdata, text)                        ;find necessary tag
  chk = tag_exist(xdata, 'DECBEST', INDEX=decind)                         ;find necessary tag
  text = '   This plot requires an DEC keyword: '                         ;text to pass
  IF chk EQ 0 THEN spzind = tagprompt(xdata, text)                        ;find necessary tag
  chk = tag_exist(xdata, 'SPECZFLAG', INDEX=flgind)                       ;find necessary tag
  text = '   This plot options a spectroscopic redshift flag keyword: '   ;text to pass
  IF chk EQ 0 THEN flgind = tagprompt(xdata, text)                        ;find necessary tag

  
  close_match_radec, xoptions.bcgradeg, xoptions.bcgdecdeg, xdata.(raind), xdata.(decind), $ ;cont next line
                     m1, mbcg, (xoptions.wepsilon/(7.733*3600.0)), 99999, miss1, /SILENT     ;near the BCG subset


  
  pdf = histogram(xdata[mbcg].(spzind), LOCATIONS=xbin, MIN=xoptions.histzmin, MAX=xoptions.histzmax, BINSIZE=xoptions.histzbinsz)
  pdfnarrow = histogram(xdata[mbcg].(spzind), LOCATIONS=xbinnarrow, MIN=xoptions.histzminnar, $
                        MAX=xoptions.histzmaxnar, BINSIZE=xoptions.histzbinsznar)
  IF flgind[0] NE -1 THEN BEGIN
     chk = where((xdata[mbcg].(flgind) EQ 0) OR (xdata[mbcg].(flgind) EQ 1) OR (xdata.(flgind) EQ 2))
     gpdf = histogram(xdata[mbcg[chk]].(spzind), LOCATIONS=gxbin, MIN=xoptions.histzmin, MAX=xoptions.histzmax, BINSIZE=xoptions.histzbinsz)
     gpdfnarrow = histogram(xdata[mbcg[chk]].(spzind), LOCATIONS=xbinnarrow, MIN=xoptions.histzminnar, $
                            MAX=zmaxnar, BINSIZE=xoptions.histzbinsznar)
  ENDIF

  w = window(LOCATION=[100+50*xoptions.nwin,25+25*xoptions.nwin])
  phistspecz = PLOT(xbin, pdf, /CURRENT, /HISTOGRAM, $
                    FONT_SIZE = 14, $
                    TITLE='BCG-Close Spectroscopic Redshift Distribution', $
                    XTITLE='Redshift', $
                    XRANGE=[xoptions.histzmin,xoptions.histzmax], $
                    YTITLE='Number', $
                    MAX_VALUE=60, $
                    COLOR='blue', THICK=2.0)
  IF flgind[0] NE -1 THEN phistspeczgood = PLOT(xbin, gpdf, /CURRENT, /HISTOGRAM, $
                                                /FILL_BACKGROUND, FILL_COLOR='blue', $ 
                                                /OVERPLOT, $
                                                COLOR='blue', THICK=2.0)
  phistspeznar = PLOT(xbinnarrow, pdfnarrow, /CURRENT, /HISTOGRAM, $
                      FONT_SIZE = 14, $
                      XTITLE='Redshift', $
                      XRANGE=[xoptions.histzminnar, xoptions.histzmaxnar], $
                      YTITLE='Number', $
                      MAX_VALUE=60, $
                      COLOR='blue', THICK=2.0, $
                      POSITION=[0.6,0.5,0.88,0.84])
  IF flgind[0] NE -1 THEN phistspecznargood = PLOT(xbinnarrow, gpdfnarrow, /CURRENT, /HISTOGRAM, $
                                                   /FILL_BACKGROUND, FILL_COLOR='blue', $ 
                                                   /OVERPLOT, $
                                                   COLOR='blue', THICK=2.0)

  
  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION SPECZHISTG1, xdata, xoptions


  print, '  Histogram of spectroscopically confirmed members near group 1...' ;print info
  chk = tag_exist(xdata, 'SPECZBEST', INDEX=spzind)                           ;find necessary tag
  text = '   This plot requires a spectroscopic redshift keyword: '           ;text to pass
  IF chk EQ 0 THEN spzind = tagprompt(xdata, text)                            ;find necessary tag
  chk = tag_exist(xdata, 'RABEST', INDEX=raind)                               ;find necessary tag
  text = '   This plot requires an RA keyword: '                              ;text to pass
  IF chk EQ 0 THEN spzind = tagprompt(xdata, text)                            ;find necessary tag
  chk = tag_exist(xdata, 'DECBEST', INDEX=decind)                             ;find necessary tag
  text = '   This plot requires an DEC keyword: '                             ;text to pass
  IF chk EQ 0 THEN spzind = tagprompt(xdata, text)                            ;find necessary tag
  chk = tag_exist(xdata, 'SPECZFLAG', INDEX=flgind)                           ;find necessary tag
  text = '   This plot options a spectroscopic redshift flag keyword: '       ;text to pass
  IF chk EQ 0 THEN flgind = tagprompt(xdata, text)                            ;find necessary tag
  
  close_match_radec, xoptions.g1radeg, xoptions.g1decdeg, xdata.(raind), xdata.(decind), $ ;cont next line
                     m1, mg1, (xoptions.wepsilon/(7.733*3600.0)), 99999, miss1, /SILENT    ;near Group1 subset


  pdf = histogram(xdata[mg1].(spzind), LOCATIONS=xbin, MIN=xoptions.histzmin, MAX=xoptions.histzmax, BINSIZE=xoptions.histzbinsz)
  pdfnarrow = histogram(xdata[mg1].(spzind), LOCATIONS=xbinnarrow, MIN=xoptions.histzminnar, $
                        MAX=xoptions.histzmaxnar, BINSIZE=xoptions.histzbinsznar)
  IF flgind[0] NE -1 THEN BEGIN
     chk = where((xdata[mg1].(flgind) EQ 0) OR (xdata[mg1].(flgind) EQ 1) OR (xdata.(flgind) EQ 2))
     gpdf = histogram(xdata[mg1[chk]].(spzind), LOCATIONS=gxbin, MIN=xoptions.histzmin, MAX=xoptions.histzmax, BINSIZE=xoptions.histzbinsz)
     gpdfnarrow = histogram(xdata[mg1[chk]].(spzind), LOCATIONS=xbinnarrow, MIN=xoptions.histzminnar, $
                            MAX=zmaxnar, BINSIZE=xoptions.histzbinsznar)
  ENDIF

  w = window(LOCATION=[100+50*xoptions.nwin,25+25*xoptions.nwin])
  phistspecz = PLOT(xbin, pdf, /CURRENT, /HISTOGRAM, $
                    FONT_SIZE = 14, $
                    TITLE='Group1-Close Spectroscopic Redshift Distribution', $
                    XTITLE='Redshift', $
                    XRANGE=[xoptions.histzmin,xoptions.histzmax], $
                    YTITLE='Number', $
                    MAX_VALUE=60, $
                    COLOR='blue', THICK=2.0)
  IF flgind[0] NE -1 THEN phistspeczgood = PLOT(xbin, gpdf, /CURRENT, /HISTOGRAM, $
                                                /FILL_BACKGROUND, FILL_COLOR='blue', $ 
                                                /OVERPLOT, $
                                                COLOR='blue', THICK=2.0)
  phistspeznar = PLOT(xbinnarrow, pdfnarrow, /CURRENT, /HISTOGRAM, $
                      FONT_SIZE = 14, $
                      XTITLE='Redshift', $
                      XRANGE=[xoptions.histzminnar, xoptions.histzmaxnar], $
                      YTITLE='Number', $
                      MAX_VALUE=60, $
                      COLOR='blue', THICK=2.0, $
                      POSITION=[0.6,0.5,0.88,0.84])
  IF flgind[0] NE -1 THEN phistspecznargood = PLOT(xbinnarrow, gpdfnarrow, /CURRENT, /HISTOGRAM, $
                                                   /FILL_BACKGROUND, FILL_COLOR='blue', $ 
                                                   /OVERPLOT, $
                                                   COLOR='blue', THICK=2.0)


  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION PHOTOZOD, xdata, xoptions


  print, '  Photo-z overdensity plot...'                          ;print info
  chk = tag_exist(xdata, 'PH_PZINT', INDEX=phzind)                ;find necessary tag
  text = '   This plot requires a photometric redshift keyword: ' ;text to pass
  IF chk EQ 0 THEN phzind = tagprompt(xdata, text)                ;find necessary tag
  chk = tag_exist(xdata, 'PH_RA', INDEX=raind)                    ;find necessary tag
  text = '   This plot requires a RA keyword: '                   ;text to pass
  IF chk EQ 0 THEN raind = tagprompt(xdata, text)                 ;find necessary tag
  chk = tag_exist(xdata, 'PH_DEC', INDEX=decind)                  ;find necessary tag
  text = '   This plot requires a DEC keyword: '                  ;text to pass
  IF chk EQ 0 THEN decind = tagprompt(xdata, text)                ;find necessary tag

  chk = tag_exist(xdata, 'SP_RABEST', INDEX=spraind)         ;find necessary tag
  text = '   This plot has an optional spec-z RA keyword: '  ;text to pass
  IF chk EQ 0 THEN spraind = tagprompt(xdata, text)          ;find necessary tag
  chk = tag_exist(xdata, 'SP_DECBEST', INDEX=spdecind)       ;find necessary tag
  text = '   This plot has an optional spec-z DEC keyword: ' ;text to pass
  IF chk EQ 0 THEN spdecind = tagprompt(xdata, text)         ;find necessary tag
  chk = tag_exist(xdata, 'SP_SPECZBEST', INDEX=spzind)       ;find necessary tag
  text = '   This plot has an optional spec-z keyword: '     ;text to pass
  IF chk EQ 0 THEN spzind = tagprompt(xdata, text)           ;find necessary tag
  

  ;;;create a field 
  angsizes = xoptions.pzangsize                      ;50Kpc at z=1.626
  pzreal = where(xdata.(raind) GE 0.0)               ;find entries with real data
  IF pzreal[0] NE -1 THEN BEGIN                      ;if relevant data
     pzra = xdata[pzreal].(raind)                    ;take RA values
     pzdec = xdata[pzreal].(decind)                  ;take DEC values
     pzint = xdata[pzreal].(phzind)                  ;take photo-z values
  ENDIF                                              ;end relevant
  field_xsize = max(pzra)-min(pzra) + 0.0333         ;find size in 1 dir [deg]
  field_ysize = max(pzdec)-min(pzdec) + 0.0333       ;find size in 2 dir [deg]
  xgrid = fix((field_xsize*3600.0) / (angsizes)) + 1 ;finds int # of xpix
  ygrid = fix((field_ysize*3600.0) / (angsizes)) + 1 ;finds int # of ypix
  grid = dblarr(xgrid, ygrid)                        ;creates array; population grid
  xvals = indgen(xgrid)                              ;create array
  yvals = indgen(ygrid)                              ;create array
  
  
  ;;;get optional specz target info
  IF ((spraind NE -1) AND (spdecind NE -1)) THEN BEGIN
     spzreal = where(xdata.(spraind) GE 0.0)
     IF spzreal[0] NE -1 THEN BEGIN
        spzra = xdata[spzreal].(spraind)
        spzdec = xdata[spzreal].(spdecind)
        IF (spzind NE -1) THEN BEGIN
           spz = xdata[spzreal].(spzind)
           close = where(spz GE xoptions.zmincluster AND (spz LE xoptions.zmaxcluster))
           IF close[0] NE -1 THEN BEGIN
              spzra = spzra[close]
              spzdec = spzdec[close]
              spz = spz[close]
           ENDIF
        ENDIF
     ENDIF
  ENDIF
  
  ;;;create a header
  fxhmake, myhead                                                                 ;create header
  FXADDPAR, myhead, 'BITPIX', -32, ' Bits per pixel- floating point'              ;changes value in header
  FXADDPAR, myhead, 'NAXIS', 2, ' STANDARD FITS FORMAT'                           ;changes value in header
  FXADDPAR, myhead, 'EQUINOX', 2000.0000, ' Mean equinox'                         ;adds value to header
  FXADDPAR, myhead, 'RADECSYS', 'ICRS', ' Astrometric system'                     ;adds value to header
  FXADDPAR, myhead, 'CTYPE1', 'RA---TAN', ' WCS projection type for this axis'    ;adds value to header
  FXADDPAR, myhead, 'CUNIT1', 'deg', 'Axis unit'                                  ;adds value to header
  FXADDPAR, myhead, 'CRVAL1', double(((max(pzra)-min(pzra))/2.0)+min(pzra)), $    ;cont next line
            'World coordinate on this axis'                                       ;adds value to header
  FXADDPAR, myhead, 'CRPIX1', floor(xgrid[0]/2), 'Reference pixel on this axis'   ;adds value to header
  FXADDPAR, myhead, 'CD1_1', angsizes[0]/3600.0, 'Linear projection matrix'       ;adds value to myhead  
  FXADDPAR, myhead, 'CD1_2', 0.000000, 'Linear projection matrix'                 ;adds value to myhead
  FXADDPAR, myhead, 'CTYPE2', 'DEC--TAN', 'WCS projection type for this axis'     ;adds value to myhead
  FXADDPAR, myhead, 'CUNIT2', 'deg', 'Axis unit'                                  ;adds value to myhead
  FXADDPAR, myhead, 'CRVAL2', double(((max(pzdec)-min(pzdec))/2.0)+min(pzdec)), $ ;cont next line
            'World coordinate on this axis'                                       ;adds value to myhead
  FXADDPAR, myhead, 'CRPIX2', floor(ygrid[0]/2), 'Reference pixel on this axis'   ;adds value to myhead
  FXADDPAR, myhead, 'CD2_1', 0.000000, 'Linear projection matrix'                 ;adds value to myhead
  FXADDPAR, myhead, 'CD2_2', angsizes[0]/3600.0, 'Linear projection matrix'       ;adds value to myhead
  

  ;;;fill the grid
  adxy, myhead, pzra, pzdec, xs, ys                                     ;convert RA, Dec to x, y
  xyad, myhead, xvals[0], yvals, tmpplotra, plotdec                     ;find plot values
  xyad, myhead, xvals, floor(ygrid[0]/2), plotra, tmpplotdec            ;find plot values
  grid[xs,ys] = grid[xs,ys] + 1.0*pzint                                 ;populates weight grid
  test = where(grid LT 0.0, ntest)                                      ;test raw prob grid 
  IF test[0] NE -1 THEN print, ' # of negative pixels in grid: ', ntest ;print info

     
  ;;;smooth
  kernel = psf_gaussian(NPIX=25, FWHM=5, /DOUBLE) ;create smoothing kernel
  hind = convolve(grid, kernel, FT_PSF=psf_FT)    ;Smooth the image with the kernel
  

  raref = -60.0*FXPAR(myhead, 'CRVAL1')                                                  ;get ref RA in arcmin
  decref = -60.0*FXPAR(myhead, 'CRVAL2')                                                 ;get ref DEC in arcmin
  w = window(LOCATION=[100+50*xoptions.nwin,25+25*xoptions.nwin], DIMENSIONS=[1000,600]) ;window
  cphotoz = contour(hind, plotra, plotdec, /FILL, /CURRENT, $                            ;contour plot
                    FONT_SIZE = 12, FONT_STYLE=0, $                                      ;
                    XTITLE = 'RA [deg]', $                                               ;
                    XRANGE = [max(plotra), min(plotra)], $                               ;
                    YTITLE = 'Dec [deg]', $                                              ;
                    YRANGE = [min(plotdec), max(plotdec)], $                             ;
                    POSITION = [0.15,0.1,0.75,0.9])                                      ;
  IF ((spraind NE -1) AND (spdecind NE -1)) THEN $                                       ;if possible 
     spzplot = plot(spzra, spzdec, 'rD', /CURRENT, /OVERPLOT, $                          ;plot spec-z locations
                    SYM_SIZE=1.25, SYM_THICK=2.5, AXIS_STYLE=1)                          ;plot option                             
  xaxis = axis('X', LOCATION='top', $                                                    ;another xaxis for plot
               TITLE = '$\Delta$RA [arcmin]', $                                          ;
               COORD_TRANSFORM = [raref, 60.0])                                          ;
  yaxis = axis('Y', LOCATION='right', $                                                  ;another yaxis for the plot
               TITLE = '$\Delta$Dec [arcmin]', $                                         ;
               COORD_TRANSFORM = [decref, 60.0])                                         ;
  cbphotoz = colorbar(TITLE = 'Total Normalized Probability', $                          ;color bar
                      ORIENTATION = 1, $                                                 ;
                      POSITION = [0.90,0.1,0.95,0.9], $                                  ;
                      FONT_SIZE = 12)                                                    ;

  
  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION CMD, xdata, xoptions, RS=rs, SBS=sbs, SUBFOV=subfov


  IF keyword_set(RS) THEN BEGIN
     bit = '  Red-Sequence Color-Magnitdue plot...' ;print info
     magtag = 'PH_CH1MAG'
     coltag = 'PH_ZMCH1'
     emagtag = 'PH_ECH1MAG'
     ecoltag = 'PH_EZMCH1'
     title = 'J0330 Full-FOV Red-Sequence'
     xtitle = 'IRAC Ch1 Magnitude [AB]'
     ytitle = "z' - IRAC Ch1 Magnitude [AB]"
     xrange = [xoptions.rsxmin, xoptions.rsxmax]
     yrange = [xoptions.rsymin, xoptions.rsymax]
     outfile = 'xmm113_rsfullfov_new.jpeg'
  ENDIF
  IF keyword_set(SBS) THEN BEGIN
     bit = '  Stellar Bump Sequence Color-Magnitdue plot...' ;print info
     magtag = 'PH_CH2MAG'
     coltag = 'PH_CH1MCH2'
     emagtag = 'PH_ECH2MAG'
     ecoltag = 'PH_ECH1MCH2'
     title = 'J0330 Full-FOV Stellar Bump Sequence'
     xtitle = 'IRAC Ch2 Magnitude [AB]'
     ytitle = "IRAC Ch1 - IRAC Ch2 Magnitude [AB]"
     xrange = [xoptions.sbsxmin, xoptions.sbsxmax]
     yrange = [xoptions.sbsymin, xoptions.sbsymax]
     outfile = 'xmm113_sbsfullfov_new.jpeg'
     models = {redshift:[2.00000, 3.02500, 5.02500], $
               age:[2.28700, 1.15200, 0.206000], $
               slope:[-0.00593547, -0.00510452, -0.00350796], $
               int:[0.502112, 0.438601, 0.295367]}
     
  ENDIF
  IF keyword_set(SUBFOV) THEN BEGIN  
     tmp = outfile
     strreplace, tmp, 'full', 'sub'
     strreplace, tmp, 'fov', strcompress('fov'+string(subfov))
     outfile = strcompress(tmp, /REMOVE_ALL)
  ENDIF

  ;;;get relevant tags
  print, bit                                           ;print info
  chk = tag_exist(xdata, magtag, INDEX=rsmind)         ;find necessary tag
  text = '   This plot requires a magnitude keyword: ' ;text to pass
  IF chk EQ 0 THEN rsmind = tagprompt(xdata, text)     ;find necessary tag
  chk = tag_exist(xdata, coltag, INDEX=rscind)         ;find necessary tag
  text = '   This plot requires a color keyword: '     ;text to pass
  IF chk EQ 0 THEN rscind = tagprompt(xdata, text)     ;find necessary tag

  chk = tag_exist(xdata, emagtag, INDEX=ersmind)            ;find necessary tag
  text = '   This plot options a magnitude error keyword: ' ;text to pass
  IF chk EQ 0 THEN ersmind = tagprompt(xdata, text)         ;find necessary tag
  chk = tag_exist(xdata, ecoltag, INDEX=erscind)            ;find necessary tag
  text = '   This plot options a color error keyword: '     ;text to pass
  IF chk EQ 0 THEN erscind = tagprompt(xdata, text)         ;find necessary tag

  chk = tag_exist(xdata, 'SP_SPECZBEST', INDEX=spzind)     ;find necessary tag
  text = '   This plot options a spec-z keyword: '         ;text to pass
  IF chk EQ 0 THEN spzind = tagprompt(xdata, text)         ;find necessary tag
  chk = tag_exist(xdata, 'SP_SPECZFLAG', INDEX=qspzind)    ;find necessary tag
  text = '   This plot options a spec-z quality keyword: ' ;text to pass
  IF chk EQ 0 THEN qspzind = tagprompt(xdata, text)        ;find necessary tag

  chk = tag_exist(xdata, 'PH_Z_M2', INDEX=phzind)          ;find necessary tag
  text = '   This plot options a photo-z keyword: '        ;text to pass
  IF chk EQ 0 THEN phzind = tagprompt(xdata, text)         ;find necessary tag

  chk = tag_exist(xdata, 'RAONE', INDEX=raind)             ;find necessary tag
  text = '   This plot options a RA keyword: '             ;text to pass
  IF chk EQ 0 THEN raind = tagprompt(xdata, text)          ;find necessary tag
  chk = tag_exist(xdata, 'DECONE', INDEX=decind)           ;find necessary tag
  text = '   This plot options a DEC keyword: '            ;text to pass
  IF chk EQ 0 THEN decind = tagprompt(xdata, text)         ;find necessary tag
  

  ;;;cut in spatial direction if requested
  IF (keyword_set(SUBFOV) AND (raind[0] NE -1) AND (decind[0] NE -1)) THEN BEGIN                        ;if keyword is set
     CASE subfov OF                                                                                     ;which sub-FOV
        1 : close_match_radec, xoptions.bcgradeg, xoptions.bcgdecdeg, xdata.(raind), xdata.(decind), $  ;cont next line
                               match1, match, (xoptions.wepsilon/(8.615*3600.0)), 99999, miss1, /SILENT ;BCG
        2 : close_match_radec, xoptions.g1radeg, xoptions.g1decdeg, xdata.(raind), xdata.(decind), $    ;cont next line
                               match1, match, (xoptions.wepsilon/(8.615*3600.0)), 99999, miss1, /SILENT ;first sub
        3 : close_match_radec, xoptions.g2radeg, xoptions.g2decdeg, xdata.(raind), xdata.(decind), $    ;cont next line
                               match1, match, (xoptions.wepsilon/(8.615*3600.0)), 99999, miss1, /SILENT ;second sub
        4 : close_match_radec, xoptions.g3radeg, xoptions.g3decdeg, xdata.(raind), xdata.(decind), $    ;cont next line
                               match1, match, (xoptions.wepsilon/(8.615*3600.0)), 99999, miss1, /SILENT ;third sub
        5 : close_match_radec, xoptions.g4radeg, xoptions.g4decdeg, xdata.(raind), xdata.(decind), $    ;cont next line
                               match1, match, (xoptions.wepsilon/(8.615*3600.0)), 99999, miss1, /SILENT ;fourth sub
        ELSE : BEGIN
           print, 'WARNING!! SUBFOV value not recognized!!'
           xdata = xdata
        END
     ENDCASE
     help, match
     xdata = xdata[match]
  ENDIF                             ;end SUBFOV keyword set


  ;;;create flag arrays
  clyes = intarr(n_elements(xdata.(0)))     ;create array
  fiyes = intarr(n_elements(xdata.(0)))     ;create array
  hqyes = intarr(n_elements(xdata.(0)))     ;create array
  mqyes = intarr(n_elements(xdata.(0)))     ;create array
  lqyes = intarr(n_elements(xdata.(0)))     ;create array
  pzyes = intarr(n_elements(xdata.(0)))     ;create array


  ;;;find average error bars
  IF (ersmind NE -1) OR (erscind NE -1) THEN BEGIN
     bins = indgen((xoptions.rsxmax-xoptions.rsxmin)+1) + xoptions.rsxmin
     aveemag = fltarr(n_elements(bins)-2)
     aveecol = fltarr(n_elements(bins)-2)
     FOR xx=1, n_elements(bins)-2, 1 DO BEGIN
        chk = where((xdata.(rsmind) GE (bins[xx]-0.5)) AND (xdata.(rsmind) LT (bins[xx]+0.5)) AND $
                    (xdata.(erscind) GE 0.0) AND (xdata.(erscind) LT 10.0))
        IF chk[0] NE -1 THEN BEGIN
           IF (ersmind NE -1) THEN aveemag[xx-1] = mean(xdata[chk].(ersmind))
           IF (erscind NE -1) THEN aveecol[xx-1] = mean(xdata[chk].(erscind))
        ENDIF
     ENDFOR
  ENDIF

     
  IF (spzind[0] NE -1) THEN BEGIN                                                                       ;if spec-z present
     chk = where((xdata.(spzind) GE xoptions.zmincluster) AND (xdata.(spzind) LE xoptions.zmaxcluster)) ;cluster redshift
     IF (chk[0] NE -1) THEN clyes[chk] = 1                                                              ;flag it
     chk = where(((xdata.(spzind) GE 0.0) AND (xdata.(spzind) LT xoptions.zmincluster)) OR $            ;cont next line
                 ((xdata.(spzind) GT xoptions.zmaxcluster) AND (xdata.(spzind) LE 10.0)))               ;not cluster redshift
     IF (chk[0] NE -1) THEN fiyes[chk] = 1                                                              ;flag it
  ENDIF                                                                                                 ;end spec-z present 

  IF (qspzind NE -1) THEN BEGIN
     chk = where((xdata.(qspzind) EQ 0) OR (xdata.(qspzind) EQ 1)) ;good quality 
     IF (chk[0] NE -1) THEN hqyes[chk] = 1                         ;flag it
     chk = where((xdata.(qspzind) EQ 2))                           ;good quality 
     IF (chk[0] NE -1) THEN mqyes[chk] = 1                         ;flag it
     chk = where((xdata.(qspzind) EQ 3))                           ;good quality 
     IF (chk[0] NE -1) THEN lqyes[chk] = 1                         ;flag it
  ENDIF 
  
  IF (phzind NE -1) THEN BEGIN
     chk = where((xdata.(phzind) GE xoptions.pzmincluster) AND $ ;cont next line
                 (xdata.(phzind) LE xoptions.pzmaxcluster) AND $ ;cont next line
                 (clyes EQ 0) AND (fiyes EQ 0))                  ;cluster redshift
     IF (chk[0] NE -1) THEN pzyes[chk] = 1                       ;flag it
  ENDIF 
  


  ;;;actual plotting
  w = window(LOCATION=[100+50*xoptions.nwin,25+25*xoptions.nwin], DIMENSIONS=[800,600])
  fakexs = [0.0,50.0]          ;fake xs well outside typical domain
  rest = where((clyes EQ 0) AND (fiyes EQ 0) AND (pzyes EQ 0))
  prsfullfov = plot(xdata[rest].(rsmind), xdata[rest].(rscind), /CURRENT, $
                    SYMBOL='x', LINESTYLE='', $
                    TITLE=title, $
                    XTITLE=xtitle, $
                    XRANGE=xrange, $
                    YTITLE= ytitle, $
                    YRANGE=yrange, $
                    TRANSPARENCY=80)
  IF (phzind[0] NE -1) THEN BEGIN
     pz = where(pzyes EQ 1)
     IF (pz[0] NE -1) THEN prsfullfov = plot(xdata[pz].(rsmind), xdata[pz].(rscind), /OVERPLOT, $
                                             SYMBOL='D', LINESTYLE='', COLOR = 'black', SYM_THICK=2, SYM_SIZE=1.5)

  ENDIF
  IF (spzind[0] NE -1) THEN BEGIN
     IF (qspzind NE -1) THEN BEGIN
        fihq = where((fiyes EQ 1) AND (hqyes EQ 1))
        IF (fihq[0] NE -1) THEN prsfullfov = plot(xdata[fihq].(rsmind), xdata[fihq].(rscind), /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'blue', SYM_THICK=3, SYM_SIZE=1.5)
        fimq = where((fiyes EQ 1) AND (mqyes EQ 1))
        IF (fimq[0] NE -1) THEN prsfullfov = plot(xdata[fimq].(rsmind), xdata[fimq].(rscind), /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'blue', SYM_THICK=3, SYM_SIZE=1.0)
        filq = where((fiyes EQ 1) AND (lqyes EQ 1))
        IF (filq[0] NE -1) THEN prsfullfov = plot(xdata[filq].(rsmind), xdata[filq].(rscind), /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'blue', SYM_THICK=3, SYM_SIZE=0.5)
        clhq = where((clyes EQ 1) AND (hqyes EQ 1))
        IF (clhq[0] NE -1) THEN prsfullfov = plot([xdata[clhq].(rsmind)], [xdata[clhq].(rscind)], /OVERPLOT, $
                                                  SYMBOL='s', LINESTYLE='', COLOR = 'red', SYM_THICK=3, SYM_SIZE=1.5)
        clmq = where((clyes EQ 1) AND (mqyes EQ 1))
        IF (clmq[0] NE -1) THEN prsfullfov = plot([xdata[clmq].(rsmind)], [xdata[clmq].(rscind)], /OVERPLOT, $
                                                  SYMBOL='s', LINESTYLE='', COLOR = 'red', SYM_THICK=3, SYM_SIZE=1.0)
        cllq = where((clyes EQ 1) AND (lqyes EQ 1))
        IF (cllq[0] NE -1) THEN prsfullfov = plot([xdata[cllq].(rsmind)], [xdata[cllq].(rscind)], /OVERPLOT, $
                                                  SYMBOL='s', LINESTYLE='', COLOR = 'red', SYM_THICK=3, SYM_SIZE=0.5)
     ENDIF ELSE BEGIN
        fi = where(fiyes EQ 1)
        IF (fi[0] NE -1) THEN prsfullfov = plot(xdata[fi].(rsmind), xdata[fi].(rscind), /OVERPLOT, $
                                                SYMBOL='o', LINESTYLE='', COLOR = 'blue', SYM_THICK=3)
        cl = where(clyes EQ 1)
        IF (cl[0] NE -1) THEN prsfullfov = plot(xdata[cl].(rsmind), xdata[cl].(rscind), /OVERPLOT, $
                                                SYMBOL='s', LINESTYLE='', COLOR = 'red', SYM_THICK=3)
     ENDELSE
  ENDIF

  IF (ersmind NE -1) AND (erscind NE -1) THEN prsfullfov = errorplot(bins[1:-2], replicate(-1.0,n_elements(bins[1:-2])), $
                                                                     aveemag, aveecol, /OVERPLOT, $ ;ERRORBAR_THICK=2, $
                                                                     SYMBOL='.', LINESTYLE='', COLOR = 'green')
  modelline0 = plot(fakexs, (models.slope[0]*(fakexs)+models.int[0]), /OVERPLOT, $
                    LINESTYLE=0, THICK=1.5, NAME=strcompress('$z_f=$'+string(fix(models.redshift[0])), /REMOVE_ALL))
  modelline1 = plot(fakexs, (models.slope[1]*(fakexs)+models.int[1]), /OVERPLOT, $
                    LINESTYLE=1, THICK=1.5, NAME=strcompress('$z_f=$'+string(fix(models.redshift[1])), /REMOVE_ALL))
  modelline2 = plot(fakexs, (models.slope[2]*(fakexs)+models.int[2]), /OVERPLOT, $
                    LINESTYLE=2, THICK=1.5, NAME=strcompress('$z_f=$'+string(fix(models.redshift[2])), /REMOVE_ALL))
  mylegend = legend(TARGET=[modelline0, modelline1, modelline2], POSITION=[xrange[0]+0.1,yrange[1]-0.1], /DATA, $ ;legend
                    SHADOW=0, LINESTYLE=6)                                                                        ;legend options
  
  
  prsfullfov.save, outfile, RESOLUTION=600, /TRANSPARENT

  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION MYDEDICA, xdata, xoptions


  print, '  DEDICA plot...'     ;print info

  chk = tag_exist(xdata, 'SP_SPECZBEST', INDEX=spzbind) ;find necessary tag
  text = '   This plot requires a spec-z keyword: '     ;text to pass
  IF chk EQ 0 THEN spzbind = tagprompt(xdata, text)     ;find necessary tag
  
  
  chk = where((xdata.(spzbind) GE 0.0) AND (xdata.(spzbind) LT 10.0))
  speczs = xdata[chk].(spzbind)
  
  analysis = 1                                                  ;start variable as something
  dedica, speczs, NITERS=25, ANALYZE=analysis ;get stuff

  labels = ['A', 'B', 'C', 'D', 'E', 'F'] ;peak labels
  fakeys = replicate(0.3, n_elements(labels))
  mywin = window(LOCATION=[450,100], DIMENSIONS=[600,600])
  theplot = plot(plotvals.xs, plotvals.ys, LINESTYLE=0, /CURRENT, $
                 THICK=2, $
                 TITLE='XMM113 Adaptive Kernel Reconstruction', $
                 XTITLE='Redshift', $
                 YTITLE='Normalized Probablity', $
                 FONT_SIZE=13)
  FOR xx=0, n_elements(labels)-1, 1 DO BEGIN
     thetext = text([analysis.(5*xx+1)], [fakeys[xx]], labels[xx], DATA=1, FONT_SIZE=14.0) ;add to plot
  ENDFOR

  mwrfits, analysis, 'xmm113_dedica_analysis_v1-0.fits', /CREATE
  
  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION CLUSTERIN, xdata, xauxdata, xoptions

  chk = tag_exist(xdata, 'SP_RABEST', INDEX=spraind)             ;find necessary tag
  text = '   This plot requires an RA keyword: '                 ;text to pass
  IF chk EQ 0 THEN spraind = tagprompt(xdata, text)              ;find necessary tag
  chk = tag_exist(xdata, 'SP_DECBEST', INDEX=spdecind)           ;find necessary tag
  text = '   This plot requires a DEC keyword: '                 ;text to pass
  IF chk EQ 0 THEN spdecind = tagprompt(xdata, text)             ;find necessary tag
  chk = tag_exist(xdata, 'AN_DEDICA', INDEX=dedind)              ;find necessary tag
  text = '   This plot requires a peak identification keyword: ' ;text to pass
  IF chk EQ 0 THEN dedind = tagprompt(xdata, text)               ;find necessary tag
  

  
  ;;;sanity checks
  FOR xx=0, n_elements(xoptions.whichclin)-1, 1 DO BEGIN                             ;loop over peaks
     chk = where(strcompress(xdata.(dedind), /REMOVE_ALL) EQ xoptions.whichclin[xx]) ;find detections guessed for peak
     IF (chk[0] NE -1) THEN subxdata = xdata[chk]

     chk = where((subxdata.(spraind) GE 0.0) AND (subxdata.(spraind) LT 360.0))       ;valid ra range
     IF (chk[0] NE -1) THEN ras = subxdata[chk].(spraind)                             ;get values
     chk = where((subxdata.(spdecind) GE -90.0) AND (subxdata.(spdecind) LT 90.0))    ;valid dec range
     IF (chk[0] NE -1) THEN decs = subxdata[chk].(spdecind)                           ;get values
     

     ;;;biweight estimator of RA, Dec
     mybra = obj_new('beers1990', ras)                                ;new object
     mybra.getprop, VERSION=mybraver                                  ;get version of object
     print, ' Now using Beers et al. 1990 object version: ', mybraver ;print info
     mybramad = mybra.mad()                                           ;median absolute deviation of RA
     mybracbi = mybra.biweight(NITERS=5)                              ;get biweight estimator
     print, median(ras), mybracbi
     
     mybdec = obj_new('beers1990', decs)                               ;new object
     mybdec.getprop, VERSION=mybdecver                                 ;get version of object
     mybdecmad = mybdec.mad()                                          ;median absolute deviation of DEC
     mybdeccbi = mybdec.biweight(NITERS=5)                             ;get biweight estimator
     print, median(decs), mybdeccbi

     ;peakval = 
     
     
  ENDFOR

  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION BPT, xdata, xoptions
  
  print, '  BPT plot...' ;print info

  chk = tag_exist(xdata, 'SP_M_HA_FLUX', INDEX=hafind)    ;find necessary tag
  text = '   This plot requires a Halpha flux keyword: '  ;text to pass
  IF chk EQ 0 THEN hafind = tagprompt(xdata, text)        ;find necessary tag
  chk = tag_exist(xdata, 'SP_M_NIIR_FLUX', INDEX=niifind) ;find necessary tag
  text = '   This plot requires a [NII] flux keyword: '   ;text to pass
  IF chk EQ 0 THEN niifind = tagprompt(xdata, text)       ;find necessary tag


  chk = tag_exist(xdata, 'AN_AGND12', INDEX=iragnind)  ;find necessary tag
  text = '   This plot options a IRAC AGN keyword: '   ;text to pass
  IF chk EQ 0 THEN iragnind = tagprompt(xdata, text)   ;find necessary tag

  print, iragnind

  ;;;find plausible metallicity measurements
  N2 = alog10(xdata.(niifind)/xdata.(hafind)) ;find ratio
  N2chk = where((N2 NE N2) OR (N2 NE 0.0))    ;find any NaNs or zeros
  IF chk[0] NE -1 THEN N2 = N2[N2chk]         ;if present, remove
  fakeys = fltarr(n_elements(N2))             ;create array for fake y values
  fakeys[*] = -0.9                            ;set fake y values


  ;;;find which detections are also IR AGN selected
  IF (iragnind NE -1) THEN iragn = where(xdata[N2chk].(iragnind) EQ 1)
  help, iragn
  
  ;;;get models
  model = kewley_2013(1, 1.5) ;get [NII] related models
  model2 = kewley_2006(1) ;get [NII] SF related models
  model3 = kewley_2006(2) ;get [NII] composite related models
  

  w = window(LOCATION=[100+50*xoptions.nwin,-25+25*xoptions.nwin])
  bptplot = plot([1.0], [1.0], '.', /CURRENT, /NODATA, $
                 XTITLE='log([NII/H$\alpha$])', $
                 XRANGE=[xoptions.bptxmin,xoptions.bptxmax], $
                 YTITLE='log([OIII/H$\beta$])', $
                 YRANGE=[xoptions.bptymin,xoptions.bptymax], FONT_SIZE=14)
  bptplot1 = plot(model.lmixxs, model.lmixys, '-', /OVERPLOT, $
                THICK=2, color='green')
  bptplot1 = plot(model.umixxs, model.umixys, '-', /OVERPLOT, $
                THICK=2, color='green')
  bptplot1 = plot(model.lsfxs, model.lsfys, '-', /OVERPLOT, $
                THICK=2, color='green')
  bptplot1 = plot(model.usfxs, model.usfys, '-', /OVERPLOT, $
                THICK=2, color='green', NAME='Kewley 2013 Scenario 1')
  bptplot2 = plot(model2.xs, model2.ys, '--', /OVERPLOT, $
                THICK=2, color='black', NAME='Kewley 2006 SF')
  bptplot3 = plot(model3.xs, model3.ys, '-', /OVERPLOT, $
                THICK=2, color='black', NAME='Kewley 2006 Comp')
  mydata = plot(N2, fakeys, '|', /OVERPLOT, SYM_SIZE=3)
  IF (iragn[0] NE -1) THEN mydata = plot(N2[iragn], fakeys[iragn], '|', /OVERPLOT, SYM_SIZE=7, SYM_THICK=3, COLOR='red')

  mylegend = legend(TARGET=[bptplot1, bptplot2, bptplot3], $                       ;legend
                    POSITION=[xoptions.bptxmax-1.3,xoptions.bptymax-0.1], /DATA, $ ;legend options
                    SHADOW=0, LINESTYLE=6, FONT_SIZE=11)                           ;legend options

  
  bptplot.save, 'xmm113_bptall_new.eps', RESOLUTION=600, /TRANSPARENT


  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION IRACAGN, xdata, xoptions
  
  print, '  IRAC AGN diagnostic plot...' ;print info


  chk = tag_exist(xdata, 'PH_IRAC1FLUX', INDEX=ch1find)    ;find necessary tag
  text = '   This plot requires a IRAC CH1 flux keyword: ' ;text to pass
  IF chk EQ 0 THEN ch1find = tagprompt(xdata, text)        ;find necessary tag
  chk = tag_exist(xdata, 'PH_IRAC2FLUX', INDEX=ch2find)    ;find necessary tag
  text = '   This plot requires a IRAC CH2 flux keyword: ' ;text to pass
  IF chk EQ 0 THEN ch2find = tagprompt(xdata, text)        ;find necessary tag
  chk = tag_exist(xdata, 'PH_IRAC3FLUX', INDEX=ch3find)    ;find necessary tag
  text = '   This plot requires a IRAC CH3 flux keyword: ' ;text to pass
  IF chk EQ 0 THEN ch3find = tagprompt(xdata, text)        ;find necessary tag
  chk = tag_exist(xdata, 'PH_IRAC4FLUX', INDEX=ch4find)    ;find necessary tag
  text = '   This plot requires a IRAC CH4 flux keyword: ' ;text to pass
  IF chk EQ 0 THEN ch4find = tagprompt(xdata, text)        ;find necessary tag


  chk = tag_exist(xdata, 'AN_AGND12', INDEX=agnind)                      ;find necessary tag
  text = '   This plot options a IR AGN diagnostic keyword: '            ;text to pass
  IF chk EQ 0 THEN agnind = tagprompt(xdata, text)                       ;find necessary tag
  chk = tag_exist(xdata, 'AN_AGNK06', INDEX=elagnind)                    ;find necessary tag
  text = '   This plot options a emission line AGN diagnostic keyword: ' ;text to pass
  IF chk EQ 0 THEN elagnind = tagprompt(xdata, text)                     ;find necessary tag
  chk = tag_exist(xdata, 'SP_SPECZBEST', INDEX=spzfind)                  ;find necessary tag
  text = '   This plot options a redshift keyword: '                     ;text to pass
  IF chk EQ 0 THEN spzfind = tagprompt(xdata, text)                      ;find necessary tag
  chk = tag_exist(xdata, 'SP_SPECZFLAG', INDEX=qspzind)                  ;find necessary tag
  text = '   This plot options a spec-z quality keyword: '               ;text to pass
  IF chk EQ 0 THEN qspzind = tagprompt(xdata, text)                      ;find necessary tag
  

  ;;;create flag arrays for subset
  clyes = intarr(n_elements(xdata.(0)))  ;create array
  fiyes = intarr(n_elements(xdata.(0)))  ;create array
  hqyes = intarr(n_elements(xdata.(0)))  ;create array
  mqyes = intarr(n_elements(xdata.(0)))  ;create array
  lqyes = intarr(n_elements(xdata.(0)))  ;create array
  agnyes = intarr(n_elements(xdata.(0))) ;create array


  ;;;find subsets and fill subset arrarys
  IF (spzfind NE -1) THEN BEGIN
     specz = where((xdata.(spzfind) GE 0.0) AND (xdata.(spzfind) LE 5.0), COMPLEMENT=nospecz) ;has real redshift
     cl = where((xdata[specz].(spzfind) GE xoptions.zmincluster) AND $                        ;cont next line
                (xdata[specz].(spzfind) LE xoptions.zmaxcluster), COMPLEMENT=field)           ;has cluster redshift
     clyes[specz[cl]] = 1                                                                     ;
     fiyes[specz[field]] = 1                                                                  ; 
  ENDIF

  IF (qspzind NE -1) THEN BEGIN
     chk = where((xdata.(qspzind) EQ 0) OR (xdata.(qspzind) EQ 1)) ;good quality 
     IF (chk[0] NE -1) THEN hqyes[chk] = 1                         ;flag it
     chk = where((xdata.(qspzind) EQ 2))                           ;good quality 
     IF (chk[0] NE -1) THEN mqyes[chk] = 1                         ;flag it
     chk = where((xdata.(qspzind) EQ 3))                           ;good quality 
     IF (chk[0] NE -1) THEN lqyes[chk] = 1                         ;flag it
  ENDIF 

  agnyes = where(xdata.(agnind) EQ 1) ;find agn
  elagnyes = where(xdata.(elagnind) EQ 2) ;find agn
  help, elagnyes

  ;;;find plausible metallicity measurements
  xs = alog10(xdata.(ch3find)/xdata.(ch1find)) ;find ratio
  ys = alog10(xdata.(ch4find)/xdata.(ch2find)) ;find ratio
  

  model1 = donley_2012(1)       ;get region populated by AGNs
  

  w = window(LOCATION=[100+50*xoptions.nwin,-25+25*xoptions.nwin])
  iracagnplot = plot([1.0], [1.0], '.', /CURRENT, /NODATA, $
                     XTITLE='log($f_{5.8\mu m}/f_{3.6\mu m}$)', $
                     XRANGE=[xoptions.iracagnxmin,xoptions.iracagnxmax], $
                     YTITLE='log($f_{8.0\mu m}/f_{4.5\mu m}$)', $
                     YRANGE=[xoptions.iracagnymin,xoptions.iracagnymax], FONT_SIZE=14)
  limit1 = plot(model1.xs, model1.ys, '-', /OVERPLOT, THICK=2)
  IF (spzfind NE -1) THEN BEGIN
     nozpoints = plot(xs[nospecz], ys[nospecz], 'o', /OVERPLOT, $
                      COLOR='black', /SYM_FILLED, SYM_SIZE=0.5) 
     IF (qspzind NE -1) THEN BEGIN
        fihq = where((fiyes EQ 1) AND (hqyes EQ 1))
        IF (fihq[0] NE -1) THEN prsfullfov = plot(xs[fihq], ys[fihq], /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'blue', /SYM_FILLED, SYM_SIZE=1.5)
        fimq = where((fiyes EQ 1) AND (mqyes EQ 1))
        IF (fimq[0] NE -1) THEN prsfullfov = plot(xs[fimq], ys[fimq], /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'blue', /SYM_FILLED, SYM_SIZE=1.1)
        filq = where((fiyes EQ 1) AND (lqyes EQ 1))
        IF (filq[0] NE -1) THEN prsfullfov = plot(xs[filq], ys[filq], /OVERPLOT, $
                                                  SYMBOL='o', LINESTYLE='', COLOR = 'blue', /SYM_FILLED, SYM_SIZE=0.7)
        clhq = where((clyes EQ 1) AND (hqyes EQ 1))
        IF (clhq[0] NE -1) THEN prsfullfov = plot([xs[clhq]], [ys[clhq]], /OVERPLOT, $
                                                  SYMBOL='s', LINESTYLE='', COLOR = 'red', /SYM_FILLED, SYM_SIZE=1.5)
        clmq = where((clyes EQ 1) AND (mqyes EQ 1))
        IF (clmq[0] NE -1) THEN prsfullfov = plot([xs[clmq]], [ys[clmq]], /OVERPLOT, $
                                                  SYMBOL='s', LINESTYLE='', COLOR = 'red', /SYM_FILLED, SYM_SIZE=1.1)
        cllq = where((clyes EQ 1) AND (lqyes EQ 1))
        IF (cllq[0] NE -1) THEN prsfullfov = plot([xs[cllq]], [ys[cllq]], /OVERPLOT, $
                                                  SYMBOL='s', LINESTYLE='', COLOR = 'red', /SYM_FILLED, SYM_SIZE=0.7)
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
     agn = plot(xs[agnyes], ys[agnyes], 'X', /OVERPLOT, COLOR = 'green', SYM_THICK=2.0, SYM_SIZE=2.00)
  ENDIF
  IF (elagnind NE -1) THEN BEGIN
     agn = plot(xs[elagnyes], ys[elagnyes], '+', /OVERPLOT, COLOR = 'green', SYM_THICK=2.0, SYM_SIZE=2.50)
  ENDIF

  iracagnplot.save, 'xmm113_iracagn_new.eps', RESOLUTION=600

  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION STACKSPEC, xdata, xoptions
  
  print, '  Stacked Spectra for MZR plot...' ;print info
  ymin = -0.9
  ymax = 2.1
        

  ;;;get emission lines
  speclines, 'balmer', VALS=values
  chk = where((values.lines GT xoptions.wavemin) AND (values.lines LT xoptions.wavemax))
  IF chk[0] NE -1 THEN BEGIN
     names = values.names[chk]
     waves = values.lines[chk]
  ENDIF
  speclines, 'nonbalmer', VALS=values
  chk = where((values.lines GT xoptions.wavemin) AND (values.lines LT xoptions.wavemax))
  IF chk[0] NE -1 THEN BEGIN
     help, values[chk].names
     names = [names,values.names[chk]]
     waves = [waves,values.lines[chk]]
  ENDIF


  w = window(LOCATION=[100+50*xoptions.nwin,-25+25*xoptions.nwin], DIMENSIONS=[800,800])

  ;;;top, left pane
  spdata = mrdfits(xdata[0,0], 1, hdr, /SILENT) ;read in file
  ndata = fxpar(hdr, 'NSTCK')
  avemass = fxpar(hdr, 'STCKMASS')
  eavemass = string(floor(avemass))
  bavemass = string(10^(avemass-eavemass), FORMAT='(F4.2)')
  savemass = strcompress('$\langle M_{*} \rangle$ ='+bavemass + '$\times 10^{'+eavemass+'}$ M$_\Sun$' , /REMOVE_ALL)
  specplot1 = plot(spdata.lambdas, spdata.spec1d, /CURRENT, $
                   XRANGE=[xoptions.wavemin,xoptions.wavemax], $
                   XTICKNAME=replicate('', 6), $
                   YRANGE=[ymin,ymax], $
                   LAYOUT=[2,2,1], POSITION=[0.1,0.5,0.5,0.9])
  xtext1 = text(0.26,0.85,'Cluster Bin 1', FONT_SIZE=11)
  xtext2 = text(0.26,0.83,strcompress('N='+string(ndata), /REMOVE_ALL), FONT_SIZE=11)
  IF (avemass NE 0) THEN xtext3 = text(0.26,0.81, savemass, FONT_SIZE=11)
  FOR xx=0, n_elements(names)-1, 1 DO BEGIN
     specplot1 = plot([waves[xx],waves[xx]], [ymin,ymax], /OVERPLOT, LINESTYLE='--', THICK=1, /DATA, $
                      XMAJOR=specplot1.xmajor, YMAJOR=specplot1.xmajor)
     xtext4 = text(waves[xx]-2, -0.5, names[xx], ORIENTATION=90, FONT_SIZE=10, TARGET=specplot1, /DATA)
  ENDFOR



  ;;;top, right pane
  spdata = mrdfits(xdata[1,0], 1, hdr, /SILENT)
  ndata = fxpar(hdr, 'NSTCK')
  avemass = fxpar(hdr, 'STCKMASS')
  eavemass = string(floor(avemass))
  bavemass = string(10^(avemass-eavemass), FORMAT='(F4.2)')
  savemass = strcompress('$\langle M_{*} \rangle$ ='+bavemass + '$\times 10^{'+eavemass+'}$ M$_\Sun$' , /REMOVE_ALL)
  specplot2 = plot(spdata.lambdas, spdata.spec1d, /CURRENT, $
                   XRANGE=[xoptions.wavemin,xoptions.wavemax], $
                   XTICKNAME=replicate('', 6), $
                   YRANGE=[ymin,ymax], $
                   YTICKNAME=replicate('', 6), $
                   LAYOUT=[2,2,2], POSITION=[0.5,0.5,0.9,0.9])
  xtext1 = text(0.66,0.85,'Cluster Bin 2', FONT_SIZE=11)
  xtext2 = text(0.66,0.83,strcompress('N='+string(ndata), /REMOVE_ALL), FONT_SIZE=11)
  IF (avemass NE 0) THEN xtext3 = text(0.66,0.81, savemass, FONT_SIZE=11)
  FOR xx=0, n_elements(names)-1, 1 DO BEGIN
     emplot2 = plot([waves[xx],waves[xx]], [ymin,ymax], /CURRENT, /OVERPLOT, LINESTYLE='--', THICK=1, /DATA, $
                    XMAJOR=specplot2.xmajor, YMAJOR=specplot2.xmajor)
     xtext4 = text(waves[xx]-2, -0.5, names[xx], ORIENTATION=90, FONT_SIZE=10, TARGET=specplot2, /DATA)
  ENDFOR

  ;;;bottom, left pane
  spdata = mrdfits(xdata[0,1], 1, hdr, /SILENT)
  ndata = fxpar(hdr, 'NSTCK')
  avemass = fxpar(hdr, 'STCKMASS')
  eavemass = string(floor(avemass))
  bavemass = string(10^(avemass-eavemass), FORMAT='(F4.2)')
  savemass = strcompress('$\langle M_{*} \rangle$ ='+bavemass + '$\times 10^{'+eavemass+'}$ M$_\Sun$' , /REMOVE_ALL)
  specplot3 = plot(spdata.lambdas, spdata.spec1d, $
                   /CURRENT, $
                   XRANGE=[xoptions.wavemin,xoptions.wavemax], $
                   YRANGE=[ymin,ymax], $
                   LAYOUT=[2,2,3], POSITION=[0.1,0.1,0.5,0.5])
  xtext = text(0.26,0.45,'Field Bin 1', FONT_SIZE=11)
  xtext = text(0.26,0.43,strcompress('N='+string(ndata), /REMOVE_ALL), FONT_SIZE=11)
  IF (avemass NE 0) THEN xtext = text(0.26,0.41, savemass, FONT_SIZE=11)
  FOR xx=0, n_elements(names)-1, 1 DO BEGIN
     emplot3 = plot([waves[xx],waves[xx]], [ymin,ymax], /OVERPLOT, LINESTYLE='--', THICK=1, /DATA)
     xtext = text(waves[xx]-2, -0.5, names[xx], ORIENTATION=90, FONT_SIZE=10, TARGET=specplot3, /DATA)
  ENDFOR

  ;;;bottom right pane
  spdata = mrdfits(xdata[1,1], 1, hdr, /SILENT)
  ndata = fxpar(hdr, 'NSTCK')
  avemass = fxpar(hdr, 'STCKMASS')
  eavemass = string(floor(avemass))
  bavemass = string(10^(avemass-eavemass), FORMAT='(F4.2)')
  savemass = strcompress('$\langle M_{*} \rangle$ ='+bavemass + '$\times 10^{'+eavemass+'}$ M$_\Sun$' , /REMOVE_ALL)
  specplot4 = plot(spdata.lambdas, spdata.spec1d, $
                   /CURRENT, $
                   XRANGE=[xoptions.wavemin,xoptions.wavemax], $
                   YRANGE=[ymin,ymax], $
                   YTICKNAME=replicate('', 6), $
                   LAYOUT=[2,2,4], POSITION=[0.5,0.1,0.9,0.5])
  xtext1 = text(0.66,0.45,'Field Bin 2', FONT_SIZE=11)
  xtext2 = text(0.66,0.43,strcompress('N='+string(ndata), /REMOVE_ALL), FONT_SIZE=11)
  IF (avemass NE 0) THEN xtext3 = text(0.66,0.41, savemass, FONT_SIZE=11)
  FOR xx=0, n_elements(names)-1, 1 DO BEGIN
     emplot4 = plot([waves[xx],waves[xx]], [ymin,ymax], /OVERPLOT, LINESTYLE='--', THICK=1, /DATA, $
                   XMAJOR=specplot4.xmajor, YMAJOR=specplot4.xmajor)
     xtext4 = text(waves[xx]-2, -0.5, names[xx], ORIENTATION=90, FONT_SIZE=10, TARGET=specplot4, /DATA)
  ENDFOR

 
  xaxtext = text(0.33,0.02,'Rest Frame Wavelength [$\AA$]', FONT_SIZE=15)
  yaxtext = text(0.04,0.36,'Flux [arbitrary units]', FONT_SIZE=15, ORIENTATION=90)
  
  specplot1.save, 'xmm113_stackspec_new.eps', RESOLUTION=600

  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
PRO XMM113_PLOTS, USEFILE=usefile, YOURFILE=yourfile, AUXFILE=auxfile, $
                  SPECZHISTALL=speczhistall, SPECZHISTBCG=speczhistbcg, SPECZHISTG1=speczhistg1, $
                  SPECZDENSITYALL=speczdensityall, $
                  PHOTOZOD=photozod, DEDICA=dedica, CLUSTERIN=clusterin, $
                  BPT=BPT, IRACAGN=iracagn, $
                  MZRINDIV=mzrindiv, MZRSTACK=mzrstack, SPECSTACK=specstack, $
                  RSFULLFOV=rsfullfov, RSSUBFOV=rssubfov, SBSFULLFOV=sbsfullfov, SBSSUBFOV=sbssubfov, $
                  WEPSILON=wepsilon, $

                  ZMINCL=zmincl, ZMAXCL=zmaxcl, ZMING1=zming1, ZMAXG1=zmaxg1, $
                  HISTZMIN=histzmin, HISTZMAX=histzmax, HISTZBINSZ=histzbinsz, $
                  HISTZMINNAR=histzminnar, HISTZMAXNAR=histzmaxnar, HISTZBINSZNAR=histzbinsznar, $
                  HELP=help


;+
; NAME:
;       XMM113_PLOTS()
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
  version = '2-0-0'


  
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

  files = ['/Users/adegroot/research/clusters/xmm/xmm113/catalogs/xmm113_pz_specz_full_v1-2-0.fits'] 

  CASE USEFILE OF
     1 : options.file = files[0]
     2 : options.file = files[1]  
     3 : options.file = files[2] 
     4 : options.file = files[3]
     5 : options.file = files[4]
     6 : options.file = files[5]
     ELSE : BEGIN
        options.file = usefile[0] 
        print, ' You dont like the files we have. Please give one by setting USEFILE=YOURFILE.'
        print, '   ' + files[0] 
        print, '   ' + files[1] 
        print, '   ' + files[2] 
        print, '   ' + files[3] 
        print, '   ' + files[4] 
        stop
     ENDELSE
  ENDCASE
  IF keyword_set(AUXFILE) THEN BEGIN
     CASE AUXFILE OF
        1 : options.auxfile = files[0]
        2 : options.auxfile = files[1]  
        3 : options.auxfile = files[2] 
        4 : options.auxfile = files[3]
        5 : options.auxfile = files[4]
        6 : options.auxfile = files[5]
        ELSE : BEGIN
           options.auxfile = usefile[0] 
           print, ' You dont like the files we have. Please give one by setting USEFILE=YOURFILE.'
           print, '   ' + files[0] 
           print, '   ' + files[1] 
           print, '   ' + files[2] 
           print, '   ' + files[3] 
           print, '   ' + files[4] 
           print, '   ' + files[5] 
           stop
        ENDELSE
     ENDCASE
  ENDIF

  IF keyword_set(WEPSILON) THEN options.wepsilon = wepsilon[0] 


  ;;;read in data
  data = mrdfits(options.file, 1, hdr)         ;read in file
  ndetect = n_elements(data.(0))               ;find number of elements
  IF keyword_set(HELP) THEN help, data, /STRUC ;structure help

  ;;;If another catalog or information is also needed
  IF keyword_set(AUXFILE) THEN BEGIN              ;if keyword is set
     auxdata = mrdfits(options.auxfile, 1, hdr)   ;read in file
     auxndetect = n_elements(auxdata.(0))         ;find number of elements
     IF keyword_set(HELP) THEN help, data, /STRUC ;structure help
  ENDIF                                           ;end keyword set


  ;;;various coordinates and limits
  options.bcgradeg = 15.0*ten(options.bcgrasex) ;convert to decimal
  options.bcgdecdeg = ten(options.bcgdecsex)    ;convert to decimal
  options.g1radeg = 15.0*ten(options.g1rasex)   ;convert to decimal
  options.g1decdeg = ten(options.g1decsex)      ;convert to decimal
  options.g2radeg = 15.0*ten(options.g2rasex)   ;convert to decimal
  options.g2decdeg = ten(options.g2decsex)      ;convert to decimal
  options.g3radeg = 15.0*ten(options.g3rasex)   ;convert to decimal
  options.g3decdeg = ten(options.g3decsex)      ;convert to decimal

  

  ;;;Mass-metallicty relation binned spectra
  IF keyword_set(SPECSTACK) THEN BEGIN ;if
     specs = [['../spectroscopy/stacks/xmm113_spectra_stack_cluster_lowmass_v1-0.fits','../spectroscopy/stacks/xmm113_spectra_stack_cluster_highmass_v1-0.fits'],$
              ['../spectroscopy/stacks/xmm113_spectra_stack_field_lowmass_v1-0.fits','../spectroscopy/stacks/xmm113_spectra_stack_field_highmass_v1-0.fits']]
     chk = stackspec(specs, options)                       ;plot stacked spectra
     IF chk EQ 1 THEN print, '    ...created successfully' ;print info
     options.nwin = options.nwin + 1                       ;up number of windows     
  ENDIF
  

END
;========================================================================================================================
