;========================================================================================================================
function catbase

  catbase = {ra:0.0D, dec:0.0D, rah:0, ram:0, ras:0.0D, decd:0, decm:0, decs:0.0D, mask:'string', Z:-99.99, dZ:-99.99, $
             MOBINSLIT:0}
  

  RETURN, catbase
END
;========================================================================================================================



;========================================================================================================================
function upgradecatbase, xcatbase, xlines

  
  fval = -99.99
  ival = 0
  FOR yy=0, n_elements(xlines)-1, 1 DO BEGIN
     test = strcompress(xlines[yy] + '_FLUX', /REMOVE_ALL)
     ind = tag_exist(xcatbase, test)
     IF ind EQ 0 THEN BEGIN
        add_tag, xcatbase, test, fval, tmpcat
        xcatbase = tmpcat
        tmpcat = 0
     ENDIF
     test = strcompress(xlines[yy] + '_FLUXERR', /REMOVE_ALL)
     ind = tag_exist(xcatbase, test)
     IF ind EQ 0 THEN BEGIN
        add_tag, xcatbase, test, fval, tmpcat
        xcatbase = tmpcat
        tmpcat = 0
     ENDIF
     test = strcompress(xlines[yy] + '_FLAG', /REMOVE_ALL)
     ind = tag_exist(xcatbase, test)
     IF ind EQ 0 THEN BEGIN
        add_tag, xcatbase, test, ival, tmpcat
        xcatbase = tmpcat
        tmpcat = 0
     ENDIF
  ENDFOR
  
  RETURN, xcatbase
END
;========================================================================================================================



;========================================================================================================================
pro cdfs44_mask4_H_measure, LIST=list, MASK=mask, OUTFILE=outfile, NAMEPOS=namepos, $
                            SGNFCUT=SGNFCUT, $
                            LISTDIR=listdir, MASKDIR=maskdir, OUTDIR=outdir, $
                            VERBOSE=verbose, HELP=help
                            
  
  
  IF keyword_set(LIST) THEN list = list[0] ELSE list = 'cdfs44_mask4_1.0_H_1dspeclist_v1-2.txt'
  IF keyword_set(LISTDIR) THEN listdir = listdir[0] ELSE $
     listdir = '/Users/degroota/research/current4_mosfire_2012nov28_cdfs44/CDFS44_mask4_1.0/'
  IF keyword_set(MASK) THEN mask = mask[0] ELSE mask = 'CDFS44_mask4_1.0_orig.coords'
  IF keyword_set(MASKDIR) THEN maskdir = maskdir[0] ELSE $
     maskdir = '/Users/degroota/research/observing/keck/mosfire/2012nov24/cdfs44/CDFS44_mask4_1.0/'
  IF keyword_set(NAMEPOS) THEN namepos = namepos[0] ELSE namepos = 5
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'cdfs44_mask4_1dspeccat_v1-0.fits'
  IF keyword_set(SGNFCUT) THEN sgnfcut = sgnfcut[0] ELSE sgnfcut = 5.0
  check_dir, 1                  ;compile module
   
  
  ;;;Check directories
  check_indir, listdir, list, VERBOSE=1, NOTE='LISTDIR' 
  check_indir, maskdir, mask, VERBOSE=1, NOTE='MASKDIR'  

  
  ;;;Read in 1D spectra list
  bit = ' ' 
  nlines = file_lines(list)
  spectra = strarr(nlines)
  openr, lun, list, /GET_LUN
  FOR xx=0, nlines-1, 1 DO BEGIN
     readf, lun, bit
     spectra[xx] = bit
  ENDFOR
  FREE_LUN, lun

  
  ;;;Read in MOSFIRE mask
  readcol, mask, name, priority, jmag, rah, ram, ras, decd, decm, decs, epoch, blah1, blah2, blah3, $
           FORMAT='(A, L, F, I, I, F, I, I, F, F, F, F, F)'

   
  ;;;Find which line measurements are present
  base = catbase()                                            ;get base
  FOR xx=0, nlines-1, 1 DO BEGIN                              ;loop over spectra
     current = spectra[xx]                                    ;get current
     check_indir, listdir, current, VERBOSE=1, NOTE='SPECDIR' ;check directory 
     data = mrdfits(current, 1, hdr, /SILENT)                 ;read in file
     lines = fxpar(hdr, 'ZLINE*')                             ;find lines present
     upgrade = upgradecatbase(base, lines)                    ;add tags for lines present
  ENDFOR                                                      ;end loop over spectra
  cat = replicate(base, nlines)                               ;replicate cat
  IF keyword_set(HELP) THEN help, cat, /STRUC                 ;offer help

  
  ;;;compile info
  FOR xx=0, nlines-1, 1 DO BEGIN ;loop over spectra 
     current = spectra[xx]       ;get current
     ;print, current
     
     bits = strsplit(current, '_,.', /EXTRACT)                                 ;split current name
     chk = where(bits[namepos] EQ name, nchk)                                  ;find counterpart in mask cat
     IF (chk[0] NE -1) AND (nchk EQ 1) THEN BEGIN                              ;if exactly one counterpart found
        cat[xx].rah = rah[chk]                                                 ;store value
        cat[xx].ram = ram[chk]                                                 ;store value
        cat[xx].ras = ras[chk]                                                 ;store value
        cat[xx].decd = decd[chk]                                               ;store value
        cat[xx].decm = decm[chk]                                               ;store value
        cat[xx].decs = decs[chk]                                               ;store value
        cat[xx].ra = (15.0*rah[chk]) + (0.25*ram[chk]) + (0.00416666*ras[chk]) ;store value
        cat[xx].dec = decd[chk] - (decm[chk]/60.0) - (decs[chk]/3600.0)        ;store value
        
        ;;;read in spectrum (again)
        check_indir, listdir, current, VERBOSE=1, NOTE='SPECDIR' 
        data = mrdfits(current, 1, hdr, /SILENT)
        cat[xx].z = fxpar(hdr, 'Z')
        cat[xx].dz = fxpar(hdr, 'dZ')
        tmp = fxpar(hdr, 'HASGNF')
        IF tmp LT SGNFCUT THEN cat[xx].ha_flag = 1
        tmp = fxpar(hdr, 'NIIRSGNF')
        IF tmp LT SGNFCUT THEN cat[xx].niir_flag = 1
        cat = mosfire_1dspec_measure(data, hdr, cat, xx, /FLUX)
        
     ENDIF ELSE BEGIN
        print, 'WARNING!! Something has gone horribly wrong!!'
        ;print, current
     ENDELSE
     
  ENDFOR
  cat[*].mask = strcompress(bits[0] + '_' +  bits[1] + '_mosfire', /REMOVE_ALL)
  
     
  print, cat.ha_flag
  print, cat.niir_flag
     
  ;;;Output final product
  ;print, cat
  mwrfits, cat, outfile, /CREATE

  

END	
;========================================================================================================================
  


