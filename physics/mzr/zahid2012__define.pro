;+
; NAME:
;       ZAHID2012()
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
PRO zahid2012::getprop, ZA12OBJVER=za12objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(ZA12OBJVER) THEN za12objver = self.za12objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.za12n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.za12mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION zahid2012::convertmetallicity;, whratio, HAFLUX=haflux, HBFLUX=hbflux, $
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
FUNCTION zahid2012::MZRFIT

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
PRO zahid2012::boxscore


  self.za12sampsize = 1348         ;sample size
  self.za12IMF = 'chabrier2003' ;IMF choice
  self.za12SEDfit = 'LePhare'   ;
  self.za12SEDmodels = 'BC03'   ;
  self.za12mzrtype = 'R23'       ;MZR conversion type
  ;;;but also O3N2
  self.za12mzrconvert = 'KK04'   ;converted to O/H by
  self.za12selection = 'UV'      ;sample selection
  self.za12zmin = 0.75           ;minimum redshift
  self.za12zmax = 0.82           ;maximum redshift
  self.za12R23data = ptr_new({ xsmod:[9.25, 9.32, 9.39, 9.44, 9.49, 9.56, 9.64, 9.72, 9.79, 9.87, 9.97, 10.07, 10.18, 10.33, 10.59]+0.29, $ ;
                                ;xs:[], $     
                                ;xserr:[], $      ;
                               xserrmodn:[0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14], $            ;
                               xserrmodp:[0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14], $            ;
                               xserrmod:[0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14], $             ;
                               ys:[8.69, 8.76, 8.78, 8.77, 8.74, 8.80, 8.83, 8.84, 8.86, 8.92, 8.94, 8.93, 8.96, 9.00, 9.04]-0.39, $     ;
                               yserrn:[0.02, 0.02, 0.02, 0.02, 0.01, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.01, 0.01, 0.01], $ ;
                               yserrp:[0.02, 0.02, 0.02, 0.02, 0.01, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.01, 0.01, 0.01], $ ;
                               yserr:[0.02, 0.02, 0.02, 0.02, 0.01, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.01, 0.01, 0.01], $  ;
                               ul:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], $
                               ngal:[90,90,90,90,90,90,90,90,90,90,90,90,90,90]})  
  ;self.za12R23data = ptr_new({ xsmod:[8.51,8.82,8.97, 9.08, 9.17, 9.23, 9.30, 9.36, 9.41, 9.45, 9.49, 9.54, 9.57, 9.61, 9.64, 9.68, 9.71, 9.75, $
  ;                                    9.78, 9.81, 9.85, 9.88, 9.92, 9.95, 10.00, 10.04, 10.09, 10.15, 10.24, 10.39]+0.29, $ ;
                                ;xs:[], $     
                                ;xserr:[], $      ;
  ;                             xserrmodn:[0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14, $
  ;                                        0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14], $ ;
  ;                             xserrmodp:[0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14, $
  ;                                        0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14], $ ;
  ;                             xserrmod:[0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14, $
  ;                                       0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14], $ ;
  ;                             ys:[8.707,8.736,8.787,8.819,8.859,8.875,8.900,8.920,8.923,8.946,8.947,8.969,8.977,8.993,8.989,9.007,9.010, $
  ;                                 9.022,9.035,9.037,9.048,9.056,9.059,9.068,9.061,9.081,9.084,9.088,9.086,9.095], $ ;
  ;                             yserrn:[0.04, 0.06, 0.07, 0.08, 0.07, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.04, 0.06, 0.05, 0.04, 0.04, 0.04, $
  ;                                     0.03, 0.04, 0.03, 0.03, 0.03, 0.03, 0.03, 0.02, 0.03, 0.02, 0.03, 0.02], $ ;
  ;                             yserrp:[0.04, 0.06, 0.07, 0.08, 0.07, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.04, 0.06, 0.05, 0.04, 0.04, 0.04, $
  ;                                     0.03, 0.04, 0.03, 0.03, 0.03, 0.03, 0.03, 0.02, 0.03, 0.02, 0.03, 0.02], $ ;
  ;                             yserr:[0.04, 0.06, 0.07, 0.08, 0.07, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.04, 0.06, 0.05, 0.04, 0.04, 0.04, $
  ;                                    0.03, 0.04, 0.03, 0.03, 0.03, 0.03, 0.03, 0.02, 0.03, 0.02, 0.03, 0.02], $ ;
  ;                             ul:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], $
  ;                             ngal:[700,700,700,700,700,700,700,700,700,700,700,700,700,700]})  
  self.za12mzrdata = ptr_new({ xsmod:[9.25, 9.32, 9.39, 9.44, 9.49, 9.56, 9.64, 9.72, 9.79, 9.87, 9.97, 10.07, 10.18, 10.33, 10.59]+0.29, $ ;
                                ;xs:[], $     
                                ;xserr:[], $      ;
                               xserrmodn:[0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14], $            ;
                               xserrmodp:[0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14], $            ;
                               xserrmod:[0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14,0.14], $             ;
                               ys:[8.69, 8.76, 8.78, 8.77, 8.74, 8.80, 8.83, 8.84, 8.86, 8.92, 8.94, 8.93, 8.96, 9.00, 9.04]-0.39, $     ;
                               yserrn:[0.02, 0.02, 0.02, 0.02, 0.01, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.01, 0.01, 0.01], $ ;
                               yserrp:[0.02, 0.02, 0.02, 0.02, 0.01, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.01, 0.01, 0.01], $ ;
                               yserr:[0.02, 0.02, 0.02, 0.02, 0.01, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.01, 0.01, 0.01], $  ;
                               ul:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], $
                               ngal:[90,90,90,90,90,90,90,90,90,90,90,90,90,90]}) ;
  
END
;====================================================================================================


;====================================================================================================
PRO zahid2012::cleanup

  ptr_free, self.za12R23data 
  ptr_free, self.za12mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION zahid2012::init

  self.za12objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO zahid2012__define

  void = {zahid2012, za12objver:'A', $
          za12sampsize:0, za12zmin:0.0, za12zmax:0.0, $
          za12IMF:'A', za12SEDfit:'A', za12SEDmodels:'A', za12mzrtype:'A', za12mzrconvert:'A', $
          za12selection:'A', $
          za12R23data:ptr_new(), za12mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

