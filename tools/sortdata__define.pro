;+
; NAME:
;       SORTDATA()
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
;
;
; DESIRED UPGRADES
;
;     
;
;-

;====================================================================================================
PRO SORTDATA::getprop, SRDOBJVER=srdobjver, BINNAMES=binnames, NAME1=name1, BINS1=bins1, $
                       KEYSTRUC=keystruc

  IF arg_present(SRDOBJVER) THEN srdobjver = self.srdobjver ;return the data
  IF arg_present(BINNAMES) THEN binnames = *self.binnames   ;return the data
  IF arg_present(NAME1) THEN name1 = self.name1             ;return the data
  IF arg_present(BIN1) THEN bin1 = *self.bin1               ;return the data
  IF arg_present(KEYSTRUC) THEN keystruc = *self.keystruc   ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO SORTDATA::setbinnames

  self.binnames = ptr_new(['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', $  ;cont next line
                           'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', $                                                    ;cont next line
                           'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AI', 'AJ', 'AK', $                                ;cont next line
                           'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ', $  ;cont next line
                           'BA', 'BB', 'BC', 'BD', 'BE', 'BF', 'BG', 'BI', 'BJ', 'BK', $                                ;cont next line
                           'BL', 'BM', 'BN', 'BO', 'BP', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BX', 'BY', 'BZ', $  ;cont next line
                           'CA', 'CB', 'CC', 'CD', 'CE', 'CF', 'CG', 'CI', 'CJ', 'CK', $                                ;cont next line
                           'CL', 'CM', 'CN', 'CO', 'CP', 'CQ', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', $) ;bin names
                          'DA', 'DB', 'DC', 'DD', 'DE', 'DF', 'DG', 'DI', 'DJ', 'DK', $                                 ;dont next line
                          'DL', 'DM', 'DN', 'DO', 'DP', 'DQ', 'DR', 'DS', 'DT', 'DU', 'DV', 'DW', 'DX', 'DY', 'DZ'])    ;bin names
  
END
;====================================================================================================


;====================================================================================================
FUNCTION SORTDATA::chknames


  pass = 1                      ;set flag
  xdata = *self.data            ;get data
  xpass = *self.topass          ;get data
  
  chk = tag_exist(xdata, self.name1, INDEX=dind1)                    ;find necessary tag
  text = strcompress('   Can not find ' + self.name1 + ' keyword: ') ;text to pass
  IF chk EQ 0 THEN dind1 = tagprompt(xdata, text)                    ;find necessary tag
  pass = (dind1 NE -1) ? 1 : 0                                       ;pass if found
  self.dind1 = dind1                                                 ;store index

  IF self.name2 NE 'NONE' THEN BEGIN                                    ;if second name is set
     chk = tag_exist(xdata, self.name2, INDEX=dind2)                    ;find necessary tag
     text = strcompress('   Can not find ' + self.name2 + ' keyword: ') ;text to pass
     IF chk EQ 0 THEN dind2 = tagprompt(xdata, text)                    ;find necessary tag
     pass = (dind2 NE -1) ? 1 : 0                                       ;pass if found
     self.dind2 = dind2                                                 ;store index
  ENDIF                                                                 ;end second name set

 IF self.name3 NE 'NONE' THEN BEGIN                                    ;if second name is set
     chk = tag_exist(xdata, self.name3, INDEX=dind3)                    ;find necessary tag
     text = strcompress('   Can not find ' + self.name3 + ' keyword: ') ;text to pass
     IF chk EQ 0 THEN dind3 = tagprompt(xdata, text)                    ;find necessary tag
     pass = (dind3 NE -1) ? 1 : 0                                       ;pass if found
     self.dind3 = dind3                                                 ;store index
  ENDIF                                                                 ;end second name set
  
 IF self.name4 NE 'NONE' THEN BEGIN                                    ;if second name is set
     chk = tag_exist(xdata, self.name4, INDEX=dind4)                    ;find necessary tag
     text = strcompress('   Can not find ' + self.name4 + ' keyword: ') ;text to pass
     IF chk EQ 0 THEN dind4 = tagprompt(xdata, text)                    ;find necessary tag
     pass = (dind4 NE -1) ? 1 : 0                                       ;pass if found
     self.dind4 = dind4                                                 ;store index
  ENDIF                                                                 ;end second name set
  
 IF self.name5 NE 'NONE' THEN BEGIN                                    ;if second name is set
     chk = tag_exist(xdata, self.name5, INDEX=dind5)                    ;find necessary tag
     text = strcompress('   Can not find ' + self.name5 + ' keyword: ') ;text to pass
     IF chk EQ 0 THEN dind5 = tagprompt(xdata, text)                    ;find necessary tag
     pass = (dind5 NE -1) ? 1 : 0                                       ;pass if found
     self.dind5 = dind5                                                 ;store index
  ENDIF                                                                 ;end second name set
  
 IF self.name6 NE 'NONE' THEN BEGIN                                    ;if second name is set
     chk = tag_exist(xdata, self.name6, INDEX=dind6)                    ;find necessary tag
     text = strcompress('   Can not find ' + self.name6 + ' keyword: ') ;text to pass
     IF chk EQ 0 THEN dind6 = tagprompt(xdata, text)                    ;find necessary tag
     pass = (dind6 NE -1) ? 1 : 0                                       ;pass if found
     self.dind6 = dind6                                                 ;store index
  ENDIF                                                                 ;end second name set
  
 IF self.name7 NE 'NONE' THEN BEGIN                                    ;if second name is set
     chk = tag_exist(xdata, self.name7, INDEX=dind7)                    ;find necessary tag
     text = strcompress('   Can not find ' + self.name7 + ' keyword: ') ;text to pass
     IF chk EQ 0 THEN dind7 = tagprompt(xdata, text)                    ;find necessary tag
     pass = (dind7 NE -1) ? 1 : 0                                       ;pass if found
     self.dind7 = dind7                                                 ;store index
  ENDIF                                                                 ;end second name set
  
 IF self.name8 NE 'NONE' THEN BEGIN                                    ;if second name is set
     chk = tag_exist(xdata, self.name8, INDEX=dind8)                    ;find necessary tag
     text = strcompress('   Can not find ' + self.name8 + ' keyword: ') ;text to pass
     IF chk EQ 0 THEN dind8 = tagprompt(xdata, text)                    ;find necessary tag
     pass = (dind8 NE -1) ? 1 : 0                                       ;pass if found
     self.dind8 = dind8                                                 ;store index
  ENDIF                                                                 ;end second name set

 passind = intarr(n_elements(xpass))
 FOR xx=0, n_elements(xpass)-1, 1 DO BEGIN                             ;loop over pass info
    chk = tag_exist(xdata, xpass[xx], INDEX=curind)                    ;find necessary tag
    text = strcompress('   Can not find ' + xpass[xx] + ' keyword: ')  ;text to pass
    IF chk EQ 0 THEN curind = tagprompt(xdata, text)                   ;find necessary tag
    passind[xx] = curind                                               ;store index
 ENDFOR                                                                ;end loop over pass info
 self.topassinddata = ptr_new(passind)                                 ;store info
  

  RETURN, pass 
