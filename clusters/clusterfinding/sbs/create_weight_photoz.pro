;========================================================================================================================
FUNCTION indiv_weight_lh, zpeaks, uzerr, llimit, ulimit, SIGTOOFAR=sigtoofar, VERBOSE=verbose
  
  IF keyword_set(SIGTOOFAR) THEN sigtoofar = sigtoofar[0] ELSE sigtoofar = 1.0 ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 4           ;set new value

  zweight = dblarr(n_elements(zpeaks))                                              ;create array
  toofar = where((abs(zpeaks - llimit) / uzerr) GT sigtoofar, COMPLEMENT=nottoofar) ;find super low z objs
  zweight[toofar] = 0.0                                                             ;set to zero prob
  
  FOR bb=0UL, n_elements(nottoofar)-1, 1 DO BEGIN ;loop over detections
     IF (verbose GE 4) AND (bb mod 5000 EQ 0) THEN print, '    Step:', bb, ' of ', n_elements(nottoofar) ;print progres
     openw, lun, 'galaxyval.tmp', /GET_LUN                                                               ;opens temp file
     printf, lun, zpeaks[nottoofar[bb]], uzerr[nottoofar[bb]], FORMAT='(D,D)'                            ;prints values to file
     close, lun                                                                                          ;close memory unit
     free_lun, lun                                                                                       ;frees memory
     zweight[nottoofar[bb]] = qromb('gaussian_photoz', llimit, ulimit, /DOUBLE)                          ;integrate to lower z bound
     zweight[nottoofar[bb]]  = zweight[nottoofar[bb]] / (sqrt(!pi) * uzerr[nottoofar[bb]])               ;normalize
  ENDFOR
  
  ;;;a sanity check: cant have more than half a normal gaussian
  chk = where(zweight GT 0.5)                                                ;make chk
  IF chk[0] NE -1 THEN BEGIN                                                 ;if chk fails
     print, 'WARNING!!! A detection has a half probability great than 0.5!!' ;print info
                                ;stop                                                                   ;stop program
  ENDIF                         ;end chk fails
   
  RETURN, zweight                ;return values
END
;========================================================================================================================



;========================================================================================================================
FUNCTION indiv_weight_in, zpeaks, lzerr, uzerr, llimit, ulimit, SIGTOOFAR=sigtoofar, VERBOSE=verbose
  
  IF keyword_set(SIGTOOFAR) THEN sigtoofar = sigtoofar[0] ELSE sigtoofar = 1.0 ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 4           ;set new value

  zweight = dblarr(n_elements(zpeaks)) ;create array
  
  FOR bb=0UL, n_elements(zpeaks)-1, 1 DO BEGIN                                                           ;loop over detections
     IF (verbose GE 4) AND (bb mod 5000 EQ 0) THEN print, '    Step:', bb, ' of ', n_elements(zpeaks)    ;print progres
     openw, lun, 'galaxyval.tmp', /GET_LUN                                                               ;opens temp file
     printf, lun, zpeaks[bb], lzerr[bb], FORMAT='(D,D)'                                                  ;prints values to file
     close, lun                                                                                          ;close memory unit
     free_lun, lun                                                                                       ;frees memory
     first = qromb('gaussian_photoz', llimit, zpeaks[bb], /DOUBLE)                                       ;integrate to lower z bound
     first  = first / (sqrt(!pi) * lzerr[bb])                                                            ;normalize
     openw, lun, 'galaxyval.tmp', /GET_LUN                                                               ;opens temp file
     printf, lun, zpeaks[bb], uzerr[bb], FORMAT='(D,D)'                                                  ;prints values to file
     close, lun                                                                                          ;close memory unit
     free_lun, lun                                                                                       ;frees memory
     second = qromb('gaussian_photoz', zpeaks[bb], ulimit, /DOUBLE)                                      ;integrate to lower z bound
     second  = second / (sqrt(!pi) * uzerr[bb])                                                          ;normalize
     zweight[bb] = first + second
  ENDFOR

  ;;;a sanity check: cant have more than half a normal gaussian
  chk = where(zweight GT 1.0)                                               ;make chk
  IF chk[0] NE -1 THEN BEGIN                                                ;if chk fails
     print, 'WARNING!!! An in detection has a probability great than 1.0!!' ;print info
                                ;stop                                                                   ;stop program
  ENDIF                         ;end chk fails
   
  RETURN, zweight                ;return values
END
;========================================================================================================================




