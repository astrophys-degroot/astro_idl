;========================================================================================================================
PRO display_J1634, IMDIR=imdir 


;+
; NAME:
;       DISPLAY_J1634()
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


  IF keyword_set(IMDIR) THEN imdir = imdir[0] ELSE $                    ;cont next line
     imdir = '/Users/adegroot/research/clusters/en2/J1634/images_safe/' ;set value

  ims = ['SpARCS-1634_u_v2.0.fits', 'SpARCS-1634_g_v2.0.fits', 'SpARCS-1634_r_v2.0.fits', 'SpARCS-1634_i_v2.0.fits', $
         'SpARCS-1634_z_v2.0.fits', 'SpARCS-1634_J_v2.0.fits', 'SpARCS-1634_K_v2.0.fits', 'SpARCS-1634_IRAC1_v2.0.fits', $
         'SpARCS-1634_IRAC2_v2.0.fits', 'SpARCS-1634_IRAC3_v2.0.fits', 'SpARCS-1634_IRAC4_v2.0.fits']
  

  ;;;open the images
  ds9line = 'ds9 '
  scale = '-zscale '
  ds9line = ds9line + scale
  print, ds9line
  FOR xx=0, n_elements(ims)-1, 1 DO BEGIN
     tmp = ims[xx]
     tmp = strcompress(imdir + tmp, /REMOVE_ALL) ;prefix directory
     tmp = tmp + ' '
     ds9line = ds9line + tmp
  ENDFOR
  ds9line = ds9line + '&'  
  spawn, ds9line

END
;========================================================================================================================
