;+
; NAME:
;       YABE2012()
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
PRO yabe2012::getprop, YA12OBJVER=ya12objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(YA12OBJVER) THEN ya12objver = self.ya12objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.ya12n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.ya12mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION yabe2012::convertmetallicity;, whratio, HAFLUX=haflux, HBFLUX=hbflux, $
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
FUNCTION yabe2012::MZRFIT

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
PRO yabe2012::boxscore


  self.ya12sampsize = 58                             ;sample size
  self.ya12IMF = 'salpeter1955'                      ;IMF choice
  self.ya12SEDfit = 'SEDfit'                         ;
  self.ya12SEDmodels = 'BC03'                        ;
  self.ya12mzrtype = 'N2'                            ;MZR conversion type
  ;;;also O3N2
  self.ya12mzrconvert = 'PP04'                       ;converted to O/H by
  self.ya12selection = 'photoz'                      ;sample selection
  ;;;but also Ks band and stellar mass cuts
  self.ya12zmin = 1.2                                ;minimum redshift
  self.ya12zmax = 1.6                                ;maximum redshift
  self.ya12N2data = ptr_new({xsmod:[9.98, 10.28, 10.65], $    ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                             xserrmodn:[0.28, 0.17, 0.17], $  ;
                             xserrmodp:[0.13, 0.20, 0.35], $  ;
                             xserrmod:[0.205, 0.185, 0.26], $ ;
                             ys:[8.412, 8.492, 8.572], $      ;
                             yserrn:[0.045, 0.036, 0.018], $  ;
                             yserrp:[0.045, 0.036, 0.018], $  ;
                             yserr:[0.045, 0.036, 0.018], $   ;
                             ul:[0,0,0], $
                             ngal:[14, 22, 22] })                   ;
  self.ya12O3N2data = ptr_new({ $ xsmod:[9.98, 10.28, 10.65], $     ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                                xserrmodn:[0.28, 0.17, 0.17], $     ;
                                xserrmodp:[0.13, 0.20, 0.35], $     ;
                                xserrmod:[0.205, 0.185, 0.26], $    ;
                                ys:[8.441, 8.530, 8.619], $         ;
                                yserrn:[0.037, 0.024, 0.020], $     ;
                                yserrp:[0.032, 0.022, 0.018], $     ;
                                yserr:[0.0345, 0.023, 0.019], $ ;
                                ul:[0,0,0], $
                                ngal:[14,22,22] })                                                          ;
  self.ya12mzrdata = ptr_new({xsmod:[9.98, 10.28, 10.65], $   ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                              xserrmodn:[0.28, 0.17, 0.17], $ ;
                              xserrmodp:[0.13, 0.20, 0.35], $ ;
                              xserrmod:[0.205, 0.185, 0.26], $ ;
                              ys:[8.412, 8.492, 8.572], $      ;
                              yserrn:[0.045, 0.036, 0.018], $  ;
                              yserrp:[0.045, 0.036, 0.018], $  ;
                              yserr:[0.045, 0.036, 0.018], $   ;
                              ul:[0,0,0], $
                              ngal:[14, 22, 22] }) ;
  
END
;====================================================================================================


;====================================================================================================
PRO yabe2012::cleanup

  ptr_free, self.ya12N2data 
  ptr_free, self.ya12mzrdata
  ptr_free, self.ya12O3N2data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION yabe2012::init

  self.ya12objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO yabe2012__define

  void = {yabe2012, ya12objver:'A', $
          ya12sampsize:0, ya12zmin:0.0, ya12zmax:0.0, $
          ya12IMF:'A', ya12SEDfit:'A', ya12SEDmodels:'A', ya12mzrtype:'A', ya12mzrconvert:'A', $
          ya12selection:'A', $
          ya12N2data:ptr_new(), ya12O3N2data:ptr_new(), ya12mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

