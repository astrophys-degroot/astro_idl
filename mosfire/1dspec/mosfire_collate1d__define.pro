;+
; NAME:
;       mosfire_collate1d()
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
PRO mosfire_collate1d::getprop, MCOOBJVER=mcoobjver

  IF arg_present(MCOOBJVER) THEN mcoobjver = self.mcoobjver ;return the data

  RETURN
END
;====================================================================================================



;========================================================================================================================
FUNCTION mosfire_collate1d::intersetup


  value = ''                                                ;reset
  bit = strcompress('['+ string(xmask)+']', /REMOVE_ALL)    ;string up value
  read, value, PROMPT = '  Mask name? ' + bit + ' '         ;prompt
  IF value EQ '' THEN xmask = xmask ELSE xmask = value      ;store new value


  RETURN, 1
END
;========================================================================================================================


;========================================================================================================================
FUNCTION mosfire_collate1d::makebase, wbase


  CASE wbase OF 
     1 : catbase = {rah:0, ram:0, ras:0.0, decd:0, decm:0, decs:0.0}
     2 : catbase = {ra:0.0D, dec:0.0D, rah:0, ram:0, ras:0.0D, decd:0, decm:0, decs:0.0D, $
                    mask:'string', Z:-99.99, dZ:-99.99, MOBINSLIT:0}
     ELSE : BEGIN
        print, 'WARNING!! Base type not understood!! Please pick another!!'
        print, '  Choices are: 1, or 2 '
     ENDELSE
  ENDCASE

  RETURN, catbase
END
;========================================================================================================================


;========================================================================================================================
FUNCTION mosfire_collate1d::findspectra


  ;;;create list of 1D spectra
  print, 'ls ' + self.maskname + '*' + self.specvers + '*.fits > tmp.txt' ;line to spawn 
  spawn, 'ls ' + self.maskname + '*' + self.specvers + '*.fits > tmp.txt' ;populate file

  ;;;Read in spectra list
  bit = ' '                       ;intialize
  nspec = file_lines('tmp.txt')   ;find number of spectra
  spectra = strarr(nspec)         ;make array for names
  openr, lun, 'tmp.txt', /GET_LUN ;open file to read
  FOR xx=0, nspec-1, 1 DO BEGIN   ;loop over file
     readf, lun, bit              ;read line from file
     spectra[xx] = bit            ;store file
  ENDFOR                          ;end loop over array
  close, lun                      ;close file
  free_lun, lun                   ;free file memory unit
  

  ;;;storage and cleanup
  self.specnames = ptr_new(spectra) ;store spec names
  self.nspec = nspec                ;number of spectra
  
  spawn, 'rm tmp.txt'           ;delete the temp file 
  
  RETURN, nspec
END
;========================================================================================================================


;====================================================================================================
PRO mosfire_collate1d::makecat, WBASE=wbase


  IF keyword_set(WBASE) THEN wbase = fix(wbase[0]) ELSE wbase = 1 ;set default


  IF self.interactive EQ 1 THEN BEGIN
     chk = self.intersetup()
  ENDIF ELSE BEGIN
 
  ENDELSE

  print, ' '                                              ;spacer
  print, '************Run Parameters********************' ;print info
  print, ' Interative setup: ', self.interactive          ;print info
  print, ' Base structure type: ', wbase                  ;print info
  print, ' Mask name: ', self.maskname                    ;print info
  print, ' Spectra version to collate: ', self.specvers   ;print info
  print, '**********************************************' ;print info

  base = self.makebase(wbase)   ;make base structure
  help, base, /STRUC
  nspec = self.findspectra()    ;find the spectra to collate
  


  RETURN
END
;====================================================================================================


;====================================================================================================
PRO mosfire_collate1d::cleanup

  ptr_free, self.specnames

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfire_collate1d::init, INTERACTIVE=interactive, $
                                  MASKNAME=maskname, MASKDIR=maskdir, SPECVERS=specvers                            
  

  self.mcoobjver = 'v0-1-0'                                                                         ;code version
  IF keyword_set(INTERACTIVE) THEN self.interactive = fix(interactive[0]) ELSE self.interactive = 0 ;set default
  IF keyword_set(MASKNAME) THEN self.maskname = string(maskname[0]) ELSE self.maskname = ''         ;set default
  IF keyword_set(MASKDIR) THEN self.maskdir = string(maskdir[0]) ELSE self.maskdir = ''             ;set default
  IF keyword_set(SPECVERS) THEN self.specvers = string(specvers[0]) ELSE self.specvers = 'v10'      ;set default
  
 
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO mosfire_collate1d__define

  void = {mosfire_collate1d, mcoobjver:'A', INTERACTIVE:1, $
          MASKNAME:'A', MASKDIR:'A', SPECVERS:'A', $
          SPECNAMES:ptr_new(), NSPEC:0}

  RETURN
END
;====================================================================================================

