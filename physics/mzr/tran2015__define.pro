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
;       A. DeGroot, 2016 May 23, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO tran2015::getprop, TR15OBJVER=tr15objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(TR15OBJVER) THEN tr15objver = self.tr15objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.tr15n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.tr15mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION tran2015::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION tran2015::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO tran2015::boxscore


  self.tr15sampsize = 26                                   ;sample size
  self.tr15clsampsize = 26                                 ;sample size
  self.tr15fieldsampsize = 0                               ;sample size
  self.tr15IMF = 'chabrier2003'                            ;IMF choice
  self.tr15SEDfit = 'FAST'                                 ;
  self.tr15SEDmodels = ''                                  ;
  self.tr15mzrtype = ''                                    ;MZR conversion type
  self.tr15mzrconvert = ''                                 ;converted to O/H by
  self.tr15selection = ''                                  ;sample selection
  self.tr15zcl = 1.6233                                    ;minimum redshift
  self.tr15zclmin = 1.6118                                 ;minimum redshift
  self.tr15zclmax = 1.6348                                 ;minimum redshift
  self.tr15zmin = 1.6118                                   ;minimum redshift
  self.tr15zmax = 1.6348                                   ;maximum redshift
  self.tr15N2cldata = ptr_new({xsmod:[9.4,9.9,10.55], $    ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                               xserrmodn:[0.2,0.3,0.35], $ ;
                               xserrmodp:[0.2,0.3,0.35], $ ;
                               xserrmod:[0.2,0.3,0.35], $  ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                               ys:[8.33,8.44,8.55], $    ;
                               yserrn:[0.12,0.07,0.04], $ ;
                               yserrp:[0.12,0.07,0.04], $ ;
                               yserr:[0.12,0.07,0.04], $  ;
                               ul:[0,0,0], $             ;
                               ngal:[9,9,8] })           ;
  
  self.tr15mzrdata = ptr_new({xsmod:[9.4,9.9,10.55], $     ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                              xserrmodn:[0.2,0.3,0.35], $  ;
                              xserrmodp:[0.2,0.3,0.35], $  ;
                              xserrmod:[0.2,0.3,0.35], $   ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                              ys:[8.33,8.44,8.55], $     ;
                              yserrn:[0.12,0.07,0.04], $  ;
                              yserrp:[0.12,0.07,0.04], $  ;
                              yserr:[0.12,0.07,0.04], $   ;
                              ul:[0,0,0], $              ;
                              ngal:[9,9,8] })            ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO tran2015::cleanup

  ptr_free, self.tr15N2cldata 
  ptr_free, self.tr15N2fielddata
  ptr_free, self.tr15mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION tran2015::init

  self.tr15objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO tran2015__define

  void = {tran2015, tr15objver:'A', $
          tr15sampsize:0, tr15clsampsize:0, tr15fieldsampsize:0, $
          tr15zcl:0.0, tr15zclmin:0.0, tr15zclmax:0.0, tr15zmin:0.0, tr15zmax:0.0, $
          tr15IMF:'A', tr15SEDfit:'A', tr15SEDmodels:'A', tr15mzrtype:'A', tr15mzrconvert:'A', $
          tr15selection:'A', $
          tr15N2cldata:ptr_new(), tr15N2fielddata:ptr_new(), tr15mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

