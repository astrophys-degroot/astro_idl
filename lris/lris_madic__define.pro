;+
; NAME:
;       LRIS_MADIC()
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
PRO LRIS_MADIC::getprop, LMAOBJVER=lmaobjver, LMAINFILE=lmainfile, LMAINDIR1=lmaindir1 

  IF arg_present(LMAOBJVER) THEN lmaobjver = self.lmaobjver ;return the data
  IF arg_present(LMAINFILE) THEN lmainfile = self.lmainfile ;return the data
  IF arg_present(LMAINDIR1) THEN lmaindir1 = self.lmaindir1 ;return the data

  RETURN
END
;====================================================================================================



;====================================================================================================
FUNCTION LRIS_MADIC::readfile


  xdata = mrdfits(strcompress(self.lmaindir1 + self.lmainfile, /REMOVE_ALL), 1, hdr)
                                ;help, xdata, /STRUC

  RETURN, xdata
END
;====================================================================================================


;====================================================================================================
PRO LRIS_MADIC::create


  data = self.readfile()
  cnt = 1
  radec, data.raone, data.decone, irah, iram, iras, idech, idecm, idecs
  openw, lun, self.lmaoutfile, /GET_LUN
  openw, lun2, self.lmaregfile, /GET_LUN
  picked = intarr(n_elements(data.(0)))
  help, picked


  IF keyword_set(APRIOR) THEN aprior = aprior[0] ELSE aprior = '1000' ;set new value
  IF keyword_set(BPRIOR) THEN bprior = bprior[0] ELSE bprior= '400'   ;set new value
  IF keyword_set(CPRIOR) THEN cprior = cprior[0] ELSE cprior = '300'   ;set new value
  IF keyword_set(DPRIOR) THEN dprior = dprior[0] ELSE dprior = '200'    ;set new value
  IF keyword_set(EPRIOR) THEN eprior = eprior[0] ELSE eprior = '50'    ;set new value
  IF keyword_set(FPRIOR) THEN fprior = fprior[0] ELSE fprior = '1'    ;set new value
  IF keyword_set(GPRIOR) THEN gprior = gprior[0] ELSE gprior = '10'    ;set new value
  


  FOR xx=0, 6, 1 DO BEGIN
     CASE xx OF
        0 : BEGIN
           chk = where((data.SP_M_QFLAG_MOSFIRE EQ 2) AND (picked EQ 0), nchk)
           p = 'a'
           prior = aprior
        END
        1 : BEGIN
           chk = where((data.SP_M_QFLAG_MOSFIRE EQ 3) AND (picked EQ 0), nchk)
           p = 'f'
           prior = fprior
        END
        2 : BEGIN
           chk = where((data.PH_Z_M2 GT 1.2) AND ((data.ph_u68 - data.ph_l68) LE 0.5) AND $
                       (picked EQ 0), nchk)
           p = 'b'           
           prior = bprior
        END
        3 : BEGIN
           chk = where((data.PH_Z_M2 GT 1.2) AND ((data.ph_u68 - data.ph_l68) GT 0.5) AND $
                       ((data.ph_u68 - data.ph_l68) LE 1.0) AND (picked EQ 0), nchk)
           p = 'c'           
           prior = cprior
        END
        4 : BEGIN
           chk = where((data.PH_Z_M2 GT 1.2) AND ((data.ph_u68 - data.ph_l68) GT 1.0) AND $
                       ((data.ph_u68 - data.ph_l68) LE 2.0) AND (picked EQ 0), nchk)
           p = 'd'           
           prior = dprior
        END

        5 : BEGIN
           chk = where((data.PH_ZFLUX GT 2.5) AND (data.PH_ZFLUX LT 4000.0) AND $
                       (picked EQ 0), nchk)
           p = 'e'
           prior = eprior
        END
        6 : BEGIN
           chk = where((picked EQ 0), nchk)
           p = 'g'
           prior = gprior
        END
        ELSE : print, 'WARNING!! Case not found!!'
     ENDCASE
     
     print, nchk
     IF nchk NE 0 THEN BEGIN
        picked[chk] = 1
        names = strcompress('obj'+ p +string(indgen(nchk)+cnt), /REMOVE_ALL)
        zmag = string(-2.5*alog10(data[chk].PH_ZFLUX)+25.0)
        rahms = strcompress(string(irah[chk]) + ':' + string(iram[chk]) + ':' + string(iras[chk]), /REMOVE_ALL)
        dechms = strcompress(string(idech[chk]) + ':' + string(idecm[chk]) + ':' + string(idecs[chk]), /REMOVE_ALL)
        FOR yy=0UL, nchk-1, 1 DO BEGIN
           str = strcompress(names[yy] + ' ' + prior + ' ' + zmag[yy] + ' ' + rahms[yy] + ' ' + dechms[yy])
           printf, lun, str
           printf, lun2, data[chk[yy]].raone, data[chk[yy]].decone 
        ENDFOR
     ENDIF
     
  ENDFOR
  
  free_lun, lun, lun2
  
  


  RETURN
END
;====================================================================================================


;====================================================================================================
PRO LRIS_MADIC::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION LRIS_MADIC::init, LMAINFILE=lmainfile, LMAINDIR1=lmaindir1, $
                           LMAOUTFILE=lmaoutfile, LMAREGFILE=lmaregfile 
  
  self.lmaobjver = 'v0-1-0'                                                                                                                ;code version
  ;IF keyword_set(LMAINFILE) THEN self.lmainfile = lmainfile ELSE self.lmainfile = 'xmm113_pz_specz_full_v1-2-0.fits'                       ;set prop
  ;IF keyword_set(LMAINDIR1) THEN self.lmaindir1 = lmaindir1 ELSE self.lmaindir1 = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/' ;set prop
  IF keyword_set(LMAINFILE) THEN self.lmainfile = lmainfile ELSE self.lmainfile = 'CDFS44_pz_specz_full_v3-6-3.fits'                       ;set prop
  IF keyword_set(LMAINDIR1) THEN self.lmaindir1 = lmaindir1 ELSE self.lmaindir1 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/' ;set prop
  IF keyword_set(LMAOUTFILE) THEN self.lmaoutfile = lmaoutfile[0] ELSE self.lmaoutfile = 'lris_maskinput.txt'                              ;set new value
  IF keyword_set(LMAREGFILE) THEN self.lmaregfile = lmaregfile[0] ELSE self.lmaregfile = 'lris_maskinput.reg'                              ;set new value

  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO LRIS_MADIC__define

  void = {LRIS_MADIC, lmaobjver:'A', lmainfile:'A', lmaindir1:'A', $
          lmaoutfile:'A', lmaregfile:'A'}
 

  RETURN
END
;====================================================================================================

