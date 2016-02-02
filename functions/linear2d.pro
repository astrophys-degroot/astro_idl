;========================================================================================================================
FUNCTION LINEAR2D, xdata, cs

  ON_ERROR, 1 
  
  if n_params() lt 2 then begin
     print, 'SYNTAX : value = linear2d(data, coefficients)'
     return, -1
  endif
  
  if n_elements(cs) ne 3 then begin
     print, 'The array of coefficients, cs must have exactly 3 elements!'
     return, -1
  endif

  xout = xdata
  sizedata = size(xout)                 ;find dimensions
  ys = indgen(sizedata[2])              ;create y pos array
  for xs=0UL, sizedata[1]-1, 1 do begin ;loop over x pos
     col = cs[0] + cs[1]*xs + cs[2]*ys  ;cont next line
     xout[xs,*] = col                   ;store values
  endfor                                ;end loop over x pos
  
  RETURN, xout                  ;return linear2d array
END
;========================================================================================================================

