;+
; NAME:
;       ERB2006()
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
PRO erb2006::getprop, OBJVER=objver, N2DATA=n2data, MZRDATA=mzrdata

  IF arg_present(OBJVER) THEN objver = self.e06objver     ;return the data
  IF arg_present(N2DATA) THEN n2data = *self.e06n2data    ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.e06mzrdata ;return the data
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION erb2006::mzrfit, xs


                                ;from Tremonti 2004 shifted down
  ys = -1.492 + 1.847*xs - 0.08026*xs^2 - 0.56 ;polynomial fit


  RETURN, ys
END
;====================================================================================================


;====================================================================================================
PRO erb2006::boxscore


  self.e06sampsize = 87                                                    ;sample size
  self.e06IMF = 'chabrier2003'                                             ;IMF choice
  self.e06mzrtype = 'N2'                                                   ;MZR conversion type
  self.e06selection = 'UV'                                                 ;sample selection
  self.e06zmin = 0.0                                                       ;minimum redshift
  self.e06zmax = 3.0                                                       ;maximum redshift
  self.e06N2data = ptr_new({xs:[0.27,0.71,1.5,2.6,4.1,10.5], $             ; 
                            xsmod:[9.43,9.85,10.18,10.41,10.61,11.02], $   ;
                            xserr:[0.15,0.17,0.3,0.4,0.6,5.4], $           ;
                            xserrmod:[0.191885, 0.0932245, 0.0791817, 0.0621481, 0.0593147,  0.180207], $  ;
                            ys:[-1.22,-1.00,-0.85,-0.78,-0.66,-0.56], $                                    ;
                            yserr:[0.0,0.08,0.05,0.05,0.04,0.02], $                                        ;
                            ul:[1,0,0,0,0,0]})                                                             ;
  self.e06mzrdata = ptr_new({xs:[0.27,0.71,1.5,2.6,4.1,10.5], $                                            ; 
                             xsmod:[9.43,9.85,10.18,10.41,10.61,11.02], $                                  ;
                             xserr:[0.15,0.17,0.3,0.4,0.6,5.4], $                                          ;
                             xserrmod:[0.191885, 0.0932245, 0.0791817, 0.0621481, 0.0593147,  0.180207], $ ;
                             ys:[8.20,8.33,8.42,8.46,8.52,8.58], $                                         ;
                             yserr:[0.07,0.07,0.06,0.06,0.06,0.06], $                                       ;
                             ul:[1,0,0,0,0,0]})                                                            ;
  
END
;====================================================================================================



;====================================================================================================
PRO erb2006::cleanup

  ptr_free, self.e06N2data
  ptr_free, self.e06mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION erb2006::init                            
  
  self.e06objver = 'v0-0-1'     ;code version
 
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO erb2006__define

  void = {erb2006, e06objver:'A', $
          e06sampsize:0, e06zmin:0.0, e06zmax:0.0, $
          e06IMF:'A', e06mzrtype:'A', e06selection:'A', e06N2data:ptr_new(), e06mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

