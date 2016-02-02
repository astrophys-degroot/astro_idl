;========================================================================================================================
pro xmm105_maskall_H_collate
  
  files = []
 
  outfile = ''
  outdir = ''


  outfile = strcompress(outdir + outfile, /REMOVE_ALL)
  ntot = 0
  FOR xx=0, n_elements(files)-1, 1 DO BEGIN
     data = mrdfits(files[xx], 1, hdr)
     nmask = n_elements(data.(0))
     ntot = ntot + nmask
  ENDFOR

  out = replicate(data[0], ntot)
  nrun = 0
  FOR xx=0, n_elements(files)-1, 1 DO BEGIN
     data = mrdfits(files[xx], 1, hdr)
     nmask = n_elements(data.(0))
     FOR yy=0, nmask-1, 1 DO BEGIN
        out[nrun] = data[yy]
        nrun++
     ENDFOR
  ENDFOR
  
  print, outfile
  mwrfits, out, outfile, /CREATE







END	
;========================================================================================================================



