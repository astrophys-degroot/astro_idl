;========================================================================================================================
pro cdfs44_mask1_H_collate
  
  maskname = 'CDFS44_mask1_1.0_H'
  
  mask = 'CDFS44_mask1_1.0_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/CDFS44_mask1_1.0/'
  
  chkradecdeg = 'CDFS_44_Ks_v4_ima.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/'

  outfile = 'cdfs44_mask1_1dspeccat_v5-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile
  

END	
;========================================================================================================================



;========================================================================================================================
pro cdfs44_mask2_H_collate
  
  maskname = 'CDFS44_mask2_1.0_H'
  
  mask = 'CDFS44_mask2_1.0_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/CDFS44_mask2_1.0/'
  
  chkradecdeg = 'CDFS_44_Ks_v4_ima.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/'

  outfile = 'cdfs44_mask2_1dspeccat_v5-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg,OUTFILE=outfile
  

END	
;========================================================================================================================



;========================================================================================================================
pro cdfs44_mask3_H_collate
  
  maskname = 'CDFS44_mask3_1.0_H'
  
  mask = 'CDFS44_mask3_1.0_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/CDFS44_mask3_1.0/'
  
  chkradecdeg = 'CDFS_44_Ks_v4_ima.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/'

  outfile = 'cdfs44_mask3_1dspeccat_v5-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg,OUTFILE=outfile  

END	
;========================================================================================================================



;========================================================================================================================
pro cdfs44_mask4_H_collate
  
  maskname = 'CDFS44_mask4_1.0_H'
  
  mask = 'CDFS44_mask4_1.0_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/CDFS44_mask4_1.0/'
  
  chkradecdeg = 'CDFS_44_Ks_v4_ima.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/'

  outfile = 'cdfs44_mask4_1dspeccat_v5-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/'

  ;fluxes = ['Ha', 'NIIr', 'NIIb', 'SIIr']
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile  

END	
;========================================================================================================================



;========================================================================================================================
pro cdfs44_mask5_H_collate
  
  maskname = 'cdfs44_mask5_v2_H'
  
  mask = 'cdfs44_mask5_v2_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/cdfs44_mask5_v2/'
  
  chkradecdeg = 'CDFS_44_Ks_v4_ima.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/'

  outfile = 'cdfs44_mask5_1dspeccat_v2-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask5_v2/2014nov16/H/'

  ;fluxes = ['Ha', 'NIIr', 'NIIb']
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile  

END	
;========================================================================================================================



;========================================================================================================================
pro cdfs44_mask6_H_collate
  
  maskname = 'cdfs44_mask6_v2_H'
  
  mask = 'cdfs44_mask6_v2_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/cdfs44_mask6_v2/'
  
  chkradecdeg = 'CDFS_44_Ks_v4_ima.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/'

  outfile = 'cdfs44_mask6_1dspeccat_v2-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask6_v2/2014nov16/H/'

  ;fluxes = ['Ha', 'NIIr', 'NIIb']
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile  

END	
;========================================================================================================================



;========================================================================================================================
pro cdfs44_mask7_H_collate
  
  maskname = 'cdfs44_mask7_v2_H'
  
  mask = 'cdfs44_mask7_v2_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/cdfs44_mask7_v2/'
  
  chkradecdeg = 'CDFS_44_Ks_v4_ima.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/'

  outfile = 'cdfs44_mask7_1dspeccat_v2-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask7_v2/2014nov17/H/'

  ;fluxes = ['Ha', 'NIIr', 'NIIb']
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile  

END	
;========================================================================================================================




;========================================================================================================================
pro cdfs44_mask8_H_collate
  
  maskname = 'cdfs44_mask8_v2_H'
  
  mask = 'cdfs44_mask8_v2_orig.coords'
  maskdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/cdfs44_mask8_v2/'
  
  chkradecdeg = 'CDFS_44_Ks_v4_ima.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/'

  outfile = 'cdfs44_mask8_1dspeccat_v2-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask8_v2/2014nov17/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile  

END	
;========================================================================================================================


;========================================================================================================================
pro cdfs44_maskall_H_collate
  
  files = ['/Users/adegroot/research/dataredux/mosfire/cdfs44_mask5_v2/2014nov16/H/cdfs44_mask5_1dspeccat_v2-0.fits']
 
  outfile = ''
  outdir = ''


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

