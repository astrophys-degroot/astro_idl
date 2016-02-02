;========================================================================================================================
function donley_2012, model, $
                      MINX=minx, MAXX=maxx, MINY=miny, MAXY=maxy, $
                      FLUXCH1=fluxch1, FLUXCH2=fluxch2, FLUXCH3=fluxch3, FLUXCH4=fluxch4


;+
; NAME:
;       DONLEY_2012()
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
;        -only does fluxes right now but there is a mag version
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2015 April 2, Univ. Cali, Riverside v1.0.0
;          -INCEPTION
;
; DESIRED UPGRADES
;     
;
;-
  version = '2.0.0'

  
  ;;;defaults
  IF keyword_set(MINX) THEN minx = minx[0] ELSE minx = -1.0 ;set default 
  IF keyword_set(MAXX) THEN maxx = maxx[0] ELSE maxx = 1.0  ;set default 
  IF keyword_set(MINY) THEN miny = miny[0] ELSE miny = -2.0 ;set default 
  IF keyword_set(MAXY) THEN maxy = maxy[0] ELSE maxy = 2.0  ;set default 

  
  IF (keyword_set(FLUXCH1) AND keyword_set(FLUXCH2) AND $       ;cont next line
      keyword_set(FLUXCH3) AND keyword_set(FLUXCH4)) THEN BEGIN ;give points which satisfy
     chk = ((n_elements(fluxch1) EQ n_elements(fluxch2)) AND $  ;cont next line
            (n_elements(fluxch1) EQ n_elements(fluxch3)) AND $  ;cont next line
            (n_elements(fluxch1) EQ n_elements(fluxch4)))       ;compares # of elements in each array
     IF (chk EQ 1) THEN BEGIN
        xx = alog10(fluxch3/fluxch1)
        chk2 = where(xx NE xx)
        IF chk2[0] NE -1 THEN xx[chk2] = -99.0
        yy = alog10(fluxch4/fluxch2)
        chk2 = where(yy NE yy)
        IF chk2[0] NE -1 THEN yy[chk2] = -99.0
        agn = where((xx GT 0.08) AND (yy GT 0.15) AND (yy GT (1.21*xx-0.27)) AND (yy LT (1.21*xx+0.27)) AND $ ;cont next line
                    (fluxch2 GT fluxch1) AND (fluxch3 GT fluxch2) AND (fluxch4 GT fluxch3))
        RETURN, agn
     ENDIF ELSE BEGIN
        print, 'WARNING!!! Number of elements in flux arrays not equal'
        print, '  Can not continue...'
        stop
     ENDELSE    
     
 
     RETURN, 1
  ENDIF ELSE BEGIN              ;give model region rather than points

  ;;;limits for AGN region
     CASE model OF
        1 : BEGIN
           iracagnmodel = {xs:[maxx,0.08,0.08,0.388,maxx], ys:[-99.0,0.367,0.15,0.15,-99.0]}
           iracagnmodel.ys[0] = 1.21*iracagnmodel.xs[0] + 0.27
           iracagnmodel.ys[4] = 1.21*iracagnmodel.xs[4] - 0.27
           
        END
        2 : iracagnmodel = {xs:[0.08,0.08], ys:[miny,maxy]}
        3 : iracagnmodel = {xs:[minx,maxx], ys:[0.15,0.15]}
        4 : BEGIN
           iracagnmodel = {xs:[minx,maxx], ys:[0.0,0.0]}
           iracagnmodel.ys = 1.21*iracagnmodel.xs - 0.27
        END
        5 : BEGIN
           iracagnmodel = {xs:[minx,maxx], ys:[0.0,0.0]}
           iracagnmodel.ys = 1.21*iracagnmodel.xs + 0.27
        END
        ELSE : BEGIN
           print, 'WARNING!!! Limits choice not recoginzed'
           print, '  Using default of "all"...'
        END
     ENDCASE
     RETURN, iracagnmodel
  ENDELSE



END
;========================================================================================================================


;========================================================================================================================
PRO call_donley_2012


  cat = 'CDFS44_pz_specz_full_v3-5-0.fits'
  data = mrdfits(cat, 1, hdr)
  ;help, data, /STRUC

  out = donley_2012(1, FLUXCH1=data.ph_irac1flux, FLUXCH2=data.ph_irac2flux, $
                    FLUXCH3=data.ph_irac3flux, FLUXCH4=data.ph_irac4flux)

  
  add_tag, data, 'AN_AGND12', 0, newstruc
  data = newstruc
  data[out].AN_AGND12 = 1

  outfile = 'CDFS44_pz_specz_full_v3-5-1.fits'
  print, outfile
  
  mwrfits, data, outfile, /CREATE


END
;========================================================================================================================


