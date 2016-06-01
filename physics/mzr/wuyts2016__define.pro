;+
; NAME:
;       WUYTS2016()
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
;       A. DeGroot, 2016 June 1, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO wuyts2016::getprop, WU16OBJVER=wu16objver, N209DATA=n209data, MZR09DATA=mzr09data

  IF arg_present(WU16OBJVER) THEN wu16objver = self.wu16objver     ;return the data
  IF arg_present(N209DATA) THEN n209data = *self.wu16N2data_z09    ;return the data
  IF arg_present(MZR09DATA) THEN mzr09data = *self.wu16mzrdata_z09 ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION wuyts2016::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION wuyts2016::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO wuyts2016::boxscore


  self.wu16sampsize = 419                                                               ;sample size
  self.wu16sampsize_z09 = 72                                                            ;sample size
  self.wu16sampsize_z15 = 30                                                            ;sample size
  self.wu16sampsize_z23 = 78                                                            ;sample size
  self.wu16IMF = ''                                                                     ;IMF choice
  self.wu16SEDfit = 'FAST'                                                              ;
  self.wu16SEDmodels = 'bc03'                                                           ;
  self.wu16mzrtype = 'N2'                                                               ;MZR conversion type
  self.wu16mzrconvert = 'pp04'                                                          ;converted to O/H by
  self.wu16selection = 'KMOS3D'                                                         ;sample selection
  ;;;but also Ks band and stellar mass cuts
  self.wu16zmin_z09 = 0.6                                                               ;minimum redshift
  self.wu16zmax_z09 = 1.1                                                               ;maximum redshift
  self.wu16zmin_z15 = 1.3                                                               ;minimum redshift
  self.wu16zmax_z15 = 1.7                                                               ;maximum redshift
  self.wu16zmin_z23 = 1.9                                                               ;minimum redshift
  self.wu16zmax_z23 = 2.7                                                               ;maximum redshift
  self.wu16N2data_z09 = ptr_new({xsmod:[9.91, 10.25, 10.55, 10.80], $                   ;
                                 xserrmodn:[0.20,0.18,0.15,0.12], $                     ;
                                 xserrmodp:[0.17,0.15,0.12,0.70], $                     ;
                                 xserrmod:[0.18,0.17,0.13,0.30], $                      ;
                                 yspre:[0.218, 0.277, 0.364, 0.384], $                  ;just [NII]/Halpha
                                 yspreerrn:[0.043, 0.044, 0.072, 0.038], $              ;
                                 yspreerrp:[0.043, 0.044, 0.072, 0.038], $              ;
                                 yspreerr:[0.043, 0.044, 0.072, 0.038], $               ;
                                 ys:[8.52292, 8.58221, 8.64983, 8.66307], $             ;
                                 yserrn:[0.0543885, 0.0428206, 0.0545595, 0.0257954], $ ;
                                 yserrp:[0.0445649, 0.0364944, 0.0446795, 0.0233593], $ ;
                                 yserr:[0.049,0.039,0.049,0.024], $                         ;
                                 ul:[0,0,0,0], $                                        ;
                                 ngal:[18,18,18,18]})                                   ;

  self.wu16mzrdata_z09 = ptr_new({xsmod:[9.91, 10.25, 10.55, 10.80], $                   ;
                                  xserrmodn:[0.20,0.18,0.15,0.12], $                     ;
                                  xserrmodp:[0.17,0.15,0.12,0.70], $                     ;
                                  xserrmod:[0.18,0.17,0.13,0.30], $                      ;
                                  yspre:[0.218, 0.277, 0.364, 0.384], $                  ;just [NII]/Halpha
                                  yspreerrn:[0.043, 0.044, 0.072, 0.038], $              ;
                                  yspreerrp:[0.043, 0.044, 0.072, 0.038], $              ;
                                  yspreerr:[0.043, 0.044, 0.072, 0.038], $               ;
                                  ys:[8.52292, 8.58221, 8.64983, 8.66307], $             ;
                                  yserrn:[0.0543885, 0.0428206, 0.0545595, 0.0257954], $ ;
                                  yserrp:[0.0445649, 0.0364944, 0.0446795, 0.0233593], $ ;
                                  yserr:[0.049,0.039,0.049,0.024], $                         ;
                                  ul:[0,0,0,0], $                                        ;
                                  ngal:[18,18,18,18]})                                   ;

  self.wu16N2data_z15 = ptr_new({xsmod:[9.93, 10.61], $           ;
                                 xserrmodn:[0.40,0.35], $         ;
                                 xserrmodp:[0.35,0.80], $         ;
                                 xserrmod:[0.37,0.6], $           ;
                                 yspre:[0.164, 0.262], $          ;just [NII]/Halpha
                                 yspreerrn:[0.034, 0.057], $      ;
                                 yspreerrp:[0.034, 0.057], $      ;
                                 yspreerr:[0.034, 0.057], $       ;
                                 ys:[8.45246, 8.56843], $         ;
                                 yserrn:[0.0575133, 0.0607320], $ ;
                                 yserrp:[0.0466382, 0.0487290], $ ;
                                 yserr:[0.051,0.054], $             ;
                                 ul:[0,0], $                      ;
                                 ngal:[15,15]})                   ;

  self.wu16mzrdata_z15 = ptr_new({xsmod:[9.93, 10.61], $           ;
                                  xserrmodn:[0.40,0.35], $         ;
                                  xserrmodp:[0.35,0.80], $         ;
                                  xserrmod:[0.37,0.6], $           ;
                                  yspre:[0.164, 0.262], $          ;just [NII]/Halpha
                                  yspreerrn:[0.034, 0.057], $      ;
                                  yspreerrp:[0.034, 0.057], $      ;
                                  yspreerr:[0.034, 0.057], $       ;
                                  ys:[8.45246, 8.56843], $         ;
                                  yserrn:[0.0575133, 0.0607320], $ ;
                                  yserrp:[0.0466382, 0.0487290], $ ;
                                  yserr:[0.051,0.054], $             ;
                                  ul:[0,0], $                      ;
                                  ngal:[15,15]})                   ;
  
  self.wu16N2data_z23 = ptr_new({xsmod:[10.03, 10.27, 10.43, 10.59, 10.83], $                      ;
                                 xserrmodn:[0.23,0.12,0.13,0.08,0.12], $                      ;
                                 xserrmodp:[0.12,0.13,0.08,0.12,0.60], $                      ;
                                 xserrmod:[0.17,0.12,0.11,0.10,0.35], $                       ;
                                 yspre:[0.114, 0.134, 0.165, 0.231, 0.328], $                      ;just [NII]/Halpha
                                 yspreerrn:[0.012, 0.024, 0.020, 0.034, 0.115], $                  ;
                                 yspreerrp:[0.012, 0.024, 0.020, 0.034, 0.115], $                  ;
                                 yspreerr:[0.012, 0.024, 0.020, 0.034, 0.115], $                   ;
                                 ys:[8.36244, 8.40245, 8.45397, 8.53726, 8.62405], $               ;
                                 yserrn:[0.0275337, 0.0488559, 0.0319861, 0.0394131, 0.106872], $  ;
                                 yserrp:[0.0247754, 0.0407848, 0.0283220, 0.0339913, 0.0744020], $ ;
                                 yserr:[0.025,0.044,0.030,0.036,0.089], $                          ;
                                 ul:[0,0,0,0,0,0], $                                               ;
                                 ngal:[16,16,16,16,16]})                                           ;

  self.wu16mzrdata_z23 = ptr_new({xsmod:[10.03, 10.27, 10.43, 10.59, 10.83], $                      ;
                                  xserrmodn:[0.23,0.12,0.13,0.08,0.12], $                      ;
                                  xserrmodp:[0.12,0.13,0.08,0.12,0.60], $                      ;
                                  xserrmod:[0.17,0.12,0.11,0.10,0.35], $                       ;
                                  yspre:[0.114, 0.134, 0.165, 0.231, 0.328], $                      ;just [NII]/Halpha
                                  yspreerrn:[0.012, 0.024, 0.020, 0.034, 0.115], $                  ;
                                  yspreerrp:[0.012, 0.024, 0.020, 0.034, 0.115], $                  ;
                                  yspreerr:[0.012, 0.024, 0.020, 0.034, 0.115], $                   ;
                                  ys:[8.36244, 8.40245, 8.45397, 8.53726, 8.62405], $               ;
                                  yserrn:[0.0275337, 0.0488559, 0.0319861, 0.0394131, 0.106872], $  ;
                                  yserrp:[0.0247754, 0.0407848, 0.0283220, 0.0339913, 0.0744020], $ ;
                                  yserr:[0.025,0.044,0.030,0.036,0.089], $                          ;
                                  ul:[0,0,0,0,0,0], $                                               ;
                                  ngal:[16,16,16,16,16]})                                           ;
  
