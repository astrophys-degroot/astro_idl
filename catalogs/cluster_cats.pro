function E_z, z_prime 
  common share, omega_l, omega_m, omega_k
  return, (omega_m*(1+z_prime)^3 + omega_k*(1+z_prime)^2 + omega_l)^(-0.5)
end


pro cluster_cats

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Define all values in this section;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

directory = '/Users/andrew/originaldata/elaisn2/'
field = 'en2'
cluster_cat = strcompress(directory + 'clusters/prototype_clusters.fits', /remove_all)
detection_cat = strcompress(directory + 'final_cats/en2_catalog_omega.fits', /remove_all)
z_list = strcompress(directory + 'final_cats/zlist.dat', /remove_all) 
ch1_list = strcompress(directory + 'final_cats/ch1_list.dat', /remove_all)
ch2_list = strcompress(directory + 'final_cats/ch2_list.dat', /remove_all)

common share, omega_l, omega_m, omega_k
omega_l = 0.7
omega_m = 0.3
omega_k = 0.0
H_0 = 70 ;[km/s/Mpc]
r_cluster = 0.5 ;[Mpc]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;This section does the prep work
clusters = mrdfits(cluster_cat, 1) ;this reads in the cluster file
detections = mrdfits(detection_cat, 1) ;this reads in the detection file

cat_direct = strcompress(directory + 'clusters/catalogs/' + 'r_' + string(r_cluster) + 'Mpc/', /remove_all)
test_cat_direct = file_test(cat_direct, /directory)
if test_cat_direct NE 1 then spawn, 'mkdir ' + cat_direct ; makes directory if nonexistant 

cluster_member = intarr(n_elements(detections.RA))




;;;;This main body of the program loops over all clusters
nclusters = n_elements(clusters.z)
for counter = 0, nclusters-1, 1 do begin
   print, 'This is cluster number: ', counter, ' out of ', nclusters
   cluster_out = strcompress(cat_direct + field + '_cluster' + string(counter) + '.fits', /remove_all) ;creates the detection out file
   field_out = strcompress(cat_direct + field + '_field.fits', /remove_all) ;creates the detection out file

;;;This is method 1 of comoving radius calculation
   z_prime = findgen(round (clusters(counter).z * 1001)) / 1000 ;creates a subarray of points for integration
   d_c = qromb('E_z', 0, clusters(counter).z )                  ;integrate the function using subarray of points
   distance = (2.99E5 / H_0) * d_c                   ;calculates the proper distance
   angle_rad = r_cluster / (distance/(1+clusters(counter).z)) ; find the angle in radians corresponding to cluster radius
   angle_arcsec = angle_rad * (648000.0/!pi)       ;converts radians to arc seconds
   angle_arcmin = angle_arcsec / 60.0              ; converts arc seconds to arc minutes
   angle_deg = angle_arcsec / 3600                 ; converts arc seconds to degrees
   print, 'Cluster radius: ', angle_rad, angle_arcsec, angle_arcmin ; prints info
   print,  ' '

;;;This is method 2 of comoving radius calculation
   q_0 = omega_k + 0.5*omega_m - omega_l                                                       ;calculates the deceleration constant
   theta_rad = r_cluster * H_0 * (1+clusters(counter).z) / (2.99E5 * clusters(counter).z * (1 - 0.5*(1+q_0)*clusters(counter).z) ) ;calculates angle in radians
   theta_arcsec = theta_rad * (648000.0/!pi)                                                      ;converts radians to arc seconds
   theta_arcmin = theta_arcsec / 60.0                                                             ;converts arc seconds to arc minutes



