;========================================================================================================================
function gaussian_zch1, p

  readcol, 'galaxyval.tmp', xch1, xch1_err, xzmch1, xzmch1_err, FORMAT='(D,D,D,D)', SILENT=1
  
  xch1 = xch1[0]                ;we need the number NOT an array
  xch1_err = xch1_err[0]        ;we need the number NOT an array
  zxmch1 = xzmch1[0]            ;we need the number NOT an array
  zxmch1_err = zxmch1_err[0]    ;we need the number NOT an array
  
  return, exp( (-1.0*((p-xzmch1)^2))/(2.0*xzmch1_err^2) ) 
end
;========================================================================================================================



;========================================================================================================================
function gaussian2d_limits, x
  
  readcol, 'gausslimits.tmp', mlower, blower, mupper, bupper, FORMAT='(D,D,D,D)', SILENT=1
  
  mlower = mlower[0]            ;we need the number NOT an array
  blower = blower[0]            ;we need the number NOT an array
  mupper = mupper[0]            ;we need the number NOT an array
  bupper = bupper[0]            ;we need the number NOT an array
  
  lowerlimit = mlower*x+blower
  upperlimit = mupper*x+bupper

  return, [lowerlimit, upperlimit]
end
;========================================================================================================================



;========================================================================================================================
function gaussian2d_zch1, px, py
  
  readcol, 'galaxyval.tmp', xch1, xch1_err, xzmch1, xzmch1_err, FORMAT='(D,D,D,D)', SILENT=1
  
  xch1 = xch1[0]                ;we need the number NOT an array
  xch1_err = xch1_err[0]        ;we need the number NOT an array
  xzmch1 = xzmch1[0]            ;we need the number NOT an array
  xzmch1_err = xzmch1_err[0]    ;we need the number NOT an array
  num1 = (px-xch1)^2            ;
  den1 = (2.0*xch1_err^2)       ;
  term1 = num1 / den1           ;
  num2 = (py-xzmch1)^2          ;
  den2 = (2.0*xzmch1_err^2)     ;
  term2 = num2 / den2           ;
  total = term1 + term2         ;

  return, exp(-1.0*total)  
end
;========================================================================================================================



;========================================================================================================================
pro gaussians_rs, verbose

  if verbose ge 2 THEN print, ' Compile gaussians for red sequence weights.'

end
;========================================================================================================================



