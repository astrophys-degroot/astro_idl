;========================================================================================================================
function visualizeclusters_ch1ch2, redlist, grelist, blulist, as, bs, cs, CONVOLVE=convolve, $
                                   INDIR=indir, OUTDIR=outdir, $
                                   VERBOSE=verbose, HELP=help, WRITEF=writef, WRITEP=writep
  
  

;+
; NAME:
;       VISUALIZECLUSTERS_CH1CH2()
;
; PURPOSE:
;       
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
;       A. DeGroot, 2012 Aug 13, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 Aug 13, v1.0.0
;-


  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2   ;sets new value
  
  ;;;File structure checks
  if keyword_set(INDIR) then begin                                                                 ;check IMDIR
     case n_elements(INDIR) of                                                                     ;check elements of IMDIR
        1 : begin                                                                                  ;if IMIDR has 1 element
           if verbose ge 2 then print, '  INDIR has one element. All thumbnails in one location.'  ;print info
           check_indir, indir[0], redlist, VERBOSE=verbose                                         ;check indir
           check_indir, indir[0], grelist, VERBOSE=verbose                                         ;check indir
           check_indir, indir[0], blulist, VERBOSE=verbose                                         ;check indir
        end                                                                                        ;end if IMDIR has 1 element
        3 : begin                                                                                  ;if IMDIR has 3 elements
           if verbose ge 2 then print, '  IMDIR has three elements. Thumbnails in diff locations.' ;print info
           check_indir, indir[0], redlist, VERBOSE=verbose                                         ;check indir
           check_indir, indir[1], grelist, VERBOSE=verbose                                         ;check indir
           check_indir, indir[2], blulist, VERBOSE=verbose                                         ;check indir
        end                                                                                        ;end if IMDIR has 3 element
        else : print, ' IMDIR must have exactly 1 or 3 elements!!'                                 ;print info
     endcase                                                                                       ;end check elements of IMDIR
  endif                                                                                            ;end check IMDIR
  if keyword_set(OUTDIR) then begin                                                                ;check OUTDIR
     check_outdir, outdir, VERBOSE=vebose                                                          ;sets new value
  endif                                                                                            ;end check OUTDIR
  

  ;;;Read in cluster thumbnail lists
  reds = strarr(file_lines(redlist))               ;make array
  readcol, redlist, reds, FORMAT='a'               ;reads image names
  greens = strarr(file_lines(grelist))             ;make array
  readcol, grelist, greens, FORMAT='a'             ;reads image names
  blues = strarr(file_lines(blulist))              ;make array
  readcol, blulist, blues, FORMAT='a'              ;reads image names  if keyword_set(HELP) then help, reds             ;print info

  if keyword_set(HELP) then begin                  ;check HELP keyword
     help, reds                                    ;print info
     help, greens                                  ;print info
     help, blues                                   ;print info
  endif                                            ;end check HELP keyword


  for xx=0L, n_elements(reds)-1, 1 do begin                              ;loop over clusters
     if verbose ge 3 then print, '   Now working on cluster: ', reds[xx] ;print info
     
 
     ;;;Find green image
     gresearch = reds                                                                ;set temp array
     strreplace, gresearch, 'iracch2', 'iracch1'                                     ;replace string
     grefind = where(gresearch[xx] EQ greens, ngrefind)                              ;finds matching green thumbnail
     case ngrefind of                                                                ;check # of matches
        1 : if verbose ge 3 then print, '   Exactly one match found in green!!'      ;print info
        0 : if verbose ge 3 then print, '   No matches found in green!!'             ;print info 
        else : if verbose ge 3 then print, '   More than one match found in green!!' ;print info  
     endcase                                                                         ;end check # of matches

     ;;;Find blue image
     blusearch = reds                                                               ;set temp array
     strreplace, blusearch, 'iracch2', 'zband'                                      ;replace string
     blufind = where(blusearch[xx] EQ blues, nblufind)                              ;finds matching blue thumbnail
     case nblufind of                                                               ;check # of matches
        1 : if verbose ge 3 then print, '   Exactly one match found in blue!!'      ;print info
        0 : if verbose ge 3 then print, '   No matches found in blue!!'             ;print info 
        else : if verbose ge 3 then print, '   More than one match found in blue!!' ;print info  
     endcase                                                                        ;end check # of matches


     ;;;Only proceed if green and blue images found
     if (ngrefind ne 0) AND (nblufind ne 0) then begin ;check to make sure
     
        ;;;check file locations
        if keyword_set(INDIR) then begin                                     ;check INDIR
           case n_elements(INDIR) of                                         ;check elements of INDIR
              1 : begin                                                      ;if INIDR has 1 element
                 imared = strcompress(indir[0]+reds[xx], /REMOVE_ALL)        ;check indir
                 imagre = strcompress(indir[0]+greens[grefind], /REMOVE_ALL) ;check indir
                 imablu = strcompress(indir[0]+blues[blufind], /REMOVE_ALL)  ;check indir
              end                                                            ;end if INADIR has 1 element
              3 : begin                                                      ;if INDIR has 3 elements
                 imared = strcompress(indir[0]+reds[xx], /REMOVE_ALL)        ;check indir
                 imagre = strcompress(indir[1]+greens[grefind], /REMOVE_ALL) ;check indir
                 imablu = strcompress(indir[2]+blues[blufind], /REMOVE_ALL)  ;check indir
              end                                                            ;end if INDIR has 3 element
              else : print, ' INADIR must have exactly 1 or 3 elements!!'    ;print info
           endcase                                                           ;end check elements of INDIR
        endif else begin                                                     ;begin alt to check INDIR
           imared = reds[xx]                                                 ;set imaage
           imagre = greens[grefind]                                          ;set imaage
           imablu = blues[blufind]                                           ;set imaage
        endelse                                                              ;end alt to check INDIR
        
        temp = reds[xx]                                                                     ;holder
        strreplace, temp, 'iracch2.fits', 'rgb.jpg'                                         ;replace in string
        if keyword_set(OUTDIR) then out = strcompress(outdir+temp, /REMOVE_ALL) else $      ;cont next lin
           out = strcompress(temp, /REMOVE_ALL)                                             ;set outname
        case keyword_set(CONVOLVE) of                                                       ;check CONVOLVE keyword
           1 : RGBim = make_rgbim(imared, imagre, imablu, CONVOLVE=convolve, OUTFILE=out, $ ;cont next line
                                  VERBOSE=verbose, WRITEP=1, AS=as, BS=bs, CS=cs)           ;call to make RGB image
           0 : RGBim = make_rgbim(imared, imagre, imablu, OUTFILE=out, $                    ;cont next line
                                  VERBOSE=verbose, WRITEP=1,  AS=as, BS=bs, CS=cs)          ;call to make RGB image
        endcase                                                                             ;end check CONVOLVE keyword
     endif else begin                                                                       ;begin alt to green im, blue im
        print, '  Green or blue images not found!! Skipping this red image!!!'              ;print info
     endelse                                                                                ;end alt to green im, blue im
  endfor                                                                                    ;end loop over clusters  
end
;========================================================================================================================




;========================================================================================================================
pro call_visualizeclusters_ch1ch2


  indir = ['~/Desktop/sbs/lockman/I1I2clusterthumbs/iracch2/', $
           '~/Desktop/sbs/lockman/I1I2clusterthumbs/iracch1/', $
           '~/Desktop/sbs/lockman/I1I2clusterthumbs/zband/']
  redlist = 'clthumblist_iracch2.txt'
  grelist = 'clthumblist_iracch1.txt'
  blulist = 'clthumblist_zband.txt'
  outdir = '~/Desktop/sbs/lockman/I1I2clusterthumbs/'
  ;convolve = [1.5,1.5,7.4]
  convolve = [1.33,1.33,10.8]

  as = [11.0, 10.0, 8.0]
  bs = [-1.72, -0.46, -4.7]
  cs = [850.0, 140.0, 100.0]

  result = visualizeclusters_ch1ch2( redlist, grelist, blulist, as, bs, cs, CONVOLVE=convolve, $
                                     INDIR=indir, OUTDIR=outdir, VERBOSE=2, /WRITEF, /WRITEP, /HELP)
  


end
;========================================================================================================================
