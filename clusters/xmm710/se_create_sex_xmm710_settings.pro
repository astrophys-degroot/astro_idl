;========================================================================================================================
function se_create_sex_xmm710_settings, xtile, $
                                        VERBOSE=verbose, HELP=help
  
  
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose  = 1 ;sets new value
  
  ;;;Easy to change quantities that should probably be the same for all tiles
  
  detect = 'xmm710_multimap_cumprobmap_sqrt_v1.0.fits'
  uzp = 30.0
  gzp = 30.0
  rzp = 30.0
  izp = 30.0
  zzp = 30.0

  zvzp = 29.479 + 0.528         ;must get AB not vega
  yvzp = 29.382 + 0.634         ;
  jvzp = 29.063 + 0.938         ;
  hvzp = 28.618 + 1.379         ;
  kvzp = 28.161 + 1.900         ; 

  ch1zp = 23.9 - 2.5*alog10(8.461595) ;
  ch2zp = 23.9 - 2.5*alog10(8.461595) ;

  fwhm = 1.0
  minarea = 16.0                ;
  dthresh = 4.0                 ;
  athresh = 4.0                 ;

  filter = 'gauss_4.0_7x7.conv' ;
  ndeblend = 64                 ;
  deblendmin = 0.0000001        ;
  clean = 'N'                   ;
  cleanval = 1.0                ;

  backsize = 64                 ;
  backfiltersize = 3            ;
  backphotothick = 24           ;
  backval = 0.0                 ;
  pixscl = 0.185                ;
  
  CASE xtile OF
     'u' : BEGIN
        image = 'xmm710_cfhtlsu_mosaic_v1.0_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_cfhtlsu.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_cfhtlsu_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $                ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                  ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                  ;
               APERS:[16.2, 19.46], $                                               ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:uzp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                           ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_cfhtlsu.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'g' : BEGIN
        image = 'xmm710_cfhtlsg_mosaic_v1.0_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                         ;
               SEXFILE:'xmm710_cfhtlsg.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_cfhtlsg_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $                ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                                        ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                                        ;
               APERS:[16.2, 19.46], $                                                                     ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:gzp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                           ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_cfhtlsg.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'r' : BEGIN
        image = 'xmm710_cfhtlsr_mosaic_v1.0_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_cfhtlsr.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_cfhtlsr_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $                ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                  ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                  ;
               APERS:[16.2, 19.46], $                                               ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:rzp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                           ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_cfhtlsr.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'i' : BEGIN
        image = 'xmm710_cfhtlsi_mosaic_v1.0_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_cfhtlsi.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_cfhtlsi_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $                ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                  ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                  ;
               APERS:[16.2, 19.46], $                                               ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:izp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                           ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_cfhtlsi.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'z' : BEGIN
        image = 'xmm710_cfhtlsz_mosaic_v1.0_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_cfhtlsz.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_cfhtlsz_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $               ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                  ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                  ;
               APERS:[16.2, 19.46], $                                               ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:zzp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                           ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_cfhtlsz.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'zv' : BEGIN
        image = 'xmm710_videoz_mosaic_v1.0.0001_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_videoz.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_videoz_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $               ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                  ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                  ;
               APERS:[16.2, 19.46], $                                               ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:zvzp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                           ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_videoz.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'y' : BEGIN
        image = 'xmm710_videoy_mosaic_v1.0.0001_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_videoy.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_videoy_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $               ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                  ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                  ;
               APERS:[16.2, 19.46], $                                               ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:yvzp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                           ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_videoy.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'j' : BEGIN
        image = 'xmm710_videoj_mosaic_v1.0.0001_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_videoj.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_videoj_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $               ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                  ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                  ;
               APERS:[16.2, 19.46], $                                               ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:jvzp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                           ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_videoj.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'h' : BEGIN
        image = 'xmm710_videoh_mosaic_v1.0.0001_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_videoh.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_videoh_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $               ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                  ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                  ;
               APERS:[16.2, 19.46], $                                               ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:hvzp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                           ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_videoh.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'k' : BEGIN
        image = 'xmm710_videok_mosaic_v1.0.0001_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_videok.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_videok_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $               ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                                        ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                                        ;
               APERS:[16.2, 19.46], $                                                                     ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:kvzp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                          ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_videok.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'ch1' : BEGIN
        image = 'xmm710_servsch1_mosaic_v1.0_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_servsch1.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_servsch1_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $               ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                                        ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                                        ;
               APERS:[16.2, 19.46], $                                                                     ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:ch1zp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                          ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_servsch1.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END

     'ch2' : BEGIN
        image = 'xmm710_servsch2_mosaic_v1.0_resamp_szmulti.fits'
                                ;se_create_sex_sparcs_lockman_fwhm, xtile, FWHM=fwhm                                               ;retrieve FWHM data
        p1a = {IMAGE:image, DETECT:detect, $                                                              ;
               SEXFILE:'xmm710_servsch2.sex', $                                                            ;create settings structure
               OUTFILE:'xmm710_servsch2_se_v1.0.cat', CTYPE:'ASCII', PARAM:'photo.param', $               ;
               FLAGIM:'NONE', MINAREA:MINAREA, DTHRESH:DTHRESH, ATHRESH:ATHRESH, $                        ;
               FILTER:'N', FNAME:filter, $                                                                ;
               NDEB:ndeblend, DEBMIN:deblendmin, CLEAN:clean, CVAL:cleanval, $                            ;
               MASK:'NONE', $                                                                             ;
               WTYPE1:'NONE', WIMAGE1:'NA.fits', $                                                        ;
               WTYPE2:'NONE', WIMAGE2:'NA.fits', $                                                        ;
               APERS:[16.2, 19.46], $                                                                     ;
               AUTO:[2.5,3.5], FFRAC:[0.2,0.5,0.8], PETRO:[2.0,3.5], $                                    ;
               SATUR:65435, MAGZERO:ch2zp, MAGGAM:4.0, GAIN:1.0, PIXSCL:pixscl, $                          ;
               FWHM:fwhm, STARNNW:'default.nnw', $                                                        ;
               BTYPE1:'AUTO', BPHOTYPE1:'GLOBAL', $                                                       ;
               BTYPE2:'AUTO', BPHOTYPE2:'LOCAL', $                                                        ;
               BACKSZ:backsize, BACKFLSZ:backfiltersize, BACKPHTH:backphotothick, BACKVAL:backval, $      ;
               ITYPE:['NONE'], $                                                                          ;
               INAME:['NA.fits'], $                                                                       ;
               MEMOBJ:2000, MEMPIX:1000000, MEMBUFF:2048, $                                               ;
               SEVERB:'NORMAL', WXML:'Y', XMLFILE:'xmm710_servsch2.xml'}                                   ;
        xsetting = p1a                                                                                    ;
    END


  ENDCASE
   
  RETURN, xsetting
END
;========================================================================================================================

