;========================================================================================================================
function create_colorweight_ch1ch2, detections, models, zrange, tags, $
                                    MAGLIMS=maglims, COLORZCH1=colorzch1, BRCH2=brch2, GAUSSIAN=gaussian, $
                                    SIGMA=sigma, INS=ins, ZDEPTH=zdepth, VARYDISPER=varydisper, $
                                    DATADIR=datadir, AUXDIR=auxdir, OUTDIR=OUTDIR, $
                                    VERBOSE=verbose, HELP=help, WRITEFILES=writefiles, SCREENP=screenp, WRITEP=writep
  


;+
; NAME:
;       CREATE_COLORWEIGHT_CH1CH2()
;
; PURPOSE:
;       This program makes weights for galaxies for each model colour slice
;       These weights are stored in the /sliceweightszfxx/ directory
;       ========================If there is a problem i.e. weights are negative... need to use
;       the GAUSS_REDSEQUENCE function for integration
;       
;
; CALLING SEQUENCE:
;       
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
;       A. DeGroot, 2012 June 1, Univ. Cali, Riverside v2.1.0
;          -worked in check_dir model for finding files
;       A. DeGroot, 2012 June 1, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 June, v1.0.0
;-
  
 

  if keyword_set(MAGLIMS) then begin                                                        ;check MAGLIMS keyword
     case n_elements(MAGLIMS) of                                                            ;check size of MAGLIMS
        2 : begin                                                                           ;if MAGLIMS has 2 elements
           ch1lim1 = maglims[0]                                                             ;sets new value
           ch2lim1 = maglims[1]                                                             ;sets new value
        end                                                                                 ;end if MAGLIMS has two elements
        4 : begin                                                                           ;if MAGLIMS has 4 elements
           ch1lim1 = maglims[0]                                                             ;sets new value
           ch2lim1 = maglims[1]                                                             ;sets new value
           ch1lim2 = maglims[2]                                                             ;sets new value
           ch2lim2 = maglims[3]                                                             ;sets new value
        end                                                                                 ;end if MAGLIMS has 4 elements
        6 : begin                                                                           ;if MAGLIMS has 6 elements
           ch1lim1 = maglims[0]                                                             ;sets new value
           ch2lim1 = maglims[1]                                                             ;sets new value
           ch1lim2 = maglims[2]                                                             ;sets new value
           ch2lim2 = maglims[3]                                                             ;sets new value
           ch1lim3 = maglims[4]                                                             ;sets new value
           ch2lim3 = maglims[5]                                                             ;sets new value
        end                                                                                 ;end if MAGLIMS has 6 elements
        else : print, '  Maglims must have 2, 4 or 6 arguements'                            ;print info
     endcase                                                                                ;end check of MAGLIMS size
  endif                                                                                     ;end check MAGLIMS keyword
  if keyword_set(COLORZCH1) then lim_zmch1 = colorzch1[0] else lim_zmch1 = 1.75             ;sets new value, AB mag
  if keyword_set(BRCH2) then brch2 = brch2[0] else brch2 = 16.0                             ;sets new value, AB mag
  if keyword_set(GAUSSIAN) then gaussian = gaussian[0] else gaussian = 'single'             ;sets new value
  if keyword_set(SIGMA) then sigma = sigma[0] else sigma = 1.0                              ;sets new value
  if keyword_set(INS) then ins = ins[0] else ins = 1.0                                      ;sets new value
  if keyword_set(ZDEPTH) then zdepth = zdepth[0] else zdepth = 24.0                         ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2                        ;sets new value
  check_dir, 1                                                                              ;compile modules
  gaussians_sbs, 1                                                                          ;compile modules


  ;;;check and append directories, find files
  print, datadir 
  print, detections
  check_indir, datadir, detections, NOTE='INDIR', VERBOSE=3 ;check data file
  check_indir, auxdir, models, NOTE='AUXDIR', VERBOSE=3     ;check color models
  check_outdir, outdir, outflag, VERBOSE=3                  ;check outfile
  print, ' '                                                ;space
  print, detections
  print, models
  print, outdir
  print, '' 
  
 
  ;;;This section reads in files, does sanity checks
  detects = mrdfits(detections, 1)                                                      ;reads in detection file
  if keyword_set(HELP) then help, detects, /struc                                       ;offer help
  models = mrdfits(models, 1)                                                           ;reads in model file
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
  status = tag_exist(detects, tags[0], INDEX=ind_zmag, /TOP_LEVEL)                               ;check tag
  case status of                                                                                 ;begin case on status
     1 : begin                                                                                   ;one status value
        detects_zmag = detects.(ind_zmag)                                                        ;sets values
     end                                                                                         ;end if tag found
     0 : begin                                                                                   ;one status value 
        print, '  Tag given for 1st set of magnitude values not valid!! Please supply another!!' ;print info
        print, '  ', tags[0]                                                                     ;prints info
        stop                                                                                     ;stops program
     end                                                                                         ;end case status of
  endcase                                                                                        ;end case on status
  status = tag_exist(detects, tags[1], INDEX=ind_zerr, /TOP_LEVEL)                               ;check tag
  case status of                                                                                 ;begin case on status
     1 : begin                                                                                   ;one status value
        detects_zerr = detects.(ind_zerr)                                                        ;sets values
     end                                                                                         ;end if tag found
     0 : begin                                                                                   ;one status value 
        print, '  Tag given for 1st set of  error values not valid!! Please supply another!!'    ;print info
        print, '  ', tags[1]                                                                     ;prints info
        stop                                                                                     ;stops program
     end                                                                                         ;end case status of
  endcase                                                                                        ;end case on status
  status = tag_exist(detects, tags[2], INDEX=ind_ch1mag, /TOP_LEVEL)                             ;check tag
  case status of                                                                                 ;begin case on status
     1 : begin                                                                                   ;one status value
        detects_ch1mag = detects.(ind_ch1mag)                                                    ;sets values
     end                                                                                         ;end if tag found
     0 : begin                                                                                   ;one status value 
        print, '  Tag given for 2nd set of magnitude values not valid!! Please supply another!!' ;print info
        print, '  ', tags[2]                                                                     ;prints info
        stop                                                                                     ;stops program
     end                                                                                         ;end case status of
  endcase                                                                                        ;end case on status
  status = tag_exist(detects, tags[3], INDEX=ind_ch1err, /TOP_LEVEL)                             ;check tag
  case status of                                                                                 ;begin case on status
     1 : begin                                                                                   ;one status value
        detects_ch1err = detects.(ind_ch1err)                                                    ;sets values
     end                                                                                         ;end if tag found
     0 : begin                                                                                   ;one status value 
        print, '  Tag given for 2nd set of error values not valid!! Please supply another!!'     ;print info
        print, '  ', tags[3]                                                                     ;prints info
        stop                                                                                     ;stops program
     end                                                                                         ;end case status of
  endcase                                                                                        ;end case on status
  status = tag_exist(detects, tags[4], INDEX=ind_ch2mag, /TOP_LEVEL)                             ;check tag
  case status of                                                                                 ;begin case on status
     1 : begin                                                                                   ;one status value
        detects_ch2mag = detects.(ind_ch2mag)                                                    ;sets values
     end                                                                                         ;end if tag found
     0 : begin                                                                                   ;one status value 
        print, '  Tag given for 3rd set of magnitude values not valid!! Please supply another!!' ;print info
        print, '  ', tags[4]                                                                     ;prints info
        stop                                                                                     ;stops program
     end                                                                                         ;end case status of
  endcase                                                                                        ;end case on status
  status = tag_exist(detects, tags[5], INDEX=ind_ch2err, /TOP_LEVEL)                             ;check tag
  case status of                                                                                 ;begin case on status
     1 : begin                                                                                   ;one status value
        detects_ch2err = detects.(ind_ch2err)                                                    ;sets values
     end                                                                                         ;end if tag found
     0 : begin                                                                                   ;one status value 
        print, '  Tag given for 3rd set of error values not valid!! Please supply another!!'     ;print info
        print, '  ', tags[5]                                                                     ;prints info
        stop                                                                                     ;stops program
     end                                                                                         ;end case status of
  endcase                                                                                        ;end case on status
  print, ' '                                                                                     ;spacer 
  if n_elements(tags) eq 10 then begin                                                           ;checks # elements in tags
     if verbose ge 2 then print, '  Best mag  and error values!!'                                ;prints info
     status = tag_exist(detects, tags[6], INDEX=ind_ch1best, /TOP_LEVEL)                         ;check tag
     case status of                                                                              ;begin case on status
        1 : begin                                                                                ;one status value
           detects_ch1best = detects.(ind_ch1best)                                               ;sets values
        end                                                                                      ;end if tag found
        0 : begin                                                                                ;one status value 
           print, '  Tag given for ch1 best mag values not valid!! Please supply another!!'      ;print info
           print, '  ', tags[6]                                                                  ;prints info
           stop                                                                                  ;stops program
        end                                                                                      ;end case status of
     endcase                                                                                     ;end case on status
     status = tag_exist(detects, tags[7], INDEX=ind_ch1besterr, /TOP_LEVEL)                      ;check tag
     case status of                                                                              ;begin case on status
        1 : begin                                                                                ;one status value
           detects_ch1besterr = detects.(ind_ch1besterr)                                         ;sets values
        end                                                                                      ;end if tag found
        0 : begin                                                                                ;one status value 
           print, '  Tag given for ch1 best mag error values not valid! Please supply another!!' ;print info
           print, '  ', tags[7]                                                                  ;prints info
           stop                                                                                  ;stops program
        end                                                                                      ;end case status of
     endcase                                                                                     ;end case on status
     status = tag_exist(detects, tags[8], INDEX=ind_ch2best, /TOP_LEVEL)                         ;check tag
     case status of                                                                              ;begin case on status
        1 : begin                                                                                ;one status value
           detects_ch2best = detects.(ind_ch2best)                                               ;sets values
        end                                                                                      ;end if tag found
        0 : begin                                                                                ;one status value 
           print, '  Tag given for ch2 best mag values not valid!! Please supply another!!'      ;print info
           print, '  ', tags[8]                                                                  ;prints info
           stop                                                                                  ;stops program
        end                                                                                      ;end case status of
     endcase                                                                                     ;end case on status
     status = tag_exist(detects, tags[9], INDEX=ind_ch2besterr, /TOP_LEVEL)                      ;check tag
     case status of                                                                              ;begin case on status
        1 : begin                                                                                ;one status value
           detects_ch2besterr = detects.(ind_ch2besterr)                                         ;sets values
        end                                                                                      ;end if tag found
        0 : begin                                                                                ;one status value 
           print, '  Tag given for ch2 best mag error values not valid! Please supply another!!' ;print info
           print, '  ', tags[9]                                                                  ;prints info
           stop                                                                                  ;stops program
        end                                                                                      ;end case status of
     endcase                                                                                     ;end case on status
  endif else begin                                                                               ;end check # elements in tags
     if verbose ge 2 then print, '  Assuming best mag, error values are aperture values!'        ;prints info
     detects_ch1best = detects_ch1mag                                                            ;sets alt values
     detects_ch1besterr = detects_ch1err                                                         ;sets alt values
     detects_ch2best = detects_ch2mag                                                            ;sets alt values
     detects_ch2besterr = detects_ch2err                                                         ;sets alt values
  endelse                                                                                        ;end alt to 10 photometric tags given
  
  ;;;this section does prliminary calculations
  disper = dblarr(n_elements(models.z))     ;creates array 
  case keyword_set(VARYDISPER) of           ;check VARYDISP keyword
     1 : begin                              ;vary dispersion
        littlez = where(z lt 1.2)           ;finds places
        disper[littlez] = 0.075             ;sets values
        midz = where(z ge 1.2 and z lt 1.5) ;finds places
        disper[midz] = 0.10                 ;finds places
        bigz = where(z ge 1.5)              ;sets values
        disper[bigz] = 0.15                 ;sets values
     end                                    ;end vary dispersion
     0 : disper[*] = 0.10                   ;constant dispersion
  endcase                                   ;end check VARYDISP keyword 


  ;upperlim = where(detects_zmag EQ -9999 AND detects_zerr EQ -9999, nupperlim) ;find filler
  ;detects_zmag[upperlim] = zdepth                                              ;sets non zband detection to upper lim
  ;detects_zerr[upperlim] = 1.0                                                 ;assign a huge error
  zmch1 = detects_zmag - detects_ch1mag                                        ;creates color
  zmch1_err = sqrt(detects_zerr^2 + detects_ch1err^2)                          ;creates color error
  ch1mch2 = detects_ch1mag - detects_ch2mag                                    ;creates color
  ch1mch2_err = sqrt(detects_ch1err^2 + detects_ch2err^2)                      ;creates color error
  
  
  ;;;This section sets up the output structures
  outstruct1 = {z:0.0, slice:55, mstar_ch2:1.0}                                         ;creates structure
  outarray1 = replicate(outstruct1, (nend-nstart+1))                                    ;replicate, one per slice
  outstruct2 = {RA:0.000, DEC:0.000, ch1mch2:0.000, ch1mch2_err:0.000, ch2best:0.000, $ ;cont next line
                ch2best_err:0.000, ch1best:0.000, ch1best_err:0.000, weight:0.000}      ;creates structure
  outarray2 = replicate(outstruct2, n_elements(detects.(1)))                            ;replicates one per detection
  outarray2.ra = detects.ra                                                             ;sets values
  outarray2.dec = detects.dec                                                           ;sets values
  outarray2.ch1mch2 = ch1mch2                                                           ;sets values
  outarray2.ch1mch2_err = ch1mch2_err                                                   ;sets values
  outarray2.ch2best = detects_ch2best                                                   ;sets values
  outarray2.ch2best_err = detects_ch2besterr                                            ;sets values
  outarray2.ch1best = detects_ch1best                                                   ;sets values
  outarray2.ch1best_err = detects_ch1besterr                                            ;sets values
  outstruct3 = {z:0.0, ninslice:55L, nsigmaslice:10L}                                     ;creates structure
  outarray3 = replicate(outstruct3, (nend-nstart+1))                                    ;replicate, one per slice
  
  
  if keyword_set(SCREENP) then begin                                                 ;check SCREENP
     window, 0, XSIZE=600, YSIZE=600, XPOS=100, YPOS=25, TITLE= 'Model Color Slices' ;window options
     xpnt = [12, 30]                                                                 ;two fake points to plot model
     cntr = 0                                                                        ;initialize
     for aa=nstart, nend, 1 do begin                                                 ;loop over color slices
        if aa eq nstart then begin                                                   ;if first slice
           ypnt = [models[aa].cm_slope*xpnt + models[aa].cm_int]                     ;y vals for two fake points
           plot, xpnt, ypnt, $                                                       ;plots model
                 BACKGROUND = 'FFFFFF'XL , $                                         ;plot option
                 COLOR = '000000'XL, $                                               ;plot option
                 XTITLE = 'IRAC ch2 Mag [AB]', $                                     ;plot option
                 YTITLE = 'IRAC ch1 - IRAC ch2 color [AB]', $                        ;plot option
                 TITLE = 'SBS Color Models', $                                       ;plot option
                 xrange = [models[aa].mstar_ch1-8.0, models[aa].mstar_ch1+8.0], $    ;plot option
                 yrange = [models[aa].cm_int-0.4, models[aa].cm_int+0.5], $          ;plot option
                 ystyle = 1.0,  xstyle = 1.0, $                                      ;plot options
                 CHARSIZE=1.25                                                       ;plot option
        endif                                                                        ;end if first slice
        if aa mod 4 eq 0 then  begin                                                 ;takes every 4th model                         
           ypnt = [models[aa].cm_slope*xpnt + models[aa].cm_int]                     ;y vals for two fake points
           oplot, xpnt, ypnt, COLOR = '000000'XL                                     ;plots model
           xyouts, xpnt[0]-1.5, ypnt[0], $                                           ;prints on graph
                   strcompress('z='+ string(models[aa].z), /REMOVE_ALL), $           ;what to print
                   COLOR = '000000'XL, /DATA                                         ;options
        endif                                                                        ;end alt to first slice
     endfor                                                                          ;end loop over color slices
  endif                                                                              ;end check SCREENP
  if keyword_set(WRITEP) then begin                                                  ;checks WRITE keyword
     set_plot, 'ps'                                                                  ;sets to post script
     device, filename='sbs_colormodels.ps', /color                                   ;sets device
     for aa=nstart, nend, 1 do begin                                                 ;loop over color slices
        if aa eq nstart then begin                                                   ;if first slice
           ypnt = [models[aa].cm_slope*xpnt + models[aa].cm_int]                     ;y vals for two fake points
           plot, xpnt, ypnt, $                                                       ;plots model
                 BACKGROUND = 'FFFFFF'XL , $                                         ;plot option
                 COLOR = '000000'XL, $                                               ;plot option
                 XTITLE = 'IRAC ch2 Mag [AB]', $                                     ;plot option
                 YTITLE = 'IRAC ch1 - IRAC ch2 [AB]', $                              ;plot option
                 TITLE = 'SBS Color Models', $                                       ;plot option
                 xrange = [models[aa].mstar_ch1-8.0, models[aa].mstar_ch1+8.0], $    ;plot option
                 yrange = [models[aa].cm_int-0.4, models[aa].cm_int+0.5], $          ;plot option
                 ystyle = 1.0,  xstyle = 1.0, $                                      ;plot options
                 XTHICK = 5.0, $                                                     ;plot option
                 YTHICK = 5.0, $                                                     ;plot option
                 CHARSIZE = 1.6, $                                                   ;plot option
                 CHARTHICK = 4.0, $                                                  ;plot option
                 THICK = 4.0                                                         ;plot options
        endif                                                                        ;end if first slice
        if aa mod 4 eq 0 then  begin                                                 ;takes every 4th model                         
           ypnt = [models[aa].cm_slope*xpnt + models[aa].cm_int]                     ;y vals for two fake points
           oplot, xpnt, ypnt, COLOR = '000000'XL, $                                  ;plots model
                  THICK = 4.0                                                        ;plot options
           xyouts, xpnt[0]-1.5, ypnt[0], $                                           ;prints on graph
                   strcompress('z='+ string(models[aa].z), /REMOVE_ALL), $           ;what to print
                   COLOR = '000000'XL, /DATA, $                                      ;options
                   CHARTHICK = 4.0                                                   ;plot option
        endif                                                                        ;end alt to first slice
     endfor                                                                          ;end loop over color slices
     device, /close                                                                  ;closes device
     set_plot, 'x'                                                                   ;undoes ps
  endif                                                                              ;end check WRITE keyword

  if keyword_set(MAGLIMS) then begin                             ;check MAGLIMS keyword
     case n_elements(MAGLIMS) of                                 ;check size of MAGLIMS
        2 : begin                                                ;if MAGLIMS has 2 elements
           xpnt1 = [ch2lim1, ch2lim1]                            ;two fake points to plot model
           ypnt1 = [(models[aa].cm_int-4.0), (ch1lim1-ch2lim1)]  ;two fake points to plot model
           ypnt2 = [(ch1lim1-ch2lim1), (models[aa].cm_int+2.0)]  ;two fake points to plot model
           xpnt2 = [ch2lim1, (ch1lim1-(models[aa].cm_int+2.0))]  ;two fake points to plot model           
        end                                                      ;end if MAGLIMS has two elements
        4 : begin                                                ;if MAGLIMS has 4 elements
           xpnt1 = [ch2lim1, ch2lim1]                            ;two fake points to plot model
           ypnt1 = [(models[aa].cm_int-4.0), (ch1lim1-ch2lim1)]  ;two fake points to plot model
           ypnt2 = [(ch1lim1-ch2lim1), (models[aa].cm_int+2.0)]  ;two fake points to plot model
           xpnt2 = [ch2lim1, (ch1lim1-(models[aa].cm_int+2.0))]  ;two fake points to plot model
           xpnt3 = [ch2lim2, ch2lim2]                            ;two fake points to plot model
           ypnt3 = [(models[aa].cm_int-4.0), (ch1lim2-ch2lim2)]  ;two fake points to plot model
           ypnt4 = [(ch1lim2-ch2lim2), (models[aa].cm_int+2.0)]  ;two fake points to plot model
           xpnt4 = [ch2lim2, (ch1lim2-(models[aa].cm_int+2.0))]  ;two fake points to plot model
        end                                                      ;end if MAGLIMS has 4 elements
        6 : begin                                                ;if MAGLIMS has 6 elements
           xpnt1 = [ch2lim1, ch2lim1]                            ;two fake points to plot model
           ypnt1 = [(models[aa].cm_int-4.0), (ch1lim1-ch2lim1)]  ;two fake points to plot model
           ypnt2 = [(ch1lim1-ch2lim1), (models[aa].cm_int+2.0)]  ;two fake points to plot model
           xpnt2 = [ch2lim1, (ch1lim1-(models[aa].cm_int+2.0))]  ;two fake points to plot model
           xpnt3 = [ch2lim2, ch2lim2]                            ;two fake points to plot model
           ypnt3 = [(models[aa].cm_int-4.0), (ch1lim2-ch2lim2)]  ;two fake points to plot model
           ypnt4 = [(ch1lim2-ch2lim2), (models[aa].cm_int+2.0)]  ;two fake points to plot model
           xpnt4 = [ch2lim2, (ch1lim2-(models[aa].cm_int+2.0))]  ;two fake points to plot model
           xpnt5 = [ch2lim3, ch2lim3]                            ;two fake points to plot model
           ypnt5 = [(models[aa].cm_int-4.0), (ch1lim3-ch2lim3)]  ;two fake points to plot model
           ypnt6 = [(ch1lim3-ch2lim3), (models[aa].cm_int+2.0)]  ;two fake points to plot model
           xpnt6 = [ch2lim3, (ch1lim3-(models[aa].cm_int+2.0))]  ;two fake points to plot model
        end                                                      ;end if MAGLIMS has 6 elements
        else : print, '  Maglims must have 2, 4 or 6 arguements' ;print info
     endcase                                                     ;end check of MAGLIMS size
  endif                                                          ;end check MAGLIMS keyword
  
  ;;;This section is the loop over all color slices
  goodpoints = where(zmch1 gt lim_zmch1, ngoodpoints)                           ;finds a subset
  if verbose ge 3 then print, ' # of point matching z-ch1 color: ', ngoodpoints ;prints info
  xpnt = [10, 30]                                                               ;two fake points to plot model
  cntr = 0                                                                      ;initialize
  for aa=nstart, nend, 1 do begin                                               ;begin loop over color slices
     outarray1[aa-nstart].z = models[aa].z                                      ;sets value in output
     outarray1[aa-nstart].slice = aa                                            ;sets value in output
     outarray1[aa-nstart].mstar_ch2 = models[aa].mstar_ch2                      ;sets value in output
     outarray3[aa-nstart].z = models[aa].z                                      ;sets value in output
     ypnt = [models[aa].cm_slope*xpnt + models[aa].cm_int]                      ;y vals for two fake points
     onplot = where((zmch1 gt lim_zmch1) AND $                                  ;cont next line
                    (detects_ch2mag gt models[aa].mstar_ch1-6.0) AND $          ;cont next line
                    (detects_ch2mag lt models[aa].mstar_ch1+8.0) AND $          ;cont next line
                    (ch1mch2 gt models[aa].cm_int-2.0) AND $                    ;cont next line
                    (ch1mch2 lt models[aa].cm_int+2.0), nonplot)                ;find subset and # 
     
     if keyword_set(SCREENP) then begin                                                       ;check SCREENP keyword
        window, 1, XSIZE = 600, YSIZE = 600, XPOS=150, YPOS=50, title = 'Colour Slice'        ;window options
        plot, xpnt, ypnt, $                                                                   ;plots our red seq model
              BACKGROUND = 'FFFFFF'XL , $                                                     ;plot option
              COLOR = '000000'XL, $                                                           ;plot option
              XTITLE = 'IRAC ch2 Mag [AB]', $                                                 ;plot option
              YTITLE = 'IRAC ch1 - IRAC ch2 color [AB]', $                                    ;plot option
              xrange = [models[aa].mstar_ch1-6.0, models[aa].mstar_ch1+8.0], $                ;plot option
              yrange = [models[aa].cm_int-2.0, models[aa].cm_int+2.0], $                      ;plot option
              ystyle = 1.0,  xstyle = 1.0, $                                                  ;plot options
              CHARSIZE=1.25                                                                   ;plot option
        oplot, detects_ch2best[goodpoints], ch1mch2[goodpoints], PSYM=1, COLOR='000000'XL     ;over plots high z detections
        oplot, xpnt, ypnt+disper[aa], COLOR = '000000'XL, LINESTYLE=2                         ;over plots deviation of rs
        oplot, xpnt, ypnt-disper[aa], COLOR = '000000'XL, LINESTYLE=2                         ;over plots deviation of rs
        case n_elements(MAGLIMS) of                                                           ;check # elements in MAGLIMS
           2 : begin                                                                          ;if MAGLIMS has 2 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='0000FF'XL                              ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='0000FF'XL                              ;plots model
           end                                                                                ;end if MAGLIMS has 2 elements
           4 : begin                                                                          ;if MAGLIMS has 4 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='0000FF'XL                              ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='0000FF'XL                              ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='0000FF'XL                              ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='0000FF'XL                              ;plots model
           end                                                                                ;end if MAGLIMS has 4 elements
           6 : begin                                                                          ;if MAGLIMS has 6 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='0000FF'XL                              ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='0000FF'XL                              ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='0000FF'XL                              ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='0000FF'XL                              ;plots model
              oplot, xpnt5, ypnt5, LINESTYLE=4, COLOR='0000FF'XL                              ;plots model
              oplot, xpnt6, ypnt6, LINESTYLE=4, COLOR='0000FF'XL                              ;plots model
           end                                                                                ;end if MAGLIMS has 6 elements
           else : print, '  Maglims must have 2, 4 or 6 arguements'                           ;print info
        endcase                                                                               ;end check # elements MAGLIMS
        legend, strcompress('n='+string(nonplot)), TEXTCOLORs='000000'XL, CHARSIZE=1.5, BOX=0 ;adds legend
     endif                                                                                    ;end check SCREENP keyword
     if keyword_set(WRITEP) then begin                                                        ;checks WRITE keyword
        set_plot, 'ps'                                                                        ;sets to post script
        if keyword_set(OUTDIR) then begin                                                     ;check OUTDIR keyword
           plotname = strcompress(outdir[0]+'slice'+string(models[aa].z)+'.ps', /REMOVE_ALL)  ;name 
        endif else plotname = strcompress('slice'+string(models[aa].z)+'.ps', /REMOVE_ALL)    ;name 
        device, FILENAME=plotname, /COLOR                                                     ;device option
        plot, xpnt, ypnt, $                                                                   ;plots our red seq model
              BACKGROUND = 'FFFFFF'XL , $                                                     ;plot option
              COLOR = '000000'XL, $                                                           ;plot option
              XTITLE = 'IRAC ch2 Mag [AB]', $                                                 ;plot option
              YTITLE = 'IRAC ch1 - IRAC ch2 [AB]', $                                          ;plot option
              TITLE = 'SBS Detections', $                                                     ;plot option
              xrange = [models[aa].mstar_ch1-6.0, models[aa].mstar_ch1+8.0], $                ;plot option
              yrange = [models[aa].cm_int-2.0, models[aa].cm_int+2.0], $                      ;plot option
              ystyle = 1.0,  xstyle = 1.0, $                                                  ;plot options
              XTHICK = 5.0, $                                                                 ;plot option
              YTHICK = 5.0, $                                                                 ;plot option
              CHARSIZE = 1.6, $                                                               ;plot option
              CHARTHICK = 4.0, $                                                              ;plot option
              THICK = 4.0                                                                     ;plot options
        oplot, detects_ch2best[goodpoints], ch1mch2[goodpoints], PSYM=1, COLOR='000000'XL, $ ;over plots high z detections                                              
               THICK = 4.0                                                                   ;plot option
        oplot, xpnt, ypnt+disper[aa], COLOR='000000'XL, LINESTYLE=2, THICK = 4.0             ;over plots deviation of rs
        oplot, xpnt, ypnt-disper[aa], COLOR='000000'XL, linestyle=2, THICK = 4.0             ;over plots deviation of rs
        case n_elements(MAGLIMS) of                                                          ;check # elements in MAGLIMS
           2 : begin                                                                         ;if MAGLIMS has 2 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                ;plots model
           end                                                                               ;end if MAGLIMS has 2 elements
           4 : begin                                                                         ;if MAGLIMS has 4 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                ;plots model
           end                                                                               ;end if MAGLIMS has 4 elements
           6 : begin                                                                         ;if MAGLIMS has 6 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                ;plots model
              oplot, xpnt5, ypnt5, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                ;plots model
              oplot, xpnt6, ypnt6, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                ;plots model
           end                                                                               ;end if MAGLIMS has 6 elements
           else : print, '  Maglims must have 2, 4 or 6 arguements'                          ;print info
        endcase                                                                              ;end check # elements MAGLIMS
        legend, strcompress('n='+string(nonplot), /REMOVE_ALL), TEXTCOLORs='000000'XL, $     ;adds legend
                CHARSIZE = 1.3, $                                                            ;legend options
                CHARTHICK = 4.0, $                                                           ;legend options
                BOX=0                                                                        ;legend options
        device, /close                                                                       ;closes device
        set_plot, 'x'                                                                        ;undoes ps
     endif                                                                                   ;end check WRITE keyword
     
     if keyword_set(OUTDIR) then begin                                                    ;check OUTDIR keyword
        regname = strcompress(outdir[0]+'slice'+string(models[aa].z)+'.reg', /REMOVE_ALL) ;name 
     endif else regname = strcompress('slice'+string(models[aa].z)+'.reg', /REMOVE_ALL)   ;name 
     openw, lun2, regname, /GET_LUN                                                       ;open second file to write
     
     ;;;finds weights only for galaxies in the colour slice
     outarray1[cntr].z = models[aa].z                                                                         ;set value in array
     outarray1[cntr].slice = aa                                                                               ;set value in array
     outarray1[cntr].mstar_ch2 = models[aa].mstar_ch2                                                         ;set value in array
     if verbose ge 2 then print, '  Setting up density grid, Slice: ', aa, ' at z=', models[aa].z             ;print info
     weights = dblarr(n_elements(detects.(1)))                                                                ;data array for weights
     weightpoints = where(((ch1mch2) ge $                                                                     ;cont next line
                           (models[aa].cm_slope*detects_ch2best+models[aa].cm_int-disper[aa])) and $          ;object above color slice min 
                          ((ch1mch2) le $                                                                     ;cont next line
                           (models[aa].cm_slope*detects_ch2best+models[aa].cm_int+disper[aa])) and $          ;object below color slice max
                          (zmch1 gt lim_zmch1) AND (detects_ch2mag GT brch2 ) AND $                           ;proper z'-ch1 color 
                          ((ch1mch2 GT (ch1lim1-ch2lim1)) AND (detects_ch2best LE (ch1lim1-ch1mch2)) OR $     ;object not too faint
                           ((ch1mch2 LE (ch1lim1-ch2lim1)) AND (detects_ch2best LE ch2lim1))), nweightpoints) ;# points
     if verbose ge 3 then print, '  # of galaxies in color slice: ', nweightpoints                            ;print info
     outarray3[aa-nstart].ninslice = nweightpoints                                                            ;sets value in output
     if keyword_set(SCREENP) then begin                                                                       ;check SCREENP keyword
        window, 2, XSIZE=600, YSIZE=600, XPOS=200, YPOS=75, TITLE='Galaxies in Colour Slice'                  ;window options
        plot, xpnt, ypnt, $                                                                                   ;plots our red seq model
              BACKGROUND = 'FFFFFF'XL , $                                                                     ;plot option
              COLOR = '000000'XL, $                                                                           ;plot option
              XTITLE = 'IRAC ch2 Mag [AB]', $                                                                 ;plot option
              YTITLE = 'IRAC ch1 - IRAC ch2 color [AB]', $                                                    ;plot option
              xrange = [models[aa].mstar_ch1-6.0, models[aa].mstar_ch1+8.0], $                                ;plot option
              yrange = [models[aa].cm_int-2.0, models[aa].cm_int+2.0], $                                      ;plot option
              ystyle = 1.0,  xstyle = 1.0, $                                                                  ;plot options
              CHARSIZE=1.25                                                                                   ;plot option
        oplot, detects_ch2best[weightpoints], ch1mch2[weightpoints], PSYM=1, COLOR='000000'XL                 ;over plots high z detections
        oplot, xpnt, ypnt+disper[aa], COLOR = '000000'XL, LINESTYLE = 2.0                                     ;over plots deviation of rs
        oplot, xpnt, ypnt-disper[aa], COLOR = '000000'XL, linestyle = 2.0                                     ;over plots deviation of rs
        case n_elements(MAGLIMS) of                                                                           ;check # elements in MAGLIMS
           2 : begin                                                                                          ;if MAGLIMS has 2 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model
           end                                                                                                ;end if MAGLIMS has 2 elements
           4 : begin                                                                                          ;if MAGLIMS has 4 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
           end                                                                                                ;end if MAGLIMS has 4 elements
           6 : begin                                                                                          ;if MAGLIMS has 6 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt5, ypnt5, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt6, ypnt6, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
           end                                                                                                ;end if MAGLIMS has 6 elements
           else : print, '  Maglims must have 2, 4 or 6 arguements'                                           ;print info
        endcase                                                                                               ;end check # elements MAGLIMS
        legend, strcompress('n='+string(nweightpoints)), TEXTCOLORs='000000'XL, CHARSIZE=1.5, BOX=0           ;adds legend
     endif                                                                                                    ;end check SCREENP keyword
     if keyword_set(WRITEP) then begin                                                                        ;check SCREENP keyword
        set_plot, 'ps'                                                                                        ;sets to post script
        if keyword_set(OUTDIR) then begin                                                                     ;check OUTDIR keyword
           plotname = strcompress(outdir[0]+'slice'+string(models[aa].z)+'_inslice.ps', /REMOVE_ALL)          ;name 
        endif else plotname = strcompress('slice'+string(models[aa].z)+'_inslice.ps', /REMOVE_ALL)            ;name 
        device, FILENAME=plotname, /color                                                                     ;device option
        plot, xpnt, ypnt, $                                                                                   ;plots our red seq model
              BACKGROUND = 'FFFFFF'XL , $                                                                     ;plot option
              COLOR = '000000'XL, $                                                                           ;plot option
              XTITLE = 'IRAC ch2 Mag [AB]', $                                                                 ;plot option
              YTITLE = 'IRAC ch1 - IRAC ch2 [AB]', $                                                          ;plot option
              TITLE = 'SBS In Color Slice', $                                                                 ;plot option
              xrange = [models[aa].mstar_ch1-6.0, models[aa].mstar_ch1+8.0], $                                ;plot option
              yrange = [models[aa].cm_int-2.0, models[aa].cm_int+2.0], $                                      ;plot option
              ystyle = 1.0,  xstyle = 1.0, $                                                                  ;plot options
              XTHICK = 5.0, $                                                                                 ;plot option
              YTHICK = 5.0, $                                                                                 ;plot option
              CHARSIZE = 1.6, $                                                                               ;plot option
              CHARTHICK = 4.0, $                                                                              ;plot option
              THICK = 4.0                                                                                     ;plot options
        oplot, detects_ch2best[weightpoints], ch1mch2[weightpoints], PSYM=1, COLOR='000000'XL, THICK = 4.0    ;over plots high z detections
        oplot, xpnt, ypnt+disper[aa], COLOR ='000000'XL, LINESTYLE = 2.0, THICK = 4.0                         ;over plots deviation of rs
        oplot, xpnt, ypnt-disper[aa], COLOR = '000000'XL, linestyle = 2.0, THICK = 4.0                        ;over plots deviation of rs
        case n_elements(MAGLIMS) of                                                                           ;check # elements in MAGLIMS
           2 : begin                                                                                          ;if MAGLIMS has 2 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model
           end                                                                                                ;end if MAGLIMS has 2 elements
           4 : begin                                                                                          ;if MAGLIMS has 4 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
           end                                                                                                ;end if MAGLIMS has 4 elements
           6 : begin                                                                                          ;if MAGLIMS has 6 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt5, ypnt5, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt6, ypnt6, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
           end                                                                                                ;end if MAGLIMS has 6 elements
           else : print, '  Maglims must have 2, 4 or 6 arguements'                                           ;print info
        endcase                                                                                               ;end check # elements MAGLIMS
        legend, strcompress('n='+string(nweightpoints), /REMOVE_ALL), TEXTCOLORs='000000'XL, $                ;adds legend
                CHARSIZE = 1.3, $                                                                             ;plot legends
                CHARTHICK = 4.0, $                                                                            ;plot legends
                BOX=0                                                                                         ;plot legends
        device, /close                                                                                        ;closes device
        set_plot, 'x'                                                                                         ;undoes ps
     endif                                                                                                    ;end check SCREENP keyword
     if nweightpoints ne 0 then begin                                                                         ;checks # of points 
        lowerlim = models[aa].cm_slope*detects_ch2best[weightpoints] + models[aa].cm_int - disper[aa]         ;find lower limit
        upperlim = models[aa].cm_slope*detects_ch2best[weightpoints] + models[aa].cm_int + disper[aa]         ;find upper limit
        for bb=0UL, nweightpoints-1, 1 do begin                                                               ;loops over points satisfying
           openw, lun, 'galaxyval.tmp', /GET_LUN                                                              ;opens temp file
           printf, lun, detects_ch2best[weightpoints[bb]], detects_ch2besterr[weightpoints[bb]], $            ;cont next line
                   ch1mch2[weightpoints[bb]], ch1mch2_err[weightpoints[bb]], FORMAT='(D,D,D,D)'               ;prints values to file
           free_lun, lun                                                                                      ;frees memory
           openw, lun, 'gausslimits.tmp', /GET_LUN                                                            ;opens temp file
           printf, lun, models[aa].cm_slope, (models[aa].cm_int-disper[aa]), $                                ;cont next line
                   models[aa].cm_slope, (models[aa].cm_int+disper[aa]), FORMAT='(D,D,D,D)'                    ;prints values to file
           free_lun, lun                                                                                      ;frees memory
           !EXCEPT = 0                                                                                        ;sets no exceptions
           if verbose ge 4 then begin                                                                         ;check verbose status
              print, 'Lower limit:', lowerlim[bb]                                                             ;prints info
              print, 'Upper limit:', upperlim[bb]                                                             ;prints info
           endif                                                                                              ;end check verbose status
           
           CASE GAUSSIAN OF                                                                                               ;check GAUSSIAN keyword
              'single' : BEGIN                                                                                            ;if gaussian is single
                 weights[weightpoints[bb]] = qromb('gaussian_ch1ch2', lowerlim[bb], upperlim[bb], /DOUBLE)                ;integrates
                 weights[weightpoints[bb]] = (ins*weights[weightpoints[bb]] / $                                           ;normalized to full Gaussian intergral
                                              (ch1mch2_err[weightpoints[bb]]*sqrt(!pi)))                                  ;sets weight vals,
              END                                                                                                         ;end if single
              'double' : BEGIN                                                                                            ;if GAUSSIAN double
                 xlower = detects_ch2best[weightpoints[bb]] - 5.0*detects_ch2besterr[weightpoints[bb]]                    ;5sigma less than point
                 xupper = detects_ch2best[weightpoints[bb]] + 5.0*detects_ch2besterr[weightpoints[bb]]                    ;5sigma less than point
                 xlimits = [xlower, xupper]                                                                               ;put limits together
                 weights[weightpoints[bb]] = int_2d('gaussian2d_ch1ch2', xlimits, 'gaussian2d_limits', 96, /DOUBLE)       ;integrates
                 weights[weightpoints[bb]] = (weights[weightpoints[bb]] / $                                               ;cont next line
                                              (2*!pi*ch1mch2_err[weightpoints[bb]]*detects_ch2besterr[weightpoints[bb]])) ;normalizes, sets weight vals
                 printf, lun2, detects[weightpoints[bb]].ra, detects[weightpoints[bb]].dec                                ;print to file
              END                                                                                                         ;end if double
              ELSE : BEGIN                                                                                                ;failsafe
                 print, 'WARNING!! Choice of GAUSSIAN not valid!!'                                                        ;print info
                 print, '  Choices are SINGLE or DOUBLE.'                                                                 ;print info
                 stop                                                                                                     ;stop program
              END                                                                                                         ;end failsafe
           ENDCASE                                                                                                        ;end check GAUSSIAN keyword 
        endfor                                                                                                            ;end loop over points satisfying
     endif                                                                                                                ;end check # of points
          
     ;;;finds weights for galaxies not in the colour slice and less than nsigma away 
     weightpoints = where(((ch1mch2) le $                                                                     ;cont next line
                           (models[aa].cm_slope*detects_ch2best+models[aa].cm_int-disper[aa]) AND $           ;object below color slice min
                           (ch1mch2 + sigma*ch1mch2_err) ge $                                                 ;cont next line
                           (models[aa].cm_slope*detects_ch2best+models[aa].cm_int-disper[aa])) or $           ;but above it with error
                          ((ch1mch2) ge $                                                                     ;cont next line
                           (models[aa].cm_slope*detects_ch2best+models[aa].cm_int+disper[aa])) AND $          ;object above color slice max
                          ((ch1mch2 - sigma*ch1mch2_err) le $                                                 ;cont next lin
                           (models[aa].cm_slope*detects_ch2best+models[aa].cm_int+disper[aa])) and $          ;but below it with error
                          (zmch1 gt lim_zmch1) AND  (detects_ch2mag GT brch2 ) AND $                          ;proper z'-ch1 color 
                          ((ch1mch2 GT (ch1lim1-ch2lim1)) AND (detects_ch2best LE (ch1lim1-ch1mch2)) OR $     ;object not too faint
                           ((ch1mch2 LE (ch1lim1-ch2lim1)) AND (detects_ch2best LE ch2lim1))), nweightpoints) ;# points
     if verbose ge 3 then print, '  # of galaxies within ', sigma, ' sigma of color slice:', nweightpoints    ;print info
     if keyword_set(SCREENP) then begin                                                                       ;check SCREENP keyword
        window, 3, XSIZE=600, YSIZE=600, XPOS=250, YPOS=100, TITLE='Galaxies within n sigma of Colour Slice'  ;window options
        plot, xpnt, ypnt, $                                                                                   ;plots our red seq model
              BACKGROUND = 'FFFFFF'XL , $                                                                     ;plot option
              COLOR = '000000'XL, $                                                                           ;plot option
              XTITLE = 'IRAC ch2 Mag [AB]', $                                                                 ;plot option
              YTITLE = 'IRAC ch1 - IRAC ch2 color [AB]', $                                                    ;plot option
              xrange = [models[aa].mstar_ch1-6.0, models[aa].mstar_ch1+8.0], $                                ;plot option
              yrange = [models[aa].cm_int-2.0, models[aa].cm_int+2.0], $                                      ;plot option
              ystyle = 1.0,  xstyle = 1.0, $                                                                  ;plot options
              CHARSIZE=1.25                                                                                   ;plot option
        oplot, detects_ch2best[weightpoints], ch1mch2[weightpoints],  PSYM=1, COLOR='000000'XL                ;over plots high z detections
        oplot, xpnt, ypnt+disper[aa], COLOR = '0000FF'XL, LINESTYLE = 2.0                                     ;over plots deviation of rs
        oplot, xpnt, ypnt-disper[aa], COLOR = '0000FF'XL, linestyle = 2.0                                     ;over plots deviation of rs
        case n_elements(MAGLIMS) of                                                                           ;check # elements in MAGLIMS
           2 : begin                                                                                          ;if MAGLIMS has 2 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model
           end                                                                                                ;end if MAGLIMS has 2 elements
           4 : begin                                                                                          ;if MAGLIMS has 4 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
           end                                                                                                ;end if MAGLIMS has 4 elements
           6 : begin                                                                                          ;if MAGLIMS has 6 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='0000FF'XL                                              ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt5, ypnt5, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
              oplot, xpnt6, ypnt6, LINESTYLE=4, COLOR='0000FF'XL                                              ;plots model
           end                                                                                                ;end if MAGLIMS has 6 elements
           else : print, '  Maglims must have 2, 4 or 6 arguements'                                           ;print info
        endcase                                                                                               ;end check # elements MAGLIMS
        legend, strcompress('n='+string(nweightpoints)), TEXTCOLORS='000000'XL, CHARSIZE=1.5, BOX=0           ;adds legend
     endif                                                                                                    ;end check SCREENP keyword
     if keyword_set(WRITEP) then begin                                                                        ;check SCREENP keyword
        set_plot, 'ps'                                                                                        ;sets to post script
        if keyword_set(OUTDIR) then begin                                                                     ;check OUTDIR keyword
           plotname = strcompress(outdir[0]+'slice'+string(models[aa].z)+'_sigmaslice.ps', /REMOVE_ALL)       ;name 
        endif else plotname = strcompress('slice'+string(models[aa].z)+'_sigmaslice.ps', /REMOVE_ALL)         ;name 
        device, FILENAME=plotname, /color                                                                     ;device option
        plot, xpnt, ypnt, $                                                                                   ;plots our red seq model
              BACKGROUND = 'FFFFFF'XL , $                                                                     ;plot option
              COLOR = '000000'XL, $                                                                           ;plot option
              XTITLE = 'IRAC ch2 Mag [AB]', $                                                                 ;plot option
              YTITLE = 'IRAC ch1 - IRAC ch2 [AB]', $                                                          ;plot option
              TITLE = 'SBS 1sigma Color Slice', $                                                             ;plot option
              xrange = [models[aa].mstar_ch1-6.0, models[aa].mstar_ch1+8.0], $                                ;plot option
              yrange = [models[aa].cm_int-2.0, models[aa].cm_int+2.0], $                                      ;plot option
              ystyle = 1.0,  xstyle = 1.0, $                                                                  ;plot options
              XTHICK = 5.0, $                                                                                 ;plot option
              YTHICK = 5.0, $                                                                                 ;plot option
              CHARSIZE = 1.6, $                                                                               ;plot option
              CHARTHICK = 4.0, $                                                                              ;plot option
              THICK = 4.0                                                                                     ;plot options
        oplot, detects_ch2best[weightpoints], ch1mch2[weightpoints], PSYM=1, COLOR='000000'XL, THICK = 4.0    ;over plots high z detections
        oplot, xpnt, ypnt+disper[aa], COLOR = '000000'XL, LINESTYLE = 2.0, THICK = 4.0                        ;over plots deviation of rs
        oplot, xpnt, ypnt-disper[aa], COLOR = '000000'XL, linestyle = 2.0, THICK = 4.0                        ;over plots deviation of rs
        case n_elements(MAGLIMS) of                                                                           ;check # elements in MAGLIMS
           2 : begin                                                                                          ;if MAGLIMS has 2 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model
           end                                                                                                ;end if MAGLIMS has 2 elements
           4 : begin                                                                                          ;if MAGLIMS has 4 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
           end                                                                                                ;end if MAGLIMS has 4 elements
           6 : begin                                                                                          ;if MAGLIMS has 6 elements
              oplot, xpnt1, ypnt1, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt2, ypnt2, LINESTYLE=3, COLOR='000000'XL, THICK = 4.0                                 ;plots model              
              oplot, xpnt3, ypnt3, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt4, ypnt4, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt5, ypnt5, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
              oplot, xpnt6, ypnt6, LINESTYLE=4, COLOR='000000'XL, THICK = 4.0                                 ;plots model
           end                                                                                                ;end if MAGLIMS has 6 elements
           else : print, '  Maglims must have 2, 4 or 6 arguements'                                           ;print info
        endcase                                                                                               ;end check # elements MAGLIMS
        legend, strcompress('n='+string(nweightpoints), /REMOVE_ALL), TEXTCOLORS='000000'XL, $                ;adds legend
                CHARSIZE = 1.3, $                                                                             ;legend options
                CHARTHICK = 4.0, $                                                                            ;legend options
                BOX=0                                                                                         ;legend options
        device, /close                                                                                        ;closes device
        set_plot, 'x'                                                                                         ;undoes ps
     endif                                                                                                    ;end check WRITEP keyword
     outarray3[aa-nstart].nsigmaslice = nweightpoints                                                         ;sets value in output
     if nweightpoints ne 0 then begin                                                                         ;checks # of points 
        lowerlim = models[aa].cm_slope*detects_ch2best[weightpoints] + models[aa].cm_int - disper[aa]         ;find lower limit
        upperlim = models[aa].cm_slope*detects_ch2best[weightpoints] + models[aa].cm_int + disper[aa]         ;find upper limit
        for bb=0UL, nweightpoints-1, 1 do begin                                                               ;loops over points satisfying
           openw, lun, 'galaxyval.tmp', /GET_LUN                                                              ;opens temp file
           printf, lun, detects_ch2best[weightpoints[bb]], detects_ch2besterr[weightpoints[bb]], $            ;cont next line
                   ch1mch2[weightpoints[bb]], ch1mch2_err[weightpoints[bb]], FORMAT='(D,D,D,D)'               ;prints values to file
           free_lun, lun                                                                                      ;frees memory
           openw, lun, 'gausslimits.tmp', /GET_LUN                                                            ;opens temp file
           printf, lun, models[aa].cm_slope, (models[aa].cm_int-disper[aa]), $                                ;cont next line
                   models[aa].cm_slope, (models[aa].cm_int+disper[aa]), FORMAT='(D,D,D,D)'                    ;prints values to file
           free_lun, lun                                                                                      ;frees memory
           !EXCEPT = 0                                                                                        ;sets no exceptions
           if verbose ge 4 then begin                                                                         ;check verbose status
              print, 'Lower limit:', lowerlim[bb]                                                             ;prints info
              print, 'Upper limit:', upperlim[bb]                                                             ;prints info
           endif                                                                                              ;end check verbose status
  
           CASE GAUSSIAN OF                                                                                               ;check GAUSSIAN keyword
              'single' : BEGIN                                                                                            ;if gaussian is single
                 weights[weightpoints[bb]] = qromb('gaussian_ch1ch2', lowerlim[bb], upperlim[bb], /DOUBLE)                ;integrates
                 weights[weightpoints[bb]] = (ins*weights[weightpoints[bb]] / $                                           ;normalized to full Gaussian intergral
                                              (ch1mch2_err[weightpoints[bb]]*sqrt(!pi)))                                  ;sets weight vals,
              END                                                                                                         ;end if single
              'double' : BEGIN                                                                                            ;if GAUSSIAN double
                 xlower = detects_ch2best[weightpoints[bb]] - 5.0*detects_ch2besterr[weightpoints[bb]]                    ;5sigma less than point
                 xupper = detects_ch2best[weightpoints[bb]] + 5.0*detects_ch2besterr[weightpoints[bb]]                    ;5sigma less than point
                 xlimits = [xlower, xupper]                                                                               ;put limits together
                 weights[weightpoints[bb]] = int_2d('gaussian2d_ch1ch2', xlimits, 'gaussian2d_limits', 96, /DOUBLE)       ;integrates
                 weights[weightpoints[bb]] = (weights[weightpoints[bb]] / $                                               ;cont next line
                                              (2*!pi*ch1mch2_err[weightpoints[bb]]*detects_ch2besterr[weightpoints[bb]])) ;normalizes, sets weight vals
                 printf, lun2, detects[weightpoints[bb]].ra, detects[weightpoints[bb]].dec                                ;print to file
              END                                                                                                         ;end if double
              ELSE : BEGIN                                                                                                ;failsafe
                 print, 'WARNING!! Choice of GAUSSIAN not valid!!'                                                        ;print info
                 print, '  Choices are SINGLE or DOUBLE.'                                                                 ;print info
                 stop                                                                                                     ;stop program
              END                                                                                                         ;end failsafe
           ENDCASE                                                                                                        ;end check GAUSSIAN keyword 
        endfor                                                                                                            ;end loop over points satisfying
     endif                                                                                                                ;end check # of points
     
     close, lun2                ;close second file
     free_lun, lun2             ;free memory of second file
     
     if keyword_set(OUTDIR) then BEGIN                                                                ;check OUTDIR keyword
        pathname = strcompress(outdir + 'I1I2sliceweights/', /REMOVE_ALL)                             ;sets new value
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

     if verbose ge 3 then print, '  ', weight_file                                                     ;prints info
     outarray2.weight = weights                                                                        ;sets values
     if keyword_set(HELP) then help, outarray2, /struc                                                 ;prints info
     mwrfits, outarray2, weight_file, /CREATE                                                          ;write file
     print, ' '                                                                                        ;space
     cntr++                                                                                            ;up counter by 1
  endfor                                                                                               ;end loop over color slices
  
  
  ;;;This section writes out another file, cleans up
  if keyword_set(OUTDIR) then begin                                                           ;check OUTDIR keyword
     indname = strcompress(outdir[0]+'auxiliary/'+'I1I2sliceindex.fits', /REMOVE_ALL)         ;name 
  endif else indname = strcompress('I1I2sliceindex.fits', /REMOVE_ALL)                        ;name 
  mwrfits, outarray1, indname, /CREATE                                                        ;write file
  if keyword_set(OUTDIR) then begin                                                           ;check OUTDIR keyword
     signame = strcompress(outdir[0]+'auxiliary/'+'I1I2summary_colorslice.fits', /REMOVE_ALL) ;name 
  endif else signame = strcompress('I1I2summary_colorslice.fits', /REMOVE_ALL)                ;name 
  mwrfits, outarray3, signame, /CREATE                                                        ;write file
  spawn, 'mv *summary* auxiliary/'                                                            ;removed temporary files
  spawn, 'mv *.ps graphics/'                                                                  ;removed temporary files
  spawn, 'rm *.tmp'                                                                           ;removed temporary files
  spawn, 'rm ../*.tmp'                                                                        ;removed temporary files
  
