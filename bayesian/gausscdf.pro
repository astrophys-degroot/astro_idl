;========================================================================================================================
pro gausscdf, sig, cdf, diffs, NPOINTS=npoints

  IF keyword_set(NPOINTS) then npoints = npoints[0] ELSE npoints = 10001.0
  
  diffs = ((14.0*sig)/(npoints))*dindgen(npoints) - 7.0*sig
  denom = 1.0 / (2.0*sig^2)^0.5
  erfed = erf(diffs*denom)
  cdf = 0.5*(1.0 + erfed)
  
  RETURN
END
;========================================================================================================================
