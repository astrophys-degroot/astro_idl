;====================================================================================================
PRO mosfirenight::setprop, DATADIR=datadir, DATE=date, ONESTRUC=onestruc, FULLSTRUC=fullstruc, $
                           SUMSTRUC=sumstruc

  IF keyword_set(DATADIR) THEN self.datadir = datadir                ;set the data
  IF keyword_set(DATES) THEN self.date = date                        ;set the data
  IF keyword_set(ONESTRUC) THEN self.onestruc = ptr_new(onestruc)    ;set the data
  IF keyword_set(FULLSTRUC) THEN self.fullstruc = ptr_new(fullstruc) ;set the data
  IF keyword_set(SUMSTRUC) THEN self.sumstruc = ptr_new(sumstruc)    ;set the data

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO mosfirenight::getprop, DATADIR=datadir, DATE=date, NEXPFRAME=nexpframe

  IF arg_present(DATADIR) THEN datadir = self.datadir       ;return the data
  IF arg_present(DATE) THEN date = self.date                ;return the date
  IF arg_present(NEXPFRAME) THEN nexpframe = self.nexpframe ;return the nexpframe
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirenight::exist, MAKEOUTDIR=makeoutdir


  last = strmid(self.datadir, 0, 1, /REVERSE_OFFSET)                                ;check for trailing /
  IF (last NE '/') THEN self.datadir = strcompress(self.datadir + '/', /REMOVE_ALL) ;add if not present
  result = file_test(self.datadir, /DIRECTORY)                                      ;test file's existance  

  IF keyword_set(MAKEOUTDIR) AND (RESULT EQ 0) THEN BEGIN ;if makeoutdir keyword set
     spawn, 'mkdir ' + self.outdir                        ;create directory
     result = file_test(self.outdir, /DIRECTORY)          ;retest file's existance  
  ENDIF                                                   ;end if OUTDIR set

  RETURN, result
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirenight::date, SPECDATE=specdate

  spawn, 'ls ' + self.datadir, dates                                            ;get available dates present
  IF ~keyword_set(SPECDATE) THEN BEGIN                                          ;if date not given
     in = ' '                                                                   ;initalize
     spawn, 'ls ' + self.datadir, dates                                         ;get available dates present
     print, ' No specific date was given. Please choose one of the following: ' ;print info
     FOR xx=0, n_elements(dates)-1, 1 DO BEGIN                                  ;loop over possible dates
        print, strcompress('  (' + strtrim(string(xx)) + '). ' + dates[xx])     ;print possible dates
     ENDFOR                                                                     ;end loop over possible dates
                                ;read, in, PROMPT=' ---------------------> '                                         ;prompt for tag
                                ;chk = ((in GE 0) AND (in LT n_elements(dates)))                                     ;sanity check
                                ;IF (chk EQ 1) THEN self.date = dates[in]                                            ;store possible dates
  ENDIF ELSE BEGIN              ;if specific date given
     chk = where(specdate EQ dates)                                                      ;make sure date is valid
     IF (chk[0] EQ -1) THEN BEGIN                                                        ;if specific date not valid
        print, ' Specific date given is not valid. Please choose one of the following: ' ;print info
        FOR xx=0, n_elements(dates)-1, 1 DO BEGIN                                        ;loop over possible dates
           print, strcompress('  (' + strtrim(string(xx)) + '). ' + dates[xx])           ;print possible dates
        ENDFOR                                                                           ;end loop over possible dates
                                ;read, in, PROMPT=' ---------------------> '                                      ;prompt for tag
                                ;chk = ((in GE 0) AND (in LT n_elements(dates)))                                  ;sanity check
                                ;IF (chk EQ 1) THEN self.date = dates[in]                                         ;store possible dates
     ENDIF ELSE self.date = specdate ;end specific date not valid
  ENDELSE                            ;end specific date given

  
  RETURN, self.date
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirenight::tempfile, date

  ;;;pull out bits from standard MOSFIRE organizing
  year = strmid(date, 0, 4)     ;grab bit
  month = strmid(date, 4, 3)    ;grab bit
  day = strmid(date, 7, 2)      ;grab bit

  ;;;deal with year bit   
  chk1 = 1                                       ;assume its good
  partyear = strmid(year,2,2)                    ;get just last two digits
  nyear = fix(partyear)                          ;change to number
  IF (nyear LT 0) OR (nyear GT 99) THEN chk1 = 0 ;sanity check


  chk2 = 1                                 ;assume its good
  CASE month OF                            ;check string
     'jan' : nmonth = '01'                 ;change from writing to number
     'feb' : nmonth = '02'                 ;change from writing to number
     'mar' : nmonth = '03'                 ;change from writing to number
     'apr' : nmonth = '04'                 ;change from writing to number
     'may' : nmonth = '05'                 ;change from writing to number
     'jun' : nmonth = '06'                 ;change from writing to number
     'jul' : nmonth = '07'                 ;change from writing to number
     'aug' : nmonth = '08'                 ;change from writing to number
     'sep' : nmonth = '09'                 ;change from writing to number
     'oct' : nmonth = '10'                 ;change from writing to number
     'nov' : nmonth = '11'                 ;change from writing to number
     'dec' : nmonth = '12'                 ;change from writing to number
     ELSE : BEGIN                          ;if not valid
        print, 'WARNING!! Month not valid' ;print info
        chk2 = 0                           ;sanity check
     END                                   ;end not valid
  ENDCASE                                  ;end check string


  chk3 = 1                                     ;assume its good
  nday = fix(day)                              ;change to number
  IF (nday LT 0) OR (nday GT 31) THEN chk3 = 0 ;sanity check
  
  tempfile = strcompress('m' + partyear + nmonth + day + '_*.fits', /REMOVE_ALL)       ;stitch together
  IF (chk1 NE 0) AND (chk2 NE 0) AND (chk3 NE 0) THEN RETURN, tempfile ELSE RETURN, -1 ;

