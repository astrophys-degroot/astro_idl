;+
; NAME:
;       YABE2014()
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
PRO yabe2014::getprop, YA14OBJVER=ya14objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(YA14OBJVER) THEN ya14objver = self.ya14objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.ya14n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.ya14mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION yabe2014::convertmetallicity;, whratio, HAFLUX=haflux, HBFLUX=hbflux, $
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
FUNCTION yabe2014::MZRFIT

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
PRO yabe2014::boxscore


  self.ya14sampsize = 275                                            ;sample size
  self.ya14IMF = 'salpeter1955'                                      ;IMF choice
  self.ya14SEDfit = 'SEDfit'                                         ;
  self.ya14SEDmodels = 'BC03'                                        ;
  self.ya14mzrtype = 'N2'                                            ;MZR conversion type
  ;;;also O3N2
  self.ya14mzrconvert = 'PP04'                                       ;converted to O/H by
  self.ya14selection = 'photoz'                                      ;sample selection
  ;;;but also Ks band and stellar mass cuts
  self.ya14zmin = 1.2                                                ;minimum redshift
  self.ya14zmax = 1.6                                                ;maximum redshift
  self.ya14N2data = ptr_new({xsmod:[9.81,10.06,10.25,10.46,10.74], $ ;
                             xserrmodn:[0.31,0.12,0.09,0.13,0.15], $ ;
                             xserrmodp:[0.13,0.10,0.08,0.13,0.26], $ ;
                             xserrmod:[0.22,0.11,0.08,0.13,0.20], $  ;
                             ys:[8.45,8.49,8.48,8.53,8.60], $        ;
                             yserrn:[0.03,0.03,0.03,0.02,0.02], $    ;
                             yserrp:[0.03,0.03,0.03,0.02,0.02], $    ;
                             yserr:[0.03,0.03,0.03,0.02,0.02], $     ;
                             ul:[0,0,0,0,0], $
                             ngal:[55,54,54,54,54] })                 ;
  self.ya14O3N2data = ptr_new()                                       ;
  self.ya14mzrdata = ptr_new({xsmod:[9.81,10.06,10.25,10.46,10.74], $ ;
                              xserrmodn:[0.31,0.12,0.09,0.13,0.15], $ ;
                              xserrmodp:[0.13,0.10,0.08,0.13,0.26], $ ;
                              xserrmod:[0.22,0.11,0.08,0.13,0.20], $  ;
                              ys:[8.45,8.49,8.48,8.53,8.60], $        ;
                              yserrn:[0.03,0.03,0.03,0.02,0.02], $    ;
                              yserrp:[0.03,0.03,0.03,0.02,0.02], $    ;
                              yserr:[0.03,0.03,0.03,0.02,0.02], $     ;
                              ul:[0,0,0,0,0], $
                              ngal:[55,54,54,54,54] }) ;
  
END
;====================================================================================================


;====================================================================================================
PRO yabe2014::cleanup

  ptr_free, self.ya14N2data 
  ptr_free, self.ya14mzrdata
  ptr_free, self.ya14O3N2data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION yabe2014::init

  self.ya14objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO yabe2014__define

  void = {yabe2014, ya14objver:'A', $
          ya14sampsize:0, ya14zmin:0.0, ya14zmax:0.0, $
          ya14IMF:'A', ya14SEDfit:'A', ya14SEDmodels:'A', ya14mzrtype:'A', ya14mzrconvert:'A', $
          ya14selection:'A', $
          ya14N2data:ptr_new(), ya14O3N2data:ptr_new(), ya14mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

