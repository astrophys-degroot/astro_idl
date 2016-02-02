;pro read_zirac_finalcat_cdfs, rar, decr, apmag_176, eapmag_176, apmag_366, eapmag_366, mag_best, emag_best, ch1bf, c1ebap, c1_3pxapc, c1_3pxerr, ch2bf, c2ebap, c2_3pxapc, c2_3pxerr
;nzobj = 916548
;nzobj = 321956

;rar = dblarr(nzobj)
;decr = dblarr(nzobj)
;apmag_176 = dblarr(nzobj)
;eapmag_176 = dblarr(nzobj)
;apmag_366 = dblarr(nzobj)
;eapmag_366 = dblarr(nzobj)
;ch1bf = dblarr(nzobj)
;c1ebap = dblarr(nzobj)
;c1_3pxapc = dblarr(nzobj)
;c1_3pxerr = dblarr(nzobj)
;ch2bf = dblarr(nzobj)
;c2ebap = dblarr(nzobj)
;c2_3pxapc = dblarr(nzobj)
;c2_3pxerr = dblarr(nzobj)
;mag_best = dblarr(nzobj)
;emag_best = dblarr(nzobj)

;openr, lun, 'cdfs_adamspipeline_v1.0.0.cat', /get_lun
;readu, lun, rar
;readu, lun, decr
;readu, lun, apmag_176
;readu, lun, eapmag_176
;readu, lun, apmag_366
;readu, lun, eapmag_366
;readu, lun, mag_best
;readu, lun, emag_best
;readu, lun, ch1bf
;readu, lun, c1ebap
;readu, lun, c1_3pxapc
;readu, lun, c1_3pxerr
;readu, lun, ch2bf
;readu, lun, c2ebap
;readu, lun, c2_3pxapc
;;readu, lun, c2_3pxerr
;free_lun, lun
;end







pro read_zirac_finalcat_cdfs, rar, decr, apmag_176, eapmag_176, apmag_366, eapmag_366, mag_best, emag_best, ch1bf, c1ebap, c1_3pxapc, c1_3pxerr, ch2bf, c2ebap, c2_3pxapc, c2_3pxerr
  name = 'cdfs_adamspipeline_v1.0.0.cat'
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
