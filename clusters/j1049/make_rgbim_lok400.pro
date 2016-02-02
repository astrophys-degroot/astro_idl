;========================================================================================================================
pro make_rgbim_lok400



  imablu = 'lok400_sparcsz_mosaic_v1.0_conv.fits'
  imagre = 'lok400_ukidssK_mosaic_v1.0_conv.fits'
  imared = 'lok400_servsch1_mosaic_v1.0_conv.fits'
                                ;reg = ['lok200_photoz_postphotoz_v2.2_subset2.reg', 'sparcs_z_servs_ch1ch2_sbscat_v1.0_lok200_clmem_wcs2.reg']
                                ;regdir = ['../photozs/', '/Users/degroota/research/observing/keck/mosfire/2013april22/lok200/catalogs/']
                                ;regcol = ['FFFFFF'XL, 'FFFF00'XL]
                                ;regcol = ['WHITE', 'BLUE']
  
                                ;verbose = 3
                                ;out = 'en1709_rgbim_gzch1_v1.0.ps'

  
  ;RGBim = make_rgbim(imared, imagre, imablu, OUTFILE=out, VERBOSE=verbose, /BACKYES, /GRAPHIT, /WRTMETA)
  

  ;;;SERVS ch1 FWHM: 2.862 pixels
  ;;;SpARCS z FWHM: 4.385 pixels
  ;;;UKIDSS K FWHM: something wrong with reading image in IRAF assuming same as zband
  ;convol = [1.352, 9.282, 9.282]
  ;RGBim = make_rgbim(imared, imagre, imablu, OUTFILE=out, VERBOSE=verbose, CONVOL=convol, /GRAPHIT, /WRTMETA)
  
  
  RGBim = make_rgbim(imared, imagre, imablu, OUTFILE=out, VERBOSE=verbose, /WRTMETA, WRITEP=2, $ ;cont next line
                     AS=[15.0, 50.0, 10.0], BS=[-0.2, -5.0, -2.0], CS=[350.0, 85.0, 90.0])
  

end
;========================================================================================================================
