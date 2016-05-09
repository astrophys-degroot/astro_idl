;+
; NAME:
;       CULLEN2015()
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
;
;
; DESIRED UPGRADES
;
;     
;
;-

;====================================================================================================
PRO cullen2015::getprop, OBJVER=objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(OBJVER) THEN objver = self.cu15objver     ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.cu15n2data    ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.cu15mzrdata ;return the data
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION cullen2015::mzrfit, xs


                                ;from Tremonti 2004 shifted down
                                ;ys = -1.492 + 1.847*xs - 0.08026*xs^2 - 0.56 ;polynomial fit


  RETURN, 0
END
;====================================================================================================


;====================================================================================================
PRO cullen2015::boxscore


  self.cu15sampsize = 93          ;sample size
  self.cu15IMF = 'chabrier2003'   ;IMF choice
  self.cu15mzrtype = 'R23'        ;MZR conversion type; but really unique
  self.cu15mzrconvert = 'ma08'    ;how conversion from line fluxes to 12+log(O/H)
  self.cu15selection = 'HSTF160W' ;sample selection
  self.cu15zmin = 2.0             ;minimum redshift
  self.cu15zmax = 2.3             ;maximum redshift

  self.cu15R23data = ptr_new({  $                                      ;xs:[], $       ; 
                     xsmod:[9.44, 9.65, 9.75, 9.94, 10.07, 10.25], $   ;
                                ;xserr:[], $    ;
                     xserrmodn:[0.16, 0.11, 0.05, 0.07, 0.07, 0.11], $ ;
                     xserrmodp:[0.09, 0.05, 0.11, 0.04, 0.07, 0.22], $ ;
                     xserrmod:[0.16, 0.11, 0.05, 0.07, 0.07, 0.11], $  ;
                     ys:[8.10, 8.13, 8.26, 8.30, 8.41, 8.41], $        ;
                     yserrn:[0.11, 0.12, 0.09, 0.09, 0.09, 0.08], $    ;
                     yserrp:[0.10, 0.13, 0.11, 0.09, 0.09, 0.09], $    ;
                     yserr:[0.11, 0.12, 0.09, 0.09, 0.09, 0.08], $     ;
                     ul:[0,0,0,0,0,0]})                                ;
  self.cu15mzrdata = ptr_new({  $                                      ;xs:[], $       ; 
                     xsmod:[9.44, 9.65, 9.75, 9.94, 10.07, 10.25], $   ;
                                ;xserr:[], $    ;
                     xserrmodn:[0.16, 0.11, 0.05, 0.07, 0.07, 0.11], $ ;
                     xserrmodp:[0.09, 0.05, 0.11, 0.04, 0.07, 0.22], $ ;
                     xserrmod:[0.16, 0.11, 0.05, 0.07, 0.07, 0.11], $  ;
                     ys:[8.10, 8.13, 8.26, 8.30, 8.41, 8.41], $        ;
                     yserrn:[0.11, 0.12, 0.09, 0.09, 0.09, 0.08], $    ;
                     yserrp:[0.10, 0.13, 0.11, 0.09, 0.09, 0.09], $    ;
                     yserr:[0.11, 0.12, 0.09, 0.09, 0.09, 0.08], $     ;
                     ul:[0,0,0,0,0,0]})                                ;
  
END
;====================================================================================================



;====================================================================================================
PRO cullen2015::cleanup

  ptr_free, self.cu15R23data
  ptr_free, self.cu15mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION cullen2015::init                            
  
  self.cu15objver = 'v0-0-1'     ;code version
 
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO cullen2015__define

  void = {cullen2015, cu15objver:'A', $
          cu15sampsize:0, cu15zmin:0.0, cu15zmax:0.0, $
          cu15IMF:'A', cu15mzrtype:'A', cu15mzrconvert:'A', $
          cu15selection:'A', cu15R23data:ptr_new(), cu15mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

