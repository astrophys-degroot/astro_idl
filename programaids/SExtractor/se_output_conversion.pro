;;;===========================================================================================================
function readparamfile, xseparam
  
  ;;;reads in SE param file 
  
  xline = ''
  xlabel = ''
  openr, lun, xseparam, /GET_LUN
  WHILE NOT eof(lun) DO BEGIN
     readf, lun, xline
     IF strlen(xline) EQ 0 OR $
        strmid(strtrim(xline, 2), 0, 1) EQ '#' THEN CONTINUE
     xline = strlowcase(xline)
     idx = where(xlabel EQ xline, ct)
     IF ct EQ 0 THEN BEGIN ;if # not found?
        chk = strsplit(xline, /EXTRACT) ;double check for comments in .param file
        IF n_elements(chk) EQ 1 THEN xline = xline ELSE $ ;if none found
           xline = chk[0]                                 ;only keep of interest tag
        xlabel = [xlabel, xline]                          ;append list
     ENDIF                                                ;end if # not found
  ENDWHILE                                                ;end while not at end of file
  close, lun                                              ;close memory
  free_lun, lun                                           ;free memory
  IF xlabel[0] EQ '' THEN xlabel = xlabel[1:*]            ;check for first place empty
 
  return, xlabel
end
;;;===========================================================================================================



;;;===========================================================================================================
function readsexfile, xsesex
  
  ;;;reads in SE .sex setup file 
  
  xline = ''                                                 ;initialize 
  xinfo = ''                                                 ;initialize
  openr, lun, xsesex, /GET_LUN                               ;open file to read
  WHILE NOT eof(lun) DO BEGIN                                ;continue until end of file
     readf, lun, xline                                       ;read line from file
     IF strlen(xline) EQ 0 OR $                              ;check line length
        strmid(strtrim(xline, 2), 0, 1) EQ '#' THEN CONTINUE ;check for comment char
     xline = strlowcase(xline)                               ;make all lower case
     idx = where(xinfo EQ xline, ct)                         ;check if line repeated
     IF ct EQ 0 THEN xinfo = [xinfo, xline]                  ;if not then add
  ENDWHILE                                                   ;end continue until end of file
  close, lun                                                 ;close file
  free_lun, lun                                              ;free file memory
  IF xinfo[0] EQ '' THEN xinfo = xinfo[1:*]                  ;remove blank space if present
  
  return, xinfo
end
;;;===========================================================================================================




