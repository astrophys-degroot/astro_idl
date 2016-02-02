;========================================================================================================================
pro mosfire_make_magmacat_j1049_20150222, $
   VERBOSE=verbose, HELP=help

  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;set default value


  ;;;***********************************************;;;
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  ;;;in files and out files
  datain = '/Users/adegroot/research/observing/keck/mosfire/20150222/J1049/J1049_specz_photoz_eazy_v2-3.fits'
  starsin = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/stars/lok400_2massstars_jhk_v1-2.fits'
  magmaout = 'j1049_feedtomagma_formask5_v3-0.txt'
  
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
  ;help, data, /STRUC                            ;offer struc help
  stars = mrdfits(starsin, 1, starhdr, /SILENT) ;read in guide star file
  IF keyword_set(HELP) THEN help, stars, /STRUC ;offer struc help

 
  cra = 162.34417 
  cdec = 56.675694

  specz = [0.0,1.695, 1.722, 3.0]
  
  distance = [7.0,9.0,11.0,30.0]       ;distance divisions [arcmin]
  tagzphot = 'Z_M2'
  zphot = [0.0, 1.1, 10.0]             ;photoz quality divisions
  tagqzphot = 'QZ99'
  qphotoz = [0.0, 1.0, 6.0, 12.0, 100.0]        ;photoz quality divisions
  tagmag1 = 'KMAG'
  mag1 = [-100.0, 0.0, 1.0, 20.0, 23.5]-1.90   ;mag 1 divisions and convert to Vega which is what Tracy's catalog is in
  tagmag2 = 'F160MAG'
  mag2 = [0.0, 19.8, 21.5, 23.5, 40.0] ;mag 2 divisions in nonsense units b/c we are missing the zero point
  tagcolor1 = 'HSTcolor'
  color1 = [0.0, 0.4, 1.1, 2.0] ;photoz quality divisions




  subsets = [ $
            {name:'cllzhq', priority:75, sets:[1,5,9,1]}, $
            {name:'cllzmq', priority:100, sets:[1,5,10,1]}, $
            {name:'cllzlq', priority:150, sets:[1,5,11,1]}, $

;            {name:'brsr', priority:25000, sets:[1,24,28,1]}, $
;            {name:'fgbrsr', priority:35, sets:[1,22,27,1]}, $
;            {name:'fgmrsr', priority:30, sets:[1,23,27,1]}, $
;            {name:'fgfrsr', priority:25, sets:[1,24,27,1]}, $
;            {name:'fgbrsb', priority:13, sets:[1,22,26,1]}, $
;            {name:'fgmrsb', priority:12, sets:[1,23,26,1]}, $
;
            {name:'fgfrsb', priority:11, sets:[1,24,26,1]}, $
            {name:'fg', priority:10, sets:[7,7,7,7]}, $
            {name:'tg', priority:25, sets:[1,8,1,1]}, $
            {name:'hpzhqK', priority:10000, sets:[1,13,14,21]}, $
            {name:'hpzmqK', priority:5000, sets:[1,13,15,21]}, $
            {name:'hpzhq', priority:1000, sets:[1,13,14,18]}, $
            {name:'hpzmq', priority:800, sets:[1,13,15,18]}, $
            {name:'nr', priority:11, sets:[1,1,1,1]}, $
            {name:'fr', priority:1, sets:[4,4,4,4]} $
            ]
  


  mosfire_magmacat_specz_photoz, data, stars, DATAHDR=datahdr, STARHDR=starhdr, DIST=distance, $
                                 TAGRA='RAONE', TAGDEC='DECONE', TAGSPECZ='Z', TAGQSPECZ='QFLAG_MOSFIRE' , $
                                 SPECZ=specz, $
                                 TAGZPHOT=tagzphot, TAGQZPHOT=tagqzphot, ZPHOT=zphot, QZPHOT=qphotoz, $
                                 TAGMAG1=tagmag1, MAG1=mag1, TAGMAG2=tagmag2, MAG2=mag2, $
                                 TAGCOLOR1=tagcolor1, color1=color1, $
                                 TAGMASKS=tagmasks, masks=masks, $
                                 CRA=cra, CDEC=cdec, SUBSETS=subsets, /REGXY, $
                                 OUTFILE=magmaout
  

END
;========================================================================================================================



;========================================================================================================================
pro remakecomp_j1049_20150222, VERBOSE=verbose, HELP=help


  mascat = 'j1049_feedtomagma_formask6_v1-0.txt' 
  directory = ' '
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro nextmask_j1049_20150222, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'j1049_feedtomagma_formask4_v2-1.txt'       ;master input list
  recmask = '../J1049_mask4_v1/J1049_mask4_v1.coords' ;just made mask
  compcat = 'j1049_feedtomagma_formask4_v2-1.fits'     ;companion list
  outfile = 'j1049_feedtomagma_formask5_v2-1txt'      ;next input file
  outcompnext = 'j1049_feedtomagma_formask5_v2-1.fits' ;companion to next input file
  outcompthis = 'j1049_feedtomagma_inmask4_v2-1.fits'  ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis, /NOID, /RETARG

END
;========================================================================================================================