end
;========================================================================================================================



;========================================================================================================================
pro call_create_colorweight_ch1ch2

  indir = '/Users/degroota/research/current8_en1clusterfinding/' ;dont forget the trailing slash
  incat = 'en1_multipass_v1.1.fits'
  
  auxdir = '/Users/degroota/research/current8_en1clusterfinding/auxiliary/' ;dont forget the trailing slash
  models = 'I1I2vsI2seqszf40_v3.0.fits'
  
  outdir = '/Users/degroota/research/current8_en1clusterfinding/' ;dont forget the trailing slash
  
  zrange = [1.2, 1.7]
  tags = ['mag_aper6_2', 'magerr_aper6_2', 'mag_aper6_1', 'magerr_aper6_1', 'mag_aper6_ch2', 'magerr_aper6_ch2' ]
  sigma = 1.0
  gauss = 'double'              ;use 2D gaussian for weights
  ins = 1.1
  maglims = [23.47, 23.23, 24.02, 23.78]
  
  result = create_colorweight_ch1ch2(incat, models, zrange, tags, SIGMA=sigma, INS=ins, MAGLIMS=maglims, GAUSSIAN=gauss, $
                                     DATADIR=indir, AUXDIR=auxdir, OUTDIR=outdir, VERBOSE=3, /SCREENP, /WRITEP, /HELP)
end
;========================================================================================================================
