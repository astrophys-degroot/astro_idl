;+
; NAME:
;       KACPRZAK2015()
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
PRO kacprzak2015::getprop, KA15OBJVER=ka15objver, N2CLDATA=n2cldata, N2FIELDDATA=n2fielddata, $
                        MZRDATA=mzrdata

  IF arg_present(KA15OBJVER) THEN ka15objver = self.ka15objver         ;return the data
  IF arg_present(N2CLDATA) THEN n2cldata = *self.ka15n2cldata          ;return the data
  IF arg_present(N2FIELDDATA) THEN n2fielddata = *self.ka15n2fielddata ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.ka15mzrdata             ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION kacprzak2015::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION kacprzak2015::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO kacprzak2015::boxscore


  self.ka15sampsize = 117                      ;sample size
  self.ka15clsampsize = 43                     ;sample size
  self.ka15fieldsampsize = 74                  ;sample size
  self.ka15IMF = ''                ;IMF choice
  self.ka15SEDfit = ''                ;
  self.ka15SEDmodels = ''                  ;
  self.ka15mzrtype = 'N2'                      ;MZR conversion type
  self.ka15mzrconvert = 'pp04'                 ;converted to O/H by
  self.ka15selection = ''                 ;sample selection
  self.ka15zcl = 2.095                         ;minimum redshift
  self.ka15zclmin = 2.091                      ;minimum redshift
  self.ka15zclmax = 2.099                      ;minimum redshift
  self.ka15z = 2.195                           ;minimum redshift
  self.ka15zmin = 2.112                        ;minimum redshift
  self.ka15zmax = 2.278                        ;maximum redshift
  self.ka15N2cldata = ptr_new({xsmod:[9.1,9.4,9.6,9.75,10.3], $           ;
                               xserrmodn:[0.25,0.15,0.10,0.10,0.1], $     ;
                               xserrmodp:[0.15,0.10,0.15,0.45,0.4], $     ;
                               xserrmod:[0.20,0.12,0.12,0.27,0.25], $     ;
                               ys:[8.1,8.2,8.2,8.4,8.55], $               ;
                               yserrn:[0.15,0.10,0.10,0.10,0.05], $       ;
                               yserrp:[0.15,0.10,0.10,0.10,0.05], $       ;
                               yserr:[0.15,0.10,0.10,0.10,0.05], $        ;
                               ul:[0,0,0,0,0], $                          ;
                               ngal:[8,8,9,9,9] })                        ;
  self.ka15N2fielddata = ptr_new({xsmod:[9.10,9.35,9.60,9.90,10.45], $     ;
                                  xserrmodn:[0.25,0.10,0.10,0.20,0.30], $ ;
                                  xserrmodp:[0.10,0.15,0.15,0.25,0.50], $ ;
                                  xserrmod:[0.18,0.12,0.20,0.22,0.40], $  ;
                                  ys:[8.0,8.15,8.3,8.35,8.55], $          ;
                                  yserrn:[0.15,0.20,0.10,0.05,0.02], $    ;
                                  yserrp:[0.15,0.20,0.10,0.05,0.02], $    ;
                                  yserr:[0.15,0.20,0.10,0.05,0.02], $     ;
                                  ul:[0,0,0,0,0], $                       ;
                                  ngal:[14,15,15,15,15] })                ;

  self.ka15mzrdata = ptr_new({xsmod:[9.1,9.4,9.6,9.75,10.3, 9.10,9.35,9.60,9.90,10.45], $        ;
                              xserrmodn:[0.25,0.15,0.10,0.10,0.1, 0.25,0.10,0.10,0.20,0.30], $  ;
                              xserrmodp:[0.15,0.10,0.15,0.45,0.4, 0.10,0.15,0.15,0.25,0.50], $  ;
                              xserrmod:[0.20,0.12,0.12,0.27,0.25, 0.18,0.12,0.20,0.22,0.40], $  ;
                              ys:[8.1,8.2,8.2,8.4,8.55, 8.0,8.15,8.3,8.35,8.55], $              ;
                              yserrn:[0.15,0.10,0.10,0.10,0.05, 0.15,0.20,0.10,0.05,0.02], $    ;
                              yserrp:[0.15,0.10,0.10,0.10,0.05, 0.15,0.20,0.10,0.05,0.02], $    ;
                              yserr:[0.15,0.10,0.10,0.10,0.05, 0.15,0.20,0.10,0.05,0.02], $     ;
                              ul:[0,0,0,0,0, 0,0,0,0,0], $                                      ;
                              ngal:[8,8,9,9,9, 14,15,15,15,15] })                               ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO kacprzak2015::cleanup

  ptr_free, self.ka15N2cldata 
  ptr_free, self.ka15N2fielddata
  ptr_free, self.ka15mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION kacprzak2015::init

  self.ka15objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO kacprzak2015__define

  void = {kacprzak2015, ka15objver:'A', $
          ka15sampsize:0, ka15clsampsize:0, ka15fieldsampsize:0, $
          ka15zcl:0.0, ka15zclmin:0.0, ka15zclmax:0.0, ka15z:0.0, ka15zmin:0.0, ka15zmax:0.0, $
          ka15IMF:'A', ka15SEDfit:'A', ka15SEDmodels:'A', ka15mzrtype:'A', ka15mzrconvert:'A', $
          ka15selection:'A', $
          ka15N2cldata:ptr_new(), ka15N2fielddata:ptr_new(), ka15mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

