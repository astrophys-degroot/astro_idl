;========================================================================================================================
PRO histomulticolorim, xim, TITLE=title, XMIN=XMIN, XMAX=xmax, XWINDOW=xwindow

  IF keyword_set(TITLE) THEN title = title[0] ELSE title = 'Initial Pixel Distribution' ;sets new value
  IF keyword_set(XMIN) THEN xmin = xmin[0] ELSE xmin = median(xim)-0.1*stdev(xim)       ;sets new value
  IF keyword_set(XMAX) THEN xmax = xmax[0] ELSE xmax = median(xim)+0.25*stdev(xim)      ;sets new value
  IF keyword_set(XWINDOW) THEN xwindow = xwindow[0] ELSE xwindow = 0                    ;sets new value


  ;;;make a plot
  xpos = 100 + 50*xwindow                                           ;location
  ypos = 350 - 50*xwindow                                           ;location
  chk = where((xim GE xmin) AND (xim LE xmax))                      ;yrange max
  window, xwindow, XPOS=xpos, YPOS=ypos, XSIZE=500, YSIZE=500       ;set windown
  cghistoplot, xim, /FILL, POLYCOLOR=['charcoal', 'dodger blue'], $ ;histogram call
               XTITLE = 'Values', $                                 ;plot options
               TITLE = title, $                                     ;plot options
               NBINS = 10000, $                                     ;plot options
               /FREQUENCY, $                                        ;plot options
               OMIN = median(xim)-stdev(xim), $                     ;plot options
               OMAX = median(xim)+2.0*stdev(xim), $                 ;plot options
               XRANGE = [xmin, xmax]                                ;plot options  
END
;========================================================================================================================



;========================================================================================================================
FUNCTION readmulticolorim, xfile

  bit = ' '                     ;intialize
  nims = file_lines(xfile)      ;# of images+header line
  xims = strarr(nims)           ;string array
  openr, lun, xfile, /GET_LUN   ;open file to read
  FOR xx=0, nims-1, 1 DO BEGIN  ;loop over images
     readf, lun, bit            ;read in line
     xims[xx] = bit             ;store bit
  ENDFOR                        ;end loop over images
  close, lun                    ;close file
  free_lun, lun                 ;free memory unit

  RETURN, xims
END
;========================================================================================================================



;========================================================================================================================
FUNCTION strucmulticolorim, xtags

  
  ;;;formatting and prep
  xtags = strlowcase(xtags)                           ;make sure tags are all lower case for compare
  nxtags = n_elements(xtags)                          ;find number of tags given
  allowed = ['images', 'backsub', 'convolv', 'scale'] ;allowed tag names
  flgallow = intarr(nxtags)                           ;create flag array
  flgallow[*] = 1                                     ;set all to flagged
  type = strarr(nxtags)                               ;create data type array
    

  ;;;checking for sanity
  FOR xx=0, nxtags-1, 1 DO BEGIN                                   ;loop over tags
     chk = where(xtags[xx] EQ allowed, nchk)                       ;find if tags are allowed
     IF chk[0] NE -1 THEN BEGIN                                    ;if tag allowed
        IF nchk GT 1 THEN BEGIN                                    ;if tag appears more than once
           print, ' WARNING!! Unexpected for a tag to appear ' + $ ;cont next line
                  'more than once : ', xtags[xx]                   ;print info
           print, '  Please correct input file and rerun...'       ;print info
           stop                                                    ;stop program
        ENDIF                                                      ;end if tag appears more than once
        flgallow[chk] = 0                                          ;turn flag off
        CASE xtags[xx] OF                                          ;get a data type for each tag
           'images': type[xx] = '" "'                              ;xxmage names are strxxng
           'backsub': type[xx] = '0'                               ;back subtractxxon xxs yes/no
           'convolv': type[xx] = '0.'                              ;convolv requxxres a PSF sxxze
           'scale': type[xx] = '" "'                               ;xxmage names are strxxng
           ELSE : type[xx] = '0.'                                  ;all others
        ENDCASE                                                    ;end data type for each tag
     ENDIF                                                         ;end if tag appears >1
  ENDFOR                                                           ;end loop over tags


  ;;;turning good output into a stucture
  chk = where(flgallow EQ 0, COMPLEMENT=nopass)                         ;which tags stay, which go
  IF nopass[0] NE -1 THEN BEGIN                                         ;if some tags didn't pass
     print, ' WARNING!! Some tag names were given in the header ' + $   ;cont next line
            'line which are currently unallowed. These are: '           ;print info
     print, '    ', xtags[nopass]                                       ;print tags
     print, '  Please correct input file and rerun...'                  ;print info
  ENDIF                                                                 ;end if some tags didn't pass
  IF chk[0] NE -1 THEN BEGIN                                            ;should always occur b/c already chked images
     outstruct = mrd_struct_gala(xtags[chk], type[chk], 1, /NO_EXECUTE) ;create the output structure
  ENDIF                                                                 ;end should happen
  

  RETURN, outstruct
