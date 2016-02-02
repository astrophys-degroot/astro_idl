;========================================================================================================================
FUNCTION MYCIRCLE, xcenter, ycenter, radius

  points = (2 * !PI / 99.0) * FINDGEN(200)
  x = xcenter + radius * COS(points )
  y = ycenter + radius * SIN(points )
  
  RETURN, TRANSPOSE([[x],[y]])
END
;========================================================================================================================



;========================================================================================================================
function BACKIM, image, BACKSZ=backsz
  
  sz = size(image)
  back = fltarr(sz[1], sz[2])
  hfbin = (backsz-1)/2.0
  xmax = floor(sz[1] - (backsz-1)/2.0)
  ymax = floor(sz[2] - (backsz-1)/2.0)
  
  for xx=0UL, sz[1]-1, backsz do begin
     for yy=0UL, sz[2]-1, backsz do begin
        if xx LT hfbin then xll = 0 else xll = xx-hfbin
        if xx GT xmax then xul = sz[1]-1 else xul = floor(xx+hfbin)-1
        if yy LT hfbin then yll = 0 else yll = yy-hfbin
        if yy GT ymax then yul = sz[2]-1 else yul = floor(yy+hfbin)-1
        bit = image[xll:xul, yll:yul]
        siga = stdev(image[xll:xul, yll:yul])
        meanclip, bit, bitmean, sigb, CLIPSIG=3, MAXITER=7, SUBS=bitsubs
        if siga NE 0 then sigdrop = (siga - sigb) / siga else sigdrop = 0.0
        case 1 of
           sigdrop LT 0.2 : begin
              back[xx,yy] = bitmean
           end
           sigdrop GE 0.2 : begin
              meana = (total(bit[bitsubs])-max(bit[bitsubs])) / (n_elements(bitsubs)-1.0)
              back[xx,yy] = 2.5*meana-1.5*mean(bit[bitsubs])
           end
           else : print, 'Something has gone horribly wrong!!!'
        endcase
     endfor
  endfor
      
  return, back
end
;========================================================================================================================



;========================================================================================================================
function BACKFILTER, image, BACKSZ=backsz, BACKFTSZ=backftsz
  
  sz = size(image)
  back = fltarr(sz[1], sz[2])
  hfbin = (backsz-1)/2.0
  xmax = floor(sz[1] - (backftsz*backsz-1)/2.0)
  ymax = floor(sz[2] - (backftsz*backsz-1)/2.0)

  for xx=0UL, sz[1]-1, backsz do begin
     for yy=0UL, sz[2]-1, backsz do begin
        if image[xx,yy] NE 0 then begin
           if xx LT backftsz*hfbin then xll = 0 else xll = xx-backftsz*hfbin
           if xx GT xmax then xul = sz[1]-1 else xul = floor(xx+backftsz*hfbin)-1
           if yy LT backftsz*hfbin then yll = 0 else yll = yy-backftsz*hfbin
           if yy GT ymax then yul = sz[2]-1 else yul = floor(yy+backftsz*hfbin)-1
           bit = image[xll:xul, yll:yul]
           chk = where(bit NE 0, nchk)
           case nchk of
              0 : back[xx,yy] = 0.0
              1 : back[xx,yy] = bit[chk]
              2 : back[xx,yy] = mean(bit[chk])
              else : back[xx,yy] = median(bit[chk])
           endcase
        endif
     endfor
  endfor
 
 return, back
end
;========================================================================================================================




;========================================================================================================================
function BICUBICSPLINE, image

  
  sz = size(image)
  xs = indgen(sz[1])
  ys = indgen(sz[2])
  back1 = image
  
  for xx=0UL, sz[1]-1, 1 do begin
     chk = where(image[xx,*] NE 0, nchk)
     if nchk GT 3 then begin
        minchk = min(chk)
        maxchk = max(chk)
        fit = spline(ys[chk], image[xx,chk], ys[minchk:maxchk], /DOUBLE)
        back1[xx,minchk:maxchk] = fit
     endif
  endfor
  
  for xx=0UL, sz[2]-1, 1 do begin
     chk = where(back1[*,xx] NE 0, nchk)
     if nchk GT 3 then begin
        minchk = min(chk)
        maxchk = max(chk)
        fit = spline(xs[chk], back1[chk,xx], xs[minchk:maxchk], /DOUBLE)
        back1[minchk:maxchk,xx] = fit
     endif
  endfor

  return, back1
end
;========================================================================================================================

   


;========================================================================================================================
function make_rgbim, imared, imagre, imablu, REFIM=refim, CONVOL=convol, SCALE=scale, $
                     AS=as, BS=bs, CS=cs, BACKYES=backyes, BACKSZ=backsz, BACKFTSZ=backftsz, $
                     REGFILE=regfile, REGDIR=regdir, REGCOL=regcol, $
                     GRAPHIT=graphit, $
                     WRTMETA=wrtmeta, WRITEP=writep, OUTFILE=outfile, VERBOSE=verbose
  

