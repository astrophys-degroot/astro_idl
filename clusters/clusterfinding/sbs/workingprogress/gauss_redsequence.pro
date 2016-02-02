function gauss_redsequence, p
  
  ch1mch2 = double(0) 
  ch1mch2_err = double(0)
  openr, lun, 'gval.tmp', /GET_LUN
  readf, lun, ch1mch2, ch1mch2_err
  free_lun, lun
  
  return, exp( (-1.0*((p-ch1mch2)^2))/(ch1mch2_err^2) ) 
end
