;========================================================================================================================
PRO MOSFIRE_HANDLE, date, DIR_WITH_RAWDATA=dir_with_rawdata, DIR_FOR_OUTPUT=dir_for_output


;+
; NAME:
;       MOSFIRE_HANDLE()
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
;-
  version = '1-0-0'



  outfilestruc = 'template_mosfirecompiled_v1.fits' ;template name
  gloutfilestruc = 'global_mosfirecompiled_v1.fits' ;fixed name
  outfilesum = 'template_mosfiresummary_v1.fits'    ;template name
  gloutfilesum = 'global_mosfiresummary_v1.fits'    ;fixed name

  


  ;;;check formats and find data
  chk = mynight.date(SPECDATE=date)                    ;get which date to handle 
  mynight.getprop, DATADIR=curdatadir, DATE=curdate    ;set properties
  curtemp = mynight.tempfile(curdate)                  ;find expected file name structur
  mynight.finddata, curdatadir, curtemp, curdate       ;find the files
  mynight.getprop, DATADIR=curdatadir                  ;get the new property value
  mynight.nexpframe, curdatadir, curtemp               ;first guess at number of frames
  mynight.getprop, NEXPFRAME=nframe                    ;set the property
  print, ' Number of frames found to handle: ', nframe ;print info

  ;;;make summary for just this night
  templatestruc = mynight.onestruc(curdatadir, curtemp, curdate) ;create structure to fill
  mynight.setprop, ONESTRUC=templatestruc                        ;save template structure
  outstruc = mynight.fillstruc(curdatadir, curtemp, curdate)     ;fill structure
  mynight.setprop, FULLSTRUC=outstruc                            ;save filled structure

  strreplace, outfilestruc, 'template_', curdate                         ;give date instead of template
  outfilestruc = strcompress(dir_for_output + outfilestruc, /REMOVE_ALL) ;append directory
  mynight.outputnight, outstruc, outfilestruc                            ;save compilation structure

  outsum = mynight.sumstruc(outstruc, curdate)                       ;summarize outstruc
  mynight.setprop, SUMSTRUC=outsum                                   ;save filled structure
  strreplace, outfilesum, 'template_', curdate                       ;give date instead of template
  outfilesum = strcompress(dir_for_output + outfilesum, /REMOVE_ALL) ;append directory
  mynight.outputsum, outsum, outfilesum                              ;save summary structure
  
  gloutfilesum = strcompress(dir_for_output + gloutfilesum, /REMOVE_ALL) ;append directory
  gloutsum = mynight.glsumstruc(outsum, gloutfilesum)                    ;add to global summarize structure
  mynight.gloutputsum, gloutsum, gloutfilesum                            ;save summary structure



END
;========================================================================================================================



