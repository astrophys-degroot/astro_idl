pro background


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Define all values in this section;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

directory = '/Users/andrew/originaldata/elaisn2/'
field = 'en2'
cluster_cat = strcompress(directory + 'final_cats/en2_catalog_omega.fits', /remove_all)
region_file = strcompress(directory + 'z/contours/all_wcs_color.reg', /remove_all)
region_headersize = 4
cluster_out = strcompress(directory + 'clusters/en2_field_v3.1.fits', /remove_all)
grid_region = strcompress(directory + 'clusters/grid_region.reg', /remove_all)
cluster_list = strcompress(directory + 'clusters/prototype_clusters.cat', /remove_all)

;z_list = strcompress(directory + 'final_cats/zlist.dat', /remove_all) 
;ch1_list = strcompress(directory + 'final_cats/ch1_list.dat', /remove_all)
;ch2_list = strcompress(directory + 'final_cats/ch2_list.dat', /remove_all)

band = 'zband'                  ; should be zband or irac
r_aperture = 5.0                ; [arcsec]
cluster_radius = 75.0           ; [arcsec]
z_pixscale = 0.185              ; [arcsec/pixel]
irac_pixscale = 0.60            ; [arcsec/pixel]

reg_goodcolor = 'red'           ; color of good regions
reg_badcolor = 'green'          ; color of bad regions
edge_buffer = 12.0              ; [arcsec]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;This section reads in the catalog, gathers basic info 
print, cluster_cat
catalog = mrdfits(cluster_cat, 1) 
;help, catalog, /struc
ra_mean = mean(catalog.ra)
ra_min = min(catalog.ra)
ra_max = max(catalog.ra)
dec_mean = mean(catalog.dec)
dec_min = min(catalog.dec)
dec_max = max(catalog.dec)
print, 'Mean RA of field: ', ra_mean
print, 'Mean Dec of field: ', dec_mean
window, 0
plot, catalog.ra, catalog.dec, PSYM=3, $
      xrange = [min(catalog.ra-0.5),max(catalog.ra+0.5)], $
      yrange = [min(catalog.dec-0.5),max(catalog.dec+0.5)]


;;;;This section creates our grid of test points
x_num = ((ra_max-ra_min) + 0.2) * (3600 / r_aperture) / 2
y_num = ((dec_max-dec_min) + 0.2) * (3600 / r_aperture) / 2 
print, 'Grid size will be: ', x_num, ' x ', y_num
point = {x:double(0.0), y:double(0.0), good:1}
;help, point, /struc
;print, point
the_grid = replicate(point, x_num, y_num)
;help, the_grid
x_points = (the_grid[*,0].x + indgen(x_num)) * 2*(r_aperture/3600) + (ra_min-0.1)
y_points = (the_grid[0,*].y + indgen(y_num)) * 2*(r_aperture/3600) + (dec_min-0.1)

for counter_a=0, y_num-1, 1 do begin
   if counter_a mod 2 eq 0 then the_grid[*,counter_a].x = x_points
   if counter_a mod 2 eq 1 then the_grid[*,counter_a].x = x_points + (r_aperture/3600)
endfor
for counter_a=0, x_num-1, 1 do begin
  the_grid[counter_a,*].y = y_points
endfor

window, 1
plot, the_grid.x, the_grid.y, PSYM=3, $
      xrange = [min(catalog.ra-0.5),max(catalog.ra+0.5)], $
      yrange = [min(catalog.dec-0.5),max(catalog.dec+0.5)]


;;;;This section tests our grid points to see which ones to actually
;;;;measure the background with and which to remove

