;========================================================================================================================
pro en1790_make_magmacat


  ;;***********************************************;;
  verbose = 2                   ;how much do you want to know
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  datain = '/Users/degroota/research/observing/keck/mosfire/2014_6_13/en1790/catalogs/en1790_multipass_v2.2.fits'
  starsin = '/Users/degroota/research/observing/keck/mosfire/2014_6_13/en1790/catalogs/en1790_2mass_JHK_v1-0.fits'
  magmaout = 'en1790_feedtomagma_formask1_v1.0.txt'
  
  epoch = 2000.0                ;no need to change
  equinox = 2000.0              ;no need to change
  thing1 = 0                    ;no need to change
  thing2 = 0                    ;no need to change
  jnom = 21.0                   ;if no jmag available

  starbri = 12.0                ;min mag for star list
  starfai = 16.0                ;max mag for star list

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
  
  ;;;call the routine
  mosfire_magmacat_zch1ch2_int, data, stars, SBSRED=sbsred, SBSBLUE=sbsblue, SBSBRI=sbsbri, SBSMED=sbsmed, SBSFAI=sbsfai, $
                                PST=pst, PCL=pcl, PBSBSR=pbsbsr, PBSBSB=pbsbsb, PMSBSR=pmsbsr, PMSBSB=pmsbsb, $
                                PFSBSR=pfsbsr, PFSBSB=pfsbsb, PSBSBC=psbsbc, PREST=prest, STARBRI=starbri, STARFAI=starfai, $
                                /REGXY, /REGDS9, OUTFILE=magmaout
  
END
;========================================================================================================================



;========================================================================================================================
PRO en1790_remake

  master = 'en1790_feedtomagma_formask1_v1.0.txt'
  regfile = 'en1790_multipass_v2-2_ds9.reg'
  regdir = '../regions/'

  outfile = 'en1790_feedtomagma_formask1_v1.1.txt'
  
  mosfire_magmacat_remake, master, regfile, REGDIR=regdir, OUTFILE=outfile

END
;========================================================================================================================



;========================================================================================================================
pro en1790_remakecomp, VERBOSE=verbose, HELP=help


  ;;add ability to take a new region file and remake catalog with altered coordinates 

  mascat = 'en1790_feedtomagma_formask1_v1.1.txt' 
  directory = '../MAGMA/'
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro en1790_nextmask, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'en1790_feedtomagma_formask2_v1.1.txt'           ;master input list
  compcat = 'en1790_feedtomagma_formask2_v1.1.fits'         ;companion list
  recmask = '../en1790_mask2_v1-0/en1790_mask2_v1-0.coords' ;just made mask
  outfile = 'en1790_feedtomagma_formask3_v1.1.txt'          ;next input file
  outcompnext = 'en1790_feedtomagma_formask3_v1.1.fits'     ;companion to next input file
  outcompthis = 'en1790_feedtomagma_inmask2_v1.1.fits'      ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis

END
;========================================================================================================================