END
;========================================================================================================================



;========================================================================================================================
FUNCTION fillmulticolorim, xparams, xstrings

  
  ;;;prep and formatting
  nims = n_elements(xstrings)                     ;find number of images
  ntags = n_elements(tag_names(xparams))          ;find # of tags in structure
  dtype = intarr(ntags)                           ;dtype array
  
  
  ;;;get data types to convert input values to
  FOR xx=0, ntags-1, 1 DO BEGIN  ;loop over tags
     tmp = size(xparams[0].(xx)) ;get characteristics
     dtype[xx] = tmp[1]          ;store data type
  ENDFOR                         ;end loop over tags 
  

  ;;;one line at a time
  FOR xx=0, nims-1, 1 DO BEGIN                                                         ;loop over number of images
     bits = strsplit(xstrings[xx], ' ', /EXTRACT)                                      ;extract bits of string
     IF n_elements(bits) NE ntags THEN BEGIN                                           ;if more info than expected
        line = strcompress(' WARNING!! In line ' + string(xx+2) + $                    ;cont next line
                           ' there are more columns than expected!')                   ;string
        print, line                                                                    ;print info
        print, '  Please correct input file and rerun...'                              ;print info
        stop                                                                           ;stop routine
     ENDIF ELSE BEGIN                                                                  ;if amount of info expected
        FOR yy=0, n_elements(bits)-1, 1 DO BEGIN                                       ;loop over bits
           CASE dtype[yy] OF                                                           ;case of data type
              0 : print, 'Shit! What do I do with this!'                               ;possible choice
              1 : xparams[xx].(yy) = byte(bits[yy])                                    ;convert and store
              2 : BEGIN                                                                ;for binary stuff
                 bits[yy] = strlowcase(bits[yy])                                       ;convert to lower case
                 IF (bits[yy] EQ 'y') OR (bits[yy] EQ 'yes') OR $                      ;compare
                    (bits[yy] EQ 'yep') OR (bits[yy] EQ '1') THEN tmp = 1 ELSE tmp = 0 ;if matched
                 xparams[xx].(yy) = tmp                                                ;convert and store
              END                                                                      ;end binary stuff
              3 : xparams[xx].(yy) = long(bits[yy])                                    ;convert and store
              4 : xparams[xx].(yy) = float(bits[yy])                                   ;convert and store
              5 : xparams[xx].(yy) = double(bits[yy])                                  ;convert and store
              6 : xparams[xx].(yy) = complex(bits[yy])                                 ;convert and store
              7 : xparams[xx].(yy) = bits[yy]                                          ;convert and store
              8 : print, 'Shit! What do I do with this!'                               ;possible choice
              9 : xparams[xx].(yy) = decomplex(bits[yy])                               ;convert and store
              10 : print, 'Shit! What do I do with this!'                              ;possible choice
              11 : print, 'Shit! What do I do with this!'                              ;possible choice
              12 : xparams[xx].(yy) = uint(bits[yy])                                   ;convert and store
              13 : xparams[xx].(yy) = ulong(bits[yy])                                  ;convert and store
              14 : xparams[xx].(yy) = long64(bits[yy])                                 ;convert and store
              15 : xparams[xx].(yy) = ulong64(bits[yy])                                ;convert and store
              ELSE : BEGIN                                                             ;if no match found
                 print, ' WARNING!! Something went horribly wrong with data types'     ;print info
              END                                                                      ;end no match
           ENDCASE                                                                     ;end case data type
        ENDFOR                                                                         ;end loop over bits
     ENDELSE                                                                           ;end amount of info
  ENDFOR                                                                               ;end loop over number of images
  
  
  RETURN, xparams
