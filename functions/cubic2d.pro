;========================================================================================================================
FUNCTION CUBIC2D, xdata, cs

  ON_ERROR, 1 
  
  if n_params() lt 2 then begin
     print, 'SYNTAX : value = cubic2d(data, coefficients)'
     return, -1
  endif
  
  if n_elements(cs) ne 10 then begin
     print, 'The array of coefficients, cs must have exactly 10 elements!'
     return, -1
  endif

  xout = xdata                                                     ;create copy 
  sizedata = size(xout)                                            ;find dimensions
  ys = indgen(sizedata[2])                                         ;create y pos array
  for xs=0UL, sizedata[1]-1, 1 do begin                            ;loop over x pos
     col = cs[0] + cs[1]*xs + cs[2]*ys + $                         ;cont next line
           cs[3]*xs^2 + cs[4]*ys^2 + cs[5]*xs*ys + $               ;cont next line
           cs[6]*xs^3 + cs[7]*ys^3 + cs[8]*xs*ys^2 + cs[9]*xs^2*ys ;find cubic2d values
     xout[xs,*] = col                                              ;store values
  endfor                                                           ;end loop over x pos
  
  RETURN, xout                  ;return cubic2d array
END
;========================================================================================================================