END
;====================================================================================================


;====================================================================================================
FUNCTION SORTDATA::makeeven, workit, curbin, xmin


  chk = where(workit GE xmin, nworkit)      ;get higher than points
  IF (chk[0] NE -1) THEN BEGIN              ;
     workit = workit[chk]                   ;keep higher than points
     workit = workit[reverse(sort(workit))] ;reverse sort points
     
     ;;;determine a nominal amount to move
     flag = 0                                          ;set flag
     cnt = 0                                           ;set counter
     WHILE (flag EQ 0) AND (cnt LT nworkit-1) DO BEGIN ;begin divying up
        bit2 = workit[cnt] - workit[cnt+1]             ;look at differenc
        IF (bit2 NE 0) THEN flag = 1                   ;if we found something that works
        cnt = cnt + 1                                  ;up counter
     ENDWHILE                                          ;end divying up
     bins2 = [workit[0]+bit2]                          ;start the bins array

     ;;;determine bins
     flag = 0                                                 ;set flag
     cnt = 0                                                  ;set counter
     WHILE (flag EQ 0) AND (cnt LT 10000) DO BEGIN            ;begin divying up
        next = min(where((workit - workit[curbin-1]) LT 0.0)) ;find next different entry
        diff = 0.5*(workit[curbin-1] - workit[next])          ;find halfway point
        bins2 = [bins2,(workit[curbin-1]-diff)]               ;store value as bin entry
        workit = workit[next:-1]                              ;whittle down working set
        IF n_elements(workit) LT curbin THEN BEGIN            ;if not enough elements left
           bins2 = [bins2,(workit[-1]-bit2)]                  ;store last bin
           flag = 1                                           ;flag stopping
        ENDIF                                                 ;end not enough elements
        cnt = cnt + 1                                         ;up counter
                                ;stop
     ENDWHILE                   ;end divying up
  ENDIF                         ;end elements to bin
  

  RETURN, bins2
END
;====================================================================================================



;====================================================================================================
FUNCTION SORTDATA::chkbins, MIN2=min2, MIN3=min3


  ;;;set defaults

  ;;;grab data
  xdata = *self.data            ;get data
  zone1 = *self.bins1           ;grab first bins

  
  curbin = *self.bins1                                     ;grab first bins
  IF (self.dind1 NE -1) THEN curbin = curbin[sort(curbin)] ;make sure its ordered
  self.bins1 = ptr_new(curbin)                             ;store index

  ;;;make bins for "2" based on range of "1"
  IF self.name2 NE 'NONE' THEN BEGIN                                                                      ;if second name is set
     curbin = *self.bins2                                                                                 ;grab first bins
     IF (n_elements(curbin) EQ 1) THEN BEGIN                                                              ;if only 1 elements assumption of desire to make bins
        print, strcompress('   Sorting "2" into bins containing ' + string(curbin[0]) + ' elements each') ;print info
        chk = where((xdata.(self.dind1) GT zone1[0]) AND (xdata.(self.dind1) LT zone1[-1]))               ;find which points are in range for "1"
        IF n_elements(chk) LT curbin[0] THEN BEGIN $                                                      ;if enough points
           print, '  Fewer elements available than # per bin requested...'                                ;print info
        ENDIF ELSE BEGIN                                                                                  ;if not enough points
           IF keyword_set(MIN2) THEN min2 = min2[0] ELSE min2 = xdata[chk[0]].(self.dind2)                ;set min to consider
           newbins = self.makeeven(xdata[chk].(self.dind2), curbin[0], min2)                              ;if enough points      
        ENDELSE                                                                                           ;end not enough points
        self.bins2 = ptr_new(newbins)                                                                     ;store index
     ENDIF                                                                                                ;end assumption of make bins
  ENDIF                                                                                                   ;end second name set
  zone2 = *self.bins2                                                                                     ;grab first bins

  ;;;make bins for "3" based on range of "1" and "2"
  IF self.name3 NE 'NONE' THEN BEGIN                                                                      ;if second name is set
     curbin = *self.bins3                                                                                 ;grab first bins
     IF (n_elements(curbin) EQ 1) THEN BEGIN                                                              ;if only 1 elements assumption of desire to make bins
        print, strcompress('   Sorting "3" into bins containing ' + string(curbin[0]) + ' elements each') ;print info
        chk = where((xdata.(self.dind1) GT zone1[0]) AND (xdata.(self.dind1) LT zone1[-1]) AND $          ;cont next line
                    (xdata.(self.dind2) GT zone2[0]) AND (xdata.(self.dind2) LT zone2[-1]))               ;find which points are in range for "1" and "2"
        IF n_elements(chk) LT curbin[0] THEN BEGIN $                                                      ;if enough points
           print, '  Fewer elements available than # per bin requested...'                                ;print info
        ENDIF ELSE BEGIN                                                                                  ;if not enough points
           IF keyword_set(MIN3) THEN min3 = min3[0] ELSE min3 = xdata[chk[0]].(self.dind3)                ;set min to consider
           newbins = self.makeeven(xdata[chk].(self.dind3), curbin[0], min3)                              ;if enough points 
        ENDELSE                                                                                           ;end not enough points
        self.bins3 = ptr_new(newbins)                                                                     ;store index
     ENDIF                                                                                                ;end assumption of make bins
  ENDIF                                                                                                   ;end second name set
  zone3 = *self.bins3                                                                                     ;grab bins

  ;;;make bins for "4" based on range of "1", "2" and "3"
  IF self.name4 NE 'NONE' THEN BEGIN                                                                      ;if second name is set
     curbin = *self.bins4                                                                                 ;grab first bins
     IF (n_elements(curbin) EQ 1) THEN BEGIN                                                              ;if only 1 elements assumption of desire to make bins
        print, strcompress('   Sorting "4" into bins containing ' + string(curbin[0]) + ' elements each') ;print info
        chk = where((xdata.(self.dind1) GT zone1[0]) AND (xdata.(self.dind1) LT zone1[-1]) AND $          ;cont next line
                    (xdata.(self.dind2) GT zone2[0]) AND (xdata.(self.dind2) LT zone2[-1]) AND $          ;cont next line
                    (xdata.(self.dind3) GT zone3[0]) AND (xdata.(self.dind3) LT zone3[-1]) )              ;find which points are in range for "1", "2" and "3"
        IF n_elements(chk) LT curbin[0] THEN BEGIN $                                                      ;if enough points
           print, '  Fewer elements available than # per bin requested...'                                ;print info
        ENDIF ELSE BEGIN                                                                                  ;if not enough points
           IF keyword_set(MIN4) THEN min4 = min4[0] ELSE min4 = xdata[chk[0]].(self.dind4)                ;set min to consider
           newbins = self.makeeven(xdata[chk].(self.dind4), curbin[0], min4)                              ;if enough points 
        ENDELSE                                                                                           ;end not enough points
        self.bins4 = ptr_new(newbins)                                                                     ;store index
     ENDIF                                                                                                ;end assumption of make bins
  ENDIF                                                                                                   ;end second name set

 
  ;;;make bins for "5" based on range of "1", "2", "3" and "4"
  IF self.name5 NE 'NONE' THEN BEGIN                                                                      ;if second name is set
     curbin = *self.bins5                                                                                 ;grab first bins
     IF (n_elements(curbin) EQ 1) THEN BEGIN                                                              ;if only 1 elements assumption of desire to make bins
        print, strcompress('   Sorting "5" into bins containing ' + string(curbin[0]) + ' elements each') ;print info
        chk = where((xdata.(self.dind1) GT zone1[0]) AND (xdata.(self.dind1) LT zone1[-1]) AND $          ;cont next line
                    (xdata.(self.dind2) GT zone2[0]) AND (xdata.(self.dind2) LT zone2[-1]) AND $          ;cont next line
                    (xdata.(self.dind3) GT zone3[0]) AND (xdata.(self.dind3) LT zone3[-1]) AND $          ;cont next line
                    (xdata.(self.dind4) GT zone4[0]) AND (xdata.(self.dind4) LT zone4[-1]) )              ;find which points are in range for "1" - "4"
        IF n_elements(chk) LT curbin[0] THEN BEGIN $                                                      ;if enough points
           print, '  Fewer elements available than # per bin requested...'                                ;print info
        ENDIF ELSE BEGIN                                                                                  ;if not enough points
           IF keyword_set(MIN5) THEN min5 = min5[0] ELSE min5 = xdata[chk[0]].(self.dind5)                ;set min to consider
           newbins = self.makeeven(xdata[chk].(self.dind5), curbin[0], min5)                              ;if enough points 
        ENDELSE                                                                                           ;end not enough points
        self.bins5 = ptr_new(newbins)                                                                     ;store index
     ENDIF                                                                                                ;end assumption of make bins
  ENDIF                                                                                                   ;end second name set
                                ;print, *self.bins2
                                ;print, *self.bins3
                                ;print, *self.bins4
                                ;stop

  RETURN, 1
