;+
; NAME:
;       WUYTS2014()
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
PRO wuyts2014::getprop, WU14OBJVER=wu14objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(WU14OBJVER) THEN wu14objver = self.wu14objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.wu14n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.wu14mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION wuyts2014::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION wuyts2014::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO wuyts2014::boxscore


  self.wu14sampsize = 56                                       ;sample size
  self.wu14IMF = ''                                            ;IMF choice
  self.wu14SEDfit = ''                                         ;
  self.wu14SEDmodels = ''                                      ;
  self.wu14mzrtype = ''                                        ;MZR conversion type
  ;;;also O3N2
  self.wu14mzrconvert = 'pp04'                                 ;converted to O/H by
  self.wu14selection = 'hband'                                 ;sample selection
  ;;;but also Ks band and stellar mass cuts
  self.wu14zmin = 0.8                                          ;minimum redshift
  self.wu14zmax = 1.0                                          ;maximum redshift
  self.wu14N2data_z09 = ptr_new({xsmod:[9.98, 10.35, 10.73], $ ;
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

  self.wu14mzrdata_z09 = ptr_new({xsmod:[9.98, 10.35, 10.73], $ ;
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
  
  self.wu14N2data_z23 = ptr_new({xsmod:[9.65, 10.11, 10.39, 10.74], $ ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                                 xserrmodn:[0.16, 0.11, 0.06, 0.18], $ ;
                                 xserrmodp:[0.27, 0.12, 0.08, 0.13], $ ;
                                 xserrmod:[0.215,0.11,0.07,0.155], $   ;
                                 yspre:[0.06, 0.17, 0.18, 0.32], $     ;just [NII]/Halpha
                                 yspreerrn:[0.02, 0.02, 0.02, 0.04], $ ;
                                 yspreerrp:[0.02, 0.02, 0.02, 0.04], $ ;
                                 yspreerr:[0.02, 0.02, 0.02, 0.04], $  ;
                                 ys:[8.20, 8.46, 8.48, 8,62], $        ;
                                 yserrn:[0.100, 0.031, 0.029, 0.033], $ ;
                                 yserrp:[0.071, 0.028, 0.026, 0.029], $ ;
                                 yserr:[0.085, 0.0295, 0.0285, 0.0315], $ ;
                                 ul:[0,0,0], $                            ;
                                 ngal:[28,28,28,29] })                    ;

  self.wu14mzrdata_z23 = ptr_new({xsmod:[9.65, 10.11, 10.39, 10.74], $ ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                                  xserrmodn:[0.16, 0.11, 0.06, 0.18], $ ;
                                  xserrmodp:[0.27, 0.12, 0.08, 0.13], $ ;
                                  xserrmod:[0.215,0.11,0.07,0.155], $   ;
                                  yspre:[0.06, 0.17, 0.18, 0.32], $     ;just [NII]/Halpha
                                  yspreerrn:[0.02, 0.02, 0.02, 0.04], $ ;
                                  yspreerrp:[0.02, 0.02, 0.02, 0.04], $ ;
                                  yspreerr:[0.02, 0.02, 0.02, 0.04], $  ;
                                  ys:[8.20, 8.46, 8.48, 8,62], $        ;
                                  yserrn:[0.100, 0.031, 0.029, 0.033], $ ;
                                  yserrp:[0.071, 0.028, 0.026, 0.029], $ ;
                                  yserr:[0.085, 0.0295, 0.0285, 0.0315], $ ;
                                  ul:[0,0,0,0], $                            ;
                                  ngal:[28,28,28,29] })                    ;
  
END
;====================================================================================================


;====================================================================================================
PRO wuyts2014::cleanup

  ptr_free, self.wu14N2data_z09 
  ptr_free, self.wu14mzrdata_z09
  ptr_free, self.wu14N2data_z23
  ptr_free, self.wu14mzrdata_z23

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION wuyts2014::init

  self.wu14objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO wuyts2014__define

  void = {wuyts2014, wu14objver:'A', $
          wu14sampsize:0, wu14zmin:0.0, wu14zmax:0.0, $
          wu14IMF:'A', wu14SEDfit:'A', wu14SEDmodels:'A', wu14mzrtype:'A', wu14mzrconvert:'A', $
          wu14selection:'A', $
          wu14N2data_z09:ptr_new(), wu14mzrdata_z09:ptr_new(), wu14N2data_z23:ptr_new(), wu14mzrdata_z23:ptr_new()}

  RETURN
END
;====================================================================================================

