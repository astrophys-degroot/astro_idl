pro make_pm_I1I2
  
;This program makes weights for galaxies for each model colour slice
;These weights are stored in the /slices/ directory
;Startslice is the slice you start with, and combineslices is how many
;slices to compute P(M) at a time for
  
  !p.multi = [0,1,1]
  startslice = 56
  combineslices = 10
  
;Loop and make grids
  for q = 0, combineslices-1 do begin
     
     slicenum = startslice + q
     
;Read in the weighted data
;readweight_final, ra, dec, RMI1, eRMI1, I1tot, eI1tot, rmag_auto, remag_auto, weight, slicenum
     readweight_final_I1I2_xmm, ra, dec, I1MI2, eI1MI2, I2tot, eI2tot, I1tot, eI1tot, weight, slicenum
     

     print, ' In make_pm...'
     print, min(ra), max(ra), stdev(ra)
     print, min(dec), max(dec), stdev(dec)
     print, min(I2tot), max(I2tot), stdev(I2tot)
     print, min(weight), max(weight), stdev(weight)
     
     minra = 33 .0
     mindec = -7.00
     fieldsize = 5.0
     
;Read in red sequences from models
     readfullsequences_newmodel_I1I2, z, intercept, slope, xstar, ystar
     
;Calculate the angular size of a 125 kpc pixel at redshift of slice
     angsz = angularsize(z[slicenum], 125.0)
     
;Set up grid
;xgrid = fix((5.0*3600.0)/(angsz)) + 1
     
     xgrid = fix((4.0*3600.0)/(angsz)) + 1
     ygrid = fix((4.0*3600.0)/(angsz)) + 1
     grid = fltarr(xgrid,ygrid)
     help, grid
     
;Create the image with only galaxies in the colour slice
     print, 'Setting up density grid,   Slice: ', slicenum
     pixelsize = (4.0)/(fix((4.0*3600.0)/(angsz)) + 1)
     
     for x = 0UL, n_elements(ra)-1 do begin
;grid[(fix((ra[x]-minra)/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))] = grid[(fix((ra[x]-minra)/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))]+ 1.0*weight[x]
        grid[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))] = $
           grid[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))] + 1.0*weight[x]
        
     endfor
     
;Create the smoothing kernel
     print, 'Creating smoothing kernel'
     kernel = dblarr(200,200)
     for x = 0, 199 do begin
        for y = 0, 199 do begin
                                ;kernel[x,y] = 1.96576*exp(-1.965*(sqrt(((x-200.0)/(3.79))^2 + ((y-200.0)/(3.79))^2))) This is what I had before
           kernel[x,y] = 0.55400953*exp(-1.965*(sqrt(((x-100.0)/(2.64))^2 + ((y-100.0)/(2.64))^2)))
        endfor
     endfor
     
;Smooth the image with the kernel
     print, 'Smoothing density map with kernel'
     hind = convolve(grid, kernel, FT_PSF = psf_FT)
     
     window, 1, xsize = 1300, ysize = 700, title = 'Density Map for Z =' + strcompress(string(z[slicenum]), /remove_all)
     tvscl, hind
     writefits, 'cmap_z1400.fits', hind
;write_jpeg, '/home/muzzin/CRclustersim/images/redgalaxydensity.jpg', TVRD()
     
;this computes the density cut necessary to select cluster galaxies
     thresh = 0.02              ; Use 0.05 up to z = 0.85 then switch to 0.02
     print, 'Computing density cut, threshold = ', thresh
     cut = densitycut(hind, xgrid, ygrid, thresh)
     
