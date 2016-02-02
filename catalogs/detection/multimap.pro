;========================================================================================================================
function nextiter, xxs, xys, NOUT=nout, FRACMAX=fracmax, NDISPBINS=ndispbins 
  

  ;;;NOUT: # of indices of padding to use
  ;;;FRACMAX: fraction of max value that a index must be above to count as non-zero

  IF keyword_set(NOUT) THEN nout = nout[0] ELSE nout = 1                        ;sets new value
  IF keyword_set(FRACMAX) THEN fracmax = fracmax[0] ELSE fracmax = 0.0001       ;sets new value
  IF keyword_set(NDISPBINS) THEN ndispbins = ndispbins[0] ELSE ndispbins = 20.0 ;sets new value

  nxxs = n_elements(xxs)
  chk = where(xys GT fracmax*max(xys), nchk)
  IF nchk GT 0 THEN BEGIN
     minind = min(chk)-nout
     IF minind LT 0 THEN BEGIN
        minind = 0
        xmin = xxs[minind]
     ENDIF ELSE xmin = xxs[minind]
     maxind = max(chk)+nout
     IF maxind GT nxxs-1 THEN BEGIN
        maxind = nxxs-1
        xmax = xxs[maxind]
     ENDIF ELSE xmax = xxs[maxind]
     xbin = (xmax-xmin) / ndispbins
  ENDIF ELSE BEGIN
                                ;print, 'Shit everything is all zeroes'
     xmin = xxs[0]
     xmax = xxs[nxxs-1]
     xbin = (xmax-xmin) / ndispbins
  ENDELSE

  RETURN, [xmin, xmax, xbin]
END
;========================================================================================================================



;========================================================================================================================
function checkback, image, VARBIN=varbin, CUT=cut, GROW=grow, ANNULUS=annulus, BKKERSZ=bkkersz, $
                    VERBOSE=verbose
  
  if keyword_set(VARBIN) THEN varbin = varbin[0] else varbin = 9      ;sets new value
  if keyword_set(CUT) THEN cut = cut[0] else cut = 0.05               ;sets new value
  if keyword_set(GROW) THEN grow = grow[0] else grow = 6              ;sets new value
  if keyword_set(ANNULUS) THEN annulus = annulus[0] else annulus = 20 ;sets new value
  if keyword_set(BKKERSZ) then bkkersz = bkkersz[0] else bkkersz = 20 ;sets new value
  
  eb = ulong((varbin-1)/2)                                 ;find edge buffer
  sz = size(image)                                         ;find image size
  backvar = image                                          ;copy image
  backvar[*,*] = 0                                         ;erase data
  backmsk = image                                          ;copy image
  backmsk[*,*] = -1                                        ;erase data
  FOR xx=eb, sz[1]-eb-1, 1 DO BEGIN                        ;loop over x pixels
     FOR YY=eb, sz[2]-eb-1, 1 DO BEGIN                     ;loop over y pixels
        bit = image[xx-eb:xx+eb,yy-eb:yy+eb]               ;find bit of image
        chk = where(bit NE 0, nchk)                        ;find not null values
        CASE nchk OF                                       ;check where not null
           0 : backvar[xx,yy] = 0                          ;if all null set to null
           1 : backvar[xx,yy] = 0                          ;if all null set to null
           ELSE : backvar[xx,yy] = variance(bit[chk])      ;/nchk????? otherwise find var
        ENDCASE                                            ;end check were not null
     ENDFOR                                                ;end loop over y pixels
  ENDFOR                                                   ;end loop over x pixels
  chk = where(backvar NE backvar, nchk)                    ;find NaNs
  if nchk NE 0 then backvar[chk] = 0                       ;reset to null value
                                ;mwrfits, backvar, 'testing0a.fits', hdr, /CREATE

  
  ;;;look for high variance pixels above cut value as objects
  chk = where(backvar NE 0, nchk)        ;find actual values
  ul = long((1.0-cut)*nchk)              ;find cut limit ind
  bckinds = bsort(backvar[chk])          ;sort background im
  backmsk[chk[bckinds[0:ul]]] = 1        ;set values LT cut to 1
  backmsk[chk[bckinds[ul+1:nchk-1]]] = 0 ;set values GE cut to 0
  backvar = 0                            ;clear memory
  bckinds = 0                            ;clear memory
                                ;mwrfits, backmsk, 'testing0b.fits', hdr, /CREATE

  
  ;;;grow object pixels by GROW to avoid object wings
  line = strcompress('   Growing background mask to '+string(grow)+' pixels') ;line to print
  if verbose GE 3 THEN print, line                                            ;print info
  for yy=0, grow-1, 1 DO BEGIN                                                ;loop over growth 
     chk = where((backmsk EQ 0), nchk)                                        ;find object pixels 
     IF nchk NE 0 THEN BEGIN                                                  ;check objects exist
        inds = array_indices(backmsk, chk)                                    ;find x,y coords
        IF yy EQ 0 then indsorig = array_indices(backmsk, chk)                ;find x,y coords
        set = [inds[0,*]+1,inds[1,*]]                                         ;pixels to the right
        backmsk[set[0,*],set[1,*]] = 0                                        ;set to 0
        set = [inds[0,*]-1,inds[1,*]]                                         ;pixels to the left
        backmsk[set[0,*],set[1,*]] = 0                                        ;set to 0
        set = [inds[0,*],inds[1,*]+1]                                         ;pixels above
        backmsk[set[0,*],set[1,*]] = 0                                        ;set to 0
        set = [inds[0,*],inds[1,*]-1]                                         ;pixels below
        backmsk[set[0,*],set[1,*]] = 0                                        ;set to 0
     ENDIF                                                                    ;end check object exist
  ENDFOR                                                                      ;end loop over growth
  inds = 0                                                                    ;clear memory
  set = 0                                                                     ;clear memory

  
  ;;;find background in annulus around objects
  back = image*backmsk                                                                 ;create masked image
                                ;mwrfits, back, 'testing0c.fits', hdr, /CREATE
  backmsk = 0                                                                          ;clear memory
  line = strcompress('   Finding background in annulus of '+ $                         ;cont next line
                     string(grow+1) + '  -' + string(annulus) +' pixels')              ;line to print
  if verbose GE 3 THEN print, line                                                     ;print info
  bkmean = dblarr(1,n_elements(indsorig[0,*]))                                         ;create array
  bkmeancnt = intarr(1,n_elements(indsorig[0,*]))                                      ;create array
  FOR yy=-1.0*annulus, annulus, 1 DO BEGIN                                             ;loop annulus radius in y 
     xlim = annulus - abs(yy)                                                          ;find x range
     FOR xx=-1.0*xlim, xlim, 1 DO BEGIN                                                ;loop annulus radius in x
        IF (abs(xx)+abs(yy)) GT grow THEN BEGIN                                        ;if not in grow region
           find = [indsorig[0,*]+xx,indsorig[1,*]+yy]                                  ;location in annulus 
           store = back[find[0,*],find[1,*]]                                           ;background value there
           chk = where(store NE 0, nchk)                                               ;find nonzero values
           if nchk NE 0 THEN BEGIN                                                     ;check values exist
              bkmeancnt[chk] = bkmeancnt[chk] + 1                                      ;up counter value
              bkmean[chk] = (bkmean[chk]*(bkmeancnt[chk]-1)+store[chk])/bkmeancnt[chk] ;find new average
           ENDIF                                                                       ;end check values exist   
        ENDIF                                                                          ;end if grow region
     ENDFOR                                                                            ;end loop annulus in x 
  ENDFOR                                                                               ;end loop annulus in y
  IF verbose GE 3 THEN BEGIN                                                           ;check verbose keyword
     print, '   Min background value in annuli', min(bkmean)                           ;print info
     print, '   Max background value in annuli', max(bkmean)                           ;print info
     print, '   Mean background value in annuli', mean(bkmean)                         ;print info
     print, '   StDev background value in annuli', stdev(bkmean)                       ;print info
  ENDIF                                                                                ;end check VERBOSE keyword
  find = 0                                                                             ;clear memory
  store = 0                                                                            ;clear memory
  
  
  ;;;set grow regions to average background value in annulus
  IF verbose GE 3 THEN print, '   Setting background values in image...' ;print info
  FOR yy=-1.0*grow, grow, 1 DO BEGIN                                     ;loop annulus radius in y 
     xlim = grow - abs(yy)                                               ;find x range
     FOR xx=-1.0*xlim, xlim, 1 DO BEGIN                                  ;loop annulus radius in x
        back[indsorig[0,*]+xx,indsorig[1,*]+yy] = bkmean[*]              ;pixel value
     ENDFOR                                                              ;end loop annulus in x 
  ENDFOR                                                                 ;end loop annulus in y
  bkmean = 0                                                             ;clear memory
  indsorig = 0                                                           ;clear memory


  ;;;smooth background image
  chk = where(image NE 0, nchk, COMPLEMENT=zeros)                 ;find nonzero values
  print, bkkersze
  kernel = psf_gaussian(NPIX=3*bkkersz, FWHM=bkkersz, /NORMALIZE) ;create smoothing kernel
  back = convolve(back, kernel, /NO_PAD)                          ;Smooth the image with the kernel
  if zeros[0] NE -1 then back[zeros] = 0                          ;restore zero values
  
  return, back
