;+
; NAME:
;       MASTER_RADEC()
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
;        
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2015 NOV 6, Univ. Cali, Riverside v0-1-0
;          -INCEPTION
;
; DESIRED UPGRADES
;
;       -looking ahead what happens if we need to match to the list
;       more than once???
;       -add in strlowcase to prevent case errors from killing
;       positive tag matches
;       -something weird happens if you do this twice with a big and
;       then small search radius
; 
;
;-

;====================================================================================================
PRO MASTER_RADEC::getprop, OBJVER=objver

  IF arg_present(OBJVER) THEN objver = self.mrdobjver ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO MASTER_RADEC::boxscore

  
  print, ' RA, Dec stats for the master list'
  boxscore, *self.mra
  boxscore, *self.mdec
  
  print, ' RA, Dec stats for the first matching list'
  boxscore, *self.ra1
  boxscore, *self.dec1
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION MASTER_RADEC::sanitycheck

  passfail = 1

  ;;;equal numbers of coordinates
  passfail = n_elements(*self.mra) EQ n_elements(*self.mdec)                         ;
  passfail = n_elements(*self.ra1) EQ n_elements(*self.dec1)                         ;
  print, ' Total number of elements in master RA, Dec list: ', n_elements(*self.mra) ;
  
  ;;;overlapping areas of interest
  chk = where((*self.ra1 GE min(*self.mra)) AND (*self.ra1 LE max(*self.mra)))     ;
  IF chk[0] EQ -1 THEN passfail = 0                                                ;
  chk = where((*self.dec1 GE min(*self.mdec)) AND (*self.dec1 LE max(*self.mdec))) ;
  IF chk[0] EQ -1 THEN passfail = 0                                                ;

  ;;;viable search ranges
  chk = (self.minsear LT self.maxsear) 
  passfail = passfail * chk
  chk = (self.stepsear LT (self.maxsear-self.minsear))
  passfail = passfail * chk

  RETURN, passfail
END
;====================================================================================================


;====================================================================================================
PRO MASTER_RADEC::startstruc


  ;;;grab base and replicate
  basestr = *self.basestr
  outstr = replicate(basestr, n_elements(*self.mra))

  ;;;fill in known info
  outstr.mra = *self.mra                              ;grab data
  outstr.mdec = *self.mdec                            ;grab data
  inds = ulindgen(n_elements(*self.mra)) + 1          ;unique id
  outstr.mid = string(double(inds), FORMAT='(D10.1)') ;unique id modified
  self.outstr = ptr_new(outstr)                       ;resave data to pointer
  

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO MASTER_RADEC::addtags, xtags, xvals, EXCEPT=except, MATCH=match, MASTER=master


  IF keyword_set(EXCEPT) THEN except = string(except) ELSE except = [''] ;set default
  prefix = ''                                                            ;default
  IF keyword_set(MATCH) THEN prefix = self.pre1                          ;set default
  IF keyword_set(MASTER) THEN prefix = self.prem                         ;set default
  

  outstr = *self.outstr         ;grab data from pointer
  xvals = strucreset(xvals)     ;reset all values added
  
  FOR xx=0UL, n_elements(xtags)-1, 1 DO BEGIN ;loop over new tags to add
     chk = where(xtags[xx] EQ except)         ;check against except list
     
     IF chk[0] EQ -1 THEN BEGIN                               ;if no found in exempt list
        thisind = tagind(xvals, xtags[xx])                    ;add tag
        newtag = strcompress(prefix + xtags[xx], /REMOVE_ALL) ;modify tag
        add_tag, outstr, newtag, xvals[0].(thisind), newstr   ;add to structure
        outstr = 0                                            ;reset variable
        outstr = newstr                                       ;recapture new structure
        newstr = 0                                            ;reset variable
     ENDIF                                                    ;end if not found in exempt list
  ENDFOR
  
  tmptags = tag_names(outstr)         ;get final structure tag names
  self.tagnames = ptr_new(tmptags)    ;save to pointer
  self.outstr = ptr_new(outstr)       ;resave to the pointer
  self.cleanmid = ptr_new(outstr.mid) ;save the id
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION MASTER_RADEC::fillout, xoutentry, xinind, MASTER=master
  

  IF keyword_set(MASTER) THEN BEGIN ;if from master
     usethis = *self.fullm          ;get appropriate data
     usepre = self.prem             ;set appropriate prefix
  ENDIF ELSE BEGIN                  ;end if from master
     usethis = *self.full1          ;get appropriate data
     usepre = self.pre1             ;set appropriate prefix
  ENDELSE                           ;end if from match
  tmptags = *self.tagnames          ;get tag names
  

  ;;;fill in data 
  FOR ww=0, n_elements(tmptags)-1, 1 DO BEGIN                                                  ;loop over tag
     fulltag = tmptags[ww]                                                                     ;get the current tag
     strreplace, fulltag, usepre, ''                                                           ;remove the prefix
     fulltag = strcompress(fulltag, /REMOVE_ALL)                                               ;ensure no whitespace
     fullind = tagind(usethis, fulltag, /PASS, VERBOSE=1)                                      ;find the tag location
     outind = tagind(xoutentry, tmptags[ww])                                                   ;find tag in out structure
                                ;print, (fullind NE -1) AND (outind NE -1)
     IF (fullind NE -1) AND (outind NE -1) THEN xoutentry.(outind) = usethis[xinind].(fullind) ;if tags found in both
  ENDFOR                                                                                       ;end loop over tags

  
  RETURN, xoutentry