;;;===========================================================================================================
function fillheader, xhdr, xinfo



  for xx=0L, n_elements(xinfo)-1, 1 do begin
     tmpval = strsplit(xinfo[xx], ' '+','+'#'+string(9b), /EXTRACT)
     
     case tmpval[0] of 
        'detect_type' : begin
           tmpval1 = strcompress(tmpval[1], /REMOVE_ALL) 
           fxaddpar, xhdr, 'DETTYPE', tmpval1, 'detector type'
           case tmpval1 of 
              'photo' : begin
              end
              else : a = 1
           endcase
        end
        'flag_image' : fxaddpar, xhdr, 'FLAGIM', tmpval[1], 'image used for flagging'
        'filter' : fxaddpar, xhdr, 'filter', tmpval[1], 'did SE filter?'
        'filter_name' : fxaddpar, xhdr, 'FILNAME', tmpval[1], 'filter name'
        'weight_type' : fxaddpar, xhdr, 'WEIGTYP', tmpval[1], 'type of weighting used'
        'weight_image' : fxaddpar, xhdr, 'WEIGTIM', tmpval[1], 'image used for weighting'
        'detect_minarea' : fxaddpar, xhdr, 'DETMINA', float(tmpval[1]), 'minimum area of detection'
        'detect_thresh' : fxaddpar, xhdr, 'DETTHRE', float(tmpval[1]), 'detection threshold '
        'analysis_thresh' : fxaddpar, xhdr, 'ANATHRE', float(tmpval[1]), 'analysis threshold'
        'deblend_nthresh' : fxaddpar, xhdr, 'DENTHRE', fix(tmpval[1]), 'Number of deblending sub-thresholds'
        'deblend_mincont' : fxaddpar, xhdr, 'DENTHRE', float(tmpval[1]), 'Minimum contrast parameter for deblending'
        'clean' : fxaddpar, xhdr, 'CLEAN', tmpval[1], 'did SE clean for spurious detections?'
        'clean_param' : fxaddpar, xhdr, 'CLEANPA', float(tmpval[1]), 'cleaning efficiency'
        'mask_type' : fxaddpar, xhdr, 'MASKTYP', tmpval[1], 'type of detection MASKing:'
        'satur_level' : fxaddpar, xhdr, 'SATULEV', float(tmpval[1]), 'level (in ADUs) at which arises saturation'
        'phot_apertures' : begin
           cntr = 0
           for yy=0, n_elements(tmpval)-1, 1 do begin
              test = valid_num(tmpval[yy])
              if test eq 1 then begin
                 xlabel = strcompress('APER'+string(cntr+1), /REMOVE_ALL)
                 xcom = strcompress('aperture '+ string(cntr+1)+' diameter in pixels')
                 fxaddpar, xhdr, xlabel, float(tmpval[yy]), xcom
                 cntr = cntr + 1
              endif
           endfor
        end
        'phot_autoparams' : begin
           fxaddpar, xhdr, 'AUTOPA1', float(tmpval[1]), 'MAG_AUTO parameters: Kron_fact'
           fxaddpar, xhdr, 'AUTOPA2', float(tmpval[2]), 'MAG_AUTO parameters: min_rad'
        end
        'phot_petroparams' : begin
           fxaddpar, xhdr, 'PETRO1', float(tmpval[1]), 'MAG_PETRO parameters: Petrosian_fact'
           fxaddpar, xhdr, 'PETRO2', float(tmpval[2]), 'MAG_PETRO parameters: min_radius'
        end
        'mag_zeropoint' : fxaddpar, xhdr, 'MAGZERO', float(tmpval[1]), 'magnitude zero-point'
        'mag_gamma' : fxaddpar, xhdr, 'MAGGAMM', float(tmpval[1]), 'gamma of emulsion'
        'gain' : fxaddpar, xhdr, 'GAIN', float(tmpval[1]), 'detector gain in e-/ADU'
        'pixel_scale' : fxaddpar, xhdr, 'PIXSCAL', float(tmpval[1]), 'size of pixel in arcsec'
        'seeing_fwhm' : fxaddpar, xhdr, 'SEEFWHM', float(tmpval[1]), 'stellar FWHM in arcsec'
        'starnnw_name' : fxaddpar, xhdr, 'STARNNW', tmpval[1], 'Neural-Network_Weight table filename'
        'back_size' : fxaddpar, xhdr, 'BACKSIZ', fix(tmpval[1]), 'background mesh size'
        'back_filtersize' : fxaddpar, xhdr, 'BACKFIL', float(tmpval[1]), 'background filter size'
        'backphoto_type' : fxaddpar, xhdr, 'BACKTYP', tmpval[1], 'SE background type'
        'checkimage_type' : begin
           keep = where(tmpval eq 'background' or tmpval eq 'minibackground' or $
                        tmpval eq '-background' or tmpval eq 'objects' or $
                        tmpval eq '-objects' or tmpval eq 'segmentation' or $
                        tmpval eq 'apertures' or tmpval eq 'filtered', nkeep)
           if nkeep NE 0 THEN checkims = tmpval[keep]
        end
        'checkimage_name' : begin
           if n_elements(checkims) NE 0 then begin
              for yy=0, n_elements(checkims)-1, 1 do begin
                 xlabel = strcompress('CHCKIM'+string(yy+1), /REMOVE_ALL)
                 xcom = strcompress(checkims[yy]+ ' check image name')
                 fxaddpar, xhdr, xlabel, tmpval[yy+1], xcom
              endfor
           endif
        end
        else : a = 1
     endcase     
  endfor
  fxaddpar, xhdr, 'COMMENT', ' *** Sextractor parameters used for photometry *** ', BEFORE='DETTYPE'

  
  return, xhdr
end
;;;===========================================================================================================



;;;===========================================================================================================
pro asciitofits, separam, sesex, filein, TELLIM=tellim, OUTFILE=outfile, PREFIX=prefix, SUFFIX=suffix, $
                 HELP=help
  