readline = 'initialized'                                                          ; initializes the readline array
region_number = intarr(x_num, y_num)                                              ; sets up an array for polygons in .reg file
multi_region = intarr(x_num, y_num)                                               ; creates an array to count number of polygons point is in
region_header = strarr(region_headersize)                                         ; creates array for .reg file header
n_regions = file_lines(region_file)-region_headersize                             ; finds the number of lines in the polygon region file
openr, lun, region_file, /get_lun                                                 ; opens .reg file for reading
readf, lun, region_header                                                         ; read .reg file's header in header array
for counter_a = 0, n_regions-1, 1 do begin                                        ; sets up a loop counter to go over all lines in the polygon file
   if counter_a mod 10 eq 0 then print, counter_a, ' / ', n_regions               ; status update
   readf, lun, readline                                                           ; reads the string into the variable readline
   indices = strsplit(readline , ','+'('+')'+'"'+'=', COUNT=num_commas, /EXTRACT) ; find the location in the string reader of all ',' character
   print, 'X image coor, Y image coor: ', indices[1] , ' ', indices[2]            ; prints info
   ;print, 'X image coor, Y image coor: ', indices[*]                             ; prints info
   print, ' '                                                                     ; prints spacer



   if indices[0] eq 'polygon' then begin                                                                                  ; tests if region file shape is a polygon
      print, 'This region is a polygon'                                                                                   ; prints info
      print, 'Region color: ', indices[num_commas-1]                                                                      ; print color to see if region is good or bad
      winding_number = intarr(x_num, y_num)                                                                               ; creates array to test each object in region file
      if indices[num_commas-1] eq reg_goodcolor then vertices = intarr(num_commas) else vertices = intarr(num_commas + 2) ; creates arrays to be populated with data for each vertex
      if indices[num_commas-1] eq reg_goodcolor then vertices = double([indices[1:(num_commas-3)], indices[1:2]]) $       ;    
      else vertices = double([indices[1:(num_commas-1)], indices[1:2]])                                                   ; converts the strings to double precision numbers and removes 'polygon' entry
      ;print, vertices                                                                                                    ; prints info
      for counter_b=0L, n_elements(vertices)-3, 2 do begin                                                                ; loops over the number of vertices in a polygon excluding the last entry which is the first entry again
         ;print, vertices[counter_b], ' ', vertices[counter_b+1], ' ', vertices[counter_b+2], ' ', vertices[counter_b+3]  ; prints vertice's coordinates
         y_up = where(the_grid.y GE vertices[counter_b+1], county_up, COMPLEMENT=y_down, NCOMPLEMENT=county_down )        ; finds the test points that are above or below vertice in y direction
         ;help, y_up                                                                                                      ; prints info
         ;print, y_up[0:5]                                                                                                ; 
         if county_up ne 0 then begin                                                                                     ; tests if any points are above vertice
            left = where( (the_grid[y_up].y LT vertices[counter_b+3]) AND $
                          (((vertices[counter_b+2]-vertices[counter_b])*(the_grid[y_up].y-vertices[counter_b+1])) - $
                           ((the_grid[y_up].x-vertices[counter_b])*(vertices[counter_b+3]-vertices[counter_b+1]))) GT 0.00, count_left ) ; check if points are left of vertice
            if count_left ne 0 then winding_number[y_up[left]] = winding_number[y_up[left]] + 1                                          ; increase winding number for all points to the left of vertice
         endif                                                                                                                           ; end if statement over if points are above vertice
         if county_down ne 0 then begin                                                                                                  ; tests if points are below the vertice 
            right = where( (the_grid[y_down].y GE vertices[counter_b+3]) AND $ 
                           ((vertices[counter_b+2]-vertices[counter_b])*(the_grid[y_down].y-vertices[counter_b+1]) - $
                            ((the_grid[y_down].x-vertices[counter_b])*(vertices[counter_b+3]-vertices[counter_b+1]))) LT 0.0, count_right ) ; checks if points are right of vertice
            if count_right ne 0 then winding_number[y_down[right]] = winding_number[y_down[right]] - 1                                      ; decreases winding number for all points to right of vertice
         endif                                                                                                                              ; end if statement over if points are below vertice
      endfor                                                                                                                                ; end loop over all vertices in polygon
      if indices[num_commas-1] eq 'red' then begin                                                                                          ; begins case for good region
         inside_polygon = where(winding_number NE 0, singlepolygon)                                                                         ; finds the array locations of points inside the polygon
         if singlepolygon ne 0 then region_number[inside_polygon] = 99                                                                      ; sets those locations' identifiers that are inside to nominal value
         print, 'Number of detections in this polygon: ', singlepolygon                                                                     ; prints info
      endif else begin                                                                                                                      ; ends if statement for good regions
         inside_polygon = where(winding_number NE 0, singlepolygon)                                                                         ; finds the array locations of points inside the polygon
         if singlepolygon ne 0 then multi_region[inside_polygon] = multi_region[inside_polygon] + 1                                         ; add 1 to multi polygon for not good areas
         print, 'Number of detections in this polygon: ', singlepolygon                                                                     ; prints info
      endelse                                                                                                                               ; ends else statement for not good areas
   endif                                                                                                                                    ; end if statement over whether the region file shape is a polygon



   if (indices[0] eq 'polygon') AND (indices[num_commas-1] eq 'red') then begin                                           ; tests if region file shape is a polygon
      print, 'This region is an edge defining polygon'                                                                    ; prints info
      print, 'Region color: ', indices[num_commas-1]                                                                      ; print color to see if region is good or bad
      winding_number = intarr(x_num, y_num)                                                                               ; creates array to test each object in region file
      vertices = intarr(num_commas)                                                                                       ; creates arrays to be populated with data for each vertex
      vertices = double([indices[1:(num_commas-3)], indices[1:2]])                                                        ; converts the strings to double precision numbers and removes 'polygon' entry
      ;print, vertices                                                                                                    ; prints info
      for counter_b=0L, n_elements(vertices)-3, 2 do begin                                                                ; loops over the number of vertices in a polygon excluding the last entry which is the first entry again
         closest_param = ((the_grid[*].x-vertices[counter_b])*(vertices[counter_b+2]-vertices[counter_b]) + (the_grid[*].y-vertices[counter_b+1])*(vertices[counter_b+3]-vertices[counter_b+1])) $
                         / ((vertices[counter_b+2]-vertices[counter_b])^2 + (vertices[counter_b+3]-vertices[counter_b+1])^2) ; calculates parameter of closest point of line seg to grid point
         ;print, min(closest_param)
         ;print, max(closest_param)
         ;print, mean(closest_param)
         condition = where(closest_param GT 0.0 AND closest_param LT 1.0, ncondition)                                        ; parameter must meet this conditions
         if ncondition ne 0 then begin                                                                                       ; test if any points are valid
            closest_point_x = vertices[counter_b] + closest_param[condition]*(vertices[counter_b+2]-vertices[counter_b])     ; finds x coor of closest point
            closest_point_y = vertices[counter_b+1] + closest_param[condition]*(vertices[counter_b+3]-vertices[counter_b+1]) ; finds y coor of closest point
            edgy = where( sqrt((the_grid[condition].y - closest_point_y[*])^2 + ((the_grid[condition].x - closest_point_x[*])*cos(the_grid[condition].y*(!pi/180.00)))^2) $
                           LE (edge_buffer/3600.0), nedgy)               ; find any test point inside circle
            ;print, 'Number of detections inside of edge buffer: ', nedgy ; prints info
            if nedgy ne 0 then the_grid[condition[edgy]].good = 0        ; turns of grid points too close to edge
         endif                                                           ; ends if over valid points
      endfor                                                             ; ends loop over all polygon vertices
   endif                                                                 ; end if for whether or not an edge polygon
   


   if indices[0] eq 'circle' then begin                                                                                                                         ; tests if region file shape is a circle
      print, 'This region is a circle'                                                                                                                          ; prints info
      print, indices[1], ' ', indices[2], ' ', indices[3]                                                                                                       ; prints info
      starry = where( sqrt((the_grid[*].y - indices[2])^2 + ((the_grid[*].x - indices[1])*cos(the_grid[*].y*(!pi/180.00)))^2) LE (indices[3]/3600.0), nstarred) ; find any test point inside circle
      print, 'Number of sources inside the star region: ', nstarred                                                                                             ; prints info
      if nstarred ne 0 then the_grid[starry].good = 0                                                                                                           ; sets label for all points inside star radius to be not good
   endif                                                                                                                                                        ; ends if statement over if the region file shape is a circle

