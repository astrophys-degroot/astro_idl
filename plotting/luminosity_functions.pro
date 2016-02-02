pro luminosity_functions

min_mag = 13
max_mag = 24
bin_mag = .25 ;0.1
num_bins = (max_mag - min_mag)/bin_mag
xmmdeg = 9.076 ; found using montecarlo.pro
cdfsdeg = 7.748 ; found using montecarlo.pro
es1deg = 6.798 ; found using montecarlo.pro
en1deg = 9.304 ; found using montecarlo.pro
en2deg = 4.191 ; found using montecarlo.pro
lockdeg = 11.12 ; found using montecarlo.pro

;;;;Test Data;;;;

;;;; IRAC ch1
x_bootes = [10.5, 11.0, 11.5, 12.0, 12.5, 13.0, 13.5, 14.0, 14.5, 15.0, 15.5, 16, 16.5, 17.0 ]
x_bootes = x_bootes + 2.79
y_bootes = [1.45, 1.55, 1.73, 1.84, 2.01, 2.22, 2.41, 2.60, 2.81, 3.05, 3.34, 3.62, 3.86, 4.05]
y_bootes = 10^(y_bootes)
x_egs = [15.5, 16.0, 16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0, 20.5]
x_egs = x_egs + 2.79
y_egs = [3.03, 3.46, 3.76, 3.98, 4.11, 4.23, 4.32, 4.39, 4.47, 4.53, 4.58]
y_egs = 10^(y_egs)
x_barmby = [18.25, 18.75, 19.25, 19.75, 20.25, 20.75, 21.25, 21.75, 22.25]
y_barmby = [800, 2500, 5000, 9000, 15000, 20000, 25000, 30000, 40000]
x_ashby = [11.25, 11.75, 12.25, 12.75, 13.25, 13.75, 14.25, 14.75, 15.25, 15.75, 16.25, 16.75, 17.25, 17.75, 18.25, 18.75, 19.25]
x_ashby = x_ashby + 2.79
y_ashby = [50, 70, 90, 150, 200, 350, 500, 1000, 1800, 3800, 7000, 10000, 15000, 20000, 30000, 35000, 40000]
x_sanders = [-0.1, 0.1, 0.3, 0.5, 0.7, 0.9, 1.1, 1.3, 1.5, 1.7, 1.9, 2.1, 2.3, 2.5, 2.7, 2.9, 3.1, 3.3, 3.5, 3.7]
x_sanders = -2.5*x_sanders + 23.9
y_sanders = [ 7.5, 7.4, 7.2, 7.0, 6.7, 6.5, 6.2, 5.9, 5.6, 5.3, 4.9, 4.4, 3.9, 3.4, 3.0, 2.6, 2.3, 1.8, 1.5, 1.1]
y_convert = [ 1.13, 1.58, 2.27, 3.35, 5.06, 7.76, 12.0, 18.8, 29.6, 46.6, 73.6, 116.4, 184.2, 291.7, 462.1, 732.1, 1159.9, 1838.2, 2913.0, 4616.6]
y_sanders = (10^(y_sanders)/1000)*y_convert



;;;; IRAC ch2
;x_bootes = [10.0, 10.5, 11.0, 11.5, 12.0, 12.5, 13.0, 13.5, 14.0, 14.5, 15.0, 15.5, 16, 16.5 ]
;x_bootes = x_bootes + 3.26
;y_bootes = [1.17, 1.39, 1.61, 1.70, 1.83, 2.02, 2.23, 2.46, 2.65, 2.89, 3.14, 3.43, 3.73, 3.96]
;y_bootes = 10^(y_bootes)
;x_egs = [15.5, 16.0, 16.5, 17.0, 17.5, 18, 18.5, 19, 19.5, 20 ]
;x_egs = x_egs + 3.26
;y_egs = [3.14, 3.54, 3.86, 4.08, 4.20, 4.31, 4.37, 4.43, 4.49, 4.55]
;y_egs = 10^(y_egs)
;x_barmby = [ 18.75, 19.25, 19.75, 20.25, 20.75, 21.25, 21.75, 22.25]
;y_barmby = [ 1500, 4000, 8500, 15000, 20000, 25000, 30000, 40000]
;x_ashby = [11.25, 11.75, 12.25, 12.75, 13.25, 13.75, 14.25, 14.75, 15.25, 15.75, 16.25, 16.75, 17.25, 17.75, 18.25, 18.75, 19.25]
;x_ashby = x_ashby + 3.26
;y_ashby = [50, 80, 100, 150, 250, 350, 800, 1500, 2500, 5000, 10000, 15000, 20000, 25000, 30000, 35000, 40000]