END
;====================================================================================================


;====================================================================================================
FUNCTION SORTDATA::chkorder


  curbin = *self.bins1                                     ;grab first bins
  IF (self.dind1 NE -1) THEN curbin = curbin[sort(curbin)] ;make sure its ordered
  self.bins1 = ptr_new(curbin)                             ;store index

  IF self.name2 NE 'NONE' THEN BEGIN                          ;if second name is set
     curbin = *self.bins2                                     ;grab second bins
     IF (self.dind2 NE -1) THEN curbin = curbin[sort(curbin)] ;make sure its ordered
     self.bins2 = ptr_new(curbin)                             ;store index
  ENDIF                                                       ;end second name set
  
  IF self.name3 NE 'NONE' THEN BEGIN                          ;if second name is set
     curbin = *self.bins3                                     ;grab second bins
     IF (self.dind3 NE -1) THEN curbin = curbin[sort(curbin)] ;make sure its ordered
     self.bins3 = ptr_new(curbin)                             ;store index
  ENDIF                                                       ;end second name set

  IF self.name4 NE 'NONE' THEN BEGIN                          ;if second name is set
     curbin = *self.bins4                                     ;grab second bins
     IF (self.dind4 NE -1) THEN curbin = curbin[sort(curbin)] ;make sure its ordered
     self.bins4 = ptr_new(curbin)                             ;store index
  ENDIF                                                       ;end second name set

  IF self.name5 NE 'NONE' THEN BEGIN                          ;if second name is set
     curbin = *self.bins5                                     ;grab second bins
     IF (self.dind5 NE -1) THEN curbin = curbin[sort(curbin)] ;make sure its ordered
     self.bins5 = ptr_new(curbin)                             ;store index
  ENDIF                                                       ;end second name set

  IF self.name6 NE 'NONE' THEN BEGIN                          ;if second name is set
     curbin = *self.bins6                                     ;grab second bins
     IF (self.dind6 NE -1) THEN curbin = curbin[sort(curbin)] ;make sure its ordered
     self.bins6 = ptr_new(curbin)                             ;store index
  ENDIF                                                       ;end second name set

  IF self.name7 NE 'NONE' THEN BEGIN                          ;if second name is set
     curbin = *self.bins7                                     ;grab second bins
     IF (self.dind7 NE -1) THEN curbin = curbin[sort(curbin)] ;make sure its ordered
     self.bins7 = ptr_new(curbin)                             ;store index
  ENDIF                                                       ;end second name set

  IF self.name8 NE 'NONE' THEN BEGIN                          ;if second name is set
     curbin = *self.bins8                                     ;grab second bins
     IF (self.dind8 NE -1) THEN curbin = curbin[sort(curbin)] ;make sure its ordered
     self.bins8 = ptr_new(curbin)                             ;store index
  ENDIF                                                       ;end second name set

  RETURN, 1 
END
;====================================================================================================


