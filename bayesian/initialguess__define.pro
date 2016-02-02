;+
; NAME:
;       initialguess()
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
;       A. DeGroot, 2015 Nov 1, Univ. Cali, Riverside v1-1-0
;           -added NOREDSHIFT keyword to DECIPHER module
;
;
;
; DESIRED UPGRADES
;
;     
;
;-

;====================================================================================================
PRO initialguess::getprop, INITGSS=initgss

  IF arg_present(INITGSS) THEN initgss = *self.igs_initgss ;return the data

  RETURN
END
;====================================================================================================



;====================================================================================================
FUNCTION initialguess::upgradebase, xbase, xnfeat, xborder 


  ;;;deal with BORDER first
  IF xborder GT 1 THEN BEGIN
     CASE xborder OF
        2 : add_tags, xbase, ['X1'], ['0.0D'], xbasea
        3 : add_tags, xbase, ['X1', 'X2'], ['0.0D', '0.0D'], xbasea
        4 : add_tags, xbase, ['X1', 'X2', 'X3'], ['0.0D', '0.0D', '0.0D'], xbasea
        5 : add_tags, xbase, ['X1', 'X2', 'X3', 'X4'], ['0.0D', '0.0D', '0.0D', '0.0D'], xbasea
        ELSE : BEGIN
           print, 'WARNING!! Something has gone horribly wrong!!'
           stop
        END
     ENDCASE
  ENDIF ELSE xbasea = xbase
  

  ;;;deal with XNFEAT second
  IF xnfeat GT 1 THEN BEGIN
     FOR xx=1, xnfeat-1, 1 DO BEGIN
        bita = strcompress('sig' + string(xx+1), /REMOVE_ALL)
        bitb = strcompress('c' + string(xx+1), /REMOVE_ALL)
        add_tags, xbasea, [bita, bitb], ['0.0D','0.0D'], xbaseoff
        xbaseb = xbaseoff
        xbaseoff = 0
        xbasea = xbaseb
     ENDFOR
  ENDIF ELSE xbaseb = xbasea
  
  RETURN, xbaseb
END
;====================================================================================================

  

;====================================================================================================
FUNCTION initialguess::makeiguess, xupgrade, xguesses, xnfeat, VERBOSE=verbose


  IF keyword_set(VERBOSE) THEN verbose = fix(verbose[0]) ELSE verbose = 3 ;set default value


  FOR xx=n_elements(xguesses)-1, 0, -1 DO BEGIN
     bits = strsplit(xguesses[xx], '=', /EXTRACT)
     CASE bits[0] OF
        'sig' : BEGIN
           IF verbose GE 2 THEN print, '  Using same initial sigma guess for all features.'
           FOR yy=0, xnfeat-1, 1 DO BEGIN
              bit = strcompress(bits[0] + string(yy+1), /REMOVE_ALL)
              tmp = tagind(xupgrade, bit, NOTE='Initial guess not understood!')
              xupgrade.(tmp) = float(bits[1])
           ENDFOR
        END
        'c' : BEGIN
           IF verbose GE 2 THEN print, '  Using same initial flux guess for all features.'
           FOR yy=0, xnfeat-1, 1 DO BEGIN
              bit = strcompress(bits[0] + string(yy+1), /REMOVE_ALL)
              tmp = tagind(xupgrade, bit, NOTE='Initial guess not understood!')
              xupgrade.(tmp) = float(bits[1])
           ENDFOR
        END
        ELSE : BEGIN
           tmp = tagind(xupgrade, bits[0], NOTE='Initial guess not understood!')
           xupgrade.(tmp) = float(bits[1])
        END
     ENDCASE
  ENDFOR  
  
  RETURN, xupgrade
END
;====================================================================================================



;====================================================================================================
FUNCTION initialguess::decipher, xfeat, xborder, NOREDSHIFT=noredshift

  
 
  ;;;set up storage i.e. determine number of variables
  txtgss = *self.igs_initgss                                                  ;get values
  nfeat = n_elements(xfeat)                                                   ;# of features
  IF keyword_set(NOREDSHIFT) THEN base = {x0:0.0D, sig1:0.0D, c1:0.0D} ELSE $ ;cont next line
     base = {x0:0.0D, redshift:0.0D, sig1:0.0D, c1:0.0D}                      ;start the structure
  upgrade = self.initialguess::upgradebase(base, nfeat, xborder)              ;beef up the structure
  iguess = self.initialguess::makeiguess(upgrade, txtgss, nfeat)              ;put in guesses


  RETURN, iguess
END
;====================================================================================================


;====================================================================================================
FUNCTION initialguess::undecipher, xguess

  
  tags = tag_names(xguess)                                            ;tag names
  ntags = n_elements(tags)                                            ;find number of initial guesses
  FOR xx=0, ntags-1, 1 DO BEGIN                                       ;loop over init guesses
     bit = strcompress(tags[xx] + '=' + string(xguess.(xx)), /REMOVE_ALL) ;bit to add
     IF (xx NE 0) THEN txtguess = [txtguess, bit] ELSE txtguess = bit ;start array
  ENDFOR                                                              ;end loop over init guesses
  

  RETURN, txtguess
END
;====================================================================================================



;====================================================================================================
PRO initialguess::cleanup

  ptr_free, self.initgss

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION initialguess::init, initgss                          
  
  self.igs_objver = 'v1-1-0'          ;code version
  self.igs_initgss = ptr_new(initgss) ;store text string
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO initialguess__define

  void = {initialguess, igs_objver:'A', igs_initgss:ptr_new()}

  RETURN
END
;====================================================================================================

