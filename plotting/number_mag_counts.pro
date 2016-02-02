pro number_mag_counts

min_mag = 14
max_mag = 26
bin_mag = .35 ;0.1
num_bins = (max_mag - min_mag)/bin_mag
xmmdeg = 9.076 ; found using montecarlo.pro
cdfsdeg = 7.748 ; found using montecarlo.pro
es1deg = 6.798 ; found using montecarlo.pro
en1deg = 9.304 ; found using montecarlo.pro
en2deg = 4.191 ; found using montecarlo.pro
lockdeg = 11.12 ; found using montecarlo.pro

star_index = 0.85

;;;;Publish Data;;;;
;;;; IRAC ch1
x_furusawa = [19.25, 19.75, 20.25, 20.75, 21.25, 21.75, 22.25, 22.75, 23.25, 23.75, 24.25, 24.75]
y_furusawa = [1.5E3, 2.0E3, 3.5E3, 5.0E3, 8.0E3, 1.0E4, 2.0E4, 3.0E4, 4.0E4, 5.5E4, 8.0E4, 1.0E5]
; y_bootes = 10^(y_bootes)
x_yasuda = [14.25, 14.75, 15.25, 15.75, 16.25, 16.75, 17.25, 17.75, 18.25, 18.75, 19.25, 19.75]
y_yasuda = [0.40, 0.6, 0.8, 1.1, 1.4, 1.7, 2.0, 2.2, 2.5, 2.7, 2.9, 3.0 ]
y_yasuda = 2*10^(y_yasuda)


;read in the fits file
;directory = '/Users/andrew/originaldata/xmmlss/irac/'
cdfs = '/Users/andrew/originaldata/cdfs/final_cats/cdfs_zband.fits'
xmmlss = '/Users/andrew/originaldata/xmmlss/z/xmmlss_zband.fits'
es1 = '/Users/andrew/originaldata/elaiss1/final_cats/es1_zband.fits'
en1 = '/Users/andrew/originaldata/elaisn1/final_cats/en1_zband.fits'
en2 = '/Users/andrew/originaldata/elaisn2/final_cats/en2_5passband_final.fits'
lockman = '/Users/andrew/originaldata/lockman/final_cats/lockman_zband.fits'

es1 = mrdfits(es1, 1)
es1_z_mag_aper1_76 = es1.mag_aper9_51
es1_z_mag_aper3_66 = es1.mag_aper19_8
es1_z_mag_aper6_10 = es1.mag_aper32_97
es1_class_star = es1.class_star
es1 = 0
en1 = mrdfits(en1, 1)
en1_z_mag_aper1_76 = en1.mag_aper9_51
en1_z_mag_aper3_66 = en1.mag_aper19_8
en1_z_mag_aper6_10 = en1.mag_aper32_97
en1_class_star = en1.class_star
en1 = 0
irac_en2 = mrdfits(en2, 1)
irac_en2_z_mag_aper1_76 = irac_en2.z_mag_aper9_51
irac_en2_z_mag_aper3_66 = irac_en2.z_mag_aper19_8
irac_en2_z_mag_aper6_10 = irac_en2.z_mag_aper32_97
irac_en2_class_star = irac_en2.z_class_star
irac_en2 = 0
lockman = mrdfits(lockman, 1)
lockman_z_mag_aper1_76 = lockman.mag_aper9_51
lockman_z_mag_aper3_66 = lockman.mag_aper19_8
lockman_z_mag_aper6_10 = lockman.mag_aper32_97
lockman_class_star = lockman.class_star
lockman = 0
cdfs = mrdfits(cdfs, 1)
cdfs_z_mag_aper1_76 = cdfs.mag_aper9_51
cdfs_z_mag_aper3_66 = cdfs.mag_aper19_8
cdfs_z_mag_aper6_10 = cdfs.mag_aper32_97
cdfs_class_star = cdfs.class_star
cdfs = 0
xmm = mrdfits(xmmlss, 1)
xmm_z_mag_aper1_76 = xmm.mag_aper1_76
xmm_z_mag_aper3_66 = xmm.mag_aper3_66
xmm_z_mag_aper6_10 = xmm.mag_aper6_10
xmm_class_star = xmm.class_star
xmm = 0

good_en2 = where( (irac_en2_class_star LE star_index) AND ((irac_en2_z_mag_aper3_66 + 99.9999) GT 0.1) $
                  AND ((irac_en2_z_mag_aper3_66 - irac_en2_z_mag_aper3_66) LT 0.1) AND (irac_en2_z_mag_aper3_66 LT 28))
