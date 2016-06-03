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
  IF keyword_set(N2AGNLIM) THEN n2agnlim = float(n2agnlim[0]) ELSE n2agnlim = -0.2                          ;set default value 

  
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


  ;;;cut on N2 value for AGN removal
  IF (keyword_set(TGHAFLUX) AND keyword_set(TGNIIFLUX)) THEN BEGIN                                     ;check variables set
     chk = tag_exist(xdata, tghaflux, INDEX=indhaflux)                                                 ;find necessary tag
     chk = tag_exist(xdata, tgniiflux, INDEX=indniiflux)                                               ;find necessary tag
     IF ((indhaflux NE -1) AND (indniiflux NE -1)) THEN BEGIN                                          ;if tag is found
        n2agn = where(alog10(xdata.(indniiflux)/xdata.(indhaflux)) LT n2agnlim, NCOMPLEMENT=lostn2agn) ;find real
        xdata = xdata[n2agn]                                                                           ;cut the data
     ENDIF                                                                                             ;end tag found
  ENDIF                                                                                                ;end check variables set

  
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
  print, '    Number of entries lost by N2 AGN cut: ', lostn2agn                   ;print info
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
PRO degroot2015a::fitmzrtrend, which, OPTION=option

  If keyword_set(OPTION) THEN option = fix(option[0]) ELSE option = 1 ;set default

  ;;;grab the data
  thatart = obj_new(which)
  thatart.boxscore              ;this load the data
  CASE which of
     'erb2006' :  mzrdata = *thatart.e06mzrdata
     'sanders2014' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.sa14N2data
           2 : mzrdata = *thatart.sa14O3N2data
           ELSE : mzrdata = *thatart.sa14mzrdata
        ENDCASE
     END
     'steidel2014' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.st14N2data
           2 : mzrdata = *thatart.st14O3N2data
           ELSE : mzrdata = *thatart.st14mzrdata
        ENDCASE
     END
     'maiolino2008' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.ma08R23data
           ELSE : mzrdata = *thatart.ma08mzrdata
        ENDCASE
     END
    'yabe2012' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.ya12N2data
           2 : mzrdata = *thatart.ya12O3N2data
           ELSE : mzrdata = *thatart.ya12mzrdata
        ENDCASE
     END
     'zahid2012' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.za12R23data
           ELSE : mzrdata = *thatart.za12mzrdata
        ENDCASE
     END
     'henry2013' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.he13R23data
           ELSE : mzrdata = *thatart.he13mzrdata
        ENDCASE
     END
     'kulas2013' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.ku13N2cldata
           2 : mzrdata = *thatart.ku13N2fielddata
           3 : mzrdata = *thatart.ku13mzrdata
           ELSE : mzrdata = *thatart.ku13mzrdata
        ENDCASE
     END
     'leja2013' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.le13N2data
           ELSE : mzrdata = *thatart.le13mzrdata
        ENDCASE
     END
     'stott2013' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.st13N2data
           ELSE : mzrdata = *thatart.st13mzrdata
        ENDCASE
     END
     'yuan2013' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.yu13N2data
           ELSE : mzrdata = *thatart.yu13mzrdata
        ENDCASE
     END
     'masters2014' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.ma14N2data
           2 : mzrdata = *thatart.ma14R23data
           ELSE : mzrdata = *thatart.ma14mzrdata
        ENDCASE
     END
     'wuyts2014' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.wu14N2data_z09
           2 : mzrdata = *thatart.wu14N2data_z23
           ELSE : mzrdata = *thatart.wu14mzrdata_09
        ENDCASE
     END
     'zahid2014' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.za14N2data
           ELSE : mzrdata = *thatart.za14mzrdata
        ENDCASE
     END
    'cullen2015' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.cu15R23data
           ELSE : mzrdata = *thatart.cu15mzrdata
        ENDCASE
     END
     'shimakawa2015' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.sh15N2cl1data
           2 : mzrdata = *thatart.sh15N2cl2data
           ELSE : mzrdata = *thatart.sh15mzrdata
        ENDCASE
     END
    'tran2015' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.tr15N2cldata
           ELSE : mzrdata = *thatart.tr15mzrdata
        ENDCASE
     END
    'valentino2015' : BEGIN
       CASE OPTION OF
          1 : mzrdata = *thatart.va15N2cldata
          2 : mzrdata = *thatart.va15N2fielddata
          3 : mzrdata = *thatart.va15mzrdata
          ELSE : mzrdata = *thatart.va15mzrdata
       ENDCASE
     END
    'wuyts2016' : BEGIN
        CASE OPTION OF
           1 : mzrdata = *thatart.wu16N2data_z09
           2 : mzrdata = *thatart.wu16N2data_z15
           3 : mzrdata = *thatart.wu16N2data_z23
           ELSE : mzrdata = *thatart.wu16N2data_z09
        ENDCASE
     END



     ELSE : BEGIN
        print, 'WARNING!!! Input not understood. '
        print, '  Choices are erb2006, '
     END
  ENDCASE
  obj_destroy, thatart

  ;;;fit the data
  tr04 = obj_new('tremonti2004')
  fit = tr04.mymzrfit(mzrdata.xsmod, mzrdata.ys, mzrdata.xserrmod, mzrdata.yserr, $
                      /PLOTDATA, /PLOTPOST)
  obj_destroy, tr04
  

