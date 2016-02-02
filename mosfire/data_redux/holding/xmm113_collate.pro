;========================================================================================================================
pro xmm113_mask1_H_collate
  
  maskname = 'XMM113_mask1_1.0_H'
  
  mask = 'XMM113_mask1_1.0_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/XMM113_mask1_1.0/'
  
  chkradecdeg = 'XMM_113_Ks_v4_ipe.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/xmm/xmm113/images_safe/'

  outfile = 'xmm113_mask1_1dspeccat_v1-1.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile
  

END	
;========================================================================================================================



;========================================================================================================================
pro xmm113_mask2_H_collate
  
  maskname = 'XMM113_mask2_1.0_H'
  
  mask = 'XMM113_mask2_1.0_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/XMM113_mask2_1.0/'
  
  chkradecdeg = 'XMM_113_Ks_v4_ipe.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/xmm/xmm113/images_safe/'

  outfile = 'xmm113_mask2_1dspeccat_v1-1.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg,OUTFILE=outfile
  

END	
;========================================================================================================================



;========================================================================================================================
pro xmm113_mask6_H_collate
  
  maskname = 'XMM113_mask6_H'
  
  mask = 'XMM113_mask6_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/XMM113_mask6/'
  
  chkradecdeg = 'XMM_113_Ks_v4_ipe.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/xmm/xmm113/images_safe/'

  outfile = 'xmm113_mask6_1dspeccat_v1-1.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg,OUTFILE=outfile  

END	
;========================================================================================================================



;========================================================================================================================
pro xmm113_mask7_H_collate
  
  maskname = 'XMM113_mask7_H'
  
  mask = 'XMM113_mask7_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/XMM113_mask7/'
  
  chkradecdeg = 'XMM_113_Ks_v4_ipe.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/xmm/xmm113/images_safe/'

  outfile = 'xmm113_mask7_1dspeccat_v1-1.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/'

  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile  

END	
;========================================================================================================================



;========================================================================================================================
pro xmm113_mask8_H_collate
  
  maskname = 'xmm113_mask8_v1_H'
  
  mask = 'xmm113_mask8_v1_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/xmm113_mask8_v1/'
  
  chkradecdeg = 'XMM_113_Ks_v4_ipe.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/xmm/xmm113/images_safe/'

  outfile = 'xmm113_mask8_1dspeccat_v1-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask8_v1/2014nov16/H/'

  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile  

END	
;========================================================================================================================


;========================================================================================================================
pro xmm113_mask9_H_collate
  
  maskname = 'xmm113_mask9_v1_H'
  
  mask = 'xmm113_mask9_v1_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/xmm113_mask9_v1/'
  
  chkradecdeg = 'XMM_113_Ks_v4_ipe.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/xmm/xmm113/images_safe/'

  outfile = 'xmm113_mask9_1dspeccat_v1-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask9_v1/2015feb23/H/'

  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile  

END	
;========================================================================================================================



;========================================================================================================================
pro xmm113_maskall_H_collate
  
  files = ['/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/xmm113_mask1_1dspeccat_v1-1.fits', $
           '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/xmm113_mask2_1dspeccat_v1-1.fits', $
           '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/xmm113_mask6_1dspeccat_v1-2.fits', $
           '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/xmm113_mask7_1dspeccat_v1-1.fits', $
           '/Users/adegroot/research/dataredux/mosfire/xmm113_mask8_v1/2014nov16/H/xmm113_mask8_1dspeccat_v1-1.fits', $
           '/Users/adegroot/research/dataredux/mosfire/xmm113_mask9_v1/2015feb23/H/xmm113_mask9_1dspeccat_v1-0.fits']
 
  outfile = 'xmm113_mosfire_specz_v2-1.fits'
  outdir = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/spectroscopic/'


  outfile = strcompress(outdir + outfile, /REMOVE_ALL)
  ntot = 0
  FOR xx=0, n_elements(files)-1, 1 DO BEGIN
     data = mrdfits(files[xx], 1, hdr)
     nmask = n_elements(data.(0))
     ntot = ntot + nmask
  ENDFOR

  out = replicate(data[0], ntot)
  nrun = 0
  FOR xx=0, n_elements(files)-1, 1 DO BEGIN
     data = mrdfits(files[xx], 1, hdr)
     help, out, /STRUC
     help, data, /STRUC
     nmask = n_elements(data.(0))
     FOR yy=0, nmask-1, 1 DO BEGIN
        out[nrun] = data[yy]
        nrun++
     ENDFOR
  ENDFOR
  
  print, outfile
  mwrfits, out, outfile, /CREATE



END	
;========================================================================================================================
