function densitycut, hind, xgrid, ygrid, thresh, SLICE=slice, NBINS=nbins, $
                     VERBOSE=verbose, SCREENP=screenp, WRITEP=writep, OUTDIR=outdir
  
;+
; NAME:
;       DENSITYCUT()
;
; PURPOSE:
;       This function estimates the value of a pixel that would be
;       considered a "cluster" in the density map --before
;       you know where clusters are.  It takes a density map, and then
;       computes what the value of the top 10% of the pixels are.
;       This becomes the cut for a cluster in the P(M) and make final
;       maps programs
;
;       
;
; CALLING SEQUENCE:       
;
; INPUTS:
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
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
;       A. DeGroot, 2012 Nov 19, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 Nov 19, v1.0.0
;


  if keyword_set(NBINS) then nbins = nbins[0] else nbins = 500      ;set new value 
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value


  
  ;;;Set a threshold below which you ignore pixels 
                                ;thresh = 0.05
  pass = where(hind GT thresh, npass)                                   ;find good pixels in prob map
  if verbose ge 3 then print, '   # of pixels above threshold: ', npass ;print info
  pdf = dblarr(npass)                                                   ;make array
  pdf = hind[pass]                                                      ;get values 
   
                                ;pep = 0.0                                                             
                                ;pdf is the vector of different density values above the threshold
                                ;for x = 0, xgrid-1 do begin   ;loop over prob map in x dir
                                ;   for y = 0, ygrid-1 do begin ;loop over prob map in ydir
                                ;      if (hind[x,y] gt thresh) then begin
                                ;         pdf[pep] = hind[x,y]
                                ;         pep = pep + 1.0
                                ;      endif
                                ;   endfor
                                ;endfor
  
  

  ;;;Make the histogram
  scale = (max(pdf)-min(pdf)) / (1.0*nbins)                                                  ;bin size scale
  histy = histogram(pdf, NBINS=nbins)                                                        ;send to histogram to find y vals
  histx = (scale*findgen(nbins)) + min(pdf)                                                  ;get x vals
  maxx = max(histx)                                                                          ;find max x value
  maxy = max(histy[5:n_elements(histy)-1])                                                   ;find max y value
  if verbose ge 3 then begin                                                                 ;check verbose status
     print, '   Maximum value in probabily map: ', maxx                                      ;print info
     print, '   # of pixels in most pop bin in probability map: ', maxy                      ;print info
  endif                                                                                      ;end check verbose status
  if keyword_set(SCREENP) then begin                                                         ;check screenp keyword
     title = 'Density Histogram'                                                             ;set plot title
     window, 3, XPOS=150, YPOS=100, XSIZE=600, YSIZE=600, TITLE=title                        ;set plot window
     plot, histx, histy, PSYM=10, $                                                          ;plot histogram
           COLOR = '000000'XL, $                                                             ;plot option
           BACKGROUND = 'FFFFFF'XL, $                                                        ;plot option
           XRANGE = [0,maxx], $                                                              ;plot option
           YRANGE = [0, 1.5*max(histy[5:n_elements(histy)-1])], $                            ;plot option
           XSTYLE = 1.0, $                                                                   ;plot option
           YSTYLE = 1.0 , $                                                                  ;plot option
           XTITLE = 'Probability Value [arbitrary]', $                                       ;plot option
           YTITLE = 'Number of Galaxies', $                                                  ;plot option
           CHARSIZE = 1.4                                                                    ;plot option
  endif                                                                                      ;end check sreenp keyword
  if keyword_set(WRITEP) then begin                                                          ;check write keyword
     denfileout = strcompress('densitycut_'+string(slice[0])+'.ps', /REMOVE_ALL)             ;file name
     if keyword_set(OUTDIR) then denfileout = strcompress(outdir[0]+denfileout, /REMOVE_ALL) ;file name
     set_plot, 'ps'                                                                          ;set plot type
     device, FILENAME= denfileout                                                            ;set up plot
     plot, histx, histy, PSYM=10, $                                                          ;plot histogram
           COLOR = '000000'XL, $                                                             ;plot option
           BACKGROUND = 'FFFFFF'XL, $                                                        ;plot option
           XRANGE = [0,maxx], $                                                              ;plot option
           YRANGE = [0, 1.5*max(histy[5:n_elements(histy)-1])], $                            ;plot option
           XSTYLE = 1.0, $                                                                   ;plot option
           YSTYLE = 1.0 , $                                                                  ;plot option
           XTITLE = 'Probability Value [arbitrary]', $                                       ;plot option
           YTITLE = 'Number of Galaxies', $                                                  ;plot option
           CHARSIZE = 1.4                                                                    ;plot option
     device, /CLOSE                                                                          ;close plot
     set_plot, 'x'                                                                           ;reset plot typ
  endif                                                                                      ;end check write keyword
  pdf = pdf[sort(pdf)]                                                                       ;sort prob map values
  percent = long64((n_elements(pdf)*1.0)/(10.0))                                             ;create array
  topten = fltarr(percent)                                                                   ;create array
  topten = pdf[(n_elements(pdf)-percent-1):n_elements(pdf)-1]                                ;fill array
  if verbose ge 2 then print, '   Value for top 10 percent: ', min(topten)                   ;print info
  
  return, min(topten)           ;return value
  print, ' '                    ;spacer
end
