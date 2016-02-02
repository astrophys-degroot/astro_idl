;========================================================================================================================
pro mosfire_make_magmacat_xmm105, $
   VERBOSE=verbose, HELP=help

  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;set default value


  ;;;***********************************************;;;
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  ;;;in files and out files
  datain = '/Users/adegroot/research/clusters/xmm/xmm105/catalogs/ryan/XMM105_photz_candidates_v1.fits'
  starsin = '/Users/adegroot/research/clusters/xmm/xmm105/catalogs/stars/xmm105_2mass_JHK_12arcmin_v1-2.fits'
  magmaout = 'xmm105_feedtomagma_formask1_v1-0.txt'
  
  ;;;detection values
  pzhi = 10000                  ;prob multiplier photo-z
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
                           TAGRA='RA', TAGDEC='DEC', TAGSPECZ1='FORS_Z', TAGQZ1='FORS_Q', $
                           TAGSTJ='JMAG', PZHI=pzhi, PZLOW=pzlow, /REGXY, $
                           OUTFILE=magmaout
  

END
;========================================================================================================================



;========================================================================================================================
pro xmm105_remakecomp, VERBOSE=verbose, HELP=help


  mascat = 'xmm105_feedtomagma_formask1_v1-0_gill.txt' 
  directory = ' '
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro xmm105_nextmask, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'xmm105_feedtomagma_formask2_v1-0.txt'       ;master input list
  recmask = '../xmm105_mask2_v1/xmm105_mask2_v1.coords' ;just made mask
  compcat = 'xmm105_feedtomagma_formask2_v1-0.fits'     ;companion list
  outfile = 'xmm105_feedtomagma_formask3_v1-0.txt'      ;next input file
  outcompnext = 'xmm105_feedtomagma_formask3_v1-0.fits' ;companion to next input file
  outcompthis = 'xmm105_feedtomagma_inmask2_v1-0.fits'  ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis

END
;========================================================================================================================
