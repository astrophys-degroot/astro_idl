pro makefinalmaps_I1I2_cdfs

;This program makes the final cluster density maps using the
;pre-computed colour weights, as well as the P(M) data from the
;file slicepmdata.dat

  !p.multi = [0,1,1]
  startslice = 92
  endslice = 92
  
;Loop and make grids
  for q = startslice, endslice do begin
     
     slicenum = q
     
;Read in the weighted data
     readweight_final_I1I2_CDFS, ra, dec, I1MI2, eI1MI2, I2tot, eI2tot, I1tot, eI1tot, weight, slicenum
     
;Read in red sequences from models
     readfullsequences_newmodel_I1I2, z, intercept, slope, xstar, ystar
     readfullsequences_newmodel_z, z_zband, intercept_z, slope_z, xstar_z, ystar_z
     
     minra = 51.0
     mindec = -30
     fieldsize = 5.0
     
;Read in the P(M) fitted data
     openr, lun, 'I1I2sliceweightszf40/slicepmdata1.dat', /get_lun
     header = strarr(2)
     readf, lun, header
     data = dblarr(5, n_elements(z))
     readf, lun, data
     free_lun, lun
     pmslope = data[4,*]
     pmint = data[3,*]
     pmweight = dblarr(n_elements(I1tot))
     
;Calculate the angular size of a 125 kpc pixel at redshift of slice
     angsz = angularsize(z[slicenum], 125.0)
     
;Set up grid
     xgrid = fix((fieldsize*3600.0)/(angsz)) + 1
     ygrid = fix((fieldsize*3600.0)/(angsz)) + 1
     grid = fltarr(xgrid,ygrid)
     grid2 = fltarr(xgrid, ygrid)
     
;Create the image with only galaxies in the colour slice
     print, 'Setting up density grid,   Slice: ', slicenum
     pixelsize = (fieldsize)/(fix((fieldsize*3600.0)/(angsz)) + 1)
     print, pixelsize, z[slicenum]
     
     for x = 0L, n_elements(ra)-1 do begin
        
;Make the map of all objects
        grid2[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))] = $
           grid2[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))]+ 1.0
        
;Set P(M) = P(M = -1.5) if objects are brighter than 1.5M*
        if weight[x] gt 0.0 then begin
           if (I2tot[x]-xstar[slicenum]) lt -1.0 then $ 
              pmweight[x] = (-1.5)*pmslope[slicenum] + pmint[slicenum] $
           else pmweight[x] = (I2tot[x]-xstar[slicenum])*pmslope[slicenum] + pmint[slicenum]
           if pmweight[x] lt 0.0 then print, pmweight[x]
           grid[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))] = $
              grid[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))]+ 1.0*weight[x]*pmweight[x]
        endif
        
     endfor
     blah = where(grid GT 0, nblah)
     print, 'grid gt 0', nblah
     window, 0, XPOS=600, YPOS=600, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Populated Grid' ;win options
     tvscl, grid2
     mwrfits, grid2, 'adamspopulatedgrid.fits', /CREATE
     window, 1, XPOS=650, YPOS=450, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Weight Grid' ;win options
     tvscl, grid
     mwrfits, grid, 'adamsrawweightgrid.fits', /CREATE

;Create the smoothing kernel
     print, 'Creating smoothing kernel'
     kernel = dblarr(200,200)
     for x = 0, 199 do begin
        for y = 0, 199 do begin
                                ;kernel[x,y] = 1.96576*exp(-1.965*(sqrt(((x-200.0)/(3.79))^2 + ((y-200.0)/(3.79))^2)))
           kernel[x,y] = 0.55400953*exp(-1.965*(sqrt(((x-100.0)/(2.64))^2 + ((y-100.0)/(2.64))^2)))
        endfor
     endfor
     
;Smooth the image with the kernel
     print, 'Smoothing density map with kernel'
     hind = convolve(grid, kernel, FT_PSF = psf_FT)
     mwrfits, hind, 'adamsconvolvedweightgrid.fits', /CREATE
     
     
;Make bad pixel map
     bpm = fltarr(xgrid, ygrid)
     bpm[where(grid2 eq 0.0, nzero)] = 0.0
     bpm[where(grid2 ne 0.0, nnotzero)] = 1.0
     mwrfits, bpm, 'adamsbadpixelmap.fits', /CREATE

     
     outmap = dblarr(n_elements(bpm[*,0]),n_elements(bpm[0,*]))
     outmap[*,*] = 0.0
     
     print, 'Cleaning Bad Pixel Mask'
;Clean bpm --remove graininess from higher resolution maps
     for x = 1, n_elements(bpm[*,0]) -2.0 do begin
        for y = 1, n_elements(bpm[0,*]) -2.0 do begin
           muck = where(bpm[x-1:x+1,y-1:y+1] ne 0.0)
           if muck[0] ne -1.0 then outmap[x,y] = 1.0
        endfor
     endfor
     mwrfits, outmap, 'adamscleanedbadpixelmap.fits', /CREATE

;find the nearest z-band clustermap BPM and multiply to get rid of regions with no coverage
     temp_junk = min(abs(z[slicenum]-z_zband), bpm_map_index)
     print, 'Redshift Offset for BPM:', temp_junk, slicenum, bpm_map_index
     
     bpm_fix = readfits(strcompress('zclustermaps/' + 'cmap_weightmap' + string(bpm_map_index) +'.fits', /remove_all))
     
