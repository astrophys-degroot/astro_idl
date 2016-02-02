;========================================================================================================================
function KEWLEY_2006, model, $
                      NPTS=npts, XMIN=xmin, XMAX=xmax, $
                      FLUXHA=fluxha, FLUXNII=fluxnii, FLUXHB=fluxhb, FLUXOIII=fluxoiii



;+
; NAME:
;       KEWLEY_2006()
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
;       A. DeGroot, 2015 March 25, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.0'

  
  ;;;defaults
  IF keyword_set(NPTS) THEN npts = npts[0] ELSE npts = 500.0 ;set default
  IF keyword_set(XMIN) THEN xmin = xmin[0] ELSE xmin = -2.0  ;set default
  IF keyword_set(XMAX) THEN xmax = xmax[0] ELSE xmax = 0.99  ;set default


  CASE 1 OF
     (keyword_set(FLUXHA) AND keyword_set(FLUXNII) AND $          ;cont next line
      keyword_set(FLUXHB) AND keyword_set(FLUXOIII)) : which = 1   ;give points which satisfy
     (keyword_set(FLUXHA) AND keyword_set(FLUXNII) AND $          ;cont next line
      ~keyword_set(FLUXHB) AND ~keyword_set(FLUXOIII)) : which = 2 ;give points which satisfy
     (~keyword_set(FLUXHA) AND ~keyword_set(FLUXNII) AND $        ;cont next line
      keyword_set(FLUXHB) AND keyword_set(FLUXOIII)) : which = 3   ;give points which satisfy
     ELSE : which = 4
  ENDCASE
 

  print, which

  CASE which OF
     1 : print, 'Need more work for full BPT stuff'
     2 : BEGIN
        N2 = alog10(fluxnii/fluxha)                            ;find ratio
        chk = where((N2 NE N2) OR (N2 NE 0.0))                 ;find any NaNs or zeros
        IF chk[0] NE -1 THEN N2 = N2[chk]                      ;if present, remove
        N2flag = intarr(n_elements(fluxha))                    ;copy array
        agn = where((N2 GT 0.2), nagn)                         ;true AGN likely
        IF agn[0] NE -1 THEN N2flag[agn] = 2                   ;flag agn
        composite = where((N2 GT -0.2) AND (N2 LT 0.2), ncomp) ;composite likely
        IF composite[0] NE -1 THEN N2flag[composite] = 1       ;flag composite
        RETURN, N2flag                                         ;return values
     END
     3 : print, 'Need more work for just log(OIII/Hbeta) BPT stuff'

     4: BEGIN
        CASE model OF
           1 : coeffs = {c0:-0.05, c1:1.30, c2:0.61, minx:-3.0, maxx:0.0, DESCRIPTION:'NII SF'}
           2 : coeffs = {c0:-0.47, c1:1.19, c2:0.61, minx:-3.0, maxx:0.2, DESCRIPTION:'NII composite'}
           3 : coeffs = {c0:-0.32, c1:1.30, c2:0.72 ,minx:-3.0,  maxx:0.0, DESCRIPTION:'SII'}
           4 : coeffs = {c0:0.59, c1:1.33, c2:0.73, maxx:0.0, DESCRIPTION:'OI'}
           ELSE : BEGIN
              print, 'WARNING!!! Model choice not recoginzed'
              print, '  Using default...'
           END
        ENDCASE     

        ;;;find models
        bptmodel = {xs:fltarr(npts), ys:fltarr(npts)}                ;create structure
        bptmodel.xs = indgen(npts)*((xmax-xmin)/npts) + xmin         ;create an array of xs
        bptmodel.ys = (coeffs.c2 / (bptmodel.xs+coeffs.c0)) + coeffs.c1 ;find y values
        IF model EQ 1 THEN BEGIN                                        ;if NII composite model
           tmpys = (0.61 / (bptmodel.xs-0.47)) + 1.19                   ;find NII SF y values
           mindiff = min(abs(bptmodel.ys-tmpys), minind)                ;find cross-over point
        ENDIF ELSE minind = 0                                           ;end if NII composite model

        ;;;clean up models
        mindiff = min(abs(bptmodel.xs-coeffs.maxx), maxind)                     ;find close cut index
        bptmodel2 = {xs:bptmodel.xs[minind:maxind], ys:bptmodel.ys[minind:maxind]} ;cut out irrelevant
        bptmodel = 0                                                               ;reset
        bptmodel = bptmodel2                                                       ;re-store
        bptmodel2 = 0                                                              ;reset

        RETURN, bptmodel
     END
     
     ELSE : BEGIN
        print, 'WARNING!! Something has gone horribly wrong!!'
     END
     
  ENDCASE

END
;========================================================================================================================



;========================================================================================================================
PRO call_kewley_2006


  cat = 'CDFS44_pz_specz_full_v3-5-1.fits'
  data = mrdfits(cat, 1, hdr)
  ;help, data, /STRUC

  out = kewley_2006(1, FLUXHA=data.SP_M_HA_FLUX, FLUXNII=data.SP_M_NIIR_FLUX);, $
                    ;FLUXHB=data.ph_irac3flux, FLUXOIII=data.ph_irac4flux)

  
  add_tag, data, 'AN_AGNK06', 0, newstruc
  data = newstruc
  data.AN_AGNK06 = out

  outfile = 'CDFS44_pz_specz_full_v3-5-2.fits'
  print, outfile
  
  mwrfits, data, outfile, /CREATE


END
;========================================================================================================================