END
;====================================================================================================


;====================================================================================================
PRO MASTER_RADEC::copyout


  outstr = *self.outstr         ;grab data
  usethis = *self.fullm         ;grab data

  IF n_elements(outstr.(0)) NE n_elements(usethis.(0)) THEN BEGIN ;sanity check for 1-1 correspondance
     print, 'WARNING!! Something has gone horribly wrong!!'       ;print info
     stop                                                         ;stop run
  ENDIF                                                           ;end sanity check

  FOR xx=0UL, n_elements(usethis.(0))-1, 1 DO BEGIN ;loop over input entries
     tmpout = self.fillout(outstr[xx], xx, /MASTER) ;grab filled in entry
     outstr[xx] = tmpout                            ;save the entry
  ENDFOR                                            ;end loop over input entries

  self.outstr = ptr_new(outstr) ;resave the object

END
;====================================================================================================


;====================================================================================================
FUNCTION MASTER_RADEC::matches, MAXSEAR=maxsear, NOMID=NOMID, $
                                VERBOSE=verbose
  
  COMPILE_OPT IDL2, HIDDEN

  IF keyword_set(MAXSEAR) THEN maxsear = float(maxsear[0]) ELSE maxsear = self.maxsear ;set default
  IF keyword_set(VERBOSE) THEN verbose = fix(verbose[0]) ELSE verbose = self.verbose   ;set default
  

  
  ;;;build up work
  dmaxsear = maxsear / 3600.0   ;convert to degrees
  
  ;;;grab data
  outstr = *self.outstr         ;grab data
  mra = *self.mra               ;grab data
  mdec = *self.mdec             ;
  data1 = *self.full1           ;
  ra1 = *self.ra1               ;
  dec1 = *self.dec1             ;

  ;;;for extra matches
  extraout = outstr[0]            ;grab entry
  extraout = strucreset(extraout) ;reset all values added

  ;;;for failed matches
  failedout = outstr[0]             ;grab entry
  failedout = strucreset(failedout) ;reset all values added
  matched = intarr(n_elements(ra1)) ;flag array

  ;;;subset data
  cleanmid = *self.cleanmid      ;
  
  ;;;loop over that data
  cnt = ulonarr(5,5)               ;
  flg = [ [-64, -1, -2, -3, -4], $ ;cont next line
          [-64, 0, 9, 17, 33], $   ;cont next line
          [-64, 8, 1, 65, 129], $  ;cont next line
          [-64, 16, 64, 2, 131], $ ;cont next line
          [-64, 32, 128, 130, 3] ] ;flag values array 
  
  ;;;loop over list
  FOR zz=0UL, n_elements(*self.mra)-1, 1 DO BEGIN              ;loop over master list
     gcirc, 2, mra[zz], mdec[zz], mra, mdec, dist              ;distance to all points from current master
     chk = where(dist LT maxsear, nchk)                        ;points within search distance
     gcirc, 2, mra[zz], mdec[zz], mra[chk], mdec[chk], subdist ;distance to subset points from current master
     sorted = bsort(subdist)                                   ;order points within search distance
     
     gcirc, 2, mra[zz], mdec[zz], ra1, dec1, dist2                ;distance to all points from current match
     chk2 = where(dist2 LT maxsear, nchk2)                        ;points within search distance
     gcirc, 2, mra[zz], mdec[zz], ra1[chk2], dec1[chk2], subdist2 ;distance to subset points from current match
     sorted2 = bsort(subdist2)                                    ;order points within search distance
     IF (chk2[0] NE -1) THEN matched[chk2] = 1                    ;flag the matched

     ;;;how the matches turned out
     CASE nchk OF                                                                            ;how many master list points
        0 : BEGIN                                                                            ;no points
           IF verbose GE 1 THEN print, '   This should never happen!!!'                      ;print info
           IF verbose GE 1 THEN print, '    The master list should always match to itself!!' ;print info
           cnt[0,0] = cnt[0,0] + 1                                                           ;up count
           outstr[zz].mflag = flg[0,0]                                                       ;flag it
        END
        
        1 : BEGIN                                                                                   ;only one master entry
           CASE nchk2 OF                                                                            ;how many matching entries
              0 : BEGIN                                                                             ;no match entry
                 IF verbose GE 2 THEN print, '   Nothing in matching catalog. Empty space it is...' ;print info
                 cnt[1,0] = cnt[1,0] + 1                                                            ;up counter                 
                 outstr[zz].mflag = flg[1,0]                                                        ;flag it
              END                                                                                   ;end no match entry 

              1 : BEGIN                                                                            ;one match entry
                 IF verbose GE 2 THEN print, '   One entry in matching catalog. YES! 1-1 match...' ;print info
                 cnt[1,1] = cnt[1,1] + 1                                                           ;up counter
                 outstr[zz].mflag = flg[1,1]                                                       ;flag it
                 tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[0]])                   ;fill in values
                 outstr[chk[sorted[0]]] = tmpout                                                   ;store entry
              END                                                                                  ;end 1-1 match

              2: BEGIN                                                                                               ;two match entry
                 IF verbose GE 2 THEN print, '   Two entries in matching catalog. Perhaps okay'                      ;print info
                 IF verbose GE 3 THEN print, '    Likely drastically different passband or drastically deeper image' ;print info
                 cnt[1,2] = cnt[1,2] + 1                                                                             ;up counter
                 outstr[zz].mflag = flg[1,2]                                                                         ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                            ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                                 ;fill in values
                    tmpmid = string(float(cleanmid[chk]) + 0.1*xx, FORMAT='(D10.1)')                                 ;modify id    
                    tmpout.mid = tmpmid                                                                              ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]             ;store info
                 ENDFOR                                                                                              ;end loop over matches
              END                                                                                                    ;end two match entry

              3: BEGIN                                                                                   ;three match entries
                 IF verbose GE 2 THEN print, '   Three entries in matching catalog. Kinda bad.'          ;print info
                 cnt[1,3] = cnt[1,3] + 1                                                                 ;up counter
                 outstr[zz].mflag = flg[1,3]                                                             ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                ;loop over matches
                    tmpmid = string(float(cleanmid[chk]) + 0.1*xx, FORMAT='(D10.1)')                     ;modify id    
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                     ;fill in values
                    tmpout.mid = tmpmid                                                                  ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout] ;store info
                 ENDFOR                                                                                  ;end loop over matches
              END                                                                                        ;end three match entries

              ELSE : BEGIN                                                                                   ;more than three match entries
                 IF verbose GE 2 THEN print, '   More than three entries in matching catalog. For sure bad.' ;print info
                 cnt[1,4] = cnt[1,4] + 1                                                                     ;up counter
                 outstr[zz].mflag = flg[1,4]                                                                 ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                    ;loop over matches
                    tmpmid = string(float(cleanmid[chk]) + 0.1*xx, FORMAT='(D10.1)')                         ;modify id    
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                         ;fill in values
                    tmpout.mid = tmpmid                                                                      ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]     ;store info
                 ENDFOR                                                                                      ;end loop over matches
              ENDELSE                                                                                        ;end more than three match entries
           ENDCASE                                                                                           ;end only one master in radius
        END                                                                                                  ;end only one match
        

        2 : BEGIN                                                                                           ;two master entries
           CASE nchk2 OF                                                                                    ;how many matching entries
              0 : BEGIN                                                                                     ;no match entry
                 IF verbose GE 2 THEN print, '   Nothing in matching catalog but one other in master.'      ;print info
                 cnt[2,0] = cnt[2,0] + 1                                                                    ;up counter
                 outstr[zz].mflag = flg[2,0]                                                                ;flag it
                 outstr[chk[sorted[0]]].mid = strcompress(strjoin(cleanmid[chk[sorted]], '*'), /REMOVE_ALL) ;modified id
              END                                                                                           ;end no match entry 

              1 : BEGIN                                                                                                              ;one match entry
                 IF verbose GE 2 THEN print, '   One entry in matching catalog and nearby master catalog entry. Caution!!'           ;print info
                 IF verbose GE 3 THEN print, '    2-1 match here, Likely drastically better resolution or drastically deeper image.' ;print info
                 cnt[2,1] = cnt[2,1] + 1                                                                                             ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[2,1]                                                                             ;flag it
                 tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[0]])                                                     ;fill in values
                 tmpmid = strcompress(strjoin(cleanmid[chk[sorted]], '*'), /REMOVE_ALL)                                              ;modified id
                 tmpout.mid = tmpmid                                                                                                 ;store modified id
                 outstr[chk[sorted[0]]] = tmpout                                                                                     ;store entry
              END                                                                                                                    ;end 2-1 match

              2: BEGIN                                                                                        ;two match entry
                 IF verbose GE 2 THEN print, '   Two entries in matching catalog plus a nearby master entry.' ;print info
                 IF verbose GE 3 THEN print, '    Probably just two close objects resolved in both catalogs'  ;print info
                 cnt[2,2] = cnt[2,2] + 1                                                                      ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[2,2]                                                      ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                     ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                          ;fill in values
                    tmpmid = string(float(cleanmid[chk[sorted[0]]]) + 0.1*xx, FORMAT='(D10.1)')               ;modify id    
                    tmpmid =  strcompress(strjoin([tmpmid,cleanmid[chk[sorted[1:-1]]]], '*'), /REMOVE_ALL)    ;modify id further
                    tmpout.mid = tmpmid                                                                       ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]      ;store info
                 ENDFOR                                                                                       ;end loop over matches
              END                                                                                             ;end two match entry

              3: BEGIN                                                                                          ;three match entries
                 IF verbose GE 2 THEN print, '   Three entries in matching catalog plus a nearby master entry.' ;print info
                 IF verbose GE 3 THEN print, '    Things are getting pretty crowded'                            ;print info
                 cnt[2,3] = cnt[2,3] + 1                                                                        ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[2,3]                                                        ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                       ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                            ;fill in values
                    tmpmid = string(float(cleanmid[chk[sorted[0]]]) + 0.1*xx, FORMAT='(D10.1)')                 ;modify id    
                    tmpmid =  strcompress(strjoin([tmpmid,cleanmid[chk[sorted[1:-1]]]], '*'), /REMOVE_ALL)      ;modify id further
                    tmpout.mid = tmpmid                                                                         ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]        ;store info
                 ENDFOR                                                                                         ;end loop over matches
              END                                                                                               ;end three match entries

              ELSE : BEGIN                                                                                                 ;more than three match entries
                 IF verbose GE 2 THEN  print, '   More than three entries in matching catalog plus a nearby master entry.' ;print info
                 IF verbose GE 3 THEN print, '    Things are very crowded now'                                             ;print info
                 cnt[2,4] = cnt[2,4] + 1                                                                                   ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[2,4]                                                                   ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                                  ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                                       ;fill in values
                    tmpmid = string(float(cleanmid[chk[sorted[0]]]) + 0.1*xx, FORMAT='(D10.1)')                            ;modify id    
                    tmpmid =  strcompress(strjoin([tmpmid,cleanmid[chk[sorted[1:-1]]]], '*'), /REMOVE_ALL)                 ;modify id further
                    tmpout.mid = tmpmid                                                                                    ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]                   ;store info
                 ENDFOR                                                                                                    ;end loop over matches
              ENDELSE                                                                                                      ;end more than three match entries
           ENDCASE
        END                     ;end two master entries

        3 : BEGIN                                                                                           ;three master entries 
           CASE nchk2 OF                                                                                    ;how many matching entries
              0 : BEGIN                                                                                     ;no match entry
                 IF verbose GE 2 THEN print, '   Nothing in matching catalog but two others in master.'     ;print info
                 cnt[3,0] = cnt[3,0] + 1                                                                    ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[3,0]                                                    ;flag it
                 outstr[chk[sorted[0]]].mid = strcompress(strjoin(cleanmid[chk[sorted]], '*'), /REMOVE_ALL) ;modified id
              END                                                                                           ;end no match entry 

              1 : BEGIN                                                                                                     ;one match entry
                 IF verbose GE 2 THEN print, '   One entry in matching catalog and one other in master. Huge blend likely.' ;print info
                 IF verbose GE 3 THEN print, '    Likely drastically better resolution or drastically deeper image.'        ;print info
                 cnt[3,1] = cnt[3,1] + 1                                                                                    ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[3,1]                                                                    ;flag it
                 tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[0]])                                            ;fill in values
                 tmpmid = strcompress(strjoin(cleanmid[chk[sorted]], '*'), /REMOVE_ALL)                                     ;modified id
                 tmpout.mid = tmpmid                                                                                        ;store modified id
                 outstr[chk[sorted[0]]] = tmpout                                                                            ;store entry
              END                                                                                                           ;end 1-1 match

              2: BEGIN                                                                                                                ;two match entry
                 IF verbose GE 2 THEN print, '   Two entries in matching catalog and two others in master. Some blend highly likely.' ;print info
                 IF verbose GE 3 THEN print, '    Likely drastically better resolution or drastically deeper image.'                  ;print info
                 cnt[3,2] = cnt[3,2] + 1                                                                                              ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[3,2]                                                                              ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                                             ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                                                  ;fill in values
                    tmpmid = string(float(cleanmid[chk[sorted[0]]]) + 0.1*xx, FORMAT='(D10.1)')                                       ;modify id    
                    tmpmid =  strcompress(strjoin([tmpmid,cleanmid[chk[sorted[1:-1]]]], '*'), /REMOVE_ALL)                            ;modify id further
                    tmpout.mid = tmpmid                                                                                               ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]                              ;store info
                 ENDFOR                                                                                                               ;end loop over matches
              END                                                                                                                     ;end two match entry

              3: BEGIN                                                                                                ;three match entries
                 IF verbose GE 2 THEN print, '   Three entries in matching catalog and two others in master. '        ;print info
                 IF verbose GE 3 THEN print, '    Maybe not a blend but most likely unless matching radius is large.' ;print info
                 cnt[3,3] = cnt[3,3] + 1                                                                              ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[3,3]                                                              ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                             ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                                  ;fill in values
                    tmpmid = string(float(cleanmid[chk[sorted[0]]]) + 0.1*xx, FORMAT='(D10.1)')                       ;modify id    
                    tmpmid =  strcompress(strjoin([tmpmid,cleanmid[chk[sorted[1:-1]]]], '*'), /REMOVE_ALL)            ;modify id further
                    tmpout.mid = tmpmid                                                                               ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]              ;store info
                 ENDFOR                                                                                               ;end loop over matches
              END                                                                                                     ;end three match entries

              ELSE : BEGIN                                                                                               ;more than three match entries
                 IF verbose GE 2 THEN print, '   More than three entries in matching catalog and two others in master. ' ;print info
                 IF verbose GE 3 THEN print, '    Highly chaotic regions.'                                               ;print info
                 cnt[3,4] = cnt[3,4] + 1                                                                                 ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[3,4]                                                                 ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                                ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                                     ;fill in values
                    tmpmid = string(float(cleanmid[chk[sorted[0]]]) + 0.1*xx, FORMAT='(D10.1)')                          ;modify id    
                    tmpmid =  strcompress(strjoin([tmpmid,cleanmid[chk[sorted[1:-1]]]], '*'), /REMOVE_ALL)               ;modify id further
                    tmpout.mid = tmpmid                                                                                  ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]                 ;store info
                 ENDFOR                                                                                                  ;end loop over matches
              ENDELSE                                                                                                    ;end more than three match entries
           ENDCASE                                                                                                       ;end number of matching entries
        END                                                                                                              ;end three master entries
        
        ELSE : BEGIN                                                                                                ;more than three master entries
           CASE nchk2 OF                                                                                            ;how many matching entries
              0 : BEGIN                                                                                             ;no match entry
                 IF verbose GE 2 THEN print, '   Nothing in matching catalog but more than three others in master.' ;print info
                 cnt[4,0] = cnt[4,0] + 1                                                                            ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[4,0]                                                            ;flag it
                 outstr[chk[sorted[0]]].mid = strcompress(strjoin(cleanmid[chk[sorted]], '*'), /REMOVE_ALL)         ;modified id
              END                                                                                                   ;end no match entry 

              1 : BEGIN                                                                                               ;one match entry
                 IF verbose GE 2 THEN print, '   One entry in matching catalog but more than three others in master.' ;print info
                 IF verbose GE 3 THEN print, '    Caution! Caution!'                                                  ;print info
                 cnt[4,1] = cnt[4,1] + 1                                                                              ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[4,1]                                                              ;flag it
                 tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[0]])                                      ;fill in values
                 tmpmid = strcompress(strjoin(cleanmid[chk[sorted]], '*'), /REMOVE_ALL)                               ;modified id
                 tmpout.mid = tmpmid                                                                                  ;store modified id
                 outstr[chk[sorted[0]]] = tmpout                                                                      ;store entry
              END                                                                                                     ;end 1-1 match

              2: BEGIN                                                                                                  ;two match entry
                 IF verbose GE 2 THEN print, '   Two entries in matching catalog but more than three others in master.' ;print info
                 IF verbose GE 3 THEN print, '    Caution! Caution! Caution!'                                           ;print info
                 cnt[4,2] = cnt[4,2] + 1                                                                                ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[4,2]                                                                ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                               ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                                    ;fill in values
                    tmpmid = string(float(cleanmid[chk[sorted[0]]]) + 0.1*xx, FORMAT='(D10.1)')                         ;modify id    
                    tmpmid =  strcompress(strjoin([tmpmid,cleanmid[chk[sorted[1:-1]]]], '*'), /REMOVE_ALL)              ;modify id further
                    tmpout.mid = tmpmid                                                                                 ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]                ;store info
                 ENDFOR                                                                                                 ;end loop over matches
              END                                                                                                       ;end two match entry

              3: BEGIN                                                                                                    ;three match entries
                 IF verbose GE 2 THEN print, '   Three entries in matching catalog but more than three others in master.' ;print info
                 IF verbose GE 3 THEN print, '    Caution! Caution! Caution! Caution!'                                    ;print info
                 cnt[4,3] = cnt[4,3] + 1                                                                                  ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[4,3]                                                                  ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                                 ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                                      ;fill in values
                    tmpmid = string(float(cleanmid[chk[sorted[0]]]) + 0.1*xx, FORMAT='(D10.1)')                           ;modify id    
                    tmpmid =  strcompress(strjoin([tmpmid,cleanmid[chk[sorted[1:-1]]]], '*'), /REMOVE_ALL)                ;modify id further
                    tmpout.mid = tmpmid                                                                                   ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]                  ;store info
                 ENDFOR                                                                                                   ;end loop over matches
              END                                                                                                         ;end three match entries

              ELSE : BEGIN                                                                                                          ;more than three match entries
                 IF verbose GE 2 THEN print, '   More than three entries in matching catalog but more than three others in master.' ;print info
                 IF verbose GE 3 THEN print, '    Hippos unless a large matching radius'                                            ;print info
                 cnt[4,4] = cnt[4,4] + 1                                                                                            ;up counter
                 outstr[chk[sorted[0]]].mflag = flg[4,4]                                                                            ;flag it
                 FOR xx=0, n_elements(chk2)-1, 1 DO BEGIN                                                                           ;loop over matches
                    tmpout = self.fillout(outstr[chk[sorted[0]]], chk2[sorted2[xx]])                                                ;fill in values
                    tmpmid = string(float(cleanmid[chk[sorted[0]]]) + 0.1*xx, FORMAT='(D10.1)')                                     ;modify id    
                    tmpmid =  strcompress(strjoin([tmpmid,cleanmid[chk[sorted[1:-1]]]], '*'), /REMOVE_ALL)                          ;modify id further
                    tmpout.mid = tmpmid                                                                                             ;store the modified id
                    IF (xx EQ 0) THEN outstr[chk[sorted[0]]] = tmpout ELSE extraout = [extraout, tmpout]                            ;store info
                 ENDFOR                                                                                                             ;end loop over matches
              ENDELSE                                                                                                               ;end more than three match entries
           ENDCASE                                                                                                                  ;end number of matching entries
        ENDELSE                                                                                                                     ;end more than three matches
     ENDCASE
     
  ENDFOR                        ;end loop over master list

  
  ;;;clean up
  extraout = extraout[1:-1]                                        ;remove first entry of extra array
  chk = where(matched EQ 0, nchk)                                  ;any not matched
  IF (chk[0] NE -1) THEN BEGIN                                     ;if some not matched
     FOR xx=0UL, nchk-1, 1 DO BEGIN                                ;loop not matched
        tmpout = self.fillout(failedout[0], chk[xx])               ;fill in values
        tmpout.mid = string(float(-1.0*xx), FORMAT='(D10.1)')      ;modify id
        tmpout.mflag = -9                                          ;modify flag
        failedout = [failedout, tmpout]                            ;add the entry
     ENDFOR                                                        ;end loop not matched
  ENDIF                                                            ;end some not matched
  IF (n_elements(failedout) GT 1) THEN failedout = failedout[1:-1] ;remove first entry of failed array

  ;;;print info
  print, ' Array of entries from master catalog by number of entries from matching catalog ' ;print info
  print, cnt                                                                                 ;print count array
  
  ;;;save to pointers
  self.outstr = ptr_new(outstr)     ;save to the pointer
  self.eoutstr = ptr_new(extraout)  ;save to pointer
  self.foutstr = ptr_new(failedout) ;save to pointer
  

  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO MASTER_RADEC::adjust, xadjust, INCLUDE=include, SHOWPLOT=showplot, $
                          TGRAONE=tgraone, TGDECONE=tgdecone


  ;;;default values
  IF keyword_set(INCLUDE) THEN include = fix(include) ELSE include = 0                   ;set default
  IF keyword_set(TGRAONE) THEN tgraone = string(tgraone[0]) ELSE tgraone = 'rabest'      ;set default
  IF keyword_set(TGDECONE) THEN tgdecone = string(tgdecone[0]) ELSE tgdecone = 'decbest' ;set default

  ;;;prep work
  xadjust = strlowcase(xadjust) ;make sure its lower case
  mra = *self.mra               ;grab data
  mdec = *self.mdec             ;grab data
  ra1 = *self.ra1               ;grab data
  dec1 = *self.dec1             ;grab data

  outstr = *self.outstr                       ;grab data
  add_tag, outstr, 'adjustra', -99.0, newstr  ;add to structure for adjusted RA
  outstr = 0                                  ;reset variable
  outstr = newstr                             ;recapture new structure
  newstr = 0                                  ;reset variable
  add_tag, outstr, 'adjustdec', -99.0, newstr ;add to structure for adjusted DEC 
  outstr = 0                                  ;reset variable
  outstr = newstr                             ;recapture new structure
  newstr = 0                                  ;reset variable

  eoutstr = *self.eoutstr                      ;grab data
  add_tag, eoutstr, 'adjustra', -99.0, newstr  ;add to structure for adjusted RA
  eoutstr = 0                                  ;reset variable
  eoutstr = newstr                             ;recapture new structure
  newstr = 0                                   ;reset variable
  add_tag, eoutstr, 'adjustdec', -99.0, newstr ;add to structure for adjusted DEC 
  eoutstr = 0                                  ;reset variable
  eoutstr = newstr                             ;recapture new structure
  newstr = 0                                   ;reset variable

  foutstr = *self.foutstr                      ;grab data
  add_tag, foutstr, 'adjustra', -99.0, newstr  ;add to structure for adjusted RA
  foutstr = 0                                  ;reset variable
  foutstr = newstr                             ;recapture new structure
  newstr = 0                                   ;reset variable
  add_tag, foutstr, 'adjustdec', -99.0, newstr ;add to structure for adjusted DEC 
  foutstr = 0                                  ;reset variable
  foutstr = newstr                             ;recapture new structure
  newstr = 0                                   ;reset variable


  FOR xx=0, n_elements(include)-1, 1 DO BEGIN           ;loop over include flag values
     tchk = where(outstr.mflag EQ include)              ;get usable values
     IF (xx EQ 0) THEN chk = tchk ELSE chk = [chk,tchk] ;build the array
  ENDFOR                                                ;end loop include values

  
  ;;;first steps
  tgchk = tag_exist(outstr, tgraone, INDEX=indraone)   ;find tag index
  tgchk = tag_exist(outstr, tgdecone, INDEX=inddecone) ;find tag index
  gmra = outstr[chk].mra                               ;good subset
  gmdec = outstr[chk].mdec                             ;good subset
  gra1 = outstr[chk].(indraone)                        ;good subset
  gdec1 = outstr[chk].(inddecone)                      ;good subset
  

  ;;;do the adjustment
  simple = strmatch(xadjust, '*simple*', /FOLD_CASE) ;is it a simple move
  CASE simple OF                                     ;simple adjustment type 
     1 : BEGIN
        
        diffras = gmra - gra1    ;offset in ra
        diffdecs = gmdec - gdec1 ;offset in dec
        CASE xadjust OF          ;what is the adjustment type

           'simplemean' : BEGIN        ;if we just want a simple mean
              movera = mean(diffras)   ;move by 
              movedec = mean(diffdecs) ;move by
           END                         ;end just want a simple mean
           
           'simplebiweight' : BEGIN                 ;if we just want a simple mean
              mybi = obj_new('beers1990', diffras)  ;new object 
              movera = mybi.biweight(NITERS=3)      ;find how much to move ra
              obj_destroy, mybi                     ;destory object
              mybi = obj_new('beers1990', diffdecs) ;new object 
              movedec = mybi.biweight(NITERS=3)     ;find how much to move dec
              obj_destroy, mybi                     ;destory object
           END                                      ;end just want a simple mean

           ELSE : BEGIN                                                              ;if adjustment type not found
              print, 'WARNING!! Adjustment type not valid!! Please supply another!!' ;print info
              print, '  Choices are "simplemean", "simplebiweight":(untested)'       ;print info
           ENDELSE                                                                   ;end adjustment type not found
        ENDCASE                                                                      ;end what adjustment type
        
        print, 'Move RA by [arcsec]: ', movera*3600.0   ;print info
        print, 'Move Dec by [arcsec]: ', movedec*3600.0 ;print info
        
        outstr.adjustra = outstr.(indraone) + movera      ;store in output
        outstr.adjustdec = outstr.(inddecone) + movedec   ;store in output
        eoutstr.adjustra = eoutstr.(indraone) + movera    ;store in output
        eoutstr.adjustdec = eoutstr.(inddecone) + movedec ;store in output
        foutstr.adjustra = foutstr.(indraone) + movera    ;store in output
        foutstr.adjustdec = foutstr.(inddecone) + movedec ;store in output
        self.ra1 = ptr_new(*self.ra1 + movera)            ;save the move
        self.dec1 = ptr_new(*self.dec1 + movedec)         ;save the move

        IF keyword_set(SHOWPLOT) THEN BEGIN                                    ;if plots demonstrating adjustment are desire
           mywin = window(LOCATION=[100,100], DIMENSIONS=[800,400])            ;window
           pdfra = histogram(diffras*3600.0, LOCATIONS=rabins, BINSIZE=0.1)    ;bin it up
           myplot1 = plot(rabins, pdfra, COLOR='black', /STAIRSTEP, $          ;plot dec hist
                          XTITLE='RA Offset [arcsec]', $                       ;plot options
                          YTITLE='Frequency', $                                ;plot options
                          /CURRENT, LAYOUT=[1,2,1])                            ;plot options
           pdfdec = histogram(diffdecs*3600.0, LOCATIONS=decbins, BINSIZE=0.1) ;bin it up
           myplot1 = plot(decbins, pdfdec, COLOR='black', /STAIRSTEP, $        ;plot dec hist
                          XTITLE='DEC Offset [arcsec]', $                      ;plot options
                          YTITLE='Frequency', $                                ;plot options
                          /CURRENT, LAYOUT=[1,2,2])                            ;plot options
        ENDIF                                                                  ;end plots desired
     END                                                                       ;end yes to simple

     0 : BEGIN                  ;no to simple
     END                        ;end no to simple

     ELSE : BEGIN
     ENDELSE
  ENDCASE                       ;end simple adjustment type


  self.outstr = ptr_new(outstr)   ;resave the output
  self.eoutstr = ptr_new(eoutstr) ;resave the output
  self.foutstr = ptr_new(foutstr) ;resave the output


  RETURN
