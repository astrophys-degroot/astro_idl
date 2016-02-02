;;;=================================================================================================================
function xcsao_getz, xfile
  
; Purpose : to find numerical values for redshift, redshift error of a source
;
; INPUTS:
;    xfile : 1D spectrum that has been run through the IRAF task XCSAO
;      (task in RVSAO package)
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;

  out = dblarr(2)               ;create array
  
  file = mrdfits(xfile, 0, hdr)   ;read in file, header
  line = fxpar(hdr, 'APVXC1')     ;get line from header
  line = strsplit(line, /EXTRACT) ;extract line values
  cz = double(line[0])            ;change data type, set value
  dcz = double(line[1])           ;change data type, set value
  
  c = 299792.45                      ;set speed of light
  dc = 0.01                          ;error in speed of light
  z = cz / 299792.45                 ;calculate redshift
  dz = z*((dcz/cz)^2 + (dc/c)^2)^0.5 ;error in redshift
  
  out[0] = z                    ;set value in output
  out[1] = dz                   ;set value in output
  

  return, out                   ;return
end
;;;=================================================================================================================
