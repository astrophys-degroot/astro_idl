PRO POSTAGESTAMPS_UNIFORMSIZE;, image, rms_image, outpath, cat, ID_tag, RA_tag, Dec_tag, axis_size, pixel_scale
;=============================================== 
; takes an image & rms image and cuts postage stamps of same uniform size from both
; outpath indicates the path to put the postage stamps
; ID is the ID for the galaxy want postage stamps for
; cat is a catalog with the necessary parameters to determine postage stamp sizes
; axis_size = x and y sizes in arcsec
;=============================================== 

;; MOSDEF images
;image='/Volumes/Astro/COSMOS/cos_2epoch_wfc3_f160w_060mas_v1.0_drz.fits'
;;rms_image='/Volumes/Astro/COSMOS/gn_all_candels_wfc3_f160w_060mas_v0.8_rms.fits'
;;segmap='/Volumes/Astro/COSMOS/gs_all_sx_jh_120605_jhphotom_comb_seg_psfmatch2h.fits'
;outpath='/Volumes/Astro/COSMOS/MOSDEF/COSMOS_f160w_postagestamps_10x10/COSMOS_f160w_'
;;seg_outpath='/Volumes/Astro/COSMOS/MOSDEF/goodsn_jh_segstamps/goodsn_jhseg_'
;cat='/Volumes/Astro/COSMOS/MOSDEF/COSMOS_z2_05_nostars_convert.coords.fits'
;ID_tag='HST_ID'
;RA_tag='RA_FULL'
;Dec_tag='DEC_FULL'
;axis_size=10.0
;pixel_scale=0.06
;cut_seg='no'

;MOSDEF PARENTS CATALOGS
image='/Volumes/Astro/COSMOS/cos_2epoch_wfc3_f160w_060mas_v1.0_drz.fits'
outpath='/Volumes/Astro/MOSDEF/parent_catalogs/v4.1/COSMOS_v4.1_10x10_postagestamps/COSMOS_'
cat='/Volumes/Astro/MOSDEF/parent_catalogs/v4.1/COSMOS_v4.1.zall.parent.mosfire.fits'
ID_tag='ID'
RA_tag='RA'
Dec_tag='DEC'
axis_size=10.0
pixel_scale=0.06
cut_seg='no'

cat=mrdfits(cat,1)
axis_length=axis_size/pixel_scale

ID_check=tag_exist(cat,ID_tag,index=ID_ind)                                      ;check that ID that correlates between 2 cats exists in cat
if ID_check EQ 0 then print, 'ID tag not found in cat' 
RA_check=tag_exist(cat,RA_tag,index=RA_ind)                                                ;check RA tag in cat
if RA_check EQ 0 then print, 'RA tag not found in cat' 
Dec_check=tag_exist(cat,Dec_tag,index=Dec_ind)                                             ;check Dec tag in cat
if Dec_check EQ 0 then print, 'Dec tag not found in cat' 
if ((ID_check EQ 0) or (RA_check EQ 0) or (Dec_check EQ 0)) then stop 

num_galaxies=n_elements(cat.(ID_ind))

;read in image information
tick=systime(/seconds)
fits_read, image, im, hd
tock=systime(/seconds)
print, 'time to read image = ', tock-tick, ' seconds'
nx = sxpar(hd, 'NAXIS1')
ny = sxpar(hd, 'NAXIS2')
adxy, hd, cat.(RA_ind), cat.(Dec_ind), x, y ;get x and y positions of each galaxy in the sample
im=0

num_objects=n_elements(cat.(ID_ind))
help, num_objects
output_arr=dblarr(4,num_objects)

for k=0ul, num_objects-1 do begin
   ;determine the xmin, xmax, ymin, and ymax values for each image
   xlo = round(x[k])-round(axis_length/2.0)
   xa = 0
   IF xlo LT 0 THEN BEGIN
      xa = abs(xlo) & xlo = 0
   ENDIF
   xhi = round(x[k])+round(axis_length/2.0)
   IF xhi GT nx-1 THEN xhi=nx-1
   ylo = round(y[k])-round(axis_length/2.0)
   ya = 0
   IF ylo LT 0 THEN BEGIN
      ya = abs(ylo) & ylo = 0
   ENDIF
   yhi=round(y[k])+round(axis_length/2.0)
   IF yhi GT ny-1 THEN yhi = ny-1

   output_arr[0,k]=xlo
   output_arr[1,k]=xhi
   output_arr[2,k]=ylo
   output_arr[3,k]=yhi
ENDFOR


if cut_seg EQ 'yes' then begin
   tick=systime(/seconds)
   fits_read, segmap, seg_im, seg_hd
   tock=systime(/seconds)
   print, 'time to read image = ', tock-tick, ' seconds'
   nx = sxpar(seg_hd, 'NAXIS1')
   ny = sxpar(seg_hd, 'NAXIS2')
   for k=0ul, num_objects-1 do begin
                                ;use hextract to cut the postage stamps
      galnum=cat[k].(ID_ind)
      hextract, seg_im, seg_hd, seg_out, seg_outhd, output_arr[0,k],  output_arr[1,k],  output_arr[2,k],  output_arr[3,k], /silent
      num=strtrim(galnum, 2)    ;removes any white space before and after numbers 
      sxaddpar, seg_outhd, 'EXPTIME', '1.0' ;changed the exposure time of the image to 1 s as opposed to the original value it had
      writefits, seg_outpath+num+'.fits', seg_out, seg_outhd
   endfor  
   seg_im=0
   seg_hd=0
endif 

tick=systime(/seconds)
fits_read, image, im, hd
tock=systime(/seconds)
print, 'time to read image = ', tock-tick, ' seconds'
nx = sxpar(hd, 'NAXIS1')
ny = sxpar(hd, 'NAXIS2')
for k=0ul, num_objects-1 do begin
   ;use hextract to cut the postage stamps
   galnum=cat[k].(ID_ind)
   hextract, im, hd, out, outhd, output_arr[0,k],  output_arr[1,k],  output_arr[2,k],  output_arr[3,k], /silent
   ;hextract, im, hd, out, outhd, xlo, xhi, ylo, yhi, /silent
   num=strtrim(galnum, 2) ;removes any white space before and after numbers 
   sxaddpar, outhd, 'EXPTIME', '1.0' ;changed the exposure time of the image to 1 s as opposed to the original value it had
   writefits, outpath+num+'.fits', out, outhd
endfor  
im=0
hd=0

;read in rms image information
;tick=systime(/seconds)
;fits_read, rms_image, rmsim, rmshd
;tock=systime(/seconds)
;print, 'time to read rms image = ', tock-tick, ' seconds'
;rmsnx = sxpar(rmshd, 'NAXIS1')
;rmsny = sxpar(rmshd, 'NAXIS2')
;for k=0ul, num_objects-1 do begin
;   galnum=cat[k].(ID_ind)
;   num=strtrim(galnum, 2) ;removes any white space before and after numbers 
;   ;do same for rms postage stamps - called rms_#.fits
;   hextract, rmsim, rmshd, rmsout, rmsouthd,  output_arr[0,k],  output_arr[1,k],  output_arr[2,k],  output_arr[3,k], /silent
;   sxaddpar, rmsouthd, 'EXPTIME', '1.0' ;changed the exposure time of the image to 1 s as opposed to the original value it had
;   writefits, outpath+num+'_rms.fits', rmsout, rmsouthd
;endfor
;rmsim=0
;rmshd=0

END