END
;====================================================================================================



;====================================================================================================
PRO degroot2015a::mzrtrend, INCLUDEFIT=includefit, FITMETALS=fitmetals, WHICHENV=whichenv


  IF keyword_set(WHICHENV) THEN whichenv = string(whichenv[0]) ELSE whichenv = 'all'

  universeage = 13.8
  data = [ {name:'This Work', xval:1.62, exvalm:0.3, exvalp:0.1, yval:-0.39, eyvalm:0.016, eyvalp:0.017, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'green'}, $
           {name:'Tremonti 04', xval:0.00001, exvalm:0.00001, exvalp:0.00001, yval:0.0, eyvalm:0.01, eyvalp:0.01, multiline:1, mzr:'R23', cl:0, field:0, all:1, symcolor:'black'}, $
           {name:'Erb 06', xval:2.26, exvalm:0.17, exvalp:0.17, yval:-0.56, eyvalm:0.028, eyvalp:0.027, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'aquamarine'}, $
           {name:'Maiolino 08', xval:3.35, exvalm:0.35, exvalp:0.35, yval:-0.76, eyvalm:0.25, eyvalp:0.30, multiline:1, mzr:'R23', cl:0, field:0, all:1, symcolor:'blue'}, $
           {name:'Yabe 12', xval:1.4, exvalm:0.2, exvalp:0.2, yval:-0.518, eyvalm:0.025, eyvalp:0.030, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'tan'}, $
           {name:'Zahid 12', xval:0.78, exvalm:0.03, exvalp:0.04, yval:-0.475, eyvalm:0.05, eyvalp:0.05, multiline:1, mzr:'R23', cl:0, field:0, all:1, symcolor:'olive'}, $
           {name:'Zahid 12', xval:0.07, exvalm:0.03, exvalp:0.03, yval:0.05, eyvalm:0.05, eyvalp:0.05, multiline:1, mzr:'R23', cl:0, field:0, all:1, symcolor:'olive'}, $
           {name:'Henry 13', xval:1.77, exvalm:0.43, exvalp:0.53, yval:-0.293, eyvalm:0.107, eyvalp:0.113, multiline:1, mzr:'R23', cl:0, field:0, all:1, symcolor:'lime'}, $

           {name:'Kulas 13', xval:2.31, exvalm:0.11, exvalp:0.20, yval:-0.655, eyvalm:0.072, eyvalp:0.075, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'dark red'}, $
           {name:'Kulas 13', xval:2.29, exvalm:0.0160, exvalp:0.01, yval:-0.638, eyvalm:0.10, eyvalp:0.105, multiline:1, mzr:'N2', cl:1, field:0, all:0, symcolor:'dark red'}, $
           {name:'Kulas 13', xval:2.33, exvalm:0.11, exvalp:0.20, yval:-0.673, eyvalm:0.105, eyvalp:0.105, multiline:1, mzr:'N2', cl:0, field:1, all:0, symcolor:'dark red'}, $

           {name:'Leja 13', xval:2.32, exvalm:0.2, exvalp:0.24, yval:-0.512, eyvalm:0.085, eyvalp:0.085, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'chocolate'}, $
           {name:'Stott 13', xval:1.15, exvalm:0.31, exvalp:0.32, yval:-0.35, eyvalm:0.04, eyvalp:0.04, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'dark violet'}, $
           {name:'Yuan 13', xval:1.91, exvalm:0.63, exvalp:0.63, yval:-0.512, eyvalm:0.113, eyvalp:0.118, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'spring green'}, $
           {name:'Sanders 14', xval:2.33, exvalm:0.21, exvalp:0.31, yval:-0.56, eyvalm:0.026, eyvalp:0.028, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'magenta'}, $
           {name:'Sanders 14', xval:2.33, exvalm:0.21, exvalp:0.31, yval:-0.67, eyvalm:0.023, eyvalp:0.025, multiline:1, mzr:'O3N2', cl:0, field:0, all:1, symcolor:'magenta'}, $
           {name:'Steidel 14', xval:2.34, exvalm:0.35, exvalp:0.35, yval:-0.55, eyvalm:0.017, eyvalp:0.017, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'orange'}, $
           {name:'Steidel 14', xval:2.34, exvalm:0.35, exvalp:0.35, yval:-0.68, eyvalm:0.011, eyvalp:0.011, multiline:1, mzr:'O3N2', cl:0, field:0, all:1, symcolor:'orange'}, $
           {name:'Masters 14', xval:1.845, exvalm:0.39, exvalp:0.39, yval:-0.34, eyvalm:0.18, eyvalp:0.21, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'thistle'}, $
           {name:'Masters 14', xval:1.855, exvalm:0.39, exvalp:0.39, yval:-0.51, eyvalm:0.18, eyvalp:0.21, multiline:1, mzr:'R23', cl:0, field:0, all:1, symcolor:'thistle'}, $
           {name:'Wuyts 14', xval:0.9, exvalm:0.15, exvalp:0.15, yval:-0.43, eyvalm:0.020, eyvalp:0.020, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'deep sky blue'}, $
           {name:'Wuyts 14', xval:2.29, exvalm:0.15, exvalp:0.15, yval:-0.63, eyvalm:0.022, eyvalp:0.022, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'deep sky blue'}, $
           {name:'Zahid 14', xval:1.55, exvalm:0.15, exvalp:0.15, yval:-0.45, eyvalm:0.008, eyvalp:0.01, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'pink'}, $
           {name:'Cullen 15', xval:2.16, exvalm:0.16, exvalp:0.14, yval:-0.63, eyvalm:0.04, eyvalp:0.04, multiline:0, mzr:'R23', cl:0, field:0, all:1, symcolor:'red'}, $
 
           {name:'Shimakawa 15', xval:2.34, exvalm:0.18, exvalp:0.18, yval:-0.52, eyvalm:0.053, eyvalp:0.055, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'brown'}, $
           {name:'Shimakawa 15', xval:2.34, exvalm:0.18, exvalp:0.18, yval:-0.52, eyvalm:0.053, eyvalp:0.055, multiline:0, mzr:'N2', cl:1, field:0, all:0, symcolor:'brown'}, $

           {name:'Tran 15', xval:1.6233, exvalm:0.0115, exvalp:0.0115, yval:-0.50, eyvalm:0.05, eyvalp:0.055, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'salmon'}, $
           {name:'Tran 15', xval:1.6233, exvalm:0.0115, exvalp:0.0115, yval:-0.50, eyvalm:0.05, eyvalp:0.055, multiline:1, mzr:'N2', cl:1, field:0, all:0, symcolor:'salmon'}, $
           
           {name:'Valentino 15', xval:1.92, exvalm:0.2, exvalp:0.2, yval:-0.617, eyvalm:0.027, eyvalp:0.040, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'goldenrod'}, $
           {name:'Valentino 15', xval:1.99, exvalm:0.003, exvalp:0.011, yval:-0.785, eyvalm:0.095, eyvalp:0.098, multiline:1, mzr:'N2', cl:1, field:0, all:0, symcolor:'goldenrod'}, $
           {name:'Valentino 15', xval:1.92, exvalm:0.2, exvalp:0.2, yval:-0.602, eyvalm:0.075, eyvalp:0.185, multiline:1, mzr:'N2', cl:0, field:1, all:0, symcolor:'goldenrod'}, $

           {name:'Wuyts 16', xval:0.9, exvalm:0.3, exvalp:0.2, yval:-0.425, eyvalm:0.022, eyvalp:0.027, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'navy'}, $
           {name:'Wuyts 16', xval:1.5, exvalm:0.2, exvalp:0.2, yval:-0.51, eyvalm:0.06, eyvalp:0.077, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'navy'}, $
           {name:'Wuyts 16', xval:2.28, exvalm:0.4, exvalp:0.4, yval:-0.57, eyvalm:0.020, eyvalp:0.020, multiline:1, mzr:'N2', cl:0, field:0, all:1, symcolor:'navy'}, $
           {name:'This Work', xval:1.62, exvalm:0.3, exvalp:0.1, yval:-0.39, eyvalm:0.016, eyvalp:0.017, multiline:0, mzr:'N2', cl:0, field:0, all:1, symcolor:'green'}]
                                ;print, data

  ;;;plot attributes
  ageuniv = 13.6
  ages = [14,12,10,8,6,4,2]
  offsets = [-0.9,-0.7,-0.5,-0.3,-0.1,0.1]
  ymin = min(offsets)
  ymax = max(offsets)
  

  ;;;only all points right now
  CASE whichenv OF 
     'all' : chk = where(data.all EQ 1)
     'cl' :  chk = where(data.cl EQ 1)
     'field' :  chk = where(data.field EQ 1)
     'bothenv' :  chk = where(data.field EQ 1 OR (data.cl EQ 1))
     ELSE : BEGIN
        print, 'WARNING!! Choice of WHICHENV not valid!!'
        print, '  Allowed choices are: all, cl, field or bothenv'
     ENDELSE
  ENDCASE
  IF chk[0] NE -1 THEN data = data[chk]


  ;;;fit the data
  IF keyword_set(INCLUDEFIT) THEN BEGIN
     IF keyword_set(FITMETALS) THEN BEGIN
        chk = where(data.mzr EQ string(fitmetals[0]))
        IF chk[0] NE -1 THEN xdata = data[chk] ELSE xdata = data
     ENDIF ELSE xdata = data
     xval = alog10(1.0+xdata.xval)
     exval = []
     eyval = []
     FOR ii=0, n_elements(xdata.exvalm)-1, 1 DO BEGIN
        exval = [exval, mean([xdata[ii].exvalm, xdata[ii].exvalp])]
        eyval = [eyval, mean([xdata[ii].eyvalm, xdata[ii].eyvalp])]
     ENDFOR
     exval = alog10(1.0 + xdata.xval+exval) - xval
     bayesian_linear_xyerr, xval, xdata.yval, exval, eyval, $
                            INTMIN=-0.10, INTMAX=0.15, INTBIN=0.003, $
                            SLPMIN=-1.4, SLPMAX=-0.8, SLPBIN=0.005, $
                            TXMIN=-1.0, TXMAX=1.0, TXBIN=0.05, $
                            /PLOTFIT, /PLOTDATA, /PLOTFULL, OUTPUT=myoutput
  ENDIF


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
  
  target = []
  xmin = 15
  xmax = ages[-1]
  notmove = 0
  ;;;create the plot
  FOR xx=0, n_elements(data)-1, 1 DO BEGIN
     IF data[xx].name EQ 'This Work' THEN BEGIN
        symsize = 2.0
        symthick = 3.0
     ENDIF ELSE BEGIN
        symsize = 1.0
        symthick = 1.0
     ENDELSE
     IF (WHICHENV NE 'all') THEN BEGIN
        IF data[xx].cl EQ 1 THEN symbol = 's'
        IF data[xx].field EQ 1 THEN symbol = 'o'
     ENDIF ELSE BEGIN
        CASE data[xx].mzr OF
           'N2' : symbol = 's' 
           'R23' : symbol='o'
           'O3N2' : symbol='S'
        ENDCASE
     ENDELSE
     CASE data[xx].cl OF
        0 : symcolor = 'black' 
        ELSE : symcolor = 'red' 
     ENDCASE
     IF xx NE 0 THEN overplot = 1 ELSE overplot = 0
     myplot = errorplot([xs[xx]], [data[xx].yval], xerrs[*,xx], yerrs[*,xx], $
                        XTITLE='Age of Universe [Gyr]', $
                        XRANGE=[xmin,xmax], $
                        XSTYLE=1, $
                        YTITLE='Metallicity Trend Offset', $
                        YRANGE=[ymin,ymax], $
                        YSTYLE=1, $
                        FONT_SIZE=12.0, $
                        FONT_STYLE=1, $
                        SYM_SIZE=symsize, $
                        SYM_THICK=symthick, $
                        SYMBOL=symbol, $
                        SYM_COLOR= data[xx].symcolor, $
                        SYM_FILL_COLOR= data[xx].symcolor, $
                        SYM_FILLED=data[xx].multiline, $
                        ERRORBAR_COLOR = data[xx].symcolor, $
                        NAME = data[xx].name, $
                        OVERPLOT=overplot)

     IF keyword_set(INCLUDEFIT) AND (xx EQ 0) THEN BEGIN
        print, myoutput
        help, myoutput, /STRUC

        xval = alog10(1.0+[0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.2,1.4,1.6,1.8,2.0,2.3,2.6,2.9,3.3,3.7,4.1,4.5,5.0])
        help, xval
        help, fitys
                                ;fitys = (myoutput.slpmp-myoutput.eslpmpp)*xval + (myoutput.intmp-myoutput.eintmpn)
        tmpfitys1 = (myoutput.slpmp-2.0*myoutput.eslpmpn)*xval + (myoutput.intmp-2.0*myoutput.eintmpn)
        tmpfitys2 = (myoutput.slpmp+2.0*myoutput.eslpmpp)*xval + (myoutput.intmp+2.0*myoutput.eintmpp)
        fitys = [tmpfitys1,reverse(tmpfitys2),tmpfitys1[0]]
        tmpxs = 13.6*(1.0/(10^xval))
        myfitplot = plot([tmpxs,reverse(tmpxs),tmpxs[0]], fitys, ' ', $
                         FILL_BACKGROUND=1, $
                         FILL_COLOR='light grey', $
                         /OVERPLOT)
        tmpfitys1 = (myoutput.slpmp-1.0*myoutput.eslpmpn)*xval + (myoutput.intmp-1.0*myoutput.eintmpn)
        tmpfitys2 = (myoutput.slpmp+1.0*myoutput.eslpmpp)*xval + (myoutput.intmp+1.0*myoutput.eintmpp)
        fitys = [tmpfitys1,reverse(tmpfitys2),tmpfitys1[0]]
        myfitplot = plot([tmpxs,reverse(tmpxs),tmpxs[0]], fitys, ' ', $
                         FILL_BACKGROUND=1, $
                         FILL_COLOR='grey', $
                         /OVERPLOT)
        fitys = myoutput.slpmp*xval + myoutput.intmp
        myfitplot = plot(tmpxs, fitys, '--', $
                         THICK=2.0, $
                         /OVERPLOT)
        
        
     ENDIF
     IF xx LE 10 THEN BEGIN
        xval = 0.77 
     ENDIF ELSE BEGIN 
        xval = 0.20
     ENDELSE
     IF xx EQ 0 THEN BEGIN
        lastname = data[xx].name 
        doit = 1
     ENDIF ELSE BEGIN
        IF data[xx].name EQ lastname THEN BEGIN
           doit = 0 
           notmove = notmove + 1
        ENDIF ELSE doit = 1
        lastname =  data[xx].name
     ENDELSE
     IF xx EQ n_elements(data)-1 THEN doit = 0

     IF doit EQ 1 THEN t = TEXT(xval, 0.82-0.030*(xx-notmove), data[xx].name, $
                                FONT_SIZE=11, $
                                FONT_COLOR=data[xx].symcolor)

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



 