END
;====================================================================================================



;====================================================================================================
PRO MASTER_RADEC::write, FILENAME=filename, EXTRA=extra, FAILED=failed, ALL=all

  IF keyword_set(FILENAME) THEN filename = string(filename[0]) ELSE filename  = 'testing.fits' ;set default

  ;;;write out file
  outstr = *self.outstr              ;grab data
  mwrfits, outstr, filename, /CREATE ;write file

  ;;;write out extra if desired
  IF keyword_set(EXTRA) THEN BEGIN                    ;if we want the extras saved
     IF (self.eoutstr NE !NULL) THEN BEGIN            ;check for null pointer
        extraout = *self.eoutstr                      ;grab data
        efilename = filename                          ;copy filename
        strreplace, efilename, '.fits', '_extra.fits' ;modify filename
        mwrfits, extraout, efilename, /CREATE         ;write file
     ENDIF                                            ;end check null pointer
  ENDIF                                               ;end want extras saved
  
  ;;;write out failed if desired
  IF keyword_set(FAILED) THEN BEGIN                    ;if we want the faileds saved
     IF (self.foutstr NE !NULL) THEN BEGIN             ;check for null pointer
        failedout = *self.foutstr                      ;grab data
        ffilename = filename                           ;copy filename
        strreplace, ffilename, '.fits', '_failed.fits' ;modify filename
        mwrfits, failedout, ffilename, /CREATE         ;write file
     ENDIF                                             ;end check null pointer
  ENDIF                                                ;end want faileds saved

  ;;;write out all three together if desired
  IF keyword_set(ALL) THEN BEGIN                                       ;if we want the alls saved
     IF (self.eoutstr NE !NULL) AND (self.foutstr NE !NULL) THEN BEGIN ;check for null pointer
        allout = [*self.outstr, *self.eoutstr, *self.foutstr]          ;grab data
        afilename = filename                                           ;copy filename
        strreplace, afilename, '.fits', '_all.fits'                    ;modify filename
        mwrfits, allout, afilename, /CREATE                            ; write file
     ENDIF                                                             ;end check null pointer
  ENDIF                                                                ;end want alls saved



  RETURN
