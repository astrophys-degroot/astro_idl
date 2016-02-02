; NAME:
;      noisegrowth
; PURPOSE:
;      Characterize the growth in photometric uncertainty due to
;      changes in aperture size. 
; EXPLANATION:
;      noisegrowth works with bgextract to measure background flux
;      distributions in a series of aperture sizes. The photometric
;      uncertainty for each choice of aperture size is recorded as 
;      a function of number of pixels integrated.
;      This data is then fit to an analytic curve from Labbe et. al.
;      (2003).
;      The program outputs a plot demonstrating the noise growth
;      with increasing aperture size, and the parameters for the
;      analytic fit.
;      noisegrowth requires a source image, an input vector of
;      aperture radii to measure within, and an aperture list
;      generated for the largest of the input radii.
; CALLING SEQUENCE:
;     noisegrowth, image, aplist, radii, [/write]
; INPUTS:
;     image            - input image array
;     aplist           - aperture list from apfitter.pro suitable for
;                        the largest of the input radii
;     radii            - vector list of radii to measure
; OPTIONAL INPUTS:
;     /write           - write a .ps file of the noise growth curve
; NOTES:
;     Use apfitter.pro to generate the input aperture list.
; EXAMPLE:
;     IDL> noisegrowth,'Ks.fits','Ks_aplist15.txt',[1,2,3,5,7,8,10,12,15]
;
;     Written 4/29/12 by Ryan Foltz and Alessandro Rettura
;     email: ryan.foltz@email.ucr.edu


pro noisegrowth,image,aplist,radii,write=write,params=params
  on_error,2

  if n_params() lt 3 then begin
     print,'syntax: noisegrowth,image,aplist,radii[,/write]'
     return
  endif

  radii=[0,radii]
  o=strsplit(image,'.',/extract)
  output=o[0]

  s=size(radii,/dimensions)-1

  for i = 0,s[0] do begin
    bgextract,image,radii[i],aplist=aplist,params=p,/noplot
    if n_elements(sigmas) eq 0 then sigmas = p[2] $
    else sigmas = [sigmas,p[2]]
  endfor

  n = (3.14*radii^2)^0.5

  expr=strtrim(sigmas[0])+'*P[0]*X+'+strtrim(sigmas[0],2)+'*P[1]*X^2'
  print,expr
  result=mpfitexpr(expr,n,sigmas,1,start)

  range=(n[s+1]-n[0])*1.0
  step=range/50.0
  x=findgen(51)*step[0]+n[0]
  y=sigmas[0]*result[0]*x+sigmas[0]*result[1]*x^2

  print,result
  if keyword_set(write) then ps_start,filename=output+'_growth.ps'

  plot,n,sigmas,psym=4,xtitle='N (pixels^2)',ytitle='Sigma (cts/s)',title='Noise growth curve for '+output,/ylog
  oplot,x,y,linestyle=2

  if keyword_set(write) then begin
    xyouts,0.15,0.88,'Y=A*X+B*X^2',charsize=0.75,/normal
    xyouts,0.15,0.84,'A='+strtrim(sigmas[0]*result[0],2),charsize=0.75,/normal
    xyouts,0.15,0.8,'B='+strtrim(sigmas[0]*result[1],2),charsize=0.75,/normal
    ps_end
    plot,n,sigmas,psym=4,xtitle='N (pixels)',ytitle='Sigma (cts/s)',title='Noise growth curve for '+output,/ylog
    oplot,x,y,linestyle=2
  endif

  print,'Y=s1*A*X + s1*B*X^2'
  print,'s1='+strtrim(sigmas[0],2)
  print,'A='+strtrim(result[0],2)
  print,'B='+strtrim(result[1],2)
  if arg_present(params) then params=[sigmas[0]*result[0],sigmas[0]*result[1]]
end
