;+
; NAME:
;       degroot2015a()
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
PRO degroot2015a::getprop, D15AOBJVER=d15aobjver

  IF arg_present(D15AOBJVER) THEN d15aobjver = self.d15aobjver ;return the data

  RETURN
END
;====================================================================================================



;====================================================================================================
PRO degroot2015a::sample, infile, outfile, REMTAGS=remtags, TGRA=tgra, TGDEC=tgdec, TGMFLAG=tgmflag, $ 
                          TGSPZ1=tgspz1, TGSPZ2=tgspz2, SPZDIFF=spzdiff, SPECZMIN=speczmin, SPECZMAX=speczmax, $
                          TGHAFLUX=tghaflux, HAFLUXMIN=hafluxmin, HAFLUXMAX=hafluxmax, TGEHAFLUX=tgehaflux, $
                          TGNIIFLUX=tgniiflux, NIIFLUXMIN=niifluxmin, NIIFLUXMAX=niifluxmax, $
                          TGMASS=tgmass, MASSMIN=massmin, MASSMAX=massmax, HELP=help


  IF keyword_set(TGRA) THEN tgra = tgra[0] ELSE tgra = 'mra'                                                ;set default value
  IF keyword_set(TGDEC) THEN tgdec = tgdec[0] ELSE tgdec = 'mdec'                                           ;set default value
  IF keyword_set(TGMFLAG) THEN tgmflag = string(tgmflag[0]) ELSE tgmflag = 'mflag'                          ;set default value
  IF keyword_set(MFLAGMIN) THEN mflagmin = string(mflagmin[0]) ELSE mflagmin = -999                         ;set default value
  IF keyword_set(MFLAGMAX) THEN mflagmax = string(mflagmax[0]) ELSE mflagmax = 999                          ;set default value
  IF keyword_set(TGSPZ1) THEN tgspz1 = string(tgspz1[0]) ELSE tgspz1 = 'sp_speczbest'                       ;set default value
  IF keyword_set(TGSPZFLAG1) THEN tgspzflag1 = string(tgspzflag1[0]) ELSE tgspzflag1 = 'sp_speczflag'       ;set default value
  IF keyword_set(TGCLMEM) THEN tgclmem = string(tgclmem[0]) ELSE tgclmem = 'AN_SHIGAP'                      ;set default value
  IF keyword_set(SPZFLAG1MIN) THEN spzflag1min = string(spzflag1min[0]) ELSE spzflag1min = 0                ;set default value
  IF keyword_set(SPZFLAG1MAX) THEN spzflag1max = string(spzflag1max[0]) ELSE spzflag1max = 0                ;set default value
  IF keyword_set(TGSPZ2) THEN tgspz2 = string(tgspz2[0]) ELSE tgspz2 = 'sp_m_z'                             ;set default value
  IF keyword_set(SPECZMIN) THEN speczmin = float(speczmin[0]) ELSE speczmin = 1.23                          ;set default value
  IF keyword_set(SPECZMAX) THEN speczmax = float(speczmax[0]) ELSE speczmax = 1.75                          ;set default value
  IF keyword_set(SPZDIFF) THEN spzdiff = float(spzdiff[0]) ELSE spzdiff = 0.1                               ;set default value 
  IF keyword_set(TGHAFLUX) THEN tghaflux = tghaflux[0] ELSE tghaflux = 'sp_m_ha_flux'                       ;set default value
  IF keyword_set(HAFLUXMIN) THEN hafluxmin = float(hafluxmin[0]) ELSE hafluxmin = 0.0                       ;set default value
  IF keyword_set(HAFLUXMAX) THEN hafluxmax = float(hafluxmax[0]) ELSE hafluxmax = 99999.0                   ;set default value 
  IF keyword_set(TGEHAFLUX) THEN tgehaflux = tgehaflux[0] ELSE tgehaflux = 'SP_M_HA_FLUXERR'                ;set default value
  IF keyword_set(HASNRMIN) THEN hasnrmin = float(hasnrmin[0]) ELSE hasnrmin = 4.0                           ;set default value
  IF keyword_set(TGNIIFLUX) THEN tgniiflux = tgniiflux[0] ELSE tgniiflux = 'sp_m_niir_flux'                 ;set default value
  IF keyword_set(NIIFLUXMIN) THEN niifluxmin = float(niifluxmin[0]) ELSE niifluxmin = -99999.0              ;set default value
  IF keyword_set(NIIFLUXMAX) THEN niifluxmax = float(niifluxmax[0]) ELSE niifluxmax = 99999.0               ;set default value 
  IF keyword_set(TGNIIFLAG) THEN tgniiflag = tgniiflag[0] ELSE tgniiflag = 'sp_m_niir_flag'                 ;set default value
  IF keyword_set(TGMASS) THEN tgmass = tgmass[0] ELSE tgmass = 'ph_lmass'                                   ;set default value
  IF keyword_set(MASSMIN) THEN massmin = float(massmin[0]) ELSE massmin = 8.0                               ;set default value
  IF keyword_set(MASSMAX) THEN massmax = float(massmax[0]) ELSE massmax = 14.0                              ;set default value 
  IF keyword_set(TGPOSSIBLE) THEN tgpossible = string(tgpossible[0]) ELSE tgpossible = 'SP_M_QFLAG_MOSFIRE' ;set default value
  IF keyword_set(POSSMIN) THEN possmin = float(possmin[0]) ELSE possmin = 0                                 ;set default value
  IF keyword_set(POSSMAX) THEN possmax = float(possmax[0]) ELSE possmax = 3                                 ;set default value 

  
  ;;;read in catalog
  xdata = mrdfits(infile, 1, hdr)         ;copy data
  prenxdata = n_elements(xdata)           ;number of entries to start
  prentags = n_elements(tag_names(xdata)) ;how many tags started
  keepers = indgen(n_elements(xdata))     ;indices array


  ;;;declare object
  cleancat = obj_new('kemclass_clean', xdata) ;declare object
  cleancat.getprop, OBJVER=myclean            ;get some object properities

  ;;;remove unnecessary columns of data
  xdata = cleancat.removetags(['ADJUSTRA', 'ADJUSTDEC', $
                               'SP_ID', 'SP_RABEST', 'SP_DECBEST', 'SP_SPECZDIFF', $                                                                 ;remove unnecessary info
                               'SP_M_RAH', 'SP_M_RAM', 'SP_M_RAS', 'SP_M_DECD', 'SP_M_DECM', 'SP_M_DECS', $                                          ;
                               'SP_M_DZ', 'SP_M_SLIT', 'SP_M_MOBINSLIT', 'SP_M_RA', 'SP_M_DEC', $                                                    ;
                               'SP_M_OIIB_FLUX', 'SP_M_OIIB_FLUXERR', 'SP_M_OIIB_FLAG', 'SP_M_OIIR_FLUX', 'SP_M_OIIR_FLUXERR', 'SP_M_OIIR_FLAG', $   ;
                               'SP_M_HB_FLUX', 'SP_M_HB_FLUXERR', 'SP_M_HB_FLAG', 'SP_M_OIIIB_FLUX', 'SP_M_OIIIB_FLUXERR', 'SP_M_OIIIB_FLAG', $      ;
                               'SP_M_OIIIR_FLUX', 'SP_M_OIIIR_FLUXERR', 'SP_M_OIIIR_FLAG', 'SP_M_OI6300_FLUX', 'SP_M_OI6300_FLUXERR', $              ;
                               'SP_M_OI6300_FLAG', 'SP_M_NIIB_FLUX', 'SP_M_NIIB_FLUXERR', 'SP_M_NIIB_FLAG', 'SP_M_SIIB_FLUX', 'SP_M_SIIB_FLUXERR', $ ;
                               'SP_M_SIIB_FLAG', 'SP_M_SIIR_FLUX', 'SP_M_SIIR_FLUXERR', 'SP_M_SIIR_FLAG', 'SP_G_ID', 'SP_G_RA', 'SP_G_DEC', $        ;
                               'SP_G_PIXX', 'SP_G_PIXY', 'SP_G_PR', 'SP_G_QFLAG_FORS2', $                                                            ;
                               'SP_G_Z_FORS2', 'SP_J_ID', 'SP_J_RA', 'SP_J_DEC', 'SP_J_PRI_MAG', 'SP_J_MAGZ', 'SP_J_MAGK', 'SP_J_PHOTZ', $           ;
                               'SP_J_PHOTZNERR', 'SP_J_PHOTZPERR', 'SP_J_PROB', 'SP_J_PRI_NEW', $                                                    ;
                               'SP_J_ORIGINAL_ORDER', 'SP_J_MASK', 'SP_J_SLIT', 'SP_J_AP', 'SP_J_HERSCH_PRI', 'SP_J_SPECZ', 'SP_J_NOTES', $          ;
                               'SP_P_OBJNAME', 'SP_P_RA', 'SP_P_DEC', 'SP_P_SURVEY', 'SP_P_FIELD', $                                                 ;
                               'SP_P_MASK', 'SP_P_Z', 'SP_P_ZQUALITY', 'SP_P_PRIMARY', 'SP_P_INWINDOW_2MASK', 'SP_P_CLASS', 'SP_P_WEIGHT', $         ;
                               'SP_P_TARGET_MAG', 'SP_P_TARGET_BAND', 'SP_P_BESSELL_MAG', $                                                          ;
                               'SP_P_BESSELL_ABSMAG', 'SP_P_SDSS_MAG', 'SP_P_SDSS_ABSMAG', 'PH_ID', 'PH_RA', 'PH_DEC', 'PH_X', 'PH_Y', $             ;
                               'PH_KFLUX_TOT', 'PH_UFLUX', 'PH_GFLUX', 'PH_RFLUX', 'PH_IFLUX', 'PH_ZFLUX', $                                         ;
                               'PH_YFLUX', 'PH_JFLUX', 'PH_KFLUX', 'PH_IRAC1FLUX', 'PH_IRAC2FLUX', 'PH_IRAC3FLUX', 'PH_IRAC4FLUX', $                 ;
                               'PH_EUFLUX', 'PH_EGFLUX', 'PH_ERFLUX', 'PH_EIFLUX', 'PH_EZFLUX', 'PH_EYFLUX', $                                       ;
                               'PH_EJFLUX', 'PH_EKFLUX', 'PH_EIRAC1FLUX', 'PH_EIRAC2FLUX', 'PH_EIRAC3FLUX', 'PH_EIRAC4FLUX', $                       ;
                               'PH_K_FLAG', 'PH_K_STAR', 'PH_ZSPEC', 'PH_IDSPEC', 'PH_ZFLAG', 'PH_ZEMISS', $                                         ;
                               'PH_STARFLAGOPT', 'PH_STARFLAGIR', 'PH_ZSPEC_EAZY', 'PH_Z_A', 'PH_Z_M1', 'PH_CHI_A', 'PH_Z_P', $                      ;
                               'PH_CHI_P', 'PH_Z_M2', 'PH_ODDS', 'PH_L68', 'PH_U68', 'PH_L95', 'PH_U95', 'PH_L99', 'PH_U99', $                       ;
                               'PH_NFILT', 'PH_Q_Z', 'PH_Z_PEAK', 'PH_PEAK_PROB', 'PH_Z_MC', 'PH_ZFAST', 'PH_LTAU', 'PH_METAL', $                    ;
                               'PH_LAGE', 'PH_AV', 'PH_LSFR', 'PH_LSSFR', 'PH_LA2T', 'PH_CHI2', 'PH_U_VREST', $                                      ;
                               'PH_V_JREST', $
                               'PH_ID_OLD', 'PH_MAG_F160', 'PH_E_F160', 'PH_MAG_F140', 'PH_E_F140', 'PH_MAG_F105', 'PH_E_F105', $
                               'PH_MAG_F814', 'PH_E_F814', 'PH_F160FLAG', 'PH_F160CLASS', 'PH_X_GROUND', 'PH_Y_GROUND', $
                               'PH_ZPSEC_EAZY', 'PH_L68_ZFAST', 'PH_U68_ZFAST', 'PH_L68_LTAU', 'PH_U68_LTAU', 'PH_L68_METAL', 'PH_U68_METAL', $
                               'PH_L68_LAGE', 'PH_U68_LAGE', 'PH_L68_AV', 'PH_U68_AV', $
                               'PH_L68_LSFR', 'PH_U68_LSFR', 'PH_L68_LSSFR', 'PH_U68_LSSFR', 'PH_L68_LA2T', 'PH_U68_LA2T']) ;
  xdatatags = tag_names(xdata)                                                                                              ;get new list of tag names
  postntags = n_elements(xdatatags)                                                                                         ;number tags left
  IF keyword_set(HELP) THEN help, xdata, /STRUC
  

  ;;;only want MOSFIRE observations so use the MOSFIRE quality flag
  IF keyword_set(TGPOSSIBLE) THEN BEGIN                                   ;check variables set
     chk = tag_exist(xdata, tgpossible, INDEX=indposs)                    ;find necessary tag
     IF (indposs NE -1) THEN BEGIN                                        ;if tag is found
        poss = where((xdata.(indposs) GE possmin) AND $                   ;cont next line
                     (xdata.(indposs) LE possmax), NCOMPLEMENT=lostposs)  ;find real
        xdata = xdata[poss]     ;cut the data
     ENDIF                      ;end tag found
  ENDIF                         ;end check variables set


  ;;;cut on spec-z
  IF keyword_set(TGSPZ1) THEN BEGIN                                      ;check variables set
     chk = tag_exist(xdata, tgspz1, INDEX=indspz1)                       ;find necessary tag
     IF (indspz1 NE -1) THEN BEGIN                                       ;if tag is found
        z1 = where((xdata.(indspz1) GE speczmin) AND $                   ;cont next line
                   (xdata.(indspz1) LT speczmax), NCOMPLEMENT=lostspecz) ;find real
        pass = cleancat.cleanspecz(xdata[z1].(indspz1), /NORMALIZE)      ;find entries to keep
        xdata = xdata[z1]                                                ;cut the data
     ENDIF                                                               ;end tag found
  ENDIF                                                                  ;end check variables set

  ;;;cut on Halpha SNR
  IF keyword_set(TGHAFLUX) AND keyword_set(TGEHAFLUX) THEN BEGIN                                  ;check variables set
     chk = tag_exist(xdata, tghaflux, INDEX=indhaflux)                                            ;find necessary tag
     chk = tag_exist(xdata, tgehaflux, INDEX=indehaflux)                                          ;find necessary tag
     IF (indhaflux NE -1) AND (indehaflux NE -1) THEN BEGIN                                       ;if tag is found
        ha1 = where((xdata.(indhaflux) / xdata.(indehaflux)) GE hasnrmin, NCOMPLEMENT=losthasnr) ;find real
        pass = cleancat.cleanhasnr(xdata[ha1].(indhaflux))                                        ;find entries to keep
        xdata = xdata[ha1]                                                                        ;cut the data
     ENDIF                                                                                        ;end tag found
  ENDIF                                                                                           ;end check variables set
  ;;;cut on Halpha flux
  ;IF keyword_set(TGHAFLUX) THEN BEGIN                                         ;check variables set
  ;   chk = tag_exist(xdata, tghaflux, INDEX=indhaflux)                        ;find necessary tag
  ;   IF (indhaflux NE -1) THEN BEGIN                                          ;if tag is found
  ;      ha1 = where((xdata.(indhaflux) GE hafluxmin) AND $                    ;cont next line
  ;                  (xdata.(indhaflux) LT hafluxmax), NCOMPLEMENT=losthaflux) ;find real
  ;      pass = cleancat.cleanhaflux(xdata[ha1].(indhaflux))                   ;find entries to keep
  ;      xdata = xdata[ha1]                                                    ;cut the data
  ;   ENDIF                                                                    ;end tag found
  ;ENDIF                                                                       ;end check variables set


  ;;;cut on NII flux
  ;IF keyword_set(TGNIIFLUX) THEN BEGIN                                            ;check variables set
     chk = tag_exist(xdata, tgniiflux, INDEX=indniiflux)                          ;find necessary tag
     chk = tag_exist(xdata, tgniiflag, INDEX=indniiflag)                          ;find necessary tag
  ;   IF (indniiflux NE -1) THEN BEGIN                                             ;if tag is found
  ;      nii1 = where((xdata.(indniiflux) GE niifluxmin) AND $                     ;cont next line
  ;                   (xdata.(indniiflux) LT niifluxmax), NCOMPLEMENT=lostniiflux) ;find real
  ;      pass = cleancat.cleanniiflux(xdata[nii1].(indniiflux))                    ;find entries to keep
  ;      xdata = xdata[nii1]                                                       ;cut the data
  ;   ENDIF                                                                        ;end tag found
  ;ENDIF                                                                           ;end check variables set


  ;;;cut on matching flag
  IF keyword_set(TGMFLAG) THEN BEGIN                                         ;check variables set
     chk = tag_exist(xdata, tgmflag, INDEX=indmflag)                         ;find necessary tag
     IF (indmflag NE -1) THEN BEGIN                                          ;if tag is found
        mflag = where((xdata.(indmflag) GE mflagmin) AND $                   ;cont next line
                      (xdata.(indmflag) LE mflagmax), NCOMPLEMENT=lostmflag) ;find real
                                ;pass = cleancat.?????(xdata[mass1].(indmass)) ;find entries to keep
        xdata = xdata[mflag]    ;cut the data
     ENDIF                      ;end tag found
  ENDIF                         ;end check variables set


  ;;;cut on stellar mass 
  IF keyword_set(TGMASS) THEN BEGIN                                       ;check variables set
     chk = tag_exist(xdata, tgmass, INDEX=indmass)                        ;find necessary tag
     ;print, xdata.(indmass) 
     IF (indmass NE -1) THEN BEGIN                                        ;if tag is found
        mass1 = where((xdata.(indmass) GE massmin) AND $                  ;cont next line
                      (xdata.(indmass) LT massmax), NCOMPLEMENT=lostmass) ;find real
        pass = cleancat.cleanmass(xdata[mass1].(indmass))                 ;find entries to keep
        xdata = xdata[mass1]                                              ;cut the data
     ENDIF                                                                ;end tag found
  ENDIF                                                                   ;end check variables set



  ;;;Cut on RA, Dec
  IF keyword_set(TGRA) and keyword_set(TGDEC) THEN BEGIN                        ;check variables as set
     chk1 = tag_exist(xdata, tgra, INDEX=indra)                                 ;find tag index
     chk2 = tag_exist(xdata, tgdec, INDEX=inddec)                               ;make sure tag name exists
     IF (indra NE -1) AND (inddec NE -1) THEN BEGIN                             ;if tag names do exist
        cl1 = where((xdata.(inddec) LT -10.0) AND (xdata.(inddec) GT -90.0))    ;find first cluster
        pass = cleancat.cleanradec(xdata[cl1].(indra), xdata[cl1].(inddec))     ;find entries to keep        
        cl23 = where(xdata.(inddec) GT -10.0 AND (xdata.(inddec) LT 90.0) AND $ ;cont next line
                     (xdata.(indra) GT 30.0))                                   ;find first cluster
        pass = cleancat.cleanradec(xdata[cl23].(indra), xdata[cl23].(inddec))   ;find entries to keep
        cl4 = where(xdata.(inddec) GT 50.0 AND (xdata.(inddec) LT 70.0) AND $   ;cont next line
                    (xdata.(indra) GT 160.0) AND xdata.(indra) LT 165.0)        ;find first cluster
        pass = cleancat.cleanradec(xdata[cl4].(indra), xdata[cl4].(inddec))     ;find entries to keep

        keep = where( ((xdata.(inddec) LT -10.0) OR $                                               ;cont next line
                       (xdata.(inddec) GT -10.0 AND (xdata.(indra) GT 30.0)) OR $                   ;cont next line
                       (xdata.(inddec) GT 50.0 AND (xdata.(inddec) LT 70.0))) AND $                 ;cont next line
                      ((xdata.(inddec) GT -90.0) AND (xdata.(inddec) LT 90.0) AND $                 ;cont next line
                       (xdata.(indra) GT 0.0) AND (xdata.(indra) LT 360.0)), NCOMPLEMENT=lostradec) ;find which make the cut
        xdata = xdata[keep]                                                                         ;cut the data
     ENDIF                                                                                          ;end tag names exist
  ENDIF                                                                                             ;end check variables as set


  ;;;cut on spec-z discrepancy
  IF (keyword_set(TGSPZ1) AND keyword_set(TGSPZ2)) THEN BEGIN                                     ;check variables set
     chk = tag_exist(xdata, tgspz1, INDEX=indspz1)                                                ;find necessary tag
     chk = tag_exist(xdata, tgspz2, INDEX=indspz2)                                                ;find necessary tag
     IF ((indspz1 NE -1) AND (indspz2 NE -1)) THEN BEGIN                                          ;if tag is found
        specz = where(abs(xdata.(indspz1) - xdata.(indspz2)) LT spzdiff, NCOMPLEMENT=lostspzdiff) ;find real
                                ;pass = cleancat.?????(xdata[mass1].(indmass)) ;find entries to keep
        xdata = xdata[specz]    ;cut the data
     ENDIF                      ;end tag found
  ENDIF                         ;end check variables set

  ;;;cut on matching flag
  ;IF keyword_set(TGSPZFLAG1) THEN BEGIN                                                  ;check variables set
  ;   chk = tag_exist(xdata, tgspzflag1, INDEX=indspzflag1)                               ;find necessary tag
  ;   IF (indspzflag1 NE -1) THEN BEGIN                                                   ;if tag is found
  ;      spzflag1 = where((xdata.(indspzflag1) GE spzflag1min) AND $                      ;cont next line
  ;                       (xdata.(indspzflag1) LE spzflag1max), NCOMPLEMENT=lostspzflag1) ;find real
  ;                              ;pass = cleancat.?????(xdata[mass1].(indmass)) ;find entries to keep
  ;      xdata = xdata[spzflag1] ;cut the data
  ;   ENDIF                      ;end tag found
  ;ENDIF                         ;end check variables set


 

  ;;;keep unique values only
  started = n_elements(xdata)
  sorted = sort(xdata.sp_m_obj)
  temp = strcompress(string(xdata[sorted].sp_m_obj) + '_' + string(xdata[sorted].sp_m_z), /REMOVE_ALL)
  xdata = xdata[uniq(temp)]
  lostuniq = abs(n_elements(xdata)-started)



  ;;;print user friendly info
  print, ' '                                                                       ;spacer
  print, '%%%%%%%%%%%%%%%%%%%% Sample Cleaning Summary %%%%%%%%%%%%%%%%%%%%%%'     ;eye catcher
  print, 'Before Cleaning...'                                                      ;print info
  print, '  Number of data per entry: ', prentags                                  ;print info
  print, '  Number of entries in raw catalog: ', prenxdata                         ;print info
  print, 'After Cleaning...'                                                       ;print info
  print, '  Number of data per entry: ', postntags                                 ;print info
  print, '  Number of entries in cleaned catalog: ', n_elements(xdata)             ;print info
  print, '    Number of entries lost by spec-z cleaning: ', lostspecz              ;print info
  print, '    Number of entries lost by Halpha SNR cleaning: ', losthasnr          ;print info
                                ;print, '    Number of entries lost by Halpha flux cleaning: ', losthaflux        ;print info
                                ;print, '    Number of entries lost by [NII] flux cleaning: ', lostniiflux        ;print info
  print, '    Number of entries lost by matching flag: ', lostmflag                ;print info
  print, '    Number of entries lost by stellar mass cleaning: ', lostmass         ;print info
  print, '    Number of entries lost by spec-z discrepancy: ', lostspzdiff         ;print info
  print, '    Number of entries lost by RA, Dec cleaning: ', lostradec             ;print info
  print, '    Number of entries lost by demanding uniqueness: ', lostuniq          ;print info
                                ;print, '    Number of entries lost by spec-z quality flag: ', lostspzflag1       ;print info
  print, '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%' ;eye catcher
  print, ' '                                                                       ;spacer


  ;;;make final plots
  ;;;final spec-z histograms
  nii1 = where((xdata.(indniiflag) LT 32), NCOMPLEMENT=lostniiflux) ;find real
  pass = cleancat.cleanspecz(xdata.(indspz1), BINSIZE=0.02, $
                             UPLIM=xdata[nii1].(indspz1)) ;find entries to keep

  chk = tag_exist(xdata, tgclmem, INDEX=indclmem)                    ;find necessary tag
  cl = where((xdata.(indclmem) EQ 1), NCOMPLEMENT=field)             ;find real
  pass = cleancat.cleanspecz(xdata.(indspz1), BINSIZE=0.02, $        ;
                             UPLIM=xdata[cl].(indspz1), COLOR='red') ;find entries to keep



  mwrfits, xdata, outfile, /CREATE ;write out file
  obj_destroy, cleancat            ;destory the object
  
  
  ;;;make grid of scatter plots
  cleancat = obj_new('kemclass_clean', xdata)                                                                 ;declare object
  xdata = cleancat.removetags(['MRA', 'MDEC', 'MID', 'MFLAG', 'SP_M_HA_FLAG', 'SP_M_NIIR_FLAG', $             ;cont next line
                               'SP_SPECZFLAG', 'SP_M_Z', 'SP_M_QFLAG_MOSFIRE', 'SP_M_MASK', 'SP_M_OBJ', $     ;cont next line
                               'AN_AGNK06', 'AN_AGND12', 'AN_CLMEM', 'AN_DEDICA', 'AN_ADAPKER', 'AN_SHIGAP']) ;remove tags
  IF keyword_set(HELP) THEN help, xdata, /STRUC
  xdatatags = tag_names(xdata)      ;get new list of tag names
  postntags = n_elements(xdatatags) ;number tags left
  cleancat.scatterscatter, xdata    ;lots of scatter plot