;====================================================================================================
PRO SORTDATA::prepouts, FILL1=fill1, FILL2=FILL2, FILL3=FILL3, FILL4=FILL4, FILL5=FILL5, $
                        FILL6=FILL6, FILL7=FILL7, FILL8=FILL8

  
  ;;;dereference data
  xdata = *self.data            ;dereference
  xpass = *self.topass          ;dereference
  xpasind = *self.topassinddata ;dereference
  xkey = *self.keystruc         ;dereference
  xout = *self.outstruc         ;dereference

  
  ;;;set defaults
  If keyword_set(FILL1) THEN fill1 = fill1[0] ELSE fill1 = xdata[0].(self.dind1) ;set default value
  If keyword_set(FILL2) THEN fill2 = fill2[0] ELSE fill2 = xdata[0].(self.dind2) ;set default value
  If keyword_set(FILL3) THEN fill3 = fill3[0] ELSE fill3 = xdata[0].(self.dind3) ;set default value
  If keyword_set(FILL4) THEN fill4 = fill4[0] ELSE fill4 = xdata[0].(self.dind4) ;set default value
  If keyword_set(FILL5) THEN fill5 = fill5[0] ELSE fill5 = xdata[0].(self.dind5) ;set default value
  If keyword_set(FILL6) THEN fill6 = fill6[0] ELSE fill6 = xdata[0].(self.dind6) ;set default value
  If keyword_set(FILL7) THEN fill7 = fill7[0] ELSE fill7 = xdata[0].(self.dind7) ;set default value
  If keyword_set(FILL8) THEN fill8 = fill8[0] ELSE fill8 = xdata[0].(self.dind8) ;set default value

 

  ;;;key structure
  add_tag, xkey, strcompress('min' + self.name1, /REMOVE_ALL), fill1, tmpstruc      ;add the tag
  xkey = 0                                                                          ;reset
  xkey = tmpstruc                                                                   ;recapture
  add_tag, xkey, strcompress('max' + self.name1, /REMOVE_ALL), fill1, tmpstruc      ;add the tag
  xkey = 0                                                                          ;reset
  xkey = tmpstruc                                                                   ;recapture
  chk = tag_exist(xkey, strcompress('min' + self.name1, /REMOVE_ALL), INDEX=k1ind1) ;find necessary tag
  self.k1ind1 = k1ind1                                                              ;store
  chk = tag_exist(xkey, strcompress('max' + self.name1, /REMOVE_ALL), INDEX=k2ind1) ;find necessary tag
  self.k2ind1 = k2ind1                                                              ;store

  IF self.name2 NE 'NONE' THEN BEGIN                                                   ;if second name is set
     add_tag, xkey, strcompress('min' + self.name2, /REMOVE_ALL), fill2, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     add_tag, xkey, strcompress('max' + self.name2, /REMOVE_ALL), fill2, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     chk = tag_exist(xkey, strcompress('min' + self.name2, /REMOVE_ALL), INDEX=k1ind2) ;find necessary tag
     self.k1ind2 = k1ind2                                                              ;store
     chk = tag_exist(xkey, strcompress('max' + self.name2, /REMOVE_ALL), INDEX=k2ind2) ;find necessary tag
     self.k2ind2 = k2ind2                                                              ;store
  ENDIF                                                                                ;end second name set

  IF self.name3 NE 'NONE' THEN BEGIN                                                   ;if second name is set
     add_tag, xkey, strcompress('min' + self.name3, /REMOVE_ALL), fill3, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     add_tag, xkey, strcompress('max' + self.name3, /REMOVE_ALL), fill3, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     chk = tag_exist(xkey, strcompress('min' + self.name3, /REMOVE_ALL), INDEX=k1ind3) ;find necessary tag
     self.k1ind3 = k1ind3                                                              ;store
     chk = tag_exist(xkey, strcompress('max' + self.name3, /REMOVE_ALL), INDEX=k2ind3) ;find necessary tag
     self.k2ind3 = k2ind3                                                              ;store
  ENDIF                                                                                ;end second name set

  IF self.name4 NE 'NONE' THEN BEGIN                                                   ;if second name is set
     add_tag, xkey, strcompress('min' + self.name4, /REMOVE_ALL), fill4, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     add_tag, xkey, strcompress('max' + self.name4, /REMOVE_ALL), fill4, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     chk = tag_exist(xkey, strcompress('min' + self.name4, /REMOVE_ALL), INDEX=k1ind4) ;find necessary tag
     self.k1ind4 = k1ind4                                                              ;store
     chk = tag_exist(xkey, strcompress('max' + self.name4, /REMOVE_ALL), INDEX=k2ind4) ;find necessary tag
     self.k2ind4 = k2ind4                                                              ;store
  ENDIF                                                                                ;end second name set

  IF self.name5 NE 'NONE' THEN BEGIN                                                   ;if second name is set
     add_tag, xkey, strcompress('min' + self.name5, /REMOVE_ALL), fill5, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     add_tag, xkey, strcompress('max' + self.name5, /REMOVE_ALL), fill5, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     chk = tag_exist(xkey, strcompress('min' + self.name5, /REMOVE_ALL), INDEX=k1ind5) ;find necessary tag
     self.k1ind5 = k1ind5                                                              ;store
     chk = tag_exist(xkey, strcompress('max' + self.name5, /REMOVE_ALL), INDEX=k2ind5) ;find necessary tag
     self.k2ind5 = k2ind5                                                              ;store
  ENDIF                                                                                ;end second name set

  IF self.name6 NE 'NONE' THEN BEGIN                                                   ;if second name is set
     add_tag, xkey, strcompress('min' + self.name6, /REMOVE_ALL), fill6, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     add_tag, xkey, strcompress('max' + self.name6, /REMOVE_ALL), fill6, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     chk = tag_exist(xkey, strcompress('min' + self.name6, /REMOVE_ALL), INDEX=k1ind6) ;find necessary tag
     self.k1ind6 = k1ind6                                                              ;store
     chk = tag_exist(xkey, strcompress('max' + self.name6, /REMOVE_ALL), INDEX=k2ind6) ;find necessary tag
     self.k2ind6 = k2ind6                                                              ;store
  ENDIF                                                                                ;end second name set

  IF self.name7 NE 'NONE' THEN BEGIN                                                   ;if second name is set
     add_tag, xkey, strcompress('min' + self.name7, /REMOVE_ALL), fill7, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     add_tag, xkey, strcompress('max' + self.name7, /REMOVE_ALL), fill7, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     chk = tag_exist(xkey, strcompress('min' + self.name7, /REMOVE_ALL), INDEX=k1ind7) ;find necessary tag
     self.k1ind7 = k1ind7                                                              ;store
     chk = tag_exist(xkey, strcompress('max' + self.name7, /REMOVE_ALL), INDEX=k2ind7) ;find necessary tag
     self.k2ind7 = k2ind7                                                              ;store
  ENDIF                                                                                ;end second name set

  IF self.name8 NE 'NONE' THEN BEGIN                                                   ;if second name is set
     add_tag, xkey, strcompress('min' + self.name8, /REMOVE_ALL), fill8, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     add_tag, xkey, strcompress('max' + self.name8, /REMOVE_ALL), fill8, tmpstruc      ;add the tag
     xkey = 0                                                                          ;reset
     xkey = tmpstruc                                                                   ;recapture
     chk = tag_exist(xkey, strcompress('min' + self.name8, /REMOVE_ALL), INDEX=k1ind8) ;find necessary tag
     self.k1ind8 = k1ind8                                                              ;store
     chk = tag_exist(xkey, strcompress('max' + self.name8, /REMOVE_ALL), INDEX=k2ind8) ;find necessary tag
     self.k2ind8 = k2ind8                                                              ;store
  ENDIF                                                                                ;end second name set


  ;;;output structure
  add_tag, xout, strcompress(self.name1, /REMOVE_ALL), fill1, tmpstruc     ;add the tag
  xout = 0                                                                 ;reset
  xout = tmpstruc                                                          ;recapture
  chk = tag_exist(xout, strcompress(self.name1, /REMOVE_ALL), INDEX=oind1) ;find necessary tag
  self.oind1 = oind1                                                       ;store

  IF self.name2 NE 'NONE' THEN BEGIN                                          ;if second name is set
     add_tag, xout, strcompress(self.name2, /REMOVE_ALL), fill2, tmpstruc     ;add the tag
     xout = 0                                                                 ;reset
     xout = tmpstruc                                                          ;recapture
     chk = tag_exist(xout, strcompress(self.name2, /REMOVE_ALL), INDEX=oind2) ;find necessary tag
     self.oind2 = oind2                                                       ;store
  ENDIF                                                                       ;end second name set

  IF self.name3 NE 'NONE' THEN BEGIN                                          ;if second name is set
     add_tag, xout, strcompress(self.name3, /REMOVE_ALL), fill3, tmpstruc     ;add the tag
     xout = 0                                                                 ;reset
     xout = tmpstruc                                                          ;recapture
     chk = tag_exist(xout, strcompress(self.name3, /REMOVE_ALL), INDEX=oind3) ;find necessary tag
     self.oind3 = oind3                                                       ;store
  ENDIF                                                                       ;end second name set

  IF self.name4 NE 'NONE' THEN BEGIN                                          ;if second name is set
     add_tag, xout, strcompress(self.name4, /REMOVE_ALL), fill4, tmpstruc     ;add the tag
     xout = 0                                                                 ;reset
     xout = tmpstruc                                                          ;recapture
     chk = tag_exist(xout, strcompress(self.name4, /REMOVE_ALL), INDEX=oind4) ;find necessary tag
     self.oind4 = oind4                                                       ;store
  ENDIF                                                                       ;end second name set

  IF self.name5 NE 'NONE' THEN BEGIN                                          ;if second name is set
     add_tag, xout, strcompress(self.name5, /REMOVE_ALL), fill5, tmpstruc     ;add the tag
     xout = 0                                                                 ;reset
     xout = tmpstruc                                                          ;recapture
     chk = tag_exist(xout, strcompress(self.name5, /REMOVE_ALL), INDEX=oind5) ;find necessary tag
     self.oind5 = oind5                                                       ;store
  ENDIF                                                                       ;end second name set

  IF self.name6 NE 'NONE' THEN BEGIN                                          ;if second name is set
     add_tag, xout, strcompress(self.name6, /REMOVE_ALL), fill6, tmpstruc     ;add the tag
     xout = 0                                                                 ;reset
     xout = tmpstruc                                                          ;recapture
     chk = tag_exist(xout, strcompress(self.name6, /REMOVE_ALL), INDEX=oind6) ;find necessary tag
     self.oind6 = oind6                                                       ;store
  ENDIF                                                                       ;end second name set 

  IF self.name7 NE 'NONE' THEN BEGIN                                          ;if second name is set
     add_tag, xout, strcompress(self.name7, /REMOVE_ALL), fill7, tmpstruc     ;add the tag
     xout = 0                                                                 ;reset
     xout = tmpstruc                                                          ;recapture
     chk = tag_exist(xout, strcompress(self.name7, /REMOVE_ALL), INDEX=oind7) ;find necessary tag
     self.oind7 = oind7                                                       ;store
  ENDIF                                                                       ;end second name set

  IF self.name8 NE 'NONE' THEN BEGIN                                          ;if second name is set
     add_tag, xout, strcompress(self.name8, /REMOVE_ALL), fill8, tmpstruc     ;add the tag
     xout = 0                                                                 ;reset
     xout = tmpstruc                                                          ;recapture
     chk = tag_exist(xout, strcompress(self.name8, /REMOVE_ALL), INDEX=oind8) ;find necessary tag
     self.oind8 = oind8                                                       ;store
  ENDIF                                                                       ;end second name set

  ;;;passed elements
  xpassindout = xpasind                                                       ;copy arracy
  FOR xx=0, n_elements(xpass)-1, 1 DO BEGIN                                   ;loop over pass info
     add_tag, xout, xpass[xx], xdata[0].(xpasind[xx]), tmpstruc               ;add the tag
     xout = 0                                                                 ;reset
     xout = tmpstruc                                                          ;recapture
     chk = tag_exist(xout, strcompress(xpass[xx], /REMOVE_ALL), INDEX=tmpind) ;find necessary tag
     xpassindout[xx] = tmpind                                                 ;store
  ENDFOR                                                                      ;end loop over pass info

  ;;;most important part: save the new structures
  self.keystruc = ptr_new(xkey)            ;store
  self.outstruc = ptr_new(xout)            ;store
  self.topassindout = ptr_new(xpassindout) ;store
  

  RETURN 
