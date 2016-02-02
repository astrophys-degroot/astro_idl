Pro readweight_final_z_LOCKMAN, rar, decr, zMI1, ezMI1, I1tot, eI1tot, mag_auto, emag_auto, weight, slicenum

  print, 'LOCKMAN: Using z 3" mags & IRAC 3 pixel mags'
 
  
  filename = strcompress('zsliceweightszf40/slice' + string(slicenum) + 'weights.dat', /remove_all) 
  galtot = file_lines(filename)
  print, filename
  
  print, 'NUMBER OF GALAXIES IN WEIGHT FILE:', galtot
  print, '---------------BEWARE-------------' 
  rar = dblarr(galtot) 
  decr = dblarr(galtot)
  zMI1 = dblarr(galtot) 
  ezMI1 = dblarr(galtot)
  I1tot = dblarr(galtot) 
  eI1tot = dblarr(galtot)
  mag_auto = dblarr(galtot) 
  emag_auto = dblarr(galtot)
  weight = dblarr(galtot)
  
  readcol, filename, rar, decr, zMI1, ezMI1, I1tot, eI1tot, mag_auto, emag_auto, weight
  print, min(rar), max(rar), stdev(rar)
  print, min(decr), max(decr), stdev(decr)
  print, min(mag_auto), max(mag_auto), stdev(mag_auto)
  return
end