END
;====================================================================================================


;====================================================================================================
PRO degroot2015a::masserrors, CATFILE=catfile, CATDIR=catdir, $
                              MINMASS=minmass, MAXMASS=maxmass, DMASS=dmass, $
                              LOGCENTER=logcenter


  IF keyword_set(MINMASS) THEN minmass = float(minmass[0]) ELSE minmass = 7.0
  IF keyword_set(MAXMASS) THEN maxmass = float(maxmass[0]) ELSE maxmass = 12.0
  IF keyword_set(DMASS) THEN dmass = float(dmass[0]) ELSE dmass = 0.2
  IF keyword_set(LOGCENTER) THEN logcenter = float(logcenter[0]) ELSE logcenter = 3.0
  IF keyword_set(CATFILE) THEN catfile = string(catfile) ELSE catfile = 'kemclass_pz_specz_v1-0-0.fits'
  IF keyword_set(CATDIR) THEN catdir = string(catdir) ELSE catdir = '/Users/adegroot/research/clusters/combination/catalogs/'
  catdata = mrdfits(strcompress(catdir + catfile, /REMOVE_ALL), 1, hdr)
  

  ;;;collect the errors and masses
  ys1 = (catdata.ph_l68_lmass - catdata.ph_lmass)
  ys2 = (catdata.ph_u68_lmass - catdata.ph_lmass)
  ys = [ys1,ys2]
  xs = [catdata.ph_lmass,catdata.ph_lmass]
  myplot = plot([catdata.ph_lmass,catdata.ph_lmass], [ys1,ys2], 'b+', $
                XRANGE=[minmass,maxmass])
  
  output = []
  FOR xx=maxmass-dmass, minmass+2*dmass, -2.0*dmass DO BEGIN
     print, 'Masses (middle, lower, upper)', xx, xx-dmass, xx+dmass
                                ;help, ys
     inbin = where((xs GE (xx-dmass)) AND (xs LT (xx+dmass)))
     thisbinxs = xs[inbin]
     thisbinys = ys[inbin]
                                ;help, thisbinxs
                                ;help, thisbinys

     goodbin = where((abs(thisbinys)-0.1) GT 0.0001)
      thisbinys = thisbinys[goodbin]

     ;;;bin and fit a lognormal function
     pdf = HISTOGRAM(thisbinys, LOCATIONS=ysbin, MIN=-4.25, MAX=4.25, BINSIZE=0.2)
     pdf = pdf / total(pdf)
     help, sample

     ysbin = reverse(ysbin+logcenter)

     fitysbin = where(ysbin GT 0.0)
     IF fitysbin[0] NE -1 THEN BEGIN
        ysbin = ysbin[fitysbin]
        pdf = pdf[fitysbin]
                                ;print, ysbin
                                ;print, pdf
        weights = fltarr(n_elements(ysbin))+1.0
        params = [1.0,0.1,max(pdf)]
        lognormal, ysbin, [1.0,0.1,max(pdf)], result
        result = curvefit(ysbin, pdf, weights, params, errparamsk, FUNCTION_NAME='LOGNORMAL', /NODERIVATIVE)
                                ;print, result
                                ;print, params
        lognormal, ysbin, params, resultcdf, /CDF

        sample = {massbin:xx, dmass:(-1.0*ysbin+logcenter), dmasspdf:result, dmasscdf:resultcdf}
        output = [output, sample]
        myplot = plot(ysbin, pdf, 'X', HISTOGRAM=0)
        myplot = plot(ysbin, result, 'b-', /OVERPLOT)
        myplot = plot(ysbin, resultcdf, 'r-', /OVERPLOT)
     ENDIF
  ENDFOR

                                ;help, output, /STRUC
  mwrfits, output, 'stellarmass_errorpdfs_v1-0.fits', /CREATE
