;========================================================================================================================
pro mosfire_make_magmacat_xmm113

  ;;***********************************************;;
  verbose = 2                   ;how much do you want to know
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  datain = '/Users/adegroot/research/observing/keck/mosfire/20140815/xmm113/catalogs/newpzmembers.fits'
  ;starsin = '/Users/degroota/research/current7_mosfire_2013nov28_xmm113/catalogs/xmm113_2mass_pointsources_v3-0.fits'
  magmaout = 'xmm113_feedtomagma_formask3_v12-0.txt'
  
  epoch = 2000.0                ;no need to change
  equinox = 2000.0              ;no need to change
  thing1 = 0                    ;no need to change
  thing2 = 0                    ;no need to change
  jnom = 21.0                   ;if no jmag available

  starmin = 12.0                ;min mag for star list
  starmax = 16.0                ;max mag for star list

  sbsred = 0.1                  ;ch1-ch2 must be great than
  sbsblue = -0.1                ;;ch1-ch2 must be great than but less than sbsred

  sbsbright = 19.5              ;ch2mag must be less than
  sbsmedium = 22.0              ;ch2 mag must be less than but greater than sbsbright
  sbsfaint = 23.0               ;ch2 mag must be less than but greater than sbsmedium
  

  p_st = -1                     ;star fiducial probability
  p_clmem = 2000                  ;prob(cluster members)
  p_bsbsr = 4000                ;prob(bsbsr)
  p_msbsr = 500                 ;prob(msbsr)
  p_fsbsr = 50                  ;prob(fsbsr)
  p_bsbsb = 5000                ;prob(bsbsb)
  p_msbsb = 700                 ;prob(msbsb)
  p_fsbsb = 40                  ;prob(fsbsb)
  p_sbsbc = 30                  ;prob(sbsbc)
  p_rest = 5                    ;prob(everything else)

  
  ;;***********************************************;;
  
  
  
  ;;;read in the files
  data = mrdfits(datain, 1, datahdr)
  IF keyword_set(HELP) THEN help, data, /STRUC
  ;clmem = mrdfits(clmemin, 1, datahdr)
  ;IF keyword_set(HELP) THEN help, clmem, /STRUC
  ;stars = mrdfits(starsin, 1, starhdr)
  ;IF keyword_set(HELP) THEN help, stars, /STRUC
  
  
  ;;;Making the file
  radec, data.ra, data.dec, irah, iram, iras, idech, idecm, idecs
  openw, lun, magmaout, /GET_LUN
  struct = {id:'cl1', priority:500, jmag:20.0, ra:20.0, dec:35.0, epoch:2000.0, equinox:2000.0, thing1:0, thing2:0}
  stru = replicate(struct, (n_elements(data.(1))))
  picked = intarr(n_elements(data.(1)))
  cnt = 0
  
  ;;;Zeroth cut
  zerothind = indgen(n_elements(data.ra))
  radec, data.ra, data.dec, xirah, xiram, xiras, xidech, xidecm, xidecs
  help, xiras
  openw, lun, magmaout, /GET_LUN
  for xx=0, n_elements(data.ra)-1, 1 do begin 
     prstr = strcompress(strcompress('pzadd'+string(zerothind[xx]), /REMOVE_ALL)+' '+string(p_clmem)+' '+string(jnom)+' '+ $
                         string(xirah[xx])+' '+string(xiram[xx])+' '+string(xiras[xx])+' '+ $
                         string(xidech[xx])+' '+string(xidecm[xx])+' '+string(xidecs[xx])+' '+ $
                         string(epoch)+' '+string(equinox)+' '+string(thing1)+' '+string(thing2))
     printf, lun, prstr, FORMAT='(a)'
     stru[cnt].priority = p_clmem
     stru[cnt].id = strcompress('clmem'+string(zerothind[xx]), /REMOVE_ALL)
     stru[cnt].jmag = jnom
     stru[cnt].ra = data[xx].ra
     stru[cnt].dec = data[xx].dec
     cnt = cnt+1
  endfor
  close, lun
  free_lun, lun  

   ;;;and a .fits format copy
  strreplace, magmaout, '.txt', '.fits'  
  cleanse = where(stru.id NE 'cl1', ncleanse)
  stru = stru[cleanse]
  mwrfits, stru, magmaout, /CREATE

end
;========================================================================================================================



;========================================================================================================================
pro xmm113_remakecomp, VERBOSE=verbose, HELP=help


  mascat = 'xmm113_feedtomagma_formask3_v12-.txt' 
  directory = ' '
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro xmm113_nextmask, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'xmm113_feedtomagma_formask3_v12-1.txt'       ;master input list
  recmask = '../xmm113_mask4_v1/XMM113_mask4.coords'    ;just made mask
  compcat = 'xmm113_feedtomagma_formask3_v12-1.fits'     ;companion list
  outfile = 'xmm113_feedtomagma_formask5_v12-1.txt'      ;next input file
  outcompnext = 'xmm113_feedtomagma_formask5_v12-1.fits' ;companion to next input file
  outcompthis = 'xmm113_feedtomagma_inmask4_v12-1.fits'  ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis

END
;========================================================================================================================
