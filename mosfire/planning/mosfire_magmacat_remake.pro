;========================================================================================================================
PRO mosfire_magmacat_remake, master, regfile, COLORREM=colorrem, COLORNEW=colornew, COLORNOM=colornom, $
                             NHDR=nhdr, EPSILON=epsilon, $
                             NEWID=newid, PROB=prob, JNOM=jnom, EPOCH=epoch, $
                             EQUINOX=equinox, THING1=thing1, THING2=thing2, $
                             OUTFILE=outfile, INDIR=indir, REGDIR=regdir, $
                             VERBOSE=verbose

  IF keyword_set(COLORREM) THEN colorrem = colorrem[0] ELSE colorrem = 'blue'         ;set new value
  IF keyword_set(COLORNEW) THEN colornew = colornew[0] ELSE colornew = 'red'          ;set new value
  IF keyword_set(COLORNOM) THEN colornom = colornom[0] ELSE colornom = 'green'        ;set nom value
  IF keyword_set(NHDR) THEN nhdr = nhdr[0] ELSE nhdr = 4                              ;set new value
  IF keyword_set(EPSILON) THEN epsilon = epsilon[0] ELSE epsilon = 0.5                ;set new value [arcsec]
  IF keyword_set(NEWID) THEN newid = newid[0] ELSE newid = 'man'                      ;set new value
  IF keyword_set(PROB) THEN prob = prob[0] ELSE prob = 5                              ;set new value
  IF keyword_set(JNOM) THEN jnom = jnom[0] ELSE jnom = 21.0                           ;set new value
  IF keyword_set(EPOCH) THEN epoch = epoch[0] ELSE epoch = 2000.0                     ;set new value
  IF keyword_set(EQUINOX) THEN equinox = equinox[0] ELSE equinox = 2000.0             ;set new value
  IF keyword_set(THING1) THEN thing1 = thing1[0] ELSE thing1 = 0                      ;set new value
  IF keyword_set(THING2) THEN thing2 = thing2[0] ELSE thing2 = 0                      ;set new value
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'magma_remade.txt' ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2                  ;set new value
  check_dir, 1                                                                        ;compile module
  
  ;;;Directory stucture
  IF keyword_set(INDIR) THEN check_indir, indir, master, NOTE='INDIR'     ;append directory
  IF keyword_set(REGDIR) THEN check_indir, regdir, regfile, NOTE='REGDIR' ;append directory
  

  ;;;sanity checks
  chk = strpos(master, '.fits')                                                    ;if its the .fits version
  IF chk[0] NE -1 THEN BEGIN                                                       ;if chk fails
     print, 'WARNING!! You have given the .FITS companion version.'                ;print info
     print, '  Please provide the .txt MAGMA version'                              ;print info
     print, '  After the MAGMA version is remade you can remake the .FITS version' ;print info
     print, '   using mosfire_magmacat_remakecomp. '                               ;print info
  ENDIF                                                                            ;end if chk fails
  
  
  ;;;read in files
  readcol, master, id1, priority1, jmag1, rah1, ram1, ras1, $       ;cont next line
           decd1, decm1, decs1, epoch1, equi1, xthing1, xthing2, $  ;cont next line
           FORMAT='(a,i,f,i,i,f,i,i,f,f,f,i,i)', /SILENT            ;read in master file 
  line = ' '                                                        ;intialize
  nlines = file_lines(regfile)                                      ;# of detections
  lines = strarr(nlines)                                            ;array to fill
  openr, lun, regfile, /GET_LUN                                     ;open file to read
  FOR xx=0, nlines-1, 1 DO BEGIN                                    ;loop over lines
     readf, lun, line, FORMAT='(A)'                                 ;read in line
     lines[xx] = line                                               ;store line
  ENDFOR                                                            ;end loop over lines
  close, lun                                                        ;close file
  free_lun, lun                                                     ;free logical unit
  lines = lines[nhdr:nlines-1]                                      ;get rid of hdr lines
  nlines = n_elements(lines)                                        ;redetermine # of lines
  diff = n_elements(id1) - nlines                                   ;find difference in # of detections
  IF verbose GE 2 THEN print, ' Difference in # detections: ', diff ;print info
  

  ;;;determine which regions to add or remove
  stru = {SHAPE:'circle', RA:0.000, DEC:0.000, SIZE:'0.0', COLOR:colornom} ;create structure
  newstruc = replicate(stru, nlines)                                       ;replicate structure
  newcnt = 0                                                               ;counter
  remstruc = replicate(stru, nlines)                                       ;replicate structure
  remcnt = 0                                                               ;counter 
  FOR xx=0, n_elements(lines)-1, 1 DO BEGIN                                ;loop over lines
     current = lines[xx]                                                   ;pick current line
     chk = strpos(current, '#')                                            ;find if new info
     IF chk[0] NE -1 THEN BEGIN                                            ;if new infomation present
        IF verbose GE 3 THEN print, '   Detection to add or remove!'       ;print info
        bits = strsplit(current, '(,),#, ', /EXTRACT)                      ;break apart line
        flag = 1                                                           ;flag
        FOR yy=4, n_elements(bits)-1, 1 DO BEGIN                           ;loop over extra bits
           chk = strpos(bits[yy], colornew)                                ;check if new color
           IF chk[0] NE -1 THEN BEGIN                                      ;good color
              flag = 0                                                     ;turn off flag
              newstruc[newcnt].shape = bits[0]                             ;store info
              newstruc[newcnt].ra = double(bits[1])                        ;store info
              newstruc[newcnt].dec = double(bits[2])                       ;store info
              newstruc[newcnt].size = bits[3]                              ;store info
              newcnt++                                                     ;up counter
           ENDIF                                                           ;end good color 
           chk = strpos(bits[yy], colorrem)                                ;check if new color
           IF chk[0] NE -1 THEN BEGIN                                      ;good color
              flag = 0                                                     ;turn off flag
              remstruc[remcnt].shape = bits[0]                             ;store info
              remstruc[remcnt].ra = double(bits[1])                        ;store info
              remstruc[remcnt].dec = double(bits[2])                       ;store info
              remstruc[remcnt].size = bits[3]                              ;store info
              remcnt++                                                     ;increase counter
           ENDIF                                                           ;end good color 
           IF flag EQ 1 THEN BEGIN                                         ;double check
              print, 'WARNING!! Detection found with unknown color!'       ;print info
              print, ' If its a detection to remove color is: ', colorrem  ;print info
              print, ' If its a detection to add color is: ', colornew     ;print info
           ENDIF                                                           ;end double check
        ENDFOR                                                             ;end loop over extra bits
     ENDIF                                                                 ;if no new info 
  ENDFOR                                                                   ;end loop over regions
  chk = where(abs(newstruc.ra-0.0) LT 0.01, COMPLEMENT=keep)               ;where to trim
  IF keep NE -1 THEN newstruc = newstruc[keep]                             ;trim array
  chk = where(abs(remstruc.ra-0.0) LT 0.01, COMPLEMENT=keep)               ;where to trim
  IF keep NE -1 THEN remstruc = remstruc[keep]                             ;trim array
  


  ;;;open the new file and begin to fill it with new detections
  openw, lun2, outfile, /GET_LUN
  radec, newstruc.ra, newstruc.dec, irah, iram, iras, idecd, idecm, idecs ;get hours, mins, secs
  print, newcnt
  IF newcnt NE 0 THEN inds = indgen(newcnt)
  FOR xx=0, newcnt-1, 1 DO BEGIN
     prstr = strcompress(strcompress(newid+string(inds[xx]), /REMOVE_ALL)+' '+string(prob)+' '+string(jnom)+' '+ $
                         string(irah[xx])+' '+string(iram[xx])+' '+string(iras[xx])+' '+ $
                         string(idecd[xx])+' '+string(idecm[xx])+' '+string(idecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun2, prstr, FORMAT='(A)'
  ENDFOR


  ;;;deal with detections marked for removal 
  IF remcnt GT 0 THEN BEGIN                                                ;objects to remove
     noditch = indgen(n_elements(id1))                                     ;indices array
     inras = (rah1*15.0) + (ram1*0.25) + (ras1*((1.0)/(240.0)))            ;convert to degrees
     indecs = decd1 + (decm1*(1.0/60.0)) + (decs1*((1.0/3600.0)))          ;convert to degrees
     FOR yy=0, remcnt-1, 1 DO BEGIN                                        ;loop over remove
        chk = where(3600.0*abs(remstruc[yy].ra-inras) LT epsilon AND $     ;cont next line
                    3600.0*abs(remstruc[yy].dec-indecs) LT epsilon)        ;find close match
        IF chk[0] NE -1 THEN BEGIN                                         ;if match found
           IF n_elements(chk) GT 1 THEN BEGIN                              ;if more than one match found
              print, 'WARNING!! More than one match found to remove!!'     ;print info
           ENDIF ELSE BEGIN                                                ;end if more than one match
              chk2 = where(noditch EQ chk[0], COMPLEMENT=keep)             ;find which ind to ditch
              noditch = noditch[keep]                                      ;ditch ind
           ENDELSE                                                         ;end if only one match
        ENDIF                                                              ;end if match found
     ENDFOR                                                                ;end loop over remove detections
     id1 = id1[noditch]                                                    ;ditch detection
     priority1 = priority1[noditch]                                        ;ditch detection
     jmag1 = jmag1[noditch]                                                ;ditch detection
     rah1 = rah1[noditch]                                                  ;ditch detection
     ram1 = ram1[noditch]                                                  ;ditch detection
     ras1 = ras1[noditch]                                                  ;ditch detection           
     decd1 = decd1[noditch]                                                ;ditch detection
     decm1 = decm1[noditch]                                                ;ditch detection
     decs1 = decs1[noditch]                                                ;ditch detection
     epoch1 = epoch1[noditch]                                              ;ditch detection
     equi1 = equi1[noditch]                                                ;ditch detection
     xthing1 = xthing1[noditch]                                            ;ditch detection
     xthing2 = xthing2[noditch]                                            ;ditch detection
  ENDIF                                                                    ;end objects to remove  
  
  FOR xx=0, n_elements(id1)-1, 1 DO BEGIN                                                                          ;loop over remaining inds
     prstr = strcompress(string(id1[xx])+' '+string(priority1[xx])+' '+string(jmag1[xx])+' '+ $                    ;cont next line
                         string(rah1[xx])+' '+string(ram1[xx])+' '+string(ras1[xx])+' '+ $                         ;cont next line
                         string(decd1[xx])+' '+string(decm1[xx])+' '+string(decs1[xx])+' '+ $                      ;cont next line
                         string(epoch1[xx])+' '+string(equi1[xx])+' '+string(xthing1[xx])+' '+string(xthing2[xx])) ;make string
     printf, lun2, prstr, FORMAT='(A)'                                                                             ;print string to file
  ENDFOR                                                                                                           ;end loop over remaining inds
  close, lun2                                                                                                      ;close file
  free_lun, lun2                                                                                                   ;free unit number


END
;========================================================================================================================



;========================================================================================================================
PRO call_mosfire_magmacat_remake

  master = 'en1790_feedtomagma_formask1_v1.0.txt'
  regfile = 'en1790_multipass_v2-2_ds9.reg'
  regdir = '../regions/'

  outfile = 'en1790_feedtomagma_formask1_v1.1.txt'
  
  mosfire_magmacat_remake, master, regfile, REGDIR=regdir, OUTFILE=outfile

END
;========================================================================================================================