endfor                          ; ends for loop over all shapes in the .reg file
free_lun, lun                   ; free the memory allocation associated with reading the region file



;;;;This section tests for grid points that are may contain a cluster
;;;;or any part of a cluster
n_clusters = file_lines(cluster_list)                                                                                       ; finds the number of lines in the polygon region file
openr, lun, cluster_list, /get_lun                                                                                          ; opens .reg file for reading
readcol, cluster_list, z, ra_hms, dec_hms, ra_center, dec_center, ra_bcg, dec_bcg, p_flux, slice                            ; reads in cluster list
close_match_radec, the_grid.x, the_grid.y, ra_center, dec_center, the_grid_matcha, cluster_match, (cluster_radius/3600), 25 ; matches by ra dec
if n_elements(the_grid_matcha) ne 0 then begin                                                                              ; begins if statement on number of grid points satifying 
   print, 'Number of grid points removed due to cluster proximity: ', n_elements(uniq(the_grid_matcha))                     ; prints info
   the_grid[the_grid_matcha].good = 0                                                                                       ; set matches in grid to off
endif                                                                                                                       ; ends if statement



;;;;The last test for fields point is to test if photometry may be bad
;;;;due to proximity to bright stars
if band eq 'zband' then begin
   star_photo = where(catalog.near_bright_star EQ 99, nstar_photo)                                                                                  ; finds catalog sources with possible poor photometries
   print, nstar_photo                                                                                                                               ; print info
   close_match_radec, the_grid.x, the_grid.y, catalog[star_photo].ra, catalog[star_photo].dec, the_grid_matchb, catalog_match, (r_aperture/3600), 25 ; matches by ra dec
   if n_elements(the_grid_matchb) ne 0 then begin                                                                                                    ; begins if statement on number of grid points satifying 
      print, 'Number of grid points removed due to bright star proximity: ', n_elements(uniq(the_grid_matchb))                                       ; prints info
      the_grid[the_grid_matchb].good = 0                                                                                                             ; set matches in grid to off
   endif                                                                                                                                            ; ends if statement