END
;====================================================================================================


;====================================================================================================
PRO mosfirenight::finddata, datadir, date, tempfile


  spawn, 'ls ' + strcompress(datadir + tempfile, /REMOVE_ALL), grabbed, catch
  IF (grabbed[0] EQ '') THEN BEGIN
     spawn, 'ls ' + strcompress(datadir + '/' + tempfile, /REMOVE_ALL), grabbed2, catch
     IF (grabbed2[0] EQ '') THEN BEGIN
        spawn, 'ls ' + strcompress(datadir + '/' + date + '/' + tempfile, /REMOVE_ALL), grabbed3, catch
        IF (grabbed3[0] EQ '') THEN BEGIN
           spawn, 'ls ' + strcompress(datadir + date + '/' + date + '/' + tempfile, /REMOVE_ALL), grabbed4, catch
           IF (grabbed4[0] EQ '') THEN BEGIN
              print, 'WARNING!! Unable to find appropriate files! Troubleshoot...'
              print, '  Directory name may deviate from expected YYYYMMDD format'
              print, '  File names may deviate from expected mYYMMDD_*.fits format'
              stop
           ENDIF ELSE self.datadir = strcompress(datadir + date + '/' + date + '/', /REMOVE_ALL)
        ENDIF ELSE self.datadir = strcompress(datadir + '/' + date + '/', /REMOVE_ALL)
     ENDIF ELSE self.datadir = strcompress(datadir + '/', /REMOVE_ALL)
  ENDIF ELSE self.datadir = datadir

END
;====================================================================================================


;====================================================================================================
PRO mosfirenight::nexpframe, datadir, tempfile
  

  spawn, 'ls ' + strcompress(datadir + tempfile, /REMOVE_ALL), grabbed
  IF (grabbed[0] EQ '') THEN BEGIN
     print, 'WARNING!! Something has gone terribly wrong'
  ENDIF ELSE self.nexpframe = n_elements(grabbed)

