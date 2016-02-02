;========================================================================================================================
function sortclustercat_ch1ch2, cllist, zrange, CLRAD=clrad, ZBUFFER=zbuffer, FLUXCUT=fluxcut, OUTFILE=outfile, $
                                INDIR=indir, OUTDIR=outdir, $
                                VERBOSE=verbose, HELP=help, WRITEF=writef, WRITEP=writep
  



;+
; NAME:
;       SORTCLUSTERCAT_CH1CH2()
;
; PURPOSE:
;       This program takes a selection of independent color slice
;       catalogs, compiles them into a single catalog of found
;       clusters and then removes
;       duplicates.  The default is to remove clusters that are within 3 pixels
;       of the relative maps.  --This is done by calculating the angular size
;       of pixels at the redshift of the cluster
;       
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
;       A. DeGroot, 2012 Aug 10, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 Aug 10, v1.0.0
;-


  if keyword_set(CLRAD) then clrad = clrad[0] else clrad = 5.0         ;sets new value [Mpc]
  if keyword_set(ZBUFFER) then zbuffer = zbuffer[0] else zbuffer = 0.3 ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2   ;sets new value

  

  ;;;This section compiles a complete list of clusters over all slices
  if keyword_set(INDIR) then check_indir, indir, cllist, VERBOSE=verbose            ;check indir
  clslices = strarr(n_elements(cllist))                                             ;make array
  readcol, cllist, clslices, FORMAT='A'                                             ;read in file
  if keyword_set(HELP) then help, clslices                                          ;print info
  for aa=0, n_elements(clslices)-1, 1 do begin                                      ;loop over each color slice
     if keyword_set(INDIR) then begin                                               ;check INDIR keyword
        listin = strcompress(indir+clslices[aa], /REMOVE_ALL)                       ;append indir
     endif else listin = clslices[aa]                                               ;alt to INDIR keyword
     oneslice = mrdfits(listin, 1)                                                  ;read in one file
     if aa eq 0 then clcomp = oneslice else $                                       ;cont next line
        clcomp = [clcomp,oneslice]                                                  ;concatenate lists
  endfor                                                                            ;end loop color slice
  if keyword_set(HELP) then help, clcomp, /STRUC                                    ;print info
  outcomp = 'ccat_slicecompiled.fits'                                               ;set name
  if keyword_set(OUTDIR) then outcomp = strcompress(outdir[0]+outcomp, /REMOVE_ALL) ;append outdir
  mwrfits, clcomp, outcomp, /CREATE                                                 ;write compiled list to file
  
 

  ;;;Prep the logfile
  openw, lun, 'catmerge.log', /GET_LUN                                                     ;open file for writing
  clrem = 'true'                                                                           ;initialize
  debug = 0                                                                                ;initialize
  angsz = length(clrad, 'mpc', OUTUNITS='arcsec', SECONDARY=clcomp.z, SECUNITS='redshift') ;calc angular size of pixel at redshift of slice
  
  clcheck = intarr(n_elements(clcomp.clra_deg)) ;array if cluster has been checked
  clkeep = intarr(n_elements(clcomp.clra_deg))  ;array if cluster is to be kept
  clkeep[*] = 1                                 ;sets all values to on
                                
  while clrem eq 'true' do begin                                                       ;while still clusters to check
     clzero = where(clcheck EQ 0, nclzero)                                             ;where remaining clusters 
     if nclzero ne 0 then begin                                                        ;if cluster to check
        mincl = min(clzero, indmin)                                                    ;lowest index left that is zero
        gcirc, 2, clcomp[clzero[indmin]].clra_deg, clcomp[clzero[indmin]].cldec_deg, $ ;cont next line
               clcomp.clra_deg, clcomp.cldec_deg, dists                                ;ang dist of detection from cluster  
        
        cands = where(dists lt angsz[clzero[indmin]], ncands)                                              ;find clusters close in ang dist
        print, ncands
        if verbose ge 3 then print, '   # of cluster close in ang dist: ', ncands                          ;print info
        case ncands of                                                                                     ;case of cands
           0 : print, ' Something went horribly wrong!!'                                                   ;cands is 0
           1 : begin                                                                                       ;if cands is 1
              if verbose ge 3 then print, '  Only one match: itself!! Keeping to list!!'                   ;print info
              clcheck[cands] = 1                                                                           ;sets cluster to checked
           end                                                                                             ;end if cands is 1 
           else : begin                                                                                    ;if cands anything else
              cands2 = where(abs(clcomp[cands].z-clcomp[clzero[indmin]].z) lt zbuffer, ncands2)            ;if clusters close in z space
              case ncands2 of                                                                              ;case of cands2
                 0 :  print, ' Something went horribly wrong!!'                                            ;cands is 0
                 1 :  begin                                                                                ;if cands is 1
                    if verbose ge 3 then print, '  Now only one match: itself!! Keeping to list!!'         ;print info
                    clcheck[cands[cands2]] = 1                                                             ;sets cluster to checked
                 end                                                                                       ;end if cands2 is 1
                 else : begin                                                                              ;if cands2 else
                    if verbose ge 3 then print, '   # of cluster close in ang dist and z space: ', ncands2 ;print info
                    clcheck[cands[cands2]] = 1                                                             ;sets clusters to checked
                    maxcl = max(clcomp[cands[cands2]].flux_aper1)                                          ;finds max flux
                    keeper = where(clcomp[cands[cands2]].flux_aper1 EQ maxcl, $                            ;cont next line
                                   nkeep, COMPLEMENT=cut, NCOMPLEMENT=ncut)                                ;finds the keeper based on flux
                    if nkeep NE 1 then print, '  Something went horribly wrong!!'                          ;print info
                    if ncut ne 0 then clkeep[cands[cands2[cut[0]]]] = 0                                    ;culls nonchosen
                 end                                                                                       ;end else cands2                  
              endcase                                                                                      ;end case cands2
           end                                                                                             ;end cands anything else
        endcase                                                                                            ;end check cands
     endif else clrem = 'false'                                                                            ;if cluster to check
  endwhile                                                                                                 ;end loop over clusters

  ;;;Sanity checks
  blah1 = where(clcheck eq 0, nblah1)                                          ;checks that no cluster left
  if verbose ge 1 then print, ' Number of clusters left to be checked', nblah1 ;print info
  blah2 = where(clkeep eq 1, nblah2)                                           ;check number clusters kept
  if verbose ge 1 then print, ' Number of cluster left after cleaning', nblah2 ;print info
  clcomp = clcomp[blah2]                                                       ;remove bad clusters
  

  ;;;Optional cut on cluster flux
  if keyword_set(FLUXCUT) then begin                                                  ;check FLUXCUT keyword
     keep = where(clcomp.flux_auto GT fluxcut[0], nkeep)                              ;finds good clusters
     if nkeep ne 0 then clcomp =  clcomp[keep]                                        ;culls list
     if verbose ge 2 then print, '  # of clusters remaining after flux cut:  ', nkeep ;print info
  endif                                                                               ;end check FLUXCUT keyword
  

  ;;;Write out file
  if keyword_set(outfile) then outfile = outfile[0] else outfile = 'ccat_sbs_v1.0.0.fits' ;outfile name
  if keyword_set(OUTDIR) then outfile = strcompress(outdir[0]+outfile, /REMOVE_ALL)       ;append outdir
  mwrfits, clcomp, outfile, /CREATE                                                       ;write file
  free_lun, lun                                                                           ;close logfile

end
;========================================================================================================================




;========================================================================================================================
pro call_sortclustercat_ch1ch2

  indir = '~/Desktop/sbs/lockman/I1I2clustercats/'
  clusterlist = 'ccat_slicelist.txt'
  outfile = 'sbscat_lockman_v3.0.0.fits'
  
  zrange = [0.8, 2.5]
  outdir = '~/Desktop/sbs/lockman/I1I2clustercats/'
  


  result = sortclustercat_ch1ch2(clusterlist, zrange, FLUXCUT=0.0, INDIR=indir, OUTDIR=outdir, OUTFILE=outfile, VERBOSE=2, /HELP)
  



end
;========================================================================================================================
