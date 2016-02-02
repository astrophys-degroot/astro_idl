;========================================================================================================================
pro newcluster, name, field, DIR=dir, $
                VERBOSE=verbose

;+
; NAME:
;       NEWCLUSTER()
;
; PURPOSE:
;       Create the organization structure for a new cluster.     
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
;       A. DeGroot, 2014 Aug 8, Univ. Cali, Riverside v1.2.0
;          -added yet more subfolders
;       A. DeGroot, 2014 Aug 8, Univ. Cali, Riverside v1.1.0
;          -added more subfolders
;       A. DeGroot, 2014 Aug 7, Univ. Cali, Riverside v1.0.0
;          -first creation
;
; DESIRED UPGRADES
;     -want to make it create folders that dont exist and leave the
;     ones that do
;
;-
  version = '1.2.0'



  IF keyword_set(DIR) THEN dir = dir[0] ELSE dir = '~/research/clusters/' ;set new value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1      ;set new value
  

  ;;;Make sure field is correct
  field = strlowcase(field)                                                        ;make sure its all lower case
  CASE field OF                                                                    ;check field name
     'en1' : IF verbose GE 1 THEN print, ' Field is ELAIS N1'                      ;print info
     'en2' : IF verbose GE 1 THEN print, ' Field is ELAIS N2'                      ;print info
     'es1' : IF verbose GE 1 THEN print, ' Field is ELAIS S1'                      ;print info
     'lockman' : IF verbose GE 1 THEN print, ' Field is Lockman'                   ;print info
     'xmm' : IF verbose GE 1 THEN print, ' Field is XMM'                      ;print info
     'cdfs' : IF verbose GE 1 THEN print, ' Field is CDFS'                         ;print info
     ELSE : BEGIN                                                                  ;if no match
        print, 'WARNING!! Field was not recognized!'                               ;print info
        print, ' Current fields are "en1", "en2", "es1", "lockman", "xmm", "cdfs"' ;print info
     END                                                                           ;end if no match
  ENDCASE                                                                          ;end check field name

  ;;;get directory set
  dir = strcompress(dir + field + '/', /REMOVE_ALL)            ;concatenate directory
  chk = file_test(dir, /DIRECTORY)                             ;chk existance
  IF chk EQ 0 THEN BEGIN                                        ;if dir doesnt exist
     print, 'WARNING!! Directory search failed!!'              ; print info
     stop                                                      ;stop routine
  ENDIF                                                        ;end dir doesnt exist

  ;;;see if cluster folders already created
  cdir = strcompress(dir + name + '/', /REMOVE_ALL)     ;concatenate directory
  chk = file_test(cdir, /DIRECTORY)                     ;chk existance
  IF chk EQ 1 THEN BEGIN                                ;if dir doesnt exist
     print, 'WARNING!! Cluster folder already exists!!' ;print info
     print, ' Look harder!!'                            ;print info
     stop                                               ;stop routine
  ENDIF                                                 ;end dir doesnt exist
  

  ;;;If we make it this far we make some folders
  spawn, 'mkdir ' + cdir                         ;make parent folder
  sub = strcompress(cdir + 'images_safe')        ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'auxiliary')          ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'images_extra')       ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'catalogs')           ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'spectroscopy')       ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'spectroscopy/masks') ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'spectroscopy/data')  ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'graphics')           ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'regions')            ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'swarp')              ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'sextractor')         ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'runhere')            ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'photo-zs')           ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'sed-fitting')        ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder
  sub = strcompress(cdir + 'multimap')           ;sub folder
  spawn, 'mkdir ' + sub                          ;make sub folder

  


END
;========================================================================================================================
