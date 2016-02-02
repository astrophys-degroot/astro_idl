;========================================================================================================================
pro photoerrors_lok200, band, NAPERS=napers, MARGIN=margin, BUFFER=buffer, $
                        VERBOSE=verbose, HELP=help
  
  
  IF n_params() LT 1 THEN BEGIN
     print, 'syntax: photoerrors_lok200, passband, NAPERS=, MARGIN=, BUFFER=, /VERBOSE, /HELP ]'
     RETURN
  ENDIF
  

  IF keyword_set(NAPERS) THEN napers = napers[0] else napers = 500   ;sets new value
  IF keyword_set(MARGIN) THEN margin = margin[0] else margin = 0.05  ;sets new value
  IF keyword_set(BUFFER) THEN buffer = buffer[0] else buffer = 50    ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  

  spawn, 'mv ../additionalimages/*seg* .'
  spawn, 'mv ../multimap/*resamp_szmulti.fits .'


  IF (band EQ 'swireg') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on SWIRE g' ;print info
  ENDIF                                                    ;end check band value

  IF (band EQ 'swirer') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on SWIRE r' ;print info
  ENDIF                                                    ;end check band value

  IF (band EQ 'swirei') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on SWIRE i' ;print info
  ENDIF                                                    ;end check band value

  IF (band EQ 'sparcsz') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on SpARCS z' ;print info
  ENDIF                                                     ;end check band value
  
  IF (band EQ 'ukidssJ') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on UKIDSS J' ;print info
  ENDIF                                                     ;end check band value
  
  IF (band EQ 'ukidssK') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on UKIDSS K' ;print info
  ENDIF                                                     ;end check band value
  
  IF (band EQ 'servsch1') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on SERVS ch1' ;print info

     image = 'lok200_servsch1_mosaic_v2.0_resamp_szmulti.fits'
     segmap = 'lok200_servsch1_mosaic_v2.0_resamp_szmulti_segmentation.fits'
     values = se_create_sex_lok200_settings('servsch1') ;gets .sex values from SE creation
     apers = values.apers 
     print, apers
     
     FOR XX=3, n_elements(apers)-1, 1 DO BEGIN                      ;start loop over apers
        print, XX
        phot_errors, image, segmap, apers[XX], PARAMS=parameters, $ ;cont next line
                     NAPS=napers, MARGIN=margin                   ;remeasure photo errors
     ENDFOR                                                         ;end loop over apers
     
  ENDIF                                                         ;end check band value
  
  IF (band EQ 'servsch2') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on SERVS ch2' ;print info
  ENDIF                                                      ;end check band value
  
  IF (band EQ 'swirech3') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on SWIRE ch3' ;print info
  ENDIF                                                      ;end check band value
  
  IF (band EQ 'swirech4') OR (band EQ 'all') THEN BEGIN      ;checks band value
     if verbose GE 1 then print, ' Now working on SWIRE ch4' ;print info
  ENDIF                                                      ;end check band value
 

  stop
  spawn, 'mv *seg* ../additionalimages/'
  spawn, 'mv *resamp_szmulti.fits ../multimap/'

  
  stop
  








