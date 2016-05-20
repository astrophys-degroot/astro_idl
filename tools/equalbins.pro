;====================================================================================================
FUNCTION equalbins, xarray, REVERSE=reverse, NINBIN=ninbin, ABSORBLAST=absorblast, INCENDS=incends

  IF keyword_set(REVERSE) THEN reverse = fix(reverse[0]) ELSE reverse = 1 ;set default
  IF keyword_set(NINBIN) THEN ninbin = fix(ninbin[0]) ELSE ninbin = 20    ;set default
  
  nxarray = n_elements(xarray)                    ;find number of elements
  xarray = xarray[bsort(xarray, REVERSE=reverse)] ;sort in descending order

  cnt = 1                                                                                      ;start counter
  iter = 1                                                                                     ;set flag
  bins = []                                                                                    ;start array
  WHILE (iter EQ 1) DO BEGIN                                                                   ;start working
     IF (cnt*ninbin+1) LT nxarray THEN BEGIN                                                   ;if we dont happend to catch the last element
        newbin = (xarray[cnt*ninbin] + xarray[cnt*ninbin+1]) * 0.5                             ;midpoints at bin boundaries
     ENDIF ELSE BEGIN                                                                          ;end not last element
        newbin = abs(xarray[cnt*ninbin-2] - xarray[cnt*ninbin-1]) * 0.5 + xarray[cnt*ninbin-1] ;go down an index for buffer size
     ENDELSE                                                                                   ;end last element
     bins = [bins, newbin]                                                                     ;add new value
     IF (((cnt+1)*ninbin) GT nxarray) THEN iter = 0                                            ;
     cnt = cnt + 1                                                                             ;
  ENDWHILE                                                                                     ;end working

  IF keyword_set(ABSORBLAST) THEN bins = bins[0:n_elements(bins)-fix(absorblast[0])-1] ;if you want to meld last bins together

  IF keyword_set(INCENDS) THEN bins = [xarray[0], bins, xarray[-1]] ;include end points if desired
  
  RETURN, bins
END
;====================================================================================================



;====================================================================================================
PRO call_equalbins


  data = mrdfits('kemclass_pz_specz_v0-4-3.fits', 1, hdr)

  chk = where(data.an_shigap EQ 1)
  data = data[chk]
  masses = data.ph_lmass
  


  bins = equalbins(masses, /INCENDS)
  print, bins
  
END
;====================================================================================================
