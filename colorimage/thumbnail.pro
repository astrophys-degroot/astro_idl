function E_z, z_prime 
  common share, omega_l, omega_m, omega_k
  return, (omega_m*(1+z_prime)^3 + omega_k*(1+z_prime)^2 + omega_l)^(-0.5)
end




pro thumbnail

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Define all values in this section;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

directory = '/Users/andrew/originaldata/elaisn2/'
field = 'en2'
cluster_cat = strcompress(directory + 'clusters/prototype_clusters.fits', /remove_all)
z_list = strcompress(directory + 'final_cats/zlist.dat', /remove_all) 
ch1_list = strcompress(directory + 'final_cats/ch1_list.dat', /remove_all)
ch2_list = strcompress(directory + 'final_cats/ch2_list.dat', /remove_all)

common share, omega_l, omega_m, omega_k
omega_l = 0.7
omega_m = 0.3
omega_k = 0.0
H_0 = 70 ;[km/s/Mpc]
r_cluster = 0.5 ;[Mpc]
z_pixscale = 0.185 ; [arcsec/pixel]
irac_pixscale = 0.60 ; [arcsec/pixel]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;This section does the prep work
clusters = mrdfits(cluster_cat, 1) ;this reads in the cluster file
id_tag = indgen(n_elements(clusters.ra_deg))


;;;This is method 1 of comoving radius calculation
   z_prime = findgen(7000.0) / 1000.0 ;creates a subarray of points for integration
   d_c = qromb('E_z', 0, clusters.z )                  ;integrate the function using subarray of points
   distance = (2.99E5 / H_0) * d_c                   ;calculates the proper distance
   angle_rad = r_cluster / (distance/(1+clusters.z)) ; find the angle in radians corresponding to cluster radius
   angle_arcsec = angle_rad * (648000.0/!pi)       ;converts radians to arc seconds
   angle_arcmin = angle_arcsec / 60.0              ; converts arc seconds to arc minutes
   angle_deg = angle_arcsec / 3600                 ; converts arc seconds to degrees
   ;print, 'Cluster radius: ', angle_rad, angle_arcsec, angle_arcmin ; prints info
   ;print,  ' '


;;;This section creates thumbnails for each cluster in the z band
image_direct = strcompress(directory + 'clusters/z_thumbnails/', /remove_all)
test_image_direct = file_test(image_direct, /directory)
if test_image_direct NE 1 then spawn, 'mkdir ' + image_direct ; makes directory if nonexistant 
image_direct = strcompress(directory + 'clusters/z_thumbnails/' + 'r_' + string(r_cluster) + 'Mpc/', /remove_all)
test_image_direct = file_test(image_direct, /directory)
if test_image_direct NE 1 then spawn, 'mkdir ' + image_direct ; makes directory if nonexistant 

z_images = strarr(file_lines(z_list)) ;creates string array with image names
openr, lun, z_list, /get_lun ;opens file of images names for reading
readf, lun, z_images ;reads in names of all images in passband
free_lun, lun ;free memory associated with writing

for z=0, n_elements(z_images)-1, 1 do begin ;starts loop over all tiles in list
   fits = strcompress(directory + 'z/' + z_images(z), /remove_all) ;defines the image fits file 
   print, fits                                                     ;prints the name of the image
   image = readfits(fits, HDR)                                     ;reads in the image values and the image header
   x_center = sxpar(HDR,'CRPIX1')                                  ;sets variable with info from header
   y_center = sxpar(HDR,'CRPIX2')                                  ;sets variable with info from header
   ra_center = sxpar(HDR,'CRVAL1')                                 ;sets variable with info from header
   dec_center = sxpar(HDR,'CRVAL2')                                ;sets variable with info from header
   x_max = sxpar(HDR,'NAXIS1')                                     ;sets variable with info from header
   y_max = sxpar(HDR,'NAXIS2')                                     ;sets variable with info from header

   adxy, HDR, clusters.ra_deg, clusters.dec_deg, x_image, y_image ;idl astro routine, uses header to find image coordinates given RA, Dec in [deg]
   location = [[x_image],[y_image]]                 ;this creates a single array with our image coordinates

   in_image = where( (x_image GT 0) AND (x_image LT x_max) AND (y_image GT 0) AND (y_image LT y_max), nin_image )
   print, 'Number of clusters in this image: ', nin_image
   
   for counter_a=0, nin_image-1, 1 do begin
      npixels = angle_arcsec[in_image[counter_a]] / z_pixscale
      if (x_image(in_image[counter_a]) - npixels) LT 0 then cluster_xmin = 0 else cluster_xmin = (x_image(in_image[counter_a]) - npixels)
      if (x_image(in_image[counter_a]) + npixels) GT x_max then cluster_xmax = x_max-1 else cluster_xmax = (x_image(in_image[counter_a]) + npixels)
      if (y_image(in_image[counter_a]) - npixels) LT 0 then cluster_ymin = 0 else cluster_ymin = (y_image(in_image[counter_a]) - npixels)
      if (y_image(in_image[counter_a]) + npixels) GT y_max then cluster_ymax = y_max-1 else cluster_ymax = (y_image(in_image[counter_a]) + npixels)
       
      thumbnail = image[ cluster_xmin:cluster_xmax, cluster_ymin:cluster_ymax ] 
      flux_ave = mean(thumbnail)

      fxaddpar, HDR, 'cluster_id', strcompress(field + '_' + string(id_tag[in_image[counter_a]]), /remove_all), 'Unique cluster id'
      fxaddpar, HDR, 'redshift', clusters(in_image[counter_a]).z, 'This is the clusters redshift'
      fxaddpar, HDR, 'flux_ave', flux_ave, 'This is the average flux over thumbnail'

      image_out = strcompress(image_direct + field + '_' + string(id_tag[in_image[counter_a]]) + '.fits', /remove_all)
      print, image_out
      test_image = file_test(image_out)
      if test_image EQ 0 then mwrfits, thumbnail, image_out, HDR,  /Create else begin
         print, 'Already exists! Testing average flux.'
         existing = readfits(image_out, header)
         existing_flux_ave = sxpar(header, 'flux_ave')
         if flux_ave gt existing_flux_ave then mwrfits, thumbnail, image_out, HDR, /Create else begin
            print, 'Existing thumbnail kept!'
         endelse
      endelse
      print, 'Thumbnail created!' 
      print, ' '
      thumbnail = 0
   end
   image = 0
