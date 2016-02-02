function histogram_2d, xvalues, yvalues, MINX=minx, MAXX=maxx, MINY=miny, MAXY=maxy, BINX=binx, BINY=biny


;;;;sets values for plot
if keyword_set(MINX) then min_x = minx[0] else min_x = min(xvalues) ;sets new value
if keyword_set(MAXX) then max_x = maxx[0] else max_x = max(xvalues) ;sets new value
if keyword_set(MINY) then min_y = miny[0] else min_y = min(yvalues) ;sets new value
if keyword_set(MAXY) then max_y = maxy[0] else max_y = max(yvalues) ;sets new value
if keyword_set(BINX) then bin_x = binx[0] else bin_x = 0.5
if keyword_set(BINY) then bin_y = biny[0] else bin_y = 0.5


xnum_bins = (max_x - min_x)/bin_x
xbins = indgen(xnum_bins)
xbins = max_x - bin_x*xbins
;print, xbins

ynum_bins = (max_y - min_y)/bin_y
ybins = indgen(ynum_bins)
ybins = max_y - bin_y*ybins
;print, ybins

hist = fltarr(xnum_bins, ynum_bins)
;help, hist

for ii=0, xnum_bins-1, 1 do begin
   for jj=0, ynum_bins-1, 1 do begin
      find = where( (xvalues le xbins[ii]) AND (xvalues gt xbins[ii]-bin_x) AND $
                     (yvalues le ybins[jj]) AND (yvalues gt ybins[jj]-bin_y), N_FIND )
      hist[ii,jj] = N_FIND
   endfor
endfor   


;window, 0
;plot, bins, hist1, /ylog, $
;      xtitle='AB Magnitude', $
;      ytitle='N mag^(-1) deg^(-2)'
;plot, xpoints, ypoints, /ylog, PSYM=1, /noerase
;im=tvrd()
;write_jpeg, 'test_npermag_ch1.jpeg',im

return, hist
end


pro testing3

x = randomu(54, 10000)
y = randomu(19, 15000)

x=x^1.3
y=y^0.4
print, min(x), max(x), mean(x)
print, min(y), max(y), mean(y)

myarray = histogram_2d(x,y, BINX=0.01, BINY=0.01, MINX=0.0, MAXX=1.0, MINY=0.0, MAXY=1.0)
help, myarray

contour, myarray, $
         1.0*findgen(99), 1.0*findgen(98), $
         background = 'FFFFFF'XL, $
         color = '000000'XL, $
         title='Color-Magnitude Diagram', $
         xtitle='IRAC ch1 [AB mag]', $
         ytitle='z - ch1 [mag]', $
         /fill, nlevels=10, $
         levels=findgen(10)*0.1
;         c_colors = ['FFFFFF'XL, '110000'XL, '220000'XL, '330000'XL, '440000'XL, $
;                     '550000'XL, '660000'XL, '770000'XL, '880000'XL, 'FF0000'XL]

;         xrange=[0.0,1.0], $
;         yrange=[0.0,1.0]


;contour, hist_2d(x, y, bin1=0.02, bin2=0.02, min1=0.0, min2=0.0, max1=1.0, max2=1.0), $
;         xstyle=1, ystyle=1, $
;         xthick=1, ythick=1, charthick=1, $

         
         

end