END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirenight::onestruc, datadir, date, tempfile

  
  print, '    Creating compilation structure for the night...' ;print info
  realfile = tempfile                                          ;copy variable
  strreplace, realfile, '*', '0002'                            ;create file name
  myframe = obj_new('mosfireframe', realfile, datadir, date)   ;intialize frame
  exists = myframe.exist(VERBOSE=0)                            ;check if frame exists

  
  IF (exists EQ 1) THEN BEGIN                                     ;if the file exists
     myframehdr = myframe.readhead(EXTEN=0)                       ;read header
     hdrtags = strcompress(strmid(myframehdr, 0, 8), /REMOVE_ALL) ;grab header keywords
     myframestruc = myframe.hdrtostruc(myframehdr, hdrtags)       ;create structure from keywords
  ENDIF ELSE BEGIN                                                ;if file doesnt exist
     print, 'WARNING!! First file of night not found!!'
     print, 'More work needs to be done'
     stop
  ENDELSE
  self.onestruc = ptr_new(myframestruc) ;store 
  
  RETURN, myframestruc
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirenight::fillstruc, datadir, date, tempfile


  print, '    Filling compilation structure for the night...' ;print info
  mynightstruc = replicate(*self.onestruc, self.nexpframe+1)
  FOR xx=1, self.nexpframe, 1 DO BEGIN
     realfile = tempfile
     CASE 1 OF 
        xx LT 10 : strreplace, realfile, '*', '000' + string(xx)
        xx LT 100 : strreplace, realfile, '*', '00' + string(xx)
        xx LT 1000 : strreplace, realfile, '*', '0' + string(xx)
        ELSE : BEGIN
           print, 'WARNING!! Something has gone horribly wrong!!'
        END
     ENDCASE
     realfile = strcompress(realfile, /REMOVE_ALL)
     
     
     myframe = obj_new('mosfireframe', realfile, datadir, date)                     ;intialize frame
     exists = myframe.exist(VERBOSE=0)                                              ;check if file exists
     IF (exists EQ 1) THEN BEGIN                                                    ;if the file exists
        mynightstruc[xx].FRAMENAME = realfile                                       ;store value
        myframehdr = myframe.readhead(EXTEN=0)                                      ;read header
        hdrtags = strcompress(strmid(myframehdr, 0, 8), /REMOVE_ALL)                ;grab header keywords
        mynightstruc = myframe.hdrtostrucadd(mynightstruc, xx, myframehdr, hdrtags) ;create structure from keywords
     ENDIF ELSE BEGIN                                                               ;if file doesnt exist
        print, 'WARNING!! File not found: ', realfile                               ;print help
        print, 'More work needs to be done'                                         ;print help
     ENDELSE

  END
  
  mynightstruc = mynightstruc[1:-1] ;omit first entry repeat

  RETURN, mynightstruc
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirenight::sumstruc, datastruc, date

  
  ;;;getting there - need to do a better job of determining object tag values


  print, '  Creating summary of the night...'                                             ;print info
  basesum = {mask:'', obj:'', band:'', date:'', nframes:0, ETOS:-99, TTOS:-99.99, FLAT:0} ;base structure
  basesum.date = date                                                                     ;set date for night
  masks = datastruc.maskname                                                              ;grab mask names
  masks = masks[sort(masks)]                                                              ;sort alphabetically
  maskinds = uniq(masks)                                                                  ;find unique entries
  nmasks = n_elements(maskinds)                                                           ;find number of unique entries 
  
  mynightsum = replicate(basesum, 4.0*nmasks) ;replicate structure for each mask * 4 possible bands
  cnt = 0                                     ;start counter

  FOR xx=0, nmasks-1, 1 DO BEGIN                ;loop over unique entries
     curmask = masks[maskinds[xx]]              ;get current mask
     chk = where(datastruc.maskname EQ curmask) ;find all frames for a given mask
     submask = datastruc[chk]                   ;subset belonging to this mask

     flats = strmatch(submask.object, '*flat*', /FOLD_CASE)  ;find flat frames
     masknoflats = where((flats EQ 0), COMPLEMENT=maskflats) ;chk for real not flat frames
     subnoflats = submask[masknoflats]                       ;subset of non-flats
     subflats = submask[maskflats]                           ;subset of flats
     

     bands = ['Y', 'J', 'H', 'K']                                                                             ;passbands
     FOR yy=0, 3, 1 DO BEGIN                                                                                  ;loop over passbands
        bit = strcompress('*' + bands[yy] + '*', /REMOVE_ALL)                                                 ;new bit of string
        bandyes = where(strmatch(subnoflats.filter, bit, /FOLD_CASE) EQ 1)                                    ;find Y-band
        IF (bandyes[0] NE -1) THEN BEGIN                                                                      ;if passband was taken
           mynightsum[cnt].mask = strlowcase(curmask)                                                         ;set mask name
           mynightsum[cnt].band = bands[yy]                                                                   ;set band
           mynightsum[cnt].nframes = n_elements(bandyes)                                                      ;number of frames
           mynightsum[cnt].etos = total(ulong(subnoflats[bandyes].itime0)) * 1E-6                             ;set rounded time
           mynightsum[cnt].ttos = total(subnoflats[bandyes].truitime)                                         ;set truitime
           objs = subnoflats[bandyes].object                                                                  ;get object
           objs = objs[sort(objs)]                                                                            ;sort alphabetically
           objinds = uniq(objs)                                                                               ;find unique entries
           IF (n_elements(objinds) EQ 1) THEN mynightsum[cnt].obj = strlowcase(objs[objinds]) ELSE BEGIN      ;find number of unique entries 
              print, 'WARNING!! Something is slightly amiss!'                                                 ;print info
              print, '  Object name differs from MOSFIRE mask name. Keep better care of the GUI next time...' ;print info
              mynightsum[cnt].obj = strlowcase(objs[objinds[0]])                                              ;just take first one     
           ENDELSE                                                                                            ;end if more than 1 unique entry
           cnt = cnt + 1                                                                                      ;up counter
        ENDIF                                                                                                 ;end if passband was taken
     ENDFOR                                                                                                   ;end loop over pass bands

     FOR yy=0, 3, 1 DO BEGIN                                                                                  ;loop over passbands
        bit = strcompress('*' + bands[yy] + '*', /REMOVE_ALL)                                                 ;new bit of string
        bandyes = where(strmatch(subflats.filter, bit, /FOLD_CASE) EQ 1)                                      ;find Y-band
        IF (bandyes[0] NE -1) THEN BEGIN                                                                      ;if passband was taken
           mynightsum[cnt].mask = strlowcase(curmask)                                                         ;set mask name
           mynightsum[cnt].band = bands[yy]                                                                   ;set band
           mynightsum[cnt].nframes = n_elements(bandyes)                                                      ;number of frames
           mynightsum[cnt].etos = total(ulong(subflats[bandyes].itime0)) * 1E-6                               ;set rounded time
           mynightsum[cnt].ttos = total(subflats[bandyes].truitime)                                           ;set truitime
           mynightsum[cnt].flat = 1                                                                           ;set flat flag
           objs = subflats[bandyes].object                                                                    ;get object
           objs = objs[sort(objs)]                                                                            ;sort alphabetically
           objinds = uniq(objs)                                                                               ;find unique entries
           IF (n_elements(objinds) EQ 1) THEN mynightsum[cnt].obj = strlowcase(objs[objinds]) ELSE BEGIN      ;find number of unique entries 
              print, 'WARNING!! Something is slightly amiss!'                                                 ;print info
              print, '  Object name differs from MOSFIRE mask name. Keep better care of the GUI next time...' ;print info
              mynightsum[cnt].obj = strlowcase(objs[objinds[0]])                                              ;just take first one     
           ENDELSE                                                                                            ;end if more than 1 unique entry
           cnt = cnt + 1                                                                                      ;up counter
        ENDIF                                                                                                 ;end if passband was taken
     ENDFOR                                                                                                   ;end loop over pass bands
  ENDFOR                                                                                                      ;end loop over unique entries
  
  chk = where((mynightsum.mask NE '') AND (mynightsum.obj NE '') AND (mynightsum.band NE ''))
  IF chk[0] NE -1 THEN mynightsum = mynightsum[chk]
  
  RETURN, mynightsum
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirenight::glsumstruc, datastruc, nightsum

  help, datastruc, /STRUC


