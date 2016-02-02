;========================================================================================================================
function se_create_sex_lok400_settings, xband, VERBOSE=verbose
  
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose  = 1 ;sets new value
  fwhm = se_create_sex_lok400_fwhm(xband)
  
  CASE xband OF
     'sparcsz' : BEGIN
        sparcsz = {image:'lok400_sparcsz_mosaic_v2.0_resamp_szmulti.fits', SEXFILE:'lok400_sparcsz_mosaic_v2.0_resamp_szmulti.sex', $
                   OUTFILE:'lok400_sparcsz_mosaic_v2.0_resamp_szmulti_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $
                   FLAGIM:'ln_lok400_multimap_cumprobmap_sqrt_v2.0_FLAG.fits', MINAREA:9, DTHRESH:5.0, ATHRESH:5.0, $
                   FILTER:'N', FNAME:'default.conv', $
                   NDEB:64, DEBMIN:0.000001, CLEAN:'N', CVAL:1.0, $
                   MASK:'NONE', $
                   WTYPE1:'NONE', WIMAGE1:'NONE.fits', $
                   WTYPE2:'MAP_WEIGHT', WIMAGE2:'lok400_sparcsz_mosaic_v2.0_resamp.weight_szmulti.fits', $
                   APERS:[16.22,19.46,2.0^0.5*5,2.0*fwhm], AUTO:[2.5,3.5], PETRO:[2.0,3.5], $
                   SATUR:4792, MAGZERO:0.0, MAGGAM:4.0, GAIN:1.0, PIXSCL:0.185, $
                   FWHM:fwhm, STARNNW:'default.nnw', $
                   BTYPE1:'AUTO', BTYPE2:'AUTO', BPHOTYPE1:'GLOBAL', BPHOTYPE2:'GLOBAL', $
                   BACKSZ:64, BACKFLSZ:3, BACKPHTH:24, BACKVAL:0.0, $
                   ITYPE:['BACKGROUND','OBJECTS','SEGMENTATION'], $
                   INAME:['lok400_sparcsz_mosaic_v2.0_resamp_szmulti_background.fits',$
                         'lok400_sparcsz_mosaic_v2.0_resamp_szmulti_objects.fits', $
                          'lok400_sparcsz_mosaic_v2.0_resamp_szmulti_segmentation.fits'], $
                   MEMOBJ:2000, MEMPIX:300000, MEMBUFF:1024, $
                   SEVERB:'NORMAL', WXML:'Y', XMLFILE:'lok400_sparcsz_mosaic_v2.0_resamp_szmulti.xml'}
        xsetting = sparcsz
     END
     'ukidssK' : BEGIN
        ukidssk = {image:'lok400_ukidssK_mosaic_v2.0_resamp_szmulti.fits', SEXFILE:'lok400_ukidssK_mosaic_v2.0_resamp_szmulti.sex', $
                   OUTFILE:'lok400_ukidssK_mosaic_v2.0_resamp_szmulti_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $
                   FLAGIM:'ln_lok400_multimap_cumprobmap_sqrt_v2.0_FLAG.fits', MINAREA:9, DTHRESH:5.0, ATHRESH:5.0, $
                   FILTER:'N', FNAME:'default.conv', $
                   NDEB:64, DEBMIN:0.000001, CLEAN:'N', CVAL:1.0, $
                   MASK:'NONE', $
                   WTYPE1:'NONE', WIMAGE1:'NONE.fits', $
                   WTYPE2:'MAP_WEIGHT', WIMAGE2:'lok400_ukidssK_mosaic_v2.0_resamp.weight_szmulti.fits', $
                   APERS:[16.22,19.46,2.0^0.5*fwhm,2.0*fwhm], AUTO:[2.5,3.5], PETRO:[2.0,3.5], $
                   SATUR:4792, MAGZERO:0.0, MAGGAM:4.0, GAIN:1.0, PIXSCL:0.185, $
                   FWHM:fwhm, STARNNW:'default.nnw', $
                   BTYPE1:'AUTO', BTYPE2:'AUTO', BPHOTYPE1:'GLOBAL', BPHOTYPE2:'GLOBAL', $
                   BACKSZ:64, BACKFLSZ:3, BACKPHTH:24, BACKVAL:0.0, $
                   ITYPE:['BACKGROUND','OBJECTS','SEGMENTATION'], $
                   INAME:['lok400_ukidssK_mosaic_v2.0_resamp_szmulti_background.fits',$
                          'lok400_ukidssK_mosaic_v2.0_resamp_szmulti_objects.fits', $
                          'lok400_ukidssK_mosaic_v2.0_resamp_szmulti_segmentation.fits'], $
                   MEMOBJ:2000, MEMPIX:300000, MEMBUFF:1024, $
                   SEVERB:'NORMAL', WXML:'Y', XMLFILE:'lok400_ukidssK_mosaic_v2.0_resamp_szmulti.xml'}
        xsetting = ukidssk
     END
     'servsch1' : BEGIN
        servsch1 = {image:'lok400_servsch1_mosaic_v2.0_resamp_szmulti.fits', SEXFILE:'lok400_servsch1_mosaic_v2.0_resamp_szmulti.sex', $
                   OUTFILE:'lok400_servsch1_mosaic_v2.0_resamp_szmulti_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $
                   FLAGIM:'ln_lok400_multimap_cumprobmap_sqrt_v2.0_FLAG.fits', MINAREA:9, DTHRESH:5.0, ATHRESH:5.0, $
                   FILTER:'N', FNAME:'default.conv', $
                   NDEB:64, DEBMIN:0.000001, CLEAN:'N', CVAL:1.0, $
                   MASK:'NONE', $
                   WTYPE1:'NONE', WIMAGE1:'NONE.fits', $
                   WTYPE2:'MAP_WEIGHT', WIMAGE2:'lok400_servsch1_mosaic_v2.0_resamp.weight_szmulti.fits', $
                   APERS:[16.22,19.46,2.0^0.5*fwhm,2.0*fwhm], AUTO:[2.5,3.5], PETRO:[2.0,3.5], $
                   SATUR:4792, MAGZERO:0.0, MAGGAM:4.0, GAIN:1.0, PIXSCL:0.185, $
                   FWHM:fwhm, STARNNW:'default.nnw', $
                   BTYPE1:'AUTO', BTYPE2:'AUTO', BPHOTYPE1:'GLOBAL', BPHOTYPE2:'GLOBAL', $
                   BACKSZ:64, BACKFLSZ:3, BACKPHTH:24, BACKVAL:0.0, $
                   ITYPE:['BACKGROUND','OBJECTS','SEGMENTATION'], $
                   INAME:['lok400_servsch1_mosaic_v2.0_resamp_szmulti_background.fits',$
                          'lok400_servsch1_mosaic_v2.0_resamp_szmulti_objects.fits', $
                          'lok400_servsch1_mosaic_v2.0_resamp_szmulti_segmentation.fits'], $
                   MEMOBJ:2000, MEMPIX:300000, MEMBUFF:1024, $
                   SEVERB:'NORMAL', WXML:'Y', XMLFILE:'lok400_servsch1_mosaic_v2.0_resamp_szmulti.xml'}
        xsetting = servsch1
     END
     'servsch2' : BEGIN
        servsch2 = {image:'lok400_servsch2_mosaic_v2.0_resamp_szmulti.fits', SEXFILE:'lok400_servsch2_mosaic_v2.0_resamp_szmulti.sex', $
                   OUTFILE:'lok400_servsch2_mosaic_v2.0_resamp_szmulti_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $
                   FLAGIM:'ln_lok400_multimap_cumprobmap_sqrt_v2.0_FLAG.fits', MINAREA:9, DTHRESH:5.0, ATHRESH:5.0, $
                   FILTER:'N', FNAME:'default.conv', $
                   NDEB:64, DEBMIN:0.000001, CLEAN:'N', CVAL:1.0, $
                   MASK:'NONE', $
                   WTYPE1:'NONE', WIMAGE1:'NONE.fits', $
                   WTYPE2:'MAP_WEIGHT', WIMAGE2:'lok400_servsch2_mosaic_v2.0_resamp.weight_szmulti.fits', $
                   APERS:[16.22,19.46,2.0^0.5*fwhm,2.0*fwhm], AUTO:[2.5,3.5], PETRO:[2.0,3.5], $
                   SATUR:4792, MAGZERO:0.0, MAGGAM:4.0, GAIN:1.0, PIXSCL:0.185, $
                   FWHM:fwhm, STARNNW:'default.nnw', $
                   BTYPE1:'AUTO', BTYPE2:'AUTO', BPHOTYPE1:'GLOBAL', BPHOTYPE2:'GLOBAL', $
                   BACKSZ:64, BACKFLSZ:3, BACKPHTH:24, BACKVAL:0.0, $
                   ITYPE:['BACKGROUND','OBJECTS','SEGMENTATION'], $
                   INAME:['lok400_servsch2_mosaic_v2.0_resamp_szmulti_background.fits',$
                          'lok400_servsch2_mosaic_v2.0_resamp_szmulti_objects.fits', $
                          'lok400_servsch2_mosaic_v2.0_resamp_szmulti_segmentation.fits'], $
                   MEMOBJ:2000, MEMPIX:300000, MEMBUFF:1024, $
                   SEVERB:'NORMAL', WXML:'Y', XMLFILE:'lok400_servsch2_mosaic_v2.0_resamp_szmulti.xml'}
        xsetting = servsch2
     END
     'swirech3' : BEGIN
        swirech3 = {image:'lok400_swirech3_mosaic_v2.0_resamp_szmulti.fits', SEXFILE:'lok400_swirech3_mosaic_v2.0_resamp_szmulti.sex', $
                   OUTFILE:'lok400_swirech3_mosaic_v2.0_resamp_szmulti_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $
                   FLAGIM:'ln_lok400_multimap_cumprobmap_sqrt_v2.0_FLAG.fits', MINAREA:9, DTHRESH:5.0, ATHRESH:5.0, $
                   FILTER:'N', FNAME:'default.conv', $
                   NDEB:64, DEBMIN:0.000001, CLEAN:'N', CVAL:1.0, $
                   MASK:'NONE', $
                   WTYPE1:'NONE', WIMAGE1:'NONE.fits', $
                   WTYPE2:'MAP_WEIGHT', WIMAGE2:'lok400_swirech3_mosaic_v2.0_resamp.weight_szmulti.fits', $
                   APERS:[16.22,19.46,2.0^0.5*fwhm,2.0*fwhm], AUTO:[2.5,3.5], PETRO:[2.0,3.5], $
                   SATUR:4792, MAGZERO:0.0, MAGGAM:4.0, GAIN:1.0, PIXSCL:0.185, $
                   FWHM:fwhm, STARNNW:'default.nnw', $
                   BTYPE1:'AUTO', BTYPE2:'AUTO', BPHOTYPE1:'GLOBAL', BPHOTYPE2:'GLOBAL', $
                   BACKSZ:64, BACKFLSZ:3, BACKPHTH:24, BACKVAL:0.0, $
                   ITYPE:['BACKGROUND','OBJECTS','SEGMENTATION'], $
                   INAME:['lok400_swirech3_mosaic_v2.0_resamp_szmulti_background.fits',$
                          'lok400_swirech3_mosaic_v2.0_resamp_szmulti_objects.fits', $
                          'lok400_swirech3_mosaic_v2.0_resamp_szmulti_segmentation.fits'], $
                   MEMOBJ:2000, MEMPIX:300000, MEMBUFF:1024, $
                   SEVERB:'NORMAL', WXML:'Y', XMLFILE:'lok400_swirech3_mosaic_v2.0_resamp_szmulti.xml'}
        xsetting = swirech3
     END
     'swirech4' : BEGIN
        swirech4 = {image:'lok400_swirech4_mosaic_v2.0_resamp_szmulti.fits', SEXFILE:'lok400_swirech4_mosaic_v2.0_resamp_szmulti.sex', $
                   OUTFILE:'lok400_swirech4_mosaic_v2.0_resamp_szmulti_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $
                   FLAGIM:'ln_lok400_multimap_cumprobmap_sqrt_v2.0_FLAG.fits', MINAREA:9, DTHRESH:5.0, ATHRESH:5.0, $
                   FILTER:'N', FNAME:'default.conv', $
                   NDEB:64, DEBMIN:0.000001, CLEAN:'N', CVAL:1.0, $
                   MASK:'NONE', $
                   WTYPE1:'NONE', WIMAGE1:'NONE.fits', $
                   WTYPE2:'MAP_WEIGHT', WIMAGE2:'lok400_swirech4_mosaic_v2.0_resamp.weight_szmulti.fits', $
                   APERS:[16.22,19.46,2.0^0.5*fwhm,2.0*fwhm], AUTO:[2.5,3.5], PETRO:[2.0,3.5], $
                   SATUR:4792, MAGZERO:0.0, MAGGAM:4.0, GAIN:1.0, PIXSCL:0.185, $
                   FWHM:fwhm, STARNNW:'default.nnw', $
                   BTYPE1:'AUTO', BTYPE2:'AUTO', BPHOTYPE1:'GLOBAL', BPHOTYPE2:'GLOBAL', $
                   BACKSZ:64, BACKFLSZ:3, BACKPHTH:24, BACKVAL:0.0, $
                   ITYPE:['BACKGROUND','OBJECTS','SEGMENTATION'], $
                   INAME:['lok400_swirech4_mosaic_v2.0_resamp_szmulti_background.fits',$
                          'lok400_swirech4_mosaic_v2.0_resamp_szmulti_objects.fits', $
                          'lok400_swirech4_mosaic_v2.0_resamp_szmulti_segmentation.fits'], $
                   MEMOBJ:2000, MEMPIX:300000, MEMBUFF:1024, $
                   SEVERB:'NORMAL', WXML:'Y', XMLFILE:'lok400_swirech4_mosaic_v2.0_resamp_szmulti.xml'}
        xsetting = swirech4
     END
     ELSE : BEGIN
        if verbose GE 2 THEN print, '  Band not found!!'
     END
  ENDCASE     
  
  


  return, xsetting
end
;========================================================================================================================