END
;====================================================================================================


;====================================================================================================
PRO degroot2015a::fitmzrtrend, which


  ;;;grab the data
  thatart = obj_new(which)
  thatart.boxscore
  CASE which of
     'erb2006' :  mzrdata = *thatart.e06mzrdata
     'sanders2014' :  mzrdata = *thatart.sa14mzrdata
     ELSE : BEGIN
        print, 'WARNING!!! Input not understood. '
        print, '  Choices are erb2006, '
     END
  ENDCASE
  obj_destroy, thatart

  ;;;fit the data
  tr04 = obj_new('tremonti2004')
  fit = tr04.mymzrfit(mzrdata.xsmod, mzrdata.ys, mzrdata.xserrmod, mzrdata.yserr)
  obj_destroy, tr04
 

END
;====================================================================================================



;====================================================================================================
PRO degroot2015a::mzrtrend


  universeage = 13.8
  data = [{name:'TW', xval:1.62, exvalm:0.3, exvalp:0.1, yval:-0.39, eyvalm:0.016, eyvalp:0.017, multiline:1, mzr:'N2'}, $
          {name:'Tr04', xval:0.0, exvalm:0.0001, exvalp:0.001, yval:0.0, eyvalm:0.00, eyvalp:0.00, multiline:1, mzr:'R23'}, $
          {name:'Erb06', xval:2.26, exvalm:0.17, exvalp:0.17, yval:-0.56, eyvalm:0.028, eyvalp:0.027, multiline:1, mzr:'N2'}, $
          {name:'Sa14', xval:2.3, exvalm:0.21, exvalp:0.31, yval:-0.56, eyvalm:0.026, eyvalp:0.028, multiline:1, mzr:'N2'}, $
          
          {name:'TW', xval:1.62, exvalm:0.3, exvalp:0.1, yval:-0.39, eyvalm:0.016, eyvalp:0.017, multiline:1, mzr:'N2'}, $
          {name:'TW', xval:1.62, exvalm:0.3, exvalp:0.1, yval:-0.39, eyvalm:0.016, eyvalp:0.017, multiline:1, mzr:'N2'}, $
          {name:'TW', xval:1.62, exvalm:0.3, exvalp:0.1, yval:-0.39, eyvalm:0.016, eyvalp:0.017, multiline:1, mzr:'N2'}, $
          {name:'TW', xval:1.62, exvalm:0.3, exvalp:0.1, yval:-0.39, eyvalm:0.016, eyvalp:0.017, multiline:1, mzr:'N2'}]
  ;print, data

  ;;;plot attributes
  ageuniv = 13.6
  ymin = -0.7
  ymax = 0.1
  ages = [14,12,10,8,6,4,2]
  offsets = [-0.7,-0.5,-0.3,-0.1,0.1]
  
  ;;;plot calculations
  
  zs = (ageuniv / ages) - 1.0 
  zs = reverse(string(zs))
  FOR xx=0, n_elements(zs)-1, 1 DO BEGIN
     tmp = zs[xx]
     If tmp LT 0.0 THEN tmp = '' ELSE BEGIN 
        tmp2 = strtrim(tmp, 1)
        tmp = strmid(tmp2,0,3)
     ENDELSE 
     zs[xx] = tmp
  ENDFOR
  xs = ageuniv / (1.0+data.xval)
  xerrs = transpose([[ageuniv / (1.0+(data.xval+data.exvalp))], [ageuniv / (1.0+(data.xval-data.exvalm))]])
  xerrs[0,*] = xs - xerrs[0,*] 
  xerrs[1,*] = xerrs[1,*] - xs
  yerrs = transpose([[data.eyvalm],[data.eyvalp]])
  
  ;;;create the plot
  FOR xx=0, n_elements(data)-1, 1 DO BEGIN
     CASE data[xx].mzr OF
        'N2' : symcolor = 'black'
        'R23' : symcolor = 'black'
     ENDCASE
     IF data[xx].name EQ 'TW' THEN symbol = 'S' ELSE symbol='s'
     IF xx NE 0 THEN overplot = 1 ELSE overplot = 0
     myplot = errorplot([xs[xx]], [data[xx].yval], xerrs[*,xx], yerrs[*,xx], $
                        XTITLE='Age of Universe [Gyr]', $
                        XRANGE=[15,ages[-1]], $
                        XSTYLE=1, $
                        YTITLE='Metallicity Trend Offset', $
                        YRANGE=[ymin,ymax], $
                        YSTYLE=1, $
                        FONT_SIZE=14.0, $
                        FONT_STYLE=1, $
                        SYM_SIZE=1.5, $
                        SYMBOL=symbol, $
                        SYM_FILL_COLOR=symcolor, $
                        SYM_FILLED=data[xx].multiline, $
                        OVERPLOT=overplot)
     mylabel = text(xs[xx]-0.1, data[xx].yval+0.02, data[xx].name, /DATA)
  ENDFOR
  
  ;;;now redo the x-axes to make sense
  ax = myplot.axes
  ax[0].HIDE = 1 
  ax[1].HIDE = 1 
  ax[2].HIDE = 1 
  xaxislower = axis('X', TITLE='Cosmic Age [Gyr]', $
                    LOCATION=ymin, $
                    MAJOR=n_elements(ages), $
                    TICKVALUES=ages, $
                    TICKNAME=ages, $
                    MINOR = 3, $
                    TICKFONT_SIZE=14.0, $
                    TICKFONT_STYLE=1, $
                    STYLE=1)
  xaxishigher = axis('Y', TITLE='MZR Trend Offset', $
                     LOCATION=2.0, $
                     MAJOR=n_elements(offsets), $
                     TICKVALUES=offsets, $
                     TICKNAME=offsets, $
                     MINOR=3, $
                     TICKFONT_SIZE=14.0, $
                     TICKFONT_STYLE=1, $
                     STYLE=1)
  xaxishigher = axis('X', TITLE='Redshift', $
                     LOCATION=ymax, $
                     MAJOR=n_elements(zs), $
                     TICKVALUES=ages, $
                     TICKNAME=zs, $
                     MINOR = 3, $
                     TICKFONT_SIZE=14.0, $
                     TICKFONT_STYLE=1, $
                     TEXTPOS=1, $
                     TICKDIR=1, $
                     STYLE=1)

  myplot.save, 'mzrtrend_v0-1.jpeg', RESOLUTION=600 ;save plot

 

