;========================================================================================================================
FUNCTION struccombine_radec, xdata1, xdata2, TMATCH=tmatch, $
                             STMATCH=stmatch, MINMATCH=minmatch, MAXMATCH=maxmatch, FRACCHANGE=fracchange, $
                             MAXITER=maxiter, $
                             TAGRA1=tagra1, TAGDEC1=tagdec1, TAGRA2=tagra2, TAGDEC2=tagdec2, $
                             EPSILON=epsilon, ALLOWED=allowed, $
                             ONENOTTWO=onenottwo, TWONOTONE=twonotone, $
                             OUTFILE=outfile, $
                             VERBOSE=verbose 


;+
; NAME:
;       STRUCCOMBINE_RADEC()
;
; PURPOSE:
;       Take two data structures with RA, DEC data, perform an RA, DEC
;       match, then combine the two structures into a single new
;       structure and return that new structure. 
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
;       Double matches are always an issue. Same object from cat2 gets
;          matched to two objects in cat1 
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2015 Feb 15, Univ. Cali, Riverside v1.1.0
;          -added ability to include not matched from either catalog
;       A. DeGroot, 2015 Feb 15, Univ. Cali, Riverside v1.0.0
;          -Inception
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1-0-0'


  ;;;Default values
  IF keyword_set(TMATCH) THEN tmatch = tmatch[0] ELSE tmatch = 1                             ;set new value
  IF keyword_set(STMATCH) THEN stmatch = stmatch[0] ELSE stmatch = 0.25                      ;set new value in [arcsec]
  IF keyword_set(MINMATCH) THEN minmatch = minmatch[0] ELSE minmatch = 0.2                   ;set new value in [arcsec]
  IF keyword_set(MAXMATCH) THEN maxmatch = maxmatch[0] ELSE maxmatch = 10.0                  ;set new value in [arcsec]
  IF keyword_set(FRACCHANGE) THEN fracchange = fracchange[0] ELSE fracchange = 0.05          ;sets new value
  IF keyword_set(MAXITER) THEN maxiter = maxiter[0] ELSE maxiter = 3                         ;sets new value
  IF keyword_set(TAGRA1) THEN tagra1 = tagra1[0] ELSE tagra1 = 'RA'                          ;set new value
  IF keyword_set(TAGDEC1) THEN tagdec1 = tagdec1[0] ELSE tagdec1 = 'DEC'                     ;set new value
  IF keyword_set(TAGRA2) THEN tagra2 = tagra2[0] ELSE tagra2 = 'RA'                          ;set new value
  IF keyword_set(TAGDEC2) THEN tagdec2 = tagdec2[0] ELSE tagdec2 = 'DEC'                     ;set new value
  IF keyword_set(EPSILON) THEN epsilon = epsilon[0] / 3600.0 ELSE epsilon = 3.0 / 3600.0     ;set new value in [arcsec]
  IF keyword_set(ALLOWED) THEN allowed = allowed[0] ELSE allowed = 1                         ;set new value
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'struccombine_radec.fits' ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                         ;set new value

  
  
  ;;;get RA, DEC tags
  indra1 = tagind(xdata1, tagra1, NOTE='Tag for RA in structure 1')    ;find tag index
  inddec1 = tagind(xdata1, tagdec1, NOTE='Tag for DEC in structure 1') ;find tag index
  indra2 = tagind(xdata2, tagra2, NOTE='Tag for RA in structure 2')    ;find tag index
  inddec2 = tagind(xdata2, tagdec2, NOTE='Tag for DEC in structure 2') ;find tag index


  ;;;match by ra, dec
  CASE TMATCH OF                                                                                   ;how to match
     1 : BEGIN                                                                                     ;simple match
        close_match_radec, xdata1.(indra1), xdata1.(inddec1), xdata2.(indra2), xdata2.(inddec2), $ ;cont next line
                           m1, m2, epsilon, allowed, miss1, /SILENT                                ;match 
        print, '  Total number of matches found: ', n_elements(m1)                                 ;print info
     END                                                                                           ;end simple match
     2 : BEGIN                                                                                     ;offset by median and rematch
        close_match_radec, xdata1.(indra1), xdata1.(inddec1), xdata2.(indra2), xdata2.(inddec2), $ ;cont next line
                           m1, m2, epsilon, allowed, miss1, /SILENT                                ;match
        medra = median(xdata1[m1].(indra1) - xdata2[m2].(indra2))                                  ;find median offset in RA
        meddec = median(xdata1[m1].(inddec1) - xdata2[m2].(inddec2))                               ;find median offset in DEC
        xdata2.(indra2) = xdata2.(indra2) - medra                                                  ;subtract median offset in RA
        xdata2.(inddec2) = xdata2.(inddec2) - meddec                                               ;subtract median offset in DEC
        close_match_radec, xdata1.(indra1), xdata1.(inddec1), xdata2.(indra2), xdata2.(inddec2), $ ;cont next line
                           m1, m2, epsilon, allowed, miss1, /SILENT                                ;rematch
        print, '  Total number of matches found: ', n_elements(m1)                                 ;print info
        print, '   Median offset in RA applied [arcsec]: ', 3600.0*medra                           ;print info
        print, '   Median offset in DEC applied [arcsec]: ', 3600.0*meddec                         ;print info
     END                                                                                           ;end offset by median and rematch
     3 : BEGIN                                                                                     ;find best matching radius
        print, 'working on it'
     END                                                                                                       ;end find best matching radius
     4 : BEGIN                                                                                                 ;do both
        radmatch = indgen(fix((maxmatch-minmatch)/stmatch)+1) * stmatch + minmatch                             ;find match radii to test
        degradmatch = radmatch / 3600.0                                                                        ;convert to degrees
        iter = 0                                                                                               ;iteration counter
        WHILE iter LT maxiter DO BEGIN                                                                         ;count iterations
           nmatch = radmatch                                                                                   ;create array to store # matches
           nmatch[*] = 0                                                                                       ;zero array
           perchange = radmatch                                                                                ;create array to store # matches
           perchange[*] = 0                                                                                    ;zero array
           FOR zz=0, n_elements(radmatch)-1, 1 DO BEGIN                                                        ;loop over radii
              epsilon = degradmatch[zz]                                                                        ;set value to pass
              close_match_radec, xdata1.(indra1), xdata1.(inddec1), xdata2.(indra2), xdata2.(inddec2), $       ;cont next line
                                 m1, m2, epsilon, allowed, miss1, /SILENT                                      ;match
              nmatch[zz] = n_elements(m1)                                                                      ;find number of matches
              IF zz GT 1 THEN perchange[zz] = $                                                                ;cont next line
                 float(nmatch[zz]-nmatch[zz-1])/float(nmatch[zz-1]) ELSE perchange[zz] = 1.0                   ;finds % change
           ENDFOR                                                                                              ;end loop over radii
           chk = where(perchange LE fracchange)                                                                ;find radii satisfying condition
           IF (chk[0] NE -1) AND (n_elements(chk) GE 2) THEN BEGIN                                             ;if percent change criteria met
              optrad = radmatch[[chk[1]]]                                                                      ;take second point
           ENDIF ELSE BEGIN                                                                                    ;if not enough criteria met
              print, '  Non-convergent matching radius!!'                                                      ;prints info
              print, '  Setting matching radius to nominal value of 2.0"'                                      ;prints info
              optrad = 2.0                                                                                     ;find optimal radius
           ENDELSE                                                                                             ;updates counter
           degoptrad = (optrad / 3600.0)                                                                       ;optimal radius in degrees
                                ;matchplot = plot(radmatch, nmatch, '*', $                                                           ;plot
                                ;                 TITLE='Number of Matches for Matching Radius', $                                   ;plot options
                                ;                 XTITLE='Match Radius [arcsec]', $                                                  ;plot options
                                ;                 YTITLE='Number of Matches')                                                        ;plot options
           close_match_radec, xdata1.(indra1), xdata1.(inddec1), xdata2.(indra2), xdata2.(inddec2), $ ;cont next line
                              m1, m2, degoptrad[0], allowed, miss1, /SILENT                           ;match
           medra = median(xdata1[m1].(indra1) - xdata2[m2].(indra2))                                  ;find median offset in RA
           meddec = median(xdata1[m1].(inddec1) - xdata2[m2].(inddec2))                               ;find median offset in DEC
           xdata2.(indra2) = xdata2.(indra2) - medra                                                  ;subtract median offset in RA
           xdata2.(inddec2) = xdata2.(inddec2) - meddec                                               ;subtract median offset in DEC
           print, ' Now on iteration: ', iter+1                                                       ;print info
           print, '  Optimal matching radius [arcsec]: ', optrad                                      ;print info
           print, '  Total number of matches found at optimal radius: ', n_elements(m1)               ;print info
           print, '  Median offset in RA applied [arcsec]: ', 3600.0*medra                            ;print info
           print, '  Median offset in DEC applied [arcsec]: ', 3600.0*meddec                          ;print info
           iter++                                                                                     ;up iteration counter
        ENDWHILE
        stop
        close_match_radec, xdata1.(indra1), xdata1.(inddec1), xdata2.(indra2), xdata2.(inddec2), $ ;cont next line
                           m1, m2, epsilon, allowed, miss1, /SILENT                                ;rematch
     END                                                                                           ;end do both
     ELSE : BEGIN                                                                                  ;default choice
        close_match_radec, xdata1.(indra1), xdata1.(inddec1), xdata2.(indra2), xdata2.(inddec2), $ ;cont next line
                           m1, m2, epsilon, allowed, miss1, /SILENT                                ;simply one match
     ENDELSE                                                                                       ;end default choice
  ENDCASE                                                                                          ;end how to match

  IF keyword_set(TWONOTONE) THEN BEGIN                                                       ;if we want misses from cat 2
     flag = intarr(n_elements(xdata2.(indra2)))                                              ;create array
     flag[m2] = 1                                                                            ;set all matches to 1
     chk = where(flag EQ 0)                                                                  ;find all remaining places
     IF chk[0] NE -1 THEN miss2 = chk ELSE miss2 = -1                                        ;set miss2 array
  ENDIF                                                                                      ;end want misses from cat 2
  IF (n_elements(m1) NE n_elements(m2)) THEN print, 'WARNING!!! Something went very wrong!!' ;sanity check
  nm1 = n_elements(m1)                                                                       ;matches in m1 
  nmiss1 = n_elements(miss1)                                                                 ;matches in m1 
  nm2 = n_elements(m2)                                                                       ;matches in m2 
  nmiss2 = n_elements(miss2)                                                                 ;matches in m2 
  nkeep = n_elements(m1)                                                                     ;how many to keep 
  IF keyword_set(ONENOTTWO) THEN nkeep = nkeep + n_elements(miss1)                           ;how many to keep 
  IF keyword_set(TWONOTONE) THEN nkeep = nkeep + n_elements(miss2)                           ;how many to keep 

  ;;;prepare output
  tmp1 = xdata1[0]                                                        ;get sample 
  tmp2 = xdata2[0]                                                        ;get sample
  combine_structs, tmp1, tmp2, newstruc                                   ;combine samples into new structure
  tmpstruc = newstruc                                                     ;copy existing structure
  add_tags, tmpstruc, ['RAONE', 'DECONE'], ['-99.0D', '-99.0D'], newstruc ;add two more tags for single RA, DEC columns
  newstruc = strucreset(newstruc, NULLVAL=-99.0)                          ;set all values to nomominal 
  ntotal =  n_elements(xdata1.(0)) + n_elements(xdata2.(0))               ;# of possible outputs if no matches
  out = replicate(newstruc, ntotal)                                       ;replicate
  

  ;;;fill output
  tags1 = tag_names(xdata1)                                                         ;get tag names
  tags2 = tag_names(xdata2)                                                         ;get tag names
  FOR xx=0, n_elements(tags1)-1, 1 DO BEGIN                                         ;loop over first structure
     note = strcompress('Missing tag: ' + tags1(xx))                                ;find tag in output structure
     tmpind = tagind(out, tags1(xx), NOTE=note)                                     ;find tag index
     FOR yy=0ULL, n_elements(m1)-1, 1 DO BEGIN                                      ;loop over matches in first
        out[yy].(tmpind) = xdata1[m1[yy]].(xx)                                      ;set values in output
        out[yy].raone = mean([xdata1[m1[yy]].(indra1), xdata2[m2[yy]].(indra2)])    ;set values in output
        out[yy].decone = mean([xdata1[m1[yy]].(inddec1), xdata2[m2[yy]].(inddec2)]) ;set values in output
     ENDFOR                                                                         ;end loop over matches in first
  ENDFOR                                                                            ;end loop over first structure
  FOR xx=0, n_elements(tags2)-1, 1 DO BEGIN                                         ;loop over second structure
     note = strcompress('Missing tag: ' + tags2(xx))                                ;find tag in output structure
     tmpind = tagind(out, tags2(xx), NOTE=note)                                     ;find tag index
     FOR yy=0ULL, n_elements(m2)-1, 1 DO BEGIN                                      ;loop over matches in second
        out[yy].(tmpind) = xdata2[m2[yy]].(xx)                                      ;set values in output
     ENDFOR                                                                         ;end loop over matches in second
  ENDFOR                                                                            ;end loop over second structure

  start = nm1                                                        ;where to start for misses from 1
  IF keyword_set(ONENOTTWO) THEN BEGIN                               ;if we want misses from catalog 1
     FOR xx=0, n_elements(tags1)-1, 1 DO BEGIN                       ;loop over first structure
        note = strcompress('Missing tag: ' + tags1(xx))              ;find tag in output structure
        tmpind = tagind(out, tags1(xx), NOTE=note)                   ;find tag index
        FOR yy=0ULL, n_elements(miss1)-1, 1 DO BEGIN                 ;loop over matches in first
           out[start+yy].(tmpind) = xdata1[miss1[yy]].(xx)           ;set values in output
           out[start+yy].raone = xdata1[miss1[yy]].(indra1)          ;set RAONE value
           out[start+yy].decone = xdata1[miss1[yy]].(inddec1)        ;set DECONE value
        ENDFOR                                                       ;end loop over first structure
     ENDFOR                                                          ;end loop over matches in first
  ENDIF                                                              ;end misses from catalog 1
  IF keyword_set(ONENOTTWO) THEN start = nm2+nmiss1 ELSE start = nm2 ;where to start for misses from 2
  IF keyword_set(TWONOTONE) THEN BEGIN                               ;if we want misses from catalog 1
     FOR xx=0, n_elements(tags2)-1, 1 DO BEGIN                       ;loop over first structure
        note = strcompress('Missing tag: ' + tags2(xx))              ;find tag in output structure
        tmpind = tagind(out, tags2(xx), NOTE=note)                   ;find tag index
        FOR yy=0ULL, nmiss2-1, 1 DO BEGIN                            ;loop over matches in first
           out[start+yy].(tmpind) = xdata2[miss2[yy]].(xx)           ;set values in output
           out[start+yy].raone = xdata2[miss2[yy]].(indra2)          ;set values in output
           out[start+yy].decone = xdata2[miss2[yy]].(inddec2)        ;set values in output
        ENDFOR                                                       ;end loop over first structure
     ENDFOR                                                          ;end loop over matches in first
  ENDIF                                                              ;end misses from catalog 1


  ;;;clean and write out file
  out = out[0:nkeep-1]           ;remove unused rows
  mwrfits, out, outfile, /CREATE ;write file


END
;========================================================================================================================



;========================================================================================================================
PRO call_struccombine_radec


  file1 = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/tracy/J1049_photoz_eazy_v2-2.fits'
  data1 = mrdfits(file1, 1, hdr)
  tagra1 = 'RA'
  tagdec1 = 'DEC'
  file2 = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/spectroscopic/J1049_specz_mosfire_v3-0.fits'
  data2 = mrdfits(file2, 1, hdr)
  tagra2 = 'RA'
  tagdec2 = 'DEC'
  outfile = 'J1049_specz_photoz_eazy_v2-0.fits'


  new = struccombine_radec(data1, data2, TAGRA1=tagra1, TAGDEC1=tagdec1, TAGRA2=tagra2, TAGDEC2=tagdec2, $
                           /ONENOTTWO, /TWONOTONE, TMATCH=1, OUTFILE=outfile)



END
;========================================================================================================================
