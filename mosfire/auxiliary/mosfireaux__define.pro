;+
; NAME:
;       TRAN2015()
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
;       A. DeGroot, 2016 June 4, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-
;====================================================================================================
PRO mosfireaux::setprop, DATADIR=datadir

  IF keyword_set(DATADIR) THEN self.datadir = datadir                ;set the data

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO mosfireaux::getprop, DATADIR=datadir

  IF arg_present(DATADIR) THEN datadir = self.datadir       ;return the data
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfireaux::exist, MAKEOUTDIR=makeoutdir


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
PRO mosfireaux::cleanup

  ;ptr_free, self.dates

RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfireaux::init, DATADIR=datadir

  IF keyword_set(DATADIR) THEN datadir = string(datadir[0]) ELSE datadir = ''

  self.tr15objver = 'v0-1-0'
  self.datadir = datadir
  
RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO mosfireaux__define

  void = {mosfireaux, mosaux_aobjver:'A'$
          datadir:''}

RETURN
END
;====================================================================================================
