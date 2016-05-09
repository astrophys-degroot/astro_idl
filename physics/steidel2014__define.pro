;+
; NAME:
;       STEIDEL2014()
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
;       A. DeGroot, 2015 May 8, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO steidel2014::getprop, ST14OBJVER=st14objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(ST14OBJVER) THEN st14objver = self.st14objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.st14n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.st14mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION steidel2014::convertmetallicity, whratio, HAFLUX=haflux, HBFLUX=hbflux, $
                                          NIIFLUX=niiflux, OIIIFLUX=oiiiflux


  CASE whratio OF 
     'N2' : ys = 8.62 + 0.36 * alog10(niiflux / haflux) 
     'O3N2' : ys = 8.66 - 0.28 * alog10((oiiiflux/hbflux)/(niiflux/haflux))
     ELSE : BEGIN
        print, 'WARNING!! Choice of metallicity indicator not valid.'
        print, ' Only choices are N2 or O3N2' 
     ENDELSE
  ENDCASE

  
  RETURN, ys
END
;====================================================================================================


;====================================================================================================
FUNCTION steidel2014::MZRFIT, whmetal, xs


  CASE whmetal OF 
     'N2' : ys = 8.41 + 0.20 * (xs - 10.0)
     'O3N2' : ys = 8.27 + 0.19 * (xs - 10.0)
     ELSE : BEGIN
        print, 'WARNING!! Choice of metallicity indicator not valid.'
        print, ' Only choices are N2 or O3N2' 
     ENDELSE
  ENDCASE

  
  RETURN, ys
END
;====================================================================================================


;====================================================================================================
PRO steidel2014::boxscore


                                ;self.st14sampsize = 87                                                    ;sample size
                                ;self.st14IMF = 'chabrier2003'                                             ;IMF choice
                                ;self.st14mzrtype = 'N2'                                                   ;MZR conversion type
                                ;self.st14selection = 'UV'                                                 ;sample selection
                                ;self.st14zmin = 0.0                                                       ;minimum redshift
                                ;self.st14zmax = 3.0                                                       ;maximum redshift
  self.st14N2data = ptr_new({ xsmod:[8.87,9.34,9.69,9.87,10.11,10.37,10.66,11.19], $ ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                              xserrmodn:[0.27,0.34,0.19,0.07,0.11,0.12,0.16,0.19], $ ;
                              xserrmodp:[0.13,0.16,0.11,0.13,0.14,0.13,0.34,0.41], $ ;
                              xserrmod:[0.27,0.34,0.19,0.07,0.11,0.12,0.16,0.19], $  ;
                              ys:[8.13,8.25,8.30,8.36,8.42,8.49,8.53,8.67], $        ;
                              yserrn:[0.06,0.07,0.02,0.04,0.02,0.03,0.03,0.09], $    ;
                              yserrp:[0.05,0.03,0.03,0.03,0.04,0.04,0.02,0.09], $    ;
                              yserr:[0.06,0.07,0.02,0.04,0.02,0.03,0.03,0.09], $     ;
                              ul:[0,0,0,0,0,0,0,0], $
                              ngal:[8,35,48,34,39,32,39,8]})                           ;
  self.st14O3N2data = ptr_new({ xsmod:[8.87,9.34,9.69,9.87,10.11,10.37,10.66,11.19], $ ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                                xserrmodn:[0.27,0.34,0.19,0.07,0.11,0.12,0.16,0.19], $ ;
                                xserrmodp:[0.13,0.16,0.11,0.13,0.14,0.13,0.34,0.41], $ ;
                                xserrmod:[0.27,0.34,0.19,0.07,0.11,0.12,0.16,0.19], $  ;
                                ys:[8.06,8.16,8.20,8.21,8.28,8.35,8.39,8.55], $        ;
                                yserrn:[0.03,0.02,0.01,0.01,0.01,0.01,0.01,0.03], $    ;
                                yserrp:[0.03,0.02,0.01,0.01,0.01,0.01,0.01,0.03], $    ;
                                yserr:[0.03,0.02,0.01,0.01,0.01,0.01,0.01,0.03], $     ;
                                ul:[0,0,0,0,0,0,0,0], $
                                ngal:[8,35,48,34,39,32,39,8]})                        ;
  self.st14mzrdata = ptr_new({ xsmod:[8.87,9.34,9.69,9.87,10.11,10.37,10.66,11.19], $ ;
                                ;xs:[], $     
                                ;xserr:[], $                                            ;
                               xserrmodn:[0.27,0.34,0.19,0.07,0.11,0.12,0.16,0.19], $ ;
                               xserrmodp:[0.13,0.16,0.11,0.13,0.14,0.13,0.34,0.41], $ ;
                               xserrmod:[0.27,0.34,0.19,0.07,0.11,0.12,0.16,0.19], $  ;
                               ys:[8.13,8.25,8.30,8.36,8.42,8.49,8.53,8.67], $        ;
                               yserrn:[0.06,0.07,0.02,0.04,0.02,0.03,0.03,0.09], $    ;
                               yserrp:[0.05,0.03,0.03,0.03,0.04,0.04,0.02,0.09], $    ;
                               yserr:[0.06,0.07,0.02,0.04,0.02,0.03,0.03,0.09], $     ;
                               ul:[0,0,0,0,0,0,0,0]})                                 ;
  
END
;====================================================================================================


;====================================================================================================
PRO steidel2014::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION steidel2014::init

  self.st14objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO steidel2014__define

  void = {steidel2014, st14objver:'A', $
          st14sampsize:0, st14zmin:0.0, st14zmax:0.0, $
          st14IMF:'A', st14mzrtype:'A', st14selection:'A', $
          st14N2data:ptr_new(), st14O3N2data:ptr_new(), st14mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

