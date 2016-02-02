;========================================================================================================================
pro se_create_sex_xmm710, tile, VERBOSE=verbose, HELP=help
  
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1 ;sets new value
  if keyword_set(HELP) then help = 'Y' else help = 'N'               ;sets new value
  
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
  
                                ;spawn, 'mv ../fromiraf/*.log .'             ;move appropriate files
                                ;spawn, 'mv ../images/servs.lockman*.fits .' ;move appropriate files
  
  FOR xx=0, n_elements(xtile)-1, 1 DO BEGIN
     settings = se_create_sex_xmm710_settings(xtile[xx])
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, $
                    WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, FFRAC=settings.ffrac, PETRO=settings.petro, $
                    SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BPHOTYPE1=settings.bphotype1, $
                    BTYPE2=settings.btype2, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDFOR
  
                                ;spawn, 'mv *.log ../fromiraf/'             ;move appropriate files
                                ;spawn, 'mv servs.lockman*.fits ../images/' ;move appropriate files
  
  
  if tile EQ 'make check' THEN BEGIN
     print, 'YES!!!'
     check = se_create_sex_servs_lok200_settings(tile)
  ENDIF
  
END
;========================================================================================================================
