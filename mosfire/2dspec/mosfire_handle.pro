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

  
  mynight = obj_new('mosfirenight', dir_with_rawdata, dir_for_output)            ;create a new object
  chk = mynight.exist()                                                          ;check if directory is valid
  IF chk NE 1 THEN BEGIN                                                         ;if directory not valid
     print, 'WARNING!! The claimed directory containing raw data is not valid!!' ;print info
     stop                                                                        ;stop the run
  END                                                                            ;end if directory not valid


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