END
;====================================================================================================


;====================================================================================================
FUNCTION sortdata::fillkey, xkeystruc, xbin, xnchk, minone, maxone, mintwo, maxtwo, minthree, maxthree, $
                            minfour, maxfour, minfive, maxfive, minsix, maxsix, minseven, maxseven, $
                            mineight, maxeight

  xkeystruc.key = xbin                  ;store info
  xkeystruc.nbin = xnchk                ;store info
  xkeystruc.(self.k1ind1) = minone      ;store info
  xkeystruc.(self.k2ind1) = maxone      ;store info
  IF (self.name2 NE 'NONE') THEN BEGIN  ;if can store
     xkeystruc.(self.k1ind2) = mintwo   ;store info
     xkeystruc.(self.k2ind2) = maxtwo   ;store info
  ENDIF                                 ;end can store
  IF (self.name3 NE 'NONE') THEN BEGIN  ;if can store
     xkeystruc.(self.k1ind3) = minthree ;store info
     xkeystruc.(self.k2ind3) = maxthree ;store info
  ENDIF                                 ;end can store
  IF (self.name4 NE 'NONE') THEN BEGIN  ;if can store
     xkeystruc.(self.k1ind4) = minfour  ;store info
     xkeystruc.(self.k2ind4) = maxfour  ;store info
  ENDIF                                 ;end can store
  IF (self.name5 NE 'NONE') THEN BEGIN  ;if can store
     xkeystruc.(self.k1ind5) = minfive  ;store info
     xkeystruc.(self.k2ind5) = maxfive  ;store info
  ENDIF                                 ;end can store
  IF (self.name6 NE 'NONE') THEN BEGIN  ;if can store
     xkeystruc.(self.k1ind6) = minsix   ;store info
     xkeystruc.(self.k2ind6) = maxsix   ;store info
  ENDIF                                 ;end can store
  IF (self.name7 NE 'NONE') THEN BEGIN  ;if can store
     xkeystruc.(self.k1ind7) = minseven ;store info
     xkeystruc.(self.k2ind7) = maxseven ;store info
  ENDIF                                 ;end can store
  IF (self.name8 NE 'NONE') THEN BEGIN  ;if can store
     xkeystruc.(self.k1ind8) = mineight ;store info
     xkeystruc.(self.k2ind8) = maxeight ;store info
  ENDIF                                 ;end can store
  

  RETURN, xkeystruc
END
;====================================================================================================


