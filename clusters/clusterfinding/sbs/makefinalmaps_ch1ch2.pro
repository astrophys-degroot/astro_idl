;========================================================================================================================
function makefinalmaps_ch1ch2, weightdata, model1, model2, pmfile, zrange, PIXSIZE=pixsize, FIELDSIZE=fieldsize, $
                               KERTYPE=kertype, KERSIZ=kersiz, $
                               DATADIR=datadir, AUXDIR=auxdir, OUTDIR=OUTDIR, $
                               VERBOSE=verbose, HELP=help, SCREENP=screenp, WRITEP=writep
  

;+
; NAME:
;       MAKEFINALMAPS_CH1CH2()
;
; PURPOSE:
;       This program makes the final cluster density maps using the
;       pre-computed colour weights, as well as the P(M) data from the
;       file slicepmdata.dat
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
;       A. DeGroot, 2012 Nov 8, Univ. Cali, Riverside v3.0.1
;       A. DeGroot, 2012 Sept 11, Univ. Cali, Riverside v3.0.0
;          -fixed major problem of reading in correct weight file
;          -fixed minor problem of maps printing to screen
;       A. DeGroot, 2012 Aug 2, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 June, v1.0.0
;-
  

  if n_params() lt 5 then begin                                                                             ;tests # of params 
     print, 'Number of parameters given: ', n_params()                                                      ;prints info
     print, 'USAGE: result = makefinalmaps_ch1ch2(weightfile, 1 modelfile, 2 modelfile, P(m) file, zrange)' ;prints info
     print, 'OPTIONAL USAGE: TBD'                                                                           ;prints info
     return, 0                                                                                              ;returns null
  endif                                                                                                     ;ends test # params
  
  if keyword_set(PIXSIZE) then pixsize = pixsize[0] else pixsize = 125.0                        ;sets new value [kpc]
  if keyword_set(DATADIR) then begin                                                            ;checks DATADIR keyword
     if verbose ge 3 then print, ' Directory for collecting data is: ', datadir[0]              ;print info
     weightdata = strcompress(datadir[0] + weightdata, /REMOVE_ALL)                             ;appends dir
     if verbose ge 3 then print, '  Template file name containing weight data is: ', weightdata ;prints info
  endif                                                                                         ;end check DATADIR keyword
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2                            ;sets new value
  if keyword_set(AUXDIR) then begin                                                             ;checks AUXDIR keyword
     if verbose ge 3 then print, '  Directory for gathering auxillary files is: ', auxdir[0]    ;print info
     model1 = strcompress(auxdir[0] + model1, /REMOVE_ALL)                                      ;appends directory
     if verbose ge 3 then print, '  File containing our ch1-ch2 color models is: ', model1      ;print info
     model2 = strcompress(auxdir[0] + model2, /REMOVE_ALL)                                      ;appends directory
     if verbose ge 3 then print, '  File containing our z-ch1 color models is: ', model2        ;print info
     pmfile = strcompress(auxdir[0] + pmfile, /REMOVE_ALL)                                      ;appends directory
     if verbose ge 3 then print, '  File containing our Prob(Mag) data is: ', pmfile            ;print info
  endif                                                                                         ;end check AUXDIR keyword
  if keyword_set(OUTDIR) then begin                                                             ;checks OUTDIR keyword
     if verbose ge 3 then print, ' Directory for placing all outputs is: ', outdir[0]           ;print info
  endif else outdir = ' '                                                                       ;end check OUTDIR keyword
  
  

  ;;;This section checks directories, files for validity
  if keyword_set(DATADIR) then result = file_test(datadir[0], /DIRECTORY)          ;checks directory
  if result eq 0 then begin                                                        ;if check fails
     print, ' Data directory not valid!! Program probably wont run!!'              ;prints info
     print, '  ', datadir                                                          ;print info
  endif                                                                            ;end check on fail
  if keyword_set(AUXDIR) then result = file_test(auxdir[0], /DIRECTORY)            ;checks directory
  if result eq 0 then begin                                                        ;if check fails
     print, ' Auxillary directory not valid!! Program probably wont run!!'         ;prints info
     print, '  ', auxdir                                                           ;print info
  endif                                                                            ;end check on fail
  result = file_test(model1)                                                       ;checks directory
  if result eq 0 then begin                                                        ;if check fails
     print, ' File containing ch1-ch2 models not valid!! Please supply another!!'  ;prints info
     print, '  ', model1                                                           ;print info
     stop                                                                          ;stops program
  endif                                                                            ;end check on fail
  result = file_test(model2)                                                       ;checks directory
  if result eq 0 then begin                                                        ;if check fails
     print, ' File containing z-ch1 models not valid!! Please supply another!!'    ;prints info
     print, '  ', model2                                                           ;print info
     stop                                                                          ;stops program
  endif                                                                            ;end check on fail
  result = file_test(pmfile)                                                       ;checks directory
  if result eq 0 then begin                                                        ;if check fails
     print, ' File containing prob(mag) data not valid!! Please supply another!!'  ;prints info
     print, '  ', pmfile                                                           ;print info
     stop                                                                          ;stops program
  endif                                                                            ;end check on fail
  if keyword_set(OUTDIR) then result = file_test(outdir[0], /DIRECTORY)            ;checks directory
  if result eq 0 then begin                                                        ;if check fails
     print, ' Output directory not valid!! Program probably wont run!!'            ;prints info
     print, '  ', outdir                                                           ;print info
  endif                                                                            ;end check on fail
  result = file_test(strcompress(outdir[0] + 'III2clustermaps/'), /DIRECTORY)      ;checks directory
  if result eq 0 then begin                                                        ;if check fails
     spawn, 'mkdir I1I2clustermaps'                                                ;creates directory
  endif                                                                            ;end if check fails
  print, ' '                                                                       ;spacer
  

  ;;;This section reads in files, does sanity checks
  model1 = mrdfits(model1, 1)                                                           ;reads in model file
  if keyword_set(HELP) then help, model1, /struc                                        ;offer help
  model2 = mrdfits(model2, 1)                                                           ;reads in model file
  if keyword_set(HELP) then help, model2, /struc                                        ;offer help
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
  pmdata = mrdfits(pmfile, 1)                                                           ;readsin prob(mag) file
  if keyword_set(HELP) then help, pmdata, /struc                                        ;offers help
  print, ' '                                                                            ;spacer
      

  ;;;This section does preliminary work
  angsizes = length(pixsize, 'kpc', OUTUNITS='arcsec', SECONDARY=model1.z, SECUNITS='redshift') ;calc angular size of pixel at redshift of slice

  ;;;Loop over all color slice and make grids
  for aa=nstart, nend, 1 do begin                                                                ;begin loop over color slices
     tempvar1 = weightdata                                                                       ;temp var to hold value
     if verbose ge 2 then print, ' Now on slice number: ', aa, ' at redshift of: ', model1[aa].z ;print info
     strreplace, weightdata, '#', model1[aa].z                                                   ;replace slice # in template
     weightdata = strcompress(weightdata, /REMOVE_ALL)                                           ;kills whitespace in name
     wdat = mrdfits(weightdata, 1)                                                               ;reads in weight data
     if keyword_set(HELP) then help, wdat, /struc                                                ;offers help
     result = file_test(weightdata)                                                              ;checks directory
     if result eq 0 then begin                                                                   ;if check fails
        print, ' File containing weight data not valid!!'                                        ;prints info
        print, '  ', weightdata                                                                  ;print info
        stop                                                                                     ;stops program
     endif                                                                                       ;end check on fail
     print, ' '                                                                                  ;spacer
     
     ;;;This section does some prelim work creating arrays finding sizes etc
     pmweight = dblarr(n_elements(wdat.(1)))                            ;creates array     
     minra = min(wdat.ra)                                               ;min ra of field
     mindec = min(wdat.dec)                                             ;min dec of field
     if verbose ge 3 then print, ' Min RA of this field: ', minra       ;print info
     if verbose ge 3 then print, ' Min Dec of this field: ', mindec     ;print info
     if keyword_set(FIELDSIZE) then begin                                             ;check FIELDSIZE keyword
        case n_elements(FIELDSIZE) of                                                 ;check # elements of fieldsize
           1 : begin                                                                  ;if 1 element
              field_xsize = fieldsize[0]                                              ;sets new value
              field_ysize = fieldsize[0]                                              ;sets new value
           end                                                                        ;end if 1 element
           2 : begin                                                                  ;if 2 elements
              field_xsize = fieldsize[0]                                              ;sets new value
              field_ysize = fieldsize[1]                                              ;sets new value
           end                                                                        ;end if 2 elements
           else : begin                                                               ;if neither 1 or 2 elements
              print, ' FIELDSIZE must have 1 or 2 elements!! Reverting to defaults!!' ;print info
              field_xsize = max(wdat.ra)-min(wdat.ra) + 0.2                           ;find size in 1 dir [deg]
              field_ysize = max(wdat.dec)-min(wdat.dec) + 0.2                         ;find size in 2 dir [deg]
           end                                                                        ;end if neither
        endcase                                                                       ;end check # elements 
     endif else begin                                                                 ;sets new value
        field_xsize = max(wdat.ra)-min(wdat.ra) + 0.2                                 ;find size in 1 dir [deg]
        field_ysize = max(wdat.dec)-min(wdat.dec) + 0.2                               ;find size in 2 dir [deg]
     endelse                                                                          ;end alt to FIELDSIZE keyword
     if verbose ge 3 then print, '   Field size: ', field_xsize, ' x ', field_ysize   ;print info
     
     xgrid = fix((field_xsize*3600.0) / (angsizes[aa])) + 1 ;finds int # of xpix
     ygrid = fix((field_ysize*3600.0) / (angsizes[aa])) + 1 ;finds int # of ypix
     grid = fltarr(xgrid,ygrid)                             ;creates array; population grid
     grid2 = fltarr(xgrid,ygrid)                            ;creates array; weight grid
     
     
     fxhmake, myhead
     FXADDPAR, myhead, 'BITPIX', -32, ' Bits per pixel- floating point'                       ;changes value in header
     FXADDPAR, myhead, 'NAXIS', 2, ' STANDARD FITS FORMAT'                                    ;changes value in header
     FXADDPAR, myhead, 'EQUINOX', 2000.0000, ' Mean equinox'                                  ;adds value to header
     FXADDPAR, myhead, 'RADECSYS', 'ICRS', ' Astrometric system'                              ;adds value to header
     FXADDPAR, myhead, 'CTYPE1', 'RA---TAN', ' WCS projection type for this axis'             ;adds value to header
     FXADDPAR, myhead, 'CUNIT1', 'deg', 'Axis unit'                                           ;adds value to header
     FXADDPAR, myhead, 'CRVAL1', double(((max(wdat.ra)-min(wdat.ra))/2.0)+min(wdat.ra)), $    ;cont next line
               'World coordinate on this axis'                                                ;adds value to header
     FXADDPAR, myhead, 'CRPIX1', floor(xgrid/2), 'Reference pixel on this axis'               ;adds value to header
     FXADDPAR, myhead, 'CD1_1', angsizes[aa]/3600.0, 'Linear projection matrix'               ;adds value to myhead  
     FXADDPAR, myhead, 'CD1_2', 0.000000, 'Linear projection matrix'                          ;adds value to myhead
     FXADDPAR, myhead, 'CTYPE2', 'DEC--TAN', 'WCS projection type for this axis'              ;adds value to myhead
     FXADDPAR, myhead, 'CUNIT2', 'deg', 'Axis unit'                                           ;adds value to myhead
     FXADDPAR, myhead, 'CRVAL2', double(((max(wdat.dec)-min(wdat.dec))/2.0)+min(wdat.dec)), $ ;cont next line
               'World coordinate on this axis'                                                ;adds value to myhead
     FXADDPAR, myhead, 'CRPIX2', floor(ygrid/2), 'Reference pixel on this axis'               ;adds value to myhead
     FXADDPAR, myhead, 'CD2_1', 0.000000, 'Linear projection matrix'                          ;adds value to myhead
     FXADDPAR, myhead, 'CD2_2', angsizes[aa]/3600.0, 'Linear projection matrix'               ;adds value to myhead
     

     ;;;Create the image with only galaxies in the colour slice
     if verbose ge 2 then print, '  Setting up density grid!'                                             ;prints info
     adxy, myhead, wdat.ra, wdat.dec, xs, ys                                                              ;convert RA, Dec to x, y
     for bb=0UL, n_elements(xs)-1, 1 do begin                                                             ;loop over all detections
        IF (xs[bb] EQ xs[bb]) AND (ys[bb] EQ ys[bb]) THEN grid[xs[bb],ys[bb]] = grid[xs[bb],ys[bb]] + 1.0 ;add 1 to pixel population
     endfor                                                                                               ;end loop over all detections
     if keyword_set(SCREENP) then begin                                                                   ;if SCREENP is set
        window, 0, XPOS=100, YPOS=000, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Populated Grid'             ;win options
        tvscl, grid                                                                                       ;plots populated grid
     endif                                                                                                ;end if SCREENP is set
     pname = strcompress(outdir+'populatedgrid'+string(model1[aa].z)+'.fits', /REMOVE_ALL)                ;creates plot name
     if keyword_set(WRITEP) then mwrfits, grid, pname, myhead, /CREATE                                    ;write file
     

 
     ;;;weights the grid according to weight file
     weights = where(wdat.weight GT 0.00, nweights)                                                        ;finds nonzero weights
     if verbose ge 3 then print, '   # of detections with nonzero weights: ', nweights                     ;print info
     bright = where((wdat[weights].ch2best-model1[aa].mstar_ch2) LT -1.5, nbright, $                       ;cont next line
                    COMPLEMENT=dim, NCOMPLEMENT=ndim)                                                      ;finds subsets of weigths
     if verbose ge 3 then begin                                                                            ;check verbose
        print, '    # of detectsion with nonzero weights and with m<m*-1.5 : ', nbright                    ;prints info
        print, '    # of detectsion with nonzero weights and with m>m*-1.5 : ', ndim                       ;prints info
     endif                                                                                                 ;end check verbose
     minzpm = min(model1[aa].z - pmdata.z, indzpm, /ABSOLUTE)                                              ;find matching P(m) relation
     if nbright ne 0 then pmweight[weights[bright]] = -1.5*pmdata[indzpm].pm_slope + pmdata[indzpm].pm_int ;sets weight: P(m)
     if ndim ne 0 then pmweight[weights[dim]] = $                                                          ;cont next line
        (wdat[weights[dim]].ch2best-model1[aa].mstar_ch2)*pmdata[indzpm].pm_slope + pmdata[indzpm].pm_int  ;sets weight: P(m)    
     negpmweight = where(pmweight LT 0.0, nnegpmweight)                                                    ;finds any negative weights
     if verbose ge 3 then print, '    # of detections with negative P(m) weights: ', nnegpmweight          ;prints info
     grid2[xs,ys] = grid2[xs,ys] + 1.0*wdat.weight*pmweight                                                ;populates weight grid
     test = where(grid2 LT 0.0, ntest)                                                                     ;test raw prob grid 
     if verbose ge 3 then print, '    # of negative pixels in raw weight grid: ', ntest                    ;print info
     if keyword_set(SCREENP) then begin                                                                    ;if SCREENP is set
        window, 1, XPOS=150, YPOS=025, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Weight Grid'                 ;win options
        tvscl, grid2                                                                                       ;plots populated grid
     endif                                                                                                 ;end if SCREENP is set
     pname = strcompress(outdir+'rawweightgrid'+string(model1[aa].z)+'.fits', /REMOVE_ALL)                 ;creates plot name
     if keyword_set(WRITEP) then mwrfits, grid2, pname, myhead, /CREATE                                    ;write file
     print, ' '                                                                                            ;spacer     


     ;;;This section deals with the the smoothing kernel
     if verbose ge 3 then print, '  Creating smoothing kernel!'                                           ;prints info
     if keyword_set(KERSIZ) then kersize = kersiz[0] else begin                                           ;check KERSIZE
        case 1 of                                                                                         ;check which redshift
           model1[aa].z lt 1.5 : kersize = floor((714.0*(model1[aa].z-0.8) + 1000.0) / pixsize)           ;find kernel size
           model1[aa].z ge 1.5 : kersize = floor((1500.0*(model1[aa].z-1.5) + 1500.0) / pixsize)          ;find kernel size
           else : print, ' Something is messed up!!!'                                                     ;print info
        endcase                                                                                           ;end check which redshift
     endelse                                                                                              ;end check KERSIZE
     if keyword_set(KERTYPE) then kertype = kertype[0] else kertype = 0                                   ;set new value
     case kertype of                                                                                      ;check which kernel to use
        0 : begin                                                                                         ;if choice of adam's kernel
           kernel = dblarr(200,200)                                                                       ;create array
           for x = 0, 199 do begin                                                                        ;loop over one direction
              for y = 0, 199 do begin                                                                     ;loop over another direction
                 kernel[x,y] = 0.55400953*exp(-1.965*(sqrt(((x-100.0)/(2.64))^2+((y-100.0)/(2.64))^2)))   ;kernel
              endfor                                                                                      ;end loop over other direction
           endfor                                                                                         ;end loop over one direction
        end                                                                                               ;end if choice of adam's kernel
        1 : begin                                                                                         ;if choise of gaussian kernel
           kernel = psf_gaussian(NPIX=201, FWHM=kersize[0], /DOUBLE)                                      ;create smoothing kernel
        end                                                                                               ;end choice of gaussian kernel
        else : print, '  Not a valid kernel option. Must be 0 or 1'                                       ;print info
     endcase                                                                                              ;end check kernel typ
     test = where(kernel LT 0.0, ntest)                                                                   ;test kernel for negative values
     if verbose ge 3 then print, '   # of negative pixels in convolution kernel: ', ntest                 ;print info
     if keyword_set(SCREENP) then begin                                                                   ;if SCREENP is set
        window, 2, XPOS=1100, YPOS=00, XSIZE=250, YSIZE=250, TITLE='Smoothing Kernel'                     ;win options
        tvscl, kernel, /DATA                                                                              ;plots populated grid
     endif                                                                                                ;end if SCREENP is set     
     if aa eq nstart then begin                                                                           ;check if first pass
        pname = strcompress(outdir+'kernel.fits', /REMOVE_ALL)                                            ;creates plot name
        if keyword_set(WRITEP) then mwrfits, kernel, pname, /CREATE                                       ;writes kernel 
     endif                                                                                                ;end check first pass
     if verbose ge 3 then print, '  Smoothing weight map with kernel!'                                    ;prints info
     ;hind = convolve(grid2, kernel, /NO_FT, FT_PSF=psf_FT)                                                ;Smooth the image with the kernel
     hind = convolve(grid2, kernel, FT_PSF=psf_FT)                                                   ;Smooth the image with the kernel
     test = where(hind LT 0.0, ntest)                                                                     ;test image
     if verbose ge 3 then print, '   # of negative pixels in final probability map: ', ntest              ;print info
     if keyword_set(SCREENP) then begin                                                                   ;if SCREENP is set
        window, 3, XPOS=200, YPOS=050, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Convolved Weight Grid'      ;win options
        tvscl, hind, /DATA                                                                                ;plots populated grid
     endif                                                                                                ;end if SCREENP is set
     pname = strcompress(outdir+'cmap_slice'+string(model1[aa].z)+'.fits', /REMOVE_ALL)                   ;creates plot name
     if keyword_set(WRITEP) then mwrfits, hind, pname, myhead, /CREATE                                    ;writes file
     
     
     ;;;this section deals with the bad pixel map
     bpm = fltarr(xgrid,ygrid)                                                               ;creates array
     bpm[where(grid lt 0.001, nzero)] = 0.0                                                  ;sets values in array
     bpm[where(grid ge 0.001, nnotzero)] = 1.0                                               ;sets values in array
     if verbose ge 2 then print, '  Cleaning Bad Pixel Mask'                                 ;print info
     if keyword_set(SCREENP) then begin                                                      ;if SCREENP is set
        window, 4, XPOS=250, YPOS=075, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Bad Pixel Map' ;win options
        tvscl, bpm                                                                           ;plots density map
     endif                                                                                   ;end if SCREENP is set
     pname = strcompress(outdir+'badpixelmap'+string(model1[aa].z)+'.fits', /REMOVE_ALL)     ;creates plot name
     if keyword_set(WRITEP) then mwrfits, bpm, pname, myhead, /CREATE                        ;write file
     
     
     ;;;clean bpm -- remove graininess from higher resolution maps
     outmap = fltarr(xgrid,ygrid)                                                               ;creates array
     for dd=1UL, xgrid-2, 1 do begin                                                            ;loop over x dimen of outmap
        for ee=1UL, ygrid-2, 1 do begin                                                         ;loop over y dimen of outmap
           muck = where(bpm[dd-1:dd+1,ee-1:ee+1] gt 0.0, nmuck)                                 ;demands all points in square gt 0
           if nmuck gt 0 then outmap[dd,ee] = 1.0                                               ;sets value to 1 if true
        endfor                                                                                  ;end loop over y dimen of outmap
     endfor                                                                                     ;end loop over x dimen of outmap
     if keyword_set(SCREENP) then begin                                                         ;if SCREENP is set
        window, 5, XPOS=300, YPOS=100, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Cleaned BPM'      ;win options
        tvscl, outmap                                                                           ;plots density map
     endif                                                                                      ;end if SCREENP is set
     pname = strcompress(outdir+'cleanedbadpixelmap'+string(model1[aa].z)+'.fits', /REMOVE_ALL) ;creates plot name
     if keyword_set(WRITEP) then mwrfits, outmap, pname, myhead, /CREATE                        ;write file
     print, ' '                                                                                 ;spacer
     

     ;;;Includes z band coverage using z band bmp
     zbandmap = min(abs(model1[aa].z-model2.z), bpm_index)                                          ;finds nearest z-band clustermap
     if verbose ge 3 then print, '   Redshift Offset for z band BPM:', zbandmap                     ;prints info
     zbmp = strcompress(outdir + 'cmap_weightmap' + string(model1[aa].z) +'.fits', /REMOVE_ALL)     ;make name
     strreplace, zbmp, 'I1I2', 'zI1'                                                                ;modifies name
     bpm_z = mrdfits(zbmp, 0, zbpm_header)                                                          ;reads file
     zxsize = fxpar(zbpm_header, 'NAXIS1')                                                          ;set value from header
     zysize = fxpar(zbpm_header, 'NAXIS2')                                                          ;get value from header
     if keyword_set(SCREENP) then begin                                                             ;if SCREENP is set
        window, 6, XPOS=350, YPOS=125, XSIZE=zxsize+50, YSIZE=zysize+50, TITLE='z Band Cleaned BPM' ;win options
        tvscl, bpm_z                                                                                ;plots density map
     endif                                                                                          ;end if SCREENP is set
     tempzeros = where(bpm_z LT 0.01, nzeros)                                                       ;finds where z bpm has zeros
     if verbose ge 3 then print, '  # of zeros in z band bpm', nzeros                               ;print info
     tempzinds = array_indices(bpm_z, tempzeros)                                                    ;finds indices of z bpm where zero
     gz = where(tempzinds[0,*] GE 1 AND tempzinds[1,*] GE 1 AND $                                   ;cont next line
                (tempzinds[0,*] LE zxsize-2) AND (tempzinds[1,*] LE zysize-2), ngz)                 ;find edge pixels
  
     ;;;widens the z bpm by adding zeros near zeros
     for pp=0UL, ngz-1, 1 do begin                               ;loop over bad pixels
        bpm_z[tempzinds[0,gz[pp]]-1:tempzinds[0,gz[pp]]+1, $     ;cont next line
              tempzinds[1,gz[pp]]-1:tempzinds[1,gz[pp]]+1] = 0.0 ;sets neighbor pixels to zero
     endfor                                                      ;end loop over bad pixels
     zeros = where(bpm_z LT 0.01, nzeros)                        ;refinds where z bpm has zeros
     zinds = array_indices(bpm_z, zeros)                         ;refinds indices of z bpm where zero
    
     ;;;map z bpm onto irac bpm using WCS
     xyad,  zbpm_header, transpose(zinds[0,*]), transpose(zinds[1,*]), zra, zdec ;image to WCS
     adxy, myhead, zra, zdec, ionex, ioney                                       ;WCS to image
     goodiox = where(ionex GT 0.0 AND ionex LT xgrid )                           ;image coor values are in image
     ionex = ionex[goodiox]                                                      ;keep good ones
     ioney = ioney[goodiox]                                                      ;keep good ones
     goodioy = where(ioney GT 0.0 AND ioney LT ygrid )                           ;image coor values are in image
     ionex = ionex[goodioy]                                                      ;keep good ones
     ioney = ioney[goodioy]                                                      ;keep good ones
     
     outmap[ionex,ioney] = 0                                                                    ;multiplies smoothed map by z bpm
     if keyword_set(SCREENP) then begin                                                         ;if SCREENP is set
        window, 7, XPOS=400, YPOS=150, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Final Weight Map' ;win options
        tvscl, outmap                                                                           ;plots density map
     endif                                                                                      ;end if SCREENP is set
     pname = strcompress(outdir+'cmap_weightmap'+string(model1[aa].z)+'.fits', /REMOVE_ALL)     ;creates plot name
     if keyword_set(WRITEP) then mwrfits, outmap, pname, myhead, /CREATE                        ;writes file
     
     wdat = 0                   ;reset variable
     grid = 0                   ;reset variable
     grid2 = 0                  ;reset variable
     hind = 0                   ;reset variable
     bpm = 0                    ;reset variable
     outmap = 0                 ;reset variable
     weightdata = tempvar1      ;reset variable
  endfor                        ;ends loop over slices
  spawn, 'mv *.reg ../regionfiles/' ;move files
  print, ' '                        ;spacer
  print, ' '                        ;spacer
end
;========================================================================================================================




;========================================================================================================================
pro call_makefinalmaps_ch1ch2

  datadir = '/Users/degroota/research/current8_en1clusterfinding/I1I2sliceweights/'
  weightfile = 'slice#_weights.fits'
  
  auxdir = '/Users/degroota/research/current8_en1clusterfinding/auxiliary/'
  modelch1ch2 = 'I1I2vsI2seqszf40_v3.0.fits'
  modelzch1 = 'zprimemI1vsI1seqszf40_v3.0.fits'
  pmfile = 'slicepmdata.fits'
  outdir = '/Users/degroota/research/current8_en1clusterfinding/I1I2clustermaps/'
  zrange = [1.2, 1.7]
  
  
  
  result = makefinalmaps_ch1ch2(weightfile, modelch1ch2, modelzch1, pmfile, zrange, KERTYPE=1, KERSIZ=10, $
                                DATADIR=datadir, AUXDIR=auxdir, OUTDIR=outdir, VERBOSE=3, /WRITEP, /HELP)
  
end
;========================================================================================================================