END
;========================================================================================================================



;========================================================================================================================
FUNCTION parsemulticolorim, xstrings


  
  nims = n_elements(xstrings)                                         ;find number of array entries
  tags = strsplit(xstrings[0], /EXTRACT)                              ;split the string
  chk = where(tags EQ '#', COMPLEMENT=keep)                           ;find the comment char
  IF (chk[0] EQ -1) THEN BEGIN                                        ;if comment char not found
     print, ' WARNING!! Expecting first line of input ' + $           ;cont next line
            'file to be a header line denoted by "#"!!'               ;print info
     print, '  Please correct input file and rerun...'                ;print info
     stop                                                             ;stop run
  ENDIF ELSE tags = tags[keep]                                        ;if comment char found keep rest
  chk = where(strmatch(tags, 'images', /FOLD_CASE) EQ 1, nchk)        ;check for image tag
  CASE nchk OF                                                        ;check number of image tags found
     1 : xstruc = strucmulticolorim(tags)                             ;if found only once
     0 : BEGIN                                                        ;if images not found
        print, ' WARNING!! header line of input ' + $                 ;cont next line
               'file must contain an entry "images"!!'                ;print info
        print, '  Please correct input file and rerun...'             ;print info
        stop                                                          ;stop run
     END                                                              ;end if not found
     ELSE : BEGIN                                                     ;if more than one found
        print, ' WARNING!! Expecting header line of input ' + $       ;cont next line
               'file to contain exactly one entry "images"!!'         ;print info
        print, '  Please correct input file and rerun...'             ;print info
        stop                                                          ;stop run
     END                                                              ;end if more than one found
  ENDCASE                                                             ;end check image tage

  
  ;;;fill in remainder of info
  xstrings = xstrings[1:nims-1]                 ;trim off header
  xparams = replicate(xstruc, nims-1)           ;replicate structure
  xparams = fillmulticolorim(xparams, xstrings) ;fill in the structure


  RETURN, xparams
END
;========================================================================================================================



;========================================================================================================================
FUNCTION backim, image, BACKSZ=backsz
  
  sz = size(image)
  back = fltarr(sz[1], sz[2])
  hfbin = (backsz-1)/2.0
  xmax = floor(sz[1] - (backsz-1)/2.0)
  ymax = floor(sz[2] - (backsz-1)/2.0)
  
  FOR xx=0UL, sz[1]-1, backsz DO BEGIN
     FOR yy=0UL, sz[2]-1, backsz DO BEGIN
        IF xx LT hfbin then xll = 0 ELSE xll = xx-hfbin
        IF xx GT xmax then xul = sz[1]-1 ELSE xul = floor(xx+hfbin)-1
        IF yy LT hfbin then yll = 0 ELSE yll = yy-hfbin
        IF yy GT ymax then yul = sz[2]-1 ELSE yul = floor(yy+hfbin)-1
        bit = image[xll:xul, yll:yul]
        siga = stdev(image[xll:xul, yll:yul])
        meanclip, bit, bitmean, sigb, CLIPSIG=3, MAXITER=7, SUBS=bitsubs
        IF siga NE 0 then sigdrop = (siga - sigb) / siga ELSE sigdrop = 0.0
        CASE 1 of
           sigdrop LT 0.2 : BEGIN
              back[xx,yy] = bitmean
           END
           sigdrop GE 0.2 : BEGIN
              meana = (total(bit[bitsubs])-max(bit[bitsubs])) / (n_elements(bitsubs)-1.0)
              back[xx,yy] = 2.5*meana-1.5*mean(bit[bitsubs])
           END
           ELSE : print, 'Something has gone horribly wrong!!!'
        ENDCASE
     ENDFOR
  ENDFOR
      
  RETURN, back
END
;========================================================================================================================