;========================================================================================================================
FUNCTION create_weight_photoz, detections, zrange, ZMAX=zmax, DELTAZ=deltaz, NULLZ=nullz, $
                               RATAG=ratag, DECTAG=dectag, PZTAG=pztag, $
                               PZL68TAG=pzl68tag, PZU68TAG=pzu68tag, $
                               PZL68TAG=pzl90tag, PZU68TAG=pzu90tag, $
                               PZL68TAG=pzl99tag, PZU68TAG=pzu99tag, $
                               FULLSTEP=fullstep, PROBDIST=probdist, $
                               ;COLORZCH1=colorzch1, BRCH2=brch2, $
                               ;SIGMA=sigma, INS=ins, ZDEPTH=zdepth, $
                               DATADIR=datadir, OUTDIR=OUTDIR, $
                               VERBOSE=verbose, HELP=help, WRITEFILES=writefiles, SCREENP=screenp, WRITEP=writep
  


;+
; NAME:
;       CREATE_WEIGHT_PHOTOZ()
;
; PURPOSE:       
;
; CALLING SEQUENCE:
;       
; INPUTS:
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;
; COMMON BLOCKS:
;
; PROCEDURES USED:
;
; COMMENTS:
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2014 June 3, Univ. Cali, Riverside v1.0.0
;          -creation
;-
  
 

  IF keyword_set(ZMAX) THEN zmax = zmax[0] ELSE zmax = 7.0                      ;sets new value
  IF keyword_set(DELTAZ) THEN deltaz = deltaz[0] ELSE deltaz = 0.20             ;sets new value
  IF keyword_set(NULLZ) THEN nullz = nullz[0] ELSE nullz = 99.0                 ;sets new value
  IF keyword_set(RATAG) THEN ratag = ratag[0] ELSE ratag = 'RA'                 ;sets new value
  IF keyword_set(DECTAG) THEN dectag = dectag[0] ELSE dectag = 'DEC'            ;sets new value
  IF keyword_set(PZTAG) THEN pztag = pztag[0] ELSE pztag = 'zphot'              ;sets new value
  IF keyword_set(PZL68TAG) THEN pzl68tag = pzl68tag[0] ELSE pzl68tag = 'zinf68' ;sets new value
  IF keyword_set(PZU68TAG) THEN pzu68tag = pzu68tag[0] ELSE pzu68tag = 'zsup68' ;sets new value
  IF keyword_set(PZL90TAG) THEN pzl90tag = pzl90tag[0] ELSE pzl90tag = 'zinf90' ;sets new value
  IF keyword_set(PZU90TAG) THEN pzu90tag = pzu90tag[0] ELSE pzu90tag = 'zsup90' ;sets new value
  IF keyword_set(PZL99TAG) THEN pzl99tag = pzl99tag[0] ELSE pzl99tag = 'zinf99' ;sets new value
  IF keyword_set(PZU99TAG) THEN pzu99tag = pzu99tag[0] ELSE pzu99tag = 'zsup99' ;sets new value
  IF keyword_set(probdist) THEN probdist = probdist[0] ELSE probdist = 'indiv'  ;sets new value
  
  ;if keyword_set(COLORZCH1) then lim_zmch1 = colorzch1[0] else lim_zmch1 = 1.75 ;sets new value, AB mag
  ;if keyword_set(BRCH2) then brch2 = brch2[0] else brch2 = 16.0                             ;sets new value, AB mag
  ;if keyword_set(SIGMA) then sigma = sigma[0] else sigma = 1.0                              ;sets new value
  ;if keyword_set(INS) then ins = ins[0] else ins = 1.0                                      ;sets new value
  ;if keyword_set(ZDEPTH) then zdepth = zdepth[0] else zdepth = 24.0                         ;sets new value
  ;if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2                        ;sets new value
  check_dir, 1                  ;compile modules
  gaussians_photoz, 1           ;compile modules
  
  ;;;check and append directories, find files
  IF verbose GE 1 THEN BEGIN                                ;check keyword
     print, ' '                                             ;space
     print, 'Input file: ', detections                      ;print info
     print, 'Input file directory:', datadir                ;print info
     print, 'Output file directory:', outdir                ;print info
     print, ''                                              ;space
  ENDIF                                                     ;end check keyword
  check_indir, datadir, detections, NOTE='INDIR', VERBOSE=3 ;check data file
  check_outdir, outdir, outflag, VERBOSE=3                  ;check outfile

  ;;;This section reads in files, does sanity checks
  detects = mrdfits(detections, 1, /SILENT)       ;reads in detection file
  IF keyword_set(HELP) then help, detects, /STRUC ;offer help
  print, ' '                                      ;print spacer
  
  ;;;This section sets the appropriate values by tag reference
  raind =  tagind(detects, ratag, NOTE='RA tag not found!', /NOSTOP, VERBOSE=1)                            ;find ra index
  decind =  tagind(detects, dectag, NOTE='DEC tag not found!', /NOSTOP, VERBOSE=1)                         ;find dec index
  pzind =  tagind(detects, pztag, NOTE='Photo-z tag not found!', /NOSTOP, VERBOSE=1)                       ;find pz index
  pzl68ind =  tagind(detects, pzl68tag, NOTE='Photo-z lower 68% bound tag not found!', /NOSTOP, VERBOSE=1) ;find pz index
  pzu68ind =  tagind(detects, pzu68tag, NOTE='Photo-z upper 68% bound tag not found!', /NOSTOP, VERBOSE=1) ;find pz index
  pzl90ind =  tagind(detects, pzl90tag, NOTE='Photo-z lower 90% bound tag not found!', /NOSTOP, VERBOSE=1) ;find pz index
  pzu90ind =  tagind(detects, pzu90tag, NOTE='Photo-z upper 90% bound tag not found!', /NOSTOP, VERBOSE=1) ;find pz index
  pzl99ind =  tagind(detects, pzl99tag, NOTE='Photo-z lower 99% bound tag not found!', /NOSTOP, VERBOSE=1) ;find pz index
  pzu99ind =  tagind(detects, pzu99tag, NOTE='Photo-z upper 99% bound tag not found!', /NOSTOP, VERBOSE=1) ;find pz index
  
   
  ;;;sanity checks on redshift range, delta-z
  CASE (zrange[0] LT 0.0) OF                                                            ;checks minimum z value 
     1 : BEGIN                                                                          ;if min z value is too low
        IF verbose GE 3 THEN print, '   Min z value is too low! Using z=0.0'            ;print info
        zrange[0] = 0.0                                                                 ;resets min z value
     END                                                                                ;end if min z values too low
     0 : IF verbose GE 3 THEN print, '   Min z value is good!'                          ;print info
  ENDCASE                                                                               ;end check min z value
  IF verbose ge 2 THEN print, '  Min z is currently: ', zrange[0]                       ;print info
  CASE (zrange[1] GT zmax) OF                                                           ;checks max z value 
     1 : BEGIN                                                                          ;max z value too high
        IF verbose GE 3 THEN print, '   Max z value is too high! Using ZMAX=7.0!'       ;print info
        zrange[1] = 7.0                                                                 ;resets max z value
     END                                                                                ;end max z value too high
     0 : IF verbose ge 3 THEN print, '   Max z value is good!'                          ;print info
  ENDCASE                                                                               ;end check max z value
  IF verbose GE 2 THEN print, '  Max z is currently: ', zrange[1]                       ;print info
  CASE (deltaz GT (zrange[1]-zrange[0])) OF                                             ;check if dz bigger than z range
     1 : BEGIN                                                                          ;if too large
        IF verbose GE 3 THEN print, '  Delta-z value is too large! Using smaller value' ;print info
        deltaz = (zrange[1]-zrange[0])                                                  ;set to max value
     END                                                                                ;end too large
     0 : IF verbose ge 3 THEN print, '   Delta-z value is good!'                        ;if too small
  ENDCASE                                                                               ;end check 
  IF verbose GE 2 THEN print, '  Delta-z is currently: ', deltaz                        ;print info
  print, ' '                                                                            ;spacer
  

  ;;;find number of slices we will have
  IF keyword_set(FULLSTEP) THEN BEGIN
     nslices = fix((zrange[1]-zrange[0]) / deltaz) 
     slices = indgen(nslices)*deltaz + zrange[0]
  ENDIF ELSE BEGIN
     nslices = fix(2.0*(zrange[1]-zrange[0]) / deltaz) 
     slices = 0.5*indgen(nslices)*deltaz + zrange[0]
  ENDELSE

  ;;;find # of detections we have to work with
  goodpoints = where(abs(detects.(pzind) - nullz) GT 1.0, ngoodpoints) ;finds a subset
  detects = detects[goodpoints]                                        ;cull sample
  


  ;;;This section sets up the output structures
  outstruct2 = {RA:0.000, DEC:0.000, weight:0.000}                              ;creates structure
  outarray2 = replicate(outstruct2, ngoodpoints)                                ;replicates one per detection
  outarray2.ra = detects.(raind)                                                ;sets values
  outarray2.dec = detects.(decind)                                              ;sets values
  outstruct3 = {z:0.0, ninslice:55L, p50slice:10L, p75slice:10L, p90slice:10L} ;creates structure
  outarray3 = replicate(outstruct3, nslices)                                    ;replicate, one per slice
  
  

  ;;;This section is the loop over all color slices
  IF verbose ge 3 THEN print, ' # of point with possible photo-zs: ', ngoodpoints ;prints info
                                ;xpnt = [10, 30]                                                               ;two fake points to plot model
                                ;cntr = 0                                                                      ;initialize
 
  FOR aa=0, nslices-1, 1 DO BEGIN ;begin loop over redshift slices
     IF verbose ge 1 then print, '  Finding weights for slice: ', aa, ' at z=', slices[aa] ;print info
     outarray3[aa].z = slices[aa]                                                          ;sets value in output

    ;;;prep region files
     IF keyword_set(OUTDIR) THEN BEGIN                                                       ;check OUTDIR keyword
        reginname = strcompress(outdir[0]+'slice_in'+string(slices[aa])+'.reg', /REMOVE_ALL) ;name 
     ENDIF ELSE BEGIN                                                                        ;begin alternative
        reginname = strcompress('slice_in'+string(slices[aa])+'.reg', /REMOVE_ALL)           ;name
     ENDELSE                                                                                 ;end alternative 
     openw, lun2, reginname, /GET_LUN                                                        ;open second file to write
     
     
     
     ;;;find galaxies with peak in slice 
     zlow = slices[aa]-0.5*deltaz                                                     ;find lower z bound
     zhigh = slices[aa]+0.5*deltaz                                                    ;find upper z bound  
     IF verbose GE 2 THEN print, '   Min, Max of redshift slice: ', zlow, zhigh       ;cont next line
     inslice = where((detects.(pzind) GE slices[aa]-0.5*deltaz) AND $                 ;cont next line
                     (detects.(pzind) LT slices[aa]+0.5*deltaz))                      ;find detections in slice
     IF verbose GE 2 THEN print, '  # of detections with peak in redshift slice: ', $ ;cont next line
                                 n_elements(inslice)                                  ;print info
     IF inslice[0] NE -1 THEN BEGIN                                                   ;if objects in slice
        FOR xx=0, n_elements(inslice)-1, 1 DO BEGIN                                   ;loop over inslice
           printf, lun2, detects[inslice[xx]].(raind), detects[inslice[xx]].(decind)  ;print to file
        ENDFOR                                                                        ;end loop over inslice
     ENDIF                                                                            ;end if objects in slice
     close, lun2                                                                      ;close second file
     free_lun, lun2                                                                   ;free memory of second file
     

     ;;;find sigmas smartly b/c photo-z dist is definintely not gaussian
     lzerr = (detects.(pzind) - detects.(pzl68ind)) ;find lower diff 
     uzerr = (detects.(pzu68ind) - detects.(pzind)) ;find upper diff
     CASE probdist OF
        'combine' : BEGIN
           sigs = dblarr(ngoodpoints) ;create array for sigmas
           sigs = 0.5*(lzerr + uzerr)
        END
        'indiv' : BEGIN
           low = where(detects.(pzind) LT zlow, nlow)                                ;find zpeaks less than lower limit
           high = where(detects.(pzind) GT zhigh, nhigh)                             ;find zpeak above upper limit
           in = where((detects.(pzind) GE zlow) AND (detects.(pzind) LE zhigh), nin) ;find zpeaks in slice
           outarray3[aa].ninslice = nin                                              ;store # in slice
           IF ((nlow + nhigh + nin) NE ngoodpoints) THEN BEGIN                       ;sanity check
              print, 'WARNING!!! Some detections didnt sort properly!!'              ;print info
              stop                                                                   ;stop 
           ENDIF                                                                     ;end sanity check
           lowweights = indiv_weight_lh(detects[low].(pzind), uzerr[low], zlow, zhigh) ;get lows value prob in slice
           outarray2[low].weight = lowweights
                                ;help, lowweights
                                ;boxscore, lowweights
           highweights = indiv_weight_lh(detects[high].(pzind), lzerr[high], zlow, zhigh) ;get highs value prob in slice
           outarray2[high].weight = highweights
                                ;help, highweights
                                ;boxscore, highweights
           inweights = indiv_weight_in(detects[in].(pzind), lzerr[in], uzerr[in], zlow, zhigh) ;get ins prob in slice
           outarray2[in].weight = inweights
           
        END
        ELSE : BEGIN
           print, 'WARNING!! PROBDIST keyword value not recoginzed!!'
           print, '  Choices are: "combine" or "indiv". Case matters!!'
           stop
        END
     ENDCASE
     IF keyword_set(HELP) THEN help, outarray2, /STRUC ;prints info

  
     
     
     IF keyword_set(OUTDIR) THEN BEGIN                                                                ;check OUTDIR keyword
        pathname = strcompress(outdir + 'photozsliceweights/', /REMOVE_ALL)                           ;sets new value
        check = file_test(pathname, /DIRECTORY)                                                       ;checks a path name
        CASE check of                                                                                 ;status of path name check
           1 : IF verbose GT 3 THEN print, '   Directory exists!!'                                    ;print info
           0 : spawn, 'mkdir ' + pathname                                                             ;creates directory otherwise
           ELSE : print, '### Something has gone horribly wrong!!!'                                   ;warning
        ENDCASE                                                                                       ;end status pathname check
        wfile = strcompress(pathname+'slice_pz_' + string(slices[aa]) + '_weights.fits', /REMOVE_ALL) ;creates file name
        auxfile = strcompress(pathname + 'slice_pz_' + string(slices[aa]) + 'aux.fits', /REMOVE_ALL)  ;auxfile name
     ENDIF ELSE BEGIN                                                                                 ;end check OUTDIR keyword
        wfile = strcompress('slice_pz_' + string(slices[aa]) + '_weights.fits', /REMOVE_ALL)          ;creates file name
        auxfile = strcompress('slices_pz_auxiliary.fits', /REMOVE_ALL)                                ;auxfile name
     ENDELSE                                                                                          ;end alt to OUTDIR keyword
     IF verbose GE 3 THEN print, '  ', wfile                                                          ;prints info
     mwrfits, outarray2, wfile, /CREATE                                                               ;write file
  ENDFOR                                                                                              ;end loop over redshift slices
  mwrfits, outarray3, auxfile, /CREATE                                                                ;write file
  print, ' '                                                                                          ;space
  
  
  ;;;This section writes out another file, cleans up
  ;if keyword_set(OUTDIR) then begin                                                           ;check OUTDIR keyword
  ;   indname = strcompress(outdir[0]+'auxiliary/'+'I1I2sliceindex.fits', /REMOVE_ALL)         ;name 
  ;endif else indname = strcompress('I1I2sliceindex.fits', /REMOVE_ALL)                        ;name 
  ;mwrfits, outarray1, indname, /CREATE                                                        ;write file
  ;if keyword_set(OUTDIR) then begin                                                           ;check OUTDIR keyword
  ;   signame = strcompress(outdir[0]+'auxiliary/'+'I1I2summary_colorslice.fits', /REMOVE_ALL) ;name 
  ;endif else signame = strcompress('I1I2summary_colorslice.fits', /REMOVE_ALL)                ;name 
  ;mwrfits, outarray3, signame, /CREATE                                                        ;write file
  ;spawn, 'mv *summary* auxiliary/'                                                            ;removed temporary files
  ;spawn, 'mv *.ps graphics/'                                                                  ;removed temporary files
  spawn, 'rm *.tmp'             ;removed temporary files
  ;spawn, 'rm ../*.tmp'                                                                        ;removed temporary files
  
END
;========================================================================================================================



;========================================================================================================================
pro call_create_weight_photoz

  indir = '/Users/degroota/research/current8_en1clusterfinding/photoz_clusterfind/' ;dont forget the trailing slash
  incat = 'en1_servspublic_zphot_supergood.fits'
    
  outdir = '/Users/degroota/research/current8_en1clusterfinding/photoz_clusterfind/' ;dont forget the trailing slash
  
  zrange = [0.5, 3.0]
  dz = 0.1
  sigma = 1.0
  ins = 1.1
  
  result = create_weight_photoz(incat, zrange, deltaz=dz, RA='RA_12', DEC='DEC_12', $
                                DATADIR=indir, OUTDIR=outdir, VERBOSE=2, /SCREENP, /WRITEP)
end
;========================================================================================================================
