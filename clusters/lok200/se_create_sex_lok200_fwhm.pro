;========================================================================================================================
function se_create_sex_lok200_fwhm, xband, VERBOSE=verbose

  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose  = 1 ;sets new value

  CASE xband OF
     'swireg' : BEGIN
        fwhms = [9.48,7.48,6.99,6.91,7.26,6.80,7.02,6.84,6.93,7.00,7.87,6.87]
        fwhm_swireg = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_swireg
     END
     'swirer' : BEGIN
        fwhms = [10.07,7.60,7.71,7.58,7.89,7.64,7.58,8.76,7.84,9.70,7.72]
        fwhm_swirer = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_swirer
     END
     'swirei' : BEGIN
        fwhms = [6.78,7.76,6.47,7.67,6.50,7.07,6.19,6.16]
        fwhm_swirei = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_swirei
     END
     'sparcsz' : BEGIN
        fwhms = [6.34,5.46,4.04,3.95,3.97,3.98,4.08,4.12]
        fwhm_sparcsz = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_sparcsz
     END
     'ukidssJ' : BEGIN
        fwhms = [4.36,4.40,4.37,4.37,4.34,4.21,4.26,4.28,4.32,4.38,4.51,4.41,4.46,$
                 5.77,4.34,4.46]
        fwhm_ukidssj = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_ukidssj
     END
     'ukidssK' : BEGIN
        fwhms = [4.38,4.52,4.53,4.59,4.65,4.62,4.74,4.76,4.66,4.65,4.78,4.74,4.57,$
                 4.66,5.61,4.53,4.76]
        fwhm_ukidssk = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_ukidssk
     END
     'servsch1' : BEGIN
        fwhms = [12.82,10.22,11.12,9.90,12.63,13.10,9.88,9.96,10.14,10.30,10.51, $
                 10.20,10.20,9.88,9.62,10.66,10.09,11.84,9.76,9.96,10.09,9.88]
        fwhm_servsch1 = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_servsch1
     END
     'servsch2' : BEGIN
        fwhms = [13.35,10.22,9.45,9.91,9.80,9.25,11.75,9.73,9.56,9.56,9.10,9.74, $
                 9.96,9.55,9.77,9.29,10.22,9.49,9.39,9.67,10.36,10.20]
        fwhm_servsch2 = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_servsch2
     END
     'swirech3' : BEGIN
        fwhms = [9.44,10.01,10.60,10.60,10.48,10.82,10.01,9.84,9.75,10.43,9.96,10.10,10.19,10.46]
        fwhm_swirech3 = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_swirech3
     END
     'swirech4' : BEGIN
        fwhms = [9.84,13.09,12.16,10.98,12.18,9.38,12.59,11.27,10.84,10.82,14.81,11.69,11.83]
        fwhm_swirech4 = (total(fwhms)-min(fwhms)-max(fwhms)) / float(n_elements(fwhms)-2.0)
        xfwhm = fwhm_swirech4
     END
     ELSE : BEGIN
        if verbose GE 2 THEN print, '  Band not found!!'
     END
  ENDCASE     
  


  return, xfwhm
end
;========================================================================================================================
