pro andrew_to_adam	

  field = 'lockman'

  file = strcompress(field + '_zservs_v01.0.0.fits', /REMOVE_ALL)
  detects = MRDFITS(file, 1)
  help, detects, /struc
  
  print, n_elements(detects.(1))
  rar = detects.ra
  decr = detects.dec


  ;;;z' band
  apmag_176 = detects.mag_aper1_76 - 0.533             ;converts AB to Vega
  eapmag_176 = detects.magerr_aper1_76                 ;error
  apmag_366 = detects.mag_aper3_66 - 0.533             ;converts AB to Vega
  eapmag_366 = detects.magerr_aper3_66                 ;error
  mag_best = detects.mag_best - 0.533                  ;converts AB to Vega
  emag_best = detects.magerr_best                      ;error
  
  ;;;IRAC ch1
  detects.flux_aper2_ch1 = detects.flux_aper2_ch1 * 1.02 ;ch1 correction
  
  ch1bf = -2.5*alog10(detects.flux_auto_ch1) + 23.9 - 2.788                                                               ;converts to Vega mag 
  ch1ebap = abs((-2.5*alog10(detects.flux_auto_ch1)) - (-2.5*alog10(detects.flux_auto_ch1+detects.fluxerr_auto_ch1)) )    ;error
  ch1_3pxapc = -2.5*alog10(detects.flux_aper2_ch1) + 23.9 - 2.788                                                         ;converts to Vega mag 
  ch1_3pxerr = abs((-2.5*alog10(detects.flux_aper2_ch1)) - (-2.5*alog10(detects.flux_aper2_ch1+detects.fluxerr_aper2_ch1)) ) ;error
  
  
  ;;;IRAC ch2
  ch2bf = -2.5*alog10(detects.flux_auto_ch2) + 23.9 - 3.255                                                                  ;converts to Vega mag 
  ch2ebap = abs((-2.5*alog10(detects.flux_auto_ch2)) - (-2.5*alog10(detects.flux_auto_ch2+detects.fluxerr_auto_ch2)) )       ;error
  ch2_3pxapc = -2.5*alog10(detects.flux_aper2_ch2) + 23.9 - 3.255                                                            ;converts to Vega mag 
  ch2_3pxerr = abs((-2.5*alog10(detects.flux_aper2_ch2)) - (-2.5*alog10(detects.flux_aper2_ch2+detects.fluxerr_aper2_ch2)) ) ;error
  
  
  
  print, min(rar), max(rar), mean(rar)
  print, min(decr), max(decr), mean(decr)
  print, min(apmag_366), max(apmag_366), mean(apmag_366)
  print, min(ch1bf), max(ch1bf), mean(ch1bf)
  print, min(ch2bf), max(ch2bf), mean(ch2bf)
  print, min(ch2_3pxapc), max(ch2_3pxapc), mean(ch2_3pxapc)

  
  print, n_elements(ch2_3pxerr)
  openw, lun, strcompress(field + '_adamspipeline_v1.0.0.cat', /REMOVE_ALL), /get_lun
  for xx=0UL, n_elements(ch2_3pxerr)-1, 1 do begin
     printf, lun, rar[xx], decr[xx], apmag_176[xx], eapmag_176[xx], apmag_366[xx], eapmag_366[xx], mag_best[xx], emag_best[xx], ch1bf[xx], ch1ebap[xx], $
             ch1_3pxapc[xx], ch1_3pxerr[xx], ch2bf[xx], ch2ebap[xx], ch2_3pxapc[xx], ch2_3pxerr[xx], FORMAT='(16f)'
  endfor
  free_lun, lun
  

end