;========================================================================================================================
FUNCTION backfilter, image, BACKSZ=backsz, BACKFTSZ=backftsz
  
  
  sz = size(image)                              ;find size of the image
  back = fltarr(sz[1], sz[2])                   ;make a new array of same size
  hfbin = (backsz-1)/2.0                        ;find half a bin size
  xmax = floor(sz[1] - (backftsz*backsz-1)/2.0) ;find closest to max x edge
  ymax = floor(sz[2] - (backftsz*backsz-1)/2.0) ;find closest to may y edge

  FOR xx=0UL, sz[1]-1, backsz DO BEGIN
     FOR yy=0UL, sz[2]-1, backsz DO BEGIN
        IF image[xx,yy] NE 0 THEN BEGIN
           IF xx LT backftsz*hfbin THEN xll = 0 ELSE xll = xx-backftsz*hfbin
           IF xx GT xmax THEN xul = sz[1]-1 ELSE xul = floor(xx+backftsz*hfbin)-1
           IF yy LT backftsz*hfbin THEN yll = 0 ELSE yll = yy-backftsz*hfbin
           IF yy GT ymax THEN yul = sz[2]-1 ELSE yul = floor(yy+backftsz*hfbin)-1
           bit = image[xll:xul, yll:yul]
           chk = where(bit NE 0, nchk)
           CASE nchk of
              0 : back[xx,yy] = 0.0
              1 : back[xx,yy] = bit[chk]
              2 : back[xx,yy] = mean(bit[chk])
              ELSE : back[xx,yy] = median(bit[chk])
           ENDCASE
        ENDIF
     ENDFOR
  ENDFOR
 
 return, back
END
;========================================================================================================================



;========================================================================================================================
FUNCTION bicubicspline, image

  
  sz = size(image)
  xs = indgen(sz[1])
  ys = indgen(sz[2])
  back1 = image
  
  FOR xx=0UL, sz[1]-1, 1 do BEGIN
     chk = where(image[xx,*] NE 0, nchk)
     IF nchk GT 3 THEN BEGIN
        minchk = min(chk)
        maxchk = max(chk)
        fit = spline(ys[chk], image[xx,chk], ys[minchk:maxchk], /DOUBLE)
        back1[xx,minchk:maxchk] = fit
     ENDIF
  ENDFOR
  
  FOR xx=0UL, sz[2]-1, 1 do BEGIN
     chk = where(back1[*,xx] NE 0, nchk)
     IF nchk GT 3 THEN BEGIN
        minchk = min(chk)
        maxchk = max(chk)
        fit = spline(xs[chk], back1[chk,xx], xs[minchk:maxchk], /DOUBLE)
        back1[minchk:maxchk,xx] = fit
     ENDIF
  ENDFOR

  return, back1
END
;========================================================================================================================



;========================================================================================================================
FUNCTION scalemulticolorim, ximage, xscale, FRACMAX=fracmax

  IF keyword_set(FRACMAX) THEN fracmax = fracmax[0] ELSE fracmax = 0.98 ;sets default value

  xscale = strcompress(xscale, /REMOVE_ALL)                            ;remove white space
  CASE xscale OF                                                       ;check SCALE value
     'none' : ximage = ximage                                          ;apply 
     'asinh' : BEGIN                                                   ;choose asinh         
        fakex = fltarr(4)                                              ;make an array to fill
        fakey = [100,150,200,250]                                      ;make an array to fill
        fakeyerr = [1.0,1.0,1.0,1.0]                                   ;make an array to fill
        chk = where(ximage GT 0.0)                                     ;find non-buffer
        nonbuff = ximage[chk]                                          ;get non-buffer
        
        keep = sigclip(nonbuff)          ;sigma clip image
        buffmean = mean(nonbuff[keep])   ;find mean of image
        buffsig = stdev(nonbuff[keep])   ;find sigma of imag e
        fakex[0] = buffmean+2.0*buffsig  ;fill fake values
        fakex[1] = buffmean+3.0*buffsig  ;fill fake values
        fakex[2] = buffmean+6.0*buffsig  ;fill fake values
        fakex[3] = buffmean+15.0*buffsig ;fill fake values

        coeffs = bayesian_asinh_yerr(fakex, fakey, fakeyerr, /PLOTFIT) ;find with asinh
        ximage = asinh_gen(ximage, coeffs[0], coeffs[1], coeffs[2])    ;apply arcsin
     end                                                               ;end choice asinh
     '2root' : ximage = ximage^0.500                                   ;apply sqrt
     '3root' : ximage = ximage^0.333                                   ;apply cubrt
     '4root' : ximage = ximage^0.250                                   ;apply 4th root
     '5root' : ximage = ximage^0.200                                   ;apply 5th root
     ELSE : BEGIN                                                      ;alternative
        print, ' WARNING!! scale type ' + xscale + $                   ;cont next line
               'not recognized!!'                                      ;print info
        print, '  Available options are "none", "asinh", "2root",' + $ ;cont next line
               '"3root", "4root", "5root"'                             ;print info 
        print, '  Please correct input file and rerun...'              ;print info
        stop                                                           ;stop run
     END                                                               ;end alt
  ENDCASE                                                              ;end check scale keyword
  chk = where((ximage NE ximage) OR (ximage LT 0), nchk)               ;find below zero values
  IF nchk NE 0 THEN ximage[chk] = 0                                    ;set floor
  chk = where(ximage GT 255, nchk)                                     ;find above byte color values
  IF nchk NE 0 THEN ximage[chk] = 255                                  ;set ceiling
  
  
  RETURN, ximage
