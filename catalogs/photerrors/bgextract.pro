; NAME:
;     bgextract
; PURPOSE:
;     Measure the flux in a provided list of apertures and fit to a gaussian.
; EXPLANATION:
;     bgextract inputs an image and a list of apertures in either vector x,y format,
;     or as an aperture list .txt file, measures the flux within the apertures,
;     fits the flux to a gaussian, plots a histogram, and optionally writes the histogram to
;     a file.
;     Given an input vector of magnitudes measured within the radius provided,
;     bgextract will also calculate the uncertainties in these magnitudes.
; CALLING SEQUENCE:
;     bgextact, image, aperture_radius{, x=,y= | aplist=}
;     [, numaps=, margin=, mags=, zeropoint=, errors=, /noplot]
; INPUTS:
;     image            - input image array
;     aperture_radius  - size of aperture radius, in pixels
;                        if set to 0, bgextract will measure the per-pixel variation
;     x, y             - vectors specifying the x,y coordinates of the apertures
;           -OR-
;     aplist           - .txt file listing x,y coordinates of apertures
; OPTIONAL INPUTS:
;     output    - filename prefix for hisogram .ps file
;     mags      - vector of magnitudes for which to calculate uncertainty
;     zeropoint - magnitude zeropoint of image
;     fluxc     - multiply all .fits values by this flux coefficient
; OPTIONAL INPUT KEYWORDS:
;     noplot    - disable histogram plot output
; OPTIONAL OUTPUTS:
;     errors    - output vector of error bars for input list of magnitudes
;     params    - output vector of the gaussian fit parameters.
;                 params[0]= the height of the Gaussian
;                 params[1]= the mean
;                 params[2]= the standard deviation
;                 params[3]= the half-width of the 95% conf. interval of the standard
;                     mean
;                 params[4]= 1/(N-1)*total( (y-mean)/sigma)^2 ) = a measure of
;                       normality
;
;     Modified 11/42/2013 by Andrew DeGroot
;      -Added functionality for SWARPED images ie ignoring non-image areas
;     Written 4/29/12 by Ryan Foltz and Alessandro Rettura
;     email: ryan.foltz@email.ucr.edu


; functions to calculate the upper and lower error bars
; on a magnitude, given a magnitude, zeropoint, and delta flux

;========================================================================================================================
FUNCTION magplus, m, deltf, zeropoint
  
  RETURN, zeropoint-2.5*Alog10(10^((zeropoint-m)/2.5)-deltf)-m
END
;========================================================================================================================


;========================================================================================================================
FUNCTION magminus, m, deltf, zeropoint
    
  RETURN, -(zeropoint-2.5*Alog10(10^((zeropoint-m)/2.5)+deltf)-m)
END
;========================================================================================================================



