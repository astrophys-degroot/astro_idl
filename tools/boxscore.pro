;==============================================================================
pro boxscore, zarray, VALUES=values, QUIET=quiet


  chk = where(zarray NE zarray, COMPLEMENT=good)
  zmin = min(zarray[good])
  zmax = max(zarray[good])
  zmean = mean(zarray[good])
  zstdev = stdev(zarray[good])
  
  IF NOT keyword_set(QUIET) THEN BEGIN
     print, '   Size of array: ', size(zarray[good])
     print, '   Average of array: ', zmean
     print, '   Std Dev of array: ', zstdev
     print, '   Minimum of array: ', zmin
     print, '   Maximum of array: ', zmax
  ENDIF
  
  values = [zmean, zstdev, zmin, zmax]
  
  RETURN
END
;==============================================================================
