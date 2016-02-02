;========================================================================================================================
function make_rgb_jpeg, imared, imagre, imablu, AS=as, BS=bs, CS=cs, UNICONV=uniconv, CONVOLVE=convolve, REFIM=refim, $
                        WRITECON=writecon, WRITEP=writep, OUTFILE=outfile, VERBOSE=verbose
  


;+
; NAME:
;       MAKE_HDF_JPEG()
;
; PURPOSE:
;       
;
; CALLING SEQUENCE:
;
;       RGB = make_rgb_image(imred, imgre, imblue [, AS=as, BS=bs, CS=cs, CONVOVLE=convolve, 
;                             REFMI=value, OUTFILE=name, VERBOSE=value, /WRITECON, /WRITEP])
;
; INPUTS:
;       imared: file name for red image; must be .FITS format
;       imagre: file name for gre image; must be .FITS format
;       imablu: file name for blu image; must be .FITS format
;
; OPTIONAL INPUTS:
;
;       as: scaling parameter as used in function below
;         -3 element array; should be as = [red, green, blue]
;       bs: scaling parameter as used in function below
;         -3 element array; should be bs = [red, green, blue]
;       cs: scaling parameter as used in function below
;         -3 element array; should be cs = [red, green, blue]
;
;       scaling function: 
;          red_image = (asinh(red_image*as[0])+bs[0])*cs[0]
;          gre_image = (asinh(gre_image*as[1])+bs[1])*cs[1]
;          blue_image = (asinh(blue_image*as[2])+bs[2])*cs[2]
;
;
; KEYWORD PARAMETERS:
;
; OUTPUTS:
;
;        returns one 3D array with the images stacked in the 3rd dimension
;
; OPTIONAL OUTPUTS:
;
;       convolve: 3 element array giving the FWHM in pixel to create a
;               2D symmetric Gaussian psf to convolve the images with 
;         -again should be convolve = [red, green, blue]
;       refim: interger value of 0 (red), 1(green) or 2(blue) indicating which images is
;               the reference image
;       writecon: set if you want the convolved images written to file
;       writep: set if you want the RGB images written to file
;       outfile: specify name of RGB image to be written
;       verbose: interger value of 0, 1, 2 or 3 indicated how much you
;               want printed to screen during runtime
;
; COMMON BLOCKS:
;
;       NONE
;
; PROCEDURES USED:
;
;       psf_gaussian(): part of NASA's idlastro library 
;       convolve(): part of NASA's idlastro library 
;       hastrom(): part of NASA's idlastro library 
;
; COMMENTS:
;
; EXAMPLES:
;
;       RGB = make_rgb_image('myred.fits', 'mygreen.fits', 'myblue.fits', AS=[2.3,3.3,4.3], BS=[-1.0,-1.0,-1.0], 
;                      CS=[2.4,3.4,4.5], CONVOVLE=[1.5,1.5,7.4], REFMI=0, OUTFILE='myrbg.jpg', VERBOSE=2, /WRITECON, /WRITEP])
;
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2012 Aug 22, Univ. Cali, Riverside v2.0.0
;       I dont remember, prior to 2012 Aug 15, v1.0.0
;-


  if keyword_set(AS) then as=as else as = [1.0, 1.0, 1.0]    ;sets new value
  if keyword_set(BS) then bs=bs else bs = [1.0, 1.0, 1.0]    ;sets new value
  if keyword_set(CS) then cs=cs else cs = [1.0, 1.0, 1.0]    ;sets new value
  if keyword_set(REFIM) then refim = refim[0] else refim = 0 ;sets new value
  

  ;;;Read data
  imred = mrdfits(imared, 0, hdred) ;read in file
  redcheck = size(imred)            ;check size of image
  imgre = mrdfits(imagre, 0, hdgre) ;read in file
  grecheck = size(imgre)            ;check size of image
  imblu = mrdfits(imablu, 0, hdblu) ;read in file
  blucheck = size(imblu)            ;check size of image


  if (redcheck[0] eq 2) AND (grecheck[0] eq 2) AND (blucheck[0] eq 2) then begin ;if all three images exist
     redxsize = fxpar(hdred, 'NAXIS1')                                           ;find red x size
     redysize = fxpar(hdred, 'NAXIS2')                                           ;find red y size
     redxcr = fxpar(hdred, 'CRPIX1')                                             ;find red x ref
     redycr = fxpar(hdred, 'CRPIX2')                                             ;find red y ref
     grexsize = fxpar(hdgre, 'NAXIS1')                                           ;find gre x size
     greysize = fxpar(hdgre, 'NAXIS2')                                           ;find gre y size
     grexcr = fxpar(hdgre, 'CRPIX1')                                             ;find gre x ref
     greycr = fxpar(hdgre, 'CRPIX2')                                             ;find gre y ref
     bluxsize = fxpar(hdblu, 'NAXIS1')                                           ;find blu x size
     bluysize = fxpar(hdblu, 'NAXIS2')                                           ;find blu y size
     bluxcr = fxpar(hdblu, 'CRPIX1')                                             ;find blu x ref
     bluycr = fxpar(hdblu, 'CRPIX2')                                             ;find blu y ref
     
  ;;;Convolves the images if so desired
     if keyword_set(CONVOLVE) then begin                                                   ;check CONVOLVE keyword
        sizecon = size(convolve)                                                           ;size of array
        if sizecon[1] eq 3 then begin                                                      ;check size of CONVOLVE array
           if verbose ge 2 then print, '  Convolving images!!'                             ;print info
           redpsf = psf_gaussian(NPIX=convolve[0]*3.0, FWHM=convolve[0], /DOUBLE, /NORMALIZE) ;create psf
           convred = convolve(imred, redpsf)                                                  ;convolve image
           grepsf = psf_gaussian(NPIX=convolve[1]*3.0, FWHM=convolve[1], /DOUBLE, /NORMALIZE) ;create psf
           convgre = convolve(imgre, grepsf)                                                  ;convolve image
           blupsf = psf_gaussian(NPIX=convolve[2]*3.0, FWHM=convolve[2], /DOUBLE, /NORMALIZE) ;create psf
           convblu = convolve(imblu, blupsf)                                                  ;convolve image
        endif else begin                                                                      ;end check CONVOLVE array
           print, 'CONVOLVE array must be 3 item array!!'                                     ;print info
           print, 'CONVOLVE should be [FWHM1, FWHM2, FWHM3] in [pixels]'                      ;print info
        endelse                                                                               ;end alt to CONVOLVE size
        if keyword_set(WRITECON) then begin                                                   ;check WRITECON keyword
           strreplace, imared, '.fits', '_conv.fits'                                          ;modify name
           mwrfits, convred, imared, hdred, /CREATE                                           ;write file
           strreplace, imagre, '.fits', '_conv.fits'                                          ;modify name
           mwrfits, convgre, imagre, hdgre, /CREATE                                           ;write file
           strreplace, imablu, '.fits', '_conv.fits'                                          ;modify name
           mwrfits, convblu, imablu, hdblu, /CREATE                                           ;write file
        endif                                                                                 ;end check WRITECON keyword
     endif else begin                                                                         ;end check CONVOLVE keyword
        convred = imred                                                                       ;pass on image
        imred = 0                                                                             ;free memory
        convgre = imgre                                                                       ;pass on image
        imgre = 0                                                                             ;free memory
        convblu = imblu                                                                       ;pass on image
        imblu = 0                                                                             ;free memory
     endelse                                                                                  ;end alt 
     
     
  ;;;Buffer up image
     bigred = dblarr(2.0*redxsize, 2.0*redysize)             ;create padded array
     bigred[floor(redxsize/2.0), floor(redysize/2.0)] = convred ;set small array in big
     redxcr = redxcr + floor(redxsize/2.0)                      ;finds new x ref pix
     redycr = redycr + floor(redysize/2.0)                      ;finds new y ref pix
     sxaddpar, hdred, 'CRPIX1', redxcr                          ;mods x ref in header
     sxaddpar, hdred, 'CRPIX2', redycr                          ;mods y ref in header
     sxaddpar, hdred, 'NAXIS1', floor(2.0*redxsize)             ;mods y ref in header
     sxaddpar, hdred, 'NAXIS2', floor(2.0*redysize)             ;mods y ref in header
     biggre = dblarr(2.0*grexsize, 2.0*greysize)                ;create padded array
     biggre[floor(grexsize/2.0), floor(greysize/2.0)] = convgre ;set small array in big
     grexcr = grexcr + floor(grexsize/2.0)                      ;finds new x ref pix
     greycr = greycr + floor(greysize/2.0)                      ;finds new y ref pix
     sxaddpar, hdgre, 'CRPIX1', grexcr                          ;mods x ref in header
     sxaddpar, hdgre, 'CRPIX2', greycr                          ;mods y ref in header
     sxaddpar, hdgre, 'NAXIS1', floor(2.0*grexsize)             ;mods y ref in header
     sxaddpar, hdgre, 'NAXIS2', floor(2.0*greysize)             ;mods y ref in header
     bigblu = dblarr(2.0*bluxsize, 2.0*bluysize)                ;create padded array
     bigblu[floor(bluxsize/2.0), floor(bluysize/2.0)] = convblu ;set small array in big
     bluxcr = bluxcr + floor(bluxsize/2.0)                      ;finds new x ref pix
     bluycr = bluycr + floor(bluysize/2.0)                      ;finds new y ref pix
     sxaddpar, hdblu, 'CRPIX1', bluxcr                          ;mods x ref in header
     sxaddpar, hdblu, 'CRPIX2', bluycr                          ;mods y ref in header
     sxaddpar, hdblu, 'NAXIS1', floor(2.0*bluxsize)             ;mods y ref in header
     sxaddpar, hdblu, 'NAXIS2', floor(2.0*bluysize)             ;mods y ref in header
     
     
  ;;;Align images in WCS 
     case refim of                                           ;check refim val
        0: begin                                             ;if refim indicates red
           hastrom, biggre, hdgre, hdred, MISSING=0          ;transform green to red
           hastrom, bigblu, hdblu, hdred, MISSING=0          ;transform green to red
        end                                                  ;end if refim indicates red
        1: begin                                             ;if refim indicates green
           hastrom, bigred, hdred, hdgre, MISSING=0          ;transform red to green
           hastrom, bigblu, hdblu, hdgre, MISSING=0          ;transform blue to green 
        end                                                  ;end if refim indicates green
        2: begin                                             ;if refim indicates blue
           hastrom, bigred, hdred, hdblu, MISSING=0          ;transform red to blue
           hastrom, biggre, hdgre, hdblu, MISSING=0          ;transform green to blue
        end                                                  ;end if refim indicates blue
        else : begin                                         ;if refim not valid
           print, 'Reference image value not valid!!!'       ;print info
           print, '0: Red image, 1: Green image, 2: Blue image' ;print info
        end                                                     ;end if refim not valid
     endcase                                                    ;end check refim val
     
     
  ;;;Find how much we can trim images of buffer
     redreal = where(bigred GT 0.0, nrr)                                        ;find nonpadded pixels
     if nrr gt 0 then begin                                                     ;check 
        redinds = array_indices(bigred, redreal)                                ;find x,y pos of those
     endif else redinds = [[0.0,0.0],[floor(2.0*redxsize),floor(2.0*redysize)]] ;fake to make it work
     grereal = where(biggre GT 0.0, ngr)                                        ;find nonpadded pixels
     if ngr gt 0 then begin                                                     ;check
        greinds = array_indices(biggre, grereal)                                ;find x,y pos of those
     endif else greinds = [[0.0,0.0],[floor(2.0*grexsize),floor(2.0*greysize)]] ;fake to make it work
     blureal = where(bigblu GT 0.0, nbr)                                        ;find nonpadded pixels
     if nbr gt 0 then begin                                                     ;check
        bluinds = array_indices(bigblu, blureal)                                ;find x,y pos of those 
     endif else bluinds = [[0.0,0.0],[floor(2.0*bluxsize),floor(2.0*bluysize)]] ;fake to work
     minx = min([[redinds[0,*]], [greinds[0,*]], [bluinds[0,*]]])+1             ;find overall min x
     maxx = max([[redinds[0,*]], [greinds[0,*]], [bluinds[0,*]]])-1             ;find overall max x
     miny = min([[redinds[1,*]], [greinds[1,*]], [bluinds[1,*]]])+1             ;find overall min y
     maxy = max([[redinds[1,*]], [greinds[1,*]], [bluinds[1,*]]])-1             ;find overall max y
     
     
  ;;;Cut off excess buffer in images
     bigred = bigred[minx:maxx, miny:maxy] ;trim image
     redxcr = fxpar(hdred, 'CRPIX1')       ;mods x ref in header
     redycr = fxpar(hdred, 'CRPIX2')       ;mods y ref in header
     fxaddpar, hdred, 'CRPIX1', redxcr-minx ;update x ref in header 
     fxaddpar, hdred, 'CRPIX2', redycr-miny ;update y ref in header 
     fxaddpar, hdred, 'NAXIS1', maxx-minx   ;update x size in header 
     fxaddpar, hdred, 'CRPIX2', maxy-miny   ;update y size in header 
     biggre = biggre[minx:maxx, miny:maxy]  ;trim image
     grexcr = fxpar(hdgre, 'CRPIX1')        ;mods x ref in header
     greycr = fxpar(hdgre, 'CRPIX2')        ;mods y ref in header
     fxaddpar, hdgre, 'CRPIX1', grexcr-minx ;update x ref in header 
     fxaddpar, hdgre, 'CRPIX2', greycr-miny ;update y ref in header 
     fxaddpar, hdgre, 'NAXIS1', maxx-minx   ;update x size in header 
     fxaddpar, hdgre, 'CRPIX2', maxy-miny   ;update y size in header 
     bigblu = bigblu[minx:maxx, miny:maxy]  ;trim image
     bluxcr = fxpar(hdblu, 'CRPIX1')        ;mods x ref in header
     bluycr = fxpar(hdblu, 'CRPIX2')        ;mods y ref in header
     fxaddpar, hdblu, 'CRPIX1', bluxcr-minx ;update x ref in header 
     fxaddpar, hdblu, 'CRPIX2', bluycr-miny ;update y ref in header 
     fxaddpar, hdblu, 'NAXIS1', maxx-minx   ;update x size in header 
     fxaddpar, hdblu, 'CRPIX2', maxy-miny   ;update y size in header 
     

     
     topten = floor((maxx-minx+1)*(maxy-miny+1)*0.1)
     redtop = bsort(bigred, /REVERSE)
     redtop = bigred[redtop[0:topten]]
     gretop = bsort(biggre, /REVERSE)
     gretop = biggre[gretop[0:topten]]
     blutop = bsort(bigblu, /REVERSE)
     blutop = bigblu[blutop[0:topten]]
     


     ;;;Optional unit conversion if keyword set
     if keyword_set(UNICONV) then begin                                                  ;check UNICONV keyword
        if n_elements(uniconv) EQ 3 then begin                                           ;check # of elements given
           if verbose ge 2 then print, '  Correct # of elements for unit conversion'      ;print info
           bigred = bigred * uniconv[0]                                                  ;make conversion
           biggre = biggre * uniconv[1]                                                  ;make conversion
           bigblu = bigblu * uniconv[2]                                                  ;make conversion
        endif else begin                                                                 ;end check # elements given 
           if verbose ge 1 then print, ' Incorrect # of element in UNICONV!! Skipping!!' ;print info 
        endelse                                                                          ;end alt to UNICONV check
     endif                                                                               ;end check UNICONV keyword
     
     biggre = biggre - 600.0

  ;;;Scale the images
     bigred = (asinh(bigred*as[0])+bs[0])*cs[0] ;scale red image
     rl = where(bigred LE 0.0)                  ;find too low values
     if rl[0] ne -1 then bigred[rl] = 0.0       ;correct too low values
     rh = where(bigred GT 255.0)                ;find too high values
     if rh[0] ne -1 then bigred(rh) = 255.0     ;correct too high values
     biggre = (asinh(biggre*as[1])+bs[1])*cs[1] ;scale gre image
     gl = where(biggre LE 0.0)                  ;find too low values
     if gl[0] ne -1 then biggre[gl] = 0.0       ;correct too low values
     gh = where(biggre GT 255.0)                ;find too high values
     if gh[0] ne -1 then biggre(gh) = 255.0     ;correct too high values
     bigblu = (asinh(bigblu*as[2])+bs[2])*cs[2] ;scale blu image
     bl = where(bigblu LE 0.0)                  ;find too low values
     if bl[0] ne -1 then bigblu[bl] = 0.0       ;correct too low values
     bh = where(bigblu GT 255.0)                ;find too high values
     if bh[0] ne -1 then bigblu(bh) = 255.0     ;correct too high values
 
     print, ''
     print, min(bigred), max(bigred) - min(bigred), mean(bigred)
     print, min(biggre), max(biggre) - min(biggre), mean(biggre)
     print, min(bigblu), max(bigblu) - min(bigblu), mean(bigblu)
 
     
  ;;;Set images in 3D array
     RGBim = fltarr(maxx-minx+1, maxy-miny+1, 3) ;creates new array
     RGBim[*,*,0] = bigred                       ;sets array values
     RGBim[*,*,1] = biggre                       ;sets array values
     RGBim[*,*,2] = bigblu                       ;sets array values
     

  ;;;Make and write image
     cgimage, RGBim                                                                      ;visual output
     if keyword_set(WRITEP) then begin                                                   ;check WRITEP keyword
        if keyword_set(OUTFILE) then outfile = outfile[0] else outfile = 'rgb_image.jpg' ;set outname
        write_jpeg, outfile, RGBim, TRUE=3, QUALITY=100                                  ;write image
     endif                                                                               ;end check WRITEP keyword
     print, ' '                                                                          ;spacer
  endif else begin                                                                       ;end if all three images exist
     print, ' RGB image making failed!! Need three valid, real images!!'                 ;print info
     RGBim = -9999                                                                       ;set to nominal value
  endelse                                                                                ;end alt to three real images
  
  return, RGBim                 ;return image  
end
;========================================================================================================================






;========================================================================================================================
pro call_make_rgb_jpeg



  imared = 'cl162.00259.3738_iracch1.fits'
  imagre = '118_901_43_676_13.fits'
  imablu = 'cl162.00259.3738_zband.fits'

  verbose = 2
  out = 'cl160.93459_59.2528_zkch1_rgb.jpg'

  uniconv = [8.461595, 1.0, 1.0]
  convolve = [1.33,8.0,10.8]
  
  

  
  RGBim = make_rgb_jpeg(imared, imagre, imablu, CONVOLVE=convolve, OUTFILE=out, VERBOSE=verbose, /WRITEP, $ ;cont next line
                        AS=[10.0, 1.0, 1.0], BS=[-0.5, -2.6, -2.0], CS=[175.0, 500.0, 120.0])               ;call to make RGB image
                        ;AS=[10.0, 1.0, 1.0], BS=[-0.5, -2.6, -2.0], CS=[0.0, 0.0, 120.0]) ;call to make RGB image
  

end
;========================================================================================================================