endif

;;;;This section gathers all data from the region file tests and compiles them to
;;;;find where the good test points of the field are located
keep = where( (region_number EQ 99) AND (multi_region mod 2) EQ 0, nkeep, COMPLEMENT=not_keep, NCOMPLEMENT=nnot_keep) ; combines all test to find field
print, 'Number of grid points removed due to polygon considerations: ', nnot_keep 
if nnot_keep ne 0 then the_grid[not_keep].good = 0                                                                    ; sets non field points in the grid to off
field_points = where(the_grid.good EQ 1, nfield)                                                                      ; finds where in the grid fields points are
help, field_points
print, 'Total number of grid points initially: ', round(x_num)*round(y_num)        ; prints info
print, 'Number of grid points being kept:', nfield                                                                    ; prints info
print, 'The total fraction of grid points for the field: ', (nfield/(x_num*y_num))                                    ; prints info

window, 1                                                           ; sets window for plotting
plot, the_grid[field_points].x, the_grid[field_points].y, PSYM=3, $ ; plots the points to be used for field measure
      xrange = [min(catalog.ra-0.5),max(catalog.ra+0.5)], $         ; sets plot's x range
      yrange = [min(catalog.dec-0.5),max(catalog.dec+0.5)]          ; sets plot's y range




;;;;This section calculates the area of one test aperture, finds how
;;;;many total overlaps between apertures exist and then finds the
;;;;total field measurement area

one_area = !pi*(r_aperture/3600)^2                                                        ; calculates the area of one aperture
print, ' This is the area of one field test aperture: ', one_area                         ; prints info
one_overlap = ((0.25)*one_area) - (0.5*(r_aperture/3600)^2*sin(!pi/2))                    ; calculate overalp area
print, ' This is the area of one overlap between two neighbor grid points: ', one_overlap ; prints info

total_overlap = 0                                                                      ; initializes a counter
grid_size = size(the_grid, /DIMENSIONS)                                                ; finds dimesions of the grid
overlap = where(the_grid.good EQ 1 AND shift(the_grid.good,1,0) EQ 1, n_overlap)       ; tests one possible overlap geometry
total_overlap = total_overlap + n_overlap                                              ; adds number of overlaps to running total
overlap = where(the_grid.good EQ 1 AND shift(the_grid.good,-1,0) EQ 1, n_overlap)      ; tests one possible overlap geometry
total_overlap = total_overlap + n_overlap                                              ; adds number of overlaps to running total
overlap = where(the_grid.good EQ 1 AND shift(the_grid.good,0,1) EQ 1, n_overlap)       ; tests one possible overlap geometry
total_overlap = total_overlap + n_overlap                                              ; adds number of overlaps to running total
overlap = where(the_grid.good EQ 1 AND shift(the_grid.good,0,-1) EQ 1, n_overlap)      ; tests one possible overlap geometry
total_overlap = total_overlap + n_overlap                                              ; adds number of overlaps to running total
total_overlap = total_overlap/2                                                        ; we account for repeat overlaps
print, 'This is the total number of overlap areas between grid points:', total_overlap ; prints info

area_field = nfield*one_area - total_overlap*one_overlap            ; finds actual field area sans overlap
print, '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'                          ; 
print, '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'                          ;
print, 'The total observed area for field sources is: ', area_field ; prints info
print, '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'                          ;
print, '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'                          ; 



;;;;This section creates a region file to double check the grid points
openw, lun, grid_region, /get_lun                                                                                                                                             ; opens the new file for writing purposes
for counter_a = 0L, nfield-1, 1 do begin                                                                                                                                      ; loops over all field grid points
   printf, lun, strcompress('circle('+string(the_grid[field_points[counter_a]].x)+','+string(the_grid[field_points[counter_a]].y) +','+string(r_aperture)+ ')' , /remove_all) ; if statement is true prints out a
