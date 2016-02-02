pro z_num_mag_counts

min_mag = 16
max_mag = 26
bin_mag = 0.1
num_bins = (max_mag - min_mag)/bin_mag
xmmdeg = 14.685 ; found using montecarlo.pro
cdfsdeg = 8.459 ; found using montecarlo.pro
es1deg = 8.513 ; found using montecarlo.pro
en1deg = 10.830  ; found using montecarlo.pro
en2deg = 4.583 ; found using montecarlo.pro
lockdeg = 13.400 ; found using montecarlo.pro

 
star_index = 0.90

;;;;Publish Data;;;;
;;;; IRAC ch1
x_furusawa = [19.25, 19.75, 20.25, 20.75, 21.25, 21.75, 22.25, 22.75, 23.25, 23.75, 24.25, 24.75]
y_furusawa = [1.5E3, 2.0E3, 3.5E3, 5.0E3, 8.0E3, 1.0E4, 2.0E4, 3.0E4, 4.0E4, 5.5E4, 8.0E4, 1.0E5]
x_yasuda = [14.25, 14.75, 15.25, 15.75, 16.25, 16.75, 17.25, 17.75, 18.25, 18.75, 19.25, 19.75]
y_yasuda = [0.40, 0.6, 0.8, 1.1, 1.4, 1.7, 2.0, 2.2, 2.5, 2.7, 2.9, 3.0 ]
y_yasuda = 2*10^(y_yasuda)
x_montero = [13.0, 13.27, 13.54, 13.81, 14.08, 14.35, 14.62, 14.89, 15.16, 15.43, 15.70, 16.0, 16.3, 16.6, 16.9]
y_montero = [2.65, 2.75, 2.8, 2.8, 2.8, 2.85, 2.85, 2.85, 2.85, 2.85, 2.85, 2.85, 2.85, 2.85, 2.8]
y_montero = 2*10^(y_montero) * 10^(0.6*(x_montero-18))
x_gwyn = [22.0, 22.5, 23.0, 23.5, 24.0, 24.5, 25.0, 25.5, 26.0]
y_gwyn = [4.25, 4.40, 4.45, 4.5, 4.75, 4.85, 4.80, 4.70, 4.2 ]
yerr_gwyn = 10^(y_gwyn + 0.05) - 10^(y_gwyn)
y_gwyn = 10^(y_gwyn)


;read in the fits file
;directory = '/Users/andrew/originaldata/xmmlss/irac/'
cdfs = '/Users/andrew/originaldata/cdfs/final_cats/cdfs_zband_all_nooverlap_converted_cleaned.fits'
xmmlss = '/Users/andrew/originaldata/xmmlss/z/xmmlss_zband_nodoubles.fits'
es1 = '/Users/andrew/originaldata/elaiss1/final_cats/es1_zband_all_nooverlap_converted_cleaned.fits'
en1 = '/Users/andrew/originaldata/elaisn1/final_cats/en1_zband_all_nooverlap_converted_cleaned.fits'
en2 = '/Users/andrew/originaldata/elaisn2/final_cats/en2_zband_all_nooverlap_converted_cleaned.fits'
lockman = '/Users/andrew/originaldata/lockman/final_cats/lockman_zband_all_nooverlap_converted_cleaned.fits'

