Pro readweight_final_I1I2_CDFS, rar, decr, I1MI2, eI1MI2, I2tot, eI2tot, I1tot, eI1tot, weight, slicenum


  print, 'CDFS: Using z 3" mags & IRAC 3 pixel mags'
  

  filename = 'slice' + string(slicenum) + 'weights.dat'
  file = strcompress('I1I2sliceweightszf40/' + filename, /remove_all)
  print, file
  galtot = file_lines(file)
  
  print, 'NUMBER OF GALAXIES IN WEIGHT FILE:',galtot
  print, '---------------BEWARE-------------' 
  
  cnt = double(0) 
  rar = dblarr(galtot)
  decr = dblarr(galtot)
  zMI1 = dblarr(galtot) 
  ezMI1 = dblarr(galtot)
  I1tot = dblarr(galtot)
  eI1tot = dblarr(galtot)
  mag_auto = dblarr(galtot) 
  emag_auto = dblarr(galtot)
  weight = dblarr(galtot)
  readcol, file, rar, decr, I1MI2, eI1MI2, I2tot, eI2tot, I1tot, eI1tot, weight
  
  print, ' In readweight_final...'
  print, min(rar), max(rar), stdev(rar)
  print, min(decr), max(decr), stdev(decr)
  print, min(I2tot), max(I2tot), stdev(I2tot)
  print, min(weight), max(weight), stdev(weight)
  

 
;  readu, lun2, cnt
;  readu, lun2, rar
;  readu, lun2, decr
;  readu, lun2, zMI1
;  readu, lun2, ezMI1
;  readu, lun2, I1tot
;  readu, lun2, eI1tot
;  readu, lun2, mag_auto
;  readu, lun2, emag_auto
;  readu, lun2, weight
  
  
  return
end
