;========================================================================================================================
PRO mosfire_handle_prep


  
  print, 'Checking for TRUITIME keyword!!'
  chk = 0 
  cnt = 1
  template = 'm140613_#.fits' 
  WHILE chk EQ 0 DO BEGIN
     cur = template
     CASE 1 OF
        cnt LE 9 : strreplace, cur, '#', '000'+ string(cnt)
        cnt LE 99 : strreplace, cur, '#', '00'+ string(cnt)
        cnt LE 999 : strreplace, cur, '#', '0'+ string(cnt)
        cnt LE 9999 : strreplace, cur, '#', string(cnt)
        ELSE : BEGIN
           print, 'WARNING!! To many frames taken in one night!!'
           print, '  Cant cope!!'
           stop
        END
     ENDCASE
     cur = strcompress(cur, /REMOVE_ALL)
     print, cur
     fchk = file_test(cur)
     IF fchk EQ 1 THEN BEGIN
        ;print, cur
        hdr = headfits(cur, EXTEN=0)
        

        IF CNT EQ 1 THEN BEGIN
           openw, lun, 'degroot_sample_hdr.txt', /GET_LUN
           FOR xx=0, n_elements(hdr)-1, 1 DO BEGIN
              printf, lun, hdr[xx]
              item = strmid(hdr[xx], 0, 8)
              item = strcompress(item, /REMOVE_ALL)
              IF xx EQ 0 THEN items = item ELSE items = [items, item]
           ENDFOR
           close, lun
           stop
        ENDIF ELSE BEGIN
           FOR xx=0, n_elements(items)-1, 1 DO BEGIN
              vchk = fxpar(hdr, items[xx], COUNT=nfound)
              IF nfound EQ 0 THEN print, items[xx]
           ENDFOR
        ENDELSE

        vchk = fxpar(hdr, 'TRUITIME')
        IF vchk EQ 1 THEN print, 'I found one!!', cur
        cnt++
     ENDIF ELSE chk = 1
     

  ENDWHILE 
  
  




END
;========================================================================================================================
