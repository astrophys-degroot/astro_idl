;========================================================================================================================
pro csnr, im, imhead, cat, APER=aper

  help, im, /STRUC
  help, imhead
  help, cat
  
  
  adxy, imhead, cat.ra_1, cat.dec_1, xpos_1, ypos_1
  aper, im, xpos_1, ypos_1, mags, errap, sky, skyerr, 1, aper, [10,100], [0,0], $
        SETSKYVAL=0.0, /FLUX, /SILENT, PRINT='checkaper.dat'
        
        

                                ;apar = (!pi*aper[0]^2)
                                ;invapar = 1.0 / (!pi*aper[0]^2)
  print, min(mags), max(mags), mean(mags), stdev(mags)
  check = where(mags NE mags, ncheck, COMPLEMENT=gcheck)
  print, 'Number of NANs:', ncheck
  mags = mags[gcheck]
  meanmag = mean(mags)
  help, meanmag
  cover = sqrt(meanmag/mags)
  check2 = where(mags NE mags, ncheck2, COMPLEMENT=gcheck2)
  print,'Number of NANs second time:', ncheck2

  print, ' Creating region file for bad coverage fluxes'
  
  openw, lun, 'badfluxcoverage.reg', /GET_LUN
  for xx=0UL, ncheck-1, 1 do begin
     printf, lun, cat[check[xx]].ra_1, cat[check[xx]].dec_1
  endfor
  close, lun
  free_lun, lun

                                ;check = where(cover NE cover, ncheck, COMPLEMENT=gcheck)
                                ;print, 'Number of NANs:', ncheck
                                ;cover = cover[gcheck]
                                ;print, min(cover), max(cover), mean(cover), stdev(cover)
  
  
  gcat = cat[gcheck]
  csnr = (gcat.flux_aper_1_1) / (gcat.fluxerr_aper_1_1*cover) 
  snr = gcat.flux_aper_1_1 / gcat.fluxerr_aper_1_1
  
  window, 0, XPOS=100, YPOS=050, XSIZE=600, YSIZE=600, TITLE='CDFS Comparison SNR vs Flux: 2".80'
  plot, gcat.flux_aper_1_1, snr, PSYM=1, $
        XTITLE='Flux [muJy]', $
        XRANGE=[0.01, 20000.0], $
        /XLOG, $
        YTITLE='SNR', $
        YRANGE=[0.0,10.0], $
        CHARSIZE=1.4
   
  window, 1, XPOS=150, YPOS=075, XSIZE=600, YSIZE=600, TITLE='CDFS Comparison CSNR vs Flux: 2".80'
  plot, gcat.flux_aper_1_1, csnr, PSYM=1, $
        XTITLE='Flux [muJy]', $
        XRANGE=[0.01, 20000.0], $
        /XLOG, $
        YTITLE='CSNR', $
        YRANGE=[0.0,10.0], $
        CHARSIZE=1.4
  

  badcsnr = where(csnr LT 5.0, nbadcsnr)
  openw, lun, 'badcsnr.reg', /GET_LUN
  for xx=0UL, nbadcsnr-1, 1 do begin
     ;print, xx
     ;print, badcsnr[xx]
     ;print, check[badcsnr[xx]]
     ;print, cat[check[badcsnr[xx]]].ra_1
     ;print, cat[check[badcsnr[xx]]].dec_1
     printf, lun, gcat[badcsnr[xx]].ra_1, gcat[badcsnr[xx]].dec_1
  endfor
  close, lun
  free_lun, lun


  window, 2, XPOS=200, YPOS=100, XSIZE=600, YSIZE=600, TITLE='CSNR vs Coverage: 2".80'
  plot, mags, csnr, PSYM=1, $
        XTITLE='Coverage Flux', $
        ;XRANGE=[0.01, 20000.0], $
        ;/XLOG, $
        YTITLE='CSNR', $
        YRANGE=[0.0,10.0], $
        CHARSIZE=1.4




end
;========================================================================================================================




;========================================================================================================================
pro call_csnr

  imname = 'servs.cdfs.irac.b1.v02.121211.cov.fits'
  im = mrdfits(imname, 0, imhead)
  catalog = '../catalogs/cdfs-irac12-sextractor.fits'
  cat = mrdfits(catalog, 1)

  aper = [2.33]

  csnr, im, imhead, cat, APER=aper

end
;========================================================================================================================