;====================================================================================================
FUNCTION sortdata::fillstruc, xoutstruc, xdata, xchk, xbin

  xpass = *self.topass               ;dereference
  xpassinddata = *self.topassinddata ;dereference
  xpassindout = *self.topassindout   ;dereference

  xoutstruc = replicate(xoutstruc[0], n_elements(xchk))                            ;one entry for each detection
  xoutstruc[*].key = xbin                                                          ;fill in bin name
  xoutstruc.(self.oind1) = xdata[xchk].(self.dind1)                                ;pass data 
  IF (self.name2 NE 'NONE') THEN xoutstruc.(self.oind2) = xdata[xchk].(self.dind2) ;end can store
  IF (self.name3 NE 'NONE') THEN xoutstruc.(self.oind3) = xdata[xchk].(self.dind3) ;end can store
  IF (self.name4 NE 'NONE') THEN xoutstruc.(self.oind4) = xdata[xchk].(self.dind4) ;end can store
  IF (self.name5 NE 'NONE') THEN xoutstruc.(self.oind5) = xdata[xchk].(self.dind5) ;end can store
  IF (self.name6 NE 'NONE') THEN xoutstruc.(self.oind6) = xdata[xchk].(self.dind6) ;end can store
  IF (self.name7 NE 'NONE') THEN xoutstruc.(self.oind7) = xdata[xchk].(self.dind7) ;end can store
  IF (self.name8 NE 'NONE') THEN xoutstruc.(self.oind8) = xdata[xchk].(self.dind8) ;end can store

  ;;;passed elements
  FOR zzz=0, n_elements(xpass)-1, 1 DO BEGIN                        ;loop over pass elements
     xoutstruc.(xpassindout[zzz]) = xdata[xchk].(xpassinddata[zzz]) ;fill in the data
  ENDFOR                                                            ;end loop over pass

  RETURN, xoutstruc
END
;====================================================================================================


;====================================================================================================
FUNCTION sortdata::filldir, xmask, xobj