es1 = mrdfits(es1, 1)
es1_z_mag_aper1_76 = es1.mag_aper1_76 
es1_z_mag_aper3_66 = es1.mag_aper3_66 
es1_z_mag_aper6_10 = es1.mag_aper6_10 
es1_z_mag_auto = es1.mag_auto  
es1_z_mag_best = es1.mag_best 
es1_class_star = es1.class_star
es1_flags = es1.flags
es1 = 0
en1 = mrdfits(en1, 1)
en1_z_mag_aper1_76 = en1.mag_aper1_76
en1_z_mag_aper3_66 = en1.mag_aper3_66
en1_z_mag_aper6_10 = en1.mag_aper6_10
en1_z_mag_auto = en1.mag_auto 
en1_z_mag_best = en1.mag_best 
en1_class_star = en1.class_star
en1_flags = en1.flags
en1 = 0
en2 = mrdfits(en2, 1)
irac_en2_z_mag_aper1_76 = en2.mag_aper1_76
irac_en2_z_mag_aper3_66 = en2.mag_aper3_66
irac_en2_z_mag_aper6_10 = en2.mag_aper6_10
irac_en2_z_mag_auto = en2.mag_auto 
irac_en2_z_mag_best = en2.mag_best 
irac_en2_class_star = en2.class_star
irac_en2_flags = en2.flags
en2 = 0
lockman = mrdfits(lockman, 1)
lockman_z_mag_aper1_76 = lockman.mag_aper1_76
lockman_z_mag_aper3_66 = lockman.mag_aper3_66
lockman_z_mag_aper6_10 = lockman.mag_aper6_10
lockman_z_mag_auto = lockman.mag_auto 
lockman_z_mag_best = lockman.mag_best 
lockman_class_star = lockman.class_star
lockman_flags = lockman.flags
lockman = 0
cdfs = mrdfits(cdfs, 1)
cdfs_z_mag_aper1_76 = cdfs.mag_aper1_76 
cdfs_z_mag_aper3_66 = cdfs.mag_aper3_66 
cdfs_z_mag_aper6_10 = cdfs.mag_aper6_10 
cdfs_z_mag_auto = cdfs.mag_auto
cdfs_z_mag_best = cdfs.mag_best
cdfs_class_star = cdfs.class_star
cdfs_flags = cdfs.flags
cdfs = 0
xmm = mrdfits(xmmlss, 1)
xmm_z_mag_aper1_76 = xmm.mag_aper1_76
xmm_z_mag_aper3_66 = xmm.mag_aper3_66
xmm_z_mag_aper6_10 = xmm.mag_aper6_10
xmm_z_mag_auto = xmm.mag_auto 
xmm_z_mag_best = xmm.best_mag 
xmm_class_star = xmm.class_star
xmm_flags = xmm.flags
xmm = 0


good_en2 = where( (irac_en2_class_star LE star_index) AND ((irac_en2_z_mag_auto + 99.9999) GT 0.1) $
                  AND ((irac_en2_z_mag_auto - irac_en2_z_mag_auto) LT 0.1) AND (irac_en2_z_mag_auto LT 28) $
                AND irac_en2_flags LE 2)
good_xmm = where( (xmm_class_star LE star_index) AND ((xmm_z_mag_auto + 99.9999) GT 0.1) $
                  AND ((xmm_z_mag_auto - xmm_z_mag_auto) LT 0.1) AND (xmm_z_mag_auto LT 28) $
                AND xmm_flags LE 2)
good_cdfs = where( (cdfs_class_star LE star_index) AND ((cdfs_z_mag_auto + 99.9999) GT 0.1) $
                  AND ((cdfs_z_mag_auto - cdfs_z_mag_auto) LT 0.1) AND (cdfs_z_mag_auto LT 28) $
                AND cdfs_flags LE 2)
good_es1 = where( (es1_class_star LE star_index) AND ((es1_z_mag_auto + 99.9999) GT 0.1) $
                  AND ((es1_z_mag_auto - es1_z_mag_auto) LT 0.1) AND (es1_z_mag_auto LT 28) $
                AND es1_flags LE 2)
good_en1 = where( (en1_class_star LE star_index) AND ((en1_z_mag_auto + 99.9999) GT 0.1) $
                  AND ((en1_z_mag_auto - en1_z_mag_auto) LT 0.1) AND (en1_z_mag_auto LT 28) $
                AND en1_flags LE 2)
good_lockman = where( (lockman_class_star LE star_index) AND ((lockman_z_mag_auto + 99.9999) GT 0.1) $
                  AND ((lockman_z_mag_auto - lockman_z_mag_auto) LT 0.1) AND (lockman_z_mag_auto LT 28) $
                AND lockman_flags LE 2)

