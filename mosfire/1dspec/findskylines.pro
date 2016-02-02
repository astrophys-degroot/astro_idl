;========================================================================================================================
pro skylinesreg, band, REGFILE=regfile
  
  IF keyword_set(REGFILE) THEN regfile = regfile[0] ELSE regfile = 'skylines_jband_mosfire.reg'

  speclines, band, VALS=vals    ;get spectral lines
  help, vals, /STRUC
  
  openw, lun, regfile, /GET_LUN
  printf, lun, '# Region file format: DS9 version 4.1'
  printf, lun, '# Filename: testinghskylines.fits'
  printf, lun, 'global color=green dashlist=8 3 width=1 font="helvetica 10 normal roman" select=1 highlite=1 dash=0 fixed=0 edit=1 move=1 delete=1 include=1 source=1'
  printf, lun, 'wcs;'

  FOR xx=0, n_elements(vals.(0))-1, 1 DO BEGIN
     bit = strcompress('line(' + string(vals.lower[xx]) + ', 50.0,' + string(vals.lower[xx]) + ', -50.0) # line=0 0 color=red')
     printf, lun, bit
     bit = strcompress('line(' + string(vals.lines[xx]) + ', 50.0,' + string(vals.lines[xx]) + ', -50.0) # line=0 0') 
     printf, lun, bit
     bit = strcompress('line(' + string(vals.upper[xx]) + ', 50.0,' + string(vals.upper[xx]) + ', -50.0) # line=0 0 color=red')
     printf, lun, bit
  ENDFOR
  close, lun
  free_lun, lun

END
;========================================================================================================================


;========================================================================================================================
pro regskylines, file, NHDR=nhdr

  IF keyword_set(NHDR) THEN nhdr = nhdr[0] ELSE nhdr = 2 ;set new value

  
  nlines = file_lines(file)
  lines = dblarr(ceil((nlines-1) / 3))
  lower = dblarr(ceil((nlines-1) / 3))
  upper = dblarr(ceil((nlines-1) / 3))
  help, lines, lower, upper
  bit = ' '
  cnt = 0
  cnt2 = 0
  openr, lun, file, /GET_LUN
  FOR xx=0L, nlines-1, 1 DO BEGIN
     readf, lun, bit
     bits = strsplit(bit, '(,),#,=,', /EXTRACT)
     IF xx LE 2 THEN BEGIN
        print, 'Skipping line (header) ...'
     ENDIF ELSE BEGIN
        IF cnt mod 3 EQ 0 THEN lower[cnt2] = double(bits[1])
        IF cnt mod 3 EQ 1 THEN lines[cnt2] = double(bits[1])
        IF cnt mod 3 EQ 2 THEN BEGIN
           upper[cnt2] = double(bits[1])
           cnt2 = cnt2 + 1
        ENDIF
        cnt = cnt + 1
     ENDELSE
  ENDFOR
  close, lun
  free_lun, lun

  openw, lun, 'tmp.txt', /GET_LUN
  printf, lun, '{lines:['
  FOR xx=0L, n_elements(lines)-1, 1 DO printf, lun, strcompress(string(lines[xx]) + ', ')
  printf, lun, '], $'
  printf, lun, 'lower:['
  FOR xx=0L, n_elements(lines)-1, 1 DO printf, lun, strcompress(string(lower[xx]) + ', ')
  printf, lun, '], $'
  printf, lun, 'upper:['
  FOR xx=0L, n_elements(lines)-1, 1 DO printf, lun, strcompress(string(upper[xx]) + ', ')
  printf, lun, '] }'
  close, lun
  free_lun, lun

  spawn, 'aqua tmp.txt'
  

END
;========================================================================================================================


;========================================================================================================================
pro maskskylines, file, xband
  
  
  ;;;
  print, strcompress('  Masking ' + xband[0] + ' sky lines!')
  data = readfits(file, hdr, /SILENT)
  
  ;;;wavelengths
  naxis1 = fxpar(hdr, 'NAXIS1')
  naxis2 = fxpar(hdr, 'NAXIS2')
  crval1 = fxpar(hdr, 'CRVAL1')
  crval2 = fxpar(hdr, 'CRVAL2')
  cd1_1 = fxpar(hdr, 'CD1_1')
  cd1_2 = fxpar(hdr, 'CD1_2')
  cd2_1 = fxpar(hdr, 'CD2_1')
  cd2_2 = fxpar(hdr, 'CD2_2')
  lambdas = cd1_1*indgen(naxis1)+crval1

  ;;;Sky lines
  speclines, xband, VALS=skyvals ;get spectral lines
  skymask = data                 ;make a copy
  skymask[*,*] = 1               ;set all to 1
  
  FOR xx=0UL, n_elements(skyvals.(0))-1 DO BEGIN                                          ;loop over spec lines
     chk = where((lambdas GE skyvals.lower[xx]) AND (lambdas LE skyvals.upper[xx]), nchk) ;find sky lines in spectrum
     IF nchk NE 0 THEN skymask[chk, *] = 0                                                ;set sky lines areas to zero
  ENDFOR                                                                                  ;end loop over spec lines
  
  data = data * skymask
  mwrfits, data, 'testingkskylines_jband_nofaint.fits', hdr, /CREATE

END
;========================================================================================================================



;========================================================================================================================
pro findskylines, list, BAND=band
  
  bit = ' '
  nfiles = file_lines(list)
  files = strarr(nfiles)
  openr, lun, list, /GET_LUN
  FOR xx=0, nfiles-1, 1 DO BEGIN
     readf, lun, bit
     files[xx] = bit
  ENDFOR
  close, lun
  free_lun, lun


  FOR xx=0, nfiles-1, 1 DO BEGIN
     current = files[xx]
     print, current
     data = readfits(current, hdr, /SILENT)
     IF xx EQ 0 THEN BEGIN
        outdata = abs(data)
        outhdr = hdr
     ENDIF ELSE outdata = outdata + abs(data)
  ENDFOR


  mwrfits, outdata, 'testingkskylines_jband.fits', outhdr

END                                
;========================================================================================================================
