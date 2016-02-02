;========================================================================================================================
pro lok200_mask1_H_collate
  
  list = 'lok200_mask1_H_1dspeclist_v1-0.txt'
  listdir = '/Users/degroota/research/current7_mosfire_2013nov28_lok200/spectroscopy/LOK200_mask1_H/'
  
  mask = 'LOK200_mask1_1.0_orig.coords'
  maskdir = '/Users/degroota/research/current7_mosfire_2013nov28_lok200/specmasks/LOK200_mask1_1.0/'
  
  outfile = 'lok200_mask1_1dspeccat_v1-0.fits'
  outdir = '/Users/degroota/research/observing/keck/mosfire/2012nov24/lok200/LOK200_mask1_1.0/'
  
  radecdeg = '/Users/degroota/research/current7_mosfire_2013nov28_lok200/thumbnails/lok200_ukidssK_mosaic_v2.0.fits'
  mosfire_1dspec_collate, list, mask, /REDSHIFT, RADECDEG=radecdeg, $
                          LISTDIR=listdir, MASKDIR=maskdir, OUTFILE=outfile
  

END	
;========================================================================================================================



;========================================================================================================================
pro lok200_mask2_H_collate
  
  list = 'lok200_mask1_H_1dspeclist_v1-1.txt'
  listdir = '/Users/degroota/research/current7_mosfire_2013nov28_lok200/spectroscopy/LOK200_mask2_H'
  
  mask = 'LOK200_mask2_1.0_orig.coords'
  maskdir = '/Users/degroota/research/current7_mosfire_2013nov28_lok200/specmasks/LOK200_mask2_1.0/'
  
  outfile = 'lok200_mask2_1dspeccat_v1-0.fits'
  outdir = '/Users/degroota/research/observing/keck/mosfire/2012nov24/lok200/LOK200_mask1_1.0/'
  
  radecdeg = '/Users/degroota/research/current7_mosfire_2013nov28_lok200/thumbnails/lok200_ukidssK_mosaic_v2.0.fits'
  mosfire_1dspec_collate, list, mask, /REDSHIFT, RADECDEG=radecdeg, $
                          LISTDIR=listdir, MASKDIR=maskdir, OUTFILE=outfile
  

END	
;========================================================================================================================