END
;========================================================================================================================



;========================================================================================================================
pro multicolorim, list, $
                  BACKSZ=backsz, BACKFTSZ=backftsz, $
                  GRAPHIT=graphit, WRTMETA=wrtmeta, VERBOSE=verbose, HELP=help

;+
; NAME:
;       MULTICOLORIM()
;
; PURPOSE:
;       Prepares a list of images to be loaded into an image editing
;       program e.g. Photoshop for combination into a richer color image    
;
; CALLING SEQUENCE:
;       multicolorim, list [, VERBOSE=, /HELP]
;      
; INPUTS:
;        
;
; OPTIONAL INPUTS:
;       
;
; KEYWORD PARAMETERS:
;        
;
; OUTPUTS:
;       
;
; OPTIONAL OUTPUTS:
;
;
; COMMON BLOCKS:
;       
;
; PROCEDURES USED:
;       mrd_struc_gala : structure creation routine
;
; COMMENTS:
;        
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2014 Aug 20, Univ. Cali, Riverside v0.1.0
;          -first release
;
;
; DESIRED UPGRADES
;       - perhaps do something with global decisions to back subtract
;       - add in region file support
;       - add in contour support
;       - fix output .tiff names
;       - troubleshoot SWIRE optical header problems
;       - trim buffer off images
;
;-
  version = '0.1.0'


  IF keyword_set(BACKSZ) THEN backsz = backsz[0] ELSE backsz = 20        ;sets new value
  IF keyword_set(BACKFTSZ) THEN backftsz = backftsz[0] ELSE backftsz = 4 ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2     ;sets new value


  IF verbose GE 1 THEN print, ' List of images to work on: ', list
  

  ;;;read in text file containing image info
  strings = readmulticolorim(list)               ;read in list
  params = parsemulticolorim(strings)            ;parse lines into usable values
  IF keyword_set(HELP) THEN help, params, /STRUC ;offer help


  ;;;check for tags existing to set options
  backtag = tag_exist(params, 'backsub', /TOP_LEVEL) ;does backsub exist
  convtag = tag_exist(params, 'convolv', /TOP_LEVEL) ;does covolv exist
  scaletag = tag_exist(params, 'scale', /TOP_LEVEL)  ;does scale exist


  ;;;Loop over each image
  FOR xx=0, n_elements(params.(0))-1, 1 DO BEGIN
     IF (xx EQ 0) AND (verbose GE 1) THEN print, ' Refernce image for all images: ', params[xx].images
     IF (verbose GE 2) THEN print, '  Now working on image: ', params[xx].images
     

     ;;;Read in image 
     IF xx EQ 0 THEN BEGIN                                        ;if first pass = ref image
        refim = mrdfits(params[xx].images, 0, refhdr, /SILENT)    ;read in file
        refchk = size(refim)                                      ;check size of image
        IF refchk[0] NE 2 THEN BEGIN                              ;if first read fails
           refim = mrdfits(params[xx].images, 1, refhdr, /SILENT) ;read in file
           refchk = size(refim)                                   ;check size of image
           nrefhdr = n_elements(refhdr)                           ;find # of hdr lines
           refhdr = refhdr[1:nrefhdr-1]                           ;remove first header line
        ENDIF                                                     ;end if first read fails
   
        ;;;Sanity checks
        chk = where((refim NE refim) OR (abs(refim) GT 999999999.0)) ;check for NaNs, INFs
        IF chk[0] NE -1 THEN refim[chk] = 0.0                        ;set to zeros
        IF keyword_set(GRAPHIT) THEN histomulticolorim, refim, $     ;cont next line
           TITLE='Initial Image Pixel Dist' , XWINDOW=0              ;if graphs desired
        
        
        ;;;get reference astrometry info
        refxsize = fxpar(refhdr, 'NAXIS1') ;find ref x size
        refysize = fxpar(refhdr, 'NAXIS2') ;find ref y size
        refxcr = fxpar(refhdr, 'CRPIX1')   ;find ref x ref
        refycr = fxpar(refhdr, 'CRPIX2')   ;find ref y ref


        ;;;Convols the images if so desired
        ;IF convtag EQ 1 THEN convyes = params[xx].convolv        ;check if individual setting given
        ;IF convyes EQ 1 THEN BEGIN                               ;check CONVOL keyword
        ;   IF verbose ge 1 THEN  print, '   Convolving image...' ;print info
        ;   tick = systime(/SECONDS)                              ;find start time
        ;   
        ;   refpsf = psf_gaussian(NPIX=3.0*params[xx].convolv, FWHM=params[xx].convolv, /NORMALIZE) ;create psf
        ;   refim= convolve(refim, refpsf)                                                          ;convolve image
        ;   IF verbose GE 3 THEN print, '    Ref image convolved!!'                                 ;print info
        ;   IF keyword_set(WRTMETA) THEN BEGIN                                                      ;check WRITECON keyword
        ;      outname = params[xx].images                                                          ;copy name
        ;      strreplace, outname, '.fits', '_conv.fits'                                           ;modify name
        ;      mwrfits, refim, outname, refhdr, /CREATE                                             ;write file
        ;   ENDIF                                                                                   ;end check WRITECON keyword
        ;   IF keyword_set(GRAPHIT) THEN histomulticolorim, refim, $                                ;cont next line
        ;      TITLE='Convolved Image Pixel Dist', XWINDOW=2                                        ;if graphs desired
        ;   
        ;   tock = systime(/SECONDS)                                             ;find end time
        ;   IF verbose GE 1 THEN print, '  Time elapsed to convolve images: ', $ ;cont next line
        ;                               fix(tock-tick), 's'                      ;print info
        ;ENDIF                                                                   ;end convolution
        
           
        ;;;Substact off background if desired
        IF backtag EQ 1 THEN backyes = params[xx].backsub                        ;check if individual setting given
        IF backyes EQ 1 THEN BEGIN                                               ;subtract background
           IF verbose GE 1 THEN print, '   Subtracting background from image...' ;print info
           tick = systime(/SECONDS)                                              ;find start time
           
           refback = BACKIM(refim, BACKSZ=backsz)                          ;find back mesh
           refback = BACKFILTER(refback, BACKSZ=backsz, BACKFTSZ=backftsz) ;filter back mesh
           refback = BICUBICSPLINE(refback)                                ;fit back mesh
           refim = refim - refback                                         ;subtract background
           IF keyword_set(WRTMETA) THEN BEGIN                              ;check WRTMETA keyword
              outname = params[xx].images                                  ;copy name
              strreplace, outname, '.fits', '_bksub.fits'                  ;modify name
              mwrfits, refim, outname, refhdr, /CREATE                     ;write file
           ENDIF                                                           ;end check WRTMETA keyword
           IF keyword_set(GRAPHIT) THEN histomulticolorim, refim, $        ;cont next line
              TITLE='Back Sub Image Pixel Dist', XWINDOW=1                 ;if graphs desired
           
           tock = systime(/SECONDS)                                                       ;find end tim
           if verbose ge 1 then print, '  Time elapsed to subtract image background: ', $ ;cont next line
                                       fix(tock-tick), 's'                                ;print info
        ENDIF                                                                             ;end subtract background
        

        ;;;Buffer up image
        refbig = dblarr(2.0*refxsize, 2.0*refysize)              ;create padded array
        refbig[floor(refxsize/2.0), floor(refysize/2.0)] = refim ;set small array in big
        refim = refbig                                           ;recapture big array
        refxcr = refxcr + floor(refxsize/2.0)                    ;finds new x ref pix
        refycr = refycr + floor(refysize/2.0)                    ;finds new y ref pix
        sxaddpar, refhdr, 'CRPIX1', refxcr                       ;mods x ref in header
        sxaddpar, refhdr, 'CRPIX2', refycr                       ;mods y ref in header
        sxaddpar, refhdr, 'NAXIS1', floor(2.0*refxsize)          ;mods y ref in header
        sxaddpar, refhdr, 'NAXIS2', floor(2.0*refysize)          ;mods y ref in header
        

        ;;;Scale the images
        IF scaletag EQ 1 THEN BEGIN                          ;if scale is yes
           IF verbose GE 1 THEN print, '   Scaling image...' ;print info
           tick = systime(/SECONDS)                          ;find start time
           
           refim = scalemulticolorim(refim, params[xx].scale)                  ;call function
           IF keyword_set(WRTMETA) THEN BEGIN                                  ;check WRITECON keyword
              outname = params[xx].images                                      ;copy name
              strreplace, outname, '.fits', '_final.fits'                      ;modify name
              mwrfits, refim, outname, refhdr, /CREATE                         ;write file
           ENDIF                                                               ;end check WRITECON keyword
           IF keyword_set(GRAPHIT) THEN histomulticolorim, refim, $            ;cont next line
              TITLE='Scaled Image Pixel Dist', XWINDOW=3, XMIN=5.0, XMAX=256.0 ;if graphs desired
           
           tock = systime(/SECONDS)                                         ;find end time
           IF verbose GE 1 THEN print, '  Time elapsed to scale image: ', $ ;cont next line
                                       fix(tock-tick), 's'                  ;print info
        ENDIF
        
        
        write_tiff, 'test_K.tiff', refim
         
      ENDIF ELSE BEGIN                                             ;end if first pass
        curim = mrdfits(params[xx].images, 0, curhdr, /SILENT)    ;read in file
        curchk = size(curim)                                      ;check size of image
        IF curchk[0] NE 2 THEN BEGIN                              ;if first read fails
           curim = mrdfits(params[xx].images, 1, curhdr, /SILENT) ;read in file
           curchk = size(curim)                                   ;check size of image
           ncurhdr = n_elements(curhdr)                           ;find # of hdr lines
           curhdr = curhdr[1:ncurhdr-1]                           ;remove first header line
        ENDIF                                                     ;end if first read fails
        
        ;;;Sanity checks
        chk = where((curim NE curim) OR (abs(curim) GT 999999999.0)) ;check for NaNs, INFs
        IF chk[0] NE -1 THEN curim[chk] = 0.0                        ;set to zeros
        IF keyword_set(GRAPHIT) THEN histomulticolorim, curim, $     ;cont next line
           TITLE='Initial Image Pixel Dist' , XWINDOW=0              ;if graphs desired
        

        ;;;get reference astrometry info
        curxsize = fxpar(curhdr, 'NAXIS1') ;find cur x size
        curysize = fxpar(curhdr, 'NAXIS2') ;find cur y size
        curxcr = fxpar(curhdr, 'CRPIX1')   ;find cur x ref
        curycr = fxpar(curhdr, 'CRPIX2')   ;find cur y ref
        

        ;;;Convols the images if so desired
        ;IF convtag EQ 1 THEN convyes = params[xx].convolv        ;check if individual setting given
        ;IF convyes EQ 1 THEN BEGIN                               ;check CONVOL keyword
        ;   IF verbose ge 1 THEN  print, '   Convolving image...' ;print info
        ;   tick = systime(/SECONDS)                              ;find start time
        ;   
        ;   curpsf = psf_gaussian(NPIX=3.0*params[xx].convolv, FWHM=params[xx].convolv, /NORMALIZE) ;create psf
        ;   curim= convolve(curim, curpsf)                                                          ;convolve image
        ;   IF verbose GE 3 THEN print, '    Cur image convolved!!'                                 ;print info
        ;   IF keyword_set(WRTMETA) THEN BEGIN                                                      ;check WRITECON keyword
        ;      outname = params[xx].images                                                          ;copy name
        ;      strreplace, outname, '.fits', '_conv.fits'                                           ;modify name
        ;      mwrfits, curim, outname, curhdr, /CREATE                                             ;write file
        ;   ENDIF                                                                                   ;end check WRITECON keyword
        ;   IF keyword_set(GRAPHIT) THEN histomulticolorim, curim, $                                ;cont next line
        ;      TITLE='Convolved Image Pixel Dist', XWINDOW=2                                        ;if graphs desired
        ;   
        ;   tock = systime(/SECONDS)                                             ;find end time
        ;   IF verbose GE 1 THEN print, '  Time elapsed to convolve images: ', $ ;cont next line
        ;                               fix(tock-tick), 's'                      ;print info
        ;ENDIF                                                                   ;end convolution


        ;;;Substact off background if desired
        IF backtag EQ 1 THEN backyes = params[xx].backsub                        ;check if individual setting given
        IF backyes EQ 1 THEN BEGIN                                               ;subtract background
           IF verbose GE 1 THEN print, '   Subtracting background from image...' ;print info
           tick = systime(/SECONDS)                                              ;find start time
           
           curback = BACKIM(curim, BACKSZ=backsz)                          ;find back mesh
           curback = BACKFILTER(curback, BACKSZ=backsz, BACKFTSZ=backftsz) ;filter back mesh
           curback = BICUBICSPLINE(curback)                                ;fit back mesh
           curim = curim - curback                                         ;subtract background
           IF keyword_set(WRTMETA) THEN BEGIN                              ;check WRTMETA keyword
              outname = params[xx].images                                  ;copy name
              strreplace, outname, '.fits', '_bksub.fits'                  ;modify name
              mwrfits, curim, outname, curhdr, /CREATE                     ;write file
           ENDIF                                                           ;end check WRTMETA keyword
           IF keyword_set(GRAPHIT) THEN histomulticolorim, curim, $        ;cont next line
              TITLE='Back Sub Image Pixel Dist', XWINDOW=1                 ;if graphs desired
           
           tock = systime(/SECONDS)                                                       ;find end tim
           if verbose ge 1 then print, '  Time elapsed to subtract image background: ', $ ;cont next line
                                       fix(tock-tick), 's'                                ;print info
        ENDIF                                                                             ;end subtract background


        ;;;Buffer up image
        curbig = dblarr(2.0*curxsize, 2.0*curysize)              ;create padded array
        curbig[floor(curxsize/2.0), floor(curysize/2.0)] = curim ;set small array in big
        curim = curbig                                           ;recapture array
        curxcr = curxcr + floor(curxsize/2.0)                    ;finds new x ref pix
        curycr = curycr + floor(curysize/2.0)                    ;finds new y ref pix
        sxaddpar, curhdr, 'CRPIX1', curxcr                       ;mods x ref in header
        sxaddpar, curhdr, 'CRPIX2', curycr                       ;mods y ref in header
        sxaddpar, curhdr, 'NAXIS1', floor(2.0*curxsize)          ;mods y ref in header
        sxaddpar, curhdr, 'NAXIS2', floor(2.0*curysize)          ;mods y ref in header


        ;;;Align images in WCS 
        hastrom, curim, curhdr, refhdr, MISSING=0 ;transform green to red
        

        ;;;Scale the images
        IF scaletag EQ 1 THEN BEGIN                          ;if scale is yes
           IF verbose GE 1 THEN print, '   Scaling image...' ;print info
           tick = systime(/SECONDS)                          ;find start time
           
           curim = scalemulticolorim(curim, params[xx].scale)                  ;call function
           IF keyword_set(WRTMETA) THEN BEGIN                                  ;check WRITECON keyword
              outname = params[xx].images                                      ;copy name
              strreplace, outname, '.fits', '_final.fits'                      ;modify name
              mwrfits, curim, outname, curhdr, /CREATE                         ;write file
           ENDIF                                                               ;end check WRITECON keyword
           IF keyword_set(GRAPHIT) THEN histomulticolorim, curim, $            ;cont next line
              TITLE='Scaled Image Pixel Dist', XWINDOW=3, XMIN=5.0, XMAX=256.0 ;if graphs desired
           
           tock = systime(/SECONDS)                                         ;find end time
           IF verbose GE 1 THEN print, '  Time elapsed to scale image: ', $ ;cont next line
                                       fix(tock-tick), 's'                  ;print info
        ENDIF
        
        write_tiff, 'test_z.tiff', curim

     ENDELSE                                                      ;end if other pass
     
      

     






     
     stop  
  ENDFOR


END
;========================================================================================================================




;========================================================================================================================
pro call_multicolorim
  
  list = 'colorimagelist_v1.txt'
  multicolorim, list, /GRAPHIT, /WRTMETA
  
  
END
;========================================================================================================================
