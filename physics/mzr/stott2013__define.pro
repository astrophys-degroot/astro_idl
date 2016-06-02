;+
; NAME:
;       STOTT2013()
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
;       A. DeGroot, 2016 May 23, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO stott2013::getprop, ST13OBJVER=st13objver, N2DATA=n2cldata, $
                        MZRDATA=mzrdata

  IF arg_present(ST13OBJVER) THEN st13objver = self.st13objver ;return tst data
  IF arg_present(N2DATA) THEN n2data = *self.st13n2data        ;return tst data
  IF arg_present(MZRDATA) THEN mzrdata = *self.st13mzrdata     ;return tst data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION stott2013::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION stott2013::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO stott2013::boxscore


  self.st13sampsize = 103       ;sample size
  self.st13IMF = 'chabrier2003' ;IMF choice
  self.st13SEDfit = 'FAST'      ;
  self.st13SEDmodels = 'bc03'   ;
  self.st13mzrtype = 'N2'       ;MZR conversion type
  self.st13mzrconvert = 'PP04'  ;converted to O/H by
  self.st13selection = ''       ;sample selection
  self.st13z = 1.15             ;minimum redshift
  self.st13zmin = 0.84          ;minimum redshift
  self.st13zmax = 1.47          ;maximum redshift

  self.st13N2data = ptr_new({xsmod:[9.25,9.75,10.25,10.75], $   ;
                             xserrmodn:[0.25,0.25,0.25,0.25], $ ;
                             xserrmodp:[0.25,0.25,0.25,0.25], $ ;
                             xserrmod:[0.25,0.25,0.25,0.25], $  ;
                             ys:[8.49,8.66,8.63,8.58], $        ;
                             yserrn:[0.05,0.05,0.05,0.07], $    ;
                             yserrp:[0.05,0.05,0.05,0.07], $    ;
                             yserr:[0.05,0.05,0.05,0.07], $     ;
                             ul:[0,0,0,0], $                    ;
                             ngal:[19,35,32,17] })              ;
  
  self.st13mzrdata = ptr_new({xsmod:[9.25,9.75,10.25,10.75], $   ;
                              xserrmodn:[0.25,0.25,0.25,0.25], $ ;
                              xserrmodp:[0.25,0.25,0.25,0.25], $ ;
                              xserrmod:[0.25,0.25,0.25,0.25], $  ;
                              ys:[8.49,8.66,8.63,8.58], $        ;
                              yserrn:[0.05,0.05,0.05,0.07], $    ;
                              yserrp:[0.05,0.05,0.05,0.07], $    ;
                              yserr:[0.05,0.05,0.05,0.07], $     ;
                              ul:[0,0,0,0], $                    ;
                              ngal:[19,35,32,17] })              ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO stott2013::cleanup

  ptr_free, self.st13N2data 
  ptr_free, self.st13mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION stott2013::init

  self.st13objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO stott2013__define

  void = {stott2013, st13objver:'A', $
          st13sampsize:0, $
          st13z:0.0, st13zmin:0.0, st13zmax:0.0, $
          st13IMF:'A', st13SEDfit:'A', st13SEDmodels:'A', st13mzrtype:'A', st13mzrconvert:'A', $
          st13selection:'A', $
          st13N2data:ptr_new(), st13mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

