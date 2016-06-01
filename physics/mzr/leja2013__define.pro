;+
; NAME:
;       LEJA2013()
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
PRO leja2013::getprop, LE13OBJVER=le13objver, N2CLDATA=n2cldata, N2FIELDDATA=n2fielddata, $
                        MZRDATA=mzrdata

  IF arg_present(LE13OBJVER) THEN le13objver = self.le13objver         ;return the data
  IF arg_present(N2CLDATA) THEN n2cldata = *self.le13n2cldata          ;return the data
  IF arg_present(N2FIELDDATA) THEN n2fielddata = *self.le13n2fielddata ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.le13mzrdata             ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION leja2013::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION leja2013::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO leja2013::boxscore


  self.le13sampsize = 6                         ;sample size
  self.le13IMF = 'chabrier'                  ;IMF choice
  self.le13SEDfit = ''                  ;
  self.le13SEDmodels = 'BC03'                    ;
  self.le13mzrtype = 'N2'                        ;MZR conversion type
  self.le13mzrconvert = 'pp04'                   ;converted to O/H by
  self.le13selection = '3DHST'                   ;sample selection
  self.le13zmin = 2.13                           ;minimum redshift
  self.le13zmax = 2.54                           ;maximum redshift
  self.le13N2data = ptr_new({xsmod:[10.73], $    ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                             xserrmodn:[0.22], $   ;
                             xserrmodp:[0.22], $   ;
                             xserrmod:[0.22], $    ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                             ys:[8.57], $       ;
                             yserrn:[0.08], $   ;
                             yserrp:[0.08], $   ;
                             yserr:[0.08], $    ;
                             ul:[0], $          ;
                             ngal:[6] })        ;

  self.le13mzrdata = ptr_new({xsmod:[10.73], $     ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                              xserrmodn:[0.22], $  ;
                              xserrmodp:[0.22], $  ;
                              xserrmod:[0.22], $   ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                              ys:[8.57], $      ;
                              yserrn:[0.08], $  ;
                              yserrp:[0.08], $  ;
                              yserr:[0.08], $   ;
                              ul:[0], $         ;
                              ngal:[6] })       ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO leja2013::cleanup

  ptr_free, self.le13N2data 
  ptr_free, self.le13mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION leja2013::init

  self.le13objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO leja2013__define

  void = {leja2013, le13objver:'A', $
          le13sampsize:0, le13clsampsize:0, le13fieldsampsize:0, $
          le13zcl:0.0, le13zclmin:0.0, le13zclmax:0.0, le13zmin:0.0, le13zmax:0.0, $
          le13IMF:'A', le13SEDfit:'A', le13SEDmodels:'A', le13mzrtype:'A', le13mzrconvert:'A', $
          le13selection:'A', $
          le13N2data:ptr_new(), le13mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