;;;This section creates an individual catalog of sources contained
;;;within each cluster's radius
   print, 'Clusters center', clusters(counter).ra_deg, clusters(counter).dec_deg ;prints info
   print, ' '
   close_match_radec, clusters(counter).ra_deg, clusters(counter).dec_deg, detections.ra, detections.dec, cluster_match, detection_match, angle_deg, 25000 ;does the matching 
   window, 0                                                                                                                                               ;declares a window for plotting
   plot, 3600.* (clusters(counter).ra_deg - detections(detection_match).RA), 3600.*(clusters(counter).dec_deg - detections(detection_match).dec), PSYM=1   ;makes the plot
   cluster_member(detection_match) = 1

   count = n_elements(detection_match)
   detection={ID:detections(0).ID, RA:detections(0).RA, DEC:detections(0).DEC, match_flags:detections(0).match_flags, $ 
              z_cover:detections(0).z_cover, ch1_cover:detections(0).ch1_cover, ch2_cover:detections(0).ch2_cover, $
              near_bright_star: detections(0).near_bright_star, $
              z_mag_best:float(detections(0).z_mag_best), z_magerr_best:float(detections(0).z_magerr_best), $
              z_mag_aper1_76:float(detections(0).z_mag_aper1_76), z_mag_aper3_66:float(detections(0).z_mag_aper3_66), $
              z_mag_aper6_10:float(detections(0).z_mag_aper6_10), z_magerr_aper1_76:float(detections(0).z_magerr_aper1_76), $
              z_magerr_aper3_66:float(detections(0).z_magerr_aper3_66), z_magerr_aper6_10:float(detections(0).z_magerr_aper6_10), $
              z_mag_auto:float(detections(0).z_mag_auto), z_magerr_auto:float(detections(0).z_magerr_auto), $
              z_class_star:float(detections(0).z_class_star), z_flags:float(detections(0).z_flags), $
              ch1_mag_best:float(detections(0).ch1_mag_best), ch1_magerr_best:float(detections(0).ch1_magerr_best), $
              ch1_best_aper:float(detections(0).ch1_best_aper), ch1_S2N:float(detections(0).ch1_s2n), $
              ch1_magcor_aper3_0:float(detections(0).ch1_magcor_aper3_0), ch1_magcor_aper3_6:float(detections(0).ch1_magcor_aper3_6), $ 
              ch1_magcor_aper6_0:float(detections(0).ch1_magcor_aper6_0), ch1_magcor_aper14_85:float(detections(0).ch1_magcor_aper14_85), $
              ch1_magcor_aper24_4:float(detections(0).ch1_magcor_aper24_4), ch1_magcorerr_aper3_0:float(detections(0).ch1_magcorerr_aper3_0), $
              ch1_magcorerr_aper3_6:float(detections(0).ch1_magcorerr_aper3_6), ch1_magcorerr_aper6_0:float(detections(0).ch1_magcorerr_aper6_0), $
              ch1_magcorerr_aper14_85:float(detections(0).ch1_magcorerr_aper14_85), ch1_magcorerr_aper24_4:float(detections(0).ch1_magcorerr_aper24_4), $
              ch1_area:float(detections(0).ch1_area), ch1_flags:float(detections(0).ch1_flags), ch1_class_star:float(detections(0).ch1_class_star), $
              ch1_coverage:float(detections(0).ch1_coverage), $
              ch2_mag_best:float(detections(0).ch2_mag_best), ch2_magerr_best:float(detections(0).ch2_magerr_best), $
              ch2_best_aper:float(detections(0).ch2_best_aper), ch2_S2N:float(detections(0).ch2_s2n), $
              ch2_magcor_aper3_0:float(detections(0).ch2_magcor_aper3_0), ch2_magcor_aper3_6:float(detections(0).ch2_magcor_aper3_6), $ 
              ch2_magcor_aper6_0:float(detections(0).ch2_magcor_aper6_0), ch2_magcor_aper14_85:float(detections(0).ch2_magcor_aper14_85), $
              ch2_magcor_aper24_4:float(detections(0).ch2_magcor_aper24_4), ch2_magcorerr_aper3_0:float(detections(0).ch2_magcorerr_aper3_0), $
              ch2_magcorerr_aper3_6:float(detections(0).ch2_magcorerr_aper3_6), ch2_magcorerr_aper6_0:float(detections(0).ch2_magcorerr_aper6_0), $
              ch2_magcorerr_aper14_85:float(detections(0).ch2_magcorerr_aper14_85), ch2_magcorerr_aper24_4:float(detections(0).ch2_magcorerr_aper24_4), $
              ch2_area:float(detections(0).ch2_area), ch2_flags:float(detections(0).ch2_flags), ch2_class_star:float(detections(0).ch2_class_star), $
              ch2_coverage:float(detections(0).ch2_coverage), $
              ch3_mag_best:float(detections(0).ch3_mag_best), ch3_magerr_best:float(detections(0).ch3_magerr_best), $
              ch3_best_aper:float(detections(0).ch3_best_aper), ch3_S2N:float(detections(0).ch3_s2n), $
              ch3_magcor_aper3_0:float(detections(0).ch3_magcor_aper3_0), ch3_magcor_aper3_6:float(detections(0).ch3_magcor_aper3_6), $ 
              ch3_magcor_aper6_0:float(detections(0).ch3_magcor_aper6_0), ch3_magcor_aper14_85:float(detections(0).ch3_magcor_aper14_85), $
              ch3_magcor_aper24_4:float(detections(0).ch3_magcor_aper24_4), ch3_magcorerr_aper3_0:float(detections(0).ch3_magcorerr_aper3_0), $
              ch3_magcorerr_aper3_6:float(detections(0).ch3_magcorerr_aper3_6), ch3_magcorerr_aper6_0:float(detections(0).ch3_magcorerr_aper6_0), $
              ch3_magcorerr_aper14_85:float(detections(0).ch3_magcorerr_aper14_85), ch3_magcorerr_aper24_4:float(detections(0).ch3_magcorerr_aper24_4), $
              ch3_area:float(detections(0).ch3_area), ch3_flags:float(detections(0).ch3_flags), ch3_class_star:float(detections(0).ch3_class_star), $
              ch3_coverage:float(detections(0).ch3_coverage), $
              ch4_mag_best:float(detections(0).ch4_mag_best), ch4_magerr_best:float(detections(0).ch4_magerr_best), $
              ch4_best_aper:float(detections(0).ch4_best_aper), ch4_S2N:float(detections(0).ch4_s2n), $
              ch4_magcor_aper3_0:float(detections(0).ch4_magcor_aper3_0), ch4_magcor_aper3_6:float(detections(0).ch4_magcor_aper3_6), $ 
              ch4_magcor_aper6_0:float(detections(0).ch4_magcor_aper6_0), ch4_magcor_aper14_85:float(detections(0).ch4_magcor_aper14_85), $
              ch4_magcor_aper24_4:float(detections(0).ch4_magcor_aper24_4), ch4_magcorerr_aper3_0:float(detections(0).ch4_magcorerr_aper3_0), $
              ch4_magcorerr_aper3_6:float(detections(0).ch4_magcorerr_aper3_6), ch4_magcorerr_aper6_0:float(detections(0).ch4_magcorerr_aper6_0), $
              ch4_magcorerr_aper14_85:float(detections(0).ch4_magcorerr_aper14_85), ch4_magcorerr_aper24_4:float(detections(0).ch4_magcorerr_aper24_4), $
              ch4_area:float(detections(0).ch4_area), ch4_flags:float(detections(0).ch4_flags), ch4_class_star:float(detections(0).ch4_class_star), $
              ch4_coverage:float(detections(0).ch4_coverage) }
   matched = replicate(detection,count)


   for counter_b=0, count-1, 1 do begin
      matched(counter_b)={ID:detections(detection_match(counter_b)).ID, RA:detections(detection_match(counter_b)).RA, $
                          DEC:detections(detection_match(counter_b)).DEC, match_flags:detections(detection_match(counter_b)).match_flags, $ 
                        z_cover:detections(detection_match(counter_b)).z_cover, ch1_cover:detections(detection_match(counter_b)).ch1_cover, ch2_cover:detections(detection_match(counter_b)).ch2_cover, $
                        near_bright_star: detections(detection_match(counter_b)).near_bright_star, $
                        z_mag_best:float(detections(detection_match(counter_b)).z_mag_best), z_magerr_best:float(detections(detection_match(counter_b)).z_magerr_best), $
                        z_mag_aper1_76:float(detections(detection_match(counter_b)).z_mag_aper1_76), z_mag_aper3_66:float(detections(detection_match(counter_b)).z_mag_aper3_66), $
                        z_mag_aper6_10:float(detections(detection_match(counter_b)).z_mag_aper6_10), z_magerr_aper1_76:float(detections(detection_match(counter_b)).z_magerr_aper1_76), $
                        z_magerr_aper3_66:float(detections(detection_match(counter_b)).z_magerr_aper3_66), z_magerr_aper6_10:float(detections(detection_match(counter_b)).z_magerr_aper6_10), $
                        z_mag_auto:float(detections(detection_match(counter_b)).z_mag_auto), z_magerr_auto:float(detections(detection_match(counter_b)).z_magerr_auto), $
                        z_class_star:float(detections(detection_match(counter_b)).z_class_star), z_flags:float(detections(detection_match(counter_b)).z_flags), $
                        ch1_mag_best:float(detections(detection_match(counter_b)).ch1_mag_best), ch1_magerr_best:float(detections(detection_match(counter_b)).ch1_magerr_best), $
                        ch1_best_aper:float(detections(detection_match(counter_b)).ch1_best_aper), ch1_S2N:float(detections(detection_match(counter_b)).ch1_s2n), $
                        ch1_magcor_aper3_0:float(detections(detection_match(counter_b)).ch1_magcor_aper3_0), ch1_magcor_aper3_6:float(detections(detection_match(counter_b)).ch1_magcor_aper3_6), $ 
                        ch1_magcor_aper6_0:float(detections(detection_match(counter_b)).ch1_magcor_aper6_0), ch1_magcor_aper14_85:float(detections(detection_match(counter_b)).ch1_magcor_aper14_85), $
                        ch1_magcor_aper24_4:float(detections(detection_match(counter_b)).ch1_magcor_aper24_4), ch1_magcorerr_aper3_0:float(detections(detection_match(counter_b)).ch1_magcorerr_aper3_0), $
                        ch1_magcorerr_aper3_6:float(detections(detection_match(counter_b)).ch1_magcorerr_aper3_6), ch1_magcorerr_aper6_0:float(detections(detection_match(counter_b)).ch1_magcorerr_aper6_0), $
                        ch1_magcorerr_aper14_85:float(detections(detection_match(counter_b)).ch1_magcorerr_aper14_85), ch1_magcorerr_aper24_4:float(detections(detection_match(counter_b)).ch1_magcorerr_aper24_4), $
                        ch1_area:float(detections(detection_match(counter_b)).ch1_area), ch1_flags:float(detections(detection_match(counter_b)).ch1_flags), $
                          ch1_class_star:float(detections(detection_match(counter_b)).ch1_class_star), $
                        ch1_coverage:float(detections(detection_match(counter_b)).ch1_coverage), $
                        ch2_mag_best:float(detections(detection_match(counter_b)).ch2_mag_best), ch2_magerr_best:float(detections(detection_match(counter_b)).ch2_magerr_best), $
                        ch2_best_aper:float(detections(detection_match(counter_b)).ch2_best_aper), ch2_S2N:float(detections(detection_match(counter_b)).ch2_s2n), $
                        ch2_magcor_aper3_0:float(detections(detection_match(counter_b)).ch2_magcor_aper3_0), ch2_magcor_aper3_6:float(detections(detection_match(counter_b)).ch2_magcor_aper3_6), $ 
                        ch2_magcor_aper6_0:float(detections(detection_match(counter_b)).ch2_magcor_aper6_0), ch2_magcor_aper14_85:float(detections(detection_match(counter_b)).ch2_magcor_aper14_85), $
                        ch2_magcor_aper24_4:float(detections(detection_match(counter_b)).ch2_magcor_aper24_4), ch2_magcorerr_aper3_0:float(detections(detection_match(counter_b)).ch2_magcorerr_aper3_0), $
                        ch2_magcorerr_aper3_6:float(detections(detection_match(counter_b)).ch2_magcorerr_aper3_6), ch2_magcorerr_aper6_0:float(detections(detection_match(counter_b)).ch2_magcorerr_aper6_0), $
                        ch2_magcorerr_aper14_85:float(detections(detection_match(counter_b)).ch2_magcorerr_aper14_85), ch2_magcorerr_aper24_4:float(detections(detection_match(counter_b)).ch2_magcorerr_aper24_4), $
                        ch2_area:float(detections(detection_match(counter_b)).ch2_area), ch2_flags:float(detections(detection_match(counter_b)).ch2_flags), $
                          ch2_class_star:float(detections(detection_match(counter_b)).ch2_class_star), $
                        ch2_coverage:float(detections(detection_match(counter_b)).ch2_coverage), $
                        ch3_mag_best:float(detections(detection_match(counter_b)).ch3_mag_best), ch3_magerr_best:float(detections(detection_match(counter_b)).ch3_magerr_best), $
                        ch3_best_aper:float(detections(detection_match(counter_b)).ch3_best_aper), ch3_S2N:float(detections(detection_match(counter_b)).ch3_s2n), $
                        ch3_magcor_aper3_0:float(detections(detection_match(counter_b)).ch3_magcor_aper3_0), ch3_magcor_aper3_6:float(detections(detection_match(counter_b)).ch3_magcor_aper3_6), $ 
                        ch3_magcor_aper6_0:float(detections(detection_match(counter_b)).ch3_magcor_aper6_0), ch3_magcor_aper14_85:float(detections(detection_match(counter_b)).ch3_magcor_aper14_85), $
                        ch3_magcor_aper24_4:float(detections(detection_match(counter_b)).ch3_magcor_aper24_4), ch3_magcorerr_aper3_0:float(detections(detection_match(counter_b)).ch3_magcorerr_aper3_0), $
                        ch3_magcorerr_aper3_6:float(detections(detection_match(counter_b)).ch3_magcorerr_aper3_6), ch3_magcorerr_aper6_0:float(detections(detection_match(counter_b)).ch3_magcorerr_aper6_0), $
                        ch3_magcorerr_aper14_85:float(detections(detection_match(counter_b)).ch3_magcorerr_aper14_85), ch3_magcorerr_aper24_4:float(detections(detection_match(counter_b)).ch3_magcorerr_aper24_4), $
                        ch3_area:float(detections(detection_match(counter_b)).ch3_area), ch3_flags:float(detections(detection_match(counter_b)).ch3_flags), $
                          ch3_class_star:float(detections(detection_match(counter_b)).ch3_class_star), $
                        ch3_coverage:float(detections(detection_match(counter_b)).ch3_coverage), $
                        ch4_mag_best:float(detections(detection_match(counter_b)).ch4_mag_best), ch4_magerr_best:float(detections(detection_match(counter_b)).ch4_magerr_best), $
                        ch4_best_aper:float(detections(detection_match(counter_b)).ch4_best_aper), ch4_S2N:float(detections(detection_match(counter_b)).ch4_s2n), $
                        ch4_magcor_aper3_0:float(detections(detection_match(counter_b)).ch4_magcor_aper3_0), ch4_magcor_aper3_6:float(detections(detection_match(counter_b)).ch4_magcor_aper3_6), $ 
                        ch4_magcor_aper6_0:float(detections(detection_match(counter_b)).ch4_magcor_aper6_0), ch4_magcor_aper14_85:float(detections(detection_match(counter_b)).ch4_magcor_aper14_85), $
                        ch4_magcor_aper24_4:float(detections(detection_match(counter_b)).ch4_magcor_aper24_4), ch4_magcorerr_aper3_0:float(detections(detection_match(counter_b)).ch4_magcorerr_aper3_0), $
                        ch4_magcorerr_aper3_6:float(detections(detection_match(counter_b)).ch4_magcorerr_aper3_6), ch4_magcorerr_aper6_0:float(detections(detection_match(counter_b)).ch4_magcorerr_aper6_0), $
                        ch4_magcorerr_aper14_85:float(detections(detection_match(counter_b)).ch4_magcorerr_aper14_85), ch4_magcorerr_aper24_4:float(detections(detection_match(counter_b)).ch4_magcorerr_aper24_4), $
                        ch4_area:float(detections(detection_match(counter_b)).ch4_area), ch4_flags:float(detections(detection_match(counter_b)).ch4_flags), $
                          ch4_class_star:float(detections(detection_match(counter_b)).ch4_class_star), $
                        ch4_coverage:float(detections(detection_match(counter_b)).ch4_coverage) }
   endfor
   mwrfits, matched, cluster_out, header, /Create
   print, 'A cluster catalog is written!'
   print,  ' '

