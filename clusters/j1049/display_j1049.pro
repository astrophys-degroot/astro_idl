;========================================================================================================================
PRO display_j1049, IMDIR=imdir, IMS=ims


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
     imdir = '/Users/adegroot/research/clusters/lockman/lok400/images_safe/' ;set value
  IF keyword_set(IMS) THEN ims = ims[0] ELSE ims = 'ALL'                           ;set default value

  CASE ims OF
     'ALL' : ims = ['frame-u-002863-6-0226.fits', 'frame-g-002863-6-0226.fits', 'frame-r-002863-6-0226.fits', 'frame-i-002863-6-0226.fits', $
                    'SPARCS_J1049_F814W_v2_drz.fits', 'frame-z-002863-6-0226.fits', 'lok400_sparcsz_mosaic_v1.0.fits', $
                    'SPARCS_J1049_F105W_v5_drz.fits', 'SPARCS_J1049_F160W_v5_drz.fits', 'lok400_ukidssK_mosaic_v1.0.fits', $
                    'lok400_servsch1_mosaic_v1.0.fits', 'lok400_servsch2_mosaic_v1.0.fits']
     'HST' : ims = ['SPARCS_J1049_F814W_v2_drz.fits', 'SPARCS_J1049_F105W_v5_drz.fits', 'SPARCS_J1049_F160W_v5_drz.fits']
     ELSE : ims = ['frame-u-002863-6-0226.fits', 'frame-g-002863-6-0226.fits', 'frame-r-002863-6-0226.fits', 'frame-i-002863-6-0226.fits', $
                   'SPARCS_J1049_F814W_v2_drz.fits', 'frame-z-002863-6-0226.fits', 'lok400_sparcsz_mosaic_v1.0.fits', $
                   'SPARCS_J1049_F105W_v5_drz.fits', 'SPARCS_J1049_F160W_v5_drz.fits', 'lok400_ukidssK_mosaic_v1.0.fits', $
                   'lok400_servsch1_mosaic_v1.0.fits', 'lok400_servsch2_mosaic_v1.0.fits']
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
