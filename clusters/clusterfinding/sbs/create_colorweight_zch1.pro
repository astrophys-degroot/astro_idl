;========================================================================================================================
function create_colorweight_zch1, cata, moda, zrange, tagzap, tagch1ap, tagzbest, tagch1best, TAGCS=tagcs, $
                                  SIGMA=sigma, VARYDISPER=varydisper, CSLEVEL=cslevel, GAUSSIAN=gaussian, $
                                  ZBRIGHT=zbright, ZFAINT=zfaint, CH1BRIGHT=ch1bright, CH1FAINT=ch1faint, $
                                  WRITEF=writef, WRITEP=writep, $
                                  INDIR=indir, AUXDIR=auxdir, OUTDIR=outdir, $
                                  VERBOSE=verbose, HELP=help
  


;+
; NAME:
;       CREATE_COLORWEIGHT_ZCH1()
;
; PURPOSE:
;       
;
; CALLING SEQUENCE:
;       
;
; INPUTS:
;       cata: input catalog in a FITS file format
;       moda: input CRS models file in a FITS file format
;       zrange: 2-element input array containing the min and max redshift to work with
;       tags: multi element array containing the names of tags found
;          in cata structure to work with
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;       verbose: how much info is printed to screen during run 
;       help: will print additional information to screen during run 
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
;       A. DeGroot, 2013 Sept 17, Univ. Cali, Riverside v2.1.0
;          -broke up tag name array
;          -moved some tasks to modules to save space
;          -minor formating errors
;       A. DeGroot, 2012 July 23, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 July 23, v1.0.0
;-



  ;;;Check call sequence and set new parameters
  if N_PARAMS() lt 7 then begin
     print, 'Call sequence: result = (create_colorweight_zch1, catalog, models, zrange, tagzap, tagch1ap, tagzbest, tagch1best, [tagcs=, sigma=, /WRITEF, /WRITEP ... ])'
     stop
  endif
  if keyword_set(SIGMA) then sigma = sigma[0] else sigma = 1.0                  ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1            ;sets new value
  if keyword_set(CSLEVEL) then cslevel = cslevel[0] else cslevel = 0.95         ;sets new value
  if keyword_set(GAUSSIAN) then gaussian = gaussian[0] else gaussian = 'single' ;sets new value
  if keyword_set(ZBRIGHT) then zbright = zbright[0] else zbright = 15.0         ;sets new value
  if keyword_set(ZFAINT) then zfaint = zfaint[0] else zfaint = 30.0             ;sets new value
  if keyword_set(CH1BRIGHT) then ch1bright = ch1bright[0] else ch1bright = 16.0 ;sets new value
  if keyword_set(CH1FAINT) then ch1faint = ch1faint[0] else ch1faint = 30.0     ;sets new value
  check_dir, 1                                                                  ;compile modules
  gaussians_rs, 1                                                               ;compile modules
  

  ;;;check and append directories, find files
  check_indir, indir, cata, NOTE='INDIR', VERBOSE=3   ;check data file
  check_indir, auxdir, moda, NOTE='AUXDIR', VERBOSE=3 ;check color models
  check_outdir, outdir, outflag, VERBOSE=3            ;check outfile
  print, ' '                                          ;space
  

 ;;;This section reads in files, does sanity checks
  cat = mrdfits(cata, 1)                                                                ;reads in file
  if keyword_set(HELP) then help, cat, /struc                                           ;offer help
  models = mrdfits(moda, 1)                                                             ;reads in model file
  if keyword_set(HELP) then help, models, /struc                                        ;offer help
  case (zrange[0] lt min(models.z)) of                                                  ;checks minimum z value 
     1 : begin                                                                          ;if min z value is too low
        if verbose ge 3 then print, '  Min z value is too low! Using lowest z found!'   ;print info
        zrange[0] = min(models.z)                                                       ;resets min z value
        if verbose ge 3 then print, '   Min z is now: ', zrange[0]                      ;print info
        starting = min(zrange[0]-models.z, nstart, /ABSOLUTE)                           ;find index number
     end                                                                                ;end if min z values too low
     0 : begin                                                                          ;min z value not too low
        if verbose ge 3 then print, '  Min z value is good!'                            ;print info
        starting = min(models.z-zrange[0], nstart, /ABSOLUTE)                           ;find index number
     end                                                                                ;end min z value not too low
  endcase                                                                               ;end check min z value
  case (zrange[1] gt max(models.z)) of                                                  ;checks max z value 
     1 : begin                                                                          ;max z value too high
        if verbose ge 3 then print, '  Max z value is too high! Using highest z found!' ;print info
        zrange[1] = max(models.z)                                                       ;resets max z value
        if verbose ge 3 then print, '   Max z is now: ', zrange[1]                      ;print info
        ending = min(zrange[1]-models.z, nend, /ABSOLUTE)                               ;find index number
     end                                                                                ;end max z value too high
     0 : begin                                                                          ;max z not too high
        if verbose ge 3 then print, '  Max z value is good!'                            ;print info
        ending = min(zrange[1]-models.z, nend, /ABSOLUTE)                               ;find index number
     end                                                                                ;end max z not too high
  endcase                                                                               ;end check max z value
  print, ' '                                                                            ;spacer
  

  ;;;This section sets the appropriate values by tag reference
  note = '  Tag given for zband aper mag values not valid!! Please supply another!!' ;info
  cat_zmag = tagind(cat, tagzap[0], /DATA, NOTE=note)                                ;find tag ind
  
  note =  '  Tag given for zband aper mag error values not valid!! Please supply another!!' ;info 
  cat_zerr = tagind(cat, tagzap[1], /DATA, NOTE=note)                                       ;find tag ind
  
  note =  '  Tag given for ch1 aper mag values not valid!! Please supply another!!' ;info
  cat_ch1mag = tagind(cat, tagch1ap[0], /DATA, NOTE=note)                           ;find tag ind
  
  note =  '  Tag given for ch1 aper mag error values not valid!! Please supply another!!' ;info
  cat_ch1err = tagind(cat, tagch1ap[1], /DATA, NOTE=note)                                 ;find tag ind
  
  note =  '  Tag given for zband best mag values not valid!! Please supply another!!' ;info 
  cat_zbest = tagind(cat, tagzbest[0], /DATA, NOTE=note)                              ;find tag ind
  
  note =  '  Tag given for zband best mag error values not valid!! Please supply another!!' ;info
  cat_zbesterr = tagind(cat, tagzbest[1], /DATA, NOTE=note)                                 ;find tag ind
  
  note =  '  Tag given for ch1 best mag values not valid!! Please supply another!!' ;info
  cat_ch1best = tagind(cat, tagch1best[0], /DATA, NOTE=note)                        ;find tag ind
  
  note =  '  Tag given for ch1 best mag error values not valid!! Please supply another!!' ;info
  cat_ch1besterr = tagind(cat, tagch1best[1], /DATA, NOTE=note)                           ;find tag ind
  
  CASE keyword_set(TAGCS) OF                                                                       ;check CLASS/STAR tag 
     1 : BEGIN                                                                                     ;if tag exists
        note =  '  Tag given for class/star classifier values not valid!! Please supply another!!' ;info
        cat_cs = tagind(cat, tagcs[0], /DATA, NOTE=note)                                           ;find tag ind
     END                                                                                           ;end if tag exists
     0 : BEGIN                                                                                     ;if tag not exist
        if verbose GE 2 THEN print, '  No CLASS/STAR identifier given!!'                           ;info
     END                                                                                           ;end if tag not exist
     ELSE : print, '### Something has gone horribly wrong!!!'                                      ;warning
  ENDCASE                                                                                          ;end check CLASS/STAR tag
  


  ;;;This section makes cuts on magnitude and probable star detections
  CASE keyword_set(TAGCS) OF                                  ;check CLASS/STAR tag 
     1 : BEGIN                                                ;if tag exists
        zkeep = where(cat_cs LT cslevel AND $                 ;cont next line
                      cat_zmag LT zfaint AND $                ;cont next line
                      cat_zmag GT zbright AND $               ;cont next line
                      cat_ch1mag LE ch1faint AND $            ;cont next line
                      cat_ch1mag GE ch1bright, $              ;cont next line
                      nzkeep, NCOMPLEMENT=nzcull)             ;finds which detections to remove
     END                                                      ;end if tag exists
     0 : BEGIN                                                ;if tag not exist
        zkeep = where(cat_zmag LT zfaint AND $                ;cont next lien
                      cat_zmag GT zbright AND $               ;cont next line
                      cat_ch1mag LE ch1faint AND $            ;cont next line
                      cat_ch1mag GE ch1bright, $              ;cont next line
                      nzkeep, NCOMPLEMENT=nzcull)             ;finds which detections to remove
     END                                                      ;end if tag not exist
     ELSE : print, '### Something has gone horribly wrong!!!' ;warning
  ENDCASE                                                     ;end check CLASS/STAR tag
  
  if verbose ge 2 then begin                                                      ;check VERBOSE keyword
     print, '  Number of detections removed as stars or bad detections: ', nzcull ;print info
     print, '  Number of detections kept: ', nzkeep                               ;print info
  endif                                                                           ;end check VERBOSE keyword
  cat = cat[zkeep]                                                                ;removes bad detects
  cat_zmag = cat_zmag[zkeep]                                                      ;removes bad detects
  cat_zerr = cat_zerr[zkeep]                                                      ;removes bad detects
  cat_zbest = cat_zbest[zkeep]                                                    ;removes bad detects
  cat_zbesterr = cat_zbesterr[zkeep]                                              ;removes bad detects
  cat_ch1mag = cat_ch1mag[zkeep]                                                  ;removes bad detects
  cat_ch1err = cat_ch1err[zkeep]                                                  ;removes bad detects
  cat_ch1best = cat_ch1best[zkeep]                                                ;removes bad detects
  cat_ch1besterr = cat_ch1besterr[zkeep]                                          ;removes bad detects
  cat_cs = cat_cs[zkeep]                                                          ;removes bad detects
  print, ' '                                                                      ;space
  
  ;;;Preliminary calculations
  disper = dblarr(n_elements(models.z))                   ;creates array 
  case keyword_set(VARYDISPER) of                         ;check VARYDISP keyword
     0 : begin                                            ;vary dispersion
        littlez = where(models.z lt 1.2)                  ;finds places
        disper[littlez] = 0.075                           ;sets values
        midz = where(models.z ge 1.2 and models.z lt 1.5) ;finds places
        disper[midz] = 0.10                               ;finds places
        bigz = where(models.z ge 1.5)                     ;sets values
        disper[bigz] = 0.15                               ;sets values
     end                                                  ;end vary dispersion
     1 : disper[*] = 0.10                                 ;constant dispersion
  endcase                                                 ;end check VARYDISP keyword 
  
  zmch1 = cat_zmag - cat_ch1mag               ;z' - ch1 color
  zmch1_err = sqrt(cat_zerr^2 + cat_ch1err^2) ;error in z' - ch1 color
  
  
  ;;;This section sets up the output structures
  outstruct1 = {z:0.0, slice:55, mstar_ch1:1.0}                                   ;creates structure
  outarray1 = replicate(outstruct1, (nend-nstart+1))                              ;replicate, one per slice
  outstruct2 = {RA:0.000, DEC:0.000, zmch1:0.000, zmch1_err:0.000, zbest:0.000, $ ;cont next line
                zbest_err:0.000, ch1best:0.000, ch1best_err:0.000, weight:0.000}  ;creates structure
  outarray2 = replicate(outstruct2, n_elements(cat.(1)))                          ;replicates one per detection
  outarray2.ra = cat.ra                                                           ;sets values
  outarray2.dec = cat.dec                                                         ;sets values
  outarray2.zmch1 = zmch1                                                         ;sets values
  outarray2.zmch1_err = zmch1_err                                                 ;sets values
  outarray2.zbest = cat_zbest                                                     ;sets values
  outarray2.zbest_err = cat_zbesterr                                              ;sets values
  outarray2.ch1best = cat_ch1best                                                 ;sets values
  outarray2.ch1best_err = cat_ch1besterr                                          ;sets values
  
  
  ;;;Plot creation/saving section
  window, 0, XSIZE=600, YSIZE=600, XPOS=100, YPOS=000, TITLE= 'CRS Model Color Slices'           ;window options
  xpnt = [12, 30]                                                                                ;two fake points to plot model
  for aa=nstart, nend, 1 do begin                                                                ;loop over color slices
     if aa eq nstart then begin                                                                  ;if first slice
        ypnt = [models[aa].rs_slope*xpnt + models[aa].rs_inter]                                  ;y vals for two fake points
        plot, xpnt, ypnt, /NODATA, $                                                             ;plots model
              BACKGROUND = 'FFFFFF'XL , $                                                        ;plot option
              COLOR = '000000'XL, $                                                              ;plot option
              XTITLE = 'IRAC ch1 Mag [AB]', $                                                    ;plot option
              YTITLE = 'z band - IRAC ch1 color [AB]', $                                         ;plot option
              xrange = [models[aa].mstar_ch1-8.0, models[aa].mstar_ch1+8.0], $                   ;plot option
              yrange = [models[aa].rs_inter-2.0, models[aa].rs_inter+2.0], $                     ;plot option
              ystyle = 1.0,  xstyle = 1.0, $                                                     ;plot options
              CHARSIZE=1.25                                                                      ;plot option
     endif                                                                                       ;end if first slice
     if aa mod 4 eq 0 then  begin                                                                ;takes every 4th model                         
        ypnt = [models[aa].rs_slope*xpnt + models[aa].rs_inter]                                  ;y vals for two fake points
        oplot, xpnt, ypnt, COLOR = '000000'XL                                                    ;plots model
        xyouts, xpnt[0]-1.5, ypnt[0], strcompress('z='+ string(models[aa].z), /REMOVE_ALL), $    ;what to print
                COLOR = '000000'XL, /DATA                                                        ;options
     endif                                                                                       ;end alt to first slice
  endfor                                                                                         ;end loop over color slices
  if keyword_set(WRITEP) then begin                                                              ;checks WRITE keyword
     if keyword_set(OUTDIR) then BEGIN                                                           ;check OUTDIR keyword
        pathname = strcompress(outdir+'graphics/', /REMOVE_ALL)                                  ;sets new value
        check = file_test(pathname, /DIRECTORY)                                                  ;checks a path name
        case check of                                                                            ;status of path name check
           1 : if verbose gt 3 then print, '   Directory exists!!'                               ;print info
           0 : spawn, 'mkdir ' + pathname                                                        ;creates directory otherwise
           ELSE : print, '### Something has gone horribly wrong!!!'                              ;warning
        endcase                                                                                  ;end status pathname check
        file1 = strcompress(pathname+'clusterredseq_colormodels.ps', /REMOVE_ALL)                ;sets new value
     ENDIF ELSE BEGIN                                                                            ;end check OUTDIR keyword
        file1 = strcompress('clusterredseq_colormodels.ps', /REMOVE_ALL)                         ;sets new value
     ENDELSE                                                                                     ;end alt to OUTDIR keyword
     set_plot, 'ps'                                                                              ;sets to post script
     device, FILENAME=file1, /color                                                              ;sets device
     for aa=nstart, nend, 1 do begin                                                             ;loop over color slices
        if aa eq nstart then begin                                                               ;if first slice
           ypnt = [models[aa].rs_slope*xpnt + models[aa].rs_inter]                               ;y vals for two fake points
           plot, xpnt, ypnt, $                                                                   ;plots model
                 BACKGROUND = 'FFFFFF'XL , $                                                     ;plot option
                 COLOR = '000000'XL, $                                                           ;plot option
                 XTITLE = 'IRAC ch1 Mag [AB]', $                                                 ;plot option
                 YTITLE = 'z band - IRAC ch1 color [AB]', $                                      ;plot option
                 XRANGE = [models[aa].mstar_ch1-8.0, models[aa].mstar_ch1+8.0], $                ;plot option
                 YRANGE = [models[aa].rs_inter-2.0, models[aa].rs_inter+2.0], $                  ;plot option
                 ystyle = 1.0,  xstyle = 1.0, $                                                  ;plot options
                 CHARSIZE=1.25                                                                   ;plot option
        endif                                                                                    ;end if first slice
        if aa mod 4 eq 0 then  begin                                                             ;takes every 4th model                         
           ypnt = [models[aa].rs_slope*xpnt + models[aa].rs_inter]                               ;y vals for two fake points
           oplot, xpnt, ypnt, COLOR = '000000'XL                                                 ;plots model
           xyouts, xpnt[0]-1.5, ypnt[0], strcompress('z='+ string(models[aa].z), /REMOVE_ALL), $ ;what to print
                   COLOR = '000000'XL, /DATA                                                     ;options
        endif                                                                                    ;end alt to first slice
     endfor                                                                                      ;end loop over color slices
     device, /CLOSE                                                                              ;closes device
     set_plot, 'x'                                                                               ;undoes ps
  endif                                                                                          ;end check WRITE keyword
  

  ;;;This section is the loop over all color slices
  xpnt = [10, 30]                                                  ;two fake points to plot model
  cntr = 0                                                         ;initialize
  for aa = nstart, nend do begin                                   ;begin loop over z slices
     ypnt = [models[aa].rs_slope*xpnt + models[aa].rs_inter]       ;y vals for two fake points
     onplot = where((cat_ch1mag gt models[aa].mstar_ch1-6.0) AND $ ;cont next line
                    (cat_ch1mag lt models[aa].mstar_ch1+8.0) AND $ ;cont next line
                    (zmch1 gt models[aa].rs_inter-2.0) AND $       ;cont next line
                    (zmch1 lt models[aa].rs_inter+2.0), nonplot)   ;find subset and # 
     
     if aa eq nstart then begin                                                               ;checks if first pass
        window, 1, XSIZE = 600, YSIZE = 600, XPOS=150, YPOS=050, title = 'Colour Slice'       ;window options
     endif                                                                                    ;end check if first pass
     plot, xpnt, ypnt, $                                                                      ;plots our red seq model
           BACKGROUND = 'FFFFFF'XL , $                                                        ;plot option
           COLOR = '000000'XL, $                                                              ;plot option
           XTITLE = 'IRAC ch1 Mag [AB]', $                                                    ;plot option
           YTITLE = 'z band - IRAC ch1 color [AB]', $                                         ;plot option
           xrange = [models[aa].mstar_ch1-6.0, models[aa].mstar_ch1+8.0], $                   ;plot option
           yrange = [models[aa].rs_inter-2.0, models[aa].rs_inter+2.0], $                     ;plot option
           ystyle = 1.0,  xstyle = 1.0, $                                                     ;plot options
           CHARSIZE=1.25                                                                      ;plot option
     oplot, xpnt, ypnt+disper[aa], COLOR = '000000'XL, LINESTYLE = 2.0                        ;over plots deviation of rs
     oplot, xpnt, ypnt-disper[aa], COLOR = '000000'XL, linestyle = 2.0                        ;over plots deviation of rs
     oplot, cat_ch1mag, zmch1, psym = 1, COLOR = '000000'XL                                   ;plot options
     legend, strcompress('n='+string(nonplot)), TEXTCOLORs='000000'XL, CHARSIZE=1.5, BOX=0    ;legend option
     if keyword_set(WRITEP) then begin                                                        ;checks WRITE keyword
        if keyword_set(OUTDIR) then BEGIN                                                     ;check OUTDIR keyword
           pathname = strcompress(outdir+'zI1sliceweights/', /REMOVE_ALL)                 ;sets new value
           check = file_test(pathname, /DIRECTORY)                                            ;checks a path name
           case check of                                                                      ;status of path name check
              1 : if verbose gt 3 then print, '   Directory exists!!'                         ;print info
              0 : spawn, 'mkdir ' + pathname                                                  ;creates directory otherwise
              ELSE : print, '### Something has gone horribly wrong!!!'                        ;warning
           endcase                                                                            ;end status pathname check
           file2 = strcompress(pathname+'slice'+string(models[aa].z)+'.ps', /REMOVE_ALL)      ;plot name
        ENDIF ELSE BEGIN                                                                      ;end check OUTDIR keyword
           file2 = strcompress('slice'+string(models[aa].z)+'.ps', /REMOVE_ALL)               ;plot name
        ENDELSE                                                                               ;end alt to OUTDIR keyword
        set_plot, 'ps'                                                                        ;sets to post script
        device, FILENAME=file2, /color                                                        ;device option
        plot, xpnt, ypnt, $                                                                   ;plots our red seq model
              BACKGROUND = 'FFFFFF'XL , $                                                     ;plot option
              COLOR = '000000'XL, $                                                           ;plot option
              XTITLE = 'IRAC ch1 Mag [AB]', $                                                 ;plot option
              YTITLE = 'z band - IRAC ch1 color [AB]', $                                      ;plot option
              xrange = [models[aa].mstar_ch1-6.0, models[aa].mstar_ch1+8.0], $                ;plot option
              yrange = [models[aa].rs_inter-2.0, models[aa].rs_inter+2.0], $                  ;plot option
              ystyle = 1.0,  xstyle = 1.0, $                                                  ;plot options
              CHARSIZE=1.25                                                                   ;plot option
        oplot, xpnt, ypnt+disper[aa], COLOR = '000000'XL, LINESTYLE = 2.0                     ;over plots deviation of rs
        oplot, xpnt, ypnt-disper[aa], COLOR = '000000'XL, linestyle = 2.0                     ;over plots deviation of rs
        oplot, cat_ch1mag, zmch1, psym = 1, COLOR = '000000'XL                                ;plot options
        legend, strcompress('n='+string(nonplot)), TEXTCOLORs='000000'XL, CHARSIZE=1.5, BOX=0 ;legend option
        device, /close                                                                        ;closes device
        set_plot, 'x'                                                                         ;undoes ps
     endif                                                                                    ;end check WRITE keyword
     
     
     ;;;finds weights only for galaxies in the colour slice
     outarray1[cntr].z = models[aa].z                                                               ;set value in array
     outarray1[cntr].slice = aa                                                                     ;set value in array
     outarray1[cntr].mstar_ch1 = models[aa].mstar_ch1                                               ;set value in array
     line = '  Setting up density grid: slice # '+string(aa)+' at z='+string(models[aa].z)          ;line 
     if verbose ge 2 then print, line                                                               ;print info
     weights = dblarr(n_elements(cat.ra))                                                           ;creates array for weight vals
     weightpoints = where(((zmch1) ge $                                                             ;cont next line
                           (models[aa].rs_slope*cat_ch1best+models[aa].rs_inter-disper[aa])) AND $  ;object above color slice min 
                          ((zmch1) le $                                                             ;cont next line
                           (models[aa].rs_slope*cat_ch1best+models[aa].rs_inter+disper[aa])) AND $  ;object below color slice max
                          (cat_ch1best le (models[aa].mstar_ch1+4.0)), nweightpoints)               ;proper ch1 mag 
     if verbose ge 3 then print, '   # of galaxies in color slice: ', nweightpoints                 ;print info
     if nweightpoints ne 0 then begin                                                               ;checks # of points 
        lowerlim = models[aa].rs_slope*cat_ch1best[weightpoints] + models[aa].rs_inter - disper[aa] ;find lower limit
        upperlim = models[aa].rs_slope*cat_ch1best[weightpoints] + models[aa].rs_inter + disper[aa] ;find upper limit
        for bb=0UL, nweightpoints-1, 1 do begin                                                     ;loops over points satisfying
           openw, lun, 'galaxyval.tmp', /GET_LUN                                                    ;opens temp file
           printf, lun, cat_ch1best[weightpoints[bb]], cat_ch1besterr[weightpoints[bb]], $          ;cont next line
                   zmch1[weightpoints[bb]], zmch1_err[weightpoints[bb]], FORMAT='(D,D,D,D)'         ;prints values to file
           free_lun, lun                                                                            ;frees memory
           openw, lun, 'gausslimits.tmp', /GET_LUN                                                  ;opens temp file
           printf, lun, models[aa].rs_slope, (models[aa].rs_inter-disper[aa]), $                    ;cont next line
                   models[aa].rs_slope, (models[aa].rs_inter+disper[aa]), FORMAT='(D,D,D,D)'        ;prints values to file
           free_lun, lun                                                                            ;frees memory
           !EXCEPT = 0                                                                              ;sets no exceptions
           if verbose ge 4 then begin                                                               ;check verbose status
              print, 'Lower limit:', lowerlim[bb]                                                   ;prints info
              print, 'Upper limit:', upperlim[bb]                                                   ;prints info
           endif                                                                                    ;end check verbose status
           
           CASE GAUSSIAN OF                                                                                         ;check GAUSSIAN keyword
              'single' : BEGIN                                                                                      ;if gaussian is single
                 weights[weightpoints[bb]] = qromb('gaussian_zch1', lowerlim[bb], upperlim[bb], /DOUBLE)            ;integrates
                 weights[weightpoints[bb]] = (weights[weightpoints[bb]] / $                                         ;cont next line
                                              (zmch1_err[weightpoints[bb]]*sqrt(!pi)))                              ;normalize, sets weight vals
              END                                                                                                   ;end if single
              'double' : BEGIN                                                                                      ;if GAUSSIAN double
                 xlower = cat_ch1best[weightpoints[bb]] - 10.0*cat_ch1besterr[weightpoints[bb]]                     ;10sigma less than point
                 xupper = cat_ch1best[weightpoints[bb]] + 10.0*cat_ch1besterr[weightpoints[bb]]                     ;10sigma more than point
                 xlimits = [xlower, xupper]                                                                         ;put limits together
                 
                 weights[weightpoints[bb]] = int_2d('gaussian2d_zch1', xlimits, 'gaussian2d_limits', 96, /DOUBLE)   ;integrates
                 weights[weightpoints[bb]] = (weights[weightpoints[bb]] / $                                         ;cont next line
                                              (2*!pi*zmch1_err[weightpoints[bb]]*cat_ch1besterr[weightpoints[bb]])) ;normalizes, sets weight vals
              END                                                                                                   ;end if double
              ELSE : BEGIN                                                                                          ;failsafe
                 print, 'WARNING!! Choice of GAUSSIAN not valid!!'                                                  ;print info
                 print, '  Choices are SINGLE or DOUBLE.'                                                           ;print info
                 stop                                                                                               ;stop program
              END                                                                                                   ;end failsafe
           ENDCASE                                                                                                  ;end check GAUSSIAN keyword 
        endfor                                                                                                      ;end loop over points satisfying
     endif                                                                                                          ;end check # of points
     
     
     ;;;finds weights for galaxies not in the colour slice and less than nsigma away 
     weightpoints = where(((zmch1) le $                                                             ;cont next line
                           (models[aa].rs_slope*cat_ch1best+models[aa].rs_inter-disper[aa]) AND $   ;object below color slice min
                           (zmch1 + sigma*zmch1_err) ge $                                           ;cont next line
                           (models[aa].rs_slope*cat_ch1best+models[aa].rs_inter-disper[aa])) or $   ;but above it with error
                          ((zmch1) ge $                                                             ;cont next line
                           (models[aa].rs_slope*cat_ch1best+models[aa].rs_inter+disper[aa])) AND $  ;object above color slice max
                          ((zmch1 - sigma*zmch1_err) le $                                           ;cont next line
                           (models[aa].rs_slope*cat_ch1best+models[aa].rs_inter+disper[aa])) and $  ;but below it with error
                          (cat_ch1best le models[aa].mstar_ch1 + 4.0),nweightpoints)                ;proper z'-ch1 color
     if verbose ge 3 then print, '   # of galaxies within ', sigma, ' sigma of color slice:', $     ;cont next line
                                 nweightpoints                                                      ;print info
     if nweightpoints ne 0 then begin                                                               ;checks # of points 
        lowerlim = models[aa].rs_slope*cat_ch1best[weightpoints] + models[aa].rs_inter - disper[aa] ;find lower limit
        upperlim = models[aa].rs_slope*cat_ch1best[weightpoints] + models[aa].rs_inter + disper[aa] ;find upper limit
        for bb=0UL, nweightpoints-1, 1 do begin                                                     ;loops over points satisfying
           openw, lun, 'galaxyval.tmp', /GET_LUN                                                    ;opens temp file
           printf, lun, cat_ch1best[weightpoints[bb]], cat_ch1besterr[weightpoints[bb]], $          ;cont next line
                   zmch1[weightpoints[bb]], zmch1_err[weightpoints[bb]], FORMAT='(D,D,D,D)'         ;prints values to file
           free_lun, lun                                                                            ;frees memory
           openw, lun, 'gausslimits.tmp', /GET_LUN                                                  ;opens temp file
           printf, lun, models[aa].rs_slope, (models[aa].rs_inter-disper[aa]), $                    ;cont next line
                   models[aa].rs_slope, (models[aa].rs_inter+disper[aa]), FORMAT='(D,D,D,D)'        ;prints values to file
           free_lun, lun                                                                            ;frees memory
           !EXCEPT = 0                                                                              ;sets no exceptions
           if verbose ge 4 then begin                                                               ;check verbose status
              print, 'Lower limit:', lowerlim[bb]                                                   ;prints info
              print, 'Upper limit:', upperlim[bb]                                                   ;prints info
           endif                                                                                    ;end check verbose status
     
           CASE GAUSSIAN OF                                                                                         ;check GAUSSIAN keyword
              'single' : BEGIN                                                                                      ;if gaussian is single
                 weights[weightpoints[bb]] = qromb('gaussian_zch1', lowerlim[bb], upperlim[bb], /DOUBLE)            ;integrates
                 weights[weightpoints[bb]] = (weights[weightpoints[bb]] / $                                         ;cont next line
                                              (zmch1_err[weightpoints[bb]]*sqrt(!pi)))                              ;normalize, sets weight vals
              END                                                                                                   ;end if single
              'double' : BEGIN                                                                                      ;if GAUSSIAN double
                 xlower = cat_ch1best[weightpoints[bb]] - 5.0*cat_ch1besterr[weightpoints[bb]]                      ;5sigma less than point
                 xupper = cat_ch1best[weightpoints[bb]] + 5.0*cat_ch1besterr[weightpoints[bb]]                      ;5sigma less than point
                 xlimits = [xlower, xupper]                                                                         ;put limits together
                 weights[weightpoints[bb]] = int_2d('gaussian2d_zch1', xlimits, 'gaussian2d_limits', 96, /DOUBLE)   ;integrates
                 weights[weightpoints[bb]] = (weights[weightpoints[bb]] / $                                         ;cont next line
                                              (2*!pi*zmch1_err[weightpoints[bb]]*cat_ch1besterr[weightpoints[bb]])) ;normalizes, sets weight vals
              END                                                                                                   ;end if double
              ELSE : BEGIN                                                                                          ;failsafe
                 print, 'WARNING!! Choice of GAUSSIAN not valid!!'                                                  ;print info
                 print, '  Choices are SINGLE or DOUBLE.'                                                           ;print info
                 stop                                                                                               ;stop program
              END                                                                                                   ;end failsafe
           ENDCASE                                                                                                  ;end check GAUSSIAN keyword 
        endfor                                                                                                      ;end loop over points satisfying
     endif                                                                                                          ;end check # of points
     
     
     if keyword_set(OUTDIR) then BEGIN                                                                ;check OUTDIR keyword
        pathname = strcompress(outdir + 'zI1sliceweights/', /REMOVE_ALL)                              ;sets new value
        check = file_test(pathname, /DIRECTORY)                                                       ;checks a path name
        case check of                                                                                 ;status of path name check
           1 : if verbose gt 3 then print, '   Directory exists!!'                                    ;print info
           0 : spawn, 'mkdir ' + pathname                                                             ;creates directory otherwise
           ELSE : print, '### Something has gone horribly wrong!!!'                                   ;warning
        endcase                                                                                       ;end status pathname check
        weight_file = strcompress(pathname+'slice'+string(models[aa].z)+'_weights.fits', /remove_all) ;creates file name
     ENDIF ELSE BEGIN                                                                                 ;end check OUTDIR keyword
        weight_file = strcompress('slice'+string(models[aa].z)+'_weights.fits', /remove_all)          ;creates file name
     ENDELSE                                                                                          ;end alt to OUTDIR keyword
     
     if verbose ge 4 then print, '  ', weight_file     ;prints info
     outarray2.weight = weights                        ;sets values
     if keyword_set(HELP) then help, outarray2, /struc ;prints info
     mwrfits, outarray2, weight_file, /CREATE          ;write file
     print, ' '                                        ;space
     cntr++                                            ;up counter by 1
  endfor                                               ;end loop over redshift slices
  
  
  ;;;This section writes out another file, cleans up
  ;;;This section writes out another file, cleans up
  if keyword_set(OUTDIR) then begin                                                         ;check OUTDIR keyword
     indname = strcompress(outdir[0]+'auxiliary/'+'zI1sliceindex.fits', /REMOVE_ALL)         ;name 
  endif else indname = strcompress('zI1sliceindex.fits', /REMOVE_ALL)                       ;name 
  mwrfits, outarray1, indname, /CREATE                                                      ;write file
  if keyword_set(OUTDIR) then begin                                                         ;check OUTDIR keyword
     signame = strcompress(outdir[0]+'auxiliary/'+'zI1summary_colorslice.fits', /REMOVE_ALL) ;name 
  endif else signame = strcompress('zI1summary_colorslice.fits', /REMOVE_ALL)               ;name 
  mwrfits, outarray3, signame, /CREATE                                                      ;write file
  spawn, 'mv *summary* auxiliary/'                                                          ;removed temporary files
  spawn, 'mv *.ps graphics/'                                                                ;removed temporary files
  spawn, 'rm *.tmp'                                                                         ;removed temporary files
  spawn, 'rm ../*.tmp'                                                                      ;removed temporary files
