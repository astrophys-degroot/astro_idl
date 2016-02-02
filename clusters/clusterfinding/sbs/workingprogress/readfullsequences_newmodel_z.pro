pro readfullsequences_newmodel_z, z, intercept, slope, xstar, ystar
  
;This program reads the final set of sequences once linear
;interpolation has been done such that they all overlap
  
  nseq = numlines('newmodel_zprimemI1vsI1seqszf40_full.dat') - 2
  print, 'Number of Sequence Models: ', nseq
  openr, lun2, 'newmodel_zprimemI1vsI1seqszf40_full.dat', /get_lun
  header = strarr(2)
  readf, lun2, header
  dats = dblarr(5, nseq)
  readf, lun2, dats
  free_lun, lun2
  
  z = dats[0,*]
  intercept = dats[1,*]
  slope = dats[2,*]
  xstar = dats[3,*]
  ystar = dats[4,*]
  
end