endfor





;;;This section creates thumbnails for each cluster in the IRAC ch1 band
image_direct = strcompress(directory + 'clusters/ch1_thumbnails/', /remove_all)
test_image_direct = file_test(image_direct, /directory)
if test_image_direct NE 1 then spawn, 'mkdir ' + image_direct ; makes directory if nonexistant 
image_direct = strcompress(directory + 'clusters/ch1_thumbnails/' + 'r_' + string(r_cluster) + 'Mpc/', /remove_all)
test_image_direct = file_test(image_direct, /directory)
if test_image_direct NE 1 then spawn, 'mkdir ' + image_direct ; makes directory if nonexistant 

ch1_images = strarr(file_lines(ch1_list)) ;creates string array with image names
openr, lun, ch1_list, /get_lun ;opens file of images names for reading
readf, lun, ch1_images ;reads in names of all images in passband
free_lun, lun ;free memory associated with writing

for z=0, n_elements(ch1_images)-1, 1 do begin ;starts loop over all tiles in list
   fits = strcompress(directory + 'irac/' + ch1_images(z), /remove_all) ;defines the image fits file 
   print, fits                                                     ;prints the name of the image
   image = readfits(fits, HDR)                                     ;reads in the image values and the image header
   x_center = sxpar(HDR,'CRPIX1')                                  ;sets variable with info from header
   y_center = sxpar(HDR,'CRPIX2')                                  ;sets variable with info from header
   ra_center = sxpar(HDR,'CRVAL1')                                 ;sets variable with info from header
   dec_center = sxpar(HDR,'CRVAL2')                                ;sets variable with info from header
   x_max = sxpar(HDR,'NAXIS1')                                     ;sets variable with info from header
   y_max = sxpar(HDR,'NAXIS2')                                     ;sets variable with info from header

   adxy, HDR, clusters.ra_deg, clusters.dec_deg, x_image, y_image ;idl astro routine, uses header to find image coordinates given RA, Dec in [deg]
   location = [[x_image],[y_image]]                 ;this creates a single array with our image coordinates

   in_image = where( (x_image GT 0) AND (x_image LT x_max) AND (y_image GT 0) AND (y_image LT y_max), nin_image )
   print, 'Number of clusters in this image: ', nin_image
   
   for counter_a=0, nin_image-1, 1 do begin
      npixels = angle_arcsec[in_image[counter_a]] / irac_pixscale
      if (x_image(in_image[counter_a]) - npixels) LT 0 then cluster_xmin = 0 else cluster_xmin = (x_image(in_image[counter_a]) - npixels)
      if (x_image(in_image[counter_a]) + npixels) GT x_max then cluster_xmax = x_max-1 else cluster_xmax = (x_image(in_image[counter_a]) + npixels)
      if (y_image(in_image[counter_a]) - npixels) LT 0 then cluster_ymin = 0 else cluster_ymin = (y_image(in_image[counter_a]) - npixels)
      if (y_image(in_image[counter_a]) + npixels) GT y_max then cluster_ymax = y_max-1 else cluster_ymax = (y_image(in_image[counter_a]) + npixels)
       
      thumbnail = image[ cluster_xmin:cluster_xmax, cluster_ymin:cluster_ymax ] 
      flux_ave = mean(thumbnail)

      fxaddpar, HDR, 'cluster_id', strcompress(field + '_' + string(id_tag[in_image[counter_a]]), /remove_all), 'Unique cluster id'
      fxaddpar, HDR, 'redshift', clusters(in_image[counter_a]).z, 'This is the clusters redshift'
      fxaddpar, HDR, 'flux_ave', flux_ave, 'This is the average flux over thumbnail'

      image_out = strcompress(image_direct + field + '_' + string(id_tag[in_image[counter_a]]) + '.fits', /remove_all)
      print, image_out
      test_image = file_test(image_out)
      if test_image EQ 0 then mwrfits, thumbnail, image_out, HDR,  /Create else begin
         print, 'Already exists! Testing average flux.'
         existing = readfits(image_out, header)
         existing_flux_ave = sxpar(header, 'flux_ave')
         if flux_ave gt existing_flux_ave then mwrfits, thumbnail, image_out, HDR, /Create else begin
            print, 'Existing thumbnail kept!'
         endelse
      endelse
      print, 'Thumbnail created!' 
      print, ' '
      thumbnail = 0
   end
   image = 0