END
;========================================================================================================================




;integrate (integrate(exp((-(21.9631-x)^2/(2*0.0301^2))+(-(3.32355-y)^2/(0.058156^2))), y, -0.0926x-4.8966, -0.0926x+5.0406), x, 20, 24)
;integrate(e^(x (24241.6-551.87 x)) (1.577272377954869×10^-115615 erf(29.5249-1.59227 x)+1.577272377954869×10^-115615 erf(1.59227 x+141.347)), x, 20, 24)
;========================================================================================================================
pro call_create_colorweight_zch1

  indir = '/Users/degroota/research/current8_en1clusterfinding/' ;dont forget the trailing slash
  incat = 'en1_multipass_v1.1.fits'
  
  auxdir = '/Users/degroota/research/current8_en1clusterfinding/auxiliary/' ;dont forget the trailing slash
  models = 'zprimemI1vsI1seqszf40_v3.0.fits'
  
  outdir = '/Users/degroota/research/current8_en1clusterfinding/' ;dont forget the trailing slash
  
  zrange = [1.2, 1.7]           ;redshift range
  sigma = 1.0                   ;how close to be in redshift color
  gauss = 'double'              ;use 2D gaussian for weights
  
  tagzap = ['mag_aper6_2', 'magerr_aper6_2']     ;mag, error
  tagch1ap = ['mag_aper6_1', 'magerr_aper6_1']   ;mag, error
  tagzbest = ['mag_auto', 'magerr_auto']         ;mag, error
  tagch1best = ['mag_aper6_1', 'magerr_aper6_1'] ;mag, error
  tagcs = ['class_star_2']                       ;class/star indentifier 
  
  result = create_colorweight_zch1( incat, models, zrange, tagzap, tagch1ap, tagzbest, tagch1best, TAGCS=tagcs, $ ;
                                    SIGMA=sigma, GAUSSIAN=gauss, $                                                ;
                                    INDIR=indir, AUXDIR=auxdir, OUTDIR=outdir, /WRITEP, VERBOSE=3)                ;, /HELP)

end
;========================================================================================================================
