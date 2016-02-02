;========================================================================================================================
function makefinalmaps_zch1, wfile, mfile, pmfile, zrange, $
                             PIXSIZE=pixsize, KERSIZ=kersiz, FIELDSIZE=fieldsize, $
                             SCREENP=screenp, WRITEP=writep, $
                             INDIR=indir, AUXDIR=auxdir, OUTDIR=outdir, $
                             VERBOSE=verbose, HELP=help
  

;+
; NAME:
;       MAKEFINALMAPS_ZCH1()
;
; PURPOSE:
;       This program makes the final cluster density maps using the
;       pre-computed colour weights, as well as the P(M) data from the
;       file slicepmdata.dat
;       
;
; CALLING SEQUENCE:     
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
;       A. DeGroot, 2012 Sept 17, Univ. Cali, Riverside v3.1.0
;          -improved radius of convolution kernel as a function of redshift
;       A. DeGroot, 2012 Sept 11, Univ. Cali, Riverside v3.0.0
;          -fixed major problem of reading in correct weight file
;          -fixed minor problem of maps printing to screen
;       A. DeGroot, 2012 July 27, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 July 27, v1.0.0
;-

  if N_PARAMS() lt 4 then begin ;checks # of parameters provided
     print, 'Call sequence: result = (makefinalmaps_zch1, weight file, models file, P(M) file, zrange [, /WRITEF, /WRITEP ])'
     stop                                                                ;halts program
  endif                                                                  ;end check # of parameters provided
  if keyword_set(PIXSIZE) then pixsize = pixsize[0] else pixsize = 125.0 ;sets new value [kpc]
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1     ;sets new value
  cosmo_calc, 1                                                          ;compile module


  ;;;This section does preliminary file structure checks
  if keyword_set(INDIR) then begin
     indirex = file_test(indir, /DIRECTORY)
     case indirex of
        1: if verbose ge 3 then print, ' INDIR directory valid!'
        else: if verbose ge 1 then print, ' INDIR keyword set but INDIR path not valid!!'
     endcase
     mfiletest = file_test(strcompress(auxdir + mfile, /REMOVE_ALL))
     case mfiletest of 
        1 : begin
           if verbose ge 2 then print, '  Model data file found in location AUXDIR!! Proceeding!!'
           mfile = strcompress(auxdir + mfile, /REMOVE_ALL)
        end
        else : begin
           print, ' Model file not found in location AUXDIR!! Checking locally:'
           mfiletest2 = file_test(mfile)
           case mfiletest2 of
              1 : if verbose ge 2 then print, '  Model file found locally!! Proceeding!!'
              else : begin
                 print, '  Model file not found!! Please supply correct path/name of file!!'
                 stop
              end
           endcase
        end
     endcase
     pmfiletest = file_test(strcompress(auxdir + pmfile, /REMOVE_ALL))
     case pmfiletest of 
        1 : begin
           if verbose ge 2 then print, '  P(M) data file found in location AUXDIR!! Proceeding!!'
           pmfile = strcompress(auxdir + pmfile, /REMOVE_ALL)
        end
        else : begin
           print, ' P(M) file not found in location AUXIDR!! Checking locally:'
           pmfiletest2 = file_test(pmfile)
           case pmfiletest2 of
              1 : if verbose ge 2 then print, '  P(M) file found locally!! Proceeding!!'
              else : begin
                 print, '  P(M) file not found!! Please supply correct path/name of file!!'
                 stop
              end
           endcase
        end
     endcase
  endif
  
  if keyword_set(OUTDIR) then begin ;check OUTDIR keyword
     outdirex = file_test(outdir, /DIRECTORY)                                            ;test if outdir is valid
     case indirex of                                                                     ;begin case of outdir valid
        1: begin                                                                         ;outdir is valid
           if verbose ge 3 then print, ' OUTDIR directory valid!'                        ;print info
           outdir = outdir[0]                                                            ;sets value
        end                                                                              ;end outdir is valid
        else: begin                                                                      ;outdir is not vali
           if verbose ge 1 then print, ' OUTDIR keyword set but OUTDIR path not valid!!' ;print info
           outdir = ' '                                                                  ;sets value
        end                                                                              ;end outdir not valid
     endcase                                                                             ;end case of outdir valid
  endif                                                                                  ;end check OUTDIR keyword
  

  ;;;Read in color models and do sanity check
  models = mrdfits(mfile, 1)                                                            ;reads in model file
  if keyword_set(HELP) then help, models, /struc                                        ;offer help
  case (zrange[0] lt min(models.z)) of                                                  ;checks minimum z value 
     1 : begin                                                                          ;if min z value is too low
        if verbose ge 3 then print, '  Min z value is too low! Using lowest z found!'   ;print info
        zrange[0] = min(models.z)                                                       ;resets min z value
        if verbose ge 3 then print, '   Min z is now: ', zrange[0]                      ;print info
        starting = min(zrange[0]-models.z, nstart, /ABSOLUTE)                           ;find index number
     end                                                                                ;end if min z values too low
     0 : begin                                                                          ;min z value not too low
        if verbose ge 3 then print, '  Min z value is good!'                            ;print info
        starting = min(models.z-zrange[0], nstart, /ABSOLUTE)                           ;find index number
     end                                                                                ;end min z value not too low
  endcase                                                                               ;end check min z value
  case (zrange[1] gt max(models.z)) of                                                  ;checks max z value 
     1 : begin                                                                          ;max z value too high
        if verbose ge 3 then print, '  Max z value is too high! Using highest z found!' ;print info
        zrange[1] = max(models.z)                                                       ;resets max z value
        if verbose ge 3 then print, '   Max z is now: ', zrange[1]                      ;print info
        ending = min(zrange[1]-models.z, nend, /ABSOLUTE)                               ;find index number
     end                                                                                ;end max z value too high
     0 : begin                                                                          ;max z not too high
        if verbose ge 3 then print, '  Max z value is good!'                            ;print info
        ending = min(zrange[1]-models.z, nend, /ABSOLUTE)                               ;find index number
     end                                                                                ;end max z not too high
  endcase                                                                               ;end check max z value
  pmdata = mrdfits(pmfile, 1)                                                           ;readsin prob(mag) file
  if keyword_set(HELP) then help, pmdata, /struc                                        ;offers help
  print, ''                                                                             ;spacer
  
   ;;;This section does preliminary work
  angsizes = length(pixsize, 'kpc', OUTUNITS='arcsec', SECONDARY=models.z, SECUNITS='redshift') ;calc angular size of pixel at redshift of slice

  ;;;Loop over all color slice and make grids
  for aa = nstart, nend, 1 do begin
     tempvar1 = wfile                                                  ;temp var to hold value
     if verbose ge 2 then print, ' Now on slice number : ', aa         ;print info
     strreplace, wfile, '#', models[aa].z                              ;replace slice # in template
     wfile = strcompress(wfile, /REMOVE_ALL)                           ;kills whitespace in name
     if keyword_set(INDIR) then begin                                  ;check INDIR keyword
        wfiletest = file_test(strcompress(indir + wfile, /REMOVE_ALL)) ;file name to test
        case wfiletest of                                              ;check file name test 
           1 : begin
              if verbose ge 2 then print, '  Weight data file found in location INDIR!! Proceeding!!'
              wfile = strcompress(indir + wfile, /REMOVE_ALL)
           end
           else : begin
              print, ' Weight file not found in location INDIR!! Checking locally:'
              wfiletest2 = file_test(wfile)
              case wfiletest2 of
                 1 : if verbose ge 2 then print, '  Weight file found locally!! Proceeding!!'
                 else : begin
                    print, '  Weight file not found!! Please supply correct path/name of file!!'
                    stop
                 end
              endcase
        end
        endcase
     endif
     wdata = mrdfits(wfile, 1)                     ;reads in weight data
     if keyword_set(HELP) then help, wdata, /STRUC ;offers help
     print, ' '                                    ;spacer
     
    
     ;;;This section does some prelim work creating arrays finding sizes etc
     pmweight = dblarr(n_elements(wdata.(1)))                                         ;creates array     
     minra = min(wdata.ra)                                                            ;min ra of field
     mindec = min(wdata.dec)                                                          ;min dec of field
     if verbose ge 3 then print, ' Min RA of this field: ', minra                     ;print info
     if verbose ge 3 then print, ' Min Dec of this field: ', mindec                   ;print info
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
              field_xsize = max(wdata.ra)-min(wdata.ra) + 0.2                         ;find size in 1 dir [deg]
              field_ysize = max(wdata.dec)-min(wdata.dec) + 0.2                       ;find size in 2 dir [deg]
           end                                                                        ;end if neither
        endcase                                                                       ;end check # elements 
     endif else begin                                                                 ;sets new value
        field_xsize = max(wdata.ra)-min(wdata.ra) + 0.2                               ;find size in 1 dir [deg]
        field_ysize = max(wdata.dec)-min(wdata.dec) + 0.2                             ;find size in 2 dir [deg]
     endelse
     
     xgrid = fix((field_xsize*3600.0) / (angsizes[aa])) + 1 ;find int # of xpix
     ygrid = fix((field_ysize*3600.0) / (angsizes[aa])) + 1 ;finds int # of ypix
     grid = fltarr(xgrid,ygrid)                             ;creates array; population grid
     grid2 = fltarr(xgrid,ygrid)                            ;creates array; weight grid

     fxhmake, myhead
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
     if verbose ge 2 then print, ' Setting up density grid!'                                  ;prints info
     adxy, myhead, wdata.ra, wdata.dec, xs, ys                                                ;convert RA, Dec to x, y
     for bb=0UL, n_elements(xs)-1, 1 do begin                                                 ;loop over all detections
        grid[xs[bb],ys[bb]] = grid[xs[bb],ys[bb]] + 1.0                                       ;add 1 to pixel population
     endfor                                                                                   ;end loop over all detections
     if keyword_set(SCREENP) then begin                                                       ;if SCREENP is set
        window, 0, XPOS=100, YPOS=000, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Populated Grid' ;win options
        tvscl, grid                                                                           ;plots populated grid
     endif                                                                                    ;end if SCREENP is set
     pname = strcompress(outdir+'populatedgrid'+string(models[aa].z)+'.fits', /REMOVE_ALL)    ;creates plot name
     if keyword_set(WRITEP) then mwrfits, grid, pname, myhead, /CREATE                        ;write file     


     ;;;This part deals with weights, creates weight map 
     if verbose ge 2 then print, '  Creating weight map!'                                                  ;prints info
     weights = where(wdata.weight GT 0.00000, nweights)                                                    ;finds nonzero weights
     if verbose ge 3 then print, '   # of detections with nonzero weights: ', nweights                     ;print info
     bright = where((wdata[weights].ch1best-models[aa].mstar_ch1) LT -1.5, nbright, $                      ;cont next line
                    COMPLEMENT=dim, NCOMPLEMENT=ndim)                                                      ;finds subsets of weigths
     if verbose ge 3 then begin                                                                            ;check verbose
        print, '    # of detectsion with nonzero weights and with m<m*-1.5 : ', nbright                    ;prints info
        print, '    # of detectsion with nonzero weights and with m>m*-1.5 : ', ndim                       ;prints info
     endif                                                                                                 ;end check verbose
     minzpm = min(models[aa].z - pmdata.z, indzpm, /ABSOLUTE)                                              ;find matching P(m) relation
     if nbright ne 0 then pmweight[weights[bright]] = -1.5*pmdata[indzpm].pm_slope + pmdata[indzpm].pm_int ;sets weight: P(m)
     if ndim ne 0 then pmweight[weights[dim]] = $                                                          ;cont next line
        (wdata[weights[dim]].ch1best-models[aa].mstar_ch1)*pmdata[indzpm].pm_slope + pmdata[indzpm].pm_int ;sets weight: P(m)
     
     negpmweight = where(pmweight LT 0.0, nnegpmweight)                                           ;finds any negative weights
     if verbose ge 3 then print, '    # of detections with negative P(m) weights: ', nnegpmweight ;prints info
     grid2[xs,ys] = grid2[xs,ys] + 1.0*wdata.weight*pmweight                                      ;populates weight grid
     if keyword_set(SCREENP) then begin                                                           ;if SCREENP is set
        window, 1, XPOS=150, YPOS=025, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Weight Grid'        ;win options
        tvscl, grid2                                                                              ;plots populated grid
     endif                                                                                        ;end if SCREENP is set
     pname = strcompress(outdir+'rawweightgrid'+string(models[aa].z)+'.fits', /REMOVE_ALL)        ;creates plot name
     if keyword_set(WRITEP) then mwrfits, grid2, pname, myhead, /CREATE                           ;write file
     
     
     ;;;This part smoothes the weight map with given kernel
     if verbose ge 2 then print, '  Creating smoothing kernel!'                                      ;prints info
     if keyword_set(KERSIZ) then kersize = kersiz[0] else begin                                      ;check KERSIZE
        case 1 of                                                                                    ;check which redshift
           models[aa].z lt 1.5 : kersize = floor((714.0*(models[aa].z-0.8) + 1000.0) / pixsize)      ;find kernel size
           models[aa].z ge 1.5 : kersize = floor((1500.0*(models[aa].z-1.5) + 1500.0) / pixsize)     ;find kernel size
           else : print, ' Something is messed up!!!'                                                ;print info
        endcase                                                                                      ;end check which redshift
     endelse                                                                                         ;end check KERSIZE
     if verbose ge 3 then print, '   Smoothing kernel radius [pixels]', kersize                      ;print info
     kernel = psf_gaussian(NPIX=3.0*kersize[0], FWHM=kersize[0], /DOUBLE, /NORMALIZE)                ;create smoothing kernel
     if keyword_set(SCREENP) then begin                                                              ;if SCREENP is set
        window, 2, XPOS=1100, YPOS=00, XSIZE=250, YSIZE=250, TITLE='Smoothing Kernel'                ;win options
        tvscl, kernel, /DATA                                                                         ;plots populated grid
     endif                                                                                           ;end if SCREENP is set
     pname = strcompress(outdir+'smoothingkernel.fits', /REMOVE_ALL)                                 ;creates plot name
     if verbose ge 2 then print, '  Smoothing weight map with kernel!'                               ;prints info
     if keyword_set(WRITEP) AND aa eq nstart then mwrfits, kernel, pname, /CREATE                    ;writes file
     hind = convolve(grid2, kernel, /NO_FT, FT_PSF=psf_FT)                                           ;Smooth the image with the kernel
     if keyword_set(SCREENP) then begin                                                              ;if SCREENP is set
        window, 3, XPOS=200, YPOS=050, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Convolved Weight Grid' ;win options
        tvscl, hind, /DATA                                                                           ;plots populated grid
     endif                                                                                           ;end if SCREENP is set
     pname = strcompress(outdir+'cmap_slice'+string(models[aa].z)+'.fits', /REMOVE_ALL)              ;creates plot name
     if keyword_set(WRITEP) then mwrfits, hind, pname, myhead, /CREATE                               ;writes file
     

     ;;;this section creates the bad pixel map
     bpm = fltarr(xgrid,ygrid)                                                                ;creates array
     bpm[where(grid lt 0.001, nzero)] = 0.0                                                   ;sets values in array
     bpm[where(grid ge 0.001, nnotzero)] = 1.0                                                ;sets values in array
     if verbose ge 2 then print, '  Creating bad pixel mask'                                  ;print info
     if keyword_set(SCREENP) then begin                                                       ;if SCREENP is set
        window, 4, XPOS=250, YPOS=075, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Bad Pixel Mask' ;win options
        tvscl, bpm                                                                            ;plots bad pixel map
     endif                                                                                    ;end if SCREENP is set
     pname = strcompress(outdir+'badpixelmap'+string(models[aa].z)+'.fits', /REMOVE_ALL)      ;creates plot name
     if keyword_set(WRITEP) then mwrfits, bpm, pname, myhead, /CREATE                         ;write file
     

     ;;;clean bpm -- remove graininess from higher resolution maps
     outmap = fltarr(xgrid,ygrid)                                                           ;creates array
     if verbose ge 2 then print, '  Cleaning bad pixel mask!'                               ;prints info
     for dd=1UL, xgrid-2, 1 do begin                                                        ;loop over x dimen of outmap
        for ee=1UL, ygrid-2, 1 do begin                                                     ;loop over y dimen of outmap
           muck = where(bpm[dd-1:dd+1,ee-1:ee+1] gt 0.0, nmuck)                             ;demands all points in square gt 0
           if nmuck gt 0 then outmap[dd,ee] = 1.0                                           ;sets value to 1 if true
        endfor                                                                              ;end loop over y dimen of outmap
     endfor                                                                                 ;end loop over x dimen of outmap
     if keyword_set(SCREENP) then begin                                                     ;if SCREENP is set
        window, 5, XPOS=300, YPOS=100, XSIZE=xgrid+50, YSIZE=ygrid+50, $                    ;cont next line
                TITLE='Cleaned Bad Pixel Mask'                                              ;win options
        tvscl, outmap                                                                       ;plots density map
     endif                                                                                  ;end if SCREENP is set
     pname = strcompress(outdir+'cmap_weightmap'+string(models[aa].z)+'.fits', /REMOVE_ALL) ;creates plot name
     if keyword_set(WRITEP) then mwrfits, outmap, pname, myhead, /CREATE                    ;write file
     print, ' '                                                                             ;spacer
     
     wfile = tempvar1           ;reset value of variable
  endfor                        ;end loop over each redshift slice
end                             ;end makefinalmaps_zch1
;========================================================================================================================




;========================================================================================================================
pro call_makefinalmaps_zch1


  weightfile = 'zI1sliceweights/slice#_weights.fits'
  auxdir = '/Users/degroota/research/current8_en1clusterfinding/auxiliary/'
  models = 'zprimemI1vsI1seqszf40_v3.0.fits'
  pmfile = 'slicepmdata.fits' 
  zrange = [1.2, 1.7]
  
  indir = '/Users/degroota/research/current8_en1clusterfinding/'
  outdir = '/Users/degroota/research/current8_en1clusterfinding/zI1clustermaps/'
  
  result = makefinalmaps_zch1(weightfile, models, pmfile, zrange, PIXSIZE=pixsize, $
                              INDIR=indir, AUXDIR=auxdir, OUTDIR=outdir, VERBOSE=3, /WRITEP) ;, /HELP)
  

end
;========================================================================================================================
