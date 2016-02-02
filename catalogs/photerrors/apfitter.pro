; NAME:
;     apfitter
;
; PURPOSE:
;     -Given a segmentation map, apfitter will find a number of
;     randomly-placed apertures of a given radius that do not overlap
;     each other or any of the detections in the segmentation map.
;     -apfitter will write an aperture list .txt file and ds9 region file, and / or
;     output the aperture x & y coordinates as vectors.
;
; CALLING SEQUENCE:
;     apfitter, segmentation_map, number_apertures, aperture_radus
;     [, output, margin, ax, ay, image, buffer]
;
; INPUTS:
;     segmentation_map - input image segmentation map
;     number_apertures - number of apertures to fit
;     aperture_radius  - radius of apertures, in pixels
;
; OPTIONAL INPUTS:
;     img       - original image file, used for finer aperture placement
;     buffer    - buffering distance in pixels from image boundaries
;     output    - filename prefix for aperture .txt and .reg files
;     margin    - (default = 0.1; 0.0<margin<0.5) fractional margin to
;                 exclude around image border.
;
; OPTIONAL OUTPUTS:
;     ax, ay    - output vector of aperture x,y coordinates
;
; NOTES:
;     providing image and buffer will allow apfitter to exclude regions of the image
;     that are 0 or NaN in the original image.
;     the buffer parameter will provide an extra margin from the 0-valued region.
;
;     the perl scripts reg2aplist.pl and aplist2reg.pl can convert between region files
;     and aperture lists. to remove bad apertures, load the .fits and the .reg into
;     ds9, delete undesired apertures, save the regions, and convert the new region file
;     to an aperture list for input to bgextract.
;     Alternatively, one can use awk to trim arbitrary regions of
;     apertures from the aperture list.
;
;     Written 4/29/12 by Ryan Foltz and Alessandro Rettura
;     email: ryan.foltz@email.ucr.edu




;========================================================================================================================
FUNCTION deleterow, matrix, ind
   
                                ; this function is called to remove rows from the aperture list.
  
  dims = size(matrix, /DIMENSIONS)
  nrows = dims[0]
  index = replicate(1l,nrows)
  index[ind] = 0l
  keeprow = where(index eq 1)

  return, [[matrix[keeprow,0]],[matrix[keeprow,1]]]
end
;========================================================================================================================



;========================================================================================================================
pro writeregfile, matrix, radius, name, aplist=aplist
    
                                ; region file output subroutine
  
  dims = size(matrix, /DIMENSIONS)                                                                           ;find size
  nrows = dims[0]                                                                                            ;find points to print
  openw, lun, name, /GET_LUN                                                                                 ;open file to write
  for i=0UL, nrows-1, 1 do begin                                                                             ;loop over apers to write
     if keyword_set(aplist) then begin                                                                       ;check keyword
        printf, lun, strtrim(matrix[i,0],2)+' '+strtrim(matrix[i,1],2)+' '+strtrim(radius,2)                 ;print to file
     endif else begin                                                                                        ;alt to keyword set
        printf, lun, 'image;circle '+strtrim(matrix[i,0],2)+' '+strtrim(matrix[i,1],2)+' '+strtrim(radius,2) ;print to file
     endelse                                                                                                 ;end alt to keyword set
  endfor                                                                                                     ;end loop over apers
  close, lun                                                                                                 ;close file
  free_lun, lun                                                                                              ;free memory
end
;========================================================================================================================



