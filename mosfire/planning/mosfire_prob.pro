;========================================================================================================================
FUNCTION prob_zmch1, p

  readcol, 'galaxyval.tmp', xzmch1, xzmch1_err, FORMAT='(D,D)', SILENT=1 ;read in data
  
  
  xzmch1 = xzmch1[0]            ;we need the number NOT an array
  xzmch1_err = xzmch1_err[0]    ;we need the number NOT an array
  
  prob = exp((-1.0*((p-xzmch1)^2))/(2.0*xzmch1_err^2)) ;calculate probability

  RETURN, prob
END
;========================================================================================================================



;========================================================================================================================
FUNCTION prob_ch1mch2_limits, x
  
  readcol, 'gausslimits.tmp', blower, bupper, FORMAT='(D,D)', SILENT=1
  
  blower = blower[0]            ;we need the number NOT an array
  bupper = bupper[0]            ;we need the number NOT an array
  
  RETURN, [blower, bupper]
END
;========================================================================================================================



;========================================================================================================================
FUNCTION prob_ch1mch2, px, py
  
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
  xexp = exp(-1.0*total)         ;

  RETURN, xexp
END
;========================================================================================================================

;========================================================================================================================
pro mosfire_prob, verbose
  
  if verbose ge 2 THEN print, ' Compile function to calculate probabilities for mosfire weights.'

end
;========================================================================================================================
