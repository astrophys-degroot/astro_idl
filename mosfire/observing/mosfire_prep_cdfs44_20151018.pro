;========================================================================================================================
pro mosfire_make_magmacat_cdfs44_20151018, $
   VERBOSE=verbose, HELP=help

  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;set default value


  ;;;***********************************************;;;
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  ;;;in files and out files
  datain = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/CDFS44_pz_specz_full_v3-7-4.fits'
  starsin = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/public/cdfs44_2mass_JHK_14arcmin_v1-1.fits'
  magmaout = 'cdfs44_feedtomagma_formask9_v1-1.txt'
  
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

 
  cra = 52.7328                  ;center RA   
  cdec = -28.7166                ;center Dec
  distance = [2.0,7.0,11.0,30.0] ;distance divisions [arcmin]
  
  specz = [0.0,1.606, 1.646, 3.0]  
  qspecz = [-2,-1,0,1,2,3]  

  tagzphot = 'PH_Z_M2'          ;
  zphot = [0.0, 1.1, 3.0, 10.0] ;photoz quality divisions
  
  tagqzphot = 'PH_PZINT'          ;
  qzphot = [0.0, 0.25, 0.50, 0.75, 1.0] ;photoz quality divisions
  
  tagmag1 = 'PH_LSFR'            ;photo-z SFR
  mag1 = [-2.0,-1.0,0.0,1.0,2.0] ;



                                ;tagqzphot = 'QZ99'
                                ;qphotoz = [0.0, 1.0, 6.0, 12.0, 100.0]        ;photoz quality divisions
                                ;tagmag2 = 'F160MAG'
                                ;mag2 = [0.0, 19.8, 21.5, 23.5, 40.0] ;mag 2 divisions in nonsense units b/c we are missing the zero point
                                ;tagcolor1 = 'HSTcolor'
                                ;color1 = [0.0, 0.4, 1.1, 2.0] ;photoz quality divisions




  subsets = [ $
            {name:'clhq', priority:5, sets:[6,10,10,10]}, $         ;
            {name:'clmq', priority:4, sets:[6,11,11,11]}, $         ;
            {name:'cllq', priority:3, sets:[6,12,12,12]}, $         ;
            {name:'qclpz', priority:1000, sets:[1,8,14,14]}, $      ;
            {name:'qchpzco', priority:15000, sets:[1,8,15,15]}, $   ;
            {name:'qnlpz', priority:900, sets:[2,8,14,14]}, $       ;Quiescent Near Low Photo-Z
            {name:'qnhpzco', priority:14000, sets:[2,8,15,15]}, $   ;Quiescent Near High Photo-Z COntinuum
            {name:'qnhpzhils', priority:9000, sets:[1,15,20,21]}, $ ;Quiescent Near High Photo-Z High In Low Sfr
            {name:'qnhpzhims', priority:8500, sets:[1,15,20,22]}, $ ;
            {name:'qnhpzmils', priority:8000, sets:[1,15,19,21]}, $ ;Quiescent Near High Photo-Z Medium In Low Sfr
            {name:'qnhpzmims', priority:7500, sets:[1,15,19,22]}, $ ;
            {name:'qchpzhils', priority:8000, sets:[2,15,20,21]}, $ ;Quiescent Close High Photo-Z High In Low Sfr
            {name:'qchpzhims', priority:7500, sets:[2,15,20,22]}, $ ;
            {name:'qchpzmils', priority:7000, sets:[2,15,19,21]}, $ ;Quiescent Close High Photo-Z Medium In Low Sfr
            {name:'qchpzmims', priority:6500, sets:[2,15,19,22]}, $  ;
            {name:'rest', priority:10, sets:[4,4,4,4]} $            ;
            
            ]


  mosfire_magmacat_specz_photoz, data, stars, DATAHDR=datahdr, STARHDR=starhdr, $
                                 TAGRA='RAONE', TAGDEC='DECONE', DIST=distance, CRA=cra, CDEC=cdec, $
                                 TAGSPECZ='SP_M_Z', SPECZ=specz, $
                                 TAGQSPECZ='SP_M_QFLAG_MOSFIRE', QSPECZ=qspecz, $
                                 TAGZPHOT=tagzphot, ZPHOT=zphot, $
                                 TAGQZPHOT=tagqzphot, QZPHOT=qzphot, $
                                 TAGMAG1=tagmag1, MAG1=mag1, $
                                ;TAGMAG2=tagmag2, MAG2=mag2, $
                                ;TAGCOLOR1=tagcolor1, color1=color1, $
                                ;TAGMASKS=tagmasks, masks=masks, $
                                 SUBSETS=subsets, /REGXY, $
                                 OUTFILE=magmaout
  

END
;========================================================================================================================



;========================================================================================================================
pro remakecomp_cdfs44_20151018, VERBOSE=verbose, HELP=help


  mascat = 'cdfs44_feedtomagma_formask9_v1-1.txt' 
  directory = ' '
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro nextmask_cdfs44_20151018, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'cdfs44_feedtomagma_formask4_v2-1.txt'       ;master input list
  recmask = '../CDFS44_mask4_v1/CDFS44_mask4_v1.coords' ;just made mask
  compcat = 'cdfs44_feedtomagma_formask4_v2-1.fits'     ;companion list
  outfile = 'cdfs44_feedtomagma_formask5_v2-1txt'      ;next input file
  outcompnext = 'cdfs44_feedtomagma_formask5_v2-1.fits' ;companion to next input file
  outcompthis = 'cdfs44_feedtomagma_inmask4_v2-1.fits'  ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis, /NOID, /RETARG

END
;========================================================================================================================
