;+
; NAME:
;       VALENTINO2015()
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
PRO valentino2015::getprop, VA15OBJVER=va15objver, N2CLDATA=n2cldata, N2FIELDDATA=n2fielddata, $
                        MZRDATA=mzrdata

  IF arg_present(VA15OBJVER) THEN va15objver = self.va15objver         ;return the data
  IF arg_present(N2CLDATA) THEN n2cldata = *self.va15n2cldata          ;return the data
  IF arg_present(N2FIELDDATA) THEN n2fielddata = *self.va15n2fielddata ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.va15mzrdata             ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION valentino2015::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION valentino2015::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO valentino2015::boxscore


  self.va15sampsize = 37        ;sample size
  self.va15clsampsize = 6       ;sample size
  self.va15fieldsampsize = 31   ;sample size
  self.va15IMF = 'salpeter1955' ;IMF choice
  self.va15SEDfit = 'FAST'      ;
  self.va15SEDmodels = 'bc03'   ;
  self.va15mzrtype = 'N2'       ;MZR conversion type
  self.va15mzrconvert = 'pp04'  ;converted to O/H by
  self.va15selection = ''       ;sample selection
  self.va15zcl = 1.99           ;minimum redshift
  self.va15zclmin = 1.987      ;minimum redshift
  self.va15zclmax = 2.001      ;minimum redshift
  self.va15z = 1.92             ;redshift
  self.va15zmin = 1.92          ;minimum redshift
  self.va15zmax = 2.50          ;maximum redshift

  self.va15N2cldata = ptr_new({xsmod:[10.47], $      ;
                               xserrmodn:[0.42], $   ;
                               xserrmodp:[0.17], $   ;
                               xserrmod:[0.29], $   ;
                               ys:[8.261], $         ;
                               yserrn:[0.083], $     ;
                               yserrp:[0.083], $     ;
                               yserr:[0.083], $      ;
                               ul:[0], $             ;
                               ngal:[6] })           ;
  self.va15N2fielddata = ptr_new({xsmod:[10.57], $   ;
                                  xserrmodn:[1.0], $ ;
                                  xserrmodp:[0.7], $ ;
                                  xserrmod:[0.85], $ ;
                                  ys:[8.514], $      ;
                                  yserrn:[0.025], $  ;
                                  yserrp:[0.025], $  ;
                                  yserr:[0.025], $   ;
                                  ul:[0], $          ;
                                  ngal:[31] })       ;

  self.va15mzrdata = ptr_new({xsmod:[10.47,10.57], $    ;
                              xserrmodn:[0.42,1.0], $   ;
                              xserrmodp:[0.17,0.7], $   ;
                              xserrmod:[0.29,0.85], $  ;
                              ys:[8.261,8.514], $       ;
                              yserrn:[0.083,0.025], $   ;
                              yserrp:[0.083,0.025], $   ;
                              yserr:[0.083,0.025], $    ;
                              ul:[0,0], $               ;
                              cl:[1,0], $               ;
                              ngal:[6,31] })            ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO valentino2015::cleanup

  ptr_free, self.va15N2cldata 
  ptr_free, self.va15N2fielddata
  ptr_free, self.va15mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION valentino2015::init

  self.va15objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO valentino2015__define

  void = {valentino2015, va15objver:'A', $
          va15sampsize:0, va15clsampsize:0, va15fieldsampsize:0, $
          va15zcl:0.0, va15zclmin:0.0, va15zclmax:0.0, va15z:0.0, va15zmin:0.0, va15zmax:0.0, $
          va15IMF:'A', va15SEDfit:'A', va15SEDmodels:'A', va15mzrtype:'A', va15mzrconvert:'A', $
          va15selection:'A', $
          va15N2cldata:ptr_new(), va15N2fielddata:ptr_new(), va15mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