end
;========================================================================================================================




;========================================================================================================================
function normdisp, image, IMKERSZ=imkersz, $
                   NDISPITERS=ndispiters, ULFRAC=ulfrac, $
                   MUBINS=mubins, SIGBINS=sigbins, FMUBINS=fmubins, FSIGBINS=fsigbins, $ 
                   VERBOSE=verbose
  
  
  IF keyword_set(IMKERSZ) THEN imkersz = imkersz[0] ELSE imkersz = 3             ;sets new value
  IF keyword_set(NDISPITERS) THEN ndispiters = ndispiters[0] ELSE ndispiters = 5 ;sets new value
  IF keyword_set(MUBINS) THEN mubins = mubins[0] ELSE mubins = 20                ;sets new value
  IF keyword_set(SIGBINS) THEN sigbins = sigbins[0] ELSE sigbins = 20            ;sets new value
  IF keyword_set(FMUBINS) THEN fmubins = fmubins[0] ELSE fmubins = 40            ;sets new value
  IF keyword_set(FSIGBINS) THEN fsigbins = fsigbins[0] ELSE fsigbins = 40        ;sets new value
  IF keyword_set(ULFRAC) THEN ulfrac = ulfrac[0] ELSE ulfrac = 0.5               ;sets new value
  
  
  ;;;smooth background image
  if verbose GE 3 THEN print, '   Smoothing image...'             ;print info
  chk = where(image NE 0, nchk, COMPLEMENT=zeros)                 ;find nonzero values
  kernel = psf_gaussian(NPIX=3*imkersz, FWHM=imkersz, /NORMALIZE) ;create smoothing kernel
  image = convolve(image, kernel, /NO_PAD)                        ;Smooth image
  if zeros[0] NE -1 THEN image[zeros] = 0                         ;restore the zeros
  
  imstdev = stdev(image[chk])                                          ;find raw stand dev
  sorted = bsort(image[chk], imsorted)                                 ;sort good image value
  llind = 0.01*n_elements(sorted)                                      ;find lower limit ind
  ll = imsorted[llind]                                                 ;find lower limit
  if ll GE 0.0 THEN print, '   Shit!! Lower limit is positive valued'  ;print warning
  ul = abs(ulfrac*ll)                                                  ;find upper limit
  
  chk = where((image NE 0) AND (image GE ll) AND (image LE ul), $ ;cont next line
              nchk, COMPLEMENT=zeros)                             ;find good values
  window, 0, XPOS=100, YPOS=400, XSIZE=450, YSIZE=450             ;window location
  cgHistoplot, image[chk], BINSIZE=0.00001, /FILL, $              ;histogram
               POLYCOLOR = ['charcoal', 'dodger blue'], $         ;plot options
               XRANGE = [ll, (ul/ulfrac)], $                      ;plot options
               TITLE = 'Historgram of Flux Values', $             ;plot options
               XTITLE = 'Flux Values', $                          ;plot options
               YTITLE = 'Frequency'                               ;plot options
  
  if verbose GE 3 THEN print, '   Fitting background distribution...' ;print info
  minmu = ll*0.2                                                      ;lowest mu to test
  maxmu = ul*0.2                                                      ;largest mu to test
  binmu = (maxmu-minmu) / mubins                                      ;sampling of mu
  mus = dindgen((maxmu-minmu)/binmu+1.0) * binmu + minmu              ;mu values
  nmus = n_elements(mus)                                              ;find number of mus
  
  minsig = 0.0005*imstdev                                      ;lowest disp to test
  maxsig = 0.05*imstdev                                        ;largest disp to test
  binsig = (maxsig - minsig) / sigbins                         ;sampling of disp
  sigs = dindgen((maxsig-minsig)/binsig+1.0) * binsig + minsig ;sig values
  nsigs = n_elements(sigs)                                     ;find number of sigs
  
  FOR zz=0, ndispiters-1, 1 DO BEGIN                                                   ;iterate over finding dispersion
     likelihood = dblarr(nmus, nsigs)                                                  ;create array
     part1a = -0.5*alog(2.0*!pi*sigs^2)                                                ;first bit
     part1b = (-1.0/(2.0*sigs^2))                                                      ;first bit other part
     for xx=0UL, nmus-1, 1 DO BEGIN                                                    ;loop over mu values
        if (xx mod 25 EQ 0) AND (verbose GE 2) THEN print, '   Step', xx, ' of ', nmus ;print info
        part2 =(image[chk]-mus[xx])^2                                                  ;second bit
        FOR yy=0UL, nsigs-1, 1 DO BEGIN                                                ;loop over sig values
           like = part1a[yy] + (part1b[yy]*part2)                                      ;individual probs
           likelihood[xx, yy] = total(like)                                            ;likelihood at this point
        ENDFOR                                                                         ;end loop over sig values
     ENDFOR                                                                            ;end loop over mu values 
     
     likelihood = likelihood - max(likelihood) ;subtract biggest value
     likelihood = exp(likelihood)              ;back out of log space
     
     dblchk = where(likelihood NE likelihood, nchk)                               ;check for NaNs
     if nchk NE 0 then begin                                                      ;if NaNs present
        if verbose GE 3 then print, '   Somewhere the likelihood is INF or NaN!!' ;print info
        likelihood[dblchk] = 0.0                                                  ;set to zero
     endif                                                                        ;end if NaNs present
     
     window, 1, XPOS=175, YPOS=325, XSIZE=450, YSIZE=450    ;window location
     contour, likelihood, mus, sigs, $                      ;likelihood contours
              COLOR='000000'XL, $                           ;plot option
              BACKGROUND = 'FFFFFF'XL, $                    ;plot option
              TITLE = 'Likelihood Contours of mu, sigma', $ ;plot option
              XTITLE = 'mean flux [units]', $               ;plot option
              YTITLE = 'dispersion [units] ', $             ;plot option
              CHARSIZE = 1.25                               ;plot option
     
     musprob = fltarr(nmus)                              ;create array
     for xx=0UL, nsigs-1, 1 DO BEGIN                     ;loop over sig dim
        IF xx EQ 0 THEN BEGIN                            ;if first pass
           musprob = likelihood[*,xx]                    ;set beginning
        ENDIF ELSE musprob = musprob + likelihood[*,xx]  ;marginalize over sig
     ENDFOR                                              ;end loop over sig dim
     window, 2, XPOS=250, YPOS=250, XSIZE=450, YSIZE=450 ;window location
     plot, mus, musprob, $                               ;plot mus PDF
           COLOR='000000'XL, $                           ;plot options
           BACKGROUND = 'FFFFFF'XL, $                    ;plot options
           TITLE = 'Posterior PDF for mu', $             ;plot options
           XTITLE = 'mean flux [units]', $               ;plot options
           YTITLE = 'Probability', $                     ;plot options
           CHARSIZE = 1.5                                ;plot options
     
     
     sigsprob = fltarr(nsigs)                             ;create array
     FOR xx=0UL, nmus-1, 1 DO BEGIN                       ;loop over mus
        IF xx EQ 0 THEN BEGIN                             ;if first pass
           sigsprob = likelihood[xx,*]                    ;start values 
        ENDIF ELSE sigsprob = sigsprob + likelihood[xx,*] ;marginalize over mu
     ENDFOR                                               ;end loop over mus
     window, 3, XPOS=325, YPOS=175, XSIZE=450, YSIZE=450  ;window location
     plot, sigs, sigsprob, $                              ;plot sigs pdf
           COLOR='000000'XL, $                            ;plot option
           BACKGROUND = 'FFFFFF'XL, $                     ;plot option
           TITLE = 'Posterior PDF for sigma', $           ;plot options
           XTITLE = 'dispersion [units]', $               ;plot option
           YTITLE = 'Probability', $                      ;plot option
           CHARSIZE = 1.5                                 ;plot option
     
     ;;;Zoom in on non-zero prob regions
     IF zz GE ndispiters-2 THEN BEGIN                                                 ;if last go-round
        newmus = nextiter(mus, musprob, NDISPBINS=fmubins)                            ;zoom in on mu
        newsigs = nextiter(sigs, sigsprob, NDISPBINS=fsigbins)                        ;zoom in on sig
     ENDIF ELSE BEGIN                                                                 ;end if last time
        newmus = nextiter(mus, musprob)                                               ;zoom in on mu
        newsigs = nextiter(sigs, sigsprob)                                            ;zoom in on sig
     ENDELSE                                                                          ;end if not last time
     mus = dindgen((newmus[1]-newmus[0])/newmus[2]+1.0) * newmus[2] + newmus[0]       ;mu values
     nmus = n_elements(mus)                                                           ;find number of mus
     sigs = dindgen((newsigs[1]-newsigs[0])/newsigs[2]+1.0) * newsigs[2] + newsigs[0] ;sig values
     help, sigs
     nsigs = n_elements(sigs)                                                         ;find number of sigs
  ENDFOR                                                                              ;end loop iters to find dispersion
  
  maxsig = max(sigsprob, maxind)                                  ;find max value in posterior PDF
  help, sigs
  help, maxind
  print, maxind
  disp = sigs[maxind]                                             ;find sig value corressponding
  if verbose GE 3 then print, '   Image dispersion value: ', disp ;print info
  
  RETURN, disp