endfor




;;;This section creates thumbnails for each cluster in the IRAC ch2 band
image_direct = strcompress(directory + 'clusters/ch2_thumbnails/', /remove_all)
test_image_direct = file_test(image_direct, /directory)
if test_image_direct NE 1 then spawn, 'mkdir ' + image_direct ; makes directory if nonexistant 
image_direct = strcompress(directory + 'clusters/ch2_thumbnails/' + 'r_' + string(r_cluster) + 'Mpc/', /remove_all)
test_image_direct = file_test(image_direct, /directory)
if test_image_direct NE 1 then spawn, 'mkdir ' + image_direct ; makes directory if nonexistant 

ch2_images = strarr(file_lines(ch2_list)) ;creates string array with image names
openr, lun, ch2_list, /get_lun ;opens file of images names for reading
readf, lun, ch2_images ;reads in names of all images in passband
free_lun, lun ;free memory associated with writing

for z=0, n_elements(ch2_images)-1, 1 do begin ;starts loop over all tiles in list
   fits = strcompress(directory + 'irac/' + ch2_images(z), /remove_all) ;defines the image fits file 
   print, fits                                                     ;prints the name of the image
   image = readfits(fits, HDR)                                     ;reads in the image values and the image header
   x_center = sxpar(HDR,'CRPIX1')                                  ;sets variable with info from header
   y_center = sxpar(HDR,'CRPIX2')                                  ;sets variable with info from header
   ra_center = sxpar(HDR,'CRVAL1')                                 ;sets variable with info from header
   dec_center = sxpar(HDR,'CRVAL2')                                ;sets variable with info from header
   x_max = sxpar(HDR,'NAXIS1')                                     ;sets variable with info from header
   y_max = sxpar(HDR,'NAXIS2')                                     ;sets variable with info from header

   adxy, HDR, clusters.ra_deg, clusters.dec_deg, x_image, y_image ;idl astro routine, uses header to find image coordinates given RA, Dec in [deg]
   location = [[x_image],[y_image]]                 ;this creates a single array with our image coordinates

   in_image = where( (x_image GT 0) AND (x_image LT x_max) AND (y_image GT 0) AND (y_image LT y_max), nin_image )
   print, 'Number of clusters in this image: ', nin_image
   
   for counter_a=0, nin_image-1, 1 do begin
      npixels = angle_arcsec[in_image[counter_a]] / irac_pixscale
      if (x_image(in_image[counter_a]) - npixels) LT 0 then cluster_xmin = 0 else cluster_xmin = (x_image(in_image[counter_a]) - npixels)
      if (x_image(in_image[counter_a]) + npixels) GT x_max then cluster_xmax = x_max-1 else cluster_xmax = (x_image(in_image[counter_a]) + npixels)
      if (y_image(in_image[counter_a]) - npixels) LT 0 then cluster_ymin = 0 else cluster_ymin = (y_image(in_image[counter_a]) - npixels)
      if (y_image(in_image[counter_a]) + npixels) GT y_max then cluster_ymax = y_max-1 else cluster_ymax = (y_image(in_image[counter_a]) + npixels)
       
      thumbnail = image[ cluster_xmin:cluster_xmax, cluster_ymin:cluster_ymax ] 
      flux_ave = mean(thumbnail)

      fxaddpar, HDR, 'cluster_id', strcompress(field + '_' + string(id_tag[in_image[counter_a]]), /remove_all), 'Unique cluster id'
      fxaddpar, HDR, 'redshift', clusters(in_image[counter_a]).z, 'This is the clusters redshift'
      fxaddpar, HDR, 'flux_ave', flux_ave, 'This is the average flux over thumbnail'

      image_out = strcompress(image_direct + field + '_' + string(id_tag[in_image[counter_a]]) + '.fits', /remove_all)
      print, image_out
      test_image = file_test(image_out)
      if test_image EQ 0 then mwrfits, thumbnail, image_out, HDR,  /Create else begin
         print, 'Already exists! Testing average flux.'
         existing = readfits(image_out, header)
         existing_flux_ave = sxpar(header, 'flux_ave')
         if flux_ave gt existing_flux_ave then mwrfits, thumbnail, image_out, HDR, /Create else begin
            print, 'Existing thumbnail kept!'
         endelse
      endelse
      print, 'Thumbnail created!' 
      print, ' '
      thumbnail = 0
   end
   image = 0
endfor





end