;+
; NAME:
;       XXXX()
;
; PURPOSE:
;           
;
; CALLING SEQUENCE:
;       
;      
; INPUTS:
;        
;
; OPTIONAL INPUTS:
;       
;
; KEYWORD PARAMETERS:
;        
;
; OUTPUTS:
;       
;
; OPTIONAL OUTPUTS:
;
;
; COMMON BLOCKS:
;       
;
; PROCEDURES USED:
;       
;
; COMMENTS:
;     2014 aug 14 : if asking for multiples of same parameter you must
;     use '{}' i.e. flux_aper{3}
;     2013 July 7 : no comment allowed on checkimage_type line in SE file
;     2013 July 7 : tellim keyword not functioning
;        
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;     A DeGroot. 2013 May 24 University of California, Riverside v1.0.0
;        -functional for ASCIITOFITS
;
;
; DESIRED UPGRADES
;     -in ASCIITOFITS make it capable of handling MAG_APER[2] as well
;     as MAG_APER(2) instead of just MAG_APER{2}
; 
;
;-


  
  ;;;main input: location of the setup file
  IF n_params() LT 3 THEN BEGIN
     separam = ''
     read, prompt = 'Location of SE param file used: ', separam
     sesex = ''
     read, prompt = 'Location of SE .sex setup file used: ', sesex
     filein = ''
     read, prompt = 'Location of SE output file to convert: ', filein
  ENDIF
  
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'asciitofits_out.fits' ;set new value
  IF keyword_set(PREFIX) THEN prefix = prefix[0] ELSE prefix = ''                         ;set new value
  IF keyword_set(SUFFIX) THEN suffix = suffix[0] ELSE suffix = ''                         ;set new value
  

  ;;;call to read in param file
  label = readparamfile(separam)


  ;;;mend the params for multiples like flux_aper(3)
  check = strmatch(label, '*{*}*')
  check2 = where(check EQ 1, ncheck2) 
  FOR zz=(ncheck2-1), 0, -1 DO BEGIN
     parts = strsplit(label[check2[zz]], '{'+'}', /EXTRACT)
     naps = fix(parts[1])
     CASE NAPS OF
        1 : BEGIN
           tmparr = indgen(naps)+1
           tmparr = string(temporary(tmparr))
           tmparr = strcompress(parts[0] + tmparr, /REMOVE_ALL)
           label[check2[zz]] = tmparr
        END
        ELSE : BEGIN
           IF (naps LT 0) OR (naps GT 99) THEN print, 'Something has gone wrong!!'
           tmparr = indgen(naps)+1
           tmparr = string(temporary(tmparr))
           tmparr = strcompress(parts[0] + tmparr, /REMOVE_ALL)
           label = [label[0:check2[zz]-1], tmparr, label[check2[zz]+1:*]]
        END
     ENDCASE
  ENDFOR
  
  
  ;;;prep a fake set of data with appropriate type 
  value = label            
  FOR i=0ul, n_elements(label)-1 DO BEGIN
     CASE label[i] OF
        'number': value[i] = '0LL'
        'flags': value[i] = '0'
        'imaflags_iso': value[i] = '0'
        'nimaflags_iso': value[i] = '0'
        'alpha_sky' : value[i] = '0.d0'
        'delta_sky': value[i] = '0.d0'
        'alpha_j2000': value[i] = '0.d0'
        'delta_j2000': value[i] = '0.d0'
        'alpha_b1950': value[i] = '0.d0'
        'delta_b1950': value[i] = '0.d0'
        ELSE : value[i] = '0.'
     ENDCASE
  ENDFOR
  label = strcompress(prefix + label + suffix, /REMOVE_ALL) ;apply prefix or suffix if noted
  
  
  ;;;if we want mosaic information included
  if keyword_set(TELLIM) then begin
     label = [label, tellim.imtag]
     value = [value, '" "']
  endif
  
  
  ;;;make the structure
  nrow = file_lines(filein)
  outstru = mrd_struct_gala(label, value, nrow, /NO_EXECUTE)
  if keyword_set(HELP) then help, outstru, /STRU
  

  ;;;read in data
  line = ''
  nlines = file_lines(filein)
  cxx = 0UL
  openr, lun, filein, /GET_LUN
  WHILE NOT eof(lun) DO BEGIN
     IF cxx mod 10000 EQ 0 THEN print, cxx, ' /', nlines
     readf, lun, line
     values = strsplit(line, ' ', /EXTRACT)
     FOR xx=0UL, n_elements(values)-1, 1 DO BEGIN
        outstru(cxx).(xx) = values[xx]
     ENDFOR
     cxx++
  ENDWHILE
  close, lun
  free_lun, lun

  
  ;;;file and header creation
  mwrfits, outstru, outfile, /CREATE  
  im = mrdfits(outfile, 1, hdr, /SILENT)
  info = readsexfile(sesex)
  newhdr = fillheader(hdr, info)

  
  ;;;now we add the mosaic information if we want
  if keyword_set(TELLIM) then begin
     status = tag_exist(outstru, tellim.imtag, INDEX=ind, /TOP_LEVEL) ;check where tag is
     outstru.(ind) = tellim.imval
  endif
  mwrfits, outstru, outfile, newhdr, /CREATE  

end
;;;===========================================================================================================



;;;===========================================================================================================
pro call_asciitofits

  separam = 'en1719_cluster.param'
  sesex = 'en1719_cluster.sex'
  filein = 'en1719_servs_ch2_photocat_v1.cat'
  outfile = 'en1719_servs_ch2_photocat_v1.fits'
  prefix = 'sech2_'
                                ; tellim = {imtag:'IMAGI1', imval:'servs.en1.irac.b1.v02.030111.mosaic.fits', imcom:'IRAC CH1 image'}

  
  asciitofits, separam, sesex, filein, OUTFILE=outfile, PREFIX=prefix 

end
;;;===========================================================================================================





;;;===========================================================================================================
pro se_output_conversion, verbose


  if verbose GE 2 then print, 'Compiling se_output_conversion.pro'

  
end
;;;===========================================================================================================