endfor                                                                                                                                                                        ; end the for loop started above
free_lun, lun                                                                                                                                                                 ; frees the memory associated with the opening of newfile for writing
print, file_lines(grid_region)



;;;;This section determines the actual sources from the catalog which
;;;;belong to the field
print, 'Writing field catalog!'                                                                                                                          ; prints info
help, the_grid[field_points].x
help, the_grid[field_points].y
help, catalog.ra
help, catalog.dec
close_match_radec, the_grid[field_points].x, the_grid[field_points].y, catalog.ra, catalog.dec, the_grid_matchc, field_match, (r_aperture/3600), 100 ; does the matching 

field = intarr(n_elements(catalog.ra))                          ; creates an array for unique identifier of field
field[field_match] = 1                                          ; turns field points to yes
detection_field = where(field EQ 1, ndetections_field)          ; finds unique indices of field
print, 'Number of unique field detections: ', ndetections_field ; prints number of field detections



;;;;This section writes the field detection catalog
detection={ID:catalog(0).ID, RA:catalog(0).RA, DEC:catalog(0).DEC, match_flags:catalog(0).match_flags, $ 
           z_cover:catalog(0).z_cover, ch1_cover:catalog(0).ch1_cover, ch2_cover:catalog(0).ch2_cover, $
           near_bright_star: catalog(0).near_bright_star, $
           z_mag_best:float(catalog(0).z_mag_best), z_magerr_best:float(catalog(0).z_magerr_best), $
           z_mag_aper1_76:float(catalog(0).z_mag_aper1_76), z_mag_aper3_66:float(catalog(0).z_mag_aper3_66), $
           z_mag_aper6_10:float(catalog(0).z_mag_aper6_10), z_magerr_aper1_76:float(catalog(0).z_magerr_aper1_76), $
           z_magerr_aper3_66:float(catalog(0).z_magerr_aper3_66), z_magerr_aper6_10:float(catalog(0).z_magerr_aper6_10), $
           z_mag_auto:float(catalog(0).z_mag_auto), z_magerr_auto:float(catalog(0).z_magerr_auto), $
           z_class_star:float(catalog(0).z_class_star), z_flags:float(catalog(0).z_flags), $
           ch1_mag_best:float(catalog(0).ch1_mag_best), ch1_magerr_best:float(catalog(0).ch1_magerr_best), $
           ch1_best_aper:float(catalog(0).ch1_best_aper), ch1_S2N:float(catalog(0).ch1_s2n), $
           ch1_magcor_aper3_0:float(catalog(0).ch1_magcor_aper3_0), ch1_magcor_aper3_6:float(catalog(0).ch1_magcor_aper3_6), $ 
           ch1_magcor_aper6_0:float(catalog(0).ch1_magcor_aper6_0), ch1_magcor_aper14_85:float(catalog(0).ch1_magcor_aper14_85), $
           ch1_magcor_aper24_4:float(catalog(0).ch1_magcor_aper24_4), ch1_magcorerr_aper3_0:float(catalog(0).ch1_magcorerr_aper3_0), $
           ch1_magcorerr_aper3_6:float(catalog(0).ch1_magcorerr_aper3_6), ch1_magcorerr_aper6_0:float(catalog(0).ch1_magcorerr_aper6_0), $
           ch1_magcorerr_aper14_85:float(catalog(0).ch1_magcorerr_aper14_85), ch1_magcorerr_aper24_4:float(catalog(0).ch1_magcorerr_aper24_4), $
           ch1_area:float(catalog(0).ch1_area), ch1_flags:float(catalog(0).ch1_flags), ch1_class_star:float(catalog(0).ch1_class_star), $
           ch1_coverage:float(catalog(0).ch1_coverage), $
           ch2_mag_best:float(catalog(0).ch2_mag_best), ch2_magerr_best:float(catalog(0).ch2_magerr_best), $
           ch2_best_aper:float(catalog(0).ch2_best_aper), ch2_S2N:float(catalog(0).ch2_s2n), $
           ch2_magcor_aper3_0:float(catalog(0).ch2_magcor_aper3_0), ch2_magcor_aper3_6:float(catalog(0).ch2_magcor_aper3_6), $ 
           ch2_magcor_aper6_0:float(catalog(0).ch2_magcor_aper6_0), ch2_magcor_aper14_85:float(catalog(0).ch2_magcor_aper14_85), $
           ch2_magcor_aper24_4:float(catalog(0).ch2_magcor_aper24_4), ch2_magcorerr_aper3_0:float(catalog(0).ch2_magcorerr_aper3_0), $
           ch2_magcorerr_aper3_6:float(catalog(0).ch2_magcorerr_aper3_6), ch2_magcorerr_aper6_0:float(catalog(0).ch2_magcorerr_aper6_0), $
           ch2_magcorerr_aper14_85:float(catalog(0).ch2_magcorerr_aper14_85), ch2_magcorerr_aper24_4:float(catalog(0).ch2_magcorerr_aper24_4), $
           ch2_area:float(catalog(0).ch2_area), ch2_flags:float(catalog(0).ch2_flags), ch2_class_star:float(catalog(0).ch2_class_star), $
           ch2_coverage:float(catalog(0).ch2_coverage), $
           ch3_mag_best:float(catalog(0).ch3_mag_best), ch3_magerr_best:float(catalog(0).ch3_magerr_best), $
           ch3_best_aper:float(catalog(0).ch3_best_aper), ch3_S2N:float(catalog(0).ch3_s2n), $
           ch3_magcor_aper3_0:float(catalog(0).ch3_magcor_aper3_0), ch3_magcor_aper3_6:float(catalog(0).ch3_magcor_aper3_6), $ 
           ch3_magcor_aper6_0:float(catalog(0).ch3_magcor_aper6_0), ch3_magcor_aper14_85:float(catalog(0).ch3_magcor_aper14_85), $
           ch3_magcor_aper24_4:float(catalog(0).ch3_magcor_aper24_4), ch3_magcorerr_aper3_0:float(catalog(0).ch3_magcorerr_aper3_0), $
           ch3_magcorerr_aper3_6:float(catalog(0).ch3_magcorerr_aper3_6), ch3_magcorerr_aper6_0:float(catalog(0).ch3_magcorerr_aper6_0), $
           ch3_magcorerr_aper14_85:float(catalog(0).ch3_magcorerr_aper14_85), ch3_magcorerr_aper24_4:float(catalog(0).ch3_magcorerr_aper24_4), $
           ch3_area:float(catalog(0).ch3_area), ch3_flags:float(catalog(0).ch3_flags), ch3_class_star:float(catalog(0).ch3_class_star), $
           ch3_coverage:float(catalog(0).ch3_coverage), $
           ch4_mag_best:float(catalog(0).ch4_mag_best), ch4_magerr_best:float(catalog(0).ch4_magerr_best), $
           ch4_best_aper:float(catalog(0).ch4_best_aper), ch4_S2N:float(catalog(0).ch4_s2n), $
           ch4_magcor_aper3_0:float(catalog(0).ch4_magcor_aper3_0), ch4_magcor_aper3_6:float(catalog(0).ch4_magcor_aper3_6), $ 
           ch4_magcor_aper6_0:float(catalog(0).ch4_magcor_aper6_0), ch4_magcor_aper14_85:float(catalog(0).ch4_magcor_aper14_85), $
           ch4_magcor_aper24_4:float(catalog(0).ch4_magcor_aper24_4), ch4_magcorerr_aper3_0:float(catalog(0).ch4_magcorerr_aper3_0), $
           ch4_magcorerr_aper3_6:float(catalog(0).ch4_magcorerr_aper3_6), ch4_magcorerr_aper6_0:float(catalog(0).ch4_magcorerr_aper6_0), $
           ch4_magcorerr_aper14_85:float(catalog(0).ch4_magcorerr_aper14_85), ch4_magcorerr_aper24_4:float(catalog(0).ch4_magcorerr_aper24_4), $
           ch4_area:float(catalog(0).ch4_area), ch4_flags:float(catalog(0).ch4_flags), ch4_class_star:float(catalog(0).ch4_class_star), $
           ch4_coverage:float(catalog(0).ch4_coverage) }
