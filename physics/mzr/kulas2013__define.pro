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


  self.ku13sampsize = 43                         ;sample size
  self.ku13clsampsize = 23                       ;sample size
  self.ku13fieldsampsize = 20                    ;sample size
  self.ku13IMF = 'salpeter1955'                  ;IMF choice
  self.ku13SEDfit = 'reddy2012'                  ;
  self.ku13SEDmodels = 'CB11'                    ;
  self.ku13mzrtype = 'N2'                        ;MZR conversion type
  self.ku13mzrconvert = 'pp04'                   ;converted to O/H by
  self.ku13selection = 'KBSS'                    ;sample selection
  self.ku13zcl = 2.30                            ;minimum redshift
  self.ku13zclmin = 2.2840                       ;minimum redshift
  self.ku13zclmax = 2.3096                       ;minimum redshift
  self.ku13zmin = 2.19                           ;minimum redshift
  self.ku13zmax = 2.50                           ;maximum redshift
  self.ku13N2cldata = ptr_new({xsmod:[9.95,10.62], $ ;
                               xs:[0.89E10,4.15E10], $     
                                ;xserr:[], $       ;
                               xserrmodn:[0.5,0.4], $   ;
                               xserrmodp:[0.2,0.4], $   ;
                               xserrmod:[0.35,0.4], $   ;
                               yspre:[], $              ;just [NII]/Halpha
                               yspreerrn:[], $          ;
                               yspreerrp:[], $          ;
                               yspreerr:[], $           ;
                               ys:[8.40, 8.40], $       ;
                               yserrn:[0.2,0.1], $      ;
                               yserrp:[0.2,0.1], $      ;
                               yserr:[0.2,0.1], $       ;
                               ul:[0,0], $              ;
                               ngal:[11,12] })          ;
  self.ku13N2fielddata = ptr_new({xsmod:[9.91,10.66], $ ;
                                  xs:[0.82E10,4.53E10], $     
                                ;xserr:[], $       ;
                                  xserrmodn:[0.3,0.5], $ ;
                                  xserrmodp:[0.2,0.7], $ ;
                                  xserrmod:[0.25,0.6], $ ;
                                  yspre:[], $            ;just [NII]/Halpha
                                  yspreerrn:[], $        ;
                                  yspreerrp:[], $        ;
                                  yspreerr:[], $         ;
                                  ys:[8.25, 8.41], $     ;
                                  yserrn:[0.1,0.2], $    ;
                                  yserrp:[0.1,0.2], $    ;
                                  yserr:[0.1,0.2], $     ;
                                  ul:[0,0], $            ;
                                  ngal:[10,10] })        ;

  self.ku13mzrdata = ptr_new({xsmod:[9.95,10.62], $ ;
                              xs:[0.89E10,4.15E10], $     
                                ;xserr:[], $       ;
                              xserrmodn:[0.5,0.4], $  ;
                              xserrmodp:[0.2,0.4], $  ;
                              xserrmod:[0.35,0.4], $  ;
                              yspre:[], $             ;just [NII]/Halpha
                              yspreerrn:[], $         ;
                              yspreerrp:[], $         ;
                              yspreerr:[], $          ;
                              ys:[8.40, 8.40], $      ;
                              yserrn:[0.2,0.1], $     ;
                              yserrp:[0.2,0.1], $     ;
                              yserr:[0.2,0.1], $      ;
                              ul:[0,0], $             ;
                              ngal:[11,12] })         ;
  
  
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