;====================================================================================================
PRO mosfirehandle::getprop, MHAOBJVER=mhaobjver, DIRRAWDATA=dirrawdata, DIROUTPUT=diroutput

  IF arg_present(MHAOBJVER) THEN mhaobjver = self.mhaobjver    ;return the value
  IF arg_present(DIRRAWDATA) THEN dirrawdata = self.dirrawdata ;return the value
  IF arg_present(DIROUTPUT) THEN diroutput = self.diroutput    ;return the value
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirehandle::grandfile


  pass = ''                                                          ;start pass as yes
  xchk = file_test(self.diroutput, /DIRECTORY)                       ;test output directory
  pass = (xchk EQ 1) ? '' : 'WARNING!! Output directory not valid!!' ;if test passed

  folder = strcompress(self.diroutput + '/summaries/', /REMOVE_ALL)                 ;folder for summaries
  xchk = file_test(folder, /DIRECTORY)                                              ;test output directory
  IF (xchk EQ 0) THEN spawn, 'mkdir ' + folder                                      ;create folder
  self.dirsumoutput = folder                                                        ;save folder
  xchk = file_test(folder, /DIRECTORY)                                              ;test output directory
  pass = (xchk EQ 1) ? '' : 'WARNING!! Unable to create summary output directory!!' ;if test passed

  
  RETURN, pass
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirehandle::findraw, DATESUB=datesub


  pass = ''                                                            ;start pass as yes
  self.datadir = self.dirrawdata                                       ;pass raw data dir
  self.outdir = self.diroutput                                         ;pass output dir
  xchk = self.exist()                                                  ;check if directory is valid
  pass = (xchk EQ 1) ? '' : 'WARNING!! Raw data directory not valid!!' ;if test passed

  IF keyword_set(DATESUB) THEN BEGIN                                                                        ;keyword set for date subdir
     xchk = self.date(SPECDATE=datesub)                                                                     ;get which date to handle 
     pass = (xchk EQ '') ?  strcompress('WARNING!! Raw data subdirectory ' + datesub + ' not valid!!') : '' ;if test passed
  ENDIF                                                                                                     ;end date subdir

  RETURN, pass
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirehandle::onenight, xcurdate, xcurtemp

  COMPILE_OPT IDL2

  pass = ''
  
  ;;;make compilation for just one night
  templatestruc = self.onestruc(self.datadir, xcurdate, xcurtemp)           ;create structure to fill
  outstruc = self.fillstruc(self.datadir, xcurdate, xcurtemp)               ;fill structure
  outindivcomp = self.comptemplate                                          ;template name
  strreplace, outindivcomp, '?????', xcurdate                               ;give date instead of template
  strreplace, outindivcomp, '&&&&&', self.indivver                          ;give version instead of template
  outindivcomp = strcompress(self.dirsumoutput + outindivcomp, /REMOVE_ALL) ;append directory
  self.outputnight, outstruc, outindivcomp                                  ;save compilation structure


  ;;;make summary for just one night
  outsum = self.sumstruc(outstruc, xcurdate)                              ;summarize outstruc
  outindivsum = self.sumtemplate                                          ;template name
  strreplace, outindivsum, '?????', xcurdate                              ;give date instead of template
  strreplace, outindivsum, '&&&&&', self.indivver                         ;give version instead of template
  outindivsum = strcompress(self.dirsumoutput + outindivsum, /REMOVE_ALL) ;append directory
  self.outputsum, outsum, outindivsum                                     ;save summary structure


  xchk = file_test(outindivcomp)                                                  ;test output directory
  pass = (xchk EQ 1) ? '' : 'WARNING!! Individual compilation file not written!!' ;if test passed
  xchk = file_test(outindivsum)                                                   ;test output directory
  pass = (xchk EQ 1) ? '' : 'WARNING!! Individual summary file not written!!'     ;if test passed


  RETURN, pass
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirehandle::allnights, xfileflag

  
  pass = ''

  xdates = *self.dates                                                        ;
  first = 1                                                                   ;flag first file
  FOR xx=0, n_elements(xfileflag)-1, 1 DO BEGIN                               ;loop over nights
     addfile = self.sumtemplate                                               ;template name
     strreplace, addfile, '?????', xdates[xx]                                 ;give date instead of template
     strreplace, addfile, '&&&&&', self.globver                               ;give version instead of template
     IF xfileflag[xx] EQ 1 THEN BEGIN                                         ;if file should exist
        print, ' Now attempting to add in file: ', addfile                    ;print info
        addfile = strcompress(self.dirsumoutput + addfile, /REMOVE_ALL)       ;append directory
        data = mrdfits(addfile, 1, hdr, /SILENT)                              ;read in file
        IF (first NE 1) THEN BEGIN                                            ;if not first file
           glout = [glout, data]                                              ;concatenate
        ENDIF ELSE BEGIN                                                      ;if first file
           glout = data                                                       ;capture first file
           first = 0                                                          ;turn off flag
        ENDELSE                                                               ;end if first file
     ENDIF ELSE BEGIN                                                         ;if file shouldnt exist
        print, ' Skipping attempt to add in file (shouldnt exist): ', addfile ;print info
     ENDELSE                                                                  ;end file shouldnt exist
  ENDFOR                                                                      ;end loop over nights


  outglsum = self.sumtemplate                                       ;template name
  strreplace, outglsum, '?????', 'global'                           ;give date instead of template
  strreplace, outglsum, '&&&&&', self.globver                       ;give version instead of template
  outglsum = strcompress(self.dirsumoutput + outglsum, /REMOVE_ALL) ;append directory
  self.gloutputsum, glout, outglsum                                 ;save summary structure

  xchk = file_test(outglsum)                                                  ;test output directory
  pass = (xchk EQ 1) ? '' : 'WARNING!! Global summary file not written!!'     ;if test passed


  RETURN, pass
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirehandle::go


  continuation = 1              ;continue

  ;;;overall file structure
  IF continuation EQ 1 THEN chk1 = self.grandfile() ELSE chk1 = 1 ;grand file tree
  IF (chk1 EQ '') THEN a = 1 ELSE BEGIN                           ;if check fails
     print, chk1                                                  ;print error message
     continuation = 0                                             ;start skipping run
  ENDELSE                                                         ;end check fails
  
  ;;;raw data dir search
  IF continuation EQ 1 THEN chk2 = self.findraw() ELSE chk2 = 1 ;find raw data
  IF (chk2 EQ '') THEN a = 1 ELSE BEGIN                         ;if check fails
     print, chk2                                                ;print error message
     continuation = 0                                           ;start skipping run
  ENDELSE                                                       ;end check fails

  ;;;raw data subdir search
  xdates = *self.dates                            ;get dates info
  ndates = n_elements(xdates)                     ;how many night to handle
  IF continuation EQ 1 THEN BEGIN                 ;if we continue
     FOR xx=0, ndates-1, 1 DO BEGIN               ;loop over dates
        chk3 = self.findraw(DATESUB = xdates[xx]) ;find raw data
        IF (chk3 EQ '') THEN a = 1 ELSE BEGIN     ;if check fails
           print, chk3                            ;print error message
           continuation = 0                       ;start skipping run
        ENDELSE                                   ;end check fails
     ENDFOR                                       ;end loop over dates
  ENDIF                                           ;end if we continue
  
  IF (continuation EQ 1) THEN BEGIN                  ;if we continue
     fileflag = intarr(ndates)                       ;flag array
     run = 1                                         ;flag 
     cnt = 0                                         ;counter
     WHILE ((run EQ 1) AND (cnt LT ndates)) DO BEGIN ;start looping

        ;;;characterize night
        curtemp = self.tempfile(xdates[cnt])                           ;find expected file name structur
        self.finddata, self.dirrawdata, xdates[cnt], curtemp           ;find the files
        self.nexpframe, self.datadir, curtemp                          ;first guess at number of frames
        print, ' For night: ', xdates[cnt]                             ;print info
        print, '   Number of frames found to handle: ', self.nexpframe ;print info

        ;;;one night structure
        chk4 = self.onenight(xdates[cnt], curtemp)        ;summary for one night
        IF (chk4 EQ '') THEN fileflag[cnt] = 1 ELSE BEGIN ;if check fails
           print, chk4                                    ;print error message
        ENDELSE                                           ;end check fails
        
        cnt = cnt + 1                              ;up counter
     ENDWHILE                                      ;end loop
     continuation = (total(fileflag) NE 0) ? 1 : 0 ;if we continue
  ENDIF                                            ;end if we continue


  ;;;global summary
  IF (continuation EQ 1) THEN BEGIN ;if we continue
     
     ;;;all nights summary structure
     chk5 = self.allnights(fileflag)       ;summary for one night
     IF (chk5 EQ '') THEN a = 1 ELSE BEGIN ;if check fails
        print, chk5                        ;print error message
        continuation = 0                   ;do we continue
     ENDELSE                               ;end check fails
  ENDIF                                    ;end if we continue


 
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO mosfirehandle::cleanup

  ptr_free, self.dates

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfirehandle::init, dates, DIRRAWDATA=dirrawdata, DIROUTPUT=diroutput, $
                              INDIVVER=indivver, GLOBVER=globver


  self.mhaobjver = 'v1-0-0'                                                                          ;object version
  self.dates = ptr_new(dates)                                                                        ;store dates
  IF keyword_set(DIRRAWDATA) THEN self.dirrawdata = string(dirrawdata[0]) ELSE self.dirrawdata = ' ' ;store dates
  IF keyword_set(DIROUTPUT) THEN self.diroutput = string(diroutput[0]) ELSE self.diroutput = ' '     ;store dates
  IF keyword_set(INDIVVER) THEN self.indivver = string(indivver[0]) ELSE self.indivver = 'v2-0'      ;store dates
  IF keyword_set(GLOBVER) THEN self.globver = string(globver[0]) ELSE self.globver = 'v2-0'          ;store dates
  self.comptemplate = '?????_mosfirecompiled_&&&&&.fits'                                             ;store dates
  self.sumtemplate = '?????_mosfiresummary_&&&&&.fits'                                               ;store dates
  
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO mosfirehandle__define

  void = {mosfirehandle, inherits mosfirenight, mhaobjver:'A', dates:ptr_new(), $
          DIRRAWDATA:'A', DIROUTPUT:'A', DIRSUMOUTPUT:'A', $
          INDIVVER:'A', GLOBVER:'A', $
          SUMTEMPLATE:'A', COMPTEMPLATE:'A'}

  RETURN
END
;====================================================================================================
