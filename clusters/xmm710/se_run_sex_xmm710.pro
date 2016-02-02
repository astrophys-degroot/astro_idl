;========================================================================================================================
pro se_run_sex_xmm710_wantreg, xout
  
  data = mrdfits(xout, 1, hdr)                   ;read in file
  strreplace, xout, '.fits', '.reg'              ;change suffix
  openw, lun, xout, /GET_LUN                     ;get memory unit
  FOR xx=0UL, n_elements(data.(1))-1, 1 DO BEGIN ;loop over data 
     printf, lun, data[xx].(1), data[xx].(2)     ;print RA, Dec to file
  ENDFOR                                         ;end loop over data                                             
  close, lun                                     ;close memory unit
  free_lun, lun                                  ;free memory unit
  
end
;========================================================================================================================



;========================================================================================================================
pro se_run_sex_xmm710, tile, DETECT=detect, REGION=region, $
                              VERBOSE=verbose, HELP=help
  
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose  = 1 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'                ;sets new value
  se_output_conversion, 1                                             ;compile module
  
  
  CASE tile OF
     'all' : xtile = ['u','g','r','i','z', 'zv', 'y', 'j', 'h', 'k', 'ch1', 'ch2']
     'u' : xtile = ['u']
     'g' : xtile = ['g']
     'r' : xtile = ['r']
     'i' : xtile = ['i']
     'z' : xtile = ['z']
     'zv' : xtile = ['zv']
     'y' : xtile = ['y']
     'j' : xtile = ['j']
     'h' : xtile = ['h']
     'k' : xtile = ['k']
     'ch1' : xtile = ['ch1']
     'ch2' : xtile = ['ch2']
     ELSE : BEGIN
        print, '*****Tile name not recognized!! Please supply another!!'
     END
  ENDCASE
  
                                ;spawn, 'mv ../fromiraf/*.log .'                          ;move appropriate files
                                ;spawn, 'mv ../images/servs*cov.fits .'                   ;move appropriate files
                                ;spawn, 'mv ../multimap/servs.lockman*szmulti.fits .'     ;move appropriate files
                                ;spawn, 'mv ../multimap/multimap_cumprobmap_sqrt*.fits .' ;move appropriate files
                                ;spawn, 'mv ../additionalimages/*FLAG.fits .'             ;move appropriate files
  
  FOR xx=0, n_elements(xtile)-1, 1 DO BEGIN                   ;loop over tile(s)
     settings = se_create_sex_xmm710_settings(xtile[xx])      ;get settings
     IF help EQ 'Y' then help, settings, /STRUC               ;print .sex file values
     im = settings.image                                      ;image 
     detect = settings.detect                                 ;image 
     sexfile = settings.sexfile                               ;image 
     print, 'Now running SE on ' + im                         ;print info
     spawnstr = 'sex ' + detect + ' ' + im + ' -c ' + sexfile ;string to give terminal 
     IF verbose GE 3 THEN print, spawnstr                     ;print info
     spawn, spawnstr                                          ;call SE run
     
     tmpout = settings.outfile                                                       ;creates a temp string
     strreplace, tmpout, '.cat', '.fits'                                             ;change suffix
     asciitofits, settings.param, settings.sexfile, settings.outfile, OUTFILE=tmpout ;convert ascii to .FITS
     
     IF keyword_set(REGION) THEN BEGIN                           ;check reg file desired
        IF verbose GE 1 THEN print, ' Now making region file. '  ;print info 
        se_run_sex_xmm710_wantreg, tmpout                 ;pass file name to make reg file
        regflag = 1                                              ;set reg flag to on
     ENDIF                                                       ;end check reg file desired
     print, ' '                                                  ;space on screen
  ENDFOR                                                         ;end loop over tile(s)
  
                                ;spawn, 'mv *lockman*se*v*.fits ../catalogs/'        ;move appropriate files
                                ;spawn, 'mv *.reg ../regionfiles/'                   ;move appropriate files
                                ;spawn, 'mv *.log ../fromiraf/'                      ;move appropriate files
                                ;spawn, 'mv *FLAG.fits ../additionalimages/'         ;move appropriate files
                                ;spawn, 'mv *background.fits ../additionalimages/'   ;move appropriate files
                                ;spawn, 'mv *segmentation.fits ../additionalimages/' ;move appropriate files
                                ;spawn, 'mv *objects.fits ../additionalimages/'      ;move appropriate files
                                ;spawn, 'mv servs.lockman*szmulti.fits ../multimap/' ;move appropriate files
                                ;spawn, 'mv servs.lockman*szmulti.fits ../multimap/' ;move appropriate files
                                ;spawn, 'mv servs*cov.fits ../images/'               ;move appropriate files


end
;========================================================================================================================
