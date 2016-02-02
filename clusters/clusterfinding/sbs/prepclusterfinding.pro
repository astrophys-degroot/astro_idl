;========================================================================================================================
PRO prepclusterfinding, HOME=home, FOLDERS=folders, DIR=dir, SKIP=skip
  
  
  IF keyword_set(home) THEN home = home[0] ELSE home = ' '                                                ;sets new value
  IF keyword_set(dir) THEN dir = dir[0] ELSE dir = '/Users/degroota/research/current8_en1clusterfinding/' ;sets new value
  
  
  folders = {dir:dir, $
             home:home, $
             graphics:'graphics', $
             regionfiles:'regionfiles', $
             zI1sliceweights:'zI1sliceweights', $
             zI1clustermaps:'zI1clustermaps', $
             zI1clustercats:'zI1clustercats', $
             I1I2sliceweights:'I1I2sliceweights', $
             I1I2clustermaps:'I1I2clustermaps', $
             I1I2clustercats:'I1I2clustercats', $
             sextractor:'sextractor', $
             auxiliary:'auxiliary'}
            
  IF NOT keyword_set(SKIP) THEN BEGIN
     line = strcompress(dir + home, /REMOVE_ALL) ; 
     print, 'Making home directory: ', line      ;
     chk = file_test(line, /DIRECTORY)           ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line     ;
     
     print, 'Making directory: ', line + folders.graphics       ;
     chk = file_test(line + folders.graphics, /DIRECTORY)       ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line + folders.graphics ;
     
     print, 'Making directory: ', line + folders.regionfiles        ;
     chk = file_test(line + folders.regionfiles, /DIRECTORY)        ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line + folders.regionfiles  ;
     
     print, 'Making directory: ', line + folders.zI1sliceweights       ;
     chk = file_test(line + folders.zI1sliceweights, /DIRECTORY)       ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line + folders.zI1sliceweights ;
     
     print, 'Making directory: ', line + folders.zI1clustermaps       ;
     chk = file_test(line + folders.zI1clustermaps, /DIRECTORY)       ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line + folders.zI1clustermaps ;
     
     print, 'Making directory: ', line + folders.zI1clustercats       ;
     chk = file_test(line + folders.zI1clustercats, /DIRECTORY)       ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line + folders.zI1clustercats ;
     
     print, 'Making directory: ', line + folders.I1I2sliceweights       ;
     chk = file_test(line + folders.I1I2sliceweights, /DIRECTORY)       ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line + folders.I1I2sliceweights ;
     
     print, 'Making directory: ', line + folders.I1I2clustermaps        ;
     chk = file_test(line + folders.I1I2clustermaps, /DIRECTORY)        ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line +  folders.I1I2clustermaps ;
     
     print, 'Making directory: ', line + folders.I1I2clustercats       ;
     chk = file_test(line + folders.I1I2clustercats, /DIRECTORY)       ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line + folders.I1I2clustercats ;
     
     print, 'Making directory: ', line + folders.sextractor       ;
     chk = file_test(line + folders.sextractor, /DIRECTORY)       ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line + folders.sextractor ;
     
     print, 'Making directory: ', line + folders.auxiliary       ;
     chk = file_test(line + folders.auxiliary, /DIRECTORY)       ;
     IF chk EQ 0 THEN spawn, 'mkdir ' + line + folders.auxiliary ;
  ENDIF

  RETURN
END
;========================================================================================================================
