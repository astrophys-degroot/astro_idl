;========================================================================================================================
PRO display_lok200, IMDIR=imdir, IMS=ims


;+
; NAME:
;       DISPLAY_LOK400()
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


  IF keyword_set(IMDIR) THEN imdir = imdir[0] ELSE $                         ;cont next line
     imdir = '/Users/adegroot/research/clusters/lockman/lok200/images_safe/' ;set value
  IF keyword_set(IMS) THEN ims = ims[0] ELSE ims = 'ALL'                     ;set default value

  CASE ims OF
     'ALL' : ims = ['lok200_swireg_mosaic_v2.0.fits', 'lok200_swirer_mosaic_v2.0.fits', 'lok200_swirei_mosaic_v2.0.fits', $
                    'lok200_ukidss_J_mosaic_v3.fits', 'lok200_ukidss_K_mosaic_v3.fits', $
                    'lok200_servs_ch1_mosaics_v3.fits', 'lok200_servs_ch2_mosaic_v3.fits', 'lok200_swirech3_mosaic_v2.0.fits', $
                    'lok200_swirech4_mosaic_v2.0.fits']
     'HST' : ims = []
     'OPTICAL' : ims = ['lok200_swireg_mosaic_v2.0.fits', 'lok200_swirer_mosaic_v2.0.fits', 'lok200_swirei_mosaic_v2.0.fits']
     ELSE : ims = ['lok200_swireg_mosaic_v2.0.fits', 'lok200_swirer_mosaic_v2.0.fits', 'lok200_swirei_mosaic_v2.0.fits', $
                   'lok200_ukidss_J_mosaic_v3.fits', 'lok200_ukidss_K_mosaic_v3.fits', $
                   'lok200_servs_ch1_mosaics_v3.fits', 'lok200_servs_ch2_mosaic_v3.fits', 'lok200_swirech3_mosaic_v2.0.fits', $
                   'lok200_swirech4_mosaic_v2.0.fits']
  ENDCASE
  
  
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
