pro makeweight_I1I2
  
;This program makes weights for galaxies for each model colour slice
;These weights are stored in the /sliceweightszfxx/ directory
;========================If there is a problem i.e. weights are negative... need to use
;the GAUSS_REDSEQUENCE function for integration
  
  zch1color = 4.0

  read_zirac_finalcat_cdfs,rar, decr, apmag_176, eapmag_176, apmag_366, eapmag_366, mag_best, emag_best, ch1bf, c1ebap, c1_3pxapc, c1_3pxerr, ch2bf, c2ebap, c2_3pxapc, c2_3pxerr
  
  print, min(rar), max(rar), mean(rar)
  print, min(decr), max(decr), mean(decr)
  print, min(apmag_366), max(apmag_366), mean(apmag_366)
  print, min(ch1bf), max(ch1bf), mean(ch1bf)
  print, min(ch2bf), max(ch2bf), mean(ch2bf)
  print, min(c2_3pxapc), max(c2_3pxapc), mean(c2_3pxapc)

;New computation
  I1MI2 = c1_3pxapc - c2_3pxapc
  eI1MI2 = sqrt(c2_3pxerr^2 + c1_3pxerr^2)
  zMI1 = apmag_366 - c1_3pxapc
  ezMI1 = sqrt(eapmag_366^2 + c1_3pxerr^2)
  I2tot = ch2bf
  eI2tot = c2ebap
  I1tot = ch1bf
  eI1tot = c1ebap
  
;Read in red sequences from models
  readfullsequences_newmodel_I1I2, z, intercept, slope, xstar, ystar
  dispersion = dblarr(n_elements(z))
;bigz = where(z ge 1.5)
;midz = where(z ge 1.2 and z lt 1.5)
;littlez =  where(z lt 1.2)
;dispersion[bigz] = 0.15
;dispersion[littlez] = 0.075 
;dispersion[midz] = 0.10
  dispersion[*] = 0.075
  
  openw, lun6, 'I1I2sliceindexzf40.dat', /get_lun
  printf, lun6, '   z         Slice #      IRAC2star'
  printf, lun6, '-----------------------------------'
  
;56 is z = 1.02, 102 is z = 2.6
  startslice = 56
  endslice = 103
  
  for q = startslice, endslice do begin
     
;This is the red sequence fit by the clusterCMD and cmd pros
     redseq = fltarr(2)
     redseq[0] = intercept[q]
     redseq[1] = slope[q]
     
     xpnt = [10, 30]
     ypnt = [xpnt*redseq[1]+redseq[0]]
     if q eq 0 then window, 0, xsize = 600, ysize = 600, title = 'Colour Slice'
     plot, xpnt, ypnt, yrange = [intercept[q]-2.5, intercept[q]+2.0], ystyle = 1.0, xrange = [xstar[q] - 6.0, xstar[q] + 8.0], xstyle = 1.0
     oplot, xpnt, ypnt+dispersion[q], linestyle = 2.0
     oplot, xpnt, ypnt-dispersion[q], linestyle = 2.0
     gp = where(zMI1 gt zch1color) 
     oplot, I2tot[gp], I1MI2[gp], psym = 1.0
     
;Create the image with only galaxies in the colour slice
     print, 'Setting up density grid,   Slice: ', q
     cmdplot = [0,0]
     weight = dblarr(n_elements(rar))
     for x = 0L, n_elements(rar)-1 do begin
        
                                ;If the object is in the colour slice and has a z-I1 colors gt 4.0 - Compute weight
        if ( (I1MI2[x]) ge (redseq[1]*I2tot[x]+redseq[0]-dispersion[q])) and $
           ( (I1MI2[x]) le (redseq[1]*I2tot[x]+redseq[0]+dispersion[q])) and $ 
           (I2tot[x] le xstar[q] +4.0) and (zMI1[x] gt  zch1color) then begin
           
           val = (I1MI2[x])
           siggie = eI1MI2[x]
           openw, lun5, 'galaxyval.tmp', /get_lun
           printf, lun5, val, siggie
           free_lun, lun5
           !EXCEPT = 0
           
           weight[x] = qromb('gauss_redsequence', redseq[1]*I2tot[x]+redseq[0]-dispersion[q], redseq[1]*I2tot[x]+redseq[0]+dispersion[q],/double)
                                ;print, redseq[1]*I2tot[x]+redseq[0]-dispersion[q], redseq[1]*I2tot[x]+redseq[0]+dispersion[q]
           weight[x] = (weight[x]) / (siggie*sqrt(!pi))	
        endif
        
                                ;If the object not in the colour slice and less than 3 sig away - Compute weight
        if ( (I1MI2[x]) le (redseq[1]*I2tot[x]+redseq[0]-dispersion[q]) and $
             (I1MI2[x] + 1.5*eI1MI2[x]) ge (redseq[1]*I2tot[x]+redseq[0]-dispersion[q])) or $
           ( (I1MI2[x]) ge (redseq[1]*I2tot[x]+redseq[0]+dispersion[q])) and $ 
           ( (I1MI2[x] - 1.5*eI1MI2[x]) le (redseq[1]*I2tot[x]+redseq[0]+dispersion[q])) and $
           (I2tot[x] le xstar[q] +4.0) and (zMI1[x] gt zch1color) then begin
           
           val = (I1MI2[x])
           siggie = eI1MI2[x]
           openw, lun5, 'galaxyval.tmp', /get_lun
           printf, lun5, val, siggie
           free_lun, lun5
           !EXCEPT = 0
           
           weight[x] = qromb('gauss_redsequence', redseq[1]*I2tot[x]+redseq[0]-dispersion[q], redseq[1]*I2tot[x]+redseq[0]+dispersion[q],  /double)
           weight[x] = (weight[x]) / (siggie*sqrt(!pi))	
        endif
        
     endfor
     
;print, weight
     fname = strcompress('slice' + string(q) + 'weights.dat', /remove_all)
     openw, lun4, strcompress('I1I2sliceweightszf40/'+fname, /remove_all), /get_lun
     tempra = [rar[0], rar[0:n_elements(rar)-1]]
     for xx=0UL, n_elements(rar)-1, 1 do begin
        printf, lun4, rar[xx], decr[xx], I1MI2[xx], eI1MI2[xx], I2tot[xx], eI2tot[xx], I1tot[xx], eI1tot[xx], weight[xx], FORMAT='(9f15.9)'
     endfor
     free_lun, lun4
     printf, lun6, format = '(3(f12.5))', z[q], q, xstar[q]
     
  endfor
  free_lun, lun6
end
