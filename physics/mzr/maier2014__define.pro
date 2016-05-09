;+
; NAME:
;       MAIER2014()
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
;       A. DeGroot, 2016 April 24, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO maier2014::getprop, MA14OBJVER=ma14objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(MA14OBJVER) THEN ma14objver = self.ma14objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.ma14n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.ma14mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION maier2014::convertmetallicity;, whratio, HAFLUX=haflux, HBFLUX=hbflux, $
                                      ;    NIIFLUX=niiflux, OIIIFLUX=oiiiflux
  print, 'No conversion given!'

  ;CASE whratio OF 
  ;   'N2' : ys = 8.62 + 0.36 * alog10(niiflux / haflux) 
  ;   'O3N2' : ys = 8.66 - 0.28 * alog10((oiiiflux/hbflux)/(niiflux/haflux))
  ;   ELSE : BEGIN
  ;      print, 'WARNING!! Choice of metallicity indicator not valid.'
  ;      print, ' Only choices are N2 or O3N2' 
  ;   ENDELSE
  ;ENDCASE

  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
FUNCTION maier2014::MZRFIT

  print, 'No fit yet provided'

  ;CASE whmetal OF 
  ;   'N2' : 
  ;   'O3N2' : 
  ;   ELSE : BEGIN
  ;      print, 'WARNING!! Choice of metallicity indicator not valid.'
  ;      print, ' Only choices are N2 or O3N2' 
  ;   ENDELSE
  ;ENDCASE


  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO maier2014::boxscore


  self.ma14sampsize = 20         ;sample size
  self.ma14IMF = 'BC03'          ;IMF choice
  self.ma14mzrtype = 'KD02'        ;MZR conversion type
  self.ma14selection = 'photoz' ;sample selection
  ;;;but also high SFR > 30Msolar/yr
  self.ma14zmin = 2.1                               ;minimum redshift
  self.ma14zmax = 2.5                               ;maximum redshift
  self.ma14N2data = ptr_new({ $ ;xsmod:[], $ ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                                ;xserrmodn:[], $ ;
                                ;xserrmodp:[], $ ;
                                ;xserrmod:[], $  ;
                                ;ys:[], $        ;
                                ;yserrn:[], $    ;
                                ;yserrp:[], $    ;
                                ;yserr:[], $     ;
                                ;ul:[], $
                                ;ngal:[]
                            })  ;
  self.ma14mzrdata = ptr_new({ $ ;xsmod:[], $ ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                                ;xserrmodn:[], $ ;
                                ;xserrmodp:[], $ ;
                                ;xserrmod:[], $  ;
                                ;ys:[], $        ;
                                ;yserrn:[], $    ;
                                ;yserrp:[], $    ;
                                ;yserr:[], $     ;
                                ;ul:[], $
                                ;ngal:[]
                             }) ;
  
END
;====================================================================================================


;====================================================================================================
PRO maier2014::cleanup

  ptr_free, self.ma14N2data 
  ptr_free, self.ma14mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION maier2014::init

  self.ma14objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO maier2014__define

  void = {maier2014, ma14objver:'A', $
          ma14sampsize:0, ma14zmin:0.0, ma14zmax:0.0, $
          ma14IMF:'A', ma14mzrtype:'A', ma14selection:'A', $
          ma14N2data:ptr_new(), ma14mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

