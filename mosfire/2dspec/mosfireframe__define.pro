;====================================================================================================
PRO mosfireframe::setprop, DATA=data, SOURCE=source, NAME=name, DATE=date

  IF n_elements(DATA) NE 0 THEN self.data = ptr_new(data) ;set the data
  IF n_elements(SOURCE) NE 0 THEN self.setsource, source
  IF n_elements(NAME) NE 0 THEN self.name = name
  IF n_elements(DATE) NE 0 THEN self.date = date

RETURN
END
;====================================================================================================


;====================================================================================================
PRO mosfireframe::getprop, DATA=data, NAME=name, SOURCE=source, DATE=date

  IF arg_present(DATA) THEN data = *self.data      ;return the data
  IF arg_present(SOURCE) THEN source = self.source ;return the source
  IF arg_present(NAME) THEN name = self.name       ;return the name
  IF arg_present(DATE) THEN date = self.date       ;return the date
  
  
  RETURN
END
;====================================================================================================



;====================================================================================================
FUNCTION mosfireframe::exist, VERBOSE=verbose

  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1 ;set value

  full = strcompress(self.directory + self.name, /REMOVE_ALL)       ;append full name
  result = file_test(full)                                          ;test file's existance
  IF result EQ 1 THEN BEGIN                                         ;if file exists
     IF verbose GE 2 THEN print, ' Frame exists: ', self.name       ;print info
     RETURN, 1                                                      ;return
  ENDIF ELSE BEGIN                                                  ;enf file exists
     IF verbose GE 2 Then print, ' Frame doesnt exist: ', self.name ;print info
     RETURN, -1                                                     ;return
  ENDELSE                                                           ;end file doesn't exist
  
END
;====================================================================================================



;====================================================================================================
FUNCTION mosfireframe::readhead, EXTEN=exten


  IF keyword_set(EXTEN) THEN exten = fix(exten[0]) ELSE exten = 0 ;set default value
  
  fullname = strcompress(self.directory + self.name, /REMOVE_ALL)
  hdr = headfits(fullname)
    
  RETURN, hdr
END
;====================================================================================================


