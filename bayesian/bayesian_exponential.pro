pro bayesian_exponential, xvals, yvals, xerr, YERR=yerr, $
                               MINA=mina, MAXA=maxa, BINA=bina, $
                               MINB=minb, MAXB=maxb, BINB=binb, $
                               MINC=minc, MAXC=maxc, BINC=binc
  
  
  
  
  tmpx = [4.5, 5.5, 6.5, 7.5, 8.5, 9.5, 10.5, 11.5]
  tmpy = [0.045, 0.030, 0.023, 0.015, 0.012, 0.009, 0.006, 0.005]
  err =  0.05*tmpy
  
  ;;;Coefficients phase space to check
  min_a = 0.50
  max_a = 0.90
  bin_a = 0.001
  
  min_b = 0.50
  max_b = 0.80
  bin_b = 0.001
  
  min_c = -0.1
  max_c = 0.1
  bin_c = 0.001
  
  as = dindgen((max_a-min_a)/bin_a+1.0) * bin_a + min_a ;find values
  nas = n_elements(as)                                  ;find # elements
  bs = dindgen((max_b-min_b)/bin_b+1.0) * bin_b + min_b ;find values
  nbs = n_elements(bs)                                  ;find # elements
  cs = dindgen((max_c-min_c)/bin_c+1) * bin_c + min_c   ;find values
  ncs = n_elements(cs)                                  ;find # elements
  


  likelihood = dblarr(nas, nbs, ncs)
  help, likelihood
  for aa=0UL, nas-1, 1 do begin
     for bb=0UL, nbs-1, 1 do begin
        for cc=0UL, ncs-1, 1 do begin
           predict = as[aa]*exp(-1.0*tmpx^bs[bb]) + cs[cc]
           likeli = -1.0*(predict-tmpy)^2 / (2.0*err^2)
           likelihood[aa,bb,cc] = total(likeli)
        endfor
     endfor
  endfor
  likelihood = likelihood - max(likelihood)
  likelihood = exp(likelihood)
  
  chk = where(likelihood NE likelihood, nchk)
  if nchk NE 0 then begin
     print, 'Somewhere the likelihood is INF or NaN!!'
     likelihood[chk] = 0.0
  endif
  

  ;;;Plot the 2D posteriors
  window, 0, XPOS=100, YPOS=100, XSIZE=600, YSIZE=600
  !P.Multi = [0, 2, 2, 0, 1]
  
  abprob = dblarr(nas, nbs)
  for xx=0UL, ncs-1, 1 do begin
     if xx EQ 0 then abprob = likelihood[*,*,xx] else abprob = abprob + likelihood[*,*,xx] ;;;shouldn't this be * not + ????
  endfor
  contour, abprob, as, bs, $
           COLOR='000000'XL, $
           BACKGROUND = 'FFFFFF'XL, $
           XTITLE = ' a [units]', $
           YTITLE = ' b [units] ', $
           CHARSIZE = 1.25
  
  acprob = dblarr(nas, ncs)
  for xx=0UL, nbs-1, 1 do begin
     once = reform(likelihood[*,xx,*])
     if xx EQ 0 then acprob = once else acprob = acprob + once
  endfor
  contour, acprob, as, cs, $
           COLOR='000000'XL, $
           BACKGROUND = 'FFFFFF'XL, $
           XTITLE = ' a [units]', $
           YTITLE = ' c [units] ', $
           CHARSIZE = 1.25
  
  bcprob = dblarr(nbs, ncs)
  for xx=0UL, nas-1, 1 do begin
     once = reform(likelihood[xx,*,*])
     if xx EQ 0 then bcprob = once else bcprob = bcprob + once
  endfor
  contour, bcprob, bs, cs, $
           COLOR='000000'XL, $
           BACKGROUND = 'FFFFFF'XL, $
           XTITLE = ' b [units]', $
           YTITLE = ' c [units] ', $
           CHARSIZE = 1.25
  

  ;;;Plot the 1D posteriors
  window, 1, XPOS=150, YPOS=150, XSIZE=900, YSIZE=400
  !P.Multi = [0, 3, 1, 0, 1]

  aprob = dblarr(nas)
  for xx=0UL, nbs-1, 1 do begin
     if xx EQ 0 then aprob = abprob[*,xx] else aprob = aprob + abprob[*,xx]
  endfor
  plot, as, aprob, $
        COLOR='000000'XL, $
        BACKGROUND = 'FFFFFF'XL, $
        XTITLE = ' a [units]', $
        YTITLE = ' Probability ', $
        CHARSIZE = 1.5

  bprob = dblarr(nbs)
  for xx=0UL, ncs-1, 1 do begin
     if xx EQ 0 then bprob = bcprob[*,xx] else bprob = bprob + bcprob[*,xx]
  endfor
  plot, bs, bprob, $
        COLOR='000000'XL, $
        BACKGROUND = 'FFFFFF'XL, $
        XTITLE = ' b [units]', $
        YTITLE = ' Probability ', $
        CHARSIZE = 1.5
  
  cprob = dblarr(ncs)
  for xx=0UL, nas-1, 1 do begin
     if xx EQ 0 then cprob = acprob[xx,*] else cprob = cprob + acprob[xx,*]
  endfor
  plot, cs, cprob, $
        COLOR='000000'XL, $
        BACKGROUND = 'FFFFFF'XL, $
        XTITLE = ' c [units]', $
        YTITLE = ' Probability ', $
        CHARSIZE = 1.5
  


  ;;;Plot original data with fit data overlayed
  find = max(aprob, asind)
  a = as[asind]
  find = max(bprob, bsind)
  b = bs[bsind]
  find = max(cprob, csind)
  c = cs[csind]
  testing = a*exp(-1.0*tmpx^b) + c

  window, 2, XPOS=200, YPOS=200, XSIZE=600, YSIZE=600
  !P.Multi = 0
  plot, tmpx, tmpy, PSYM=2, $
        COLOR = '000000'XL, $
        BACKGROUND = 'FFFFFF'XL, $
        XTITLE = ' c [units]', $
        YTITLE = ' Probability ', $
        CHARSIZE = 1.5
                                ;oploterr, tmpx, tmpy, err, ERRCOLOR = '000000'XL
  oplot, tmpx, testing, PSYM=5, $
         COLOR = '000000'XL
  
  print, [a,b,c]
  ;return, [a,b,c]
end
