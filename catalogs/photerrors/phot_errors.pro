; NAME:
;      phot_errors
;
; PURPOSE:
;      Directly measure variation in background flux and use it to calculate
;      uncertainty in measured magnitudes
;
; EXPLANATION:
;      phot_errors will place a number of randomly-positioned non-overlapping
;      apertures of given radius on the provided image that do not contain
;      any flux in the segmentation map. The flux in these apertures is
;      then measured and fit to a guassian. A historgram is plotted and
;      written to a .ps file.
;      If an input list of magnitudes is provided, phot_errors will also
;      calculate the uncertainty in these magnitudes, assuming they were
;      measured in apertures with the radius provided.
;
; CALLING SEQUENCE:
;     phot_errors, image, segmentation_map, aperture_radius
;     [, numaps, margin, mags, zeropoint, errors]
;
; INPUTS:
;     image            - input image array
;     segmentation_map - source extractor segmentation map of image
;     aperture_radius  - radius of apertures to fit, in pixels
;
; OPTIONAL INPUTS:
;     numaps    - number of apertures to fit
;                 (default 2000)
;     margin    - percent margin of image to exclude on all sides. number between 0 and 0.5
;                 (default 0.1)
;     buffer    - buffer parameter for apfitter (see apfitter.pro)
;     mags      - vector of magnitudes for which to calculate uncertainty
;     zeropoint - magnitude zeropoint of image
;     fluxc     - flux correction factor: all values read from the .fits image will be
;                 multiplied by this coefficient.
;
; OPTIONAL OUTPUTS:
;     errors    - output vector of error bars for input list of
;                 magnitudes
;     params    - output vector of the gaussian fit parameters.
;                 params[0]= the height of the Gaussian
;                 params[1]= the mean
;                 params[2]= the standard deviation
;                 params[3]= the half-width of the 95% conf. interval of the standard
;                     mean
;                 params[4]= 1/(N-1)*total( (y-mean)/sigma)^2 ) = a measure of
;                       normality
;
; NOTES:
;     See also apfitter.pro and bgextract.pro for greater manual control over the process.
;
;     Written 4/29/12 by Ryan Foltz and Alessandro Rettura
;     email: ryan.foltz@email.ucr.edu


;========================================================================================================================
pro phot_errors, image, segmap, aper, $
                 NAPS=naps, margin=margin, mags=mags, zeropoint=zeropoint, $
                 errors=errors, params=params, FLUXCON=fluxcon, noplot=noplot, buffer=buffer, $
                 SKIPAP=skipap, DIRECT=direct 
  
  ON_ERROR, 3
  
  IF n_params() lt 2 THEN BEGIN
     print,'usage: phot_errors, image, segmentation_map, aperture_radius [, numaps=, margin= , mags= , zeropoint= , errors= , params= ,fluxc= , buffer=]'
     RETURN
  ENDIF
  
  if keyword_set(SKIPAP) then skipap = 'Y' else skipap = 'N'           ;sets new value
  if keyword_set(NAPS) then naps = naps[0] else naps = 3000            ;sets new value
  if keyword_set(MARGIN) then margin = margin[0] else margin = 0.05    ;sets new value
  if keyword_set(BUFFER) then buffer = buffer[0] else buffer = 10     ;sets new value
  if keyword_set(FLUXCON) then fluxcon = fluxcon[0] else fluxcon = 1.0 ;sets new value
  if keyword_set(DIRECT) then direct = direct[0] else direct = ' '     ;sets new value
  
  
  ;;;Append directory value to image, segmap
  image = strcompress(direct + image, /REMOVE_ALL)   ;name of image
  segmap = strcompress(direct + segmap, /REMOVE_ALL) ;name of segmap
  
  
  ;;;a little headache saver
  if n_elements(mags) GT 0 && n_elements(zeropoint) EQ 0 then begin
     r=0
     print,'WARNING: Zeropoint is not set. Magnitude errors will not be calculated. Continue anyway? [y/n]'
     while r EQ 0 do begin
        key=get_kbrd()
        if key EQ 'y' then r = 1
        if key EQ 'n' then r = 2
     endwhile
     if r EQ 2 then return
  endif

  ;;;figure out the output filename prefix ; it will be the prefix of the image file
  o = image                     ;copy image qname
  strreplace, o, '.fits', ' '   ;kill suffix
                                ;o = strsplit(image, '.' , /EXTRACT)
                                ;if strmid(image,0,1) eq '.' then o='.'+o
                                ;if strmid(image,1,1) eq '.' then o='.'+o
  output_pathname = strcompress(direct + o[0], /REMOVE_ALL) ;prepend directory
 

  ;;;This section find photometric errors by succesive calls to phot_errors.pro 
  case skipap of                                                                                ;check to create aperture list
     'N' : begin                                                                                ;if yes to create
        print, ' Running full program!!'                                                        ;print info
        apfitter, segmap, naps, aper, margin=margin, ax=xx, ay=yy, $                            ;cont next line
                  output=output_pathname, IMG=image, BUFFER=buffer                              ;find apers 
        print, ' Measuring background flux...'                                                  ;print info
        case keyword_set(noplot) of                                                             ;check NOPLOT keyword
           0 : bgextract, image, aper, x=xx, y=yy, output=output_pathname, params=p, $          ;cont next line
                          zeropoint=zeropoint, mags=mags, errors=errors, fluxc=fluxcon          ;get background
           1 : bgextract, image, aper, x=xx, y=yy, output=output_pathname, params=p, $          ;cont next line
                          zeropoint=zeropoint, mags=mags, errors=errors, fluxc=fluxcon, /noplot ;get background
           else : print, 'Something has gone horribly wrong!!'                                  ;fail safe
        endcase                                                                                 ;end check NOPLOT keyword
        if arg_present(params) then params=p                                                    ;pass param values
     end                                                                                        ;end if yes to creat
     'Y': begin                                                                                 ;if no to create
        print, ' Measuring background flux...'                                                  ;print info
        case keyword_set(noplot) of                                                             ;check NOPLOT keyword
           0 : bgextract, image, aper, x=xx, y=yy, output=output_pathname, params=p, $          ;cont next line
                          zeropoint=zeropoint, mags=mags, errors=errors, fluxc=fluxcon          ;get background
           1 : bgextract, image, aper, x=xx, y=yy, output=output_pathname, params=p, $          ;cont next line
                          zeropoint=zeropoint, mags=mags, errors=errors, fluxc=fluxcon, /noplot ;get background
           else : print, 'Something has gone horribly wrong!!'                                  ;fail safe
        endcase                                                                                 ;end check NOPLOT keyword
        if arg_present(params) then params=p                                                    ;pass param values
     end                                                                                        ;end if no to create
     else : print, 'Something has gone horribly wrong!'                                         ;fail safe
  endcase                                                                                       ;end check to create aper list
  

  
end
;========================================================================================================================
