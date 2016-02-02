;========================================================================================================================
pro add_phot_errors_servs, image, segmap, APER=aper, SKIPAP=skipap, NAPS=naps, $
                      MARGIN=margin, BUFFER=buffer, FLUXCON=fluxcon, DIRECT=direct 
  

 
;+
; NAME:
;       ADD_PHOT_ERRORS_SERVS()
;
; PURPOSE:       
;
; CALLING SEQUENCE:
;
; INPUTS:
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;
; COMMON BLOCKS:
;
; PROCEDURES USED:
;
; COMMENTS:
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2013 July 15, Univ. Cali, Riverside v1.1.0
;          -included mean value in header file
;       A. DeGroot, 2013 July 7, Univ. Cali, Riverside v1.0.0
;-


  filein = 'servs_en1_iracch2_photometry_v3.0.fits'
  fileout = 'servs_en1_iracch2_photometry_v3.1.fits'
  file = mrdfits(filein, 1, hdr)
  filetags = tag_names(file)
  nftags = n_elements(filetags)
  
  image = 'servs.en1.irac.b2.v02.030111.mosaic.fits'
  segmap = 'servs_en1_iracch2_segmentation_v3.0.fits'
  naps = 1000
  margin = 0.10
  buffer = 10
  fluxcon = 8.461595
  apers = [2.4, 3.0, 3.6, 4.0, 6.0, 9.24, 14.4, 24.4] / 2.0 ;SE takes diameters, call_phot_errors takes radii


  xfile = file
  for xx=0, n_elements(apers)-1, 1 do begin
     phot_errors, image, segmap, apers[xx], NAPS=naps, MARGIN=margin, BUFFER=buffer, FLUXCON=fluxcon, PARAMS=xparams
     print, xparams
     
     name0 = strcompress('bmean'+string(xx+1), /REMOVE_ALL)
     fxaddpar, hdr, name0, xparams[1], 'mean background value in aper', $
               BEFORE='TTYPE1'
     name1 = strcompress('bstdev'+string(xx+1), /REMOVE_ALL)
     fxaddpar, hdr, name1, xparams[2], '1sigma error in background values in aper', $
               AFTER=name0
     name2 = strcompress('baverr'+string(xx+1), /REMOVE_ALL)
     fxaddpar, hdr, name2, xparams[3], 'error in mean background value in aper', $
               AFTER=name1


     ;newtag = strcompress('xfluxerr_aper'+string(xx+1), /REMOVE_ALL)
     ;add_tags, xfile, newtag, '0d', file     
     ;chk = tag_exist(file, newtag, IND=indchk)
     ;file[*].(indchk) = xparams[2]
     ;name1 = strcompress('TTYPE'+string(nftags+xx+1), /REMOVE_ALL)
     ;name2 = strcompress('TTYPE'+string(nftags+xx), /REMOVE_ALL)
     ;fxaddpar, hdr, name1, newtag, 'directly measured error for aperture', $
     ;          AFTER=name2
     ;name1 = strcompress('TFORM'+string(nftags+xx+1), /REMOVE_ALL)
     ;name2 = strcompress('TFORM'+string(nftags+xx), /REMOVE_ALL)
     ;fxaddpar, hdr, name1, 'D', AFTER=name2
     ;xfile = file
  endfor
  
  print, hdr
  mwrfits, file, fileout, hdr, /CREATE


end
;========================================================================================================================