END
;====================================================================================================


;====================================================================================================
PRO degroot2015a::runmzranalysis, xsubset


  IF xsubset.binset EQ 'all' THEN alltog = 1 ELSE alltog = 0

  run = obj_new('mzranalysis', CURCAT=xsubset.catalog, WORKING=xsubset.name)                    ;make analysis object
  run.readcat, xsubset.catalog, INDIR='/Users/adegroot/research/clusters/combination/catalogs/' ;read in data 
  run.findtags                                                                                  ;find all the tags we need
  IF xsubset.mcmass GT 1 THEN newmass = run.mcmass(xsubset.mcmass)                              ;get perturbed masses
  run.plotmzrindiv, ALLTOG=alltog                                                               ;plot individual points
  run.plotbpt, /NOIRAGN                                                                         ;plot sudo-BPT points
  run.makebins, BINSET=xsubset.binset, NINBIN=xsubset.ninbin                                    ;find mass bin sizes
  run.specsort                                                                                  ;sort data into bins
  run.findstats                                                                                 ;find stats for bins
  run.specstack, SM=xsubset.sm                                                                  ;stack spectra
  run.collatespecstack                                                                          ;stack spectra
  run.readstack                                                                                 ;read in the mzr stack data
  run.findstacktags                                                                             ;find all the tags we need
  run.plotspecstack                                                                             ;plot the stacked spectra
  run.fitmzrstack, WHICH=xsubset.fitmzr, /SAVE, /STARTOVER                                      ;fit the stack measured MZR
  run.plotmzrstack                                                                              ;plot the stacked MZR
  FOR ww=1, xsubset.mcmass-1, 1 DO BEGIN                                                        ;loop over monte carlo mass errors
     run.storenew, MASSES=newmass[*,ww]                                                         ;set in new masses
     run.makebins, BINSET=xsubset.binset, NINBIN=xsubset.ninbin                                 ;find mass bin sizes
     run.specsort                                                                               ;sort data into bins
     run.specstack, SM=xsubset.sm                                                               ;stack spectra
     run.collatespecstack                                                                       ;stack spectra
     run.readstack                                                                              ;read in the mzr stack data
     run.findstacktags                                                                          ;find all the tags we need
     run.fitmzrstack, WHICH=xsubset.fitmzr, /SAVE                                               ;fit the stack measured MZR
  ENDFOR                                                                                        ;end monte carlo mass errors
  obj_destroy, run                                                                              ;destory analysis object


