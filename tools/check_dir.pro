;========================================================================================================================
pro check_indir, dir, file, NOTE=note, VERBOSE=verbose
  
;+
; NAME:
;       CHECK_INDIR()
;
; PURPOSE:      
;       This program takes a directory and a file name First directory
;       is checked for validity. If directory is valid the program looks for the
;       file in said directory. If file is found in directory then
;       the directory is prefixed to the file name. If file is not
;       found in directory, file is looked for locally. If file found
;       locally then no change to the file name occurs. If file is not
;       found locally program quits with an error message. 
;
; CALLING SEQUENCE:
;
; INPUTS:
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;       note : name of keyword of directory that was given to be searched
;       verbose: interger value of 0, 1, 2 or 3 indicated how much you
;               want printed to screen during runtime
;
; COMMON BLOCKS:
;       NONE
;
; PROCEDURES USED:
;
; COMMENTS:
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2013 Sept 24th, Univ. Cali, Riverside v2.1.0
;
; DESIRED UPGRADES
;
;-


  if keyword_set(NOTE) then note = note[0] else note = ' ' ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value

  direx = file_test(dir, /DIRECTORY)                                                         ;test directory name
  case direx of                                                                              ;check name
     1: BEGIN                                                                                ;if directory exists
        line = strcompress('  ' + note + ' valid!')                                          ;line 
        if verbose ge 3 then print, line                                                     ;if name is valid
     END                                                                                     ;end if dir exists
     else: BEGIN                                                                             ;if directory doesn't exist
        line = strcompress('  ' + note + ' keyword set but DIR path not valid!!')            ;line
        if verbose ge 1 then print, line                                                     ;if name is not valid
     END                                                                                     ;if directory doesn't exist
  endcase                                                                                    ;end check name
  fileex = file_test(strcompress(dir + file, /REMOVE_ALL))                                   ;text file name
  case fileex of                                                                             ;check name
     1 : begin                                                                               ;if name exist
        line = strcompress('   File found in location ' + note + '!! Proceeding!!' )         ;line
        if verbose ge 2 then print, line                                                     ;if name is valid
        file = strcompress(dir + file, /REMOVE_ALL)                                          ;sets new name
     end                                                                                     ;end if name exists
     else : begin                                                                            ;if name doesn't exist
        line = strcompress('   File not found in location ' + note + '!! Checking locally:') ;line
        if verbose ge 2 then print, line                                                     ;print info
        fileex2 = file_test(file)                                                            ;new test file name
        case fileex2 of                                                                      ;check new name
           1 : if verbose ge 2 then print, '   File found locally!! Proceeding!!'            ;print info
           else : begin                                                                      ;if name not found
              print, '   File not found locally!! Please supply correct path/name of file!!' ;print info
              print, '    File we are looking for: ', file                                   ;print info
              stop                                                                           ;stops program
           end                                                                               ;end if name not found
        endcase                                                                              ;end check new name
     end                                                                                     ;end if name doesnt exist
  endcase                                                                                    ;end check file name
  
end                             ;end program
;========================================================================================================================
   


;========================================================================================================================
pro check_outdir, dir, outchk, VERBOSE=verbose 

  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value
  
  direx = file_test(dir, /DIRECTORY)                                                     ;test directory
  case direx of                                                                          ;check test
     1: begin                                                                            ;if test passes
        if verbose ge 3 then print, ' OUTDIR directory valid!'                           ;print info
        outchk = 1                                                                       ;set flag to yes
     end                                                                                 ;end if test passes
     else: BEGIN                                                                         ;if dir not valid
        if verbose ge 1 then print, ' OUTDIR keyword set but OUTDIR path not valid!!'    ;print info
        outchk = 0                                                                       ;set flag to no
     END                                                                                 ;end if dir not valid
  endcase                                                                                ;end check test
  
end                             ;end program
;========================================================================================================================



;========================================================================================================================
pro check_dir, values, VERBOSE=verbose

  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value

  if verbose LE 1 THEN print, ' Compiling routines in check_dir.pro'
  
end
;========================================================================================================================
