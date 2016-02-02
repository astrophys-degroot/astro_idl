;========================================================================================================================
pro en1349_make_magmacat, HELP=help


  ;;***********************************************;;
  verbose = 2                   ;how much do you want to know
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  datain = '/Users/adegroot/research/clusters/en1/en1349/catalogs/SpARCS-1616_v2.3_cat_zout_FAKE.fits'
  starsin = '/Users/adegroot/research/clusters/en1/en1349/catalogs/en1349_2mass_stars_v1-1.fits'
  magmaout = 'en1349_feedtomagma_formask1_v1-0.txt'
  
  epoch = 2000.0                ;no need to change
  equinox = 2000.0              ;no need to change
  thing1 = 0                    ;no need to change
  thing2 = 0                    ;no need to change
  jnom = 21.0                   ;if no jmag available

  starbri = 11.0                ;min mag for star list
  starfai = 18.0                ;max mag for star list

  sbsred = 0.1                  ;ch1-ch2 must be great than
  sbsblue = -0.1                ;;ch1-ch2 must be great than but less than sbsred

  sbsbri = 19.0                 ;ch2mag must be less than
  sbsmed = 21.0                 ;ch2 mag must be less than but greater than sbsbright
  sbsfai = 23.5                 ;ch2 mag must be less than but greater than sbsmedium
  

  pst = -1                      ;star fiducial probability
  pcl = 00                      ;prob(cluster members)
  pbsbsr = 10000                 ;prob(bsbsr)
  pmsbsr = 1                  ;prob(msbsr)
  pfsbsr = 1                   ;prob(fsbsr)
  pbsbsb = 1000                 ;prob(bsbsb)
  pmsbsb = 100                 ;prob(msbsb)
  pfsbsb = 40                   ;prob(fsbsb)
  psbsbc = 1                   ;prob(sbsbc)
  prest = 5                     ;prob(everything else)
  
  
  ;;***********************************************;;
  

  ;;;read in the files
  data = mrdfits(datain, 1, datahdr)
  stars = mrdfits(starsin, 1, starhdr)
  IF keyword_set(HELP) THEN BEGIN
     help, data, /STRUC
     help, stars, /STRUC
  ENDIF
  
  ;;;call the routine
  mosfire_magmacat_zch1ch2, data, stars, SBSRED=sbsred, SBSBLUE=sbsblue, SBSBRI=sbsbri, SBSMED=sbsmed, SBSFAI=sbsfai, $
                                PST=pst, PCL=pcl, PBSBSR=pbsbsr, PBSBSB=pbsbsb, PMSBSR=pmsbsr, PMSBSB=pmsbsb, $
                                PFSBSR=pfsbsr, PFSBSB=pfsbsb, PSBSBC=psbsbc, PREST=prest, STARBRI=starbri, STARFAI=starfai, $
                                /REGXY, /REGDS9, OUTFILE=magmaout
  
END
;========================================================================================================================



;========================================================================================================================
PRO en1349_remake

  master = 'en1349_feedtomagma_formask1_v1.0.txt'
  regfile = 'en1349_multipass_v2-2_ds9.reg'
  regdir = '../regions/'

  outfile = 'en1349_feedtomagma_formask1_v1.1.txt'
  
  mosfire_magmacat_remake, master, regfile, REGDIR=regdir, OUTFILE=outfile

END
;========================================================================================================================



;========================================================================================================================
pro en1349_remakecomp, VERBOSE=verbose, HELP=help


  ;;add ability to take a new region file and remake catalog with altered coordinates 

  mascat = 'en1349_feedtomagma_formask3_v1.0.txt' 
  directory = '../MAGMA/'
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro en1349_nextmask, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'en1349_feedtomagma_formask2_v1-0.txt'                          ;master input list
  compcat = 'en1349_feedtomagma_formask2_v1-0.fits'                        ;companion list
  recmask = '../spectroscopy/masks/en1349_mask2_v1/en1349_mask2_v1.coords' ;just made mask
  outfile = 'en1349_feedtomagma_formask3_v1-0.txt'                         ;next input file
  outcompnext = 'en1349_feedtomagma_formask3_v1-0.fits'                    ;companion to next input file
  outcompthis = 'en1349_feedtomagma_inmask2_v1-0.fits'                     ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis

END
;========================================================================================================================


pro crap
  name = 'SpARCS-1616_v2.2_cat_zout_FAKE.fits'
  nameout = 'SpARCS-1616_v2.3_cat_zout_FAKE.fits'
  im = mrdfits(name, 1, hdr)
  im[*].zmagerr = 0.1  
  im[*].ch1magerr = 0.1
  im[*].ch2magerr = 0.1
  chk = where(im.z_spec GT 1.14 AND im.z_spec LT 1.17, nchk, COMPLEMENT=nochk, NCOMPLEMENT=nnochk)
  print, nnochk
  im[nochk].zmag = 20.0                                                          
  im[nochk].ch1mag = 17.0                                                      
  im[nochk].ch2mag = 17.5                                                      
  chk = where((im.z_peak GT 1.0 AND im.z_peak LT 1.10) OR (im.z_peak GT 1.2 AND im.z_peak LT 1.3), nchk)
  print, nchk
  im[chk].zmag = 23.0                                                          
  im[chk].ch1mag = 21.15                                                      
  im[chk].ch2mag = 21.1                                                      
  chk = where(im.z_peak GT 1.10 AND im.z_peak LT 1.2, nchk)
  print, nchk
  im[chk].zmag = 23.0                                                          
  im[chk].ch1mag = 20.05                                                      
  im[chk].ch2mag = 20.0                                                      
  chk = where(im.z_spec GT 1.14 AND im.z_spec LT 1.17 AND im.flag NE 1, nchk)
  print, nchk
  im[chk].zmag = 20.0                                                           
  im[chk].ch1mag = 17.0                                                       
  im[chk].ch2mag = 16.95                                                      
  chk = where(im.z_spec GT 1.14 AND im.z_spec LT 1.17 AND im.flag EQ 1, nchk)
  print, nchk
  im[chk].zmag = 20.0
  im[chk].ch1mag = 17.0
  im[chk].ch2mag = 16.5
  mwrfits, im, nameout, hdr, /CREATE




end
