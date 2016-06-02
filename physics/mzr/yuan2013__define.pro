;+
; NAME:
;       YUAN2013()
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
PRO yuan2013::getprop, YU13OBJVER=yu13objver, N2CLDATA=n2cldata, N2FIELDDATA=n2fielddata, $
                        MZRDATA=mzrdata

  IF arg_present(YU13OBJVER) THEN yu13objver = self.yu13objver         ;return the data
  IF arg_present(N2CLDATA) THEN n2cldata = *self.yu13n2cldata          ;return the data
  IF arg_present(N2FIELDDATA) THEN n2fielddata = *self.yu13n2fielddata ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.yu13mzrdata             ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION yuan2013::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION yuan2013::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO yuan2013::boxscore


  self.yu13sampsize = 25        ;sample size
  self.yu13IMF = 'chabrier2003' ;IMF choice
  self.yu13SEDfit = 'LEPHARE'   ;
  self.yu13SEDmodels = 'bc03'   ;
  self.yu13mzrtype = 'N2'       ;MZR conversion type
  self.yu13mzrconvert = 'M08'   ;converted to O/H by
  self.yu13selection = 'lensed' ;sample selection
  self.yu13z = 1.91             ;minimum redshift
  self.yu13zmin = 1.28          ;minimum redshift
  self.yu13zmax = 2.54          ;maximum redshift

  self.yu13N2data = ptr_new({xsmod:[9.25,10.25], $      ;
                              xserrmodn:[0.25,0.75], $  ;
                              xserrmodp:[0.25,0.75], $  ;
                              xserrmod:[0.25,0.75], $   ;
                              ys:[8.296,8.336], $     ;
                              yserrn:[0.090,0.066], $ ;
                              yserrp:[0.090,0.066], $ ;
                              yserr:[0.090,0.066], $ ;
                              ul:[0,0], $                 ;
                              ngal:[12,13] })           ;
  
  self.yu13mzrdata = ptr_new({xsmod:[9.25,10.25], $      ;
                              xserrmodn:[0.25,0.75], $  ;
                              xserrmodp:[0.25,0.75], $  ;
                              xserrmod:[0.25,0.75], $   ;
                              ys:[8.296,8.336], $     ;
                              yserrn:[0.090,0.066], $ ;
                              yserrp:[0.090,0.066], $ ;
                              yserr:[0.090,0.066], $ ;
                              ul:[0,0], $                 ;
                              ngal:[12,13] })          ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO yuan2013::cleanup

  ptr_free, self.yu13N2data 
  ptr_free, self.yu13mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION yuan2013::init

  self.yu13objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO yuan2013__define

  void = {yuan2013, yu13objver:'A', $
          yu13sampsize:0, $
          yu13z:0.0, yu13zmin:0.0, yu13zmax:0.0, $
          yu13IMF:'A', yu13SEDfit:'A', yu13SEDmodels:'A', yu13mzrtype:'A', yu13mzrconvert:'A', $
          yu13selection:'A', $
          yu13N2data:ptr_new(), yu13mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

