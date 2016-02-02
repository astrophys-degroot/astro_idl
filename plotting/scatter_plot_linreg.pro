pro scatter_plot_linreg


;;;This section defines the objects
directory = '/Users/andrew/originaldata/xmmlss/z_ctio/' ;defines the directory with the catalogues
fits = strcompress(directory + 'xmm_ctio_all_scaled_cleaned_matched.fits', /remove_all) ;defines the fits file (catalogue)
cat_1 = mrdfits(fits, 1) ;reads in catalogue
;help, cat_1, /struc


;;; This section preps the objects
good_ob = where(cat_1.mag_auto_1 GT 16.0 AND cat_1.mag_auto_1 LE 19.5 AND cat_1.mag_diff_auto GT 0.0 $
                AND cat_1.mag_diff_auto LT 3.0, ngood_ob)       ;determines good observations
x = cat_1[good_ob].mag_auto_1
xerr = cat_1[good_ob].magerr_auto_1
y = cat_1[good_ob].mag_diff_auto
yerr = (cat_1[good_ob].magerr_auto_1^2 + cat_1[good_ob].magerr_auto_2^2) ^0.5

print, 'Average x value: ', mean(x)
print, 'Average x error: ', mean(cat_1[good_ob].magerr_auto_1)
print, 'Average y value: ', mean(y)
print, 'Average y error: ', mean(yerr)

;;; This section calculates on the objects
;med_value = median(cat_1[good_ob].mag_diff_auto)
;print, "Median difference in magnitudes: ", med_value
;sixlin, x, y, y_int, y_interr, slope, slope_err
;print, "Y-intercepts for 6 different linear fits: ", y_int
;print, "Errors in y-intercepts for 6 different linear fits: ", y_interr
;print, "Slope values for 6 different linear fits: ", slope
;print, "Error in slope values for 6 different linear fits: ", slope_err


;fitting = linfit(x, y, chisq=chistat, measure_errors=yerr, prob=probability, sigma=uncertainty)
;print, fitting
;print, chistat
;print, probability
;print, uncertainty


;linmix_err, x, y, linmix_results, xsig=xerr, ysig=yerr
;print, 'Mean of intercept parameter: ', mean(linmix_results.alpha)
;print, '1sigma deviation on intercept: ', stddev(linmix_results.alpha)
;print, 'Mean of slope parameter ', mean(linmix_results.beta)
;print, '1sigma deviation on slope: ', stddev(linmix_results.beta)


fitexy, x, y, intercept, slope, x_sig=xerr, y_sig=yerr, ab_dev
print, intercept
print, slope
print, ab_dev


;;;This section calculates chi squared for a linear fit of zero slope
obs_freq = dblarr(ngood_ob)
obs_freq[*] = cat_1[good_ob[*]].mag_diff_auto
;help, obs_freq
;print, mean(obs_freq), stddev(obs_freq)
exp_freq = dblarr(ngood_ob)
for counter = 1.35, 1.60, 0.005 do begin
   exp_freq[*] = counter
   residual = obs_freq - exp_freq
   chi_result = xsq_test(obs_freq, exp_freq)
   ;print, counter, chi_result


;;; This section creates the plot
window = 0
plot, x, y, PSYM=1,  $
      title = 'XMM-LSS Magnitude Difference After CTIO scaling: Auto Mag' , $
      background = 'FFFFFF'XL, $
      color = '000000'XL, $
      xrange = [14, 26], $
      yrange = [-1.5, 4.5], $
      ;/ylog , $
      xtitle = 'CFHT mag_auto', $
      ytitle = 'CFHT mag_auto - CTIO mag_auto', $
      charsize = 0.8, $
      charthick = 1.0
hline, [counter], /Data,  color = '000000'XL

;oplot, x_bootes, y_bootes, psym=1, symsize = 1.2, color = '000000'XL
;legend, ['This Work', 'Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby', 'Sanders (COSMOS)'], PSYM=[6,1,2,4,5,7], $
;        box=0, colors = '000000'XL, textcolors = '000000'XL

endfor 


;im=tvrd()
;write_jpeg, '/Users/andrew/originaldata/plots/mag_diff_auto_scaled.jpeg', im





end
