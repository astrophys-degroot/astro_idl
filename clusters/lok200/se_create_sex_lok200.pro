;========================================================================================================================
pro se_create_sex_lok200, band, HELP=help
  
  if keyword_set(HELP) then help = 'Y' else help = 'N' ;sets new value
  

  IF (band EQ 'swireg') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('swireg')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF

  IF (band EQ 'swirer') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('swirer')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF

  IF (band EQ 'swirei') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('swirei')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF

  IF (band EQ 'sparcsz') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('sparcsz')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF

  IF (band EQ 'ukidssJ') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('ukidssJ')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF

  IF (band EQ 'ukidssK') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('ukidssK')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF

  IF (band EQ 'servsch1') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('servsch1')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF

  IF (band EQ 'servsch2') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('servsch2')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF

  IF (band EQ 'swirech3') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('swirech3')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF

  IF (band EQ 'swirech4') OR (band EQ 'all') THEN BEGIN
     settings = se_create_sex_lok200_settings('swirech4')
     if help EQ 'Y' THEN help, settings, /STRUC
     se_create_sex, settings.image, SEXFILE=settings.sexfile, $
                    OUTFILE=settings.outfile, CTYPE=settings.ctype, PARAM=settings.param, $
                    FLAGim=settings.flagim, MINAREA=settings.minarea, DTHRESH=settings.dthresh, ATHRESH=settings.athresh, $
                    FILTER=settings.filter, FNAME=settings.fname, NDEB=settings.ndeb, DEBMIN=settings.debmin, $
                    CLEAN=settings.clean, CVAL=settings.cval, MASK=settings.mask, $
                    WTYPE1=settings.wtype1, WIMAGE1=settings.wimage1, WTYPE2=settings.wtype2, WIMAGE2=settings.wimage2, $
                    APERS=settings.apers, AUTO=settings.auto, PETRO=settings.petro, SATUR=settings.satur, MAGZERO=settings.magzero, $
                    MAGGAM=settings.maggam, GAIN=settings.gain, PIXSCL=settings.pixscl, $
                    FWHM=settings.fwhm, STARNNW=settings.starnnw, $
                    BTYPE1=settings.btype1, BTYPE2=settings.btype2, BPHOTYPE1=settings.bphotype1, BPHOTYPE2=settings.bphotype2, $
                    BACKSZ=settings.backsz, $
                    BACKFLSZ=settings.backflsz, BACKPHTH=settings.backphth, BACKVAL=settings.backval, $
                    ITYPE=settings.itype, INAME=settings.iname, $
                    MEMOBJ=settings.memobj, MEMPIX=settings.mempix, MEMBUFF=settings.membuff, $
                    SEVERB=settings.severb, WXML=settings.wxml, XMLFILE=settings.xmlfile
  ENDIF


  if band EQ '1' THEN BEGIN
     print, 'YES!!!'
     check = se_create_sex_lok200_settings(band)
  ENDIF



end
;========================================================================================================================
