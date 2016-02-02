;========================================================================================================================
pro mosfire_magmacat_remakecomp, master, COMPANION=companion, EXTENSION=extension, $
                                 DIRECTORY=directory, $
                                 VERBOSE=verbose, HELP=help

;+
; NAME:
;       MOSFIRE_MAGMACAT_REMAKECOMP()
;
; PURPOSE:
;       Remake the .FITS format companion catalog to a MAGMA .txt
;       format catalog. All the same info but with RA, Dec given in
;       degrees rather than sexigesimal.            
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
;       A. DeGroot, 2014 Aug 8, Univ. Cali, Riverside v2.0.0
;          -added abilty of southern hemisphere coordinates i.e. Dec < 0
;
; DESIRED UPGRADES
;     
;
;-
  version = '2.0.0'

  check_dir, 1                                                                    ;force file to compile
  IF keyword_set(EXTENSION) THEN extension = extension[0] ELSE extension = '.txt' ;set new value
  IF keyword_set(COMPANION) THEN companion = companion[0] ELSE BEGIN              ;set new value
     companion = master                                                           ;copy input
     strreplace, companion, extension, '.fits'                                    ;alter extension
     IF companion EQ master THEN BEGIN                                            ;if name hasn't changed
        print, 'WARNING!! Expected .txt extension for input file.'                ;print info 
        print, '  Please supply extension using EXTENSION keyword!'               ;print info
        stop                                                                      ;stop program
     ENDIF                                                                        ;end if name unchanged
  ENDELSE                                                                         ;end COMPANION keyword
  IF keyword_set(DIRECTORY) THEN BEGIN                                            ;if DIRECTORY keyword set
     check_indir, directory, master                                               ;append directory
     companion = strcompress(directory + companion, /REMOVE_ALL)                  ;append directory
  ENDIF                                                                           ;end DIRECTORY keyword


  ;;;read in master cat
  readcol, master, id1, priority1, jmag1, rah1, ram1, ras1, $                                                       ;cont next line
           decd1, decm1, decs1, epoch1, equi1, thing1, thing2, FORMAT='(a,i,f,f,f,f,f,f,f,f,f,i,i)'                 ;read in text file 
  struct = {id:'obj0', priority:12, jmag:20.0, ra:20.0, dec:35.0, epoch:2000.0, equinox:2000.0, thing1:0, thing2:0} ;make structure
  stru = replicate(struct, n_elements(id1))                                                                         ;replicate structure
  

  ;;;checks
  north = where(decd1 GT 0.0, COMPLEMENT=south) ;find northern vs southern hemisphere
  
  ;;;fill structure
  stru[*].id = id1                                                                             ;fill structure
  stru[*].priority = priority1                                                                 ;fill structure
  stru[*].ra = (rah1*15.0) + (ram1*0.25) + (ras1*((1.0)/(240.0)))                              ;convert and fill structure
  IF north[0] NE -1 THEN stru[north].dec = decd1 + (decm1*(1.0/60.0)) + (decs1*((1.0/3600.0))) ;convert and fill structure
  IF south[0] NE -1 THEN stru[south].dec = decd1 - (decm1*(1.0/60.0)) - (decs1*((1.0/3600.0))) ;convert and fill structure
  stru[*].jmag =jmag1                                                                          ;fill structure
  stru[*].epoch = epoch1                                                                       ;fill structure
  stru[*].equinox = equi1                                                                      ;fill structure
  stru[*].thing1 = thing1                                                                      ;fill structure
  stru[*].thing2 =thing2                                                                       ;fill structure
  IF keyword_set(HELP) THEN help, stru, /STRUC                                                 ;offer help

  
  ;;;write file
  mwrfits, stru, companion, /CREATE ;write the file


END
;========================================================================================================================