;This widens the BPM by inserting zeros near places with zero
     
     zeros = where(bpm_fix eq 0)
     junk1 = array_indices(bpm_fix, zeros)
     junk1 = junk1[*,where(junk1[0,*] gt 1 and junk1[1,*] gt 2 and (junk1[0,*] lt n_elements(hind[0,*])-2) and (junk1[1,*] lt n_elements(hind[*,0])-3))]
     
     for pp = 0L, n_elements(junk1[1,*])-1 do begin
        for tt = 0, 3 do begin
           for rr = 0, 2 do begin
              bpm_fix[junk1[0,pp]+rr, junk1[1,pp]+tt] = 0.0
              bpm_fix[junk1[0,pp]-rr, junk1[1,pp]+tt] = 0.0
              bpm_fix[junk1[0,pp]+rr, junk1[1,pp]-tt] = 0.0
              bpm_fix[junk1[0,pp]-rr, junk1[1,pp]-tt] = 0.0
           endfor
        endfor
        
;		bpm_fix[junk1[0,pp]+1, junk1[1,pp]] = 0.0
;	        bpm_fix[junk1[0,pp]-1, junk1[1,pp]] = 0.0
;                bpm_fix[junk1[0,pp]+2, junk1[1,pp]] = 0.0 
;                bpm_fix[junk1[0,pp]-2, junk1[1,pp]] = 0.0
;	        bpm_fix[junk1[0,pp], junk1[1,pp]+1] = 0.0
;	        bpm_fix[junk1[0,pp], junk1[1,pp]-1] = 0.0
;                bpm_fix[junk1[0,pp], junk1[1,pp]+2] = 0.0
;                bpm_fix[junk1[0,pp], junk1[1,pp]-2] = 0.0
;                bpm_fix[junk1[0,pp], junk1[1,pp]+3] = 0.0
;                bpm_fix[junk1[0,pp], junk1[1,pp]-3] = 0.0
        
;	if pp mod 10000 eq 0 then print, pp/1000, 'k done'
     endfor
     
     hind = hind*bpm_fix
     
     print, 'Number of good Pixels Overlap:', n_elements(where(bpm_fix gt 0.0))
     print, 'Total area Overlap', n_elements(where(bpm_fix gt 0.0))*pixelsize^2
     
     print, 'Number of good Pixels IRAC:', n_elements(where(outmap ne 0.0))
     print, 'Total area IRAC', n_elements(where(outmap ne 0.0))*pixelsize^2
     
;if q eq startslice then window, 1, xsize = 1300, ysize = 700, title = 'Density Map'
     if slicenum eq startslice then window, 1, xsize = 1300, ysize = 1100, title = 'Density Map'
     tvscl, hind
     writefits, strcompress('I1I2clustermaps/' + 'cmap_slice' + string(slicenum) +'.fits', /remove_all), hind
;write_jpeg, strcompress('zclustermaps/' + 'cmap_slice' + string(slicenum) +'.jpg', /remove_all), TVRD()
     
;if q eq startslice then window, 2, xsize = 1300, ysize = 700, title = 'Bad Pixel Mask'
     if slicenum eq startslice then window, 2, xsize = 1300, ysize = 1100, title = 'Bad Pixel Mask'
     tvscl, outmap
     writefits, strcompress('I1I2clustermaps/' + 'cmap_weightmap' + string(slicenum) +'.fits', /remove_all), outmap
                                ;write_jpeg, strcompress('zclustermaps/' + 'cmap_weightmap' + string(slicenum) +'.jpg', /remove_all), TVRD()

     map = MRDFITS(strcompress('I1I2clustermaps/' + 'cmap_slice' + string(slicenum) +'.fits', /remove_all), 0, header)
     print, '*********'
     print, header
     print, '*********'
     SXADDPAR, header, 'EQUINOX', 2000.0000, 'Mean equinox'
     SXADDPAR, header, 'RADECSYS', 'fk5', 'Astrometric system'
     SXADDPAR, header, 'CTYPE1', 'RA---TAN', 'WCS projection type for this axis'
     SXADDPAR, header, 'CUNIT1', 'deg', 'Axis unit'
     SXADDPAR, header, 'CRVAL1', 52.780471, 'World coordinate on this axis' 
     SXADDPAR, header, 'CRPIX1', 378, 'Reference pixel on this axis'
     SXADDPAR, header, 'CD1_1', 0.004129, 'Linear projection matrix'                       
     SXADDPAR, header, 'CD1_2', 0.000000000E+00, 'Linear projection matrix'                       
     SXADDPAR, header, 'CTYPE2', 'DEC--TAN', 'WCS projection type for this axis'              
     SXADDPAR, header, 'CUNIT2', 'deg', 'Axis unit'                                      
     SXADDPAR, header, 'CRVAL2', -28.769611, 'World coordinate on this axis'                  
     SXADDPAR, header, 'CRPIX2', 298, 'Reference pixel on this axis'                   
     SXADDPAR, header, 'CD2_1', 0.000000000E+00, 'Linear projection matrix'                       
     SXADDPAR, header, 'CD2_2', 0.004129, 'Linear projection matrix,                       

     print, '!!!!!!!!!'
     print, header
     print, '!!!!!!!!!'

     MWRFITS, map, strcompress('I1I2clustermaps/' + 'cmap_slice' + string(slicenum) +'.fits', /remove_all), header, /CREATE
     stop
  endfor
  
end
