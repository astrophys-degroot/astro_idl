;========================================================================================================================
function growth_curve, file1, file2, MINRAD=minrad, MAXRAD=maxrad, STEPRAD=steprad, FRACCHANGE=fracchange, $
                       MATCHALLOW=matchallow, ARCSEC=arcsec, UNIQUES=uniques, WRITE=write
  
  if keyword_set(MINRAD) then minrad = minrad[0] else minrad = 0.4                  ;sets new value
  if keyword_set(MAXRAD) then maxrad = maxrad[0] else maxrad = 5.0                  ;sets new value
  if keyword_set(STEPRAD) then steprad = steprad[0] else steprad = 0.2              ;sets new value
  if keyword_set(FRACCHANGE) then fracchange = fracchange[0] else fracchange = 0.10 ;sets new value
  if keyword_set(MATCHALLOW) then matchallow = matchallow[0] else matchallow = 3    ;sets new value
  if keyword_set(ARCSEC) then begin                                                 ;checks ARCSEC keyword
     minrad = minrad / 3600.0                                                       ;converts to deg
     maxrad = maxrad / 3600.0                                                       ;converts to deg
     steprad = steprad / 3600.0                                                     ;converts to deg
  endif                                                                             ;end check ARCSEC keyword
  
  
  window, 0                                                                         ;sets plot window
  radii = [0]                                                                       ;creates array
  matches = [0]                                                                     ;initializes array
  for radius=minrad, maxrad, steprad do begin                                       ;loop radius increment 
     close_match_radec, file1.RA, file1.DEC, file2.RA, file2.DEC, $                 ;cont next line
                        file1_match, file2_match, radius, matchallow                ;matches by RA, Dec
     radii = [radii,radius]                                                         ;updates radii array
     if keyword_set(UNIQUES) then nfound = n_elements(db_or(file1_match)) else $    ;finds # unique matches
        nfound = n_elements(file1_match)                                            ;finds # of matches
     matches = [matches,nfound]                                                     ;updates array
     xvalues = radii*3600.0                                                         ;finds xvalues
     yvalues = matches                                                              ;finds yvalues
     plot, xvalues, yvalues, PSYM=2, $                                              ;plots file1 ra, dec 
           background='FFFFFF'XL, $                                                 ;plot option
           color='000000'XL, $                                                      ;plot option
           xrange=[min(xvalues),max(xvalues)], $                                    ;plot option
           yrange=[0,max(yvalues)], $                                               ;plot option
           title='Percentage of Matches for Given Search Radius', $                 ;plot option
           xtitle='Search Radius [arcsec]', $                                       ;plot option
           ytitle='Frequency'                                                       ;plot option
     if keyword_set(WRITE) then begin                                               ;check WRITE keyword
        im=tvrd()                                                                   ;collects image
        write_jpeg, 'curve_of_growth.jpeg', im                                      ;writes image
     endif                                                                          ;end check WRITE keyword
  endfor                                                                            ;end loop radius increment
  
  ii=1                                                                          ;initial value
  counter = 0                                                                   ;initial value
  notfound ='n'                                                                 ;initial value
  while counter lt 3 do begin                                                   ;begin while on counter
     if ii lt n_elements(matches)-1 then begin                                  ;check # elements
        per_change = float(matches[ii]-matches[ii-1])/float(matches[ii-1])      ;finds % change
        if per_change lt fracchange then counter = counter + 1 else counter = 0 ;updates counter
        ii = ii + 1                                                             ;increment 
     endif else begin                                                           ;end check # elements
        print, ' Non-convergent matching radius!!'                              ;prints info
        print, ' Setting matching radius to nominal value of 3".0'              ;prints info
        notfound = 'y'                                                          ;sets value
     endelse                                                                    ;ends alternative 
  endwhile                                                                      ;end while on counter
  print, ' The optimum search radius found is:', radii[ii-1]*3600.0, '[arcsec]' ;print info
  print, ' This radius will be used for the remaining matching!!'               ;print info
  if notfound eq 'n' then radius = radii[ii-1]                                  ;sets matching radius
  if notfound eq 'y' then radius = 3.0 / 3600.0                                 ;sets matching radius
  
  return, radius                ;returns determined radius value
end                             ;ends growth_curve function
;========================================================================================================================
