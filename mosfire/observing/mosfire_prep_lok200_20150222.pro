;========================================================================================================================
pro mosfire_make_magmacat_lok200_20150222, $
   VERBOSE=verbose, HELP=help

  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;set default value


  ;;;***********************************************;;;
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  ;;;in files and out files
  datain = '/Users/adegroot/research/observing/keck/mosfire/20150222/LOK200/lok200_P8_specz_photoz_eazy_v1-0.fits'
  starsin = '/Users/adegroot/research/clusters/lockman/lok200/catalogs/stars/lok200_2mass_pointsources_v3-0.fits'
  magmaout = 'lok200_feedtomagma_formask7_v1-0.txt'
  
  ;;;detection values
  pzhi = 10000                  ;prob multiplier photo-z
  pzmed = 2000                   ;prob multiplier photo-z
  pzlow = 200                   ;prob multiplier photo-z
  
  p_clmem = 00                  ;prob(cluster members)
  p_bsbsr = 4000                ;prob(bsbsr)
  p_msbsr = 500                 ;prob(msbsr)
  p_fsbsr = 50                  ;prob(fsbsr)
  p_bsbsb = 5000                ;prob(bsbsb)
  p_msbsb = 700                 ;prob(msbsb)
  p_fsbsb = 40                  ;prob(fsbsb)
  p_sbsbc = 30                  ;prob(sbsbc)
  p_rest = 5                    ;prob(everything else)

  ;;;star values
  starmin = 12.0                ;min mag for star list
  starmax = 16.0                ;max mag for star list  
  p_st = -1                     ;star fiducial probability
 
  ;;;general run values
  epoch = 2000.0                ;no need to change
  equinox = 2000.0              ;no need to change
  thing1 = 0                    ;no need to change
  thing2 = 0                    ;no need to change
  jnom = 21.0                   ;if no jmag available

  ;;;***********************************************;;;
  

  
  ;;;read in the files
  data = mrdfits(datain, 1, datahdr, /SILENT)   ;read in data file
  IF keyword_set(HELP) THEN help, data, /STRUC  ;offer struc help
  stars = mrdfits(starsin, 1, starhdr, /SILENT) ;read in guide star file
  IF keyword_set(HELP) THEN help, stars, /STRUC ;offer struc help
  

  cra = 163.45303 
  cdec = 58.10841

  
  distance = [7.0,9.0,11.0,30.0]       ;distance divisions [arcmin]
  zphot = [0.0, 1.0, 10.0]             ;photoz quality divisions
  qphotoz = [0.0, 3.0, 6.0, 12.0, 100.0]        ;photoz quality divisions
  mag1 = [-100.0, 0.0, 18.0, 20.0, 23.5]-1.90   ;mag 1 divisions and convert to Vega which is what Tracy's catalog is in
  mag2 = [0.0, 10.0, 99999.0, 99999.0, 99999.0] ;mag 2 divisions but its really flux and we want any
  speczmasks = ['LOK200_mask1_1.0_H', 'LOK200_mask2_1.0_H', 'LOK200_mask3_H', 'LOK200_mask4_H', 'lok200_mask5_H', 'lok200_mask6_H', 'NA', 'NA']




  subsets = [ $
            {name:'cllzhq', priority:75, sets:[0,4,8,0,0]}, $
            {name:'cllzmq', priority:100, sets:[0,4,9,0,0]}, $
            {name:'cllzlq', priority:150, sets:[0,4,10,0,0]}, $
            {name:'clhzhq', priority:76, sets:[0,5,8,0,0]}, $
            {name:'clhzmq', priority:101, sets:[0,5,9,0,0]}, $
            {name:'clhzlq', priority:151, sets:[0,5,10,0,0]}, $
            {name:'fg', priority:10, sets:[6,6,6,6,6]}, $
            {name:'rtgmoneK', priority:2400, sets:[0,7,25,20,0]}, $
            {name:'rtgmone', priority:1200, sets:[0,7,25,0,0]}, $
            {name:'rtgmtwoK', priority:2400, sets:[0,7,26,20,0]}, $
            {name:'rtgmtwo', priority:1200, sets:[0,7,26,0,0]}, $
            {name:'rtgmfouK', priority:2400, sets:[0,7,28,20,0]}, $
            {name:'rtgmfou', priority:1200, sets:[0,7,28,0,0]}, $
            {name:'tg', priority:25, sets:[0,7,0,0,0]}, $
            {name:'hpzhqKM', priority:10000, sets:[0,12,13,20,22]}, $
            {name:'hpzhqK', priority:9000, sets:[0,12,13,20,21]}, $
            {name:'hpzmqKM', priority:5000, sets:[0,12,14,20,22]}, $
            {name:'hpzmqK', priority:4000, sets:[0,12,14,20,21]}, $
            {name:'hpzhqM', priority:2000, sets:[0,12,13,17,22]}, $
            {name:'hpzhq', priority:800, sets:[0,12,13,17,21]}, $
            {name:'hpzmqM', priority:500, sets:[0,12,14,17,22]}, $
            {name:'hpzmq', priority:400, sets:[0,12,14,17,21]}, $
            {name:'nr', priority:11, sets:[0,0,0,0,0]}, $
            {name:'fr', priority:1, sets:[3,3,3,3,3]} $
            ]
  


  mosfire_magmacat_specz_photoz, data, stars, DATAHDR=datahdr, STARHDR=starhdr, DIST=distance, $
                                 TAGRA='RAONE', TAGDEC='DECONE', TAGSPECZ='Z', TAGQSPECZ='QFLAG_MOSFIRE' , $
                                 TAGMASK=tagmask, SPECZMASK=speczmasks, $
                                 TAGZPHOT='Z_M2', TAGQZPHOT='Q99', ZPHOT=zphot, QZPHOT=qphotoz, $
                                 TAGMAG1='KMAG', MAG1=mag1, TAGMAG2='F24', MAG2=mag2, $
                                 CRA=cra, CDEC=cdec, SUBSETS=subsets, /REGXY, $
                                 OUTFILE=magmaout
  

END
;========================================================================================================================



;========================================================================================================================
pro nudge_lok200_20150222, VERBOSE=verbose, HELP=help

  maskfolder = 'LOK200_mask7_v3-2_2'
  maskdir = ''
  image = 'lok200_ukidss_K_mosaic_v3.fits'
  imdir = '/Users/adegroot/research/clusters/lockman/lok200/images_safe/'
  ;outfile = 'lok200_feedtomagma_inmask7_v3-2_2_nudged.fits'

  mosfire_magmacat_nudge, maskfolder, image, MASKDIR=maskdir, IMDIR=imdir ;, OUTFILE=outfile

END
;========================================================================================================================





;========================================================================================================================
pro remakecomp_lok200_20150222, VERBOSE=verbose, HELP=help


  mascat = 'lok200_feedtomagma_formask4_v2-1.txt' 
  directory = ' '
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro nextmask_lok200_20150222, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'lok200_feedtomagma_formask7_v1-0.txt'            ;master input list
  recmask = 'LOK200_mask7_v3-2_2/LOK200_mask7_v3-2_2.coords' ;just made mask
  compcat = 'lok200_feedtomagma_formask7_v1-0.fits'          ;companion list
  outfile = 'lok200_feedtomagma_formask8_v2-0.txt'           ;next input file
  outcompnext = 'lok200_feedtomagma_formask8_v2-0.fits'      ;companion to next input file
  outcompthis = 'lok200_feedtomagma_inmask7_v3-2_2.fits'     ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis, /NOID, /RETARG

END
;========================================================================================================================
