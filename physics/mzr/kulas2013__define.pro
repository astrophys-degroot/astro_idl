!;+
; NAME:
;       KULAS2013()
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
PRO kulas2013::getprop, OBJVER=objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(OBJVER) THEN objver = self.ku13objver     ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.ku13n2data    ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.ku13mzrdata ;return the data
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION kulas2013::mzrfit, xs


                                ;from Tremonti 2004 shifted down
  ys = -1.492 + 1.847*xs - 0.08026*xs^2 - 0.67 ;polynomial fit


  RETURN, ys
END
;====================================================================================================


;====================================================================================================
PRO kulas2013::boxscore


  self.ku13sampsize = 87                                                    ;sample size
  self.ku13IMF = 'chabrier2003'                                             ;IMF choice
  self.ku13mzrtype = 'N2'                                                   ;MZR conversion type
  self.ku13selection = 'UV'                                                 ;sample selection
  self.ku13zmin = 0.0                                                       ;minimum redshift
  self.ku13zmax = 3.0                                                       ;maximum redshift

  ;self.ku13N2data = ptr_new({xs:[0.27,0.71,1.5,2.6,4.1,10.5], $             ; 
  ;                          xsmod:[9.43,9.85,10.18,10.41,10.61,11.02], $   ;
  ;                          xserr:[0.15,0.17,0.3,0.4,0.6,5.4], $           ;
  ;                          xserrmod:[0.191885, 0.0932245, 0.0791817, 0.0621481, 0.0593147,  0.180207], $  ;
  ;                          ys:[-1.22,-1.00,-0.85,-0.78,-0.66,-0.56], $                                    ;
  ;                          yserr:[0.0,0.08,0.05,0.05,0.04,0.02], $                                        ;
  ;                          ul:[1,0,0,0,0,0]})                                                             ;

  ;self.ku13mzrdata = ptr_new({xs:[0.27,0.71,1.5,2.6,4.1,10.5], $                                            ; 
  ;                           xsmod:[9.43,9.85,10.18,10.41,10.61,11.02], $                                  ;
  ;                           xserr:[0.15,0.17,0.3,0.4,0.6,5.4], $                                          ;
  ;                           xserrmod:[0.191885, 0.0932245, 0.0791817, 0.0621481, 0.0593147,  0.180207], $ ;
  ;                           ys:[8.20,8.33,8.42,8.46,8.52,8.58], $                                         ;
  ;                           yserr:[0.07,0.07,0.06,0.06,0.06,0.06], $                                       ;
  ;                           ul:[1,0,0,0,0,0]})                                                            ;
  
END
;====================================================================================================



;====================================================================================================
PRO kulas2013::cleanup

  ptr_free, self.ku13N2data
  ptr_free, self.ku13mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION kulas2013::init                            
  
  self.ku13objver = 'v0-0-1'     ;code version
 
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO kulas2013__define

  void = {kulas2013, ku13objver:'A', $
          ku13sampsize:0, ku13zmin:0.0, ku13zmax:0.0, $
          ku13IMF:'A', ku13mzrtype:'A', ku13selection:'A', ku13N2data:ptr_new(), ku13mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

