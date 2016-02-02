;========================================================================================================================
pro polish_redshift, xfile, ZTAG1=ztag1, ZTAG2=ztag2, ZTAGOUT=ztagout, NULLVAL=nullval


;+
; NAME:
;       POLISH_REDSHIFT()
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
;-
  version = '1.0.0'


  print, 'Hello World!'

  IF keyword_set(ZTAG1) THEN ztag1 = ztag1[0] ELSE ztag1 = 'Z_MOSFIRE'       ;sets new value
  IF keyword_set(ZTAG2) THEN ztag2 = ztag2[0] ELSE ztag2 = 'Z_FORS2'         ;sets new value
  IF keyword_set(ZTAGOUT) THEN ztagout = ztagout[0] ELSE ztagout = 'ZBEST'   ;sets new value
  IF keyword_set(NULLVAL) THEN nullval = nullval[0] ELSE nullval = '-99.000' ;sets new value


  ;;;read in file
  data = mrdfits(xfile, 1, datahdr)
  help, data, /STRUC
  print, ztag1, '', ztag2, '', ztagout
  

  ;;;get structure indices, sanity checks
  ztag1chk = tag_exist(data, ztag1, INDEX=ztag1ind)
  ztag2chk = tag_exist(data, ztag2, INDEX=ztag2ind)
  ztagoutchk = tag_exist(data, ztagout, INDEX=ztagoutind)
  IF ztag1chk EQ 0 THEN print, 'WARNING!! ztag1 doesnt exist!!'
  IF ztag2chk EQ 0 THEN print, 'WARNING!! ztag2 doesnt exist!!'
  IF ztagoutchk EQ 1 THEN print, 'WARNING!! ztagout already exist!!'

  print, ztag1ind, '', ztag2ind, '', ztagoutind

  ;;;create new stucture with a new tag for combined redshift data
  add_tag, data, ztagout, 0.0, dataout
  ztagoutchk = tag_exist(dataout, ztagout, INDEX=ztagoutind)
  
  ;;;fill in combined redshift data
  ;;;no redshift from either -> no redshift i.e. null value
  ;;;no redshift from one -> redshift comes from the other
  ;;;redshift from both and they agree -> take average
  ;;;redshift from both and they disagree -> take fors2 redshift


  z1real = where(((data.(ztag1ind)-nullval) GT 0.1) AND (data.(ztag1ind) EQ data.(ztag1ind)), nz1real, COMPLEMENT=z1null)
  z2real = where(((data.(ztag2ind)-nullval) GT 0.1) AND (data.(ztag2ind) EQ data.(ztag2ind)), nz2real, COMPLEMENT=z2null)


  FOR xx=0, n_elements(data.(0))-1, 1 DO BEGIN
     chk1a = where(xx EQ z1null)
     chk1b = where(xx EQ z1real)
     chk2a = where(xx EQ z2null)
     chk2b = where(xx EQ z2real)
     print, data[xx].(ztag1ind)

     CASE 1 OF 
        (chk1a NE -1) AND (chk1b EQ -1) AND (chk2a NE -1) AND (chk2b EQ -1) : BEGIN
           print, 'neither'
           dataout[xx].(ztagoutind) = float(nullval) 
        END
        (chk1a EQ -1) AND (chk1b NE -1) AND (chk2a NE -1) AND (chk2b EQ -1) : BEGIN
           print, 'mosfire only'
           dataout[xx].(ztagoutind) = data[xx].(ztag1ind)
        END
        (chk1a NE -1) AND (chk1b EQ -1) AND (chk2a EQ -1) AND (chk2b NE -1) : BEGIN
           print, 'fors2 only'
           dataout[xx].(ztagoutind) = data[xx].(ztag2ind)
        END
        (chk1a EQ -1) AND (chk1b NE -1) AND (chk2a EQ -1) AND (chk2b NE -1) : BEGIN
           print, 'both'
           dataout[xx].(ztagoutind) = mean([data[xx].(ztag1ind), data[xx].(ztag2ind)])
        END
        ELSE : BEGIN
           print, 'WARNING!! Something went very wrong!!'
           print, ' detection was not found to have either a real or null value'
        END
     ENDCASE

  ENDFOR

  mwrfits, dataout, 'cdfs44_composite_specz_v3-1.fits', /CREATE


END
;========================================================================================================================



;========================================================================================================================
pro call_polish_redshift


  xfile = 'cdfs44_composite_specz_v3-0.fits'
  polish_redshift, xfile
  

END
;========================================================================================================================
