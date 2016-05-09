;+
; NAME:
;       ZAHID2014()
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
PRO zahid2014::getprop, ZA14OBJVER=za14objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(ZA14OBJVER) THEN za14objver = self.za14objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.za14n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.za14mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION zahid2014::convertmetallicity;, whratio, HAFLUX=haflux, HBFLUX=hbflux, $
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
FUNCTION zahid2014::MZRFIT

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
PRO zahid2014::boxscore


  self.za14sampsize = 162                                                                                      ;sample size
  self.za14IMF = 'chabrier2003'                                                                                ;IMF choice
  self.za14SEDfit = 'LePhare'                                                                                      ;
  ;;;but also photo-z and stellar mass
  self.za14mzrtype = 'N2'                                                                                      ;MZR type i.e. which emission lines
  self.za14mzrconvert = 'PP04'                                                                                  ;converted to O/H by
  self.za14selection = 'sBzK'                                                                                  ;sample selection
  self.za14zmin = 1.4                                                                                          ;minimum redshift
  self.za14zmax = 1.7                                                                                          ;maximum redshift
  self.za14N2data = ptr_new({ xsmod:[9.70, 9.83, 9.95, 10.05, 10.11, 10.17, 10.25, 10.35, 10.50, 10.83], $     ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                              xserrmodn:[0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1], $                  ;
                              xserrmodp:[0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1], $                  ;
                              xserrmod:[0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1], $                   ;
                              ys:[8.358, 8.382, 8.454, 8.482, 8.514, 8.515, 8.531, 8.587, 8.652, 8.661], $     ;
                              yserrn:[0.038, 0.034, 0.022, 0.021, 0.024, 0.019, 0.019, 0.014, 0.013, 0.013], $ ;^2 + 0.18^2)^0.5, $    ;
                              yserrp:[0.038, 0.034, 0.022, 0.021, 0.024, 0.019, 0.019, 0.014, 0.013, 0.013], $ ;
                              yserr:[0.038, 0.034, 0.022, 0.021, 0.024, 0.019, 0.019, 0.014, 0.013, 0.013], $  ;
                              ul:[0,0,0,0,0,0,0,0,0,0,0], $
                              ngal:[16, 16, 16, 16, 16, 16, 15, 15, 15, 15] })                                ;
  self.za14mzrdata = ptr_new({xsmod:[9.70, 9.83, 9.95, 10.05, 10.11, 10.17, 10.25, 10.35, 10.50, 10.83], $    ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                              xserrmodn:[0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1], $                 ;
                              xserrmodp:[0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1], $                 ;
                              xserrmod:[0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1], $                  ;
                              ys:[8.358, 8.382, 8.454, 8.482, 8.514, 8.515, 8.531, 8.587, 8.652, 8.661], $    ;
                              yserrn:[0.038, 0.034, 0.022, 0.021, 0.024, 0.019, 0.019, 0.014, 0.013, 0.013], $ ;^2 + 0.18^2)^0.5, $    ;
                              yserrp:[0.038, 0.034, 0.022, 0.021, 0.024, 0.019, 0.019, 0.014, 0.013, 0.013], $ ;
                              yserr:[0.038, 0.034, 0.022, 0.021, 0.024, 0.019, 0.019, 0.014, 0.013, 0.013], $  ;
                              ul:[0,0,0,0,0,0,0,0,0,0,0], $
                              ngal:[16, 16, 16, 16, 16, 16, 15, 15, 15, 15] }) ;
  
END
;====================================================================================================


;====================================================================================================
PRO zahid2014::cleanup

  ptr_free, self.za14N2data 
  ptr_free, self.za14mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION zahid2014::init

  self.za14objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO zahid2014__define

  void = {zahid2014, za14objver:'A', $
          za14sampsize:0, za14zmin:0.0, za14zmax:0.0, $
          za14IMF:'A', za14SEDfit:'A', za14mzrtype:'A', za14mzrconvert:'A', $
          za14selection:'A', $
          za14N2data:ptr_new(), za14mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