;========================================================================================================================
pro apfitter, segfile, numaps, pixradius, output=output, margin=margin, ax=ax, ay=ay, IMG=img, buffer=buffer
  
  ON_ERROR, 1
  
  if n_params() lt 3 then begin
     print,n_params()
     print,'usage: apfitter, seg_map, number_of_apertures, aperture_radius_pixels, ' + $
           '[output= , margin= , ax=output_x_vector, ay=output_y_vector, img= , buffer=]'
     return
  endif
  
  if not keyword_set(margin) then margin = 0.1 ;set new value
  if not keyword_set(output) then begin
     print, ' No output filename given. Defaulting...'
     ot = strsplit(segfile,'.',/extract)
     output = ot[0]
  endif

  
  if margin ge 0.5 then begin                                                          ;check margin val
     print, 'ERROR: a margin of 50% or greater excludes the entire image. Quitting...' ;
     return                                                                            ;quit
  endif                                                                                ;end check margin val
  
  ;close, /ALL

    ;########################
                                ;    Generate an exclusion map if the
                                ;    user has provided the original image.
    ;########################

  image = readfits(segfile, head, /SILENT) ;read in seg image
  
  if keyword_set(img) then begin               ;check IMG keyword
     print, '  Generating exclusion region...' ;print info
     src = readfits(img, 0, /SILENT)           ;read in actual image
     sz = size(src)                            ;get image size
     index = where(src eq 0, count)            ;check for zeros
     index2 = where(finite(src) eq 0, count2)  ;check for NaNs and Infs
     
     if count + count2 gt 0 then begin ;check NaNs etc exist
        A = bytarr(sz[1],sz[2])        ;create array 
        if count gt 0 then begin       ;if zeros present
           row = index mod sz[1]
           col = index / sz[1]
           A[row,col] = 1
        endif                   ;end if zeros present
        
        if count2 gt 0 then begin
           row= index2 mod sz[1]
           col= index2 / sz[1]
           A[row,col]=1
        endif
        
        i=0                                             ;initialize counter
        for n=0, pixradius+buffer, 2*pixradius do begin ;loop over propsed apers?
           print, '   Growing '+strtrim(n+1,2)+' pixel...'
           A = A + shift(A,pixradius*2,0) + shift(A,-2*pixradius,0) + $
               shift(A,0,2*pixradius) + shift(A,0,-2*pixradius)
           if i mod 4 eq 0 then A[where(A gt 0)] = 1
           i=i+1
        endfor
        image=image+A           ;pads seg image edge with zeros
     endif                      ;end check NaNs etc exist
  endif                         ;end check IMG keyword 
  
  
    ;determine the dimensions of the image and margins
  sizex = fxpar(head, 'NAXIS1')                                                 ;get x size
  marginx = fix(margin * sizex)                                                 ;get x margin size
  sizey = fxpar(head, 'NAXIS2')                                                 ;get y size
  marginy = fix(margin * sizey)                                                 ;get y margin sizE
  print,  '    Image size is: '+strtrim(sizex,2)+'x'+strtrim(sizey,2)+' pixels' ;print info
  
  ;;;make sure you can fit the requested apertures in the non-margin region
  density = (3.14 * pixradius^2 * numaps)/((sizex*(1.0-2.0*margin)*(sizey*(1.0-2.0*margin)))) ;find packing density
  print, '    Packing density: '+strtrim(density*100,2)+'%'                                   ;print info
  
  IF density gt .91 then begin  ;packing density sanity check
     print,'ERROR: packing density exceeds the maximum possible value. quitting...'                    ;print info
     return                                                                                            ;exit
  ENDIF                                                                                                ;end packing density sanity check
  IF density gt .40 then begin                                                                         ;packing density sanity check
     print,'WARNING: packing density is approaching maximal square density. convergence will be slow.' ;print info
  ENDIF                                                                                                ;end packging density sanity check
  
  napertures = 0                ;intialize
  nloops = 0                    ;intialzie
  print, '    Placing '+strtrim(numaps,2),+' apertures...'

  ;;;the main loop places apertures, removes overlaps, removes those that overlap the segmentation
  ;;;map, then repeats until the desired number of apertures is reached
  WHILE (napertures LE 0.99*numaps) DO BEGIN
     
     ;;;place random apertures in matrix a
     a = [[fix(sizex*(1.0-2.0*margin) * randomu(s,numaps) + marginx)], $ ;random x positions
          [fix(sizey*(1.0-2.0*margin) * randomu(s,numaps) + marginy)]]   ;random y positions
     
     ;;;add the master list of apertures to our matrix
     IF n_elements(apertures) EQ 0 THEN apertures = a ELSE a = [apertures,a] ;start or append list
     
     dims = size(a, /DIMENSIONS) ;find size of aper list
     nrows = dims[0]             ;find number of apers in list
     
     ;;;I have to give the deletion list something to start with, we'll remove this entry later
     rem=0                      ;initialize
     
     ;;;loop through the apertures, remove ones that are within 2*radius of each other
     FOR i=0UL, nrows-1, 1 DO BEGIN                                ;loop over apertures
        d = fltarr(nrows)                                          ;initialize array
        d = sqrt( float(a[i,0]-a[*,0])^2 + float(a[i,1]-a[*,1])^2) ;find distances
        dd = where(d LE 2.0*pixradius, count)                      ;find apers too close
        IF count GT 0 THEN BEGIN                                   ;if too close apers found
           ddd = where(dd GT i, count)                             ;find too close apers farther along
           IF count GT 0 THEN BEGIN                                ;if too close apers farther along not zero
              dd = dd[ddd]                                         ;keep bad apers  
              rem=[rem,dd]                                         ;add bad apers to deletion list
           ENDIF                                                   ;end check close apers farther along
        ENDIF                                                      ;end check close apers
        
                                ;for j=i+1,nrows-1 do begin
                                ;    d=sqrt( (float(a[i,0]-a[j,0]))^2 + (float(a[i,1]-a[j,1]))^2 )
                                ;    if (d le 2*pixradius) then rem=[rem,j]
                                ;endfor
     ENDFOR

     ;;;now we remove the apertures marked for deletion - all but the first entry in rem.
     IF size(rem, /dimensions) gt 0 THEN BEGIN     ;if apers to remove
        rem=rem[indgen(size(rem,/dimensions)-1)+1] ;find which entries to remove
        a=deleterow(a,rem)                         ;remove bad apers
     ENDIF                                         ;end check bad apers to remove

     ;;;keep only the apertures that have zero flux on the seg map
     dummy = [0,1]                                                              ;aper ignore due to SETSKYVAL
     aper, image, a[*,0], a[*,1], m, errap, sky, skyerr, 1, pixradius, dummy, $ ;cont next line
           [-1000000,1000000], /FLUX, SETSKYVAL=0.0, /SILENT                    ;idl version of DAOPHOT
     index = where(m eq 0, count)                                               ;find which apers have zero flux
     if count ne 0 then a = [[a[index,0]],[a[index,1]]]                         ; keep good apers
     
     sz=size(a)                                            ;find number of apers
     print,  '     Found '+strtrim(sz[4]/2,2)+' apertures' ;print update
     
     IF n_elements(a) GT 0 THEN BEGIN ;if good apers exist
        dims = size(a,/dimensions)    ;find # apers found
        napertures = dims[0]          ;find # apers found
        apertures = a                 ;save apers
     ENDIF                            ;end check good apers
  ENDWHILE                            ;end search for apers
  
  print, '    Writing region file to '+output+'_aplist'+strtrim(pixradius,2)+'.reg'        ;print info
  writeregfile,a,pixradius,output+'_aplist'+strtrim(pixradius,2)+'.reg'                    ;print to file
  print, '    Writing aperture list file to '+output+'_aplist'+strtrim(pixradius,2)+'.txt' ;print info
  writeregfile,a,pixradius,output+'_aplist'+strtrim(pixradius,2)+'.txt',/aplist            ;print to file
  
  ;;;return the x,y coordinates as vectors if the user requested
  if arg_present(ax) then ax=a[*,0] ;gives back data
  if arg_present(ay) then ay=a[*,1] ;gives back data
  
end
;========================================================================================================================
