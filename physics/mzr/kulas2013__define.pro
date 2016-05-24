;+
; NAME:
;       KULAS2013()
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
PRO kulas2013::getprop, KU13OBJVER=ku13objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(KU13OBJVER) THEN ku13objver = self.ku13objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.ku13n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.ku13mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION kulas2013::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION kulas2013::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO kulas2013::boxscore


  self.ku13sampsize = 56                                       ;sample size
  self.ku13IMF = ''                                            ;IMF choice
  self.ku13SEDfit = ''                                         ;
  self.ku13SEDmodels = ''                                      ;
  self.ku13mzrtype = ''                                        ;MZR conversion type
  ;;;also O3N2
  self.ku13mzrconvert = 'pp04'                                 ;converted to O/H by
  self.ku13selection = 'hband'                                 ;sample selection
  ;;;but also Ks band and stellar mass cuts
  self.ku13zmin = 0.8                                          ;minimum redshift
  self.ku13zmax = 1.0                                          ;maximum redshift
  self.ku13N2data = ptr_new({xsmod:[9.98, 10.35, 10.73], $ ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                                 xserrmodn:[0.12, 0.13, 0.17], $ ;
                                 xserrmodp:[0.16, 0.16, 0.14], $ ;
                                 xserrmod:[0.14, 0.145, 0.155], $ ;
                                 yspre:[0.21, 0.30, 0.39], $      ;just [NII]/Halpha
                                 yspreerrn:[0.03, 0.03, 0.04], $  ;
                                 yspreerrp:[0.03, 0.03, 0.04], $  ;
                                 yspreerr:[0.03, 0.03, 0.04], $   ;
                                 ys:[8.50, 8.60, 8.66], $         ;
                                 yserrn:[0.038, 0.026, 0.020], $  ;
                                 yserrp:[0.033, 0.024, 0.018], $  ;
                                 yserr:[0.0355, 0.025, 0.019], $   ;
                                 ul:[0,0,0], $                    ;
                                 ngal:[18, 19, 19] })             ;

  self.ku13mzrdata = ptr_new({xsmod:[9.98, 10.35, 10.73], $ ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                                  xserrmodn:[0.12, 0.13, 0.17], $ ;
                                  xserrmodp:[0.16, 0.16, 0.14], $ ;
                                  xserrmod:[0.14, 0.145, 0.155], $ ;
                                  yspre:[0.21, 0.30, 0.39], $      ;just [NII]/Halpha
                                  yspreerrn:[0.03, 0.03, 0.04], $  ;
                                  yspreerrp:[0.03, 0.03, 0.04], $  ;
                                  yspreerr:[0.03, 0.03, 0.04], $   ;
                                  ys:[8.50, 8.60, 8.66], $         ;
                                  yserrn:[0.038, 0.026, 0.020], $  ;
                                  yserrp:[0.033, 0.024, 0.018], $  ;
                                  yserr:[0.355, 0.025, 0.019], $   ;
                                  ul:[0,0,0], $                    ;
                                  ngal:[18, 19, 19] })             ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO kulas2013::cleanup

  ptr_free, self.ku13N2data 
  ptr_free, self.ku13mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION kulas2013::init

  self.ku13objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO kulas2013__define

  void = {kulas2013, ku13objver:'A', $
          ku13sampsize:0, ku13zmin:0.0, ku13zmax:0.0, $
          ku13IMF:'A', ku13SEDfit:'A', ku13SEDmodels:'A', ku13mzrtype:'A', ku13mzrconvert:'A', $
          ku13selection:'A', $
          ku13N2data:ptr_new(), ku13mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

