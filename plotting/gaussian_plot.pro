pro gaussian_plot


directory = '/Users/andrew/originaldata/xmmlss/irac/sky_error/' ;defines the directory with the catalogues
fits_in = strcompress(directory + 'sky_cat_beta.fits', /remove_all) ;defines the fits file (catalogue)
cat = mrdfits(fits_in, 1) ;reads in catalogue
help, cat, /struc


min_mag = 15
max_mag = 40
bin_mag = 0.25
num_bins = (max_mag - min_mag)/bin_mag
guess = [1E4, 20, .5, 0, 1, 1]

bins = indgen(num_bins)
bins = max_mag - bin_mag*bins
hist1 = fltarr(num_bins)
hist2 = hist1 
hist3 = hist1 
hist4 = hist1
hist5 = hist1
hist6 = hist1
for k = 0, num_bins-1 do begin
	     	 hist1(k) = size( where( (cat.delta le bins(k)) AND (cat.delta gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag)
	     	 hist2(k) = size( where( (cat.col7 le bins(k)) AND (cat.col7 gt bins(k)-bin_mag) )  , /DIMENSION)
	     	 hist3(k) = size( where( (cat.col8 le bins(k)) AND (cat.col8 gt bins(k)-bin_mag) )  , /DIMENSION)
	     	 hist4(k) = size( where( (cat.col12 le bins(k)) AND (cat.col12 gt bins(k)-bin_mag) )  , /DIMENSION)
	     	 hist5(k) = size( where( (cat.col14 le bins(k)) AND (cat.col14 gt bins(k)-bin_mag) )  , /DIMENSION)
endfor   


Print, '1.76 arcsec aperture ' 
fit1 = gaussfit(bins, hist1, A, chisq=chisq, estimates=guess, NTERMS=6, sigma=sigma)
print, 'coefficients of fit: ', A
print, 'chi sq fit value: ', chisq
print, '1sigma std dev: ', sigma
print, ' '

Print, '3.66 arcsec aperture ' 
fit2 = gaussfit(bins, hist2, A, chisq=chisq, estimates=guess, NTERMS=6, sigma=sigma)
print, 'coefficients of fit: ', A
print, 'chi sq fit value: ', chisq
print, '1sigma std dev: ', sigma
print, ' '


Print, '6.10 arcsec aperture ' 
fit3 = gaussfit(bins, hist3, A, chisq=chisq, estimates=guess, NTERMS=6, sigma=sigma)
print, 'coefficients of fit: ', A
print, 'chi sq fit value: ', chisq
print, '1sigma std dev: ', sigma
print, ' '

Print, 'Auto arcsec aperture ' 
fit4 = gaussfit(bins, hist4, A, chisq=chisq, estimates=guess, NTERMS=6, sigma=sigma)
print, 'coefficients of fit: ', A
print, 'chi sq fit value: ', chisq
print, '1sigma std dev: ', sigma
print, ' '

Print, 'Best arcsec aperture ' 
fit5 = gaussfit(bins, hist5, A, chisq=chisq, estimates=guess, NTERMS=6, sigma=sigma)
print, 'coefficients of fit: ', A
print, 'chi sq fit value: ', chisq
print, '1sigma std dev: ', sigma
print, ' '


!P.MULTI = [0,2,2]     ; set up 2x2 plot window  
PLOT, bins, hist1, PSYM=1, $
      title = 'XMM-LSS Sky Measurement Distribution' , $
      background = 'FFFFFF'XL, $
      color = '000000'XL, $
      xrange = [min_mag, max_mag], $
      ;yrange = [-1.5, 4.5], $
      ;/ylog , $
      xtitle = 'Sky Measure 1.76 [AB mag]', $
      ytitle = 'Frequency', $
      charsize = 0.8, $
      charthick = 1.0
OPLOT, bins, fit1, THICK=3, color='000000'XL  

;PLOT, bins, hist2, PSYM=1, $
;      title = 'XMM-LSS Sky Measurement Distribution' , $
;      background = 'FFFFFF'XL, $
;      color = '000000'XL, $
;      xrange = [min_mag, max_mag], $
;      ;yrange = [-1.5, 4.5], $
;      ;/ylog , $
;      xtitle = 'Sky Measure 3.66 [AB mag]', $
;      ytitle = 'Frequency', $
;      charsize = 0.8, $
;      charthick = 1.0
;OPLOT, bins, fit2, THICK=3, color='000000'XL  

;PLOT, bins, hist4, PSYM=1, $
;      title = 'XMM-LSS Sky Measurement Distribution' , $
;      background = 'FFFFFF'XL, $
;      color = '000000'XL, $
;      xrange = [min_mag, max_mag], $
;      ;yrange = [-1.5, 4.5], $
;      ;/ylog , $
;      xtitle = 'Sky Measure Auto [AB mag]', $
;      ytitle = 'Frequency', $
;      charsize = 0.8, $
;      charthick = 1.0
;OPLOT, bins, fit4, THICK=3, color='000000'XL  

;PLOT, bins, hist5, PSYM=1, $
;      title = 'XMM-LSS Sky Measurement Distribution' , $
;      background = 'FFFFFF'XL, $
;      color = '000000'XL, $
;      xrange = [min_mag, max_mag], $
      ;yrange = [-1.5, 4.5], $
      ;/ylog , $
;      xtitle = 'Sky Measure Best [AB mag]', $
;      ytitle = 'Frequency', $
;      charsize = 0.8, $
;      charthick = 1.0
;OPLOT, bins, fit5, THICK=3, color='000000'XL  

end