CASE band OF
     'ch1' : BEGIN
        data = mrdfits(file, 1, hdr)
        data[*].ch1_fluxerr_aper1 = data[*].ch1_flux_aper1*(((data[*].ch1_fluxerr_aper1)/(data[*].ch1_flux_aper1))^2 + $
                                                            (0.007/1.224)^2 + 0.05^2)^0.5
        data[*].ch1_flux_aper1 = data[*].ch1_flux_aper1*8.461595*1.224
        data[*].ch1_fluxerr_aper2 = data[*].ch1_flux_aper2*(((data[*].ch1_fluxerr_aper2)/(data[*].ch1_flux_aper2))^2 + $
                                                            (0.004/1.169)^2 + 0.05^2)^0.5
        data[*].ch1_flux_aper2 = data[*].ch1_flux_aper2*8.461595*1.169
        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END
     'ch2' : BEGIN
        data = mrdfits(file, 1, hdr)
        data[*].ch2_fluxerr_aper1 = data[*].ch2_flux_aper1*(((data[*].ch2_fluxerr_aper1)/(data[*].ch2_flux_aper1))^2 + $
                                                            (0.009/1.275)^2 + 0.05^2)^0.5
        data[*].ch2_flux_aper1 = data[*].ch2_flux_aper1*8.461595*1.275
        data[*].ch2_fluxerr_aper2 = data[*].ch2_flux_aper2*(((data[*].ch2_fluxerr_aper2)/(data[*].ch2_flux_aper2))^2 + $
                                                            (0.006/1.200)^2 + 0.05^2)^0.5
        data[*].ch2_flux_aper2 = data[*].ch2_flux_aper2*8.461595*1.200
        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END

     'ch3' : BEGIN
        data = mrdfits(file, 1, hdr)
        data[*].ch3_fluxerr_aper1 = data[*].ch3_flux_aper1*(((data[*].ch3_fluxerr_aper1)/(data[*].ch3_flux_aper1))^2 + $
                                                            (0.014/1.340)^2 + 0.05^2)^0.5
        data[*].ch3_flux_aper1 = data[*].ch3_flux_aper1*8.461595*1.340
        data[*].ch3_fluxerr_aper2 = data[*].ch3_flux_aper2*(((data[*].ch3_fluxerr_aper2)/(data[*].ch3_flux_aper2))^2 + $
                                                            (0.009/1.237)^2 + 0.05^2)^0.5
        data[*].ch3_flux_aper2 = data[*].ch3_flux_aper2*8.461595*1.237
        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END

     'ch4' : BEGIN
        data = mrdfits(file, 1, hdr)
        data[*].ch4_fluxerr_aper1 = data[*].ch4_flux_aper1*(((data[*].ch4_fluxerr_aper1)/(data[*].ch4_flux_aper1))^2 + $
                                                            (0.012/1.690)^2 + 0.05^2)^0.5
        data[*].ch4_flux_aper1 = data[*].ch4_flux_aper1*8.461595*1.690
        data[*].ch4_fluxerr_aper2 = data[*].ch4_flux_aper2*(((data[*].ch4_fluxerr_aper2)/(data[*].ch4_flux_aper2))^2 + $
                                                            (0.009/1.466)^2 + 0.05^2)^0.5
        data[*].ch4_flux_aper2 = data[*].ch4_flux_aper2*8.461595*1.466
        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END

     'z' : BEGIN
        data = mrdfits(file, 1, hdr)
        frac = data[*].z_fluxerr_aper1 / data[*].z_flux_aper1
        data[*].z_flux_aper1 = -2.5*alog10(data[*].z_flux_aper1) + 31.139
        data[*].z_flux_aper1 = 10.0^(-0.4*(data[*].z_flux_aper1-23.9)) 
        data[*].z_fluxerr_aper1 = frac*data[*].z_flux_aper1
        
        frac = data[*].z_fluxerr_aper2 / data[*].z_flux_aper2
        data[*].z_flux_aper2 = -2.5*alog10(data[*].z_flux_aper2) + 31.139
        data[*].z_flux_aper2 = 10.0^(-0.4*(data[*].z_flux_aper2-23.9)) 
        data[*].z_fluxerr_aper2 = frac*data[*].z_flux_aper2

        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END

     'g' : BEGIN
        data = mrdfits(file, 1, hdr)
        frac = data[*].g_fluxerr_aper1 / data[*].g_flux_aper1
        data[*].g_flux_aper1 = -2.5*alog10(data[*].g_flux_aper1) + 31.697
        data[*].g_flux_aper1 = 10.0^(-0.4*(data[*].g_flux_aper1-23.9)) 
        data[*].g_fluxerr_aper1 = frac*data[*].g_flux_aper1
        
        frac = data[*].g_fluxerr_aper2 / data[*].g_flux_aper2
        data[*].g_flux_aper2 = -2.5*alog10(data[*].g_flux_aper2) + 31.697
        data[*].g_flux_aper2 = 10.0^(-0.4*(data[*].g_flux_aper2-23.9)) 
        data[*].g_fluxerr_aper2 = frac*data[*].g_flux_aper2

        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END

     'r' : BEGIN
        data = mrdfits(file, 1, hdr)
        frac = data[*].r_fluxerr_aper1 / data[*].r_flux_aper1
        data[*].r_flux_aper1 = -2.5*alog10(data[*].r_flux_aper1) + 31.446
        data[*].r_flux_aper1 = 10.0^(-0.4*(data[*].r_flux_aper1-23.9)) 
        data[*].r_fluxerr_aper1 = frac*data[*].r_flux_aper1
        
        frac = data[*].r_fluxerr_aper2 / data[*].r_flux_aper2
        data[*].r_flux_aper2 = -2.5*alog10(data[*].r_flux_aper2) + 31.446
        data[*].r_flux_aper2 = 10.0^(-0.4*(data[*].r_flux_aper2-23.9)) 
        data[*].r_fluxerr_aper2 = frac*data[*].r_flux_aper2

        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END

     'i' : BEGIN
        data = mrdfits(file, 1, hdr)
        frac = data[*].i_fluxerr_aper1 / data[*].i_flux_aper1
        data[*].i_flux_aper1 = -2.5*alog10(data[*].i_flux_aper1) + 30.966
        data[*].i_flux_aper1 = 10.0^(-0.4*(data[*].i_flux_aper1-23.9)) 
        data[*].i_fluxerr_aper1 = frac*data[*].i_flux_aper1
        
        frac = data[*].i_fluxerr_aper2 / data[*].i_flux_aper2
        data[*].i_flux_aper2 = -2.5*alog10(data[*].i_flux_aper2) + 30.966
        data[*].i_flux_aper2 = 10.0^(-0.4*(data[*].i_flux_aper2-23.9)) 
        data[*].i_fluxerr_aper2 = frac*data[*].i_flux_aper2

        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END


     'J' : BEGIN
        data = mrdfits(file, 1, hdr)
        frac = data[*].J_fluxerr_aper1 / data[*].J_flux_aper1
        data[*].J_flux_aper1 = -2.5*alog10(data[*].J_flux_aper1) + 24.495 + 2.4
        data[*].J_flux_aper1 = 10.0^(-0.4*(data[*].J_flux_aper1-23.9)) 
        data[*].J_fluxerr_aper1 = frac*data[*].J_flux_aper1
        
        frac = data[*].J_fluxerr_aper2 / data[*].J_flux_aper2
        data[*].J_flux_aper2 = -2.5*alog10(data[*].J_flux_aper2) + 24.495 + 2.4
        data[*].J_flux_aper2 = 10.0^(-0.4*(data[*].J_flux_aper2-23.9)) 
        data[*].J_fluxerr_aper2 = frac*data[*].J_flux_aper2

        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END

     'K' : BEGIN
        data = mrdfits(file, 1, hdr)
        frac = data[*].K_fluxerr_aper1 / data[*].K_flux_aper1
        data[*].K_flux_aper1 = -2.5*alog10(data[*].K_flux_aper1) + 24.044 + 2.4
        data[*].K_flux_aper1 = 10.0^(-0.4*(data[*].K_flux_aper1-23.9)) 
        data[*].K_fluxerr_aper1 = frac*data[*].K_flux_aper1
        
        frac = data[*].K_fluxerr_aper2 / data[*].K_flux_aper2
        data[*].K_flux_aper2 = -2.5*alog10(data[*].K_flux_aper2) + 24.044 + 2.4
        data[*].K_flux_aper2 = 10.0^(-0.4*(data[*].K_flux_aper2-23.9)) 
        data[*].K_fluxerr_aper2 = frac*data[*].K_flux_aper2

        out = file 
        strreplace, out, 'v1.0', 'v2.0'
        print, out
        mwrfits, data, out, hdr, /CREATE
     END


     ELSE : print, ' Pick a differnt band!!'
  ENDCASE

  

  

