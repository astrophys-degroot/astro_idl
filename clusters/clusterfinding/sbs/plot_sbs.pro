;========================================================================================================================
function plot_kernelpowerlaw, zs
  
  kersize = fltarr(n_elements(zs))                                                 ;create array
  for aa=0L, n_elements(zs)-1, 1 do begin                                          ;begin loop over redshifts
     if zs[aa] lt 1.5 then kersize[aa] = floor((714.0*(zs[aa]-0.8)+1000.0)) else $ ;find kernel size
        kersize[aa] = floor((1500.0*(zs[aa]-1.5)+1500.0))                          ;find kernel size
  endfor                                                                           ;end loop over redshifts
  
  set_plot, 'ps'
  device, FILENAME='kernelpowerlaw.ps'
  plot, zs, kersize, PSYM=1, $
        CHARSIZE = 1.4, $
        TITLE='Convolution Kernel Size for SBS Cluster Finding', $
        XTITLE='Redshift', $
        YTITLE='Kernel Size (Radius) [Mpc]'
  device, /CLOSE
  set_plot, 'x'
  
  pcheck = 1
  return, pcheck
end
;========================================================================================================================



;========================================================================================================================
pro plot_sbs


  zs=indgen(200)
  zs = zs*0.01+0.8
  result = plot_kernelpowerlaw(zs)

end
;========================================================================================================================



