;========================================================================================================================
pro mosfire_magmacat_nudge, mask, image, OUTFILE=outfile, $
                            MASKDIR=maskdir, IMDIR=imdir, OUTDIR=outdir, $
                            VERBOSE=verbose ;NHDR=nhdr, 



  
                                ;IF keyword_set(NHDR) THEN nhdr = nhdr[0] ELSE nhdr = 5             ;sets new value
  IF keyword_set(MASKDIR) THEN maskdir = maskdir[0] ELSE maskdir = ' ' ;sets new value
  IF keyword_set(IMDIR) THEN imdir = imdir[0] ELSE imdir = ' '         ;sets new value
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = ' '     ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2   ;sets new value
  check_dir, 1                                                         ;compile module
  

  ;;;files and directory appending
  maskfile = strcompress(mask + '/' + mask +  '.coords', /REMOVE_ALL)         ;get .coords file name
  maskfile = strcompress(maskdir + maskfile, /REMOVE_ALL)                     ;append directory 
  regfile = strcompress(mask + '/' + mask +  '_SlitRegions.reg', /REMOVE_ALL) ;get .coords file name
  regfile = strcompress(maskdir + regfile, /REMOVE_ALL)                       ;append directory 
  imfile = strcompress(imdir + image, /REMOVE_ALL)                            ;append directory 
  outfile = strcompress(mask + '_nudged.reg', /REMOVE_ALL)                    ;create region file name
  outfile = strcompress(outdir + outfile, /REMOVE_ALL)                        ;append directory 

  print, maskfile
  print, regfile
  print, imfile
  print, outfile


  ;;;read in file
  readcol, maskfile, id, prior, jmag, rah, ram, ras, dech, decm, decs, $        ;cont next line 
           epoch, equinox, thing1, thing2, FORMAT='(A,I,F,I,I,F,I,I,F,F,F,F,F)' ;read in .coords file
  nid = n_elements(id)                                                          ;number of objects on the mask


  ;;;create the region file
  openw, lun, outfile, /GET_LUN
  printf, lun, '# Region file format: DS9 version 4.1'                                                  ;text
  printf, lun, strcompress('# Filename: ' + mask)                                                       ;text
  printf, lun, 'global color=green dashlist=8 3 width=1 font="helvetica 10 normal roman" ' + $          ;cont next line
          'select=1 highlite=1 dash=0 fixed=0 edit=1 move=1 delete=1 include=1 source=1'                ;text
  printf, lun, 'fk5'                                                                                    ;text
  FOR xx=0, nid-1, 1 DO BEGIN                                                                           ;loop over mask members
     ra = strcompress(string(rah[xx]) + ':' + string(ram[xx]) + ':' + string(ras[xx]), /REMOVE_ALL)     ;ra bit
     dec = strcompress(string(dech[xx]) + ':' + string(decm[xx]) + ':' + string(decs[xx]), /REMOVE_ALL) ;dec bit 
     line = strcompress('circle('+ ra + ',' + dec +',1.0")', /REMOVE_ALL)                               ;whole bit
     printf, lun, line                                                                                  ;print to file
  ENDFOR                                                                                                ;end loop over mask members
  close, lun                                                                                            ;close memory unit
  free_lun, lun                                                                                         ;free memory unit


  ;;;load image and region file
  line = ' -zscale -frame 1 -zoom to fit -regions load ' + outfile + $                                 ;cont next line
         ' -frame 2 -zoom to fit ' + imfile + ' -regions load ' + regfile + ' &'                       ;ds9 options
  ;spawn, 'ds9 ' + imfile + line                                                                        ;open image in ds9
  line = ''                                                                                            ;initialize
  cntr = 0                                                                                             ;initialize counter
  value = ''                                                                                           ;intialize
  check = 'Y'                                                                                          ;value
  read, value, PROMPT = '  Did you save the nudged region file in ds9 format in fk5 sexigesimal? [Y] ' ;prompt
  IF value EQ '' THEN check = check ELSE check = value                                                 ;store new value
  IF check EQ 'Y' THEN BEGIN                                                                           ;if file has been saved
     spawn, 'cp LOK200_mask7_v3-2_2_nudged2.reg tmp.txt'                                               ;move the outfile to tmp
     openr, lun, 'tmp.txt', /GET_LUN                                                                   ;open tmp file for reading
     openw, lun2, outfile, /GET_LUN                                                                    ;open file for writing
     FOR xx=0, n_elements(id)+2, 1 DO BEGIN                                                            ;loop over detections and header
        readf, lun, line                                                                               ;read from file
        IF xx GT 2 THEN BEGIN                                                                          ;if real region
           bits = strsplit(line, '(,,,),:,+', /EXTRACT)                                                ;extract the RA, Dec info
           outline = strcompress(string(id[cntr]) + string(prior[cntr]) + string(jmag[cntr]) + ' ' + $
                                 string(bits[1]) + ' ' + string(bits[2]) + ' ' + string(bits[3]) + ' ' + $
                                 string(bits[4]) + ' ' + string(bits[5]) + ' ' + string(bits[6]) + $
                                 string(epoch[cntr]) + string(equinox[cntr]) + string(thing1[cntr]) + string(thing2[cntr]))
           printf, lun2, outline
           cntr++
        ENDIF ELSE pass = 1     ;if header 
     ENDFOR
     close, lun2
     free_lun, lun2
     close, lun
     free_lun, lun
  ENDIF ELSE BEGIN                                           ;end if file saved
     print, '  File was not saved. Nudged file not created.' ;print info
  ENDELSE                                                    ;end if file not saved
  


END
;========================================================================================================================



;========================================================================================================================
pro call_mosfire_magmacat_nudge
  
  print, 'Nothing here yet!' 
  
  ;mask = 'LOK200_mask7_v3-2_2'
  ;indir = ''
  ;outfile = 'lok200_feedtomagma_inmask7_v3-2_2_nudged.fits'

  ;mosfire_magmacat_nudge, mask, INDIR=indir, OUTFILE=outfile


end
;========================================================================================================================
