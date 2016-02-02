pro scatter_plot


  xs = indgen(1000) / 1000.0
  ys = indgen(1000)*1.0
  norm = int_tabulated(xs, ys)
  ys = ys / norm
  
  window, 0, XPOS=500, YPOS=250, XSIZE=600, YSIZE=600
  plot, xs, ys, PSYM=10,  $
        background = 'FFFFFF'XL, $
        color = '000000'XL, $
        xtitle = 'fraction (f)', $
        ytitle = 'Probability', $
        YRANGE = [0.0,2.5], $
        charsize = 1.4 , $
        charthick = 1.6

  ys_two = 2.0 - ys
  window, 1, XPOS=550, YPOS=200, XSIZE=600, YSIZE=600
  plot, xs, ys_two, PSYM=10,  $
        background = 'FFFFFF'XL, $
        color = '000000'XL, $
        xtitle = 'fraction (f)', $
        ytitle = 'Probability', $
        YRANGE = [0.0,2.5], $
        charsize = 1.4 , $
        charthick = 1.6
  
  window, 2, XPOS=600, YPOS=150, XSIZE=600, YSIZE=600
  ys_tot = ys * ys_two
  plot, xs, ys_tot, PSYM=10,  $
        background = 'FFFFFF'XL, $
        color = '000000'XL, $
        xtitle = 'fraction (f)', $
        ytitle = 'Probability', $
        YRANGE = [0.0,2.5], $
        charsize = 1.4 , $
        charthick = 1.6       


  set_plot, 'ps'
  device, FILENAME='fractions.ps'
  multiplot, [1,3], YGAP=0.0, /DOYAXIS
  plot, xs, ys, PSYM=10,  $
        background = 'FFFFFF'XL, $
        color = '000000'XL, $
        ytitle = 'Probability', $
        YRANGE = [0.0,2.4], $
        charsize = 1.4 , $
        charthick = 1.6
  legend, 'Binary=yes', color = '000000'XL, BOX=0
  multiplot, YGAP=0.0, /DOYAXIS
  plot, xs, ys_two, PSYM=10,  $
        background = 'FFFFFF'XL, $
        color = '000000'XL, $
        ytitle = 'Probability', $
        YRANGE = [0.0,2.4], $
        charsize = 1.4 , $
        charthick = 1.6
  legend, 'Binary=no', color = '000000'XL, BOX=0
  multiplot, YGAP=0.0, /DOYAXIS
  plot, xs, ys_tot, PSYM=10,  $
        background = 'FFFFFF'XL, $
        color = '000000'XL, $
        xtitle = 'fraction (f)', $
        ytitle = 'Probability', $
        YRANGE = [0.0,2.4], $
        charsize = 1.4 , $
        charthick = 1.6
  legend, '1 yes and 1 no', color = '000000'XL, BOX=0
  device, /CLOSE
  set_plot, 'x'
  
  


end