END
;====================================================================================================


;====================================================================================================
PRO MASTER_RADEC::run

  
  print, 'hey'

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO MASTER_RADEC::cleanup

  ;;;releasing pointers
  ptr_free, self.outstr         ;
  ptr_free, self.eoutstr        ;
  ptr_free, self.foutstr        ;
  ptr_free, self.tagnames       ;
  ptr_free, self.full1          ;
  ptr_free, self.mra            ;
  ptr_free, self.mdec           ;
  ptr_free, self.ra1            ;
  ptr_free, self.dec1           ;

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION MASTER_RADEC::init, mra, mdec, FULLM=fullm, FULL1=full1, RA1=ra1, DEC1=dec1, PREM=prem, PRE1=pre1, $
                             MINSEAR=minsear, MAXSEAR=maxsear, STEPSEAR=stepsear
  
  self.mrdobjver = 'v0-1-0'     ;code version

  self.mra = ptr_new(float(mra))                                    ;set RAs
  self.mdec = ptr_new(float(mdec))                                  ;set DECs
  IF keyword_set(FULLM) THEN self.fullm = ptr_new(fullm)            ;set first file full values
  IF keyword_set(PREM) THEN self.prem = string(prem) ELSE prem = '' ;prefix for first file tags
  IF keyword_set(FULL1) THEN self.full1 = ptr_new(full1)            ;set first file full values
  IF keyword_set(RA1) THEN self.ra1 = ptr_new(float(ra1))           ;set first file match RA values
  IF keyword_set(DEC1) THEN self.dec1 = ptr_new(float(dec1))        ;set first file match DEC values
  IF keyword_set(PRE1) THEN self.pre1 = string(pre1) ELSE pre1 = '' ;prefix for first file tags

  self.basestr = ptr_new({mra:0.0, mdec:0.0, mid:'-99.0', mflag:-99}) ;base structure
  
  IF keyword_set(MINSEAR) THEN self.minsear = float(minsear[0]) ELSE self.minsear = 0.1                              ;set default [arcsec]
  IF keyword_set(MAXSEAR) THEN self.maxsear = float(maxsear[0]) ELSE self.maxsear = 4.1                              ;set default [arcsec]
  IF keyword_set(STEPSEAR) THEN self.stepsear = float(stepsear[0]) ELSE self.stepsear = 0.5                          ;set default [arcsec]
  IF keyword_set(BORSEAR) THEN self.borsear = float(borsear[0]) ELSE self.borsear = self.maxsear + 7.0*self.stepsear ;set default [arcsec]
  
  self.verbose = 1              ;set default

  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO MASTER_RADEC__define

  void = {MASTER_RADEC, mrdobjver:'A', $
          BASESTR:ptr_new(), OUTSTR:ptr_new(), EOUTSTR:ptr_new(), FOUTSTR:ptr_new(), TAGNAMES:ptr_new(), $
          FULLM:ptr_new(), MRA:ptr_new(), MDEC:ptr_new(), PREM:'A', CLEANMID:ptr_new(), $
          FULL1:ptr_new(), RA1:ptr_new(), DEC1:ptr_new(), PRE1:'A', $
          MINSEAR:0.0, MAXSEAR:0.0, STEPSEAR:0.0, BORSEAR:0.0, $
          VERBOSE:0}

  RETURN
END
;====================================================================================================