good_xmm = where( (xmm_class_star LE star_index) AND ((xmm_z_mag_aper3_66 + 99.9999) GT 0.1) $
                  AND ((xmm_z_mag_aper3_66 - xmm_z_mag_aper3_66) LT 0.1) AND (xmm_z_mag_aper3_66 LT 28))
good_cdfs = where( (cdfs_class_star LE star_index) AND ((cdfs_z_mag_aper3_66 + 99.9999) GT 0.1) $
                  AND ((cdfs_z_mag_aper3_66 - cdfs_z_mag_aper3_66) LT 0.1) AND (cdfs_z_mag_aper3_66 LT 28))
good_es1 = where( (es1_class_star LE star_index) AND ((es1_z_mag_aper3_66 + 99.9999) GT 0.1) $
                  AND ((es1_z_mag_aper3_66 - es1_z_mag_aper3_66) LT 0.1) AND (es1_z_mag_aper3_66 LT 28))
good_en1 = where( (en1_class_star LE star_index) AND ((en1_z_mag_aper3_66 + 99.9999) GT 0.1) $
                  AND ((en1_z_mag_aper3_66 - en1_z_mag_aper3_66) LT 0.1) AND (en1_z_mag_aper3_66 LT 28))
good_lockman = where( (lockman_class_star LE star_index) AND ((lockman_z_mag_aper3_66 + 99.9999) GT 0.1) $
                  AND ((lockman_z_mag_aper3_66 - lockman_z_mag_aper3_66) LT 0.1) AND (lockman_z_mag_aper3_66 LT 28))