;;;; IRAC ch3
;x_bootes = [8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0, 12.5, 13.0, 13.5, 14.0, 14.5, 15.0, 15.5]
;x_bootes = x_bootes + 3.73
;y_bootes = [0.67, 0.60, 0.73, 1.06, 1.28, 1.46, 1.65, 1.84, 1.97, 2.18, 2.37, 2.60, 2.82, 3.05, 3.29, 3.48]
;y_bootes = 10^(y_bootes)
;x_egs = [15.0, 15.5, 16.0, 16.5, 17.0, 17.5, 18.0]
;x_egs = x_egs + 3.73
;y_egs = [3.05, 3.39, 3.77, 4.04, 4.21, 4.35, 4.44]
;y_egs = 10^(y_egs)
;x_barmby = [18.25, 18.75, 19.25, 19.75, 20.25, 20.75, 21.25, 21.75, 22.25]
;y_barmby = [300, 1000, 3000, 7000, 15000, 20000, 25000, 40000, 65000]
;x_ashby = [11.25, 11.75, 12.25, 12.75, 13.25, 13.75, 14.25, 14.75, 15.25, 15.75, 16.25, 16.75]
;x_ashby = x_ashby + 3.73
;y_ashby = [70, 100, 150, 250, 350, 600, 1000, 2000, 4500, 8000, 10500, 20000]

;;;; IRAC ch4
;x_bootes = [8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0, 12.5, 13.0, 13.5, 14.0, 14.5, 15.0]
;x_bootes = x_bootes + 4.40
;y_bootes = [0.65, 0.79, 0.90, 1.18, 1.52, 1.71, 1.92, 2.13, 2.34, 2.55, 2.77, 2.97, 3.16, 3.34, 3.47]
;y_bootes = 10^(y_bootes)
;x_egs = [13.0, 13.5, 14.0, 14.5, 15.0, 15.5, 16.0, 16.5, 17.0, 17.5]
;x_egs = x_egs + 4.40
;y_egs = [2.56, 2.80, 2.97, 3.20, 3.39, 3.66, 3.96, 4.18, 4.31, 4.40]
;y_egs  = 10^(y_egs)
;x_barmby = [17.75, 18.25, 18.75, 19.25, 19.75, 20.25, 20.75, 21.25, 21.75, 22.25]
;y_barmby = [400, 650, 1500, 2500, 5000, 10000, 15000, 25000, 40000, 75000]
;x_ashby = [11.25, 11.75, 12.25, 12.75, 13.25, 13.75, 14.25, 14.75, 15.25, 15.75, 16.25, 16.75]
;x_ashby = x_ashby + 4.40
;y_ashby = [100, 175, 250, 450, 700, 1250, 2000, 3500, 6000, 8000, 10500, 20000]



;read in the fits file
directory = '/Users/andrew/originaldata/xmmlss/irac/'
cdfs = '/Users/andrew/originaldata/cdfs/irac/cdfs_irac.fits'
xmmlss = '/Users/andrew/originaldata/xmmlss/irac/xmmlss_irac.fits'
es1 = '/Users/andrew/originaldata/elaiss1/irac/es1_irac.fits'
en1 = '/Users/andrew/originaldata/elaisn1/irac/en1_irac.fits'
en2 = '/Users/andrew/originaldata/elaisn2/irac/en2_irac.fits'
lockman = '/Users/andrew/originaldata/lockman/irac/lockman_irac.fits'