end
;========================================================================================================================




;========================================================================================================================
function probdens_y, values, N
  
  
  dem1 = factorial((N/2.0)-1.0)
  dem2 = 2.0^(N/2.0)
  num1 = exp(-1.0*values/2.0)*values^((N/2.0)-1.0)
  dpy = num1 / (dem1 * dem2)

  return, dpy
end
;========================================================================================================================



;========================================================================================================================
function probdens_R, values, N
  
  
  dem1 = factorial((N/2.0)-1.0)
  dem2 = 2.0^(N/2.0)
  num1 = 2.0*values^(N-1.0)
  num2 = exp(-1.0*(values^2.0)/2.0)
  dpy = (num1 * num2) / (dem1 * dem2)

  return, dpy
end
;========================================================================================================================



;========================================================================================================================
pro multimap, ximlist, WEILIST=weilist, REMAKE=remake, INPUTS=inputs, EDGEPIX=edgepix, $
              HISTMIN=histmin, HISTMAX=histmax, HISTBIN=histbin, RNORM=rnorm, $
              INDIR=indir, OURDIR=outdir, WRTMETA=wrtmeta, $
              VERBOSE=verbose, HELP=help
  
  

;+
; NAME:
;       MULTIMAP()
;
; PURPOSE:      
;       This program creates a probability map of the likelihood of a
;       detection being at that pixel location from multiple input
;       images. In essence, it does a fair image stack. 
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
;       verbose: interger value of 0 or larger indicating how much you
;               want printed to screen during runtime
;
; COMMON BLOCKS:
;       NONE
;
; PROCEDURES USED:
;
; COMMENTS:
;       The program assume that all images in the provide list have
;       already been resample to a common astrometric solution and
;       pixel scale. If not already done then SWARP is a good program
;       to accomplish this task. 
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2013 August 2, Univ. Cali, Riverside v2.0.0
;          -added writing of square rooted (SNR) multimap image
;          -tweaked normalization of # of pixels 
;          -formating changes
;       A. DeGroot, 2013 August 2, Univ. Cali, Riverside v1.0.0
;
; DESIRED UPGRADES
;       -right now it assumes all images x,y reference pixels are
;       given with same wcs coordinates 
;       -want to be able to load particular settings for various
;       passbands ie change pixel smoothing size etc.
;-


  if keyword_set(EDGEPIX) then edgepix = edgepix[0] else edgepix = 30    ;sets new value
  if keyword_set(HISTMIN) then histmin = histmin[0] else histmin = 0.1   ;sets new value
  if keyword_set(HISTMAX) then histmax = histmax[0] else histmax = 50.0  ;sets new value
  if keyword_set(HISTBIN) then histbin = histbin[0] else histbin = 300.0 ;sets new value
  if keyword_set(RNORM) then rnorm = rnorm[0] else rnorm = 3.0           ;sets new value
  if keyword_set(INDIR) then indir = indir[0] else indir = './'          ;sets new value
  if keyword_set(OUTDIR) then outdir = outdir[0] else outdir = './'      ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 3     ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'                   ;sets new value
  check_dir, 1                                                           ;compile module
  
  
  check_indir, indir, ximlist, VERBOSE=verbose, NOTE='INDIR' ;check indir
  fili = file_lines(ximlist)                                 ;find # of lines in file
  if verbose GE 2 THEN print, $                              ;cont next line
     '  # of images present to make probability map: ', fili ;print info
                                ;line = ''                                                  ;initialize
                                ;ims = strarr(fili)                                         ;create array
                                ;openr, lun, ximlist, /GET_LUN                              ;open file to read
                                ;for xx=0, fili-1, 1 do begin                               ;loop over file lines
                                ;   readf, lun, line                                        ;read from file
                                ;   ims[xx] = line                                          ;store read
                                ;endfor                                                     ;end loop file lines
                                ;close, lun                                                 ;close file
                                ;free_lun, lun                                              ;free file memory
  readcol, ximlist, ximages, xweight, xvalues, yesno, FORMAT='(A,A,A,A)' ;read in imlist
  fili = n_elements(ximages)                                  ;number of images
  ;print, ximlist
  ;print, ximages
  print, xvalues
  ;print, yesno

  if keyword_set(WEILIST) THEN BEGIN                                         ;check weight list exists
     check_indir, indir, weilist, VERBOSE=verbose                            ;check indir
     xx = 0                                                                  ;counter
     openr, lun, weilist, /GET_LUN                                           ;open file for reading
     weili = file_lines(weilist)                                             ;find how many weight ims present
     line = ' CAUTION: # of weight images given not equal # of images given' ;info line
     if weili NE fili THEN print, line                                       ;print info
     weigs = strarr(weili)                                                   ;storage array
     WHILE NOT eof(lun) DO BEGIN                                             ;if end of file not reached 
        readf, lun, line                                                     ;read line
        weigs[xx] = line                                                     ;store line
        xx++                                                                 ;increase counter
     ENDWHILE                                                                ;end end of file not reached
  ENDIF                                                                      ;end check weight list
  print, ' '                                                                 ;space

  if keyword_set(REMAKE) THEN fili = 0 ;skip the work part
  goodli = 0                           ;initialize counter
  for xx=0, fili-1, 1 do begin         ;loop over images given
     multimapflag = 1                  ;turn flag on
     imup = ximages[xx]                ;pick image thats up
     
     useable = (yesno[xx] EQ 'NO') OR (yesno[xx] EQ 'no') OR (yesno[xx] EQ 'No') ;check if NO flag is present
     CASE useable OF                                                             ;position of NO text
        0 : BEGIN                                                                ;if NO not found
           imup = imup                                                           ;image name remains same
           line = '  Now working on image : ' + imup                             ;info
           if verbose GE 2 THEN print, line                                      ;print info
           goodli++                                                              ;up # of good images
        END                                                                      ;end if NO not found
        ELSE : BEGIN                                                             ;if NO is found
           tmpimup = imup                                                        ;copy image name
           strreplace, tmpimup, 'NO', ' '                                        ;replace NO string
           imup = strcompress(tmpimup, /REMOVE_ALL)                              ;remove white spaces
           multimapflag = 0                                                      ;turn flag to off
           line = '  Now working on image (NO MULTIMAP CONTRIBUTION): ' + imup   ;info
           if verbose GE 2 THEN print, line                                      ;print info
        END                                                                      ;end if NO is not found
     ENDCASE                                                                     ;end position of NO text
     check_indir, indir, imup, VERBOSE=1                                         ;check indir
     
     CASE xx OF                                                                         ;check which image
        0 : BEGIN                                                                       ;if first image
           tickim = systime(/SECONDS)                                                   ;find start time
           im = mrdfits(imup, 1, hdr, /SILENT)                                          ;read in image
           imcopy = im                                                                  ;make copy of image
           if help eq 'Y' then begin                                                    ;if help requested
              help, im, /STRUC                                                          ;print info
              help, hdr                                                                 ;print info
           endif                                                                        ;end if help requested
           chk = where((im NE im) OR (im GT 999999999.0) OR (im LT -999999999.0), nchk) ;find Infs, NaNs
           if nchk NE 0 then im[chk] = 0                                                ;reset Infs, NaNs to zero

           sz = size(im)                         ;find size of image
           imagemap = fltarr(sz[1], sz[2], fili) ;create array for all photometry images
           multimap = fltarr(sz[1], sz[2], fili) ;create array for all probability detection images
           
           xref1 = fxpar(hdr, 'CRPIX1')    ;get value from header
           yref1 = fxpar(hdr, 'CRPIX2')    ;get value from header
           raref1 = fxpar(hdr, 'CRVAl1')   ;get value from header
           decref1 = fxpar(hdr, 'CRVAL2')  ;get value from header
           deltara1 = fxpar(hdr, 'CD1_1')  ;get value from header
           deltadec1 = fxpar(hdr, 'CD2_2') ;get value from header
           
           
           IF multimapflag EQ 1 THEN BEGIN                            ;if MULTIMAPFLAG is on
              
              ;;;load input values for background and dispersion calculations
              CASE keyword_set(INPUTS) OF                             ;case of INPUT keyword
                 0 : BEGIN                                            ;if INPUT not set
                    print, ' Using internal default values'           ;print info
                    kersize = fix(abs(3.0 / (deltara1*3600.0)))       ;find smoothing kernel size 
                 END                                                  ;end if INPUT not set
                 1 : BEGIN                                            ;if INPUT set
                    inputs = multimap_inputs(inputs)                  ;get values
                    print, inputs.band 
                    print, xvalues[xx]
                    that = where(inputs.band EQ xvalues[xx])          ;check for band
                    IF that[0] EQ -1 THEN BEGIN                       ;must be a match
                       print, 'WARNING!! Band not found!!'            ;print info
                       stop                                           ;stop program
                    ENDIF                                             ;end must be a match
                    inputs = inputs[that]                             ;get specific band
                    varbin = inputs.back_varbin                       ;store value
                    cut = inputs.back_cut                             ;store value
                    grow = inputs.back_grow                           ;store value
                    annulus = inputs.back_annulus                     ;store value
                    kersize = inputs.back_bkkersz                     ;store value
                    imkerzs = inputs.disp_imkersz                     ;store value
                    mubins = inputs.disp_mubins                       ;store value
                    sigbins = inputs.disp_sigbins                     ;store value
                    ulfrac = inputs.disp_ulfrac                       ;store value
                 END                                                  ;end if INPUT set
                 ELSE : print, 'Something has gone terrible wrong!!!' ;catch warning
              ENDCASE                                                 ;end check INPUt keyword
              
              ;;;flattening the image
              if verbose GE 2 THEN print, '  Checking background...'              ;print info
              tick = systime(/SECONDS)                                            ;find start time
              back = checkback(im, VARBIN=varbin, CUT=cut, GROW=grow, $           ;cont next line
                               ANNULUS=annulus, BKKERSZ=kersize, VERBOSE=verbose) ;call background
              im = im - back                                                      ;subtract background
              tock = systime(/SECONDS)                                            ;find end time
              if verbose GE 1 THEN print, ' Step took:', tock - tick, 'sec'       ;print info
              outfile = imup                                                      ;copy string
              strreplace, outfile, indir, ' '                                     ;outfileq
              strreplace, outfile, '.fits', '_imafterback.fits'                   ;outfileq
              outfile = strcompress(outfile, /REMOVE_ALL)                         ;remove whitespace
              if keyword_set(WRTMETA) then mwrfits, im, outfile, hdr, /CREATE     ;write image
              
              
              ;;;normalizing to unit dispersion
              if verbose GE 2 THEN print, '  Normalizing to unit dispersion...'      ;print info
              tick = systime(/SECONDS)                                               ;find start time
              dispersion = normdisp(im, IMKERSZ=imkersz, MUBINS=mubins, $            ;cont next line
                                    SIGBINS=sigbins, ULFRAC=ulfrac, VERBOSE=verbose) ;call normdisp
              im  = im / dispersion                                                  ;im to unit dispersion
              tock = systime(/SECONDS)                                               ;find end time
              if verbose GE 1 THEN print, ' Step took:', tock - tick, 'sec'          ;print info
              strreplace, outfile, '_imafterback.fits', '_imafterdisp.fits'          ;outfile
              if keyword_set(WRTMETA) then mwrfits, im, outfile, hdr, /CREATE        ;write image
              
              
              ;;;remove pesky ring of 'high signal' that is a by product of working with image
              tick = systime(/SECONDS)                                                  ;find start time
              if verbose GE 2 THEN print, '  Removing "high significance" edge ring...' ;print info
              FOR zz=0, edgepix-1, 1 DO BEGIN                                           ;loop # edge pixels to buffer
                 chk = where(im EQ 0, nchk, COMPLEMENT=comchk)                          ;find nonzeros
                 IF nchk NE 0 THEN BEGIN                                                ;check objects exist
                    inds = array_indices(im, chk)                                       ;find x,y coords
                    set = [inds[0,*]+1,inds[1,*]]                                       ;pixels to the right
                    im[set[0,*],set[1,*]] = 0                                           ;set to 0
                    set = [inds[0,*]-1,inds[1,*]]                                       ;pixels to the left
                    im[set[0,*],set[1,*]] = 0                                           ;set to 0
                    set = [inds[0,*],inds[1,*]+1]                                       ;pixels above
                    im[set[0,*],set[1,*]] = 0                                           ;set to 0
                    set = [inds[0,*],inds[1,*]-1]                                       ;pixels below
                    im[set[0,*],set[1,*]] = 0                                           ;set to 0
                 ENDIF                                                                  ;end check object exist
              ENDFOR                                                                    ;end loop buffer
              tock = systime(/SECONDS)                                                  ;find end time
              if verbose GE 1 THEN print, ' Step took:', tock - tick, 'sec'             ;print info
           
              
              ;;;double check that the image is indeed zero mean, unit dispersion
              chk = where(im NE 0, nchk)                                                       ;find nonzeros
              print, '  Mean of image after : ', mean(im[chk])                                 ;print info
              print, '  Median of image after : ', median(im[chk])                             ;print info 
              min = -3.0                                                                       ;min value at 3 sigma
              max = 3.0                                                                        ;max value at 3 sigma
              nbins = 100.0                                                                    ;# of bins
              test = histogram(im[chk], MIN=min, MAX=max, NBINS=nbins)                         ;bin up data
              bins = FINDGEN(n_elements(test))*((max-min)/nbins) + min                         ;find bin values
              test = float(test)                                                               ;need values to be float
              maxtest = max(test, indtest)                                                     ;find most probable slope value
              if verbose GE 1 THEN print,  '  Most frequent background value: ', bins[indtest] ;prslp info
              imsigs = sigmas(bins, test, LEVELS=1)                                            ;find sigmas 
              print, '  1 sigmas (-,+) of image after : ', imsigs                              ;print, info
              
              fakeys = [-100.0, 100.0]                                             ;fake data points
              window, 4, XPOS=400, YPOS=100, XSIZE=450, YSIZE=450                  ;window location
              plot, bins, test, $                                                  ;plot data
                    COLOR='000000'XL, $                                            ;plot option
                    BACKGROUND = 'FFFFFF'XL, $                                     ;plot option
                    TITLE = 'Zero Mean, Unit Dispersion Image Dist', $             ;plot options
                    XTITLE = 'Image Values [units]', $                             ;plot option
                    YTITLE = 'Frequency', $                                        ;plot option
                    CHARSIZE = 1.5                                                 ;plot option
              oplot, [bins[indtest],bins[indtest]], fakeys, $                      ;plot line on most likely value
                     COLOR='000000'XL, LINESTYLE=2                                 ;plot options
              oplot, [bins[indtest]-imsigs[0], bins[indtest]-imsigs[0]], fakeys, $ ;plot -1sigma
                     COLOR='000000'XL, LINESTYLE=1                                 ;plot options
              oplot, [bins[indtest]+imsigs[1], bins[indtest]+imsigs[1]], fakeys, $ ;plot +1sigma
                     COLOR='000000'XL, LINESTYLE=1                                 ;plot options
              
              set_plot, 'ps'                                                       ;set plot to postscript
              outchk = imup                                                        ;copy input name
              strreplace, outchk, '.fits', '.ps'                                   ;change suffix
              device, FILENAME=outchk, /COLOR                                      ;set plot options
              plot, bins, test, $                                                  ;plot data
                    COLOR='000000'XL, $                                            ;plot option
                    BACKGROUND = 'FFFFFF'XL, $                                     ;plot option
                    TITLE = 'Zero Mean, Unit Dispersion Image Dist', $             ;plot options
                    XTITLE = 'Image Values [units]', $                             ;plot option
                    YTITLE = 'Frequency', $                                        ;plot option
                    CHARSIZE = 1.5                                                 ;plot option
              oplot, [bins[indtest],bins[indtest]], fakeys, $                      ;plot line on most likely value
                     COLOR='000000'XL, LINESTYLE=2                                 ;plot options
              oplot, [bins[indtest]-imsigs[0], bins[indtest]-imsigs[0]], fakeys, $ ;plot -1sigma
                     COLOR='000000'XL, LINESTYLE=1                                 ;plot options
              oplot, [bins[indtest]+imsigs[1], bins[indtest]+imsigs[1]], fakeys, $ ;plot +1sigma
                     COLOR='000000'XL, LINESTYLE=1                                 ;plot options
              device, /CLOSE                                                       ;close device
              set_plot, 'x'                                                        ;reset plot to nothing

              
              ;;;Square and set in storage array, write out original image in new image coordinates
              im = im^2                                                        ;square image
              strreplace, outfile, '_imafterdisp.fits', '_imaftersquared.fits' ;outfile
              if keyword_set(WRTMETA) THEN mwrfits, im, outfile, hdr, /CREATE  ;write image
              multimap[*,*,xx] = im                                            ;set in storage array
           ENDIF                                                               ;end MULTIMAPFLAG on
           
           imagemap[*,*,xx] = imcopy                                    ;set in storage array
           newoutfile = imup                                            ;copy name
           strreplace, newoutfile, 'resamp.fits', 'resamp_szmulti.fits' ;replace string in name
           mwrfits, imagemap[*,*,xx], newoutfile, hdr, /CREATE          ;write out placed image
           
           
           ;;;write out the image coordinate aligned weight map if given
           tick = systime(/SECONDS)                                                                ;find start time
           if keyword_set(WEILIST) EQ 1 THEN BEGIN                                                 ;if WEILIST keyword set
              weigup = weigs[xx]                                                                   ;get name
              weig = mrdfits(weigup, 0, whdr, /SILENT)                                             ;read in image
              if help eq 'Y' then begin                                                            ;if help requested
                 help, im, /STRUC                                                                  ;print info
                 help, hdr                                                                         ;print info
              endif                                                                                ;end if help requested
              chk = where((weig NE weig) OR (weig GT 999999999.0) OR (weig LT -999999999.0), nchk) ;find Infs, NaNs
              if nchk NE 0 then weig[chk] = 0                                                      ;reset Infs, NaNs to zero
              
              if keyword_set(HELP) then help, weig      ;print help
              wsz = size(weig)                          ;find size of image
              weightmap = fltarr(wsz[1], wsz[2], weili) ;create array for all images
              
              wxref1 = fxpar(whdr, 'CRPIX1')    ;get value from header
              wyref1 = fxpar(whdr, 'CRPIX2')    ;get value from header
              wraref1 = fxpar(whdr, 'CRVAl1')   ;get value from header
              wdecref1 = fxpar(whdr, 'CRVAL2')  ;get value from header
              wdeltara1 = fxpar(whdr, 'CD1_1')  ;get value from header
              wdeltadec1 = fxpar(whdr, 'CD2_2') ;get value from header
              
              weightmap[*,*,xx] = weig                                     ;set weight map in array
              newoutfile = weigup                                          ;copy name
              strreplace, newoutfile, 'weight.fits', 'weight_szmulti.fits' ;replace string in name
              mwrfits, weightmap[*,*,xx], newoutfile, whdr, /CREATE        ;write out placed image  
           ENDIF                                                           ;end weight list area
           tock = systime(/SECONDS)                                        ;find start time
           print, 'Writing weight image took', tock-tick, 'sec'            ;print info
           
           tockim = systime(/SECONDS)                ;find start time
           print, 'Image took', tockim-tickim, 'sec' ;print info
        end                                          ;end if first image
        
        else : BEGIN                                                                    ;if any other image
           tickim = systime(/SECONDS)                                                   ;find start time
           im = mrdfits(imup, 0, hdr2, /SILENT)                                         ;read in image
           imcopy = im                                                                  ;copy photometry image
           if help eq 'Y' then begin                                                    ;if help requested
              help, im, /STRUC                                                          ;print info
              help, hdr2                                                                ;print info
           endif                                                                        ;end if help requested
           chk = where((im NE im) OR (im GT 999999999.0) OR (im LT -999999999.0), nchk) ;find Infs, NaNs
           if nchk NE 0 then im[chk] = 0                                                ;reset Infs, NaNs to zero
           
           sz2 = size(im)                   ;find size of image
           xref2 = fxpar(hdr2, 'CRPIX1')    ;get value from header
           yref2 = fxpar(hdr2, 'CRPIX2')    ;get value from header
           raref2 = fxpar(hdr2, 'CRVAl1')   ;get value from header
           decref2 = fxpar(hdr2, 'CRVAL2')  ;get value from header
           deltara2 = fxpar(hdr2, 'CD1_1')  ;get value from header
           deltadec2 = fxpar(hdr2, 'CD2_2') ;get value from header
           
           
           IF multimapflag EQ 1 THEN BEGIN                                  ;if multimap flag is on
             
              ;;;flattening the image
              if verbose GE 2 THEN print, '  Checking background...'              ;print info
              tick = systime(/SECONDS)                                            ;find start time
              kersize = fix(abs(3.0 / (deltara2*3600.0)))                         ;find smoothing kernel size 
              back = checkback(im, VARBIN=varbin, CUT=cut, GROW=grow, $           ;cont next line
                               ANNULUS=annulus, BKKERSZ=kersize, VERBOSE=verbose) ;call background
              im = im - back                                                      ;subtract background
              tock = systime(/SECONDS)                                            ;find end time
              if verbose GE 1 THEN print, ' Step took:', tock - tick, 'sec'       ;print info
              outfile = imup                                                      ;copy string
              strreplace, outfile, indir, ' '                                     ;outfileq
              strreplace, outfile, '.fits', '_imafterback.fits'                   ;outfileq
              outfile = strcompress(outfile, /REMOVE_ALL)                         ;remove whitespace
              if keyword_set(WRTMETA) then mwrfits, im, outfile, hdr2, /CREATE    ;write image
           
            
              ;;;normalizing to unit dispersion
              if verbose GE 2 THEN print, '  Normalizing to unit dispersion...'      ;print info
              tick = systime(/SECONDS)                                               ;find start time
              dispersion = normdisp(im, IMKERSZ=imkersz, MUBINS=mubins, $            ;cont next line
                                    SIGBINS=sigbins, ULFRAC=ulfrac, VERBOSE=verbose) ;call normdisp
              im  = im / dispersion                                                  ;im to unit dispersion
              tock = systime(/SECONDS)                                               ;find end time
              if verbose GE 1 THEN print, ' Step took:', tock - tick, 'sec'          ;print info
              strreplace, outfile, '_imafterback.fits', '_imafterdisp.fits'          ;outfile
              if keyword_set(WRTMETA) then mwrfits, im, outfile, hdr2, /CREATE       ;write image
              
           
              ;;;remove pesky ring of 'high signal' that is a by product of working with image
              tick = systime(/SECONDS)                                                  ;find start time
              if verbose GE 2 THEN print, '  Removing "high significance" edge ring...' ;print info
              FOR zz=0, edgepix-1, 1 DO BEGIN                                           ;loop # edge pixels to buffer
                 chk = where(im EQ 0, nchk, COMPLEMENT=comchk)                          ;find nonzeros
                 IF nchk NE 0 THEN BEGIN                                                ;check objects exist
                    inds = array_indices(im, chk)                                       ;find x,y coords
                    set = [inds[0,*]+1,inds[1,*]]                                       ;pixels to the right
                    im[set[0,*],set[1,*]] = 0                                           ;set to 0
                    set = [inds[0,*]-1,inds[1,*]]                                       ;pixels to the left
                    im[set[0,*],set[1,*]] = 0                                           ;set to 0
                    set = [inds[0,*],inds[1,*]+1]                                       ;pixels above
                    im[set[0,*],set[1,*]] = 0                                           ;set to 0
                    set = [inds[0,*],inds[1,*]-1]                                       ;pixels below
                    im[set[0,*],set[1,*]] = 0                                           ;set to 0
                 ENDIF                                                                  ;end check object exist
              ENDFOR                                                                    ;end loop buffer
              tock = systime(/SECONDS)                                                  ;find end time
              if verbose GE 1 THEN print, ' Step took:', tock - tick, 'sec'             ;print info
              

              ;;;double check that the image is indeed zero mean, unit dispersion
              chk = where(im NE 0, nchk)                                                       ;find nonzeros
              print, '  Mean of image after : ', mean(im[chk])                                 ;print info
              print, '  Median of image after : ', median(im[chk])                             ;print info 
              min = -3.0                                                                       ;min value at 3 sigma
              max = 3.0                                                                        ;max value at 3 sigma
              nbins = 100.0                                                                    ;# of bins
              test = histogram(im[chk], MIN=min, MAX=max, NBINS=nbins)                         ;bin up data
              bins = FINDGEN(n_elements(test))*((max-min)/nbins) + min                         ;find bin values
              test = float(test)                                                               ;need values to be float
              maxtest = max(test, indtest)                                                     ;find most probable slope value
              if verbose GE 1 THEN print,  '  Most frequent background value: ', bins[indtest] ;prslp info
              imsigs = sigmas(bins, test, LEVELS=1)                                            ;find sigmas 
              print, '  1 sigmas (-,+) of image after : ', imsigs                              ;print, info
              
              fakeys = [-100.0, 100.0]                                             ;fake data points
              window, 4, XPOS=400, YPOS=100, XSIZE=450, YSIZE=450                  ;window location
              plot, bins, test, $                                                  ;plot distribution
                    COLOR='000000'XL, $                                            ;plot option
                    BACKGROUND = 'FFFFFF'XL, $                                     ;plot option
                    TITLE = 'Zero Mean, Unit Dispersion Image Dist', $             ;plot options
                    XTITLE = 'Image Values [units]', $                             ;plot option
                    YTITLE = 'Frequency', $                                        ;plot option
                    CHARSIZE = 1.5                                                 ;plot option
              oplot, [bins[indtest],bins[indtest]], fakeys, $                      ;plot line on most likely value
                     COLOR='000000'XL, LINESTYLE=2                                 ;plot options
              oplot, [bins[indtest]-imsigs[0], bins[indtest]-imsigs[0]], fakeys, $ ;plot -1sigma
                     COLOR='000000'XL, LINESTYLE=1                                 ;plot options
              oplot, [bins[indtest]+imsigs[1], bins[indtest]+imsigs[1]], fakeys, $ ;plot +1sigma
                     COLOR='000000'XL, LINESTYLE=1                                 ;plot options
              
              set_plot, 'ps'                                                       ;set plot to postscript
              outchk = imup                                                        ;copy input name
              strreplace, outchk, '.fits', '.ps'                                   ;change suffix
              device, FILENAME=outchk, /COLOR                                      ;set plot options
              plot, bins, test, $                                                  ;plot data
                    COLOR='000000'XL, $                                            ;plot option
                    BACKGROUND = 'FFFFFF'XL, $                                     ;plot option
                    TITLE = 'Zero Mean, Unit Dispersion Image Dist', $             ;plot options
                    XTITLE = 'Image Values [units]', $                             ;plot option
                    YTITLE = 'Frequency', $                                        ;plot option
                    CHARSIZE = 1.5                                                 ;plot option
              oplot, [bins[indtest],bins[indtest]], fakeys, $                      ;plot line on most likely value
                     COLOR='000000'XL, LINESTYLE=2                                 ;plot options
              oplot, [bins[indtest]-imsigs[0], bins[indtest]-imsigs[0]], fakeys, $ ;plot -1sigma
                     COLOR='000000'XL, LINESTYLE=1                                 ;plot options
              oplot, [bins[indtest]+imsigs[1], bins[indtest]+imsigs[1]], fakeys, $ ;plot +1sigma
                     COLOR='000000'XL, LINESTYLE=1                                 ;plot options
              device, /CLOSE                                                       ;close device
              set_plot, 'x'                                                        ;reset plot to nothing
              
              
              ;;;Square and set in storage array, 
              im = im^2                                                        ;square image
              strreplace, outfile, '_imafterdisp.fits', '_imaftersquared.fits' ;outfile
              if keyword_set(WRTMETA) THEN mwrfits, im, outfile, hdr2, /CREATE ;write image
           ENDIF

           lx = xref2-xref1                                    ;find difference in x ref pixels
           IF lx LT 0 THEN BEGIN                               ;if value outside 2nd image
              llx = abs(lx)                                    ;find absolute value of diff
              lx = 0                                           ;set lower edge
           ENDIF ELSE BEGIN                                    ;if value not outside 2nd image
              llx = 0                                          ;lower limit set
              lx = lx                                          ;set lower edge
           ENDELSE                                             ;end difference value
           ux = xref2+(sz[1]-xref1-1)                          ;find propsed upper limit
           IF ux GT sz2[1] THEN ux = sz2[1]-1                  ;if upper limit outside image
           ly = yref2-yref1                                    ;find difference in y ref pixels
           IF ly LT 0 THEN BEGIN                               ;if value outside 2nd image
              lly = abs(ly)                                    ;find absolute value of diff
              ly = 0                                           ;set lower edge
           ENDIF ELSE BEGIN                                    ;if value not outside 2nd image
              lly = 0                                          ;lower limit set
              ly = ly                                          ;set lower edge
           ENDELSE                                             ;end difference value
           uy = yref2+(sz[1]-yref1-1)                          ;find propsed upper limit
           IF uy GE sz2[2]-1 THEN uy = sz2[2]-2                ;if upper limit outside image
           im = im[lx:ux, ly:uy]                               ;cutout image
           IF multimapflag EQ 1 then multimap[llx,lly,xx] = im ;set cutout in array
           
           imcopy = imcopy[lx:ux, ly:uy]                                   ;crop photometry image
           imagemap[llx,lly,xx] = imcopy                                   ;set in storage array
           newoutfile = imup                                               ;copy name
           strreplace, newoutfile, 'resamp.fits', 'resamp_szmulti.fits'    ;replace string in name
           mwrfits, imagemap[*,*,xx], newoutfile, hdr, /CREATE             ;write out placed image
           

           ;;;write our new plot of image and weight map if given
           tick = systime(/SECONDS)                                                                ;find start time
           if keyword_set(WEILIST) EQ 1 THEN BEGIN                                                 ;if WEILIST keyword set
              weigup = weigs[xx]                                                                   ;get name
              weig = mrdfits(weigup, 0, whdr2, /SILENT)                                            ;read in image
              if help eq 'Y' then begin                                                            ;if help requested
                 help, im, /STRUC                                                                  ;print info
                 help, hdr                                                                         ;print info
              endif                                                                                ;end if help requested
              chk = where((weig NE weig) OR (weig GT 999999999.0) OR (weig LT -999999999.0), nchk) ;find Infs, NaNs
              if nchk NE 0 then weig[chk] = 0                                                      ;reset Infs, NaNs to zero
              
              wsz2 = size(weig)                  ;find size of image
              wxref2 = fxpar(whdr2, 'CRPIX1')    ;get value from header
              wyref2 = fxpar(whdr2, 'CRPIX2')    ;get value from header
              wraref2 = fxpar(whdr2, 'CRVAl1')   ;get value from header
              wdecref2 = fxpar(whdr2, 'CRVAL2')  ;get value from header
              wdeltara2 = fxpar(whdr2, 'CD1_1')  ;get value from header
              wdeltadec2 = fxpar(whdr2, 'CD2_2') ;get value from header
              
              lx = wxref2-wxref1                     ;find difference in x ref pixels
              IF lx LT 0 THEN BEGIN                  ;if value outside 2nd image
                 llx = abs(lx)                       ;find absolute value of diff
                 lx = 0                              ;set lower edge
              ENDIF ELSE BEGIN                       ;if value not outside 2nd image
                 llx = 0                             ;lower limit set
                 lx = lx                             ;set lower edge
              ENDELSE                                ;end difference value
              ux = wxref2+(wsz[1]-wxref1-1)          ;find propsed upper limit
              IF ux GT wsz2[1] THEN ux = wsz2[1]-1   ;if upper limit outside image
              ly = wyref2-wyref1                     ;find difference in y ref pixels
              IF ly LT 0 THEN BEGIN                  ;if value outside 2nd image
                 lly = abs(ly)                       ;find absolute value of diff
                 ly = 0                              ;set lower edge
              ENDIF ELSE BEGIN                       ;if value not outside 2nd image
                 lly = 0                             ;lower limit set
                 ly = ly                             ;set lower edge
              ENDELSE                                ;end difference value
              uy = wyref2+(wsz[1]-wyref1-1)          ;find propsed upper limit
              IF uy GE wsz2[2]-1 THEN uy = wsz2[2]-2 ;if upper limit outside image
              weig = weig[lx:ux,ly:uy]               ;cutout weight image
              weightmap[llx,lly,xx] = weig           ;set weight map in array
              
              newoutfile = weigup                                                  ;copy name
              strreplace, newoutfile, 'weight.fits', 'weight_szmulti.fits'         ;replace string in name
              mwrfits, weightmap[*,*,xx], newoutfile, whdr, /CREATE                ;write out placed image  
           ENDIF                                                                   ;end weight list area
           tock = systime(/SECONDS)                                                ;find start time
           print, 'Writing resize image (and weight image) took', tock-tick, 'sec' ;print info
           
           tockim = systime(/SECONDS)                ;find start time
           print, 'Image took', tockim-tickim, 'sec' ;print info
        end                                          ;end if any other image
     endcase                                         ;end check which image
  endfor                                             ;end loop over images
  
  
  ;;;Add all images 
  case keyword_set(REMAKE) OF                                       ;check remake keyword
     0 : BEGIN                                                      ;if remake not set
        FOR xx=0, fili-1, 1 DO BEGIN                                ;loop over images
           IF xx EQ 0 THEN BEGIN                                    ;if first pass
              finalmap = multimap[*,*,0]                            ;begin final image
           ENDIF ELSE finalmap = finalmap + multimap[*,*,xx]        ;else add to final image
        ENDFOR                                                      ;end loop over images
        mwrfits, finalmap, 'multimap_cumprobmap.fits', hdr, /CREATE ;write image
     END                                                            ;end if remake not set
     1 : BEGIN                                                      ;if REMAKE keyword set
        line = ''                                                   ;intialize
        xx = 0                                                      ;intialize counter
        fili = file_lines(ximlist)                                  ;find # of images
        store = strarr(fili)                                        ;create storage array
        openr, lun, ximlist[0], /GET_LUN                            ;open file to read
        WHILE NOT eof(lun) DO BEGIN                                 ;until we reach the end of the file
           readf, lun, line                                         ;read line from file
           store[xx] = line                                         ;store line
           xx++                                                     ;increment counter
        ENDWHILE                                                    ;end until reach EOF
        
        FOR yy=0, n_elements(store)-1, 1 DO BEGIN ;loop over # of images
           print, store[yy]
           imup = store[yy]                                                          ;pick next image up
           useable = strpos(imup, 'NO')                                              ;check if NO flag is present
           CASE useable OF                                                           ;position of NO text
              -1 : BEGIN                                                             ;if NO not found
                 imup = imup                                                         ;image name remains same
                 multimapflag = 1                                                    ;turn flag on
                 line = '  Now working on image : ' + imup                           ;info
                 if verbose GE 2 THEN print, line                                    ;print info
                 goodli++                                                            ;up # of good images
              END                                                                    ;end if NO not found
              ELSE : BEGIN                                                           ;if NO is found
                 tmpimup = imup                                                      ;copy image name
                 strreplace, tmpimup, 'NO', ' '                                      ;replace NO string
                 imup = strcompress(tmpimup, /REMOVE_ALL)                            ;remove white spaces
                 multimapflag = 0                                                    ;turn flag to off
                 line = '  Now working on image (NO MULTIMAP CONTRIBUTION): ' + imup ;info
                 if verbose GE 2 THEN print, line                                    ;print info
              END                                                                    ;end if NO is not found
           ENDCASE                                                                   ;end position of NO text
           check_indir, indir, imup, VERBOSE=1                                       ;check indir
           
           IF yy EQ 0 THEN BEGIN                    ;first image
              im = mrdfits(imup, 0, hdr)            ;read in image
              sz = size(im)                         ;find size of image
              multimap = fltarr(sz[1], sz[2], fili) ;create array for all images
              xref1 = fxpar(hdr, 'CRPIX1')          ;get value from header
              yref1 = fxpar(hdr, 'CRPIX2')          ;get value from header
              raref1 = fxpar(hdr, 'CRVAl1')         ;get value from header
              decref1 = fxpar(hdr, 'CRVAL2')        ;get value from header
              deltara1 = fxpar(hdr, 'CD1_1')        ;get value from header
              deltadec1 = fxpar(hdr, 'CD2_2')       ;get value from header
              multimap[*,*,yy] = im                 ;set in storage array
           ENDIF ELSE BEGIN                         ;if not first image
              
              im = mrdfits(imup, 0, hdr2)                      ;read in second image
              sz2 = size(im)                                        ;find size of image
              xref2 = fxpar(hdr2, 'CRPIX1')                         ;get value from header
              yref2 = fxpar(hdr2, 'CRPIX2')                         ;get value from header
              raref2 = fxpar(hdr2, 'CRVAl1')                        ;get value from header
              decref2 = fxpar(hdr2, 'CRVAL2')                       ;get value from header
              deltara2 = fxpar(hdr2, 'CD1_1')                       ;get value from header
              deltadec2 = fxpar(hdr2, 'CD2_2')                      ;get value from header
              lx = xref2-xref1                                      ;find difference in x ref pixels
              IF lx LT 0 THEN BEGIN                                 ;if value outside 2nd image
                 llx = abs(lx)                                      ;find absolute value of diff
                 lx = 0                                             ;set lower edge
              ENDIF ELSE BEGIN                                      ;if value not outside 2nd image
                 llx = 0                                            ;lower limit set
                 lx = lx                                            ;set lower edge
              ENDELSE                                               ;end difference value
              ux = xref2+(sz[1]-xref1-1)                            ;find propsed upper limit
              IF ux GT sz2[1] THEN ux = sz2[1]-1                    ;if upper limit outside image
              ly = yref2-yref1                                      ;find difference in y ref pixels
              IF ly LT 0 THEN BEGIN                                 ;if value outside 2nd image
                 lly = abs(ly)                                      ;find absolute value of diff
                 ly = 0                                             ;set lower edge
              ENDIF ELSE BEGIN                                      ;if value not outside 2nd image
                 lly = 0                                            ;lower limit set
                 ly = ly                                            ;set lower edge
              ENDELSE                                               ;end difference value
              uy = yref2+(sz[1]-yref1-1)                            ;find propsed upper limit
              IF uy GE sz2[2]-1 THEN uy = sz2[2]-2                  ;if upper limit outside image
              im = im[lx:ux, ly:uy]                                 ;cutout image
              multimap[llx,lly,yy] = im                             ;set cutout in array
           ENDELSE                                                  ;end if not first image
        ENDFOR                                                      ;end loop over images
        FOR xx=0, fili-1, 1 DO BEGIN                                ;loop over images
           IF xx EQ 0 THEN BEGIN                                    ;if first pass
              finalmap = multimap[*,*,0]                            ;begin final image
           ENDIF ELSE finalmap = finalmap + multimap[*,*,xx]        ;else add to final image
        ENDFOR                                                      ;end loop over images
        mwrfits, finalmap, 'multimap_cumprobmap.fits', hdr, /CREATE ;write image
     END                                                            ;end if remake is yes
  ENDCASE                                                           ;end check of remake
  finalmap = mrdfits('multimap_cumprobmap.fits', 0, hdr)            ;read image
  finalmap = finalmap^0.5                                           ;we want SNR 
  mwrfits, finalmap, 'multimap_cumprobmap_sqrt.fits', hdr, /CREATE  ;write image


  ;;;make plot of data
  chk = where((finalmap NE 0) AND (finalmap GT 0) AND $                      ;cont next line
              (finalmap LT 100.0), nchk)                                     ;find desired values
  xs = indgen(histbin)*(histmax-histmin)/(histbin-1.0)+histmin               ;find bin value
  values = histogram(finalmap[chk], MIN=histmin, MAX=histmax, NBINS=histbin) ;find # in each binb
  values = alog10(values)                                                    ;take log 
  minlim = min((xs-rnorm), minind, /ABSOLUTE)                                ;find index closest to R norm
  xstest = xs[0:minind]                                                      ;create subset
  valtest = values[0:minind]                                                 ;create subset
  
  fits = probdens_R(xs, goodli)                               ;find prob density
  minpix = n_elements(finalmap) * 0.01                        ;min # of pixels
  maxpix = n_elements(finalmap) * 0.2                         ;max # of pixels
  binpix = 2.0                                                ;sample size
  pix = dindgen((maxpix-minpix)/binpix+1.0) * binpix + minpix ;mu values
  npix = n_elements(pix)                                      ;find number of pix
  
  FOR xx=0UL, minind-1, 1 DO BEGIN                             ;loop over data points
     xfits = alog10(fits[xx]*pix)                              ;calculate valus
     like = (-1.0*(xfits-valtest[xx])^2) / (2.0*0.1^2)         ;calculate likelihood, error was pulled out of thin air
     IF xx EQ 0 THEN likeli = like ELSE likeli = likeli + like ;store probabilities
  ENDFOR                                                       ;end loop overdata points
  likeli = likeli - max(likeli)                                ;subtract max value
  likeli = 10.0^(likeli)                                       ;out of log space
  pmax = max(likeli, pmaxind)                                  ;find highest prob
  norm = pix[pmaxind]                                          ;find most likely value
  fits = alog10(fits*norm)                                     ;"normalize"
  difference = alog10(10^(values)-10^(fits))                   ;find difference between values
  
  window, 5, XPOS=500, YPOS=400, XSIZE=450, YSIZE=450 ;window location
  plot, pix, likeli, $                                ;plot PDF of pix norm
        COLOR = '000000'XL, $                         ;plot options
        BACKGROUND = 'FFFFFF'XL, $                    ;plot options
        TITLE = 'Pixel Norm Likelihood', $            ;plot options
        XTITLE = '# of pixels', $                     ;plot options
        YTITLE = 'Likelihood', $                      ;plot options
        CHARSIZE = 1.5                                ;plot options
  
  
  window, 6, XPOS=575, YPOS=325, XSIZE=450, YSIZE=450 ;plot location
  plot, xs, values, PSYM=4, $                         ;plot measured distr
        COLOR = '000000'XL, $                         ;plot options
        BACKGROUND = 'FFFFFF'XL, $                    ;plot options
        XRANGE = [0.0,10.0], $                        ;plot options
                                ;YRANGE = [0.0,10.0], $;plot options
                                ;/YLOG, $;plot options
        XTITLE = 'R', $         ;plot options
        YTITLE = 'Log Frequency', $      ;plot options
        CHARSIZE = 1.25, $               ;plot options
        SYMSIZE = 1.0                    ;plot options
  oplot, xs, fits, LINESTYLE=0, $        ;overplot expected
         COLOR = '000000'XL              ;plot options
  oplot, xs, difference, LINESTYLE=2, $  ;overplot difference
         COLOR = '000000'XL              ;plot options


end
;========================================================================================================================



;========================================================================================================================
pro call_multimap, PIXSCALE=pixscale

  
  indir = ' '                                                                  ;image directory
  imlist = 'xmm710_multimap_video_v1.txt'                                     ;image list
  weilist = 'lok200_multimap_weilist_v1-0.txt'                                ;corresponding weight list
  IF keyword_set(PIXSCALE) THEN pixscale = pixscale[0] ELSE pixscale = '0.200' ;sets new value
  
  multimap, imlist, INPUTS=pixscale, /WRTMETA
  
  



end
;========================================================================================================================