END
;====================================================================================================



;====================================================================================================
PRO degroot2015a::datatable, INFILE=infile, INDIR=indir

  openw, lun, 'tmptablefile.txt', /GET_LUN
  printf, lun, '\begin{deluxetable*}{ c c c c c }'
  printf, lun, '\tabletypesize{\footnotesize}'
  printf, lun, '\tablecolumns{6}'
  printf, lun, '\tablecaption{Galaxy properties and physical parameters from z$\sim$1.6 composite spectra. \label{tbl:compspecdata}}'
  printf, lun, '\tablehead{'
  printf, lun, '\colhead{$\langle$Stellar Mass$\rangle$\tablenotemark{a}} & \colhead{Stellar Mass\tablenotemark{b}} & ' + $
          '\colhead{N$_{gal}\tablenotemark{c}$} & \colhead{N2\tablenotemark{d}} & \colhead{12 + log(O/H)\tablenotemark{e,}\tablenotemark{f}} \\'
  printf, lun, '\vspace{-0.35cm} }'
  printf, lun, '\startdata '


  ;;;first the full sample
  printf, lun, '\hline'
  printf, lun, '\multicolumn{5}{c}{Full Sample} \\'
  printf, lun, '\hline'
  line = ''
  infile = 'MOSFIRE_comp_clfour_smcurrent_all_highq_v3-6-1.fits'
  indir = '/Users/adegroot/research/clusters/combination/spectroscopy/stacks/clfour/smcurrent/all/highq/'
  data = mrdfits(strcompress(indir + infile, /REMOVE_ALL), 1)
  FOR xx=0, n_elements(data)-1, 1 DO BEGIN
     line = line + string(data[xx].mass, FORMAT='(f13.2)') + ' & '
     line = line + strcompress(string(data[xx].stckmmin, FORMAT='(f13.2)') + '-' + string(data[xx].stckmmax, FORMAT='(f13.2)'), /REMOVE_ALL)  + ' & '
     line = line + string(data[xx].nstck, FORMAT='(I)') + ' & '
     N2 = alog10(data[xx].niir_flux / data[xx].ha_flux)
     string1 = string(N2, FORMAT='(f13.3)')
     N2errn = N2 - alog10((data[xx].niir_flux-data[xx].niir_fluxerr) / (data[xx].ha_flux+data[xx].ha_fluxerr)) 
     string2 = '$_{-' + string(N2errn, FORMAT='(f13.3)') + '}'
     N2errp =alog10((data[xx].niir_flux+data[xx].niir_fluxerr) / (data[xx].ha_flux-data[xx].ha_fluxerr)) - N2
     string3 = '^{+' + string(N2errp, FORMAT='(f13.3)') + '}$'
     line = line + strcompress(string1 + string2 + string3, /REMOVE_ALL) + ' & '
     oxygen = 8.90 + 0.57 * alog10(data[xx].niir_flux / data[xx].ha_flux)
     string1 = string(oxygen, FORMAT='(f13.2)')
     string2 = '$_{-' + string(((0.57*N2errn)^2+(0.18/data[xx].nstck^0.5)^2)^0.5, FORMAT='(f13.2)') + '}'
     string3 = '^{-' + string(((0.57*N2errp)^2+(0.18/data[xx].nstck^0.5)^2)^0.5, FORMAT='(f13.2)') + '}$'
     line = line + strcompress(string1 + string2 + string3, /REMOVE_ALL )+ ' \\ ' + string(10b)
  ENDFOR
  printf, lun, line


  ;;;then the cluster sample
  printf, lun, '\hline'
  printf, lun, '\multicolumn{5}{c}{Galaxy Cluster Sample} \\'
  printf, lun, '\hline'
  line = ''
  infile = 'MOSFIRE_comp_clfour_smcurrent_envtwo_highq_v3-6-1_cl.fits'
  indir = '/Users/adegroot/research/clusters/combination/spectroscopy/stacks/clfour/smcurrent/envtwo/highq/cluster/'
  data = mrdfits(strcompress(indir + infile, /REMOVE_ALL), 1)
  FOR xx=0, n_elements(data)-1, 1 DO BEGIN
     line = line + string(data[xx].mass, FORMAT='(f13.2)') + ' & '
     line = line + strcompress(string(data[xx].stckmmin, FORMAT='(f13.2)') + '-' + string(data[xx].stckmmax, FORMAT='(f13.2)'), /REMOVE_ALL)  + ' & '
     line = line + string(data[xx].nstck, FORMAT='(I)') + ' & '
     N2 = alog10(data[xx].niir_flux / data[xx].ha_flux)
     string1 = string(N2, FORMAT='(f13.3)')
     N2errn = N2 - alog10((data[xx].niir_flux-data[xx].niir_fluxerr) / (data[xx].ha_flux+data[xx].ha_fluxerr)) 
     string2 = '$_{-' + string(N2errn, FORMAT='(f13.3)') + '}'
     N2errp =alog10((data[xx].niir_flux+data[xx].niir_fluxerr) / (data[xx].ha_flux-data[xx].ha_fluxerr)) - N2
     string3 = '^{+' + string(N2errp, FORMAT='(f13.3)') + '}$'
     line = line + strcompress(string1 + string2 + string3, /REMOVE_ALL) + ' & '
     oxygen = 8.90 + 0.57 * alog10(data[xx].niir_flux / data[xx].ha_flux)
     string1 = string(oxygen, FORMAT='(f13.2)')
     string2 = '$_{-' + string(((0.57*N2errn)^2+(0.18/data[xx].nstck^0.5)^2)^0.5, FORMAT='(f13.2)') + '}'
     string3 = '^{-' + string(((0.57*N2errp)^2+(0.18/data[xx].nstck^0.5)^2)^0.5, FORMAT='(f13.2)') + '}$'
     line = line + strcompress(string1 + string2 + string3, /REMOVE_ALL )+ ' \\ ' + string(10b)
  ENDFOR
  printf, lun, line


  ;;;then the field sample
  printf, lun, '\hline'
  printf, lun, '\multicolumn{5}{c}{Galaxy Field Sample} \\'
  printf, lun, '\hline'
  line = ''
  infile = 'MOSFIRE_comp_clfour_smcurrent_envtwo_highq_v3-6-1.fits'
  indir = '/Users/adegroot/research/clusters/combination/spectroscopy/stacks/clfour/smcurrent/envtwo/highq/field/'
  data = mrdfits(strcompress(indir + infile, /REMOVE_ALL), 1)
  FOR xx=0, n_elements(data)-1, 1 DO BEGIN
     line = line + string(data[xx].mass, FORMAT='(f13.2)') + ' & '
     line = line + strcompress(string(data[xx].stckmmin, FORMAT='(f13.2)') + '-' + string(data[xx].stckmmax, FORMAT='(f13.2)'), /REMOVE_ALL)  + ' & '
     line = line + string(data[xx].nstck, FORMAT='(I)') + ' & '
     N2 = alog10(data[xx].niir_flux / data[xx].ha_flux)
     string1 = string(N2, FORMAT='(f13.3)')
     N2errn = N2 - alog10((data[xx].niir_flux-data[xx].niir_fluxerr) / (data[xx].ha_flux+data[xx].ha_fluxerr)) 
     string2 = '$_{-' + string(N2errn, FORMAT='(f13.3)') + '}'
     N2errp =alog10((data[xx].niir_flux+data[xx].niir_fluxerr) / (data[xx].ha_flux-data[xx].ha_fluxerr)) - N2
     string3 = '^{+' + string(N2errp, FORMAT='(f13.3)') + '}$'
     line = line + strcompress(string1 + string2 + string3, /REMOVE_ALL) + ' & '
     oxygen = 8.90 + 0.57 * alog10(data[xx].niir_flux / data[xx].ha_flux)
     IF xx EQ 0 THEN BEGIN
        string1 = '$<$' + string(oxygen, FORMAT='(f13.2)')
        string2 = ''
        string3 = ''
     ENDIF ELSE BEGIN
        string1 = string(oxygen, FORMAT='(f13.2)')
     string2 = '$_{-' + string(((0.57*N2errn)^2+(0.18/data[xx].nstck^0.5)^2)^0.5, FORMAT='(f13.2)') + '}'
     string3 = '^{-' + string(((0.57*N2errp)^2+(0.18/data[xx].nstck^0.5)^2)^0.5, FORMAT='(f13.2)') + '}$'
     ENDELSE
     line = line + strcompress(string1 + string2 + string3, /REMOVE_ALL )+ ' \\ ' + string(10b)
  ENDFOR
  printf, lun, line



  printf, lun, '\enddata'
  printf, lun, '\vspace{-0.35cm}'
  printf, lun, '\tablenotetext{a}{Average log(M$_*$/M$_\odot$) of galaxies in bin}'
  printf, lun, '\tablenotetext{b}{Range log(M$_*$/M$_\odot$) of galaxies in bin}'
  printf, lun, '\tablenotetext{c}{Number of galaxies in bin}'
  printf, lun, '\tablenotetext{d}{Metallicity indicator log([NII]$\lambda6585$/H$\alpha$)}'
  printf, lun, '\tablenotetext{e}{Oxygen abundance determined with the N2 indicator using Equation (\ref{eq:N2calibration})}'
  printf, lun, '\tablenotetext{f}{Error bars include systematic error reduced by square root of the number of objects in bin}'
  printf, lun, '\end{deluxetable*}'
  
  close, lun
  free_lun, lun
  spawn, 'aqua tmptablefile.txt'

