;========================================================================================================================
function zernike_term, j, phase=phase, npix=npix
  
  if j gt 820 then message, "For n < 40, pick j < 820"         ;warning
  if keyword_set(npix) then npix = npix[0] else npix=256       ;sets new value
  if keyword_set(phase) then phase = phase[0] else phase = 0.0 ;sets new value
  
  x = findgen(npix)-(npix/2 - 1) 
  y = findgen(npix)-(npix/2 - 1)
  
  xarr = x # replicate(1.0,npix)
  yarr = replicate(1.0,npix) # y
  
  rarr = sqrt(xarr^2 + yarr^2)/(npix/2)
  thetarr = atan(yarr,xarr) + phase
  
  outside = where(rarr gt 1.0)
  
  narr = indgen(40)
  jmax = (narr+1)*(narr+2)/2
  wh = where(j le jmax)
  n = wh[0]
  mprime = j - n*(n+1)/2
  if n mod 2 eq 0 then m = 2*floor(mprime/2) else m = 1 + 2*floor((mprime-1)/2)
  
  radial = fltarr(npix,npix)
  zarr = fltarr(npix,npix)
  
  for s=0,(n-m)/2 do begin
     tmp = (-1)^s * factorial(n-s)
     tmp = tmp / (factorial(s)*factorial((n+m)/2 - s)*factorial((n-m)/2 - s))
     radial = radial + tmp*rarr^(n-2*s)
  endfor
  
  if m eq 0 then zarr = radial else begin
     if j mod 2 eq 0 then zarr = sqrt(2)*radial*cos(m*thetarr)
     if j mod 2 eq 1 then zarr = sqrt(2)*radial*sin(m*thetarr)
  endelse
  
  zarr = zarr * sqrt(n+1)
  zarr[outside] = 0.0
  
  return, zarr
end                                
;========================================================================================================================



;========================================================================================================================
function zernike, xdata, cs, J=j

  
  xdatasz = size(xdata)                                           ;find data array size
  xdatsz = max(xdatasz[1:2])                                      ;find large dim
  case keyword_set(J) of                                          ;check if we want a specific poly
     0 : begin                                                    ;if not a specific poly
        for xx=0, n_elements(cs)-1, 1 do begin                    ;loop over back order
           term = cs[xx]*zernike_term(xx+1, NPIX=xdatsz)          ;call to zernike polys
           if xx EQ 0 then final = term else final = final + term ;add up result
        endfor                                                    ;end loop over zernike polys
     end                                                          ;end if not a specific poly
     1 : begin                                                    ;if a specific poly
        final = cs*zernike_term(j, NPIX=xdatsz)                   ;call to zernike polys
     end                                                          ;end if a specific poly 
  endcase                                                         ;end check specific poly
                                

                                ;window, 1, XPOS=100, YPOS=100, XSIZE=600, YSIZE=600 ;set plot window
                                ;surface, final, $                                   ;surface contour
                                ;         BACKGROUND = 'FFFFFF'XL, $                 ;plot option
                                ;         COLOR = '000000'XL, $                      ;plot option
                                ;         CHARSIZE = 2.5, $                          ;plot option
                                ;         CHARTHICK = 1.25, $                        ;plot option
                                ;         XTITLE = 'X [pixels]', $                   ;plot option
                                ;         YTITLE = 'Y [pixels]', $                   ;plot option
                                ;         ZTITLE = 'Image Value [arbitrary]'         ;plot option
  
  return, final
end
;========================================================================================================================