END
;====================================================================================================


;====================================================================================================
PRO degroot2015a::workingon, subset, CATALOG=catalog, BINSET=binset

  
  sets = [{name:'one', catalog:'kemclass_pz_specz_v0-8-1.fits', BINSET:'all', NINBIN:17, SM:'smcurrent', FITMZR:'tr04', MCMASS:1}, $
          {name:'two', catalog:'kemclass_pz_specz_v0-8-2.fits', BINSET:'all', NINBIN:20, SM:'smcurrent', FITMZR:'tr04', MCMASS:1}, $
          {name:'three', catalog:'kemclass_pz_specz_v0-8-3.fits', BINSET:'all', NINBIN:20, SM:'smcurrent', FITMZR:'tr04', MCMASS:1}, $
          {name:'four', catalog:'kemclass_pz_specz_v0-8-1.fits', BINSET:'field', NINBIN:26, SM:'smcurrent', FITMZR:'tr04', MCMASS:1}, $
          {name:'five', catalog:'kemclass_pz_specz_v0-8-1.fits', BINSET:'cluster', NINBIN:8, SM:'smcurrent', FITMZR:'tr04', MCMASS:1}, $ 
          {name:'six', catalog:'kemclass_pz_specz_v0-8-2.fits', BINSET:'field', NINBIN:20, SM:'smcurrent', FITMZR:'tr04', MCMASS:1}, $
          {name:'seven', catalog:'kemclass_pz_specz_v0-8-2.fits', BINSET:'cluster', NINBIN:14, SM:'smcurrent', FITMZR:'tr04', MCMASS:1}, $ 
          {name:'eight', catalog:'kemclass_pz_specz_v0-8-3.fits', BINSET:'field', NINBIN:20, SM:'smcurrent', FITMZR:'tr04', MCMASS:1}, $
          {name:'nine', catalog:'kemclass_pz_specz_v0-8-3.fits', BINSET:'cluster', NINBIN:14, SM:'smcurrent', FITMZR:'tr04', MCMASS:1}, $ 
          {name:'onezero', catalog:'kemclass_pz_specz_v1-1-1.fits', BINSET:'all', NINBIN:24, SM:'smcurrent', FITMZR:'tr04', MCMASS:1} ] 
  

  chk = where(sets.name EQ strlowcase(string(subset[0])))
  IF keyword_set(CATALOG) THEN chk = where(sets.catalog EQ strlowcase(string(subset[0])))
  IF keyword_set(BINSET) THEN chk = where(sets.binset EQ strlowcase(string(subset[0])))
  IF (chk[0] NE -1) THEN BEGIN
     FOR xx=0, n_elements(chk)-1, 1 DO BEGIN
        self.runmzranalysis, sets[chk[xx]]
     ENDFOR
  ENDIF


END
;====================================================================================================


;====================================================================================================
PRO degroot2015a::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION degroot2015a::init                          
  
  self.d15aobjver = 'v0-0-1'    ;code version


  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO degroot2015a__define

  void = {degroot2015a, d15aobjver:'A'}

  RETURN
END
;====================================================================================================