print, min(irac_en2_z_mag_auto(good_en2)), max(irac_en2_z_mag_auto(good_en2)), mean(irac_en2_z_mag_auto(good_en2)), stdev(irac_en2_z_mag_auto(good_en2))
print, min(xmm_z_mag_auto(good_xmm)), max(xmm_z_mag_auto(good_xmm)), mean(xmm_z_mag_auto(good_xmm)), stdev(xmm_z_mag_auto(good_xmm))
print, min(cdfs_z_mag_auto(good_cdfs)), max(cdfs_z_mag_auto(good_cdfs)), mean(cdfs_z_mag_auto(good_cdfs)), stdev(cdfs_z_mag_auto(good_cdfs))
print, min(es1_z_mag_auto(good_es1)), max(es1_z_mag_auto(good_es1)), mean(es1_z_mag_auto(good_es1)), stdev(es1_z_mag_auto(good_es1))
print, min(en1_z_mag_auto(good_en1)), max(en1_z_mag_auto(good_en1)), mean(en1_z_mag_auto(good_en1)), stdev(en1_z_mag_auto(good_en1))
print, min(lockman_z_mag_auto(good_lockman)), max(lockman_z_mag_auto(good_lockman)), mean(lockman_z_mag_auto(good_lockman)), stdev(lockman_z_mag_auto(good_lockman))