;+
; NAME:
;       MAKE_RGBIM()
;
; PURPOSE:
;       
;
; CALLING SEQUENCE:
;
;       RGB = make_rgb_image(imred, imgre, imblue [, AS=as, BS=bs, CS=cs, CONVOVLE=convol, 
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
;       convol: 3 element array giving the FWHM in pixel to create a
;               2D symmetric Gaussian psf to convol the images with 
;         -again should be convol = [red, green, blue]
;       refim: interger value of 0 (red), 1(green) or 2(blue) indicating which images is
;               the reference image
;       writecon: set if you want the convold images written to file
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
;       convol(): part of NASA's idlastro library 
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
;       A. DeGroot, 2013 April 30, Univ. Cali, Riverside v3.0.0
;          -fixed major issue with header values begin written incorrectly
;       A. DeGroot, 2012 Aug 22, Univ. Cali, Riverside v2.0.0
;       I dont remember, prior to 2012 Aug 15, v1.0.0
;
; DESIRED UPGRADES
;       -included catch for if image is in 1 file unit instead of 0
;       -include ability to overlay region files
;       -include auto scaling ability
;       -include ability to subtract off the background
;-



  if (keyword_set(AS) NE 1) OR (keyword_set(BS) NE 1) or (keyword_set(CS) NE 1) then begin
     if (keyword_set(AS) NE 1) AND (keyword_set(BS) NE 1) AND (keyword_set(CS) NE 1) then begin
        print, ' Auto-scaling of images set!!'
     endif else begin
        print, ' If you set AS, BS, or CS keyword(s) you must set all 3!!!'
        stop
     endelse
  endif 
  if keyword_set(SCALE) then scale = scale else scale = ['asinh', 'asinh', 'asinh'] ;sets new value
  if keyword_set(AS) then as=as else as = [1.0, 1.0, 1.0]                           ;sets new value
  if keyword_set(BS) then bs=bs else bs = [1.0, 1.0, 1.0]                           ;sets new value
  if keyword_set(CS) then cs=cs else cs = [1.0, 1.0, 1.0]                           ;sets new value
  if keyword_set(REFIM) then refim = refim[0] else refim = 0                        ;sets new value
  if keyword_set(BACKSZ) then backsz = backsz[0] else backsz = 20                   ;sets new value
  if keyword_set(BACKFTSZ) then backftsz = backftsz[0] else backftsz = 4            ;sets new value
  if keyword_set(WRITEP) then writep = writep[0] else writep = 0                    ;sets new value
  if keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2                ;sets new value


  ;;;Read data
  print, '  RED IMAGE: ', imared
  print, '  GREEN IMAGE: ', imagre
  print, '  BLUE IMAGE: ', imablu
  imred = mrdfits(imared, 0, hdred, /SILENT) ;read in file
  redcheck = size(imred)                     ;check size of image
  imgre = mrdfits(imagre, 0, hdgre, /SILENT) ;read in file
  grecheck = size(imgre)                     ;check size of image
  imblu = mrdfits(imablu, 0, hdblu, /SILENT) ;read in file
  blucheck = size(imblu)                     ;check size of image



  ;;;safety check to make sure the image is sane

  IF grecheck[0] NE 2 THEN BEGIN                ;if first read fails
     imgre = mrdfits(imagre, 1, hdgre, /SILENT) ;read in file
     grecheck = size(imgre)                     ;check size of image
     nhdgre = n_elements(hdgre)                 ;find # of hdr lines
     hdgre = hdgre[1:nhdgre-1]                  ;remove first header line
  ENDIF                                         ;end if first read fails
  IF blucheck[0] NE 2 THEN BEGIN                ;if first read fails
     imblu = mrdfits(imablu, 1, hdblu, /SILENT) ;read in file
     blucheck = size(imblu)                     ;check size of image
     nhdblu = n_elements(hdblu)                 ;find # of hdr lines
     hdblu = hdblu[1:nhdblu-1]                  ;remove first header line
  ENDIF                                         ;end if first read fails

  help, imred
  help, imgre
  help, imblu
  
  chk = where(imred NE imred, nchk)
  if nchk NE 0 then imred[chk] = 0
  chk = where(imgre NE imgre, nchk)
  if nchk NE 0 then imgre[chk] = 0
  chk = where(imblu NE imblu, nchk)
  if nchk NE 0 then imblu[chk] = 0

  if keyword_set(GRAPHIT) THEN BEGIN
     window, 0, XPOS=100, YPOS=500, XSIZE=400, YSIZE=400
     cghistoplot, imred, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                  XTITLE = 'Values', $
                  TITLE = 'Red Image Initial', $
                  NBINS = 10000, $
                  /FREQUENCY, $
                  OMIN = median(imred)-stdev(imred), $
                  OMAX = median(imred)+2.0*stdev(imred), $
                  XRANGE = [median(imred)-0.5*stdev(imred), median(imred)+stdev(imred)]
     window, 1, XPOS=550, YPOS=500, XSIZE=400, YSIZE=400
     cghistoplot, imgre, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                  XTITLE = 'Values', $
                  TITLE = 'Green Image Initial', $
                  NBINS = 10000, $
                  /FREQUENCY, $
                  OMIN = median(imgre)-stdev(imgre), $
                  OMAX = median(imgre)+2.0*stdev(imgre), $
                  XRANGE = [median(imgre)-0.5*stdev(imgre), median(imgre)+stdev(imgre)]
     window, 2, XPOS=1000, YPOS=500, XSIZE=400, YSIZE=400
     cghistoplot, imblu, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                  XTITLE = 'Values', $
                  TITLE = 'Blue Image Initial', $
                  NBINS = 10000, $
                  /FREQUENCY, $
                  OMIN = median(imblu)-stdev(imblu), $
                  OMAX = median(imblu)+2.0*stdev(imblu), $
                  XRANGE = [median(imblu)-0.5*stdev(imblu), median(imblu)+stdev(imblu)]
  ENDIF
  
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
     


  ;;;Substact off the images' background
     if keyword_set(BACKYES) THEN BEGIN                                      ;subtract background
        if verbose GE 1 then print, ' Subtracting background from images...' ;print info
        tick = systime(/SECONDS)                                             ;find start time
       
        backred = BACKIM(imred, BACKSZ=backsz)                          ;find back mesh
        backred = BACKFILTER(backred, BACKSZ=backsz, BACKFTSZ=backftsz) ;filter back mesh
        backred = BICUBICSPLINE(backred)                                ;fit back mesh
        imred = imred - backred                                         ;subtract background
        
        backgre = BACKIM(imgre, BACKSZ=backsz)                          ;find back mesh
        backgre = BACKFILTER(backgre, BACKSZ=backsz, BACKFTSZ=backftsz) ;filter back mesh
        backgre = BICUBICSPLINE(backgre)                                ;fit back mesh
        imgre = imgre - backgre                                         ;subtract background
        
        backblu = BACKIM(imblu, BACKSZ=backsz)                          ;find back mesh
        backblu = BACKFILTER(backblu, BACKSZ=backsz, BACKFTSZ=backftsz) ;filter back mesh
        backblu = BICUBICSPLINE(backblu)                                ;fit back mesh
        imblu = imblu - backblu                                         ;subtract background
        
        if keyword_set(WRTMETA) then begin            ;check WRTMETA keyword
           strreplace, imared, '.fits', '_bksub.fits' ;modify name
           mwrfits, imred, imared, hdred, /CREATE     ;write file
           strreplace, imagre, '.fits', '_bksub.fits' ;modify name
           mwrfits, imgre, imagre, hdgre, /CREATE     ;write file
           strreplace, imablu, '.fits', '_bksub.fits' ;modify name
           mwrfits, imblu, imablu, hdblu, /CREATE     ;write file
        endif                                         ;end check WRTMETA keyword

        if keyword_set(GRAPHIT) THEN BEGIN
           window, 3, XPOS=100, YPOS=425, XSIZE=400, YSIZE=400
           cghistoplot, imred, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                        XTITLE = 'Values', $
                        TITLE = 'Red Image Back Sub', $
                        NBINS = 10000, $
                        /FREQUENCY, $
                        OMIN = median(imred)-stdev(imred), $
                        OMAX = median(imred)+2.0*stdev(imred), $
                        XRANGE = [median(imred)-0.5*stdev(imred), median(imred)+stdev(imred)]
           window, 4, XPOS=550, YPOS=425, XSIZE=400, YSIZE=400
           cghistoplot, imgre, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                        XTITLE = 'Values', $
                        TITLE = 'Green Image Back Sub', $
                        NBINS = 10000, $
                        /FREQUENCY, $
                        OMIN = median(imgre)-stdev(imgre), $
                        OMAX = median(imgre)+2.0*stdev(imgre), $
                        XRANGE = [median(imgre)-0.5*stdev(imgre), median(imgre)+stdev(imgre)]
           window, 5, XPOS=1000, YPOS=425, XSIZE=400, YSIZE=400
           cghistoplot, imblu, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                        XTITLE = 'Values', $
                        TITLE = 'Blue Image Back Sub', $
                        NBINS = 10000, $
                        /FREQUENCY, $
                        OMIN = median(imblu)-stdev(imblu), $
                        OMAX = median(imblu)+2.0*stdev(imblu), $
                        XRANGE = [median(imblu)-0.5*stdev(imblu), median(imblu)+stdev(imblu)]
        ENDIF
        tock = systime(/SECONDS)                                               ;find end tim
        if verbose ge 1 then print, '  Time elapsed to subtract image background: ', $ ;cont next line
                                    fix(tock-tick), 's'                                ;print info
     ENDIF                                                                            ;end subtract background

  ;;;Convols the images if so desired
     if keyword_set(CONVOL) then begin                                           ;check CONVOL keyword
        tick = systime(/SECONDS)                                                 ;find start time
        sizecon = size(convol)                                                   ;size of array
        if sizecon[1] eq 3 then begin                                            ;check size of CONVOL array
           if verbose ge 2 then print, '  Convolving images!!'                   ;print info
           redpsf = psf_gaussian(NPIX=3.0*convol[0], FWHM=convol[0], /NORMALIZE) ;create psf
           convred = convolve(imred, redpsf)                                     ;convolve image
           imred = 0                                                             ;free memory
           if verbose ge 3 then print, '   Red image convolved!!'                ;print info
           grepsf = psf_gaussian(NPIX=3.0*convol[1], FWHM=convol[1], /NORMALIZE) ;create psf
           convgre = convolve(imgre, grepsf)                                     ;convolve image
           imgre = 0                                                             ;free memory
           if verbose ge 3 then print, '   Green image convolved!!'              ;print info
           blupsf = psf_gaussian(NPIX=3.0*convol[2], FWHM=convol[2], /NORMALIZE) ;create psf
           convblu = convolve(imblu, blupsf)                                     ;convolve image
           imblu = 0                                                             ;free memory
           if verbose ge 3 then print, '   Blue image convolved!!'               ;print info
        endif else begin                                                         ;end check CONVOLVE array
           print, 'CONVOLVE array must be 3 item array!!'                        ;print info
           print, 'CONVOLVE should be [FWHM1, FWHM2, FWHM3] in [pixels]'         ;print info
        endelse                                                                  ;end alt to CONVOLVE size
        if keyword_set(WRTMETA) then begin                                       ;check WRITECON keyword
           print, '  Writing convolved images!'                                  ;print info
           strreplace, imared, '_bksub.fits', '_conv.fits'                       ;modify name
           mwrfits, convred, imared, hdred, /CREATE                              ;write file
           strreplace, imagre, '_bksub.fits', '_conv.fits'                       ;modify name
           mwrfits, convgre, imagre, hdgre, /CREATE                              ;write file
           strreplace, imablu, '_bksub.fits', '_conv.fits'                       ;modify name
           mwrfits, convblu, imablu, hdblu, /CREATE                              ;write file
        endif                                                                    ;end check WRITECON keyword
 
        if keyword_set(GRAPHIT) THEN BEGIN
           window, 6, XPOS=100, YPOS=350, XSIZE=400, YSIZE=400
           cghistoplot, convred, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                        XTITLE = 'Values', $
                        TITLE = 'Red Image Conv', $
                        NBINS = 10000, $
                        /FREQUENCY, $
                        OMIN = median(convred)-stdev(convred), $
                        OMAX = median(convred)+2.0*stdev(convred), $
                        XRANGE = [median(convred)-0.5*stdev(convred), median(convred)+stdev(convred)]
           window, 7, XPOS=550, YPOS=350, XSIZE=400, YSIZE=400
           cghistoplot, convgre, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                        XTITLE = 'Values', $
                        TITLE = 'Green Image Conv', $
                        NBINS = 10000, $
                        /FREQUENCY, $
                        OMIN = median(convgre)-stdev(convgre), $
                        OMAX = median(convgre)+2.0*stdev(convgre), $
                        XRANGE = [median(convgre)-0.5*stdev(convgre), median(convgre)+stdev(convgre)]
           window, 8, XPOS=1000, YPOS=350, XSIZE=400, YSIZE=400
           cghistoplot, convblu, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                        XTITLE = 'Values', $
                        TITLE = 'Blue Image Conv', $
                        NBINS = 10000, $
                        /FREQUENCY, $
                        OMIN = median(convblu)-stdev(convblu), $
                        OMAX = median(convblu)+2.0*stdev(convblu), $
                        XRANGE = [median(convblu)-0.5*stdev(convblu), median(convblu)+stdev(convblu)]
        ENDIF
        tock = systime(/SECONDS)                                             ;find end time
        if verbose ge 1 then print, '  Time elapsed to convolve images: ', $ ;cont next line
                                    fix(tock-tick), 's'                      ;print info
     endif else begin                                                        ;end check CONVOLVE keyword
        convred = imred                                                      ;pass on image
        imred = 0                                                            ;free memory
        convgre = imgre                                                      ;pass on image
        imgre = 0                                                            ;free memory
        convblu = imblu                                                      ;pass on image
        imblu = 0                                                            ;free memory
     endelse                                                                 ;end alt 
     

     
  ;;;Buffer up image
     bigred = dblarr(2.0*redxsize, 2.0*redysize)                ;create padded array
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
     case refim of                                              ;check refim val
        0: begin                                                ;if refim indicates red
           hastrom, biggre, hdgre, hdred, MISSING=0             ;transform green to red
           hastrom, bigblu, hdblu, hdred, MISSING=0             ;transform green to red
        end                                                     ;end if refim indicates red
        1: begin                                                ;if refim indicates green
           hastrom, bigred, hdred, hdgre, MISSING=0             ;transform red to green
           hastrom, bigblu, hdblu, hdgre, MISSING=0             ;transform blue to green 
        end                                                     ;end if refim indicates green
        2: begin                                                ;if refim indicates blue
           hastrom, bigred, hdred, hdblu, MISSING=0             ;transform red to blue
           hastrom, biggre, hdgre, hdblu, MISSING=0             ;transform green to blue
        end                                                     ;end if refim indicates blue
        else : begin                                            ;if refim not valid
           print, 'Reference image value not valid!!!'          ;print info
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
     minx = max([min([redinds[0,*]]), min([greinds[0,*]]), min([bluinds[0,*]])]) + 1 ;find overall min x
     maxx = min([max([redinds[0,*]]), max([greinds[0,*]]), max([bluinds[0,*]])]) - 1 ;find overall max x
     miny = max([min([redinds[1,*]]), min([greinds[1,*]]), min([bluinds[1,*]])]) + 1 ;find overall min y
     maxy = min([max([redinds[1,*]]), max([greinds[1,*]]), max([bluinds[1,*]])]) - 1 ;find overall max y
     
     
     
  ;;;Cut off excess buffer in images
     bigred = bigred[minx:maxx, miny:maxy]  ;trim image
     redxcr = fxpar(hdred, 'CRPIX1')        ;mods x ref in header
     redycr = fxpar(hdred, 'CRPIX2')        ;mods y ref in header
     fxaddpar, hdred, 'CRPIX1', redxcr-minx ;update x ref in header 
     fxaddpar, hdred, 'CRPIX2', redycr-miny ;update y ref in header 
     fxaddpar, hdred, 'NAXIS1', maxx-minx   ;update x size in header 
     fxaddpar, hdred, 'NAXIS2', maxy-miny   ;update y size in header 
     biggre = biggre[minx:maxx, miny:maxy]  ;trim image
     grexcr = fxpar(hdgre, 'CRPIX1')        ;mods x ref in header
     greycr = fxpar(hdgre, 'CRPIX2')        ;mods y ref in header
     fxaddpar, hdgre, 'CRPIX1', grexcr-minx ;update x ref in header 
     fxaddpar, hdgre, 'CRPIX2', greycr-miny ;update y ref in header 
     fxaddpar, hdgre, 'NAXIS1', maxx-minx   ;update x size in header 
     fxaddpar, hdgre, 'NAXIS2', maxy-miny   ;update y size in header 
     bigblu = bigblu[minx:maxx, miny:maxy]  ;trim image
     bluxcr = fxpar(hdblu, 'CRPIX1')        ;mods x ref in header
     bluycr = fxpar(hdblu, 'CRPIX2')        ;mods y ref in header
     fxaddpar, hdblu, 'CRPIX1', bluxcr-minx ;update x ref in header 
     fxaddpar, hdblu, 'CRPIX2', bluycr-miny ;update y ref in header 
     fxaddpar, hdblu, 'NAXIS1', maxx-minx   ;update x size in header 
     fxaddpar, hdblu, 'NAXIS2', maxy-miny   ;update y size in header 
     
   
    
  ;;;Scale the images
     if verbose GE 1 then print, ' Scaling images...' ;print info
     tick = systime(/SECONDS)                         ;find start time

     case scale[0] of                                                                         ;check SCALE keyword
        'none' : bigred = bigred                                                              ;apply 
        'asinh' : begin                                                                       ;choose asinh 
           bigred = asinh(bigred*as[0])                                                       ;apply arcsin
           bigred = bigred + bs[0]                                                            ;add constant
           bigred = bigred*cs[0]                                                              ;scale 
        end                                                                                   ;end choice asinh
        '2root' : bigred = bigred^0.50                                                        ;apply sqrt
        '3root' : bigred = bigred^0.333                                                       ;apply cubrt
        '4root' : bigred = bigred^0.25                                                        ;apply 4th root
        '5root' : bigred = bigred^0.20                                                        ;apply 5th root
     endcase                                                                                  ;end check scale keyword
     chk = where((bigred NE bigred) OR (bigred LT 0), nchk)                                   ;find below zero values
     if nchk NE 0 THEN bigred[chk] = 0                                                        ;set floor
     chk = where(bigred GT 256, nchk)                                                         ;find above byte color values
     if nchk NE 0 THEN bigred[chk] = 256                                                      ;set ceiling

     case scale[1] of                                      ;check SCALE keyword
        'none' : biggre = biggre                           ;apply arcsin
        'asinh' : begin                                    ;choose asinh 
           biggre = asinh(biggre*as[1])                    ;apply arcsin
           biggre = biggre + bs[1]                         ;add constant
           biggre = biggre*cs[1]                           ;scale 
        end                                                ;end choice asinh
        '2root' : biggre = biggre^0.50                     ;apply sqrt
        '3root' : biggre = biggre^0.333                    ;apply cubrt
        '4root' : biggre = biggre^0.25                     ;apply 4th root
        '5root' : biggre = biggre^0.20                     ;apply 5th root
     endcase                                               ;end check scale keyword
     chk = where((biggre NE biggre) OR (biggre LT 0), nchk) ;find below zero values
     if nchk NE 0 THEN biggre[chk] = 0                      ;set floor
     chk = where(biggre GT 256, nchk)                       ;find above byte color values
     if nchk NE 0 THEN biggre[chk] = 256                    ;set ceiling

     
     case scale[2] of                                                                         ;check SCALE keyword
        'none' : bigblu = bigblu                                                              ;apply arcsin
        'asinh' : begin                                                                       ;choose asinh 
           bigblu = asinh(bigblu*as[2])                                                       ;apply arcsin
           bigblu = bigblu + bs[2]                                                            ;add constant
           bigblu = bigblu*cs[2]                                                              ;scale 
        end                                                                                   ;end choice asinh
        '2root' : bigblu = bigblu^0.50                                                        ;apply sqrt
        '3root' : bigblu = bigblu^0.333                                                       ;apply cubrt
        '4root' : bigblu = bigblu^0.25                                                        ;apply 4th root
        '5root' : bigblu = bigblu^0.20                                                        ;apply 5th root
     endcase                                                                                  ;end check scale keyword
     chk = where((bigblu NE bigblu) OR (bigblu LT 0), nchk)                                   ;find below zero values
     if nchk NE 0 THEN bigblu[chk] = 0                                                        ;set floor
     chk = where(bigblu GT 256, nchk)                                                         ;find above byte color values
     if nchk NE 0 THEN bigblu[chk] = 256                                                      ;set ceiling
     
     if keyword_set(WRTMETA) then begin
        strreplace, imared, '_conv.fits', '_final.fits' ;modify name
        mwrfits, bigred, imared, hdred, /CREATE         ;write file
        strreplace, imagre, '_conv.fits', '_final.fits' ;modify name
        mwrfits, biggre, imagre, hdgre, /CREATE         ;write file
        strreplace, imablu, '_conv.fits', '_final.fits' ;modify name
        mwrfits, bigblu, imablu, hdblu, /CREATE         ;write file
     endif
     
     if keyword_set(GRAPHIT) THEN BEGIN
        window, 9, XPOS=100, YPOS=350, XSIZE=400, YSIZE=400
        cghistoplot, bigred, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                     XTITLE = 'Values', $
                     TITLE = 'Red Image Final', $
                     NBINS = 10000, $
                     /FREQUENCY, $
                     OMIN = 2.0, $
                     OMAX = median(bigred)+10.0*stdev(bigred), $
                     XRANGE = [2.0, median(bigred)+10.0*stdev(bigred)], $
                     YRANGE = [0.0, 0.001]
        window, 10, XPOS=550, YPOS=350, XSIZE=400, YSIZE=400
        cghistoplot, biggre, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                     XTITLE = 'Values', $
                     TITLE = 'Green Image Final', $
                     NBINS = 10000, $
                     /FREQUENCY, $
                     OMIN = 2.0, $
                     OMAX = median(biggre)+10.0*stdev(biggre), $
                     XRANGE = [2.0, median(biggre)+10.0*stdev(biggre)], $
                     YRANGE = [0.0, 0.001]
         window, 11, XPOS=1000, YPOS=350, XSIZE=400, YSIZE=400
        cghistoplot, bigblu, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $
                     XTITLE = 'Values', $
                     TITLE = 'Blue Image Final', $
                     NBINS = 10000, $
                     /FREQUENCY, $
                     OMIN = 2.0, $
                     OMAX = median(bigblu)+10.0*stdev(bigblu), $
                     XRANGE = [2.0, median(bigblu)+10.0*stdev(bigblu)], $
                     YRANGE = [0.0, 0.001]
      ENDIF


  ;;;Set images in 3D array
     RGBim = fltarr(maxx-minx+1, maxy-miny+1, 3) ;creates new array
     RGBim[*,*,0] = bigred                       ;sets array values
     RGBim[*,*,1] = biggre                       ;sets array values
     RGBim[*,*,2] = bigblu                       ;sets array values
     

  ;;;Make and write image
     window, 12, XPOS=200, YPOS=200, XSIZE=700, YSIZE=700                       ;window attributes
     cgimage, RGBim, /KEEP_ASPECT_RATIO, OPOSITION=rgbim_opos, /SAVE            ;plot color image
     if keyword_set(REGFILE) then begin                                         ;check for a region file
        nregs = n_elements(REGFILE)                                             ;how many region files
        FOR xx=0, nregs-1, 1 DO BEGIN                                           ;loop over regfiles
           CASE n_elements(REGDIR) OF                                           ;# of regdirs provided
              -1 : BEGIN                                                        ; if not set
                 if verbose GE 3 THEN print, '   REGDIR keyword not set!'       ;print info
              END                                                               ;end if not set
              1 : BEGIN                                                         ;if one directory provided
                 values = readds9(regfile[xx], DIR=regdir[0], VERBOSE=verbose)  ;read reg w/ reg dir set
              END                                                               ;end if only one provided
              nregs : BEGIN                                                     ;if one reg dir for each reg file
                 values = readds9(regfile[xx], DIR=regdir[xx], VERBOSE=verbose) ;read reg w/ reg dir set     
              END                                                               ;end if one for each reg file
              ELSE : BEGIN                                                      ;catch all
                 print, '   WARNING: # or region directory NE # of regions!!'   ;warning
                 xregdir = regdir[0]                                            ;use only the first one
              END                                                               ;end catch all
           ENDCASE                                                              ;end how many reg dirs
           adxy, hdred, values.ra, values.dec, xs, ys                           ;change to image coordinates
           CASE n_elements(REGCOL) OF                                           ;# of reg colors provided
              -1 : BEGIN                                                        ; if not set
                 if verbose GE 3 THEN print, '   REGCOL keyword not set!'       ;print info
                 xregcol = 'CYAN'                                              ;set to default color
              END                                                               ;end if not set
              1 : BEGIN                                                         ;if one colorectory provided
                 xregcol = regcol[0]                                            ;read reg w/ reg color set
              END                                                               ;end if only one provided
              nregs : BEGIN                                                     ;if one reg color for each reg file
                 xregcol = regcol[xx]                                           ;read reg w/ reg color set     
              END                                                               ;end if one for each reg file
              ELSE : BEGIN                                                      ;catch all
                 print, '   WARNING: # of region colors NE # of regions!!'      ;warning
                 xregcol = 'WHITE'                                              ;use only the first one
              END                                                               ;end catch all
           ENDCASE                                                              ;end how many reg colors
 
           for yy=0, n_elements(xs)-1, 1 do begin                               ;loop over regions
              cgplots, mycircle(xs[yy], ys[yy], 8), /DATA, COLOR=xregcol        ;plot data
           endfor                                                               ;end loop over regions
        ENDFOR                                                                  ;end loop over reg files
     endif                                                                      ;end if region file
     
     a = PSWINDOW()                                                                        ;get current window parameters
     case WRITEP of                                                                        ;check case of WRITEP
        0 : begin                                                                          ;if WRITEP is set to nothing
           print, 'No file written.'                                                       ;print info
        end                                                                                ;end WRITEP set to nothign
        1 : begin                                                                          ;WRITEP is set to jpeg 
           if keyword_set(OUTFILE) then outfile = outfile[0] else outfile = 'rgbimage.jpg' ;set outname
           write_jpeg, outfile, RGBim, TRUE=3, QUALITY=100                                 ;write image
        end                                                                                ;end WRITEP set to jpeg
        2 : begin                                                                          ;WRITEP is set to postscript
           if keyword_set(OUTFILE) then outfile = outfile[0] else outfile = 'rgbimage.ps'  ;set outname
           set_plot, 'ps'                                                                  ;set plot to postscript
           device, FILENAME=outfile, /COLOR, XSIZE=a.xsize, YSIZE=a.ysize, $               ;set plot options
                   XOFFSET=a.xoffset, $                                                    ;set plot options
                   YOFFSET=a.yoffset, $                                                    ;set plot options
                   /INCHES                                                                 ;set device
           cgimage, RGBim, /KEEP_ASPECT_RATIO, OPOSITION=rgbim_opos, /SAVE                 ;plot color image
           if keyword_set(REGFILE) then begin                                              ;check for a region file
              nregs = n_elements(REGFILE)                                                  ;how many region files
              FOR xx=0, nregs-1, 1 DO BEGIN                                                ;loop over regfiles
                 CASE n_elements(REGDIR) OF                                                ;# of regdirs provided
                    -1 : BEGIN                                                             ; if not set
                       if verbose GE 3 THEN print, '   REGDIR keyword not set!'            ;print info
                    END                                                                    ;end if not set
                    1 : BEGIN                                                              ;if one directory provided
                       values = readds9(regfile[xx], DIR=regdir[0], VERBOSE=verbose)       ;read reg w/ reg dir set
                    END                                                                    ;end if only one provided
                    nregs : BEGIN                                                          ;if one reg dir for each reg file
                       values = readds9(regfile[xx], DIR=regdir[xx], VERBOSE=verbose)      ;read reg w/ reg dir set     
                    END                                                                    ;end if one for each reg file
                    ELSE : BEGIN                                                           ;catch all
                       print, '   WARNING: # or region directory NE # of regions!!'        ;warning
                       xregdir = regdir[0]                                                 ;use only the first one
                    END                                                                    ;end catch all
                 ENDCASE                                                                   ;end how many reg dirs
                 adxy, hdred, values.ra, values.dec, xs, ys                      ;change to image coordinates
                 print, values.ra, values.dec
                 CASE n_elements(REGCOL) OF                                      ;# of reg colors provided
                    -1 : BEGIN                                                             ; if not set
                       if verbose GE 3 THEN print, '   REGCOL keyword not set!'            ;print info
                       xregcol = 'CYAN'                                                    ;set to default color
                    END                                                                    ;end if not set
                    1 : BEGIN                                                              ;if one colorectory provided
                       xregcol = regcol[0]                                                 ;read reg w/ reg color set
                    END                                                                    ;end if only one provided
                    nregs : BEGIN                                                          ;if one reg color for each reg file
                       xregcol = regcol[xx]                                                ;read reg w/ reg color set     
                    END                                                                    ;end if one for each reg file
                    ELSE : BEGIN                                                           ;catch all
                       print, '   WARNING: # of region colors NE # of regions!!'           ;warning
                       xregcol = 'WHITE'                                                   ;use only the first one
                    END                                                                    ;end catch all
                 ENDCASE                                                                   ;end how many reg colors
                 
                 for yy=0, n_elements(xs)-1, 1 do begin                           ;loop over regions
                    cgplots, mycircle(xs[yy], ys[yy], 5), /DATA, COLOR=xregcol, $ ;
                             THICK=7.0                                            ;plot data
                 endfor                                                           ;end loop over regions
              ENDFOR                                                              ;end loop over reg files
           endif                                                                  ;end if region file
           device, /CLOSE                                                         ;close device
           set_plot, 'x'                                                          ;reset plot to nothing
        end                                                                       ;end WRITEP set to postcript
        else : print, 'Something has gone very wrong!'                            ;fail safe
     endcase                                                                      ;end check of WRITEP
     print, ' '                                                                   ;spacer
     

  endif else begin                                                       ;end if all three images exist
     print, ' RGB image making failed!! Need three valid, real images!!' ;print info
     RGBim = -9999                                                       ;set to nominal value
  endelse                                                                ;end alt to three real images
  
  return, RGBim                 ;return image  
end
;========================================================================================================================






;========================================================================================================================
pro call_make_rgbim



  imared = 'lok400_servsch1_mosaic_v1.0_conv.fits'
  imagre = 'lok400_ukidssK_mosaic_v1.0_conv.fits'
  imablu = 'lok400_sparcsz_mosaic_v1.0_conv.fits'
  regfile = ['lok400_bcg_v1.0.reg_xy_wcs_deg.reg']
  regdir = ['../regionfiles/']
  ;regcol = ['FFFFFF'XL, 'FFFF00'XL]
  regcol = ['BLUE', 'BLUE']

  ;verbose = 3
  ;out = 'en1709_rgbim_gzch1_v1.0.ps'

  
  ;RGBim = make_rgbim(imared, imagre, imablu, OUTFILE=out, VERBOSE=verbose, /BACKYES, /GRAPHIT, /WRTMETA)
  
  ;convol = [1.39,11.35,11.35]
  ;RGBim = make_rgbim(imared, imagre, imablu, OUTFILE=out, VERBOSE=verbose, CONVOL=convol, /GRAPHIT, /WRTMETA)
  
  
  RGBim = make_rgbim(imared, imagre, imablu, OUTFILE=out, VERBOSE=verbose, /WRTMETA, WRITEP=2, $ ;cont next line
                     REGFILE=regfile, REGDIR=regdir, $
                     AS=[45.0, 50.0, 15.0], BS=[-0.7, -4.5, -2.4], CS=[300.0, 80.0, 40.0])
                     ;AS=[1.0, 1.0, 10.0], BS=[0.0, 0.0, -2.5], CS=[0.0, 0.0, 70.0])

  spawn, 'open *.ps'

end
;========================================================================================================================7
