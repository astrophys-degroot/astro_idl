;+
; NAME:
;       HENRY2013()
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
PRO henry2013::getprop, HE13OBJVER=he13objver, N2CLDATA=n2cldata, N2FIELDDATA=n2fielddata, $
                        MZRDATA=mzrdata

  IF arg_present(HE13OBJVER) THEN he13objver = self.he13objver         ;return the data
  IF arg_present(N2CLDATA) THEN n2cldata = *self.he13n2cldata          ;return the data
  IF arg_present(N2FIELDDATA) THEN n2fielddata = *self.he13n2fielddata ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.he13mzrdata             ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION henry2013::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION henry2013::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO henry2013::boxscore


  self.he13sampsize = 83        ;sample size
  self.he13IMF = 'chabrier2003' ;IMF choice
  self.he13SEDfit = 'FAST'      ;
  self.he13SEDmodels = 'bc03'   ;
  self.he13mzrtype = 'R23'      ;MZR conversion type
  self.he13mzrconvert = 'M08'  ;converted to O/H by
  self.he13selection = 'WISP'   ;sample selection
  self.he13z = 1.85             ;minimum redshift
  self.he13zmin = 1.3           ;minimum redshift
  self.he13zmax = 2.3           ;maximum redshift

  self.he13R23data = ptr_new({xsmod:[8.2,8.8,9.2,9.8], $      ;
                              xserrmodn:[0.5,0.2,0.2,0.4], $  ;
                              xserrmodp:[0.4,0.2,0.2,0.4], $  ;
                              xserrmod:[0.5,0.2,0.2,0.4], $   ;
                              ys:[7.59,8.03,8.47,8.68], $     ;
                              yserrn:[0.16,0.33,0.26,0.12], $ ;
                              yserrp:[0.44,0.33,0.14,0.09], $ ;
                              yserr:[0.30,0.33,0.20,0.11], $ ;
                              ul:[0,0,0,0], $                 ;
                              ngal:[21,22,21,19] })           ;
  
  self.he13mzrdata = ptr_new({xsmod:[8.2,8.8,9.2,9.8], $      ;
                              xserrmodn:[0.5,0.2,0.2,0.4], $  ;
                              xserrmodp:[0.4,0.2,0.2,0.4], $  ;
                              xserrmod:[0.5,0.2,0.2,0.4], $   ;
                              ys:[7.59,8.03,8.47,8.68], $     ;
                              yserrn:[0.16,0.33,0.26,0.12], $ ;
                              yserrp:[0.44,0.33,0.14,0.09], $ ;
                              yserr:[0.30,0.33,0.20,0.11], $ ;
                              ul:[0,0,0,0], $                 ;
                              ngal:[21,22,21,19] })          ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO henry2013::cleanup

  ptr_free, self.he13R23data 
  ptr_free, self.he13mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION henry2013::init

  self.he13objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO henry2013__define

  void = {henry2013, he13objver:'A', $
          he13sampsize:0, $
          he13z:0.0, he13zmin:0.0, he13zmax:0.0, $
          he13IMF:'A', he13SEDfit:'A', he13SEDmodels:'A', he13mzrtype:'A', he13mzrconvert:'A', $
          he13selection:'A', $
          he13R23data:ptr_new(), he13mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