fielded = replicate(detection,ndetections_field) ; replicates the template structure for all field detections


for counter_b=0UL, ndetections_field-1, 1 do begin
  fielded(counter_b)={ID:catalog(detection_field(counter_b)).ID, RA:catalog(detection_field(counter_b)).RA, $
                       DEC:catalog(detection_field(counter_b)).DEC, match_flags:catalog(detection_field(counter_b)).match_flags, $ 
                       z_cover:catalog(detection_field(counter_b)).z_cover, ch1_cover:catalog(detection_field(counter_b)).ch1_cover, ch2_cover:catalog(detection_field(counter_b)).ch2_cover, $
                       near_bright_star: catalog(detection_field(counter_b)).near_bright_star, $
                       z_mag_best:float(catalog(detection_field(counter_b)).z_mag_best), z_magerr_best:float(catalog(detection_field(counter_b)).z_magerr_best), $
                       z_mag_aper1_76:float(catalog(detection_field(counter_b)).z_mag_aper1_76), z_mag_aper3_66:float(catalog(detection_field(counter_b)).z_mag_aper3_66), $
                       z_mag_aper6_10:float(catalog(detection_field(counter_b)).z_mag_aper6_10), z_magerr_aper1_76:float(catalog(detection_field(counter_b)).z_magerr_aper1_76), $
                       z_magerr_aper3_66:float(catalog(detection_field(counter_b)).z_magerr_aper3_66), z_magerr_aper6_10:float(catalog(detection_field(counter_b)).z_magerr_aper6_10), $
                       z_mag_auto:float(catalog(detection_field(counter_b)).z_mag_auto), z_magerr_auto:float(catalog(detection_field(counter_b)).z_magerr_auto), $
                       z_class_star:float(catalog(detection_field(counter_b)).z_class_star), z_flags:float(catalog(detection_field(counter_b)).z_flags), $
                       ch1_mag_best:float(catalog(detection_field(counter_b)).ch1_mag_best), ch1_magerr_best:float(catalog(detection_field(counter_b)).ch1_magerr_best), $
                       ch1_best_aper:float(catalog(detection_field(counter_b)).ch1_best_aper), ch1_S2N:float(catalog(detection_field(counter_b)).ch1_s2n), $
                       ch1_magcor_aper3_0:float(catalog(detection_field(counter_b)).ch1_magcor_aper3_0), ch1_magcor_aper3_6:float(catalog(detection_field(counter_b)).ch1_magcor_aper3_6), $ 
                       ch1_magcor_aper6_0:float(catalog(detection_field(counter_b)).ch1_magcor_aper6_0), ch1_magcor_aper14_85:float(catalog(detection_field(counter_b)).ch1_magcor_aper14_85), $
                       ch1_magcor_aper24_4:float(catalog(detection_field(counter_b)).ch1_magcor_aper24_4), ch1_magcorerr_aper3_0:float(catalog(detection_field(counter_b)).ch1_magcorerr_aper3_0), $
                       ch1_magcorerr_aper3_6:float(catalog(detection_field(counter_b)).ch1_magcorerr_aper3_6), ch1_magcorerr_aper6_0:float(catalog(detection_field(counter_b)).ch1_magcorerr_aper6_0), $
                       ch1_magcorerr_aper14_85:float(catalog(detection_field(counter_b)).ch1_magcorerr_aper14_85), ch1_magcorerr_aper24_4:float(catalog(detection_field(counter_b)).ch1_magcorerr_aper24_4), $
                       ch1_area:float(catalog(detection_field(counter_b)).ch1_area), ch1_flags:float(catalog(detection_field(counter_b)).ch1_flags), $
                       ch1_class_star:float(catalog(detection_field(counter_b)).ch1_class_star), $
                       ch1_coverage:float(catalog(detection_field(counter_b)).ch1_coverage), $
                       ch2_mag_best:float(catalog(detection_field(counter_b)).ch2_mag_best), ch2_magerr_best:float(catalog(detection_field(counter_b)).ch2_magerr_best), $
                       ch2_best_aper:float(catalog(detection_field(counter_b)).ch2_best_aper), ch2_S2N:float(catalog(detection_field(counter_b)).ch2_s2n), $
                       ch2_magcor_aper3_0:float(catalog(detection_field(counter_b)).ch2_magcor_aper3_0), ch2_magcor_aper3_6:float(catalog(detection_field(counter_b)).ch2_magcor_aper3_6), $ 
                       ch2_magcor_aper6_0:float(catalog(detection_field(counter_b)).ch2_magcor_aper6_0), ch2_magcor_aper14_85:float(catalog(detection_field(counter_b)).ch2_magcor_aper14_85), $
                       ch2_magcor_aper24_4:float(catalog(detection_field(counter_b)).ch2_magcor_aper24_4), ch2_magcorerr_aper3_0:float(catalog(detection_field(counter_b)).ch2_magcorerr_aper3_0), $
                       ch2_magcorerr_aper3_6:float(catalog(detection_field(counter_b)).ch2_magcorerr_aper3_6), ch2_magcorerr_aper6_0:float(catalog(detection_field(counter_b)).ch2_magcorerr_aper6_0), $
                       ch2_magcorerr_aper14_85:float(catalog(detection_field(counter_b)).ch2_magcorerr_aper14_85), ch2_magcorerr_aper24_4:float(catalog(detection_field(counter_b)).ch2_magcorerr_aper24_4), $
                       ch2_area:float(catalog(detection_field(counter_b)).ch2_area), ch2_flags:float(catalog(detection_field(counter_b)).ch2_flags), $
                       ch2_class_star:float(catalog(detection_field(counter_b)).ch2_class_star), $
                       ch2_coverage:float(catalog(detection_field(counter_b)).ch2_coverage), $
                       ch3_mag_best:float(catalog(detection_field(counter_b)).ch3_mag_best), ch3_magerr_best:float(catalog(detection_field(counter_b)).ch3_magerr_best), $
                       ch3_best_aper:float(catalog(detection_field(counter_b)).ch3_best_aper), ch3_S2N:float(catalog(detection_field(counter_b)).ch3_s2n), $
                       ch3_magcor_aper3_0:float(catalog(detection_field(counter_b)).ch3_magcor_aper3_0), ch3_magcor_aper3_6:float(catalog(detection_field(counter_b)).ch3_magcor_aper3_6), $ 
                       ch3_magcor_aper6_0:float(catalog(detection_field(counter_b)).ch3_magcor_aper6_0), ch3_magcor_aper14_85:float(catalog(detection_field(counter_b)).ch3_magcor_aper14_85), $
                       ch3_magcor_aper24_4:float(catalog(detection_field(counter_b)).ch3_magcor_aper24_4), ch3_magcorerr_aper3_0:float(catalog(detection_field(counter_b)).ch3_magcorerr_aper3_0), $
                       ch3_magcorerr_aper3_6:float(catalog(detection_field(counter_b)).ch3_magcorerr_aper3_6), ch3_magcorerr_aper6_0:float(catalog(detection_field(counter_b)).ch3_magcorerr_aper6_0), $
                       ch3_magcorerr_aper14_85:float(catalog(detection_field(counter_b)).ch3_magcorerr_aper14_85), ch3_magcorerr_aper24_4:float(catalog(detection_field(counter_b)).ch3_magcorerr_aper24_4), $
                       ch3_area:float(catalog(detection_field(counter_b)).ch3_area), ch3_flags:float(catalog(detection_field(counter_b)).ch3_flags), $
                       ch3_class_star:float(catalog(detection_field(counter_b)).ch3_class_star), $
                       ch3_coverage:float(catalog(detection_field(counter_b)).ch3_coverage), $
                       ch4_mag_best:float(catalog(detection_field(counter_b)).ch4_mag_best), ch4_magerr_best:float(catalog(detection_field(counter_b)).ch4_magerr_best), $
                       ch4_best_aper:float(catalog(detection_field(counter_b)).ch4_best_aper), ch4_S2N:float(catalog(detection_field(counter_b)).ch4_s2n), $
                       ch4_magcor_aper3_0:float(catalog(detection_field(counter_b)).ch4_magcor_aper3_0), ch4_magcor_aper3_6:float(catalog(detection_field(counter_b)).ch4_magcor_aper3_6), $ 
                       ch4_magcor_aper6_0:float(catalog(detection_field(counter_b)).ch4_magcor_aper6_0), ch4_magcor_aper14_85:float(catalog(detection_field(counter_b)).ch4_magcor_aper14_85), $
                       ch4_magcor_aper24_4:float(catalog(detection_field(counter_b)).ch4_magcor_aper24_4), ch4_magcorerr_aper3_0:float(catalog(detection_field(counter_b)).ch4_magcorerr_aper3_0), $
                       ch4_magcorerr_aper3_6:float(catalog(detection_field(counter_b)).ch4_magcorerr_aper3_6), ch4_magcorerr_aper6_0:float(catalog(detection_field(counter_b)).ch4_magcorerr_aper6_0), $
                       ch4_magcorerr_aper14_85:float(catalog(detection_field(counter_b)).ch4_magcorerr_aper14_85), ch4_magcorerr_aper24_4:float(catalog(detection_field(counter_b)).ch4_magcorerr_aper24_4), $
                       ch4_area:float(catalog(detection_field(counter_b)).ch4_area), ch4_flags:float(catalog(detection_field(counter_b)).ch4_flags), $
                       ch4_class_star:float(catalog(detection_field(counter_b)).ch4_class_star), $
                       ch4_coverage:float(catalog(detection_field(counter_b)).ch4_coverage) }
endfor                                         ; ends loop over all field detections
mwrfits, fielded, cluster_out, header, /Create ; writes out field catalog
print, 'Field detection catalog is written!'   ; prints info
print,  ' '                                    ; prints info


end
