;========================================================================================================================
pro lok200_mask1_H_collate
  
  maskname = 'LOK200_mask1_1.0_H'
  
  mask = 'LOK200_mask1_1.0.coords'
  maskdir = '/Users/adegroot/research/clusters/lockman/lok200/specmasks/MOSFIRE/LOK200_mask1_1.0/'
  
  chkradecdeg = 'lok200_ukidss_K_mosaic_v3.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/lockman/lok200/images_safe/'

  outfile = 'lok200_mask1_1dspeccat_v1-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask1_1.0/2012nov25/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile
  

END	
;========================================================================================================================



;========================================================================================================================
pro lok200_mask2_H_collate
  
  maskname = 'LOK200_mask2_1.0_H'
  
  mask = 'LOK200_mask2_1.0.coords'
  maskdir = '/Users/adegroot/research/clusters/lockman/lok200/specmasks/MOSFIRE/LOK200_mask2_1.0/'
  
  chkradecdeg = 'lok200_ukidss_K_mosaic_v3.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/lockman/lok200/images_safe/'

  outfile = 'lok200_mask2_1dspeccat_v1-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask2_1.0/2012nov25/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile
  

END	
;========================================================================================================================



;========================================================================================================================
pro lok200_mask3_H_collate
  
  maskname = 'LOK200_mask3_H'
  
  mask = 'LOK200_mask3.coords'
  maskdir = '/Users/adegroot/research/clusters/lockman/lok200/specmasks/MOSFIRE/LOK200_mask3/'
  
  chkradecdeg = 'lok200_ukidss_K_mosaic_v3.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/lockman/lok200/images_safe/'

  outfile = 'lok200_mask3_1dspeccat_v1-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask3/2014may14/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile
  

END	
;========================================================================================================================



;========================================================================================================================
pro lok200_mask4_H_collate
  
  maskname = 'LOK200_mask4_H'
  
  mask = 'LOK200_mask4.coords'
  maskdir = '/Users/adegroot/research/clusters/lockman/lok200/specmasks/MOSFIRE/LOK200_mask4/'
  
  chkradecdeg = 'lok200_ukidss_K_mosaic_v3.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/lockman/lok200/images_safe/'

  outfile = 'lok200_mask4_1dspeccat_v1-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/LOK200_mask4/2014may14/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile
  

END	
;========================================================================================================================



;========================================================================================================================
pro lok200_mask5_H_collate
  
  maskname = 'lok200_mask5_H'
  
  mask = 'lok200_mask5.coords'
  maskdir = '/Users/adegroot/research/clusters/lockman/lok200/specmasks/MOSFIRE/lok200_mask5/'
  
  chkradecdeg = 'lok200_ukidss_K_mosaic_v3.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/lockman/lok200/images_safe/'

  outfile = 'lok200_mask5_1dspeccat_v1-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/lok200_mask5/2014jun13/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile
  

END	
;========================================================================================================================




;========================================================================================================================
pro lok200_mask6_H_collate
  
  maskname = 'lok200_mask6_H'
  
  mask = 'lok200_mask6.coords'
  maskdir = '/Users/adegroot/research/clusters/lockman/lok200/specmasks/MOSFIRE/lok200_mask6/'
  
  chkradecdeg = 'lok200_ukidss_K_mosaic_v3.fits'
  dirchkradecdeg = '/Users/adegroot/research/clusters/lockman/lok200/images_safe/'

  outfile = 'lok200_mask6_1dspeccat_v1-0.fits'
  outdir = '/Users/adegroot/research/dataredux/mosfire/lok200_mask6/2014jun14/H/'
  
  mosfire_1dspec_collate, maskname, mask, /RADECDEG, MASKDIR=maskdir, CHKRADECDEG=chkradecdeg, $
                          DIRCHKRADECDEG=dirchkradecdeg, OUTFILE=outfile
  

END	
;========================================================================================================================




;========================================================================================================================
pro lok200_maskall_H_collate
  
  files = ['/Users/adegroot/research/dataredux/mosfire/LOK200_mask1_1.0/2012nov25/H/lok200_mask1_1dspeccat_v1-0.fits', $
           '/Users/adegroot/research/dataredux/mosfire/LOK200_mask2_1.0/2012nov25/H/lok200_mask2_1dspeccat_v1-0.fits', $
           '/Users/adegroot/research/dataredux/mosfire/LOK200_mask3/2014may14/H/lok200_mask3_1dspeccat_v1-0.fits', $
           '/Users/adegroot/research/dataredux/mosfire/LOK200_mask4/2014may14/H/lok200_mask4_1dspeccat_v1-0.fits', $
           '/Users/adegroot/research/dataredux/mosfire/lok200_mask5/2014jun13/H/lok200_mask5_1dspeccat_v1-0.fits', $
           '/Users/adegroot/research/dataredux/mosfire/lok200_mask6/2014jun14/H/lok200_mask6_1dspeccat_v1-0.fits']
 
  outfile = 'lok200_MOSFIRE_specz_v2-0.fits'
  outdir = '/Users/adegroot/research/clusters/lockman/lok200/catalogs/spectrscopic/'


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



