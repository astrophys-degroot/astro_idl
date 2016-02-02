;========================================================================================================================
function clusterthumb, xreg, image, pixscl, $
                       CUTUNIT=cutunit, CUTSIZE=cutsize, $
                       PREFIX=prefix, BAND=band, $
                       INDIR=indir, IMDIR=imdir, OUTDIR=outdir, $
                       VERBOSE=verbose, HELP=help, WRITEF=writef, WRITEP=writep
  
  

;+
; NAME:
;       CLUSTERTHUMB()
;
; PURPOSE:
;       Making cutouts of an image around specific coordinate list ie clusters 
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
;       A. DeGroot, 2012 Aug 13, Univ. Cali, Riverside v3.0.0
;       A. DeGroot, 2012 Aug 13, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 Aug 13, v1.0.0
;-


  if keyword_set(CUTUNIT) then cutunit = cutunit[0] else cutunit = 1             ;sets new value
  case cutunit of                                                                ;check units given
     1 : begin                                                                   ;if units are arcmin
        if keyword_set(CUTSIZE) then angsz = cutsize[0]*60.0 else angsz= 420.0   ;sets new value
     end                                                                         ;end if units are arcmin
     2 : begin                                                                   ;if units are arcmin
        if keyword_set(CUTSIZE) then angsz = cutsize[0] else angsz = 7.0         ;sets new value
     end                                                                         ;end if units are arcmin
     else : print, 'Improper choice of CUTUNIT value. Please select CUTUNIT=1-2' ;fail safe
  endcase                                                                        ;end check units given
  if keyword_set(PREFIX) then prefix = prefix[0] else prefix = ' '               ;sets new value
  if keyword_set(BAND) then band = band[0] else band = 2                         ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2             ;sets new value
  if keyword_set(OUTDIR) then outdir = outdir[0] else outdir = ' '               ;set new value
  check_dir, 1                                                                   ;compile routines
  

  ;;;File structure checks
  if keyword_set(INDIR) then check_indir, indir, xreg, VERBOSE=verbose  ;check INDIR, reg file 
  if keyword_set(IMDIR) then check_indir, imdir, image, VERBOSE=verbose ;check IMDIR, image
     

  ;;;Read in files
  tmp = ''                       ;initialize
  nlines = file_lines(xreg)      ;find number of lines
  readin = strarr(nlines)        ;create array
  openr, lun, xreg, /GET_LUN     ;open file to read
  for xx=0, nlines-1, 1 do begin ;loop over lines
     readf, lun, tmp             ;get line
     readin[xx] = tmp            ;store line
  endfor                         ;end loop over lines


  ;;;Get coordinates in proper order
  which = whichreg(readin)            ;determines type of reg file 
  coords = getxyfk5deg(readin, which) ;converts and gets RA, DEC deg coords 
  nitems = n_elements(coords.RA)      ;find # of items 

  ;;;Make image cutouts
  check = intarr(nitems)                                                    ;check array
  check2 = fltarr(nitems)                                                   ;another check array
  list = strarr(nitems)                                                     ;array for item thumbnail names
  for xx=0, n_elements(image)-1, 1 do begin                                 ;loop over images
     im = mrdfits(image, 0, hdr)                                            ;read in image
     if verbose ge 4 then print, header                                     ;print info  
     imxsize = FXPAR(hdr, 'NAXIS1')                                         ;image x size
     imysize = FXPAR(hdr, 'NAXIS2')                                         ;image y size
     xpix = angsz / pixscl                                                  ;find # of pixels in x dir
     ypix = angsz / pixscl                                                  ;find # of pixels in y dir
     if verbose ge 3 then print, '   Image size: ', imxsize, ' x ', imysize ;print info
     remain = where(check EQ 0, nremain)                                    ;items which still need a pic
     if nremain ne 0 then begin                                             ;check we still have items to do 
        adxy, hdr, coords.RA, coords.DEC, xpos, ypos                        ;convert to image coord using im hdr 
        xposll = round(xpos - (xpix/2.0))                                   ;x lower limit
        xposul = round(xpos + (xpix/2.0))                                   ;x upper limit
        yposll = round(ypos - (ypix/2.0))                                   ;y lower limit
        yposul = round(ypos + (ypix/2.0))                                   ;y upper limit
        
        
     ;;;Find items in this particular image
        inframe = where((xpos GT 0) AND (xpos LT imxsize) AND $               ;cont next line
                        (ypos GT 0) AND (ypos LT imysize), ninframe)          ;finds detection in image
        if verbose ge 3 then print, '  # of items in this  image: ', ninframe ;print info
        if ninframe ne 0 then check[inframe] = 1                              ;sets to checked
        
     ;;;Extact the clusters in this particular image
        for yy=0L, ninframe-1, 1 do begin                                                         ;loop over clusters in image
           if xposll[inframe[yy]] lt 1 then xposll[inframe[yy]] = 1                               ;fixes x lower lim
           if xposul[inframe[yy]] gt imxsize then xposul[inframe[yy]] = imxsize-1                 ;fixes x upper lim
           if yposll[inframe[yy]] lt 1 then yposll[inframe[yy]] = 1                               ;fixes y lower lim
           if yposul[inframe[yy]] gt imysize then yposul[inframe[yy]] = imysize-1                 ;fixes y upper lim
           hextract, im, hdr, newim, newhdr, xposll[inframe[yy]], xposul[inframe[yy]], $          ;cont next line
                     yposll[inframe[yy]], yposul[inframe[yy]], /SILENT, ERRMSG = errmsg           ;hextract image
           tmpnewim = newim                                                                       ;sets newimage
           nans = where(tmpnewim NE tmpnewim, nnans)                                              ;finds nans
           if nnans ne 0 then tmpnewim[nans] = 0                                                  ;changes nan pixel vals
           tmpmean = mean(tmpnewim)                                                               ;finds mean pixel value
           if tmpmean gt check2[inframe[yy]] then begin                                           ;check should overwrite existing
              check2[inframe[yy]] = tmpmean                                                       ;set new mean value
              clfile = strcompress(prefix + string(coords[inframe[yy]].RA) +  '_' + $             ;cont next line
                                   string(coords[inframe[yy]].DEC) + band + '.fits', /REMOVE_ALL) ;file name
              list[inframe[yy]] = clfile                                                          ;fills in name
              outfile = strcompress(outdir[0]+clfile, /REMOVE_ALL)                                ;append name
              mwrfits, newim, outfile, newhdr, /CREATE                                            ;write file 
           endif else if verbose ge 2 then print, ' Better thumbnail of cluster available!!'      ;print info
        endfor                                                                                    ;end loop over clusters in image
        
     endif                                                                          ;end check still have clustes
     remain2 = where(check EQ 0, nremain2)                                          ;clusters which still need a pic
     if verbose ge 2 then print, '  # of clusters still needing  image: ', nremain2 ;print info
     if xx eq n_elements(s)-1 AND nremain2 ne 0 then $                              ;cont next lin
        print, 'Caution!!! Cluster(s) without a  image!!!'                          ;print info 
  endfor                                                                            ;end loop over images
     

  


 

  ;;;Sort and write out lists of clusters
  sort = sort(list)                   ;sort list
  list = list[reverse(sort)]       ;reorder list


  if keyword_set(OUTDIR) then begin                                      ;check OUTDIR
     check_outdir, outdir, VERBOSE=vebose                                ;sets new value
     chename = strcompress(outdir[0]+'I1I2clusterthumbs/', /REMOVE_ALL)  ;outdir name
  endif else begin                                                       ;end check OUTDIR
     chename = strcompress('I1I2clusterthumbs/', /REMOVE_ALL)            ;outdir name   
  endelse                                                                ;end alt to check OUTDIR

  result = file_test(chename)                  ;checks files
  if result eq 0 then begin                    ;if tree nonexistant
     spawn, ' mkdir I1I2clusterthumbs'         ;if nonexistant, make it
     spawn, ' mkdir I1I2clusterthumbs/iracch2' ;if nonexistant, make it
     spawn, ' mkdir I1I2clusterthumbs/iracch1' ;if nonexistant, make it
     spawn, ' mkdir I1I2clusterthumbs/zband'   ;if nonexistant, make it
  endif                                        ;end if tree nonexistant


  case keyword_set(outdir) of                                                                    ;check OUTDIR keyword
     1: begin                                                                                    ;start if OUTDIR set
        redout = strcompress(outdir[0]+'iracch2/clthumblist_iracch2.txt', /REMOVE_ALL)           ;append name
        greenout = strcompress(outdir[0]+'iracch1/clthumblist_iracch1.txt', /REMOVE_ALL)         ;append name
        blueout = strcompress(outdir[0]+'zband/clthumblist_zband.txt', /REMOVE_ALL)              ;append name
     end                                                                                         ;end if OUTDIR set
     0: begin                                                                                    ;start if OUTDIR not set
        redout = strcompress('I1I2clusterthumbs/iracch2/clthumblist_iracch2.txt', /REMOVE_ALL)   ;append name
        greenout = strcompress('I1I2clusterthumbs/iracch1/clthumblist_iracch1.txt', /REMOVE_ALL) ;append name
        blueout = strcompress('I1I2clusterthumbs/zband/clthumblist_zband.txt', /REMOVE_ALL)      ;append name
     end                                                                                         ;end if OUTDIR not set
  endcase                                                                                        ;end check OUTDIR keyword
  
  openw, lun1, redout, /GET_LUN   ;open file to write
  for zz=0L, nclust-1, 1 do begin ;loop over clusters
     printf, lun1, redlist[zz]    ;print to file
  endfor                          ;end loop over clusters
  close, lun1                     ;close file to write
  free_lun, lun1                  ;free memory unit
  
end
;========================================================================================================================




;========================================================================================================================
pro call_clusterthumb

  indir = '/Users/degroota/research/observing/keck/mosfire/2013july21/targetoptions'
  regfile = 'xmm_z>1.3_clustercands_v1.1.reg'
  imdir = '/Users/degroota/research/originaldatawork/SERVS/xmmlss/iracch1/'
  image = 'servs.xmm.irac.b1.v02.061411.mosaic.fits'
  outdir = '/Users/degroota/research/observing/keck/mosfire/2013july21/targetoptions'  
  pixscl = 0.60
  prefix = 'en1'
  band = '_ch1'

  result = clusterthumb(regfile, image, pixscl, PREFIX=prefix, BAND=band, IMDIR=imdir, VERBOSE=3, /HELP)


;, , OUTDIR=outdir, VERBOSE=3)

end
;========================================================================================================================