;FUNCTION spectra_fillstruc, xstruc, xmask, xobj, xmass, xbin
  xstruc = {file:'A', dir:'A'}

  CASE strcompress(xmask, /REMOVE_ALL) OF
     'CDFS44_mask1_1.0_H' : BEGIN
        xstruc.file = strcompress('CDFS44_mask1_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/'
     END
     'CDFS44_mask2_1.0_H' : BEGIN
        xstruc.file = strcompress('CDFS44_mask2_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/'
     END
     'CDFS44_mask3_1.0_H' : BEGIN
        xstruc.file = strcompress('CDFS44_mask3_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/'
     END
     'CDFS44_mask4_1.0_H' : BEGIN
        xstruc.file = strcompress('CDFS44_mask4_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/'
     END
     'cdfs44_mask5_v2_H' : BEGIN
        xstruc.file = strcompress('cdfs44_mask5_v2_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask5_v2/2014nov16/H/'
     END
     'cdfs44_mask6_v2_H' : BEGIN
        xstruc.file = strcompress('cdfs44_mask6_v2_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask6_v2/2014nov16/H/'
     END
     'cdfs44_mask7_v2_H' : BEGIN
        xstruc.file = strcompress('cdfs44_mask7_v2_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask7_v2/2014nov17/H/'
     END
     'cdfs44_mask8_v2_H' : BEGIN
        xstruc.file = strcompress('cdfs44_mask8_v2_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask8_v2/2014nov17/H/'
     END
     'XMM113_mask1_1.0_H' : BEGIN
        xstruc.file = strcompress('XMM113_mask1_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/'
     END
     'XMM113_mask2_1.0_H' : BEGIN
        xstruc.file = strcompress('XMM113_mask2_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/'
     END
     'XMM113_mask3_1.0' : BEGIN
        xstruc.file = strcompress('XMM113_mask3_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask3_1.0/2012nov25/H/'
     END
     'XMM113_mask5' : BEGIN
        xstruc.file = strcompress('XMM113_mask5_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask5/2014aug16/H/'
     END
     'XMM113_mask6_H' : BEGIN
        xstruc.file = strcompress('XMM113_mask6_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/'
     END
     'XMM113_mask7_H' : BEGIN
        xstruc.file = strcompress('XMM113_mask7_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/'
     END
     'xmm113_mask8_v1_H' : BEGIN
        xstruc.file = strcompress('xmm113_mask8_v1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask8_v1/2014nov16/H/'
     END
     'xmm113_mask9_v1_H' : BEGIN
        xstruc.file = strcompress('xmm113_mask9_v1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask9_v1/2015feb23/H/'
     END
     'xmm105_mask1_v1_H' : BEGIN
        xstruc.file = strcompress('xmm105_mask1_v1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/xmm105_mask1_v1/2014nov17/H/'
     END
     'xmm105_mask2_v1_H' : BEGIN
        xstruc.file = strcompress('xmm105_mask2_v1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/xmm105_mask2_v1/2014nov17/H/'
     END
    'lok400_mask1_H' : BEGIN
        xstruc.file = strcompress('lok400_mask1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov29/H/'
     END
    'LOK400_mask2_H' : BEGIN
        xstruc.file = strcompress('LOK400_mask2_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask2/2014may14/H/'
     END
    'LOK400_mask3_H' : BEGIN
        xstruc.file = strcompress('LOK400_mask3_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/'
     END
    'lok400_mask4_v1_H' : BEGIN
        xstruc.file = strcompress('lok400_mask4_v1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        xstruc.dir = '/Users/adegroot/research/dataredux/mosfire/lok400_mask4_v1/2014nov17/H/'
     END

     ELSE : BEGIN
        ;print, 'WARNING!! Something has gone horribly wrong!'
        print, ' Mask option not found: ', xmask
     ENDELSE
  END

  RETURN, xstruc
END
;====================================================================================================


;====================================================================================================
PRO SORTDATA::fillouts, DIRECTORY=DIRECTORY


  IF keyword_set(DIRECTORY) THEN directory = string(directory[0]) ELSE directory = '0' ;set default


  ;;;grab a bunch of things
  xdata = *self.data            ;dereference
  xbins1 = *self.bins1          ;dereference
  xbins2 = *self.bins2          ;dereference
  xbins3 = *self.bins3          ;dereference
  xbins4 = *self.bins4          ;dereference
  xbins5 = *self.bins5          ;dereference
  xbins6 = *self.bins6          ;dereference
  xbins7 = *self.bins7          ;dereference
  xbins8 = *self.bins8          ;dereference
  xbinnames = *self.binnames    ;dereference
  xkeystruc = *self.keystruc    ;dereference
  tmpkeystruc = *self.keystruc  ;dereference
  xoutstruc = *self.outstruc    ;dereference
  tmpoutstruc = *self.outstruc  ;dereference


                                ;IF (self.dind1 NE 0) THEN data1 = xdata.(self.dind1)            ;get data
  data1 = xdata.(self.dind1)    ;get data
  IF (self.dind2 NE 0) THEN data2 = xdata.(self.dind2) ELSE BEGIN ;get data
     data2 = replicate(1000.0, n_elements(xdata.(0)))             ;create fake data
     xbins2 = [999.0,1001.0]                                      ;fake bins
  ENDELSE                                                         ;end not get data
  IF (self.dind3 NE 0) THEN data3 = xdata.(self.dind3) ELSE BEGIN ;get data
     data3 = replicate(1000.0, n_elements(xdata.(0)))             ;create fake data
     xbins3 = [999.0,1001.0]                                      ;fake bins
  ENDELSE                                                         ;end not get data
  IF (self.dind4 NE 0) THEN data4 = xdata.(self.dind4) ELSE BEGIN ;get data
     data4 = replicate(1000.0, n_elements(xdata.(0)))             ;create fake data
     xbins4 = [999.0,1001.0]                                      ;fake bins
  ENDELSE                                                         ;end not get data
  IF (self.dind5 NE 0) THEN data5 = xdata.(self.dind5) ELSE BEGIN ;get data
     data5 = replicate(1000.0, n_elements(xdata.(0)))             ;create fake data
     xbins5 = [999.0,1001.0]                                      ;fake bins
  ENDELSE                                                         ;end not get data
  IF (self.dind6 NE 0) THEN data6 = xdata.(self.dind6) ELSE BEGIN ;get data
     data6 = replicate(1000.0, n_elements(xdata.(0)))             ;create fake data
     xbins6 = [999.0,1001.0]                                      ;fake bins
  ENDELSE                                                         ;end not get data
  IF (self.dind7 NE 0) THEN data7 = xdata.(self.dind7) ELSE BEGIN ;get data
     data7 = replicate(1000.0, n_elements(xdata.(0)))             ;create fake data
     xbins7 = [999.0,1001.0]                                      ;fake bins
  ENDELSE                                                         ;end not get data
  IF (self.dind8 NE 0) THEN data8 = xdata.(self.dind8) ELSE BEGIN ;get data
     data8 = replicate(1000.0, n_elements(xdata.(0)))             ;create fake data
     xbins8 = [999.0,1001.0]                                      ;fake bins
  ENDELSE                                                         ;end not get data

  ;;;do the looping
  cnt = 0                                                               ;start counterdensebins
  FOR uu=0, n_elements(*self.bins1)-2, 1 DO BEGIN                       ;loop over 1 bins
     FOR vv=0, n_elements(*self.bins2)-2, 1 DO BEGIN                    ;loop over 2 bins
        FOR ww=0, n_elements(*self.bins3)-2, 1 DO BEGIN                 ;loop over 3 bins
           FOR xx=0, n_elements(*self.bins4)-2, 1 DO BEGIN              ;loop over 4 bins
              FOR yy=0, n_elements(*self.bins5)-2, 1 DO BEGIN           ;loop over 5 bins
                 FOR zz=0, n_elements(*self.bins6)-2, 1 DO BEGIN        ;loop over 6 bins
                    FOR aaa=0, n_elements(*self.bins7)-2, 1 DO BEGIN    ;loop over 7 bins
                       FOR bbb=0, n_elements(*self.bins8)-2, 1 DO BEGIN ;loop over 8 bins
                                ;print, uu, vv, ww, xx, yy, zz, aaa, bbb
                          chk = where((data1 GE xbins1[uu]) AND (data1 LT xbins1[uu+1]) AND $
                                      (data2 GE xbins2[vv]) AND (data2 LT xbins2[vv+1]) AND $
                                      (data3 GE xbins3[ww]) AND (data3 LT xbins3[ww+1]) AND $ 
                                      (data4 GE xbins4[xx]) AND (data4 LT xbins4[xx+1]) AND $ 
                                      (data5 GE xbins5[yy]) AND (data5 LT xbins5[yy+1]) AND $ 
                                      (data6 GE xbins6[zz]) AND (data6 LT xbins6[zz+1]) AND $ 
                                      (data7 GE xbins7[aaa]) AND (data7 LT xbins7[aaa+1]) AND $ 
                                      (data8 GE xbins8[bbb]) AND (data8 LT xbins8[bbb+1]), nchk)
                                ;print, xbinnames[cnt], ':', nchk
                          IF (chk[0] NE -1) THEN BEGIN
                             addkeystruc = self.fillkey(tmpkeystruc, xbinnames[cnt], nchk, xbins1[uu], xbins1[uu+1], xbins2[vv], xbins2[vv+1], $ ;
                                                        xbins3[ww], xbins3[ww+1], xbins4[xx], xbins4[xx+1], xbins5[yy], xbins5[yy+1], $          ; 
                                                        xbins6[zz], xbins6[zz+1], xbins7[aaa], xbins7[aaa+1], xbins8[bbb], xbins8[bbb+1])        ;
                             IF (self.leavekey EQ 0) THEN xkeystruc = [xkeystruc, addkeystruc]                                                   ;
                             addstruc = self.fillstruc(tmpoutstruc, xdata, chk, xbinnames[cnt])                                                  ;
                             xoutstruc = [xoutstruc, addstruc]
                          ENDIF
                          cnt = cnt + 1 ;up counter regardless; keeps bins consistant
                       ENDFOR
                    ENDFOR
                 ENDFOR
              ENDFOR
           ENDFOR
        ENDFOR
     ENDFOR
  ENDFOR

  ;;;If the directory needs to be added
  IF (directory NE '0') THEN BEGIN                                          ;if directory is requested
     chk = tag_exist(xoutstruc, directory, INDEX=dirind)                    ;find necessary tag
     FOR xx=0, n_elements(xoutstruc.(0))-1, 1 DO BEGIN                      ;loop over items
        this = self.filldir(xoutstruc[xx].(dirind), xoutstruc[xx].sp_m_obj) ;get directory
        xoutstruc[xx].directory = this.dir                                  ;store directory
        xoutstruc[xx].file = this.file                                      ;store file
     ENDFOR                                                                 ;end loop over items
  ENDIF                                                                     ;end directory requested
  
  ;;;capture relevant info
  self.keystruc = ptr_new(xkeystruc) ;store the structure
  self.outstruc = ptr_new(xoutstruc) ;store the structure
  

END
;====================================================================================================


;====================================================================================================
PRO SORTDATA::writeouts, OUTFILE=outfile, KEYOUTFILE=keyoutfile, DIROUT=dirout


  ;;;set defaults
  IF keyword_set(OUTFILE) THEN outfile = string(outfile[0]) ELSE outfile = self.outfile ;set default
  IF keyword_set(KEYOUTFILE) THEN keyoutfile = string(keyoutfile[0]) ELSE BEGIN         ;if keyword set
     IF keyword_set(OUTFILE) THEN keyoutfile = outfile ELSE keyoutfile = self.outfile   ;get base
     strreplace, keyoutfile, '.fits', '_key.fits'                                       ;append name
  ENDELSE                                                                               ;end keyword set
  IF keyword_set(DIROUT) THEN dirout = string(dirout[0]) ELSE dirout = ''               ;set default


  ;;;final prep of files
  xout = *self.outstruc                ;dereference
  xkey = *self.keystruc                ;dereference
  IF (self.ditchfirst EQ 1) THEN BEGIN ;if we need to kill first entry
     xout = xout[1:-1]                 ;remove first entry
     xkey = xkey[1:-1]                 ;remove first entry
  ENDIF                                ;end need to kill first entry
  self.outstruc = ptr_new(xout)        ;dereference
  self.keystruc = ptr_new(xkey)        ;dereference


  ;;;writing files
                                ;print, strcompress(dirout + outfile, /REMOVE_ALL)                                                  ;append directory
                                ;print, strcompress(dirout + keyoutfile, /REMOVE_ALL)                                               ;append directory
  mwrfits, xout, strcompress(dirout + outfile, /REMOVE_ALL), /CREATE                                 ;write file
  IF (self.leavekey EQ 0) THEN mwrfits, xkey, strcompress(dirout + keyoutfile, /REMOVE_ALL), /CREATE ;write file


END
;====================================================================================================


;====================================================================================================
PRO SORTDATA::cleanup

  ptr_free, self.binnames       ;free pointer
  ptr_free, self.bins1          ;free pointer
  ptr_free, self.bins2          ;free pointer
  ptr_free, self.bins3          ;free pointer
  ptr_free, self.bins4          ;free pointer
  ptr_free, self.bins5          ;free pointer
  ptr_free, self.bins6          ;free pointer
  ptr_free, self.bins7          ;free pointer
  ptr_free, self.bins8          ;free pointer

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION SORTDATA::init, data, name1, bins1, NAME2=name2, BINS2=bins2, $
                         NAME3=name3, BINS3=bins3, NAME4=name4, BINS4=bins4, NAME5=name5, BINS5=bins5, $
                         NAME6=name6, BINS6=bins6, NAME7=name7, BINS7=bins7, NAME8=name8, BINS8=bins8, $
                         TOPASS=topass, OUTFILE=outfile, DITCHFIRST=ditchfirst
  
  
  self.srdobjver = 'v0-5-0'                                        ;code version
  self.setbinnames                                                 ;set bin names
  self.keystruc = ptr_new({key:'string', nbin:0L})                 ;set starting struc
  self.outstruc = ptr_new({key:'string', directory:'A', file:'A'}) ;set starting struc

  self.data = ptr_new(data)                                                                         ;store data
  self.name1 = name1                                                                                ;store value
  self.bins1 = ptr_new(bins1)                                                                       ;store value
  IF keyword_set(NAME2) THEN self.name2 = name2 ELSE self.name2 = 'NONE'                            ;set value
  IF keyword_set(BINS2) THEN self.bins2 = ptr_new(bins2) ELSE self.bins2 = ptr_new(['NONE','NONE']) ;set value
  IF keyword_set(NAME3) THEN self.name3 = name3 ELSE self.name3 = 'NONE'                            ;set value
  IF keyword_set(BINS3) THEN self.bins3 = ptr_new(bins3) ELSE self.bins3 = ptr_new(['NONE','NONE']) ;set value
  IF keyword_set(NAME4) THEN self.name4 = name4 ELSE self.name4 = 'NONE'                            ;set value
  IF keyword_set(BINS4) THEN self.bins4 = ptr_new(bins4) ELSE self.bins4 = ptr_new(['NONE','NONE']) ;set value
  IF keyword_set(NAME5) THEN self.name5 = name5 ELSE self.name5 = 'NONE'                            ;set value
  IF keyword_set(BINS5) THEN self.bins5 = ptr_new(bins5) ELSE self.bins5 = ptr_new(['NONE','NONE']) ;set value
  IF keyword_set(NAME6) THEN self.name6 = name6 ELSE self.name6 = 'NONE'                            ;set value
  IF keyword_set(BINS6) THEN self.bins6 = ptr_new(bins6) ELSE self.bins6 = ptr_new(['NONE','NONE']) ;set value
  IF keyword_set(NAME7) THEN self.name7 = name7 ELSE self.name7 = 'NONE'                            ;set value
  IF keyword_set(BINS7) THEN self.bins7 = ptr_new(bins7) ELSE self.bins7 = ptr_new(['NONE','NONE']) ;set value
  IF keyword_set(NAME8) THEN self.name8 = name8 ELSE self.name8 = 'NONE'                            ;set value
  IF keyword_set(BINS8) THEN self.bins8 = ptr_new(bins8) ELSE self.bins8 = ptr_new(['NONE','NONE']) ;set value


  IF keyword_set(TOPASS) THEN self.topass = ptr_new(topass) ELSE self.topass = ptr_new('NONE') ;set value

  IF keyword_set(DITCHFIRST) THEN self.ditchfirst = fix(ditchfirst[0]) ELSE self.ditchfirst = 0 ;set value
  ;IF keyword_set(LEAVEKEY) THEN self.leavekey = ptr_new(leavekey) ELSE self.leavekey = 0         ;set value
  IF keyword_set(DITCHFIRST) THEN self.ditchfirst = (ditchfirst) ELSE self.ditchfirst = 0 ;set value
  IF keyword_set(LEAVEKEY) THEN self.leavekey = (leavekey) ELSE self.leavekey = 0         ;set value
  


  IF keyword_set(OUTFILE) THEN self.outfile = ptr_new(outfile) ELSE self.outfile = 'spectra_stack_output.fits' ;set value
  
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO SORTDATA__define

  void = {SORTDATA, srdobjver:'A', data:ptr_new(), binnames:ptr_new(), $
          keystruc:ptr_new(), outstruc:ptr_new(), outfile:'A', $
          TOPASS:ptr_new(), TOPASSINDDATA:ptr_new(), TOPASSINDOUT:ptr_new(), $
          NAME1:'A', BINS1:ptr_new(), DIND1:0, K1IND1:0, K2IND1:0, OIND1:0, $
          NAME2:'A', BINS2:ptr_new(), DIND2:0, K1IND2:0, K2IND2:0, OIND2:0, $
          NAME3:'A', BINS3:ptr_new(), DIND3:0, K1IND3:0, K2IND3:0, OIND3:0, $
          NAME4:'A', BINS4:ptr_new(), DIND4:0, K1IND4:0, K2IND4:0, OIND4:0, $
          NAME5:'A', BINS5:ptr_new(), DIND5:0, K1IND5:0, K2IND5:0, OIND5:0, $
          NAME6:'A', BINS6:ptr_new(), DIND6:0, K1IND6:0, K2IND6:0, OIND6:0, $
          NAME7:'A', BINS7:ptr_new(), DIND7:0, K1IND7:0, K2IND7:0, OIND7:0, $
          NAME8:'A', BINS8:ptr_new(), DIND8:0, K1IND8:0, K2IND8:0, OIND8:0, $
          ditchfirst:0, leavekey:0}

  RETURN
END
;====================================================================================================

