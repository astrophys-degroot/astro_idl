pro completeness_function

min_mag = 18
max_mag = 27
bin_mag = 0.1
num_bins = (max_mag - min_mag)/bin_mag

;read in the fits file
file_name = 'xmmlss_5passband.fits'
directory = '/Users/andrew/originaldata/xmmlss/final_cats/'
stuff = strcompress(directory + file_name,/remove_all)
irac = mrdfits(stuff, 1)
ndetections = n_elements(irac.RA)
print, ndetections

bins = indgen(num_bins)
bins = max_mag - bin_mag*bins
hist1 = fltarr(num_bins)
hist2 = hist1 & hist3 = hist1 & hist4 = hist1
print, bins
for k = 0, num_bins-1 do begin
	     	 hist1(k) = size(where((irac.CH1_BEST_FLUX gt bins(k)-bin_mag)),/DIMENSION)
		 hist2(k) = size(where((irac.CH2_BEST_FLUX gt bins(k)-bin_mag)),/DIMENSION)
		 hist3(k) = size(where((irac.CH3_BEST_FLUX gt bins(k)-bin_mag)),/DIMENSION)
		 hist4(k) = size(where((irac.CH4_BEST_FLUX gt bins(k)-bin_mag)),/DIMENSION)
endfor   

plot, bins, hist1  ;  xrange=[max_mag,min_mag]
im=tvrd()
write_jpeg, 'test_completeness_ch1.jpeg',im

plot, bins, hist2
im=tvrd()
write_jpeg, 'test_completeness_ch2.jpeg',im

plot, bins, hist3
im=tvrd()
write_jpeg, 'test_completeness_ch3.jpeg',im

plot, bins, hist4
im=tvrd()
write_jpeg, 'test_completeness_ch4.jpeg',im

end
