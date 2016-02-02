pro npermag_function

min_mag = 18
max_mag = 24
bin_mag = 0.1
num_bins = (max_mag - min_mag)/bin_mag



;read in the fits file
file_name = 'xmmlss_5passband.fits'
directory = '/Users/andrew/originaldata/xmmlss/final_cats/'
stuff = strcompress(directory + file_name,/remove_all)
irac = mrdfits(stuff, 1)
ndetections = n_elements(irac.RA)


print, min(irac.ch1_best_flux-irac.ch2_best_flux, /nan), max(irac.ch1_best_flux-irac.ch2_best_flux, /nan)
print, min(irac.ch2_best_flux-irac.ch3_best_flux, /nan), max(irac.ch2_best_flux-irac.ch3_best_flux, /nan)
print, min(irac.ch3_best_flux-irac.ch4_best_flux, /nan), max(irac.ch3_best_flux-irac.ch4_best_flux, /nan)
print, min(irac.ch4_best_flux), max(irac.ch4_best_flux)


bins = indgen(num_bins)
bins = max_mag - bin_mag*bins
hist1 = fltarr(num_bins)
hist2 = hist1 & hist3 = hist1 & hist4 = hist1
print, bins
for k = 0, num_bins-1 do begin
	     	 hist1(k) = (size(where((irac.CH1_BEST_FLUX le bins(k)) AND (irac.CH1_BEST_FLUX gt bins(k)-bin_mag)),/DIMENSION) / xmmdeg)
		 hist2(k) = (size(where((irac.CH2_BEST_FLUX le bins(k)) AND (irac.CH2_BEST_FLUX gt bins(k)-bin_mag)),/DIMENSION) / xmmdeg)
		 hist3(k) = (size(where((irac.CH3_BEST_FLUX le bins(k)) AND (irac.CH3_BEST_FLUX gt bins(k)-bin_mag)),/DIMENSION) / xmmdeg)
		 hist4(k) = (size(where((irac.CH4_BEST_FLUX le bins(k)) AND (irac.CH4_BEST_FLUX gt bins(k)-bin_mag)),/DIMENSION) / xmmdeg)
endfor   
window, 0
plot, bins, hist1, /ylog, $
      xtitle='AB Magnitude', $
      ytitle='N mag^(-1) deg^(-2)'
;plot, xpoints, ypoints, /ylog, PSYM=1, /noerase
im=tvrd()
write_jpeg, 'test_npermag_ch1.jpeg',im

plot, bins, hist2, /ylog, $
      xtitle='AB Magnitude', $
      ytitle='N mag^(-1) deg^(-2)'
im=tvrd()
write_jpeg, 'test_npermag_ch2.jpeg',im

plot, bins, hist3, /ylog, $
      xtitle='AB Magnitude', $
      ytitle='N mag^(-1) deg^(-2)'
im=tvrd()
write_jpeg, 'test_npermag_ch3.jpeg',im

plot, bins, hist4, /ylog, $
      xtitle='AB Magnitude', $
      ytitle='N mag^(-1) deg^(-2)'
im=tvrd()
write_jpeg, 'test_npermag_ch4.jpeg',im

end
