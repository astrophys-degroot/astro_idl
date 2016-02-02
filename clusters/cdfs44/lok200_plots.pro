;========================================================================================================================
PRO LOK200_PLOTS, FILE=file, ALL=all, SPECZHIST=speczhist, $
                  RS_FULLFOV=rs_fullfov, RS_SUBFOV0=rs_subfov0, RS_SUBFOV1=rs_subfov1


;+
; NAME:
;       LOK200_PLOTS()
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
;-
  version = '1-0-0'


  ;;;read in file
  IF keyword_set(FILE) THEN file = file[0] ELSE file = '/Users/adegroot/research/clusters/lockman/lok200/catalogs/spectrscopic/lok200_MOSFIRE_specz_v1-1.fits'  
  print, file
  data = mrdfits(file, 1, hdr)
  nwin = 1

  ;;;various coordinates
  hst1rasex = '10:53:53.0'
  hst1decsex = '+58:05:00.0'
  hst1radec = 15.0*ten(hst1rasex)
  hst1decdec = ten(hst1decsex)
 
  zmincluster1 = 1.640
  zmaxcluster1 = 1.660
  zmincluster2 = 2.045
  zmaxcluster2 = 2.055

 
  ;;;histogram of spec-z's
  IF keyword_set(SPECZHIST) OR keyword_set(ALL) THEN BEGIN
     print, '  Histogram of spectroscopically confirmed members...'
     zmin = 0.5
     zmax = 3.5
     zbinsz = 0.1
     zminnar = 1.61
     zmaxnar = 1.69
     zbinsznar = 0.005
     zminnar2 = 2.01
     zmaxnar2 = 2.09
     zbinsznar2 = 0.005
     pdf = histogram(data.z, LOCATIONS=xbin, MIN=zmin, MAX=zmax, BINSIZE=zbinsz)
     pdfnarrow = histogram(data.z, LOCATIONS=xbinnarrow, MIN=zminnar, MAX=zmaxnar, BINSIZE=zbinsznar)
     pdfnarrow2 = histogram(data.z, LOCATIONS=xbinnarrow2, MIN=zminnar2, MAX=zmaxnar2, BINSIZE=zbinsznar2)
     help, pdf
     w = window(LOCATION=[100+50*nwin,25+25*nwin])
     phistspecz = PLOT(xbin, pdf, /CURRENT, /STAIRSTEP, $
                       FONT_SIZE = 14, $
                       TITLE='Spectroscopic Redshift Distribution', $
                       XTITLE='Redshift', $
                       XRANGE=[zmin,zmax], $
                       YTITLE='Number', $
                       MAX_VALUE=60, $
                       COLOR='blue', THICK=2.0)
     phistspeznar = PLOT(xbinnarrow, pdfnarrow, /CURRENT, /STAIRSTEP, $
                         FONT_SIZE = 12, $
                         XTITLE='Redshift', $
                         XRANGE=[zminnar, zmaxnar], $
                         YTITLE='Number', $
                         MAX_VALUE=60, $
                         COLOR='blue', THICK=2.0, $
                         POSITION=[0.24,0.6,0.48,0.84])
     phistspeznar = PLOT(xbinnarrow2, pdfnarrow2, /CURRENT, /STAIRSTEP, $
                         FONT_SIZE = 12, $
                         XTITLE='Redshift', $
                         XRANGE=[zminnar2, zmaxnar2], $
                         YTITLE='Number', $
                         MAX_VALUE=60, $
                         COLOR='blue', THICK=2.0, $
                         POSITION=[0.65,0.6,0.88,0.84])
     nwin++                     ;up number of windows
  ENDIF

  



END
;========================================================================================================================
