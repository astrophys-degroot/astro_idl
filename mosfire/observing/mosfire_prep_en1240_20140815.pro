;========================================================================================================================
pro en1240_make_magmacat, HELP=help


  ;;***********************************************;;
  verbose = 2                   ;how much do you want to know
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  datain = '/Users/adegroot/research/clusters/en1/en1240/catalogs/SpARCS-1613_v2.1_FAKE.fits'
  starsin = '/Users/adegroot/research/clusters/en1/en1240/catalogs/en1240_2mass_stars_v1-2.fits'
  magmaout = 'en1240_feedtomagma_formask1_v1-0.txt'
  
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
  sbsmed = 21.5                 ;ch2 mag must be less than but greater than sbsbright
  sbsfai = 23.5                 ;ch2 mag must be less than but greater than sbsmedium
  

  pst = -1                      ;star fiducial probability
  pcl = 00                      ;prob(cluster members)
  pbsbsr = 4000                 ;prob(bsbsr)
  pmsbsr = 800                  ;prob(msbsr)
  pfsbsr = 80                   ;prob(fsbsr)
  pbsbsb = 5000                 ;prob(bsbsb)
  pmsbsb = 1000                 ;prob(msbsb)
  pfsbsb = 90                   ;prob(fsbsb)
  psbsbc = 10                   ;prob(sbsbc)
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
PRO en1240_remake

  master = 'en1240_feedtomagma_formask1_v1.0.txt'
  regfile = 'en1240_multipass_v2-2_ds9.reg'
  regdir = '../regions/'

  outfile = 'en1240_feedtomagma_formask1_v1.1.txt'
  
  mosfire_magmacat_remake, master, regfile, REGDIR=regdir, OUTFILE=outfile

END
;========================================================================================================================



;========================================================================================================================
pro en1240_remakecomp, VERBOSE=verbose, HELP=help


  ;;add ability to take a new region file and remake catalog with altered coordinates 

  mascat = 'en1240_feedtomagma_formask3_v1.0.txt' 
  directory = '../MAGMA/'
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro en1240_nextmask, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'en1240_feedtomagma_formask2_v1-0.txt'       ;master input list
  compcat = 'en1240_feedtomagma_formask2_v1-0.fits'     ;companion list
  recmask = 'en1240_mask2_v1-0/en1240_mask2_v1-0.coords'       ;just made mask
  outfile = 'en1240_feedtomagma_formask3_v1-0.txt'      ;next input file
  outcompnext = 'en1240_feedtomagma_formask3_v1-0.fits' ;companion to next input file
  outcompthis = 'en1240_feedtomagma_inmask2_v1-0.fits'  ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis

END
;========================================================================================================================