END
;====================================================================================================



;====================================================================================================
PRO degroot2015a::runmzranalysis, xsubset


  IF xsubset.binset EQ 'all' THEN alltog = 1 ELSE alltog = 0
  CASE xsubset.name OF
     'onezero' : stackdata = mrdfits('/Users/adegroot/research/clusters/combination/spectroscopy/stacks/' + $
                                     'clfour/smcurrent/all/highq/MOSFIRE_compsum_clfour_smcurrent_all_highq_v3-6-1.fits', 1, hdr)
     'oneone' : stackdata = mrdfits('/Users/adegroot/research/clusters/combination/spectroscopy/stacks/' + $
                                    'clfour/smcurrent/envtwo/highq/cluster/MOSFIRE_compsum_clfour_smcurrent_envtwo_highq_v3-6-1.fits', 1, hdr)
     'onetwo' : stackdata = mrdfits('/Users/adegroot/research/clusters/combination/spectroscopy/stacks/' + $
                                    'clfour/smcurrent/envtwo/highq/field/MOSFIRE_compsum_clfour_smcurrent_envtwo_highq_v3-6-1.fits', 1, hdr)
     ELSE : BEGIN
        print, 'WARNING!! No stackdata file specified for this particular case. '
        print, 'Using default full sample, no environment'
        stackdata = mrdfits('/Users/adegroot/research/clusters/combination/spectroscopy/stacks/' + $
                            'clfour/smcurrent/all/highq/MOSFIRE_compsum_clfour_smcurrent_all_highq_v3-6-1.fits', 1, hdr)
     ENDELSE
  ENDCASE  
  
  run = obj_new('mzranalysis', CURCAT=xsubset.catalog, WORKING=xsubset.name)                    ;make analysis object
  run.readcat, xsubset.catalog, INDIR='/Users/adegroot/research/clusters/combination/catalogs/' ;read in data 
  run.findtags                                                                                  ;find all the tags we need
  IF xsubset.mcmass GT 1 THEN newmass = run.mcmass(xsubset.mcmass, WHICH=2)                     ;get perturbed masses
                                ;run.plotmzrindiv, ALLTOG=alltog, LABEL=0                                                      ;plot individual points
                                ;run.plotbpt, /NOIRAGN         ;plot sudo-BPT points, run with v1-0-1 of catalog!!!
                                ;run.plotiragn                                              ;plot Donley 2012 IR AGN selection, run with v1-0-0 of catalog!!!
  run.makebins, BINSET=xsubset.binset, NINBIN=xsubset.ninbin  ;find mass bin sizes
  run.specsort                                                ;sort data into bins
  run.findstats                                               ;find stats for bins
  ;run.specstack, SM=xsubset.sm                                ;stack spectra
  IF xsubset.usefullerr NE 0 THEN run.buildperturb            ;build the full error spectrum
  run.specstack, SM=xsubset.sm, JUSTFIT=1                     ;just refit the stacked spectra
  run.collatespecstack, /STACKSPEC                            ;stack spectra
  run.readstack, STACKFILE=0                                  ;read in the mzr stack data
                                ;run.readstack, STACKFILE = 'MOSFIRE_comp_clfour_smcurrent_envtwo_highq_v3-6-1_each.fits' ;read in the mzr stack data
  run.findstacktags                                                                        ;find all the tags we need
  CASE xsubset.binset OF
     'all': thissubset = 0
     'cluster': thissubset = ['B','D','F']
     'field': thissubset = ['A','C','E','G','I','K']
     ELSE : BEGIN
        print, 'WARNING!! Something has gone horribly wrong!!'
     ENDELSE
  ENDCASE
  run.plotspecstack, USEFULLERR=xsubset.usefullerr, SUBSET=thissubset         ;plot the stacked spectra
  run.fitmzrstack, WHICH=xsubset.fitmzr, /SAVE, /STARTOVER                    ;fit the stack measured MZR
  run.plotmzrstack, SHOWFIT=1, SHOWMED=0, SHOWMEAN=0, SHOWENV=xsubset.environ ;plot the stacked MZR
  run.plotmzrstack, STACKDATA=stackdata, PERTURB=1, SHOWENV=xsubset.environ   ;plot the stacked MZR perturbed points

  FOR ww=1, xsubset.mcmass-1, 1 DO BEGIN                                               ;loop over monte carlo mass errors
     run.storenew, MASSES=newmass[*,ww]                                                ;set in new masses
     run.specsort                                                                      ;sort data into bins
     run.binbootstrap, xsubset.ninbin                                                  ;bootstrap resample each mass bin
     run.specstack, SM=xsubset.sm, /BOOTSTRAP, /PERTURB                                ;stack spectra
     run.collatespecstack, /ACTUALSPEC, /STACKSPEC, /SUMMATION, STARTADD=thissubset[0] ;stack spectra
                                ;run.readstack                                             ;read in the mzr stack data
                                ;run.findstacktags                                         ;find all the tags we need
                                ;run.fitmzrstack, WHICH=xsubset.fitmzr, /SAVE              ;fit the stack measured MZR
  ENDFOR                        ;end monte carlo mass errors


  ;;;post mass perturbation stuff
                                ;run.plotspecstack, /USEFULLERR



                                ;run.plotspecstack             ;plot the stacked spectra
  
