;+
; NAME:
;       MASTERS2014()
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
PRO masters2014::getprop, MA14OBJVER=ma14objver, N2CLDATA=n2cldata, N2FIELDDATA=n2fielddata, $
                        MZRDATA=mzrdata

  IF arg_present(MA14OBJVER) THEN ma14objver = self.ma14objver         ;return the data
  IF arg_present(N2CLDATA) THEN n2cldata = *self.ma14n2cldata          ;return the data
  IF arg_present(N2FIELDDATA) THEN n2fielddata = *self.ma14n2fielddata ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.ma14mzrdata             ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION masters2014::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION masters2014::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO masters2014::boxscore


  self.ma14sampsize = 24                         ;sample size
  self.ma14IMF = ''                      ;IMF choice
  self.ma14SEDfit = ''                           ;
  self.ma14SEDmodels = ''                    ;
  self.ma14mzrtype = 'N2'                        ;MZR conversion type
  self.ma14mzrconvert = ''                   ;converted to O/H by
  self.ma14selection = ''                   ;sample selection
  self.ma14z = 1.85                              ;minimum redshift
  self.ma14zmin = 1.46                           ;minimum redshift
  self.ma14zmax = 2.24                           ;maximum redshift
  self.ma14N2data = ptr_new({xsmod:[9.1], $      ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                             xserrmodn:[0.5], $ ;
                             xserrmodp:[0.5], $ ;
                             xserrmod:[0.5], $  ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                             ys:[8.37], $     ;
                             yserrn:[0.01], $ ;
                             yserrp:[0.01], $ ;
                             yserr:[0.01], $  ;
                             ul:[0], $        ;
                             ngal:[24] })     ;

  self.ma14R23data = ptr_new({xsmod:[9.1], $      ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                              xserrmodn:[0.5], $ ;
                              xserrmodp:[0.5], $ ;
                              xserrmod:[0.5], $  ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                              ys:[8.20], $    ;
                              yserrn:[0.01], $ ;
                              yserrp:[0.01], $ ;
                              yserr:[0.01], $  ;
                              ul:[0], $        ;
                              ngal:[24] })     ;

  self.ma14mzrdata = ptr_new({xsmod:[9.1], $      ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                             xserrmodn:[0.5], $ ;
                             xserrmodp:[0.5], $ ;
                             xserrmod:[0.5], $  ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                             ys:[8.37], $     ;
                             yserrn:[0.01], $ ;
                             yserrp:[0.01], $ ;
                             yserr:[0.01], $  ;
                             ul:[0], $        ;
                              ngal:[24] })    ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO masters2014::cleanup

  ptr_free, self.ma14N2data 
  ptr_free, self.ma14R23data 
  ptr_free, self.ma14mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION masters2014::init

  self.ma14objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO masters2014__define

  void = {masters2014, ma14objver:'A', $
          ma14sampsize:0, $
          ma14z:0.0, ma14zmin:0.0, ma14zmax:0.0, $
          ma14IMF:'A', ma14SEDfit:'A', ma14SEDmodels:'A', ma14mzrtype:'A', ma14mzrconvert:'A', $
          ma14selection:'A', $
          ma14N2data:ptr_new(), ma14R23data:ptr_new(), ma14mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

