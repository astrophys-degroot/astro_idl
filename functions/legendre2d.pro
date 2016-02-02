;========================================================================================================================
FUNCTION legendre2D, xdata, cs

  ON_ERROR, 1 
  
  if n_params() lt 2 then begin
     print, 'SYNTAX : value = legendre2d(data, coefficients)'
     return, -1
  endif
  
  if n_elements(cs) ne 11 then begin
     print, 'The array of coefficients, cs must have exactly 11 elements!'
     return, -1
  endif

  xout = xdata
  sizedata = size(xout)                                                                    ;find dimensions
  ys = indgen(sizedata[2])                                                                 ;create y pos array
  for xs=0UL, sizedata[1]-1, 1 do begin                                                    ;loop over x pos
     col = cs[0] + cs[1]*xs + cs[2]*ys + $                                                 ;cont next line
           cs[3]*(1.5*xs^2-0.5) + cs[4]*(1.5*ys^2-0.5) + $                                 ;cont next line
           cs[5]*(2.5*xs^3-1.5*xs) + cs[6]*(2.5*ys^3-1.5*ys) + $                           ;cont next line
           cs[7]*(4.375*xs^4-3.75*xs^2+0.375) + cs[8]*(4.375*ys^4-3.75*ys^2+0.375) + $     ;cont next line
           cs[9]*(7.875*xs^5-8.75*xs^3+1.875*xs) + cs[10]*(7.875*ys^5-8.75*ys^3+1.875*ys)  ;find cubic2d values
     xout[xs,*] = col                                                                      ;store values
  endfor                                                                                   ;end loop over x pos
  
  RETURN, xout                  ;return cubic2d array
END
;========================================================================================================================