;Compute PM
     print, 'Calculating PM'
     
     numpmbins = 14             ;--Number of PM bins
     pmbins = 0.5               ;---Size of magnitude bins
     
     if q eq 0 then begin
        NC = dblarr(numpmbins)
        NF = dblarr(numpmbins)
     endif
     
     for x = 0L, n_elements(ra)-1 do begin
        if weight[x] gt 0.0 and (I2tot[x] ge xstar[slicenum] - 3.0) and (I2tot[x] le xstar[slicenum] + 4.0) then begin
                                ;Decide on the position of the galaxy
           xpos = (fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize)))
           ypos = (fix((dec[x]-mindec)/(pixelsize)))
                                ;Then determine whether it is a cluster galaxy
           if hind[xpos,ypos] ge cut then begin
              for y = 0, n_elements(NC) - 1 do begin
                 if I2tot[x] ge (xstar[slicenum] - 3.0 + y*0.5) and I2tot[x] le (xstar[slicenum] - 3.0 + (y+1.0)*0.5) then $
                    NC[y] = NC[y]+1.0
              endfor
           endif else begin
                                ;Or else if it is a field galaxy
              for y = 0, n_elements(NC) - 1 do begin
                 if I2tot[x] ge (xstar[slicenum] - 3.0 + y*0.5) and I2tot[x] le (xstar[slicenum] - 3.0 + (y+1.0)*0.5) then $
                    NF[y] = NF[y]+1.0
              endfor
           endelse
        endif
     endfor
     
     if q eq combineslices-1.0 then begin
        PM = dblarr(numpmbins)
        sigPM = dblarr(numpmbins)
        for x = 0, n_elements(PM)-1 do begin
           PM[x] = (NC[x])/(NC[x]+NF[x])
           sigPM[x] = PM[x]*(sqrt( ((1.0)/(NC[x])) + ((1.0)/(NC[x] + NF[x])) ))
           if NC[x] eq 0 then sigPM[x] = 0.0
        endfor
     endif
     
     mplot = dblarr(numpmbins)
     
     for x = 0, n_elements(PM)-1 do begin
        mplot[x] = (xstar[slicenum] - 3.0 + x*0.5 + 0.25)
        mplot[x] = mplot[x] - xstar[slicenum]
     endfor
     
  endfor
  
;Plot PM
  
;set_plot, 'ps'
  window, 3, xsize = 600, ysize = 600, title = 'P(M) vs. M'
  plot, mplot, PM, psym = 2.0, xtitle = 'M - M!d*!n', ytitle = 'P(M)', $
        charsize = 1.2, yrange = [0,1.5], charthick = 0.4, thick = 1.5, $
        xthick = 1.5, ythick = 1.5, font = 100
  oploterr, mplot, PM, sigPM
  
  fitorder = 5
  fit2 = poly_fit(mplot[where(PM lt 1000.0 and PM gt 0.0)], PM[where(PM lt 1000.0 and PM gt 0.0)], fitorder, measure_errors=sigPM[where(PM lt 1000.0 and PM gt 0.0)])
  fit = linfit(mplot[where(PM lt 1000.0 and PM gt 0.0)], PM[where(PM lt 1000.0 and PM gt 0.0)], measure_errors=sigPM[where(PM lt 1000.0 and PM gt 0.0)])
  
  print, fit
  fitx = [min(mplot),max(mplot)]
  fity = [fit[0]+fit[1]*min(mplot),fit[0]+fit[1]*max(mplot)]
  fitx2 = (findgen( fix(1000.0*(max(mplot)-min(mplot))) ) /1000.0) + min(mplot)
  fity2 = dblarr(n_elements(fitx2))
  for p = 0, fitorder -1 do begin
     for g = 0, n_elements((fity2)) -1 do begin
        fity2[g] = fity2[g] + fit2[p]*fitx2[g]^p
     endfor
  endfor
  
  oplot, fitx,fity, thick =2.5
  oplot, fitx2, fity2, thick = 2.5, linestyle = 3.0
  
;device, /close
  set_plot,'x'
  
  openr, lun, 'I1I2sliceweightszf40/slicepmdata.dat', /get_lun
  header = strarr(2)
  readf, lun, header
  data_pm = dblarr(5, n_elements(z))
  readf, lun, data_pm
  free_lun, lun
  pmslope = data_pm[4,*]
  pmint = data_pm[3,*]
  pmslice = data_pm[1,*]
  pmz = data_pm[0,*]
  pmistar = data_pm[2,*]
  
  slices = findgen(combineslices) + startslice
  pmslope[slices] = fit[1]
  pmint[slices] = fit[0]
  
  openw, lun, 'I1I2sliceweightszf40/slicepmdata.dat', /get_lun
  printf, lun, header[0]
  printf, lun, header[1]
  for x = 0, n_elements(pmslice) -1 do begin
     printf, lun, pmz[x], pmslice[x], pmistar[x], pmint[x], pmslope[x], format = '(f12.5, 2(f12.5), f12.8, f16.8)'
  endfor
  free_lun, lun
  
;fname = strcompress('slice' + string(q) + 'weights.dat', /remove_all)
;openw, lun4, strcompress('/scr/adam/FLSclusters/slices/'+fname, /remove_all), /get_lun
;tempra = [ra[0], ra[0:n_elements(ra)-1]]
;writeu, lun4, tempra, dec, id, c1ifl, dc1ifl, rmag, drmag, weight
;free_lun, lun4
;printf, lun6, format = '(3(f12.5))', z[q], q, xstar[q]
  
;oplot, cmdplot[1,*], cmdplot[0,*], psym = 1.0
;window, 1, xsize = 1300, ysize = 700, title = 'Density Map'
;tv, bytscl(grid, min = -0.5, max = 2.0), xsize = 1300, ysize = 700
  
;endfor
  
end
