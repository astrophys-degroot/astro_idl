;;;===================================================================================================
function normaldist, mu, sigma, value, LOGSPACE=logspace

  case keyword_set(LOGSPACE) of 
     0 : p = (1.0/(sigma*(2.0*!pi)^0.5))*exp(-0.5*((value-mu)/sigma)^2)
     1 : p = (-0.5*((value-mu)/sigma)^2)
  endcase

  return, p
end
;===================================================================================================



;===================================================================================================
function cauchydist, alpha, beta, value, LOGspace=logspace

  case keyword_set(LOGSPACE) of
     0 : p = double( beta / (!pi*(beta^2 + (value-alpha)^2)))
     1 : p = -1.0*alog((beta^2 + (value-alpha)^2))
  endcase

  return, p
end
;===================================================================================================



;===================================================================================================
function binomdist, hval, nhead, ntoss, LOGSPACE=logspace
  hval = double(hval)
  nhead = double(nhead)
  ntoss = double(ntoss)
  case keyword_set(LOGSPACE) of
     0 : probs = (hval^nhead)*(1-hval)^(ntoss-nhead)
     1 : probs = nhead*alog(hval) + (ntoss-nhead)*alog(1-hval)
  endcase
  
  return, probs
end
;===================================================================================================




;===================================================================================================
function poisson, data, ndata, LOGSPACE=logspace
  data = double(data)
  ndata = double(ndata)
  case keyword_set(LOGSPACE) of
     0 : probs = (data^ndata)*exp(-data) / factorial(ndata)
     1 : probs = ndata*alog(data) - data
  endcase
  
  return, probs
end
;===================================================================================================