;;;if night already present
;;;if rerun with same night that it doesn't double add rows
;;;if tags in structure are different somehow or new tags present


  print, '  Adding summary of the night to global summary...' ;print info
  print, nightsum
  chk = file_test(nightsum)                                    ;test file's existance
  print, chk
  ndatastruc = n_elements(datastruc)
  
  IF chk NE 0 THEN BEGIN
     print, '!!!!!!!!global summary already exists'
     curglsum = mrdfits(nightsum, 1, hdr) ;read in file
     ncurglsum = n_elements(curglsum)
     print, '*******', ndatastruc, ncurglsum, (ncurglsum + ndatastruc)
     entry = curglsum[0]
     glsum = replicate(entry, (ncurglsum + ndatastruc))
     FOR xx=0, ncurglsum-1, 1 DO BEGIN
        glsum[xx] = curglsum[xx]
     ENDFOR
     FOR xx=ncurglsum, ncurglsum + ndatastruc-1, 1 DO BEGIN
        glsum[xx] = datastruc[xx-ncurglsum]
     ENDFOR
  ENDIF ELSE BEGIN
     glsum = datastruc
  ENDELSE

  RETURN, glsum
END
;====================================================================================================


;====================================================================================================
PRO mosfirenight::outputnight, outstruc, outfile

  ;;;add header with info about each column

  mwrfits, outstruc, outfile, /CREATE
  
END
;====================================================================================================


;====================================================================================================
PRO mosfirenight::outputsum, outstruc, outfile


  ;;;add columns for quality based on airmass and seeing etc
  
  mwrfits, outstruc, outfile, /CREATE
  
END
;====================================================================================================


;====================================================================================================
PRO mosfirenight::gloutputsum, outstruc, outfile


  ;;;add header with info about each night added

  mwrfits, outstruc, outfile, /CREATE
  
END
;====================================================================================================


;====================================================================================================
PRO mosfirenight::cleanup

  ;ptr_free, self.dates

RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirenight::init, datadir, outdir

  self.datadir = datadir
  self.outdir = outdir
  
RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO mosfirenight__define

  void = {mosfirenight, datadir:'', outdir:'', date:'', nexpframe:0, $
          onestruc:ptr_new(), fullstruc:ptr_new(), sumstruc:ptr_new()}

RETURN
END
;====================================================================================================
