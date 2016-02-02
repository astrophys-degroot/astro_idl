;========================================================================================================================
function gaussian_sbs, p
  
  readcol, 'galaxyval.tmp', xch2, xch2_err, xch1mch2, xch1mch2_err, FORMAT='(D,D,D,D)', SILENT=1
  
  xch2 = xch2[0]                 ;we need the number NOT an array
  xch2_err = xch2_err[0]         ;we need the number NOT an array
  xch1mch2 = xch1mch2[0]         ;we need the number NOT an array
  xch1mch2_err = xch1mch2_err[0] ;we need the number NOT an array

  return, exp( (-1.0*((p-xch1mch2)^2))/(2.0*xzmch1_err^2) ) 
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
function gaussian2d_ch1ch2, px, py
  
  readcol, 'galaxyval.tmp', xch2, xch2_err, xch1mch2, xch1mch2_err, FORMAT='(D,D,D,D)', SILENT=1
  

  xch2 = xch2[0]                 ;we need the number NOT an array
  xch2_err = xch2_err[0]         ;we need the number NOT an array
  xch1mch2 = xch1mch2[0]         ;we need the number NOT an array
  xch1mch2_err = xch1mch2_err[0] ;we need the number NOT an array
  num1 = (px-xch2)^2             ;
  den1 = (2.0*xch2_err^2)        ;
  term1 = num1 / den1            ;
  num2 = (py-xch1mch2)^2         ;
  den2 = (2.0*xch1mch2_err^2)    ;
  term2 = num2 / den2            ;
  total = term1 + term2          ;
  
  return, exp(-1.0*total)  
END
;========================================================================================================================



;========================================================================================================================
pro gaussians_sbs, verbose

  if verbose ge 2 THEN print, ' Compile gaussians for stellar bump sequence weights.'

end
;========================================================================================================================
