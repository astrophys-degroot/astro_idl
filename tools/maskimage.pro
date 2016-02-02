;========================================================================================================================
pro maskimage, ximage, xmask, $
               IMDIR=imdir, MAKSDIR=maskdir, OUTFILE=outfile, OUTDIR=OUTDIR, $
               VERBOSE=verbose, HELP=help
  
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;sets new value
  check_dir, 1                                                       ;compile module

  ;;;Check directories, read in the files
  check_indir, imdir, ximage, NOTE='IMDIR'     ;check indir
  check_indir, maskdir, xmask, NOTE= 'MASKDIR' ;check indir
  check_outdir, outdir, outchk                 ;check outdir
  if verbose ge 1 then print, ''               ;spacer
  
  
  image = mrdfits(ximage, 0, header) ;reads in image
  mask = mrdfits(xmask, 0, header)   ;reads in mask
  image = image * mask               ;mask image
  
  CASE keyword_set(OUTFILE) OF                                                     ;check outfile keyword
     0 : BEGIN                                                                     ;if OUTFILE not set
        tempname = ximage                                                          ;sets new value
        strtest = strpos(tempname, '.fits')                                        ;checks if string exists
        if strtest NE -1 then strreplace, tempname, '.fits', '_masked.fits' else $ ;renames tempname
           strreplace, tempname, '.fits', '_FLAG.fits'                             ;renames tempname
        if outchk EQ 1 THEN outfile = strcompress(outdir+tempname)                 ;append outdir
     END                                                                           ;end if outfile not set
     1: BEGIN                                                                      ;if outfile set
        outfile = outfile[0]                                                       ;set outfile name
        if outchk EQ 1 THEN outfile = strcompress(outdir+outfile)                  ;append outdir
     END                                                                           ;end if outfile not set
     ELSE : print, 'WARNING!!! Something went terribly wrong!!'                    ;print info
  ENDCASE                                                                          ;end check outfile keyword
  mwrfits, image, outfile, header, /CREATE                                         ;write file
  



end
;========================================================================================================================



;========================================================================================================================
pro call_maskimage

  image =  'multimap_cumprobmap_sqrt_v2.0.fits'
  imdir = '/Users/degroota/research/originaldatawork/clusters/lockman/lok200/sextractor_v4.0/'
  mask = 'lok200_multimap_cumprobmap_sqrt_v2.0_MASK.fits'
  maskdir = '/Users/degroota/research/originaldatawork/clusters/lockman/lok200/additionalimages/'
  outfile = 'multimap_cumprobmap_sqrt_v2.1.fits'
  outdir = '/Users/degroota/research/originaldatawork/clusters/lockman/lok200/sextractor_v4.0/'
  
  maskimage, image, mask, IMDIR=imdir, MAKSDIR=maskdir, OUTFILE=outfile, OUTDIR=OUTDIR
  


end
;========================================================================================================================