end
;========================================================================================================================



;========================================================================================================================
pro swarp_photometry_fillin


  file = 'lok200_photoz_postphotoz_v2.2.fits'
  out = 'lok200_photoz_postphotoz_v2.3.fits'
  
  data = mrdfits(file, 1, hdr)
  help, data
  help, hdr
  tags = tag_names(data[0])
  print, tags
  FOR xx=0, n_elements(tags)-1, 1 DO BEGIN
     chk = where(data[*].(xx) NE data[*].(xx), nchk)
     print, nchk
     if nchk NE 0 then data[chk].(xx) = -99.0
  ENDFOR

  mwrfits, data, out, hdr, /CREATE


end
;========================================================================================================================



;========================================================================================================================
pro swarp_photometry_addphotoz


  file1 = 'lok200_photoz_inputtoeazy_v1.2.fits'
  file2 = 'lok200_photoz_v1.0.fits'
  out = 'lok200_photoz_posteazy_v1.0.fits'
  
  data = mrdfits(file1, 1, hdr1)
  help, data
  help, hdr1
  redshift = mrdfits(file2, 1, hdr2)

  print, min(redshift.(17)), max(redshift.(17))

  add_tag, data, 'photoz', 0.0, data2
  data2[*].photoz = redshift[*].(17)
  mwrfits, data2, out, hdr, /CREATE


  
end
;========================================================================================================================