endfor


;;;;This writes out all catalog members which were not found to be part of any cluster
   field_detect = where(cluster_member EQ 0, nfield)
   field_cat = replicate(detection,nfield)
   for counter_c=0ULL, nfield-1, 1 do begin
      field_cat(counter_c)={ID:detections(field_detect(counter_c)).ID, RA:detections(field_detect(counter_c)).RA, DEC:detections(field_detect(counter_c)).DEC, match_flags:detections(field_detect(counter_c)).match_flags, $ 
                        z_cover:detections(field_detect(counter_c)).z_cover, ch1_cover:detections(field_detect(counter_c)).ch1_cover, ch2_cover:detections(field_detect(counter_c)).ch2_cover, $
                        near_bright_star: detections(field_detect(counter_c)).near_bright_star, $
                        z_mag_best:float(detections(field_detect(counter_c)).z_mag_best), z_magerr_best:float(detections(field_detect(counter_c)).z_magerr_best), $
                        z_mag_aper1_76:float(detections(field_detect(counter_c)).z_mag_aper1_76), z_mag_aper3_66:float(detections(field_detect(counter_c)).z_mag_aper3_66), $
                        z_mag_aper6_10:float(detections(field_detect(counter_c)).z_mag_aper6_10), z_magerr_aper1_76:float(detections(field_detect(counter_c)).z_magerr_aper1_76), $
                        z_magerr_aper3_66:float(detections(field_detect(counter_c)).z_magerr_aper3_66), z_magerr_aper6_10:float(detections(field_detect(counter_c)).z_magerr_aper6_10), $
                        z_mag_auto:float(detections(field_detect(counter_c)).z_mag_auto), z_magerr_auto:float(detections(field_detect(counter_c)).z_magerr_auto), $
                        z_class_star:float(detections(field_detect(counter_c)).z_class_star), z_flags:float(detections(field_detect(counter_c)).z_flags), $
                        ch1_mag_best:float(detections(field_detect(counter_c)).ch1_mag_best), ch1_magerr_best:float(detections(field_detect(counter_c)).ch1_magerr_best), $
                        ch1_best_aper:float(detections(field_detect(counter_c)).ch1_best_aper), ch1_S2N:float(detections(field_detect(counter_c)).ch1_s2n), $
                        ch1_magcor_aper3_0:float(detections(field_detect(counter_c)).ch1_magcor_aper3_0), ch1_magcor_aper3_6:float(detections(field_detect(counter_c)).ch1_magcor_aper3_6), $ 
                        ch1_magcor_aper6_0:float(detections(field_detect(counter_c)).ch1_magcor_aper6_0), ch1_magcor_aper14_85:float(detections(field_detect(counter_c)).ch1_magcor_aper14_85), $
                        ch1_magcor_aper24_4:float(detections(field_detect(counter_c)).ch1_magcor_aper24_4), ch1_magcorerr_aper3_0:float(detections(field_detect(counter_c)).ch1_magcorerr_aper3_0), $
                        ch1_magcorerr_aper3_6:float(detections(field_detect(counter_c)).ch1_magcorerr_aper3_6), ch1_magcorerr_aper6_0:float(detections(field_detect(counter_c)).ch1_magcorerr_aper6_0), $
                        ch1_magcorerr_aper14_85:float(detections(field_detect(counter_c)).ch1_magcorerr_aper14_85), ch1_magcorerr_aper24_4:float(detections(field_detect(counter_c)).ch1_magcorerr_aper24_4), $
                        ch1_area:float(detections(field_detect(counter_c)).ch1_area), ch1_flags:float(detections(field_detect(counter_c)).ch1_flags), ch1_class_star:float(detections(field_detect(counter_c)).ch1_class_star), $
                        ch1_coverage:float(detections(field_detect(counter_c)).ch1_coverage), $
                        ch2_mag_best:float(detections(field_detect(counter_c)).ch2_mag_best), ch2_magerr_best:float(detections(field_detect(counter_c)).ch2_magerr_best), $
                        ch2_best_aper:float(detections(field_detect(counter_c)).ch2_best_aper), ch2_S2N:float(detections(field_detect(counter_c)).ch2_s2n), $
                        ch2_magcor_aper3_0:float(detections(field_detect(counter_c)).ch2_magcor_aper3_0), ch2_magcor_aper3_6:float(detections(field_detect(counter_c)).ch2_magcor_aper3_6), $ 
                        ch2_magcor_aper6_0:float(detections(field_detect(counter_c)).ch2_magcor_aper6_0), ch2_magcor_aper14_85:float(detections(field_detect(counter_c)).ch2_magcor_aper14_85), $
                        ch2_magcor_aper24_4:float(detections(field_detect(counter_c)).ch2_magcor_aper24_4), ch2_magcorerr_aper3_0:float(detections(field_detect(counter_c)).ch2_magcorerr_aper3_0), $
                        ch2_magcorerr_aper3_6:float(detections(field_detect(counter_c)).ch2_magcorerr_aper3_6), ch2_magcorerr_aper6_0:float(detections(field_detect(counter_c)).ch2_magcorerr_aper6_0), $
                        ch2_magcorerr_aper14_85:float(detections(field_detect(counter_c)).ch2_magcorerr_aper14_85), ch2_magcorerr_aper24_4:float(detections(field_detect(counter_c)).ch2_magcorerr_aper24_4), $
                        ch2_area:float(detections(field_detect(counter_c)).ch2_area), ch2_flags:float(detections(field_detect(counter_c)).ch2_flags), ch2_class_star:float(detections(field_detect(counter_c)).ch2_class_star), $
                        ch2_coverage:float(detections(field_detect(counter_c)).ch2_coverage), $
                        ch3_mag_best:float(detections(field_detect(counter_c)).ch3_mag_best), ch3_magerr_best:float(detections(field_detect(counter_c)).ch3_magerr_best), $
                        ch3_best_aper:float(detections(field_detect(counter_c)).ch3_best_aper), ch3_S2N:float(detections(field_detect(counter_c)).ch3_s2n), $
                        ch3_magcor_aper3_0:float(detections(field_detect(counter_c)).ch3_magcor_aper3_0), ch3_magcor_aper3_6:float(detections(field_detect(counter_c)).ch3_magcor_aper3_6), $ 
                        ch3_magcor_aper6_0:float(detections(field_detect(counter_c)).ch3_magcor_aper6_0), ch3_magcor_aper14_85:float(detections(field_detect(counter_c)).ch3_magcor_aper14_85), $
                        ch3_magcor_aper24_4:float(detections(field_detect(counter_c)).ch3_magcor_aper24_4), ch3_magcorerr_aper3_0:float(detections(field_detect(counter_c)).ch3_magcorerr_aper3_0), $
                        ch3_magcorerr_aper3_6:float(detections(field_detect(counter_c)).ch3_magcorerr_aper3_6), ch3_magcorerr_aper6_0:float(detections(field_detect(counter_c)).ch3_magcorerr_aper6_0), $
                        ch3_magcorerr_aper14_85:float(detections(field_detect(counter_c)).ch3_magcorerr_aper14_85), ch3_magcorerr_aper24_4:float(detections(field_detect(counter_c)).ch3_magcorerr_aper24_4), $
                        ch3_area:float(detections(field_detect(counter_c)).ch3_area), ch3_flags:float(detections(field_detect(counter_c)).ch3_flags), ch3_class_star:float(detections(field_detect(counter_c)).ch3_class_star), $
                        ch3_coverage:float(detections(field_detect(counter_c)).ch3_coverage), $
                        ch4_mag_best:float(detections(field_detect(counter_c)).ch4_mag_best), ch4_magerr_best:float(detections(field_detect(counter_c)).ch4_magerr_best), $
                        ch4_best_aper:float(detections(field_detect(counter_c)).ch4_best_aper), ch4_S2N:float(detections(field_detect(counter_c)).ch4_s2n), $
                        ch4_magcor_aper3_0:float(detections(field_detect(counter_c)).ch4_magcor_aper3_0), ch4_magcor_aper3_6:float(detections(field_detect(counter_c)).ch4_magcor_aper3_6), $ 
                        ch4_magcor_aper6_0:float(detections(field_detect(counter_c)).ch4_magcor_aper6_0), ch4_magcor_aper14_85:float(detections(field_detect(counter_c)).ch4_magcor_aper14_85), $
                        ch4_magcor_aper24_4:float(detections(field_detect(counter_c)).ch4_magcor_aper24_4), ch4_magcorerr_aper3_0:float(detections(field_detect(counter_c)).ch4_magcorerr_aper3_0), $
                        ch4_magcorerr_aper3_6:float(detections(field_detect(counter_c)).ch4_magcorerr_aper3_6), ch4_magcorerr_aper6_0:float(detections(field_detect(counter_c)).ch4_magcorerr_aper6_0), $
                        ch4_magcorerr_aper14_85:float(detections(field_detect(counter_c)).ch4_magcorerr_aper14_85), ch4_magcorerr_aper24_4:float(detections(field_detect(counter_c)).ch4_magcorerr_aper24_4), $
                        ch4_area:float(detections(field_detect(counter_c)).ch4_area), ch4_flags:float(detections(field_detect(counter_c)).ch4_flags), ch4_class_star:float(detections(field_detect(counter_c)).ch4_class_star), $
                        ch4_coverage:float(detections(field_detect(counter_c)).ch4_coverage) }
   endfor
   MWRFITS, field_cat, field_out, header, /Create
   print, 'Field catalog written!'


end



