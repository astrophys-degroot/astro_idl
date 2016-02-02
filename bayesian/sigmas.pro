;===================================================================================================
function sigmas, abcissa, pdf, LEVELS=levels, PERCENTS=percents, CDFDIST=cdfdist, PLOTS=plots, $
                 WRITEGRAPH=writegraph, NORMALIZE=normalize

  if keyword_set(LEVELS) then levels = levels[0] else levels = 1 ;sets new value
  
  normalize = int_tabulated(abcissa, pdf)                              ;checks normalization
  IF keyword_set(NORMALIZE) THEN pdf = pdf / normalize                 ;renormalizes anyways
  cdf = total(pdf*double(abcissa[1]-abcissa[0]), /DOUBLE, /CUMULATIVE) ;creates cdf
  
  if keyword_set(CDFDIST) EQ 0 then begin                                     ;check CDFDIST keyword
     if keyword_set(LEVELS) then begin                                        ;check LEVELS keyword
        case levels of                                                        ;check value of levels
           1 : sigmas = dblarr(2 + 2*n_elements(percents))                    ;creates array
           2 : sigmas = dblarr(4 + 2*n_elements(percents))                    ;creates array
           3 : sigmas = dblarr(6 + 2*n_elements(percents))                    ;creates array
           4 : sigmas = dblarr(8 + 2*n_elements(percents))                    ;creates array
           5 : sigmas = dblarr(10 + 2*n_elements(percents))                   ;creates array
           else : print, ' Value of levels not available. Please choose 1-5!' ;print info
        endcase                                                               ;end check value of levels
     endif else begin                                                         ;end check LEVELS keyword 
        sigmas = dblarr(6 + 2*n_elements(percents))                           ;creates array
     endelse                                                                  ;end alt to LEVELS keyword
     
     mean =  min(double(cdf-0.50), /ABSOLUTE, submean)          ;finds average value
     if levels ge 1 then begin                                  ;if only want 1 sigma
        sigma = min(double(cdf-0.158655254), /ABSOLUTE, submin) ;finds lower value
        lowerx = submin                                         ;save subscript of 1sig place
        sigmas[0] = abs(abcissa[submean] - abcissa[submin])     ;sets value
        sigma = min(double(cdf-0.841344746), /ABSOLUTE, submin) ;finds upper value
        upperx = submin                                         ;save subscript of 1sig place
        sigmas[1] = abs(abcissa[submean] - abcissa[submin])     ;sets value
     endif                                                      ;end if only want 1 sigma
     
     if levels ge 2 then begin                                  ;if only want 2 sigma
        sigma = min(double(cdf-0.022750132), /ABSOLUTE, submin) ;finds lower value
        sigmas[2] = abs(abcissa[submean] - abcissa[submin])     ;sets value
        sigma = min(double(cdf-0.977249868), /ABSOLUTE, submin) ;finds upper value
        sigmas[3] = abs(abcissa[submean] - abcissa[submin])     ;sets value
     endif                                                      ;end if only want 2 sigma

     if levels ge 3 then begin                                    ;if only want 3 sigma
        sigma = min(double(cdf-0.00133498985), /ABSOLUTE, submin) ;finds lower value
        sigmas[4] = abs(abcissa[submean] - abcissa[submin])       ;sets value
        sigma = min(double(cdf-0.9986501015), /ABSOLUTE, submin)  ;finds upper value
        sigmas[5] = abs(abcissa[submean] - abcissa[submin])       ;sets value
     endif                                                        ;end if only want 3 sigma
     
     if levels ge 4 then begin                                   ;if only want 4 sigma
        sigma = min(double(cdf-0.0000316715), /ABSOLUTE, submin) ;sets value
        sigmas[6] = abs(abcissa[submean] - abcissa[submin])      ;finds lower value
        sigma = min(double(cdf-0.9999683285), /ABSOLUTE, submin) ;sets value
        sigmas[7] = abs(abcissa[submean] - abcissa[submin])      ;finds upper value
     endif                                                       ;end if only want 4 sigma
     
     if levels eq 5 then begin                                  ;if only want 5 sigma
        sigma = min(double(cdf-0.000000287), /ABSOLUTE, submin) ;sets value
        sigmas[8] = abs(abcissa[submean] - abcissa[submin])     ;finds lower value
        sigma = min(double(cdf-0.999999713), /ABSOLUTE, submin) ;sets value
        sigmas[9] = abs(abcissa[submean] - abcissa[submin])     ;finds upper value
     endif                                                      ;end if only want 5 sigma

  endif                         ;end check CDFDIST keyword
  



  if keyword_set(PLOTS) then begin
     ;;;plots non-cdf
     xpoly = [abcissa[lowerx], abcissa[lowerx:upperx], abcissa[upperx]]
     ypoly = [!Y.CRange[0], pdf[lowerx:upperx], !Y.CRange[0]]
     window, 0, XPOS=500, YPOS=200, XSIZE=600, YSIZE=600
     plot, abcissa, pdf, LINESTYLE=0, $
           COLOR = '000000'XL, $
           BACKGROUND = 'FFFFFF'XL, $
           XTITLE = 'Values', $
           YTITLE = 'Probability', $
           CHARSIZE = 1.4, $
           THICK = 1.8
     polyfill, xpoly, ypoly, COLOR='FF0000'XL, /DATA
     plot, abcissa, pdf, COLOR='000000'XL, CHARSIZE = 1.4, /NoData, /NoErase

     if keyword_set(WRITEGRAPH) then begin
        loadct, 13
        set_plot, 'ps'
        device, FILENAME='hw2_prob3.ps', /COLOR
        plot, abcissa, pdf, LINESTYLE=0, $
              COLOR = '000000'XL, $
              BACKGROUND = 'FFFFFF'XL, $
              XTITLE = 'Values', $
              YTITLE = 'Probability', $
              CHARSIZE = 1.4, $
              THICK = 1.8
        polyfill, xpoly, ypoly, COLOR=50, /DATA
        plot, abcissa, pdf, COLOR='000000'XL, CHARSIZE = 1.4, /NoData, /NoErase
        device, /CLOSE
        set_plot, 'x'
     endif

     ;;;plots cdf
     window, 1, XPOS=550, YPOS=150, XSIZE=600, YSIZE=600
     plot, abcissa, cdf, LINESTYLE=0, $
           COLOR = '000000'XL, $
           BACKGROUND = 'FFFFFF'XL, $
           XTITLE = 'Values', $
           YTITLE = 'Probability', $
           CHARSIZE = 1.4, $
           THICK = 1.8
  endif


  if keyword_set(CDFDIST) then return, cdf else return, sigmas

end
;===================================================================================================


