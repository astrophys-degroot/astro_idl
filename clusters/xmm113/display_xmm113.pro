;========================================================================================================================
PRO display_xmm113, IMDIR=imdir 


;+
; NAME:
;       DISPLAY_XMM113()
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
;       A. DeGroot, 2014 Nov 11, Univ. Cali, Riverside v1.0.0
;          -inception
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.0'


  IF keyword_set(IMDIR) THEN imdir = imdir[0] ELSE $                     ;cont next line
     imdir = '/Users/adegroot/research/clusters/xmm/xmm113/images_safe/' ;set value

  ims = ['XMM_113_g_v2_ima.fits', 'XMM_113_r_v2_ima.fits', 'XMM_113_i_v2_ima.fits', 'XMM_113_z_GUNN_v7_ima.fits', $
         'XMM_113_Y_v4_ima.fits', 'XMM_113_J_v4_ima.fits', 'XMM_113_Ks_v4_ima.fits', $
         'XMM_113_irac3.6_ima.fits', 'XMM_113_irac4.5_ima.fits', 'XMM_113_irac5.8_ima.fits']
  


  ds9line = 'ds9 '
  scale = '-zscale '
  ds9line = ds9line + scale
  print, ds9line
  FOR xx=0, n_elements(ims)-1, 1 DO BEGIN
     tmp = ims[xx]
     print, tmp
     tmp = strcompress(imdir + tmp, /REMOVE_ALL) ;prefix directory
     print, tmp
     tmp = tmp + ' '
     ds9line = ds9line + tmp
  ENDFOR
  ds9line = ds9line + '&'
  print, ds9line
  
  
  spawn, ds9line

END
;========================================================================================================================
