;+
; NAME:
;       BLANK0000()
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
PRO blank0000::getprop, BL00OBJVER=bl00objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(BL00OBJVER) THEN bl00objver = self.bl00objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.bl00n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.bl00mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION blank0000::convertmetallicity;, whratio, HAFLUX=haflux, HBFLUX=hbflux, $
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
FUNCTION blank0000::MZRFIT

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
PRO blank0000::boxscore


                                ;self.bl00sampsize = 87                                                    ;sample size
                                ;self.bl00IMF = 'chabrier2003'                                             ;IMF choice
                                ;self.bl00SEDfit = 'LePhare'                                                                                      ;
                                ;self.bl00SEDmodels = 'BC03'                        ;
                                ;self.bl00mzrtype = 'N2'                                                   ;MZR conversion type
                                ;self.bl00mzrconvert = 'PP04'                                                                                  ;converted to O/H by
                                ;self.bl00selection = 'UV'                                                 ;sample selection
                                ;self.bl00zmin = 0.0                                                       ;minimum redshift
                                ;self.bl00zmax = 3.0                                                       ;maximum redshift
  self.bl00N2data = ptr_new({ $ ;xsmod:[], $ ;
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
  self.bl00mzrdata = ptr_new({ $ ;xsmod:[], $ ;
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
PRO blank0000::cleanup

  ptr_free, self.bl00N2data 
  ptr_free, self.bl00mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION blank0000::init

  self.bl00objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO blank0000__define

  void = {blank0000, bl00objver:'A', $
          bl00sampsize:0, bl00zmin:0.0, bl00zmax:0.0, $
          bl00IMF:'A', bl00SEDfit:'A', bl00SEDmodels:'A', bl00mzrtype:'A', bl00mzrconvert:'A', $
          bl00selection:'A', $
          bl00N2data:ptr_new(), bl00mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

