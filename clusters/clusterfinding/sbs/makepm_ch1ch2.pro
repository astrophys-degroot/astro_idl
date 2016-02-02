;========================================================================================================================
function makepm_ch1ch2, model1, wfile, zrange, KERTYPE=kertype, NCOMB=ncomb, PMBINS=pmbins, PMSIZE=pmsize, $
                        ORFIT=orfit, PIXSIZE=pixsize, FIELDSIZE=fieldsize, $
                        DENTHRESH=denthresh, INDIR=indir, OUTFILE=outfile, OUTDIR=outdir, $
                        SCREENP=screenp, WRITEP=writep, WRITEF=writef, VERBOSE=verbose, HELP=help 
  


;+
; NAME:
;       MAKEPM_CH1CH2()
;
; PURPOSE:
;       This program makes weights for galaxies for each model colour slice
;       These weights are stored in the /slices/ directory
;       Startslice is the slice you start with, and combineslices is how many
;       slices to compute P(M) at a time for
;       
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;
; COMMON BLOCKS:
;
; PROCEDURES USED:
;
; COMMENTS:
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2012 Nov 8, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 June, v1.0.0
;-



  
  if keyword_set(NCOMB) then ncomb = ncomb[0] else ncomb = 10                   ;sets new value
  if keyword_set(PMBINS) then pmbins = pmbins[0] else pmbins = 17               ;sets new value
  if keyword_set(PMSIZE) then pmsize = pmsize[0] else pmsize = 0.5              ;set new value
  if keyword_set(ORFIT) then orfit = orfit[0] else orfit = 5                    ;set new value
  if keyword_set(PIXSIZE) then pixsize = pixsize[0] else pixsize = 125.0        ;sets new value [kpc]
  if keyword_set(KERSIZ) then kersize = kersiz[0] else kersize = 4.0            ;sets new value, FWHM of kernel
  if keyword_set(DENTHRESH) then denthresh = denthresh[0] else denthresh = 0.02 ;set new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2            ;sets new value
  
  
                                ;l for zzz = 56, 96, 10 do begin
                                ;!p.multi = [0,1,1]
                                ;startslice = 56
                                ;combineslices = 10
  

  ;;;This section reads in file, does sanity checks
  if keyword_set(OUTDIR) then check_outdir, outdir, VERBOSE=verbose                     ;checks outdir
  if keyword_set(INDIR) then check_indir, indir, model1, VERBOSE=verbose                ;checks indir
  model1 = mrdfits(model1, 1)                                                           ;reads in model file
  if keyword_set(HELP) then help, model1, /struc                                        ;offer help
  case (zrange[0] lt min(model1.z)) of                                                  ;checks minimum z value 
     1 : begin                                                                          ;if min z value is too low
        if verbose ge 3 then print, '  Min z value is too low! Using lowest z found!'   ;print info
        zrange[0] = min(model1.z)                                                       ;resets min z value
        if verbose ge 3 then print, '   Min z is now: ', zrange[0]                      ;print info
        starting = min(zrange[0]-model1.z, nstart, /ABSOLUTE)                           ;find index number
     end                                                                                ;end if min z values too low
     0 : begin                                                                          ;min z value not too low
        if verbose ge 3 then print, '  Min z value is good!'                            ;print info
        starting = min(model1.z-zrange[0], nstart, /ABSOLUTE)                           ;find index number
     end                                                                                ;end min z value not too low
  endcase                                                                               ;end check min z value
  case (zrange[1] gt max(model1.z)) of                                                  ;checks max z value 
     1 : begin                                                                          ;max z value too high
        if verbose ge 3 then print, '  Max z value is too high! Using highest z found!' ;print info
        zrange[1] = max(model1.z)                                                       ;resets max z value
        if verbose ge 3 then print, '   Max z is now: ', zrange[1]                      ;print info
        ending = min(zrange[1]-model1.z, nend, /ABSOLUTE)                               ;find index number
     end                                                                                ;end max z value too high
     0 : begin                                                                          ;max z not too high
        if verbose ge 3 then print, '  Max z value is good!'                            ;print info
        ending = min(zrange[1]-model1.z, nend, /ABSOLUTE)                               ;find index number
     end                                                                                ;end max z not too high
  endcase                                                                               ;end check max z value
  print, ' '                                                                            ;spacer
  
  
  ;;;Loop over redshift slices and find Probability(magnitude)
  angsizes = length(pixsize, 'kpc', OUTUNITS='arcsec', SECONDARY=model1.z, SECUNITS='redshift') ;calc angular size of pixel at redshift of slice
  

  if keyword_set(OUTFILE) then outfile = outfile[0] else outfile = 'slicepmdata.txt'   ;set outfile name
  if keyword_set(OUTDIR) then outfile = strcompress(outdir[0]+outfile, /REMOVE_ALL)    ;set outdir name
  openw, lun, outfile, /GET_LUN                                                        ;open file 
  
  for aa=nstart, nend-1, 1 do begin                                            ;loop over redshift slices
     if verbose ge 1 then begin                                                ;check verbose
        print, '****************************************'                      ;print
        print, ' Now on slice number: ', aa, ' at redshift of: ', model1[aa].z ;print info
        print, '****************************************'                      ;print
     endif                                                                     ;end check verbose
     delta = fix(ncomb/2.0)                                                    ;find half of combine slices
     if aa-delta lt nstart then combstart = nstart else combstart = aa-delta   ;combine slices start
     if aa+delta gt nend-1 then combend = nend-1 else combend = aa+delta       ;combine slices end
     for bb=combstart, combend, 1 do begin                                     ;loop over combined slices
        
        if verbose ge 2 then begin                                                              ;check verbose
           print, '----------------------------------------'                                    ;print
           print, '    Now on subslice number: ', bb-aa, ' of: ', combend-combstart             ;print info
           print, '----------------------------------------'                                    ;print
        endif                                                                                   ;end check verbose
      
        ;;;Read in the weighted data
        holdvar1 = wfile                              ;temp var to hold value
        strreplace, wfile, '#', model1[bb].z          ;replace slice #
        wfile = strcompress(wfile, /REMOVE_ALL)       ;take out white spaces
        if keyword_set(INDIR) then begin              ;check INDIR keyword
           check_indir, indir, wfile, VERBOSE=verbose ;checks indir
        endif                                         ;end check INDIR keyword
        wdata = mrdfits(wfile, 1)                     ;read in weight datq
        if keyword_set(HELP) then help, wdata, /struc ;offer help
        print, ' '                                    ;spacer
        
                                ;slicenum = startslice + q
                                ;readweight_final, ra, dec, RMI1, eRMI1, I1tot, eI1tot, rmag_auto, remag_auto, weight, slicenum
                                ;readweight_final_I1I2_cdfs, ra, dec, I1MI2, eI1MI2, I2tot, eI2tot, I1tot, eI1tot, weight, slicenum
        
        
        if verbose ge 3 then begin                                                                 ;check VERBOSE keyword
           print, '  In make_pm...'                                                                ;print info
           print, '     RA: ', min(wdata.ra), max(wdata.ra), stdev(wdata.ra)                       ;print info
           print, '     Dec: ', min(wdata.dec), max(wdata.dec), stdev(wdata.dec)                   ;print info
           print, '     IRAC ch2 mag: ', min(wdata.ch2best), max(wdata.ch2best), stdev(wdata.ch2best) ;print info
           print, '     weights: ', min(wdata.weight), max(wdata.weight), stdev(wdata.weight)         ;print info
        endif                                                                                         ;end check VERBOSE keyword
        
        
        if keyword_set(FIELDSIZE) then begin                                          ;check FIELDSIZE keyword
           case n_elements(FIELDSIZE) of                                              ;check # elements of fieldsize
              1 : begin                                                               ;if 1 element
                 field_xsize = fieldsize[0]                                           ;sets new value
                 field_ysize = fieldsize[0]                                           ;sets new value
              end                                                                     ;end if 1 element
              2 : begin                                                               ;if 2 elements
                 field_xsize = fieldsize[0]                                           ;sets new value
                 field_ysize = fieldsize[1]                                           ;sets new value
              end                                                                     ;end if 2 elements
              else : begin                                                            ;if neither 1 or 2 elements
                 print, ' FIELDSIZE must have 1 or 2 elements!! Reverting to defaults!!' ;print info
                 field_xsize = max(wdata.ra)-min(wdata.ra) + 0.2                         ;find size in 1 dir [deg]
                 field_ysize = max(wdata.dec)-min(wdata.dec) + 0.2                       ;find size in 2 dir [deg]
              end                                                                        ;end if neither
           endcase                                                                       ;end check # elements 
        endif else begin                                                                 ;sets new value
           field_xsize = max(wdata.ra)-min(wdata.ra) + 0.2                               ;find size in 1 dir [deg]
           field_ysize = max(wdata.dec)-min(wdata.dec) + 0.2                             ;find size in 2 dir [deg]
        endelse                                                                          ;end alt to FIELDSIZE keyword
        if verbose ge 3 then print, '   Field size: ', field_xsize, ' x ', field_ysize   ;print info
        
                                ;minra = 51.0
                                ;mindec = -30.00
                                ;fieldsize = 5.0
                                ;Read in red sequences from models
                                ;readfullsequences_newmodel_I1I2, z, intercept, slope, xstar, ystar
                                ;Calculate the angular size of a 125 kpc pixel at redshift of slice
                                ;angsz = angularsize(z[slicenum], 125.0)     
                                ;Set up grid
                                ;xgrid = fix((5.0*3600.0)/(angsz)) + 1
                                ;xgrid = fix((4.0*3600.0)/(angsz)) + 1
                                ;ygrid = fix((4.0*3600.0)/(angsz)) + 1
                                ;grid = fltarr(xgrid,ygrid)
                                ;help, grid
     
     ;;;Set up grid
        xgrid = fix((field_xsize*3600.0) / (angsizes[bb])) + 1 ;finds int # of xpix
        ygrid = fix((field_ysize*3600.0) / (angsizes[bb])) + 1 ;finds int # of ypix
        grid = fltarr(xgrid,ygrid)                             ;creates array; population grid
        if keyword_set(HELP) then help, grid                   ;print info
        
     ;;;Give grid a header
        fxhmake, myhead                                                                             ;create header
        FXADDPAR, myhead, 'BITPIX', -32, ' Bits per pixel- floating point'                          ;changes value in header
        FXADDPAR, myhead, 'NAXIS', 2, ' STANDARD FITS FORMAT'                                       ;changes value in header
        FXADDPAR, myhead, 'EQUINOX', 2000.0000, ' Mean equinox'                                     ;adds value to header
        FXADDPAR, myhead, 'RADECSYS', 'ICRS', ' Astrometric system'                                 ;adds value to header
        FXADDPAR, myhead, 'CTYPE1', 'RA---TAN', ' WCS projection type for this axis'                ;adds value to header
        FXADDPAR, myhead, 'CUNIT1', 'deg', 'Axis unit'                                              ;adds value to header
        FXADDPAR, myhead, 'CRVAL1', double(((max(wdata.ra)-min(wdata.ra))/2.0)+min(wdata.ra)), $    ;cont next line
                  'World coordinate on this axis'                                                   ;adds value to header
        FXADDPAR, myhead, 'CRPIX1', floor(xgrid/2), 'Reference pixel on this axis'                  ;adds value to header
        FXADDPAR, myhead, 'CD1_1', angsizes[aa]/3600.0, 'Linear projection matrix'                  ;adds value to myhead  
        FXADDPAR, myhead, 'CD1_2', 0.000000, 'Linear projection matrix'                             ;adds value to myhead
        FXADDPAR, myhead, 'CTYPE2', 'DEC--TAN', 'WCS projection type for this axis'                 ;adds value to myhead
        FXADDPAR, myhead, 'CUNIT2', 'deg', 'Axis unit'                                              ;adds value to myhead
        FXADDPAR, myhead, 'CRVAL2', double(((max(wdata.dec)-min(wdata.dec))/2.0)+min(wdata.dec)), $ ;cont next line
                  'World coordinate on this axis'                                                   ;adds value to myhead
        FXADDPAR, myhead, 'CRPIX2', floor(ygrid/2), 'Reference pixel on this axis'                  ;adds value to myhead
        FXADDPAR, myhead, 'CD2_1', 0.000000, 'Linear projection matrix'                             ;adds value to myhead
        FXADDPAR, myhead, 'CD2_2', angsizes[aa]/3600.0, 'Linear projection matrix'                  ;adds value to myhead
        
        
     ;;;Create the image with only galaxies in the colour slice
        if verbose ge 2 then print, '  Setting up density grid!'                                     ;prints info
        adxy, myhead, wdata.ra, wdata.dec, xs, ys                                                    ;convert RA, Dec to x, y
        for cc=0UL, n_elements(xs)-1, 1 do begin                                                     ;loop over all detections
           grid[xs[cc],ys[cc]] = grid[xs[cc],ys[cc]] + 1.0*wdata[cc].weight                          ;add 1 to pixel population
        endfor                                                                                       ;end loop over all detections
        if keyword_set(SCREENP) AND VERBOSE GE 3 then begin                                          ;if SCREENP is set
           title = strcompress('Probability Map for z='+string(model1[bb].z), /REMOVE_ALL)           ;create plot title
           window, 1, XPOS=100, YPOS=50, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE=title                 ;set plot window
           tvscl, grid                                                                               ;plot smoothed probability grid
        endif                                                                                        ;end if SCREENP is set     
        if keyword_set(OUTDIR) then begin                                                            ;check OUTDIR keyword
           gridname = strcompress(outdir[0]+'rawprobgrid'+string(model1[bb].z)+'.fits', /REMOVE_ALL) ;append directory
        endif else gridname = strcompress('rawprobgrid'+string(model1[bb].z)+'.fits', /REMOVE_ALL)   ;no directory
        if keyword_set(WRITEP) then mwrfits, grid, gridname, myhead, /CREATE                         ;write kernel image
        

                                ;print, 'Setting up density grid,   Slice: ', slicenum
                                ;pixelsize = (4.0)/(fix((4.0*3600.0)/(angsz)) + 1)
                                ;for x = 0UL, n_elements(ra)-1 do begin
                                ;grid[(fix((ra[x]-minra)/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))]
                                ;= $ grid[(fix((ra[x]-minra)/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))]+ 1.0*weight[x]
                                ;grid[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))]
                                ;= $ grid[(fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize))),(fix((dec[x]-mindec)/(pixelsize)))]+ 1.0*weight[x]
                                ;endfor
     
     


     ;;;Smoothing kernel creation 
        if verbose ge 2 then print, '  Creating smoothing kernel!'                                         ;prints info
        if keyword_set(KERTYPE) then kertype = kertype[0] else kertype = 0                                 ;set kernel type
        case kertype of                                                                                    ;check which kernel to use
           0 : begin                                                                                       ;adam's kernel
              kernel = dblarr(200,200)                                                                     ;create array
              for x = 0, 199 do begin                                                                      ;loop over first dir
                 for y = 0, 199 do begin                                                                   ;loop over second dir
                    kernel[x,y] = 0.55400953*exp(-1.965*(sqrt(((x-100.0)/(2.64))^2+((y-100.0)/(2.64))^2))) ;kernel
                 endfor                                                                                    ;end loop over second dir
              endfor                                                                                       ;end loop over first dir
           end                                                                                             ;end use adam's kernel
           1 : begin                                                                                       ;use my kernel
              kernel = psf_gaussian(NPIX=10.0*kersize[0]+1, FWHM=kersize[0], /DOUBLE, /NORMALIZE)          ;create smoothing kernel
           end                                                                                             ;end my kernel
        endcase                                                                                            ;end check of which kernel to use
        if keyword_set(SCREENP) AND VERBOSE GE 3 then begin                                                ;if SCREENP is set
           window, 0, XPOS=1100, YPOS=50, XSIZE=250, YSIZE=250, TITLE='Smoothing Kernel'                   ;win options
           tvscl, kernel, /DATA                                                                            ;plots populated grid
        endif                                                                                              ;end if SCREENP is set     
        if keyword_set(OUTDIR) then begin                                                                  ;check OUTDIR keyword
           kername = strcompress(outdir[0] + 'makepm_kernel.fits', /REMOVE_ALL)                            ;append directory
        endif else kername = 'makepm_kernel.fits'                                                          ;no directory
        if keyword_set(WRITEP) then mwrfits, kernel, kername, /CREATE                                      ;write kernel image
        
     
                                ;print, 'Creating smoothing kernel'
                                ;kernel = dblarr(200,200)
                                ;for x = 0, 199 do begin
                                ;for y = 0, 199 do begin
                                ;kernel[x,y] = 1.96576*exp(-1.965*(sqrt(((x-200.0)/(3.79))^2 + ((y-200.0)/(3.79))^2))) This is what I had before
                                ;kernel[x,y] = 0.55400953*exp(-1.965*(sqrt(((x-100.0)/(2.64))^2 + ((y-100.0)/(2.64))^2)))
                                ;endfor
                                ;endfor


     ;;;Smoothing kernel application
        if verbose ge 2 then print, '  Smoothing weight map with kernel!'                             ;prints info
        hind = convolve(grid, kernel, FT_PSF = psf_FT)                                                ;Smooth the image with the kernel
        if keyword_set(SCREENP) AND VERBOSE GE 3 then begin                                           ;if SCREENP is set
           title = strcompress('Density Map for z='+string(model1[bb].z), /REMOVE_ALL)                ;create plot title
           window, 2, XPOS=125, YPOS=75, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE=title                  ;set plot window
           tvscl, hind                                                                                ;plot smoothed probability grid
        endif                                                                                         ;end if SCREENP is set     
        if keyword_set(OUTDIR) then begin                                                             ;check OUTDIR keyword
           hindname = strcompress(outdir[0]+'pmgrid_slice'+string(model1[bb].z)+'.fits', /REMOVE_ALL) ;append directory
        endif else hindname = strcompress('pmgrid_slice'+string(model1[bb].z)+'.fits', /REMOVE_ALL)   ;no directory
        if keyword_set(WRITEP) then mwrfits, hind, hindname, myhead, /CREATE                          ;write kernel image
        
                                ;print, 'Smoothing density map with kernel'
                                ;hind = convolve(grid, kernel, FT_PSF = psf_FT)
                                ;window, 1, xsize = 1300, ysize = 700, title = 'Density Map for Z =' + strcompress(string(z[slicenum]), /remove_all)
                                ;tvscl, hind
                                ;writefits, 'cmap_z1400.fits', hind
                                ;write_jpeg, '/home/muzzin/CRclustersim/images/redgalaxydensity.jpg', TVRD()
                                ;thresh = 0.02              ; Use 0.05 up to z = 0.85 then switch to 0.02
      
     
     ;;;compute density cut necessary to select cluster galaxies
        if verbose ge 2 then print, '  Computing density cut! Using threshold of: ', denthresh ;print info
        dencut = densitycut(hind, xgrid, ygrid, denthresh, SLICE=model1[bb].z, OUTDIR=outdir, $ ;cont next line
                            /SCREENP, /WRITEP)                                                  ;call to densitycut
        
        
     ;;;Compute Prob(mag)
        if verbose ge 2 then print, '  Calculating Prob(m)'
        
                                ;numpmbins = 14             ;--Number of PM bins
                                ;pmbins = 0.5               ;---Size of magnitude bins
        
        if bb eq nstart then begin ;check if first pass, these dont get reset
           ncl = dblarr(pmbins)    ;create array
           nfg = dblarr(pmbins)    ;create array
        endif                      ;end check first pass
        
        firstcut = where(wdata.weight GT 0.0 AND wdata.ch2best GE (model1[bb].mstar_ch2 - 3.) AND $           ;cont next line
                         wdata.ch2best LE model1[bb].mstar_ch2+5.0, nfirstcut)                                ;keep only good sources
        if verbose ge 3 then print, '   # of galaxies with nonzero weight, good ch2 magnitudes: ', nfirstcut  ;print info
        adxy, myhead, wdata[firstcut].ra, wdata[firstcut].dec, xpos, ypos                                     ;convert RA, Dec to x, y
        xpos = round(xpos)                                                                                    ;round x pixel vals
        ypos = round(ypos)                                                                                    ;round y pixel vals
        clgal = where(hind[xpos,ypos] GT dencut, nclgal, COMPLEMENT=fldgal, NCOMPLEMENT=nfldgal)              ;indentify cluster galaxys
        for xx=0, pmbins-1, 1 do begin                                                                        ;loop over mag bins
           inbin = where(wdata[firstcut[clgal]].ch2best GE (model1[aa].mstar_ch2-3.0+pmsize*xx) AND $         ;cont next line
                         wdata[firstcut[clgal]].ch2best LE (model1[aa].mstar_ch2-3.0+pmsize*(xx+1)), ninbin)  ;find in bin
           ncl[xx] = ncl[xx] + ninbin                                                                         ;set value
           inbin = where(wdata[firstcut[fldgal]].ch2best GE (model1[aa].mstar_ch2-3.0+pmsize*xx) AND $        ;cont next line
                         wdata[firstcut[fldgal]].ch2best LE (model1[aa].mstar_ch2-3.0+pmsize*(xx+1)), ninbin) ;find in bin
           nfg[xx] = nfg[xx] + ninbin                                                                         ;set value
        endfor                                                                                                ;end loop over mag bins
        


                                ;for x = 0L, n_elements(wdata.ra)-1 do begin
                                ;if weight[x] gt 0.0 and (I2tot[x] ge xstar[slicenum] - 3.0) and (I2tot[x] le xstar[slicenum] + 4.0) then begin
                                ;Decide on the position of the galaxy
                                ;xpos = (fix(((ra[x]-minra)*cos(dec[x]*!pi/180.0))/(pixelsize)))
                                ;ypos = (fix((dec[x]-mindec)/(pixelsize)))
                                ;Then determine whether it is a cluster galaxy
                                ;if hind[xpos,ypos] ge cut then begin
                                ;for y = 0, n_elements(NC) - 1 do begin
                                ;if I2tot[x] ge (xstar[slicenum] - 3.0 + y*0.5) and I2tot[x] le (xstar[slicenum] - 3.0 + (y+1.0)*0.5) then $
                                ;NC[y] = NC[y]+1.0
                                ;endfor
                                ;endif else begin
                                ;Or else if it is a field galaxy
                                ;for y = 0, n_elements(NC) - 1 do begin
                                ;if I2tot[x] ge (xstar[slicenum] - 3.0 + y*0.5) and I2tot[x] le (xstar[slicenum] - 3.0 + (y+1.0)*0.5) then $
                                ;NF[y] = NF[y]+1.0
                                ;endfor
                                ;endelse
                                ;endif
                                ;endfor
     
        
        if bb eq combend then begin                                                     ;check if last slice
           plotmag = fltarr(pmbins)                                                     ;create array for plot mag vals
           PM = fltarr(pmbins)                                                          ;create array for Prob(mag)
           sigPM = fltarr(pmbins)                                                       ;create array for P(m) error
           for cc=0, n_elements(PM)-1, 1 do begin                                       ;loop over mag bin
              plotmag[cc] =  -3.0+cc*pmsize+(pmsize/2.0)                                ;set mag value
              PM[cc] = (ncl[cc])/(ncl[cc]+nfg[cc])                                      ;set prob(mag) for bin
              if ncl[cc] NE 0 then begin                                                ;check # of cluster gals
                 sigPM[cc] = PM[cc]*(sqrt(((1.0)/(ncl[cc]))+((1.0)/(ncl[cc]+nfg[cc])))) ;set error val
              endif else sigPM[cc] = 0.0                                                ;set error val
           endfor                                                                       ;end loop over mag bin


           ;;;Find fits to data
                                ;print, plotmag
                                ;print, min(PM), max(PM)
                                ;print, PM
           check = where(PM GT 0.0001 AND PM LT 2.0, check)                                    ;find good bins
           fitlin = linfit(plotmag[check], PM[check], MEASURE_ERRORS=sigPM[check])             ;linear fit
           if verbose ge 2 then print, '  Coefficients of linear fit: ', fitlin                ;print info
           fitxlin = [min(plotmag), max(plotmag)]                                              ;fake x values
           fitylin = [fitlin[0]+fitlin[1]*min(plotmag), fitlin[0]+fitlin[1]*max(plotmag)]      ;y values of lin fit
           fitpoly = poly_fit(plotmag[check], PM[check], orfit, MEASURE_ERRORS=sigPM[check])   ;polynomial fit
           if verbose ge 3 then print, '  Coefficients of polynomial fit', fitpoly             ;print info
           fitxpoly = (findgen(fix(1000.0*(max(plotmag)-min(plotmag))))/1000.0) + min(plotmag) ;fake x points
           fitypoly = dblarr(n_elements(fitxpoly))                                             ;create array y points
           for p = 0, orfit, 1 do begin                                                        ;loop over polynomials
              fitypoly = fitypoly + fitpoly[p]*fitxpoly^p                                      ;polynomial values
           endfor                                                                              ;end loop over polynomials
           
           
           ;;;Plot PM, errors and fits
           if keyword_set(SCREENP) then begin                                  ;end plot SCREENP keyword
              window, 4, XPOS=175, YPOS=125, XSIZE=600, YSIZE=600, TITLE=title ;set plot window
              plot, plotmag, PM, PSYM=2, $                                     ;plot frac as function of mag
                    ;COLOR = '000000'XL, $                                      ;plot option
                    ;BACKGROUND = 'FFFFFF'XL, $                                 ;plot option
                    XTITLE = 'M - M!d*!n', $                                   ;plot option
                    YTITLE = 'P(M)', $                                         ;plot option
                    YRANGE = [0.0, 1.5], $                                     ;plot option
                    CHARSIZE = 1.4, $                                          ;plot option
                    CHARTHICK = 0.4, $                                         ;plot option
                    THICK = 1.5, $                                             ;plot option
                    XTHICK = 1.5, $                                            ;plot option
                    YTHICK = 1.5, $                                            ;plot option
                    FONT = 100                                                 ;plot option
              oploterr, plotmag, PM, sigPM;, ERRCOLOR='black'                   ;, ERRCOLOR = '000000'XL  ;overplot errors
              oplot, fitxlin, fitylin, THICK=2.5;, COLOR = '000000'XL           ;overplot linear fit
              oplot, fitxpoly, fitypoly, LINESTYLE=3.0, $                      ;cont next line
                     THICK=2.5;, COLOR = '000000'XL                             ;overplot polynomial fit
           endif                                                               ;end check SCREENP keyword 
           
           
           if keyword_set(WRITEP) then begin                                                      ;check WRITEP keyword
              graphout = strcompress('probmag'+string(model1[aa].z)+'.ps', /REMOVE_ALL)           ;file out
              if keyword_set(OUTDIR) then graphout = strcompress(outdir[0]+graphout, /REMOVE_ALL) ;append outdir
              set_plot, 'ps'                                                                      ;set plot type
              device, FILENAME=graphout                                                           ;set up plot
              plot, plotmag, PM, PSYM=2, $                                                        ;plot frac as function of mag
                    ;COLOR = '000000'XL, $                                                         ;plot option
                    ;BACKGROUND = 'FFFFFF'XL, $                                                    ;plot option
                    XTITLE = 'M - M!d*!n', $                                                      ;plot option
                    YTITLE = 'P(M)', $                                                            ;plot option
                    YRANGE = [0.0, 1.5], $                                                        ;plot option
                    CHARSIZE = 1.4, $                                                             ;plot option
                    CHARTHICK = 0.4, $                                                            ;plot option
                    THICK = 1.5, $                                                                ;plot option
                    XTHICK = 1.5, $                                                               ;plot option
                    YTHICK = 1.5, $                                                               ;plot option
                    FONT = 100                                                                    ;plot option
              oploterr, plotmag, PM, sigPM;, ERRCOLOR = '000000'XL                                 ;overplot errors
              oplot, fitxlin, fitylin, THICK=2.5;, COLOR = '000000'XL                              ;overplot linear fit
              oplot, fitxpoly, fitypoly, LINESTYLE=3.0, THICK=2.5;, COLOR = '000000'XL             ;overplot polynomial fit
              device, /CLOSE                                                                      ;close plot
              set_plot, 'x'                                                                       ;reset plot type
           endif                                                                                  ;end check WRITEP keyword
           
           

        endif                                                                           ;end check last slice
        
                                ;for x = 0, n_elements(PM)-1 do begin
                                ;   mplot[x] = (xstar[slicenum] - 3.0 + x*0.5 + 0.25)
                                ;   mplot[x] = mplot[x] - xstar[slicenum]
                                ;endfor
     
        
     endfor                                                                           ;end loop over slices to combine     
     test = where(abs(model1[aa].z-model1.z) LT 0.01)                                 ;find slice number
     printf, lun, model1[aa].z, test, model1[aa].mstar_ch2, fitlin[0], fitlin[1], $ ;cont next line
             FORMAT='(f,i,f,f,f)'                                                     ;print file
     
  endfor                        ;end loop over redshift slice
  close, lun                    ;close file
  free_lun, lun                 ;free memory
  
  
                                ;set_plot, 'ps'
                                ;window, 3, xsize = 600, ysize = 600, title = 'P(M) vs. M'
                                ;plot, mplot, PM, psym = 2.0, xtitle = 'M - M!d*!n', ytitle = 'P(M)', $
                                ;      charsize = 1.2, yrange = [0,1.5], charthick = 0.4, thick = 1.5, $
                                ;      xthick = 1.5, ythick = 1.5, font = 100
                                ;oploterr, mplot, PM, sigPM
  
                                ;fitorder = 5
                                ;fit2 = poly_fit(mplot[where(PM lt 1000.0 and PM gt 0.0)], PM[where(PM lt 1000.0 and PM gt 0.0)], $
                                ;                fitorder, measure_errors=sigPM[where(PM lt 1000.0 and PM gt 0.0)])
                                ;fit = linfit(mplot[where(PM lt 1000.0 and PM gt 0.0)], PM[where(PM lt 1000.0 and PM gt 0.0)], $
                                ;             measure_errors=sigPM[where(PM lt 1000.0 and PM gt 0.0)])
  
                                ;print, fit
                                ;fitx = [min(mplot),max(mplot)]
                                ;fity = [fit[0]+fit[1]*min(mplot),fit[0]+fit[1]*max(mplot)]
                                ;fitx2 = (findgen( fix(1000.0*(max(mplot)-min(mplot))) ) /1000.0) + min(mplot)
                                ;fity2 = dblarr(n_elements(fitx2))
                                ;for p = 0, fitorder -1 do begin
                                ;for g = 0, n_elements((fity2)) -1 do begin
                                ;fity2[g] = fity2[g] + fit2[p]*fitx2[g]^p
                                ;endfor
                                ;endfor
  
                                ;oplot, fitx,fity, thick =2.5
                                ;oplot, fitx2, fity2, thick = 2.5, linestyle = 3.0
  
                                ;device, /close
                                ;set_plot,'x'
  
                                ;if keyword_set(OUTFILE) then outfile = outfile[0] else outfile = 'slicepmdata.txt' ;set outfile name
                                ;if keyword_set(OUTDIR) then outfile = strcompress(outdir[0]+outfile, /REMOVE_ALL)  ;set outdir name
                                ;openr, lun, outfile, /GET_LUN                                                      ;open file 
                                ;header = strarr(2)
                                ;readf, lun, header
                                ;data_pm = dblarr(5, n_elements(z))
                                ;readf, lun, data_pm
                                ;free_lun, lun
                                ;pmslope = data_pm[4,*]
                                ;pmint = data_pm[3,*]
                                ;pmslice = data_pm[1,*]
                                ;pmz = data_pm[0,*]
                                ;pmistar = data_pm[2,*]
  
                                ;slices = findgen(combineslices) + startslice
                                ;pmslope[slices] = fit[1]
                                ;pmint[slices] = fit[0]
  
                                ;openw, lun, 'I1I2sliceweightszf40/slicepmdata.dat', /get_lun
                                ;printf, lun, header[0]
                                ;printf, lun, header[1]
                                ;for x = 0, n_elements(pmslice) -1 do begin
                                ;printf, lun, pmz[x], pmslice[x], pmistar[x], pmint[x], pmslope[x], format = '(f12.5, 2(f12.5), f12.8, f16.8)'
                                ;endfor
                                ;free_lun, lun                 ;free memory
  
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
  
     return, 1
end
;========================================================================================================================



;========================================================================================================================
pro call_makepm_ch1ch2

  indir = '~/Desktop/sbs/'
  weightfile = 'lockman/I1I2sliceweightszf40/slice#_weights.fits'
  modelch1ch2 = 'auxillaryfiles/I1I2vsI2seqszf40_extended.fits'
  outdir = '~/Desktop/sbs/lockman/I1I2probmag/'
  outfile = 'slicepmdata_andrew.txt'
    
  
  zrange = [0.8, 2.5]


  result = makepm_ch1ch2(modelch1ch2, weightfile, zrange, DENTHRESH=0.01, KERTYPE=1, INDIR=indir, OUTFILE=outfile, $
                         OUTDIR=outdir, VERBOSE=2, /SCREENP, /WRITEP, /HELP) 
  if result eq 1 then print, 'Make P(m) passed: YES'





end
;========================================================================================================================