;========================================================================================================================
PRO bgextract, imagefile, inrad, x=x, y=y, aplist=aplist, params=params, output=output,$
               mags=mags, zeropoint=zeropoint, errors=errors, noplot=noplot, fluxc=fluxc
  
  ON_ERROR, 1

    if n_params() lt 2 then begin
        print,'syntax: bgextract, imagefile, aperture_radius{, aplist=aplist || x=x_vector,y=y_vector}[, output=file_prefix,'
        print,'mags= , zeropoint= , errors= , params= ,fluxc= ]'
        return
    endif

    if n_elements(aplist) eq 0 and (n_elements(x)+n_elements(y)) lt 2 then begin
        print,'no aperture list or x,y vectors provided. quitting...'
        return
    endif
    if n_elements(aplist) ne 0 then begin
        readcol,aplist,x,y,radii,format='f'
    endif

    image = readfits(imagefile, head, /SILENT)                       ;read in image
    IF inrad GT 2 THEN BEGIN                                         ;if aper value is large enough
       aper, image, x, y, flux, eflux, sky, skyerr, 1, [inrad], $    ;cont next line
             [0,1], [-5000,5000], /FLUX, /SILENT, SETSKYVAL=0        ;call aper routine
    ENDIF ELSE BEGIN                                                 ;if aper value not large enough
       IF inrad NE 0 THEN BEGIN $                                    ;check aper value is not zero 
          aper, image, x, y, flux, eflux, sky, skyerr, 1, [inrad], $ ;cont next line
          [0,1], [-5000,5000], /FLUX, /SILENT, /EXACT, SETSKYVAL=0   ;call aper routine
       ENDIF ELSE $                                                  ;if aper value is zero
          flux = image[x,y]                                          ;take image flux?
    ENDELSE                                                          ;end aper routine not large enough
    
    
    if n_elements(fluxc) GT 0 then flux = flux*fluxc ;multiply by flux conversion
    
    if keyword_set(noplot) then begin
       histogauss, flux, parameters, xx, yy, gx, gy, $
                   ;COLOR = '000000'XL, $
                   ;BACKGROUND = 'FFFFFF'XL, $
                   CHARSIZE = 1.6, $
                   XTITLE = 'aperture flux [count/s]', $
                   YTITLE = 'number', $
                   /NOPLOT
    endif else begin
       window, 1, XPOS=150, YPOS=150, XSIZE=600, YSIZE=600
       histogauss, flux, parameters, xx, yy, gx, gy, $ 
                   ;COLOR = '000000'XL, $
                   ;BACKGROUND = 'FFFFFF'XL, $
                   CHARSIZE = 1.6, $
                   XTITLE = 'aperture flux [count/s]', $
                   YTITLE = 'number'
    endelse
    

    IF keyword_set(output) THEN BEGIN                                               ;check output keyword
       filename = strcompress(output+'_backhist_'+string(inrad)+'.ps', /REMOVE_ALL) ;create filename
       set_plot, 'ps'                                                               ;set plot environ
       device, FILENAME=filename                                                    ;open device
       histogauss, flux, parameters, xx, yy, gx, gy, $                              ;plot back aper values
                   CHARSIZE=1.2, $                                                  ;plot options
                   XTITLE = 'aperture flux [count/s]', $                            ;plot options
                   YTITLE = 'number'                                                ;plot options
       device, /CLOSE                                                               ;close device
       set_plot, 'x'                                                                ;reset plot environ
    ENDIF                                                                           ;end check output keyword
    
    if arg_present(params) then params = parameters
    print, 'mean: '+strtrim(parameters[1],2)+' +/- '+strtrim(parameters[3],2)
    print, 'sigma: '+strtrim(parameters[2],2)
    
    ;draw the diagnostic plot
    if n_elements(zeropoint) gt 0 then begin
        usersym, [-1,1], [0,0],thick=2
        window, 2, XPOS=175, YPOS=175, XSIZE=600, YSIZE=600

        range=indgen(min([16,zeropoint-14]))+15

        mp=magplus(range,parameters[2],zeropoint)
        mm=magminus(range,parameters[2],zeropoint)

        plot,range,mp,psym=8,xrange=[14.5,min([30,zeropoint])+0.5],yrange=[min(mp)*0.5,max(mm)*1.1],ystyle=1,xstyle=1,position=[0.1,0.5,0.95,0.9],/ylog,title='Magnitude Errors',xtickformat="(A1)"
        for i=0,size(range,/n_elements)-1 do begin
            plots,[range[i],range[i]],[min(mp)*0.5,mp[i]],linestyle=1,/data
        endfor
        plot,range,mm,psym=8,xrange=[14.5,min([30,zeropoint])+0.5],yrange=[max(mm)*1.1,min(mp)*0.5],ystyle=1,xstyle=1,position=[0.1,0.1,0.95,0.5],/ylog,/noerase
        for i=0,size(range,/n_elements)-1 do begin
            plots,[range[i],range[i]],[min(mp)*0.5,mm[i]],linestyle=1,/data
        endfor

        xyouts, 0.02, 0.4, 'Error (mag)', orientation=90, /normal, charsize=1.25, $    ;print on plot
                COLOR = '000000'XL                                                     ;print option
        xyouts, 0.5, 0.02, 'Magnitude', /normal, charsize=1.25, $                      ;print on plot
                COLOR = '000000'XL                                                     ;print option
        xyouts, 0.12, 0.85, 'Aperture radius: '+strtrim(inrad,2)+' pixels', /normal, $ ;print on plot
                COLOR = '000000'XL                                                     ;print option
        
        if n_elements(output) gt 0 then begin
            ps_start,filename=output+'_diagnostic_chart.ps'

            plot,range,mp,psym=8,xrange=[14.5,min([30,zeropoint])+0.5],yrange=[min(mp)*0.5,max(mp)*1.5],ystyle=1,xstyle=1,position=[0.1,0.5,0.95,0.9],/ylog,title='Magnitude Errors',xtickformat="(A1)",charsize=0.75
            for i=0,size(range,/n_elements)-1 do begin
                plots,[range[i],range[i]],[min(mp)*0.5,mp[i]],linestyle=1,/data
            endfor
            plot,range,mm,psym=8,xrange=[14.5,min([30,zeropoint])+0.5],yrange=[max(mm)*1.5,min(mp)*0.5],ystyle=1,xstyle=1,position=[0.1,0.1,0.95,0.5],/ylog,/noerase,charsize=0.75
            for i=0,size(range,/n_elements)-1 do begin
                plots,[range[i],range[i]],[min(mp)*0.5,mm[i]],linestyle=1,/data
            endfor
            xyouts,0.02,0.4,'Error (mag)',orientation=90,/normal,charsize=1.25
            xyouts,0.45,0.02,'Magnitude',/normal,charsize=1.25
            xyouts,0.12,0.85,'Aperture radius: '+strtrim(inrad,2)+' pixels',/normal,charsize=0.75
            ps_end
        endif

    endif

    if n_elements(mags) gt 0 then begin

        if n_elements(zeropoint) EQ 0 then begin
            print,'ERROR: You must provide a zero point for uncertainty calculations. Quitting...'
        return
        endif

        for i=0,size(mags,/n_elements)-1 do begin

            plus=magplus(mags[i] ,parameters[2],zeropoint)
            minus=magminus(mags[i],parameters[2],zeropoint)

            print,strtrim(i,2)+': magnitude: '+strtrim(mags[i],2)$
            +' +'+strtrim(plus,2)+' -'+strtrim(minus,2)

            if arg_present(errors) then begin
                if n_elements(errors) eq 0 then errors = [[plus,minus]] $
                else errors = [[errors],[plus,minus]]
            endif
        endfor

    endif
end
;========================================================================================================================








