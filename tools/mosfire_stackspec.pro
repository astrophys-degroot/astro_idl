;========================================================================================================================
pro mosfire_stackspec, xspec1, xspec2, nSIG


;+
; NAME:
;       MOSFIRE_STACKSPEC()
;
; PURPOSE:
;           
;
; CALLING SEQUENCE:
;       
;      
; INPUTS:
;        
;
; OPTIONAL INPUTS:
;       
;
; KEYWORD PARAMETERS:
;        
;
; OUTPUTS:
;       
;
; OPTIONAL OUTPUTS:
;
;
; COMMON BLOCKS:
;       
;
; PROCEDURES USED:
;       
;
; COMMENTS:
;        
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2014 Jan 17, Univ. Cali, Riverside v1.0.0
;          -Inception
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.0'

  dir1 = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov29/H/'
  spec1 = 'lok400_mask1_H_bsbsr5a_eps_1d_v11.fits'
  dir2 = '/Users/adegroot/research/dataredux/mosfire/lok400_mask4_v1/2014nov17/H/'
  spec2 = 'lok400_mask4_v1_H_cl12_eps_1d_v11.fits'


  spec1 = strcompress(dir1 + spec1, /REMOVE_ALL)
  data1 = mrdfits(spec1, 1, hdr1)
  ;help, data1, /structure
  spec2 = strcompress(dir2 + spec2, /REMOVE_ALL)
  data2 = mrdfits(spec2, 1, hdr2)
  ;help, data2, /structure


  stack = data1
  stack.spec1d[*] = 0.0
  stack.spec1dwei[*] = 0.0

  nsig = 3.0
  npts = 100.0
  FOR xx=0L, n_elements(data1.lambdas)-1, 1 DO BEGIN
  ;FOR xx=1000, 1000, 1 DO BEGIN
  ;FOR xx=1010, 1010, 1 DO BEGIN
     IF (data1.spec1d[xx] NE 0.0) AND (data1.spec1dwei[xx] NE 0.0) AND $
        (data2.spec1d[xx] NE 0.0) AND (data2.spec1dwei[xx] NE 0.0) THEN BEGIN
        ;print, xx
        ;print, data1.spec1d[xx], data1.spec1dwei[xx]
        ;print, data2.spec1d[xx], data2.spec1dwei[xx]

        low1 = data1.spec1d[xx] - nsig*data1.spec1dwei[xx]
        low2 = data2.spec1d[xx] - nsig*data2.spec1dwei[xx]
        ;print, low1, '', low2
        high1 = data1.spec1d[xx] + nsig*data1.spec1dwei[xx]
        high2 = data2.spec1d[xx] + nsig*data2.spec1dwei[xx]
        ;print, high1, '', high2

        low = min([low1, low2])
        high = max([high1, high2])
        ;print, low, '', high
        pts = ((high-low)/(npts))*findgen(npts+1)+low
        ;print, pts
        
        data = [data1.spec1d[xx], data2.spec1d[xx]]
        error = [data1.spec1dwei[xx], data2.spec1dwei[xx]]
        nspec = n_elements(data)

        
     ;;;find likelihood of test points
        ynorm = (1.0 / (2.0*!pi*error^2)^0.5)                                       ;find the normalization in y-dir
        ydenom = 2.0*error^2                                                        ;find y denoms in exp
        FOR aa=0UL, nspec-1, 1 DO BEGIN                                             ;loop over the intercepts
           ypart = (-1.0*(pts-data[aa])^2/ydenom[aa]) + alog(ynorm[aa])             ;the y error part
           tlikeli = ypart                                                          ;find likelihood in log space
           tlikeli = exp(tlikeli)                                                   ;out of log space: YOU CANT INTEGRATE IN LOG SPACE!!
           if aa eq 0 then likelihood = tlikeli else likelihood = likelihood * tlikeli ;find cumulative likelihood
        ENDFOR                                                                         ;end loop over intercepts
        ;IF xx mod 250 EQ 0 THEN chk = plot(pts, likelihood, '-')
        
     ;;;get new point and errors
        maxprob = max(likelihood, maxind)
        stack.spec1d[xx] = pts[maxind]
        sigs = sigmas(pts, likelihood, LEVELS=1)
        stack.spec1dwei[xx] = mean(sigs)
     ENDIF ELSE BEGIN
        IF (data1.spec1d[xx] NE 0.0) AND (data1.spec1dwei[xx] NE 0.0) THEN BEGIN
           stack.spec1d[xx] = data2.spec1d[xx]
           stack.spec1dwei[xx] = data2.spec1dwei[xx]
        ENDIF ELSE BEGIN
           stack.spec1d[xx] = data1.spec1d[xx]
           stack.spec1dwei[xx] = data1.spec1dwei[xx]
        ENDELSE
        
     ENDELSE


  ENDFOR

  chk = plot(stack.lambdas, stack.spec1d, '-r')
  chk = plot(data1.lambdas, data1.spec1d, '-b', /OVERPLOT)
  chk = plot(data2.lambdas, data2.spec1d, '-g', /OVERPLOT)

  mwrfits, stack, 'LOK400_bcg_stack_v1.fits', /CREATE
  

END
;========================================================================================================================
