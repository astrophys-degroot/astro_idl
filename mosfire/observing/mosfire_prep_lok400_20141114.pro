;========================================================================================================================
pro mosfire_make_magmacat_lok400, $
   VERBOSE=verbose, HELP=help

  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;set default value


  ;;;***********************************************;;;
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  ;;;in files and out files
  datain = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/tracy/lok400_photoz_tracy_v1-2.fits'
  starsin = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/stars/lok400_2massstars_jhk_v1-2.fits'
  magmaout = 'lok400_feedtomagma_formask5_v1-0.txt'
  
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
  

  mosfire_magmacat_photoz, data, stars, DATAHDR=datahdr, STARHDR=starhdr, $
                           TAGRA='RA_1', TAGDEC='DEC_1', TAGSPECZ1='ZSP', TAGQZ1='Z', $
                           TAGSPECZ2='Z_M2', TAGQZ2='QZ99', $
                           PZHI=pzhi, PZMED=pzmed, PZLOW=pzlow, /REGXY, $
                           OUTFILE=magmaout
  

END
;========================================================================================================================



;========================================================================================================================
pro remakecomp_lok400, VERBOSE=verbose, HELP=help


  mascat = 'lok400_feedtomagma_formask4_v2-1.txt' 
  directory = ' '
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro nextmask_lok400, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'lok400_feedtomagma_formask4_v2-1.txt'       ;master input list
  recmask = '../LOK400_mask4_v1/LOK400_mask4_v1.coords' ;just made mask
  compcat = 'lok400_feedtomagma_formask4_v2-1.fits'     ;companion list
  outfile = 'lok400_feedtomagma_formask5_v2-1txt'      ;next input file
  outcompnext = 'lok400_feedtomagma_formask5_v2-1.fits' ;companion to next input file
  outcompthis = 'lok400_feedtomagma_inmask4_v2-1.fits'  ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis, /NOID, /RETARG

END
;========================================================================================================================
