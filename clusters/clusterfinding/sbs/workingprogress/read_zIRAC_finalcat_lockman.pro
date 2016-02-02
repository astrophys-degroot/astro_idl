;pro read_zIRAC_finalcat_LOCKMAN, rar, decr, apmag_176, eapmag_176, apmag_366, eapmag_366, mag_best, emag_best, ch1bf, c1ebap, c1_3pxapc, c1_3pxerr, ch2bf, c2ebap, c2_3pxapc, c2_3pxerr

;nzobj = 334148

pro read_zirac_finalcat_lockman, rar, decr, apmag_176, eapmag_176, apmag_366, eapmag_366, mag_best, emag_best, ch1bf, c1ebap, c1_3pxapc, c1_3pxerr, ch2bf, c2ebap, c2_3pxapc, c2_3pxerr
  name = 'lockman_adamspipeline_v1.0.0.cat'
  nzobj = file_lines(name)
  rar = dblarr(nzobj)
  decr = dblarr(nzobj)
  apmag_176 = dblarr(nzobj)
  eapmag_176 = dblarr(nzobj)
  apmag_366 = dblarr(nzobj)
  eapmag_366 = dblarr(nzobj)
  ch1bf = dblarr(nzobj)
  c1ebap = dblarr(nzobj)
  c1_3pxapc = dblarr(nzobj)
  c1_3pxerr = dblarr(nzobj)
  ch2bf = dblarr(nzobj)
  c2ebap = dblarr(nzobj)
  c2_3pxapc = dblarr(nzobj)
  c2_3pxerr = dblarr(nzobj)
  mag_best = dblarr(nzobj)
  emag_best = dblarr(nzobj)
  readcol, name, rar, decr, apmag_176, eapmag_176, apmag_366, eapmag_366, mag_best, emag_best, ch1bf, c1ebap, c1_3pxapc, c1_3pxerr, ch2bf, c2ebap, c2_3pxapc, c2_3pxerr
  print, min(rar), max(rar), stdev(rar)
  print, min(decr), max(decr), stdev(decr)
  print, min(ch2bf), max(ch2bf), stdev(ch2bf)
  print, min(mag_best), max(mag_best), stdev(mag_best)
  

end
