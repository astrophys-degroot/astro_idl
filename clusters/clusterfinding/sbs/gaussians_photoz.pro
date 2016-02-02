;========================================================================================================================
FUNCTION gaussian_photoz, p
  
  readcol, 'galaxyval.tmp', photoz, photozerr, FORMAT='(D,D)', SILENT=1 ;read in values
  
  photoz = photoz[0]            ;we need the number NOT an array
  photozerr = photozerr[0]      ;we need the number NOT an array
  
  RETURN, exp( (-1.0*((p-photoz)^2))/(2.0*photozerr^2) ) ;return expression
END
;========================================================================================================================


;========================================================================================================================
PRO gaussians_photoz, verbose

  IF verbose ge 2 THEN print, ' Compile gaussian for photo-z weights.'

END
;========================================================================================================================