print, min(irac_en2_z_mag_aper3_66(good_en2)), max(irac_en2_z_mag_aper3_66(good_en2)), mean(irac_en2_z_mag_aper3_66(good_en2)), stdev(irac_en2_z_mag_aper3_66(good_en2))
print, min(xmm_z_mag_aper3_66(good_xmm)), max(xmm_z_mag_aper3_66(good_xmm)), mean(xmm_z_mag_aper3_66(good_xmm)), stdev(xmm_z_mag_aper3_66(good_xmm))
print, min(cdfs_z_mag_aper3_66(good_cdfs)), max(cdfs_z_mag_aper3_66(good_cdfs)), mean(cdfs_z_mag_aper3_66(good_cdfs)), stdev(cdfs_z_mag_aper3_66(good_cdfs))
print, min(es1_z_mag_aper3_66(good_es1)), max(es1_z_mag_aper3_66(good_es1)), mean(es1_z_mag_aper3_66(good_es1)), stdev(es1_z_mag_aper3_66(good_es1))
print, min(en1_z_mag_aper3_66(good_en1)), max(en1_z_mag_aper3_66(good_en1)), mean(en1_z_mag_aper3_66(good_en1)), stdev(en1_z_mag_aper3_66(good_en1))
print, min(lockman_z_mag_aper3_66(good_lockman)), max(lockman_z_mag_aper3_66(good_lockman)), mean(lockman_z_mag_aper3_66(good_lockman)), stdev(lockman_z_mag_aper3_66(good_lockman))


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
	     	 hist1(k) = size( where( (xmm_z_mag_aper3_66[good_xmm] le bins(k)) AND (xmm_z_mag_aper3_66[good_xmm] gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/xmmdeg)
	     	 hist2(k) = size( where( (lockman_z_mag_aper3_66 le bins(k)) AND (lockman_z_mag_aper3_66 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/lockdeg)
	     	 hist3(k) = size( where( (irac_en2_z_mag_aper3_66[good_en2] le bins(k)) AND (irac_en2_z_mag_aper3_66[good_en2] gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/en2deg)
	     	 hist4(k) = size( where( (es1_z_mag_aper3_66 le bins(k)) AND (es1_z_mag_aper3_66 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/es1deg)
	     	 hist5(k) = size( where( (en1_z_mag_aper3_66 le bins(k)) AND (en1_z_mag_aper3_66 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/en1deg)
	     	 hist6(k) = size( where( (cdfs_z_mag_aper3_66 le bins(k)) AND (cdfs_z_mag_aper3_66 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/cdfsdeg)
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

window = 0
plot, bins, hist1, PSYM=1, $
      title = 'Individual z band 3.66" Aperture Magnitude Diff Number Mag Plot' , $
      background = 'FFFFFF'XL, $
      color = '000000'XL, $
      xrange = [min_mag, max_mag], $
      xtitle = 'AB Magnitude', $
      ytitle = 'N mag^(-1) deg^(-2)', $
      /ylog , $
      charsize = 1.3, $
      charthick = 1.6
oplot, bins, hist2, PSYM=2, symsize = 1.2, color = '000000'XL
oplot, bins, hist3, PSYM=7, symsize = 1.2, color = '000000'XL
oplot, bins, hist4, PSYM=4, symsize = 1.2, color = '000000'XL
oplot, bins, hist5, PSYM=5, symsize = 1.2, color = '000000'XL
oplot, bins, hist6, PSYM=6, symsize = 1.2, color = '000000'XL
;oploterror, bins, hist, histerr, PSYM=6, errcolor = '000000'XL
;oplot, x_bootes, y_bootes, psym=1, symsize = 1.2, color = '000000'XL
;oplot, x_egs, y_egs, psym = 2, symsize = 1.2, color = '000000'XL
;oplot, x_barmby, y_barmby, psym = 4, symsize = 1.2, color = '000000'XL
;oplot, x_ashby, y_ashby, psym = 5, symsize = 1.2, color = '000000'XL
;oplot, x_sanders, y_sanders, psym=7, symsize = 1.2, color = '000000'XL
legend, ['XMM', 'Lockman', 'EN2', 'ES1', 'EN1', 'CDFS'], PSYM=[1,2,7,4,5,6], $
        box=0, colors = '000000'XL, textcolors = '000000'XL
;legend, ['This Work', 'Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby'], PSYM=[6,1,2,4,5], $
;        box=0, colors = '000000'XL, textcolors = '000000'XL
;im=tvrd()
;write_jpeg, 'zband_individual_points_3_66_stellarity_0.85.jpeg', im

window, 1
plot, bins, hist, $
      title = 'N vs S z band 3.66" Aper Diff Number Mag Plot' , $
      background = 'FFFFFF'XL, $
      color = '000000'XL, $
      xrange = [min_mag, max_mag], $
      xtitle = 'AB Magnitude', $
      ytitle = 'N mag^(-1) deg^(-2)', $
      /ylog , $
      charsize = 1.2, $
      charthick = 1.6
oploterror, bins, hist, histerr, PSYM=6, errcolor = '000000'XL
oplot, x_yasuda, y_yasuda, psym=1, symsize = 1.2, color = '000000'XL
oplot, x_furusawa, y_furusawa, psym=2, symsize = 1.2, color = '000000'XL
;im=tvrd()
;write_jpeg, 'zband_average_nvss_points_3_66.jpeg',im

;window, 2
;plot, bins, hist1, $
;      title = 'IRAC ch1 3.6" Aperture Magnitude' , $
;      background = 'FFFFFF'XL, $
;      color = '000000'XL, $
;      xrange = [min_mag, max_mag], $
;      xtitle = 'AB Magnitude', $
;      ytitle = 'N mag^(-1) deg^(-2)', $
;      /ylog , $
;      charsize = 1.2, $
;      charthick = 1.6
;oplot, bins, hist2, color = '000000'XL
;oplot, bins, hist3, color = '000000'XL
;oplot, bins, hist4, color = '000000'XL
;oplot, bins, hist5, color = '000000'XL
;oplot, bins, hist6, color = '000000'XL
;oplot, x_bootes, y_bootes, psym=1, symsize = 1.2, color = '000000'XL
;oplot, x_egs, y_egs, psym = 2, symsize = 1.2, color = '000000'XL
;oplot, x_barmby, y_barmby, psym = 4, symsize = 1.2, color = '000000'XL
;oplot, x_ashby, y_ashby, psym = 5, symsize = 1.2, color = '000000'XL
;oplot, x_sanders, y_sanders, psym=7, symsize = 1.2, color = '000000'XL
;legend, ['Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby', 'Sanders (COSMOS)'], PSYM=[1,2,4,5,7], $
;        box=0, colors = '000000'XL, textcolors = '000000'XL
;legend, ['Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby'], PSYM=[1,2,4,5], $
;        box=0, colors = '000000'XL, textcolors = '000000'XL
;im=tvrd()
;write_jpeg, 'irac_line_eachfield_36_ch1.jpeg',im


end