END
;====================================================================================================


;====================================================================================================
PRO wuyts2016::cleanup

  ptr_free, self.wu16N2data_z09 
  ptr_free, self.wu16mzrdata_z09
  ptr_free, self.wu16N2data_z15 
  ptr_free, self.wu16mzrdata_z15
  ptr_free, self.wu16N2data_z23
  ptr_free, self.wu16mzrdata_z23

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION wuyts2016::init

  self.wu16objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO wuyts2016__define

  void = {wuyts2016, wu16objver:'A', $
          wu16sampsize:0, wu16sampsize_z09:0, wu16sampsize_z15:0, wu16sampsize_z23:0, $
          wu16zmin_z09:0.0, wu16zmax_z09:0.0, $
          wu16zmin_z15:0.0, wu16zmax_z15:0.0, $
          wu16zmin_z23:0.0, wu16zmax_z23:0.0, $
          wu16IMF:'A', wu16SEDfit:'A', wu16SEDmodels:'A', wu16mzrtype:'A', wu16mzrconvert:'A', $
          wu16selection:'A', $
          wu16N2data_z09:ptr_new(), wu16mzrdata_z09:ptr_new(), $
          wu16N2data_z15:ptr_new(), wu16mzrdata_z15:ptr_new(), $
          wu16N2data_z23:ptr_new(), wu16mzrdata_z23:ptr_new()}

  RETURN
END
;====================================================================================================