irac_es1 = mrdfits(es1, 1)
irac_es1_ch1_magcor_aper3_0 = irac_es1.ch1_magcor_aper3_0
irac_es1_ch1_magcor_aper3_6 = irac_es1.ch1_magcor_aper3_6
irac_es1_ch1_magcor_aper6_0 = irac_es1.ch1_magcor_aper6_0
irac_es1 = 0
irac_en1 = mrdfits(en1, 1)
irac_en1_ch1_magcor_aper3_0 = irac_en1.ch1_magcor_aper3_0
irac_en1_ch1_magcor_aper3_6 = irac_en1.ch1_magcor_aper3_6
irac_en1_ch1_magcor_aper6_0 = irac_en1.ch1_magcor_aper6_0
irac_en1 = 0
irac_en2 = mrdfits(en2, 1)
irac_en2_ch1_magcor_aper3_0 = irac_en2.ch1_magcor_aper3_0
irac_en2_ch1_magcor_aper3_6 = irac_en2.ch1_magcor_aper3_6
irac_en2_ch1_magcor_aper6_0 = irac_en2.ch1_magcor_aper6_0
irac_en2 = 0
irac_lockman = mrdfits(lockman, 1)
irac_lockman_ch1_magcor_aper3_0 = irac_lockman.ch1_magcor_aper3_0
irac_lockman_ch1_magcor_aper3_6 = irac_lockman.ch1_magcor_aper3_6
irac_lockman_ch1_magcor_aper6_0 = irac_lockman.ch1_magcor_aper6_0
irac_lockman = 0
irac_cdfs = mrdfits(cdfs, 1)
irac_cdfs_ch1_magcor_aper3_0 = irac_cdfs.ch1_magcor_aper3_0
irac_cdfs_ch1_magcor_aper3_6 = irac_cdfs.ch1_magcor_aper3_6
irac_cdfs_ch1_magcor_aper6_0 = irac_cdfs.ch1_magcor_aper6_0
irac_cdfs = 0
irac_xmmlss = mrdfits(xmmlss, 1)
irac_xmmlss_ch1_magcor_aper3_0 = irac_xmmlss.ch1_magcor_aper3_0
irac_xmmlss_ch1_magcor_aper3_6 = irac_xmmlss.ch1_magcor_aper3_6
irac_xmmlss_ch1_magcor_aper6_0 = irac_xmmlss.ch1_magcor_aper6_0
irac_xmmlss = 0



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
for k = 0, num_bins-1 do begin
	     	 hist1(k) = size( where( (irac_xmmlss_ch1_magcor_aper3_6 le bins(k)) AND (irac_xmmlss_ch1_magcor_aper3_6 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/xmmdeg)
	     	 hist2(k) = size( where( (irac_lockman_ch1_magcor_aper3_6 le bins(k)) AND (irac_lockman_ch1_magcor_aper3_6 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/lockdeg)
	     	 hist3(k) = size( where( (irac_en2_ch1_magcor_aper3_6 le bins(k)) AND (irac_en2_ch1_magcor_aper3_6 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/en2deg)
	     	 hist4(k) = size( where( (irac_es1_ch1_magcor_aper3_6 le bins(k)) AND (irac_es1_ch1_magcor_aper3_6 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/es1deg)
	     	 hist5(k) = size( where( (irac_en1_ch1_magcor_aper3_6 le bins(k)) AND (irac_en1_ch1_magcor_aper3_6 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/en1deg)
	     	 hist6(k) = size( where( (irac_cdfs_ch1_magcor_aper3_6 le bins(k)) AND (irac_cdfs_ch1_magcor_aper3_6 gt bins(k)-bin_mag) )  , /DIMENSION) * (1/bin_mag) * (1/cdfsdeg)
                 histbin = [hist1(k), hist2(k), hist3(k), hist4(k), hist5(k), hist6(k)]
                 hist(k) = mean(histbin)
                 histerr(k) = stddev(histbin)
endfor   

window = 0
plot, bins, hist, PSYM=6, $
      title = 'IRAC ch1 3.6" Aperture Magnitude' , $
      background = 'FFFFFF'XL, $
      color = '000000'XL, $
      xrange = [min_mag, max_mag], $
      xtitle = 'AB Magnitude', $
      ytitle = 'N mag^(-1) deg^(-2)', $
      /ylog , $
      charsize = 1.2, $
      charthick = 1.6
oploterror, bins, hist, histerr, PSYM=6, errcolor = '000000'XL
oplot, x_bootes, y_bootes, psym=1, symsize = 1.2, color = '000000'XL
oplot, x_egs, y_egs, psym = 2, symsize = 1.2, color = '000000'XL
oplot, x_barmby, y_barmby, psym = 4, symsize = 1.2, color = '000000'XL
oplot, x_ashby, y_ashby, psym = 5, symsize = 1.2, color = '000000'XL
oplot, x_sanders, y_sanders, psym=7, symsize = 1.2, color = '000000'XL
legend, ['This Work', 'Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby', 'Sanders (COSMOS)'], PSYM=[6,1,2,4,5,7], $
        box=0, colors = '000000'XL, textcolors = '000000'XL
;legend, ['This Work', 'Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby'], PSYM=[6,1,2,4,5], $
;        box=0, colors = '000000'XL, textcolors = '000000'XL
im=tvrd()
write_jpeg, 'irac_points_averageallfields_36_ch1.jpeg', im

window, 1
plot, bins, hist, $
      title = 'IRAC ch1 3.6" Aperture Magnitude' , $
      background = 'FFFFFF'XL, $
      color = '000000'XL, $
      xrange = [min_mag, max_mag], $
      xtitle = 'AB Magnitude', $
      ytitle = 'N mag^(-1) deg^(-2)', $
      /ylog , $
      charsize = 1.2, $
      charthick = 1.6
oplot, x_bootes, y_bootes, psym=1, symsize = 1.2, color = '000000'XL
oplot, x_egs, y_egs, psym = 2, symsize = 1.2, color = '000000'XL
oplot, x_barmby, y_barmby, psym = 4, symsize = 1.2, color = '000000'XL
oplot, x_ashby, y_ashby, psym = 5, symsize = 1.2, color = '000000'XL
oplot, x_sanders, y_sanders, psym=7, symsize = 1.2, color = '000000'XL
legend, ['Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby', 'Sanders (COSMOS)'], PSYM=[1,2,4,5,7], $
        box=0, colors = '000000'XL, textcolors = '000000'XL
;legend, ['Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby'], PSYM=[1,2,4,5], $
;        box=0, colors = '000000'XL, textcolors = '000000'XL
im=tvrd()
write_jpeg, 'irac_line_avereageallfields_36_ch1.jpeg',im

window, 2
plot, bins, hist1, $
      title = 'IRAC ch1 3.6" Aperture Magnitude' , $
      background = 'FFFFFF'XL, $
      color = '000000'XL, $
      xrange = [min_mag, max_mag], $
      xtitle = 'AB Magnitude', $
      ytitle = 'N mag^(-1) deg^(-2)', $
      /ylog , $
      charsize = 1.2, $
      charthick = 1.6
oplot, bins, hist2, color = '000000'XL
oplot, bins, hist3, color = '000000'XL
oplot, bins, hist4, color = '000000'XL
oplot, bins, hist5, color = '000000'XL
oplot, bins, hist6, color = '000000'XL
oplot, x_bootes, y_bootes, psym=1, symsize = 1.2, color = '000000'XL
oplot, x_egs, y_egs, psym = 2, symsize = 1.2, color = '000000'XL
oplot, x_barmby, y_barmby, psym = 4, symsize = 1.2, color = '000000'XL
oplot, x_ashby, y_ashby, psym = 5, symsize = 1.2, color = '000000'XL
oplot, x_sanders, y_sanders, psym=7, symsize = 1.2, color = '000000'XL
legend, ['Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby', 'Sanders (COSMOS)'], PSYM=[1,2,4,5,7], $
        box=0, colors = '000000'XL, textcolors = '000000'XL
;legend, ['Bootes', 'EGS', 'Barmby (AEGIS)', 'Ashby'], PSYM=[1,2,4,5], $
;        box=0, colors = '000000'XL, textcolors = '000000'XL
im=tvrd()
write_jpeg, 'irac_line_eachfield_36_ch1.jpeg',im


end
