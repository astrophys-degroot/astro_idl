PRO lognormal, xs, params, F, CDF=cdf

  ;print, xs
  ;print, params
  ;print, (sqrt(2.0*!pi)*xs*params[1])
  ;print, 1.0/(sqrt(2.0*!pi)*xs*params[1])
  ;print, alog(xs)
  ;stop
  ;print, (alog(xs)-params[0])
  ;print, (alog(xs)-params[0])^2
  ;print, -1.0*(alog(xs)-params[0])^2 / (2.0*params[1]^2)
  ;print,  exp(-1.0*(alog(xs)-params[0])^2 / (2.0*params[1]^2))
  ;stop
  F = params[2]/(sqrt(2.0*!pi)*xs*params[1]) * exp(-1.0*(alog(xs)-params[0])^2 / (2.0*params[1]^2))
  ;print, F
  ;stop

  IF keyword_set(CDF) THEN BEGIN
     F = 0.5 + 0.5*erf((alog(xs)-params[0]) / (1.414214*params[1])) 
  ENDIF

  RETURN
END
