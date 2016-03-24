;+
; NAME:
;       SANDERS2014()
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
PRO sanders2014::getprop, SA14OBJVER=sa14objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(SA14OBJVER) THEN sa14objver = self.sa14objver ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.sa14n2data        ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.sa14mzrdata     ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION sanders2014::convertmetallicity, whratio, HAFLUX=haflux, HBFLUX=hbflux, $
                                          NIIFLUX=niiflux, OIIIFLUX=oiiiflux


  CASE whratio OF 
     'N2' : ys = 8.90 + 0.57 * alog10(niiflux / haflux) 
     ELSE : BEGIN
        print, 'WARNING!! Choice of metallicity indicator not valid.'
        print, ' Only choices are N2 or O3N2' 
     ENDELSE
  ENDCASE

  
  RETURN, ys
END
;====================================================================================================


;====================================================================================================
FUNCTION sanders2014::MZRFIT, whmetal, xs


  CASE whmetal OF 
     'N2' : print, 'No fit given!!'
     'O3N2' : print, 'No fit given!!'
     ELSE : BEGIN
        print, 'WARNING!! Choice of metallicity indicator not valid.'
        print, ' Only choices are N2 or O3N2' 
     ENDELSE
  ENDCASE

  
  RETURN, ys
END
;====================================================================================================


;====================================================================================================
PRO sanders2014::boxscore


  self.sa14sampsize = 87                                     ;sample size
  self.sa14IMF = 'chabrier2003'                              ;IMF choice
  self.sa14mzrtype = ['N2']                                  ;MZR conversion type
  self.sa14selection = 'Hband'                               ;sample selection
  self.sa14zmin = 2.08                                       ;minimum redshift
  self.sa14zmax = 2.61                                       ;maximum redshift
  self.sa14N2data = ptr_new({xs:[9.45,9.84,10.11,10.56], $   ; 
                             xserrn:[0.30,0.16,0.12,0.27], $ ;
                             xserrp:[0.23,0.10,0.16,0.55], $ ;
                             xsmod:[0.0,0.0,0.0,0.0], $      ;
                             ys:[8.18,8.30,8.44,8.52], $     ;
                             yserrn:[0.10,0.05,0.04,0.02], $ ;
                             yserrp:[0.07,0.04,0.04,0.02], $ ;
                             ul:[0,0,0,0], $
                             ngal:[22,22,22,21]})                ;
  self.sa14mzrdata = ptr_new( {xs:[0.28, 0.69, 1.29, 3.63], $    ; 
                               xserrn:[0.30,0.16,0.12,0.27], $   ;
                               xserrp:[0.23,0.10,0.16,0.55], $   ;
                               xsmod:[9.45,9.84,10.11,10.56], $  ;
                               xserrmod:[0.30,0.16,0.12,0.27], $ ;
                               ys:[8.18,8.30,8.44,8.52], $       ;
                               yserrn:[0.10,0.05,0.04,0.02], $   ;
                               yserrp:[0.07,0.04,0.04,0.02], $   ;
                               yserr:[0.10,0.05,0.04,0.02], $    ;
                               ul:[0,0,0,0]} )                   ;
  
END
;====================================================================================================


;====================================================================================================
PRO sanders2014::cleanup

  ptr_free, self.sa14N2data
  ptr_free, self.sa14mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION sanders2014::init

  self.sa14objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO sanders2014__define

  void = {sanders2014, sa14objver:'A', $
          sa14sampsize:0, sa14zmin:0.0, sa14zmax:0.0, $
          sa14IMF:'A', sa14mzrtype:'A', sa14selection:'A', sa14N2data:ptr_new(), sa14mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

