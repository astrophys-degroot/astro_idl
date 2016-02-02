;========================================================================================================================
pro mosfire_magmacat_nextmask, master, recent, companion, nextout, nextoutcomp, outcompthis, $
                               EPSILON=epsilon, NOID=noid, RETARG=retarg, PRETARG=pretarg, $
                               VERBOSE=verbose, HELP=help

  

  ;;;add ability to keep targeted objects

  IF keyword_set(EPSILON) THEN epsilon = epsilon[0] ELSE epsilon = 0.5 ;sets new value [arcsec]
  IF keyword_set(PRETARG) THEN pretarg = pretarg[0] ELSE pretarg = 1.0 ;sets new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2   ;sets new value
  IF keyword_set(COMPANION) THEN companion = companion[0] 
  IF keyword_set(NEXTOUT) THEN nextout = nextout[0]   
  IF keyword_set(NEXTOUTCOMP) THEN nextoutcomp = nextoutcomp ELSE nextoutcomp = 'NA' 
  IF keyword_set(RECENTCOMP) THEN recentcomp = recentcomp ELSE recentcomp = 'NA' 

  IF VERBOSE GE 1 THEN BEGIN
     print, " Name of magma input catalog for the previous mask's design: ", master
     print, " Name of mask just created using magma input catalog:", recent
     print, " Name of magma input catalog in .FITS format: ", companion
     print, " Name of next magma input catalog for mask desing: ", nextout
     print, " Name of next magma input catalog in .FITS format: ", nextoutcomp
     print, " Name of mask just created in .FITS format: ", recentcomp
  ENDIF
  
  ;;;read in files 
  readcol, master, id1, priority1, jmag1, rah1, ram1, ras1, decd1, decm1, decs1, $  ;cont next line
           epoch1, equi1, thing11, thing21, FORMAT='(a,i,f,f,f,f,f,f,f,f,f,i,i)'    ;read in master catalog
  readcol, recent, id2, priority2, jmag2, rah2, ram2, ras2, decd2, decm2, decs2, $  ;cont next line
           epoch2, equi2, thing12, thing22, FORMAT='(a,i,f,f,f,f,f,f,f,f,f,i,i)'    ;read in recent mask
  ;IF keyword_set(COMPANION) THEN BEGIN                                              ;if COMPANION file given
  comp = mrdfits(companion, 1)  ;read in file 
  ;   IF keyword_set(HELP) THEN help, comp, /STRUC                                   ;offer help
  ;ENDIF                                                                             ;end if COMPANION file given

  ;;;.FITS version of the detections in the current mask
  inmask = intarr(n_elements(id2))
  inmask[*] = -6789 
  FOR xx=0L, n_elements(id2)-1, 1 DO BEGIN
     IF priority2[xx] NE -1 THEN BEGIN
        IF keyword_set(NOID) THEN BEGIN 
           test = where((rah2[xx] EQ rah1) AND (ram2[xx] EQ ram1) AND (abs(ras2[xx]-ras1) LT epsilon) AND $
                        (decd2[xx] EQ decd1) AND (decm2[xx] EQ decm1) AND (abs(decs2[xx]-decs1) LT epsilon), $
                        n, COMPLEMENT=keep, NCOMPLEMENT=nkeep) 
        ENDIF ELSE BEGIN
           test = where((rah2[xx] EQ rah1) AND (ram2[xx] EQ ram1) AND (abs(ras2[xx]-ras1) LT epsilon) AND $
                        (decd2[xx] EQ decd1) AND (decm2[xx] EQ decm1) AND (abs(decs2[xx]-decs1) LT epsilon) AND id2[xx] EQ id1, $
                        n, COMPLEMENT=keep, NCOMPLEMENT=nkeep)
        ENDELSE
        IF test[0] EQ -1 THEN print, ' No matches found!!!!'
        IF (n_elements(test) GT 1) THEN print, ' More than one match found!!!'
        inmask[xx] = test
     ENDIF
  ENDFOR
  test = where(inmask NE -6789)
  compthis = comp[inmask[test]]
  mwrfits, compthis, outcompthis, /CREATE
  

  ;;;Next mask's companion catalog
  compnext = comp
  IF keyword_set(RETARG) THEN BEGIN 
     FOR yy=0L, n_elements(id2)-1, 1 DO BEGIN
        IF priority2[yy] ne -1 THEN BEGIN
           IF keyword_set(NOID) THEN BEGIN 
              test = where((rah2[yy] EQ rah1) AND (ram2[yy] EQ ram1) AND (abs(ras2[yy]-ras1) LT epsilon) AND $
                           (decd2[yy] EQ decd1) AND (decm2[yy] EQ decm1) AND (abs(decs2[yy]-decs1) LT epsilon), $
                           n, COMPLEMENT=keep, NCOMPLEMENT=nkeep) 
           ENDIF ELSE BEGIN
              test = where((rah2[yy] EQ rah1) AND (ram2[yy] EQ ram1) AND (abs(ras2[yy]-ras1) LT epsilon) AND $
                           (decd2[yy] EQ decd1) AND (decm2[yy] EQ decm1) AND (abs(decs2[yy]-decs1) LT epsilon) AND id2[yy] EQ id1, $
                           n, COMPLEMENT=keep, NCOMPLEMENT=nkeep)
           ENDELSE
                                ;if (n ne 1) or (nkeep GE (n_elements(id1))) then print, ' More than one match found!!!'
           IF test[0] NE -1 THEN BEGIN
              priority1[test] = pretarg
              compnext[test].priority = pretarg
           ENDIF
        endif else print, ' Guide star!! Keeping it!!'
     endfor
     mwrfits, compnext, nextoutcomp, /CREATE ;write next mask companion file 
     
     openw, lun, nextout, /GET_LUN
     for zz=0L, n_elements(id1)-1, 1 do begin
        if zz mod 100 eq 0 then print, '  Now on number: ', zz
        prstr = strcompress(string(id1[zz])+' '+string(priority1[zz])+' '+string(jmag1[zz])+' '+ $
                            string(fix(rah1[zz]))+' '+string(fix(ram1[zz]))+' '+string(ras1[zz])+' '+ $
                            string(fix(decd1[zz]))+' '+string(fix(decm1[zz]))+' '+string(decs1[zz])+' '+ $
                            string(epoch1[zz])+' '+string(equi1[zz])+' '+string(thing11[zz])+' '+string(thing21[zz]))
        printf, lun, prstr, FORMAT='(a)'
     endfor
     close, lun
     free_lun, lun
     
  ENDIF ELSE BEGIN
     FOR yy=0L, n_elements(id2)-1, 1 DO BEGIN
        IF priority2[yy] ne -1 THEN BEGIN
           IF keyword_set(NOID) THEN BEGIN 
              test = where((rah2[yy] EQ rah1) AND (ram2[yy] EQ ram1) AND (abs(ras2[yy]-ras1) LT epsilon) AND $
                           (decd2[yy] EQ decd1) AND (decm2[yy] EQ decm1) AND (abs(decs2[yy]-decs1) LT epsilon), $
                           n, COMPLEMENT=keep, NCOMPLEMENT=nkeep) 
           ENDIF ELSE BEGIN
              test = where((rah2[yy] EQ rah1) AND (ram2[yy] EQ ram1) AND (abs(ras2[yy]-ras1) LT epsilon) AND $
                           (decd2[yy] EQ decd1) AND (decm2[yy] EQ decm1) AND (abs(decs2[yy]-decs1) LT epsilon) AND id2[yy] EQ id1, $
                           n, COMPLEMENT=keep, NCOMPLEMENT=nkeep)
           ENDELSE
                                ;if (n ne 1) or (nkeep GE (n_elements(id1))) then print, ' More than one match found!!!'
           id1 = id1[keep]
           priority1 = priority1[keep]
           jmag1 = jmag1[keep]
           rah1 = rah1[keep]
           ram1 = ram1[keep]
           ras1 = ras1[keep]
           decd1 = decd1[keep]
           decm1 = decm1[keep]
           decs1 = decs1[keep]
           epoch1 = epoch1[keep]
           equi1 = equi1[keep]
           thing11 = thing11[keep]
           thing21 = thing21[keep]
           compnext = compnext[keep]
        endif else print, ' Guide star!! Keeping it!!'
     endfor
     mwrfits, compnext, nextoutcomp, /CREATE ;write next mask companion file 
     

     openw, lun, nextout, /GET_LUN
     for zz=0L, n_elements(id1)-1, 1 do begin
        if zz mod 100 eq 0 then print, '  Now on number: ', zz
        prstr = strcompress(string(id1[zz])+' '+string(priority1[zz])+' '+string(jmag1[zz])+' '+ $
                            string(fix(rah1[zz]))+' '+string(fix(ram1[zz]))+' '+string(ras1[zz])+' '+ $
                            string(fix(decd1[zz]))+' '+string(fix(decm1[zz]))+' '+string(decs1[zz])+' '+ $
                            string(epoch1[zz])+' '+string(equi1[zz])+' '+string(thing11[zz])+' '+string(thing21[zz]))
        printf, lun, prstr, FORMAT='(a)'
     endfor
     close, lun
     free_lun, lun
  ENDELSE

end
;========================================================================================================================