obj_destroy, run              ;destory analysis object
  
END
;====================================================================================================


;====================================================================================================
PRO degroot2015a::workingon, subset, CATALOG=catalog, BINSET=binset

  
  sets = [{name:'one', catalog:'kemclass_pz_specz_v0-8-1.fits', BINSET:'all', NINBIN:17, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:0}, $
          {name:'two', catalog:'kemclass_pz_specz_v0-8-2.fits', BINSET:'all', NINBIN:20, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:0}, $
          {name:'three', catalog:'kemclass_pz_specz_v0-8-3.fits', BINSET:'all', NINBIN:20, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:0}, $
          {name:'four', catalog:'kemclass_pz_specz_v0-8-1.fits', BINSET:'field', NINBIN:26, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:0}, $
          {name:'five', catalog:'kemclass_pz_specz_v0-8-1.fits', BINSET:'cluster', NINBIN:8, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:0}, $ 
          {name:'six', catalog:'kemclass_pz_specz_v0-8-2.fits', BINSET:'field', NINBIN:20, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:0}, $
          {name:'seven', catalog:'kemclass_pz_specz_v0-8-2.fits', BINSET:'cluster', NINBIN:14, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:0}, $ 
          {name:'eight', catalog:'kemclass_pz_specz_v0-8-3.fits', BINSET:'field', NINBIN:20, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:0}, $
          {name:'nine', catalog:'kemclass_pz_specz_v0-8-3.fits', BINSET:'cluster', NINBIN:14, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:0}, $ 
          {name:'onezero', catalog:'kemclass_pz_specz_v1-2-0.fits', BINSET:'all', NINBIN:25, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:0, USEFULLERR:1}, $ 
          {name:'oneone', catalog:'kemclass_pz_specz_v1-2-0_cl.fits', BINSET:'cluster', NINBIN:16, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:1, USEFULLERR:1}, $ 
          {name:'onetwo', catalog:'kemclass_pz_specz_v1-2-0_field.fits', BINSET:'field', NINBIN:25, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:1, USEFULLERR:1}, $ 
          {name:'onethree', catalog:'kemclass_pz_specz_v1-2-0.fits', BINSET:'field', NINBIN:25, SM:'smcurrent', FITMZR:'tr04', MCMASS:1, ENVIRON:1, USEFULLERR:0}] 
  

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