bins = indgen(num_bins)
bins = max_mag - bin_mag*bins
hist1 = fltarr(num_bins)
hist2 = hist1 
hist3 = hist1 
hist4 = hist1
hist5 = hist1
hist6 = hist1
hist = fltarr(num_bins)
histerr = fltarr(num_bins)
hists = fltarr(num_bins)
histserr = fltarr(num_bins)
histn = fltarr(num_bins)
histnerr = fltarr(num_bins)
for k = 0, num_bins-1 do begin
	     	 hist1(k) = size( where( (xmm_z_mag_auto[good_xmm] le bins(k)) AND (xmm_z_mag_auto[good_xmm] gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/xmmdeg)
	     	 hist2(k) = size( where( (lockman_z_mag_auto[good_lockman] le bins(k)) AND (lockman_z_mag_auto[good_lockman] gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/lockdeg)
	     	 hist3(k) = size( where( (irac_en2_z_mag_auto[good_en2] le bins(k)) AND (irac_en2_z_mag_auto[good_en2] gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/en2deg)
	     	 hist4(k) = size( where( (es1_z_mag_auto[good_es1] le bins(k)) AND (es1_z_mag_auto[good_es1] gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/es1deg)
	     	 hist5(k) = size( where( (en1_z_mag_auto[good_en1] le bins(k)) AND (en1_z_mag_auto[good_en1] gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/en1deg)
	     	 hist6(k) = size( where( (cdfs_z_mag_auto[good_cdfs] le bins(k)) AND (cdfs_z_mag_auto[good_cdfs] gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/cdfsdeg)
                 histbin = [hist1(k), hist2(k), hist3(k), hist4(k), hist5(k), hist6(k)]
                 histsouth = [hist4(k), hist6(k)]
                 histnorth = [hist1(k), hist2(k), hist3(k), hist5(k)]
                 hist(k) = mean(histbin)
                 histerr(k) = stddev(histbin)
                 hists(k) = mean(histsouth)
                 histserr(k) = stddev(histsouth)
                 histn(k) = mean(histnorth)
                 histnerr(k) = stddev(histnorth)
endfor   

;window = 0
plot, bins, hist3, PSYM=7, $
      title = 'Individual z band Auto Magnitude Diff Number Mag Plot' , $
      background = 'FFFFFF'XL, $
      color = '000000'XL, $
      xrange = [min_mag, max_mag], $
      yrange = [1e1, 4E4], $
      xtitle = 'AB Magnitude', $
      ytitle = 'N mag^(-1) deg^(-2)', $
      /ylog , $
      charsize = 1.3, $
      charthick = 1.6
oplot, bins, hist2, PSYM=2, symsize = 1.2, color = '000000'XL
oplot, bins, hist1, PSYM=1, symsize = 1.2, color = '000000'XL
oplot, bins, hist4, PSYM=4, symsize = 1.2, color = '000000'XL
oplot, bins, hist5, PSYM=5, symsize = 1.2, color = '000000'XL
oplot, bins, hist6, PSYM=6, symsize = 1.2, color = '000000'XL
legend, ['XMM', 'ES1', 'EN1', 'EN2', 'CDFS', 'Lockman'], PSYM=[1,4,5,7,6,2], $
        box=0, colors = '000000'XL, textcolors = '000000'XL
;im=tvrd()
;write_jpeg, 'zband_individual_points_auto_stellarity0.90_flags_2.jpeg', im

window, 1
plot, x_yasuda, y_yasuda, psym=2, $
      title = 'Averaged z band Auto Mag Plot with Published Values' , $
      background = 'FFFFFF'XL, $
      color = '000000'XL, $
      xrange = [min_mag, max_mag], $
      yrange = [10, 1E5], $
      xtitle = 'AB Magnitude', $
      ytitle = 'N mag^(-1) deg^(-2)', $
      /ylog , $
      charsize = 1.2, $
      charthick = 1.6
oploterror, bins, hist, histerr, PSYM=4, errcolor = '000000'XL
oplot, bins, hist, PSYM=4, symsize = 1.2, color = '000000'XL 
oplot, x_furusawa, y_furusawa, psym=1, symsize = 1.2, color = '000000'XL
oplot, x_montero, y_montero, psym=5, symsize = 1.2, color = '000000'XL
oploterror, x_gwyn, y_gwyn, yerr_gwyn, PSYM=6, errcolor = '000000'XL
oplot, x_gwyn, y_gwyn, psym=6, symsize = 1.2, color = '000000'XL
legend, ['Our data', 'yasuda', 'furusawa', 'montero', 'gwyn'], PSYM=[4,2,1,5,6], $
        box=0, colors = '000000'XL, textcolors = '000000'XL
;im=tvrd()
;write_jpeg, 'zband_average_points_auto_stellarity1.001_flags_4.jpeg',im


;window, 2
;plot, x_yasuda, y_yasuda, psym=2, $
;      title = 'Averaged z band Auto Mag Plot with Published Values: Northern Fields' , $
;      background = 'FFFFFF'XL, $
;      color = '000000'XL, $
;      xrange = [min_mag, max_mag], $
;      yrange = [1, 1E5], $
;      xtitle = 'AB Magnitude', $
;      ytitle = 'N mag^(-1) deg^(-2)', $
;      /ylog , $
;      charsize = 1.2, $
;      charthick = 1.6
;oploterror, bins, histn, histnerr, PSYM=4, errcolor = '000000'XL
;oplot, bins, histn, PSYM=4, symsize = 1.2, color = '000000'XL
;oplot, x_furusawa, y_furusawa, psym=1, symsize = 1.2, color = '000000'XL
;oplot, x_montero, y_montero, psym=5, symsize = 1.2, color = '000000'XL
;oploterror, x_gwyn, y_gwyn, yerr_gwyn, PSYM=6, errcolor = '000000'XL
;oplot, x_gwyn, y_gwyn, psym=6, symsize = 1.2, color = '000000'XL
;legend, ['Our data', 'yasuda', 'furusawa', 'montero', 'gwyn'], PSYM=[4,2,1,5,6], $
;        box=0, colors = '000000'XL, textcolors = '000000'XL
;im=tvrd()
;write_jpeg, 'zband_northern_points_auto_stellarity1.001_flags_4.jpeg',im

;window, 3
;plot, x_yasuda, y_yasuda, psym=2, $
;      title = 'Averaged z band Auto Mag Plot with Published Values: Southern Fields' , $
;      background = 'FFFFFF'XL, $
;      color = '000000'XL, $
;      xrange = [min_mag, max_mag], $
;      yrange = [1, 1E5], $
;      xtitle = 'AB Magnitude', $
;      ytitle = 'N mag^(-1) deg^(-2)', $
;      /ylog , $
;      charsize = 1.2, $
;      charthick = 1.6
;oploterror, bins, hists, histserr, PSYM=4, errcolor = '000000'XL
;oplot, bins, hists, PSYM=4, symsize = 1.2, color = '000000'XL
;oplot, x_furusawa, y_furusawa, psym=1, symsize = 1.2, color = '000000'XL
;oplot, x_montero, y_montero, psym=5, symsize = 1.2, color = '000000'XL
;oploterror, x_gwyn, y_gwyn, yerr_gwyn, PSYM=6, errcolor = '000000'XL
;oplot, x_gwyn, y_gwyn, psym=6, symsize = 1.2, color = '000000'XL
;legend, ['Our data', 'yasuda', 'furusawa', 'montero', 'gwyn'], PSYM=[4,2,1,5,6], $
;        box=0, colors = '000000'XL, textcolors = '000000'XL
;im=tvrd()
;write_jpeg, 'zband_southern_points_auto_stellarity1.001_flags_4.jpeg',im


end
