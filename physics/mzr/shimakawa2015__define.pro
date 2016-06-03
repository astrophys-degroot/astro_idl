;+
; NAME:
;       SHIMAKAWA2015()
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
;       A. DeGroot, 2016 May 23, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO shimakawa2015::getprop, SH15OBJVER=sh15objver, N2CL1DATA=n2cl1data, N2CL2DATA=n2cl2data, $
                            MZRDATA=mzrdata

  IF arg_present(SH15OBJVER) THEN sh15objver = self.sh15objver   ;return the data
  IF arg_present(N2CL1DATA) THEN n2cl1data = *self.sh15n2cl1data ;return the data
  IF arg_present(N2CL2DATA) THEN n2cl2data = *self.sh15n2cl2data ;return the data
  IF arg_present(MZRDATA) THEN mzrdata = *self.sh15mzrdata       ;return the data
  

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION shimakawa2015::convertmetallicity 

  print, 'No conversion given!'
  
  RETURN, 0
END
;====================================================================================================


;====================================================================================================
FUNCTION shimakawa2015::MZRFIT

  print, 'No fit yet provided'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO shimakawa2015::boxscore


  self.sh15sampsize = 48                                 ;sample size
  self.sh15clsampsize = 48                               ;sample size
  self.sh15fieldsampsize = 0                             ;sample size
  self.sh15IMF = 'salpeter1955'                          ;IMF choice
  self.sh15SEDfit = ''                                   ;
  self.sh15SEDmodels = ''                                ;
  self.sh15mzrtype = 'N2'                                ;MZR conversion type
  self.sh15mzrconvert = 'PP04'                           ;converted to O/H by
  self.sh15selection = 'HAE'                             ;sample selection
  self.sh15zcl1 = 2.156                                  ;minimum redshift
                                ;self.sh15zcl1min =                                ;minimum redshift
                                ;self.sh15zcl1max =                                ;minimum redshift
  self.sh15zcl2 = 2.533         ;minimum redshift
                                ;self.sh15zcl2min =                               ;minimum redshift
                                ;self.sh15zcl2max =                                ;minimum redshift
  self.sh15zmin = 2.156         ;minimum redshift
  self.sh15zmax = 2.533         ;maximum redshift
  self.sh15N2cl1data = ptr_new({xsmod:[9.99,11.16], $    ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                                xserrmodn:[1.39,0.58], $ ;
                                xserrmodp:[0.55,0.40], $ ;
                                xserrmod:[0.80,0.49], $  ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                                ys:[8.38,8.59], $        ;
                                yserrn:[0.10,0.07], $    ;
                                yserrp:[0.10,0.07], $    ;
                                yserr:[0.10,0.07], $     ;
                                ul:[0,0], $              ;
                                ngal:[13,9] })           ;
  self.sh15N2cl2data = ptr_new({xsmod:[9.66,10.64], $    ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                                xserrmodn:[0.68,0.43], $ ;
                                xserrmodp:[0.42,0.43], $ ;
                                xserrmod:[0.56,0.43], $  ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                                ys:[8.37,8.58], $     ;
                                yserrn:[0.10,0.07], $ ;
                                yserrp:[0.10,0.07], $ ;
                                yserr:[0.10,0.07], $  ;
                                ul:[1,0], $           ;
                                ngal:[15,11] })       ;
  
  self.sh15mzrdata = ptr_new({xsmod:[9.99,11.16,9.66,10.64], $   ;
                                ;xs:[], $     
                                ;xserr:[], $       ;
                              xserrmodn:[1.39,0.58,0.68,0.43], $ ;
                              xserrmodp:[0.55,0.40,0.42,0.43], $ ;
                              xserrmod:[0.80,0.49,0.56,0.43], $  ;
                                ;yspre:[], $              ;just [NII]/Halpha
                                ;yspreerrn:[], $          ;
                                ;yspreerrp:[], $          ;
                                ;yspreerr:[], $           ;
                              ys:[8.38,8.59,8.37,8.58], $     ;
                              yserrn:[0.10,0.07,0.10,0.07], $ ;
                              yserrp:[0.10,0.07,0.10,0.07], $ ;
                              yserr:[0.10,0.07,0.10,0.07], $  ;
                              ul:[0,0,1,0], $                 ;
                              ngal:[13,9,15,11] })            ;
  
  
END
;====================================================================================================


;====================================================================================================
PRO shimakawa2015::cleanup

  ptr_free, self.sh15N2cl1data 
  ptr_free, self.sh15N2cl2data
  ptr_free, self.sh15mzrdata

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION shimakawa2015::init

  self.sh15objver = 'v1-0-0'
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO shimakawa2015__define

  void = {shimakawa2015, sh15objver:'A', $
          sh15sampsize:0, sh15clsampsize:0, sh15fieldsampsize:0, $
          sh15zcl1:0.0, sh15zcl2:0.0, sh15zmin:0.0, sh15zmax:0.0, $
          sh15IMF:'A', sh15SEDfit:'A', sh15SEDmodels:'A', sh15mzrtype:'A', sh15mzrconvert:'A', $
          sh15selection:'A', $
          sh15N2cl1data:ptr_new(), sh15N2cl2data:ptr_new(), sh15mzrdata:ptr_new()}

  RETURN
END
;====================================================================================================

