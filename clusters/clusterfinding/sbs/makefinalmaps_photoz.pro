;========================================================================================================================
FUNCTION makefinalmaps_photoz, wfile, auxfile, zrange, FULLSTEP=fullstep, TMPCHAR=tmpchar, $
                               PIXSIZE=pixsize, FIELDSIZE=fieldsize, $
                               KERTYPE=kertype, KERSIZ=kersiz, $
                               DATADIR=datadir, OUTDIR=OUTDIR, $
                               VERBOSE=verbose, HELP=help, SCREENP=screenp, WRITEP=writep
  

;+
; NAME:
;       MAKEFINALMAPS_PHOTOZ()
;
; PURPOSE:
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
;       A. DeGroot, 2014 June 5, Univ. Cali, Riverside v1.0.0
;-
  

  IF n_params() NE 3 THEN BEGIN                                                       ;tests # of params 
     print, 'Number of parameters given: ', n_params()                                ;prints info
     print, 'USAGE: result = makefinalmaps_ch1ch2(weightfile, auxiliaryfile, zrange)' ;prints info
     print, 'OPTIONAL USAGE: TBD'                                                     ;prints info
     return, 0                                                                        ;returns null
  ENDIF                                                                               ;ends test # params
  check_dir, 1                                                                        ;compile module 
  cosmo_calc, 1                                                                       ;compile module
  
  IF keyword_set(TMPCHAR) THEN tmpchar = tmpchar[0] else tmpchar = '#'   ;sets new value [kpc]
  IF keyword_set(PIXSIZE) THEN pixsize = pixsize[0] else pixsize = 125.0 ;sets new value [kpc]
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] else verbose = 2     ;sets new value
  

  ;;;This section checks directories, files for validity
  IF verbose ge 3 THEN print, '  Template file name containing weight data is: ', wfile ;prints info
  IF keyword_set(DATADIR) THEN BEGIN                                                    ;check DATADIR keyword
     chk = file_test(datadir[0], /DIRECTORY)                                            ;checks directory
     IF chk EQ 0 THEN BEGIN                                                             ;if check fails
        print, ' Data directory not valid!! Program probably wont run!!'                ;prints info
        print, '  ', datadir                                                            ;print info
     ENDIF ELSE BEGIN                                                                   ;end check on fail
        check_indir, datadir, auxfile, NOTE='DATADIR', /TEMPLATE, VERBOSE=3             ;append directory
     ENDELSE                                                                            ;end alt to not found
  ENDIF ELSE datadir = ' '                                                              ;end check DATADIR keyword

  IF keyword_set(OUTDIR) THEN BEGIN                                        ;check OUTDIR keyword
     chk = file_test(outdir[0], /DIRECTORY)                                ;checks directory
     IF chk eq 0 THEN BEGIN                                                ;if check fails
        print, ' Output directory not valid!! Program probably wont run!!' ;prints info
        print, '  ', outdir                                                ;print info
     ENDIF ELSE BEGIN                                                      ;end check on fail
        check_outdir, outdir, VERBOSE=3                                    ;check outdir again? lol
     ENDELSE                                                               ;end alt to not found
  ENDIF ELSE outdir = ' '                                                  ;end check on fail                                                                   
  

  ;;;This section reads in files, does sanity checks
  auxdata = mrdfits(auxfile, 1, hdr)                                                   ;read in auxiliary file
  IF keyword_set(HELP) THEN help, auxdata, /STRUC                                      ;offer help
  chk = where((auxdata.z GE zrange[0]) AND (auxdata.z LE zrange[1]))                   ;find what redshifts are available
  IF chk[0] NE -1 THEN BEGIN                                                           ;if valid slices found
     nslices = n_elements(chk)                                                         ;find number of slices
  ENDIF ELSE BEGIN                                                                     ;end valid slices found
     print, 'WARNING!! No valid redshift slice found for zrange given!!'               ;print info
     print, '  Please provide a valid range between: ', min(auxdata.z), max(auxdata.z) ;print info
     stop                                                                              ;stop program
  ENDELSE                                                                              ;end no valid slices found
  
  
  ;;;This section does preliminary work
  angsizes = length(pixsize, 'kpc', OUTUNITS='arcsec', $      ;cont next line
                    SECONDARY=auxdata.z, SECUNITS='redshift') ;ang size of pixel at slice redshift
  
  ;;;Loop over all color slice and make grids
  FOR aa=0, nslices-1, 1 DO BEGIN                                                                 ;loop over color slices
     tempvar1 = wfile                                                                             ;temp var to hold value
     IF verbose ge 2 THEN print, ' Now on slice number: ', aa, ' at redshift of: ', auxdata[aa].z ;print info
     strreplace, wfile, tmpchar, auxdata[aa].z                                                    ;replace slice # in template
     wfile = strcompress(wfile, /REMOVE_ALL)                                                      ;kills whitespace in name
     check_indir, datadir, wfile, NOTE='DATADIR', /TEMPLATE, VERBOSE=3                            ;append directory
     print, wfile
     wdata = mrdfits(wfile, 1)                                                                    ;reads in weight data
     IF keyword_set(HELP) THEN help, wdata, /struc                                                ;offers help
     print, ' '                                                                                   ;spacer
     
     ;;;This section does some prelim work creating arrays finding sizes etc
     pmweight = dblarr(n_elements(wdata.(1)))                                         ;creates array     
     minra = min(wdata.ra)                                                            ;min ra of field
     mindec = min(wdata.dec)                                                          ;min dec of field
     IF verbose ge 3 THEN print, ' Min RA of this field: ', minra                     ;print info
     IF verbose ge 3 THEN print, ' Min Dec of this field: ', mindec                   ;print info
     IF keyword_set(FIELDSIZE) THEN BEGIN                                             ;check FIELDSIZE keyword
        case n_elements(FIELDSIZE) of                                                 ;check # elements of fieldsize
           1 : BEGIN                                                                  ;if 1 element
              field_xsize = fieldsize[0]                                              ;sets new value
              field_ysize = fieldsize[0]                                              ;sets new value
           END                                                                        ;end IF 1 element
           2 : BEGIN                                                                  ;if 2 elements
              field_xsize = fieldsize[0]                                              ;sets new value
              field_ysize = fieldsize[1]                                              ;sets new value
           END                                                                        ;end IF 2 elements
           ELSE : BEGIN                                                               ;if neither 1 or 2 elements
              print, ' FIELDSIZE must have 1 or 2 elements!! Reverting to defaults!!' ;print info
              field_xsize = max(wdata.ra)-min(wdata.ra) + 0.2                         ;find size in 1 dir [deg]
              field_ysize = max(wdata.dec)-min(wdata.dec) + 0.2                       ;find size in 2 dir [deg]
           END                                                                        ;end IF neither
        ENDCASE                                                                       ;end check # elements 
     ENDIF ELSE BEGIN                                                                 ;sets new value
        field_xsize = max(wdata.ra)-min(wdata.ra) + 0.2                               ;find size in 1 dir [deg]
        field_ysize = max(wdata.dec)-min(wdata.dec) + 0.2                             ;find size in 2 dir [deg]
     ENDELSE                                                                          ;end alt to FIELDSIZE keyword
     IF verbose ge 3 THEN print, '   Field size: ', field_xsize, ' x ', field_ysize   ;print info
     
     xgrid = fix((field_xsize*3600.0) / (angsizes[aa])) + 1 ;finds int # of xpix
     ygrid = fix((field_ysize*3600.0) / (angsizes[aa])) + 1 ;finds int # of ypix
     grid = fltarr(xgrid, ygrid)                            ;creates array; population grid
     grid2 = fltarr(xgrid, ygrid)                           ;creates array; weight grid
     
     
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
     IF verbose ge 2 THEN print, '  Setting up density grid!'                                             ;prints info
     adxy, myhead, wdata.ra, wdata.dec, xs, ys                                                            ;convert RA, Dec to x, y
     for bb=0UL, n_elements(xs)-1, 1 do BEGIN                                                             ;loop over all detections
        IF (xs[bb] EQ xs[bb]) AND (ys[bb] EQ ys[bb]) THEN grid[xs[bb],ys[bb]] = grid[xs[bb],ys[bb]] + 1.0 ;add 1 to pixel population
     ENDfor                                                                                               ;end loop over all detections
     IF keyword_set(SCREENP) THEN BEGIN                                                                   ;if SCREENP is set
        window, 0, XPOS=100, YPOS=000, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Populated Grid'             ;win options
        tvscl, grid                                                                                       ;plots populated grid
     ENDIF                                                                                                ;end IF SCREENP is set
     pname = strcompress(outdir+'photoz_popgrid_'+string(auxdata[aa].z)+'.fits', /REMOVE_ALL)             ;creates plot name
     IF keyword_set(WRITEP) THEN mwrfits, grid, pname, myhead, /CREATE                                    ;write file
     
 
     ;;;weights the grid according to weight file
     weights = where(wdata.weight GT 0.00, nweights)                                                       ;finds nonzero weights
     IF verbose ge 3 THEN print, '   # of detections with nonzero weights: ', nweights                     ;print info
     ;bright = where((wdat[weights].ch2best-model1[aa].mstar_ch2) LT -1.5, nbright, $                       ;cont next line
     ;               COMPLEMENT=dim, NCOMPLEMENT=ndim)                                                      ;finds subsets of weigths
     ;if verbose ge 3 THEN BEGIN                                                                            ;check verbose
     ;   print, '    # of detectsion with nonzero weights and with m<m*-1.5 : ', nbright                    ;prints info
     ;   print, '    # of detectsion with nonzero weights and with m>m*-1.5 : ', ndim                       ;prints info
     ;endIF                                                                                                 ;end check verbose
     ;minzpm = min(model1[aa].z - pmdata.z, indzpm, /ABSOLUTE)                                              ;find matching P(m) relation
     ;if nbright ne 0 THEN pmweight[weights[bright]] = -1.5*pmdata[indzpm].pm_slope + pmdata[indzpm].pm_int ;sets weight: P(m)
     ;if ndim ne 0 THEN pmweight[weights[dim]] = $                                                          ;cont next line
     ;   (wdat[weights[dim]].ch2best-model1[aa].mstar_ch2)*pmdata[indzpm].pm_slope + pmdata[indzpm].pm_int  ;sets weight: P(m)    
     ;negpmweight = where(pmweight LT 0.0, nnegpmweight)                                                    ;finds any negative weights
     ;if verbose ge 3 THEN print, '    # of detections with negative P(m) weights: ', nnegpmweight          ;prints info
     grid2[xs,ys] = grid2[xs,ys] + 1.0*wdata.weight                                         ;populates weight grid
     test = where(grid2 LT 0.0, ntest)                                                                     ;test raw prob grid 
     IF verbose ge 3 THEN print, '    # of negative pixels in raw weight grid: ', ntest                    ;print info
     IF keyword_set(SCREENP) THEN BEGIN                                                                    ;if SCREENP is set
        window, 1, XPOS=150, YPOS=025, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Weight Grid'                 ;win options
        tvscl, grid2                                                                                       ;plots populated grid
     ENDIF                                                                                                 ;end IF SCREENP is set
     pname = strcompress(outdir+'photoz_rawweightgrid_'+string(auxdata[aa].z)+'.fits', /REMOVE_ALL)        ;creates plot name
     IF keyword_set(WRITEP) THEN mwrfits, grid2, pname, myhead, /CREATE                                    ;write file
     print, ' '                                                                                            ;spacer     


     ;;;This section deals with the the smoothing kernel
     IF verbose ge 3 THEN print, '  Creating smoothing kernel!'                                         ;prints info
     IF keyword_set(KERSIZ) THEN kersize = kersiz[0] else BEGIN                                         ;check KERSIZE
        case 1 of                                                                                       ;check which redshIFt
           model1[aa].z lt 1.5 : kersize = floor((714.0*(model1[aa].z-0.8) + 1000.0) / pixsize)         ;find kernel size
           model1[aa].z ge 1.5 : kersize = floor((1500.0*(model1[aa].z-1.5) + 1500.0) / pixsize)        ;find kernel size
           else : print, ' Something is messed up!!!'                                                   ;print info
        ENDcase                                                                                         ;end check which redshIFt
     ENDelse                                                                                            ;end check KERSIZE
     IF keyword_set(KERTYPE) THEN kertype = kertype[0] else kertype = 0                                 ;set new value
     case kertype of                                                                                    ;check which kernel to use
        0 : BEGIN                                                                                       ;if choice of adam's kernel
           kernel = dblarr(200,200)                                                                     ;create array
           for x = 0, 199 do BEGIN                                                                      ;loop over one direction
              for y = 0, 199 do BEGIN                                                                   ;loop over another direction
                 kernel[x,y] = 0.55400953*exp(-1.965*(sqrt(((x-100.0)/(2.64))^2+((y-100.0)/(2.64))^2))) ;kernel
              ENDfor                                                                                    ;end loop over other direction
           ENDfor                                                                                       ;end loop over one direction
        END                                                                                             ;end IF choice of adam's kernel
        1 : BEGIN                                                                                       ;if choise of gaussian kernel
           kernel = psf_gaussian(NPIX=201, FWHM=kersize[0], /DOUBLE)                                    ;create smoothing kernel
        END                                                                                             ;end choice of gaussian kernel
        else : print, '  Not a valid kernel option. Must be 0 or 1'                                     ;print info
     ENDcase                                                                                            ;end check kernel typ
     test = where(kernel LT 0.0, ntest)                                                                 ;test kernel for negative values
     IF verbose ge 3 THEN print, '   # of negative pixels in convolution kernel: ', ntest               ;print info
     IF keyword_set(SCREENP) THEN BEGIN                                                                 ;if SCREENP is set
        window, 2, XPOS=1100, YPOS=00, XSIZE=250, YSIZE=250, TITLE='Smoothing Kernel'                   ;win options
        tvscl, kernel, /DATA                                                                            ;plots populated grid
     ENDIF                                                                                              ;end IF SCREENP is set     
     IF aa EQ 0 THEN BEGIN                                                                              ;check IF first pass
        pname = strcompress(outdir+'kernel.fits', /REMOVE_ALL)                                          ;creates plot name
        IF keyword_set(WRITEP) THEN mwrfits, kernel, pname, /CREATE                                     ;writes kernel 
     ENDIF                                                                                              ;end check first pass
     IF verbose ge 3 THEN print, '  Smoothing weight map with kernel!'                                  ;prints info
     hind = convolve(grid2, kernel, FT_PSF=psf_FT)                                                      ;Smooth the image with the kernel
     test = where(hind LT 0.0, ntest)                                                                   ;test image
     IF verbose ge 3 THEN print, '   # of negative pixels in final probability map: ', ntest            ;print info
     IF keyword_set(SCREENP) THEN BEGIN                                                                 ;if SCREENP is set
        window, 3, XPOS=200, YPOS=050, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Convolved Weight Grid'    ;win options
        tvscl, hind, /DATA                                                                              ;plots populated grid
     ENDIF                                                                                              ;end IF SCREENP is set
     pname = strcompress(outdir+'photoz_cmap_slice_'+string(auxdata[aa].z)+'.fits', /REMOVE_ALL)        ;creates plot name
     IF keyword_set(WRITEP) THEN mwrfits, hind, pname, myhead, /CREATE                                  ;writes file
     
     
     ;;;this section deals with the bad pixel map
     bpm = fltarr(xgrid,ygrid)                                                               ;creates array
     bpm[where(grid lt 0.001, nzero)] = 0.0                                                  ;sets values in array
     bpm[where(grid ge 0.001, nnotzero)] = 1.0                                               ;sets values in array
     IF verbose ge 2 THEN print, '  Cleaning Bad Pixel Mask'                                 ;print info
     IF keyword_set(SCREENP) THEN BEGIN                                                      ;if SCREENP is set
        window, 4, XPOS=250, YPOS=075, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Bad Pixel Map' ;win options
        tvscl, bpm                                                                           ;plots density map
     ENDIF                                                                                   ;end IF SCREENP is set
     pname = strcompress(outdir+'photoz_bpm_'+string(auxdata[aa].z)+'.fits', /REMOVE_ALL)    ;creates plot name
     IF keyword_set(WRITEP) THEN mwrfits, bpm, pname, myhead, /CREATE                        ;write file
     
     
     ;;;clean bpm -- remove graininess from higher resolution maps
     outmap = fltarr(xgrid,ygrid)                                                                 ;creates array
     for dd=1UL, xgrid-2, 1 do BEGIN                                                              ;loop over x dimen of outmap
        for ee=1UL, ygrid-2, 1 do BEGIN                                                           ;loop over y dimen of outmap
           muck = where(bpm[dd-1:dd+1,ee-1:ee+1] gt 0.0, nmuck)                                   ;demands all points in square gt 0
           IF nmuck gt 0 THEN outmap[dd,ee] = 1.0                                                 ;sets value to 1 IF true
        ENDfor                                                                                    ;end loop over y dimen of outmap
     ENDfor                                                                                       ;end loop over x dimen of outmap
     IF keyword_set(SCREENP) THEN BEGIN                                                           ;if SCREENP is set
        window, 5, XPOS=300, YPOS=100, XSIZE=xgrid+50, YSIZE=ygrid+50, TITLE='Cleaned BPM'        ;win options
        tvscl, outmap                                                                             ;plots density map
     ENDIF                                                                                        ;end IF SCREENP is set
     pname = strcompress(outdir+'photoz_cmap_weight_'+string(auxdata[aa].z)+'.fits', /REMOVE_ALL) ;creates plot name
     IF keyword_set(WRITEP) THEN mwrfits, outmap, pname, myhead, /CREATE                          ;write file
     print, ' '                                                                                   ;spacer
     
     
     wdat = 0                       ;reset variable
     grid = 0                       ;reset variable
     grid2 = 0                      ;reset variable
     hind = 0                       ;reset variable
     bpm = 0                        ;reset variable
     outmap = 0                     ;reset variable
     wfile = tempvar1               ;reset variable
  ENDFOR                            ;ends loop over slices
  spawn, 'mv *.reg ../regionfiles/' ;move files
  print, ' '                        ;spacer
  print, ' '                        ;spacer
END
;========================================================================================================================




;========================================================================================================================
pro call_makefinalmaps_photoz

  datadir = '/Users/degroota/research/current8_en1clusterfinding/photoz_clusterfind/photozsliceweights/'
  weightfile = 'slice_pz_#_weights.fits'
  auxiliaryfile = 'slices_pz_auxiliary.fits'
  
  outdir = '/Users/degroota/research/current8_en1clusterfinding/photoz_clusterfind/photozclustermaps/'
  zrange = [0.5, 3.0]
  
  
  
  result = makefinalmaps_photoz(weightfile, auxiliaryfile, zrange, TMPCHAR=tmpchar, KERTYPE=1, KERSIZ=10, $
                                DATADIR=datadir, OUTDIR=outdir, VERBOSE=3, /WRITEP, /HELP)
  
END

;========================================================================================================================