;====================================================================================================
PRO mosfireframe::read, DATA=data, HDR=hdr, FILEUNIT=fileunit, USEMRD=usemrd


  IF keyword_set(FILEUNIT) THEN fileunit = fix(fileunit[0]) ELSE fileunit = 0 ;set default value
  
  IF keyword_set(USEMRD) THEN data = mrdfits(self.name, fileunit, hdr) ELSE $
     data = readfits(self.name, hdr)
    
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfireframe::hdrtostruc, hdr, hdrtags


  onestruc = {id:0}             ;start structure
  
  nhdr = n_elements(hdr)                                 ;find number of elements
  chk = where(strmatch(hdrtags, '*-*', /FOLD_CASE) EQ 1) ;find if dash exists
  IF chk[0] NE -1 THEN BEGIN                             ;if dash exists
     FOR xx=0, n_elements(chk)-1, 1 DO BEGIN             ;loop over dashes
        tmp = hdrtags[chk[xx]]                           ;get the tag in question
        strreplace, tmp, '-', '_'                        ;replace dash with underscore
        hdrtags[chk[xx]] = tmp                           ;recapture tag
     ENDFOR                                              ;end loop over dashes
  ENDIF                                                  ;end dash exists

  chk = where(strmatch(hdrtags, 'COMMENT*', /FOLD_CASE) EQ 1)                       ;find if multiples exists
  IF chk[0] NE -1 THEN BEGIN                                                        ;if multiples exists
     FOR xx=0, n_elements(chk)-1, 1 DO BEGIN                                        ;loop over multiples
        hdrtags[chk[xx]] = strcompress(hdrtags[chk[xx]] + string(xx), /REMOVE_ALL ) ;get the tag in question
     ENDFOR                                                                         ;end loop over multiples
  ENDIF                                                                             ;end multiples exists

  chk = where(strmatch(hdrtags, 'REPEAT', /FOLD_CASE) EQ 1)                  ;find if repeat exists
  IF chk[0] NE -1 THEN BEGIN                                                 ;if repeat exists
     FOR xx=0, n_elements(chk)-1, 1 DO BEGIN                                 ;loop over repeat
        hdrtags[chk[xx]] = strcompress('X' + hdrtags[chk[xx]], /REMOVE_ALL ) ;get the tag in question
     ENDFOR                                                                  ;end loop over repeat
  ENDIF                                                                      ;end repeat exists
  
  add_tag, onestruc, 'FRAMENAME', '', newstruc          ;add tag to struc
  onestruc = newstruc                                   ;recapture 
  newstruc = 0                                          ;set temp struc to nothing
  FOR xx=0, nhdr-1, 1 DO BEGIN                          ;loop over header elements
     value = fxpar(hdr, hdrtags[xx])                    ;get value
     IF (hdrtags[xx] NE 'END') THEN BEGIN               ;if not a poor tag
        add_tag, onestruc, hdrtags[xx], value, newstruc ;add tag to struc
        onestruc = newstruc                             ;recapture 
        newstruc = 0                                    ;set temp struc to nothing
     ENDIF                                              ;end not a poor tag
  ENDFOR                                                ;end loop over elements

  RETURN, onestruc
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfireframe::hdrtostrucadd, strucadd, which, hdr, hdrtags


  nhdr = n_elements(hdrtags)                                                 ;find number of elements
  FOR yy=0, nhdr-1, 1 DO BEGIN                                               ;loop over the tags
     strucadd[which].ID = which                                              ;store value
     chk = tag_exist(strucadd, hdrtags[yy], INDEX=index, /TOP_LEVEL, /QUIET) ;find tag, index
     IF (chk EQ 1) THEN BEGIN                                                ;if tag found no problem
        value = fxpar(hdr, hdrtags[yy])                                      ;get value
        strucadd[which].(index) = value                                      ;store value
     ENDIF ELSE BEGIN                                                        ;end if tag found no problem
        IF yy EQ 0 THEN print, 'Need to fix broken tags bit'
     ENDELSE                                                                 ;if problem finding tag
  ENDFOR                                                                     ;end loop over tags
  
  ;chk = where(strmatch(hdrtags, '*-*', /FOLD_CASE) EQ 1) ;find if dash exists
  ;IF chk[0] NE -1 THEN BEGIN                             ;if dash exists
  ;   FOR xx=0, n_elements(chk)-1, 1 DO BEGIN             ;loop over dashes
  ;      tmp = hdrtags[chk[xx]]                           ;get the tag in question
  ;      strreplace, tmp, '-', '_'                        ;replace dash with underscore
  ;      hdrtags[chk[xx]] = tmp                           ;recapture tag
  ;   ENDFOR                                              ;end loop over dashes
  ;ENDIF                                                  ;end dash exists

  ;chk = where(strmatch(hdrtags, 'COMMENT*', /FOLD_CASE) EQ 1)                       ;find if multiples exists
  ;IF chk[0] NE -1 THEN BEGIN                                                        ;if multiples exists
  ;   FOR xx=0, n_elements(chk)-1, 1 DO BEGIN                                        ;loop over multiples
  ;      hdrtags[chk[xx]] = strcompress(hdrtags[chk[xx]] + string(xx), /REMOVE_ALL ) ;get the tag in question
  ;   ENDFOR                                                                         ;end loop over multiples
  ;ENDIF                                                                             ;end multiples exists

  ;chk = where(strmatch(hdrtags, 'REPEAT', /FOLD_CASE) EQ 1)                  ;find if repeat exists
  ;IF chk[0] NE -1 THEN BEGIN                                                 ;if repeat exists
  ;   FOR xx=0, n_elements(chk)-1, 1 DO BEGIN                                 ;loop over repeat
  ;      hdrtags[chk[xx]] = strcompress('X' + hdrtags[chk[xx]], /REMOVE_ALL ) ;get the tag in question
  ;   ENDFOR                                                                  ;end loop over repeat
  ;ENDIF                                                                      ;end repeat exists
  
  ;FOR xx=0, nhdr-1, 1 DO BEGIN                          ;loop over header elements
  ;   IF (hdrtags[xx] NE 'END') THEN BEGIN               ;if not a poor tag
  ;      add_tag, onestruc, hdrtags[xx], value, newstruc ;add tag to struc
  ;      onestruc = newstruc                             ;recapture 
  ;      newstruc = 0                                    ;set temp struc to nothing
  ;   ENDIF                                              ;end not a poor tag
  ;ENDFOR                                                ;end loop over elements

  ;stop
  RETURN, strucadd
END
;====================================================================================================



;====================================================================================================
PRO mosfireframe::cleanup

  ptr_free, self.data

RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfireframe::init, frame, directory, date

  self.name = frame
  self.directory = directory
  self.date = date
  
RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO mosfireframe__define

  void = {mosfireframe, name:'', directory:'', date:'', data:ptr_new()}

RETURN
END
;====================================================================================================
