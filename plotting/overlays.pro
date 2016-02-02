;========================================================================================================================
pro overlays


  imared = 'lok200_swire_g_wide_conv.fits' ;
  imred = mrdfits(imared, 0, hdred)        ;read in file
  redcheck = size(imred)                   ;check size of image
  print, redcheck

  directory = '/Users/degroota/research/observing/keck/mosfire/2013april22/lok200/catalogs/'
  file = 'sparcs_z_servs_ch1ch2_sbscat_v1.0_lok200_clmem.fits'
  xclmems = strcompress(directory+file, /REMOVE_ALL)

  clmems = mrdfits(xclmems, 1, hdr)
  help, clmems, /STRUC
  help, hdr

  window, 1, XPOS=100, YPOS=100, XSIZE=600, YSIZE=600
  cgimage, imred                ;plot color image
  RGBim = fltarr(redcheck[1], redcheck[2], 3) ;creates new array
  RGBim[*,*,0] = imred         ;sets array values
  RGBim[*,*,1] = imred         ;sets array values
  RGBim[*,*,2] = imred         ;sets array values


  outfile = 'testing_overlays.jpg'
  write_jpeg, outfile, RGBim, TRUE=3, QUALITY=100 ;write image





end
;========================================================================================================================
