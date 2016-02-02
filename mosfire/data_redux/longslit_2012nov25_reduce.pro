;========================================================================================================================
PRO longslit_2012nov25_reduce



  print, 'Hello World!!'
  ;data = mrdfits('LONGSLIT-15x0.7_BD_17_4708_H_A-B_0060-0061.fits', 0, hdr)
  data = mrdfits('LONGSLIT-15x0.7_BD_17_4708_H_A-B_0060-0061.ms.fits', 0, hdr)

  data3 = mrdfits('lambda_solution_wave_stack_H_m121125_0060-0061.fits', 0, hdr)
  print, data3[0,985]


  data2 = mrdfits('/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/CDFS44_mask1_1.0_H_cl6_eps.fits', 0, hdr2)
  ;print, hdr2
                                ;fxaddpar, hdr, 'WAT0_001', 'system=world'
  fxaddpar, hdr, 'WAT0_001', 'system=equispec'
  fxaddpar, hdr, 'WAT1_001', 'wtype=linear label=wavelength units=angstrom'
                                ;fxaddpar, hdr, 'WAT2_001', 'wtype=linear'
  fxaddpar, hdr, 'DISPAXIS', 1
                                ;fxaddpar, hdr, 'DCLOG1', 'Transform'
                                ;fxaddpar, hdr, 'DC-FLAG', 0
  fxaddpar, hdr, 'CTYPE1', 'LINEAR'
  fxaddpar, hdr, 'CTYPE2', 'LINEAR'
                                ;fxaddpar, hdr, 'CUNIT1', 'Angstrom'
  fxaddpar, hdr, 'CRVAL1', 14640.1
  fxaddpar, hdr, 'CRVAL2', -30.53518669645555
                                ;fxaddpar, hdr, 'CRPIX1', 1
                                ;fxaddpar, hdr, 'CRPIX2', 1
  fxaddpar, hdr, 'CDELT1', 1.628959276018577
  fxaddpar, hdr, 'CDELT2', 1
  fxaddpar, hdr, 'CNAME1', 'angstrom'
  fxaddpar, hdr, 'CNAME2', 'pixel'
  fxaddpar, hdr, 'CD1_1', 1.628959276018577
  fxaddpar, hdr, 'CD1_2', 0
  fxaddpar, hdr, 'CD2_1', 0
  fxaddpar, hdr, 'CD2_2', 1
  fxaddpar, hdr, 'CRPIX1', 1


  writefits, 'LONGSLIT-15x0.7_BD_17_4708_H_A-B_0060-0061.ms_v2.fits',  data, hdr;, /CREATE
 


END
;========================================================================================================================



