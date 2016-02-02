;===================================================================================================
FUNCTION bayesian_radec_match, ra1, dec1, era1, edec1, $
                               ra2, dec2, era2, edec2, $
                               RAWIN=rawin, DECWIN=decwin, DRA=dra, DDEC=ddec, $
                               GRAPH=graph, WRITEP=writep, VERBOSE=verbose
  
  
  if N_PARAMS() lt 8 then begin                                                                                      ;check # paramters passed
     print, 'Call sequence: result = (bayesian_radec_match, ra1, dec1, era1, edec1, [RAWIN=, /GRAPH, /WRITEP ... ])' ;print message
     stop                                                                                                            ;stop program
  endif                                                                                                              ;end check # parameters passed
  
  if keyword_set(RAWIN) then rawin = rawin[0] else rawin = 10.0      ;sets new value [arcsec]
  if keyword_set(DECWIN) then decwin = decwin[0] else decwin = 10.0  ;sets new value [arcsec]
  if keyword_set(DRA) then dra = dra[0] else dra = 0.1               ;sets new value [arcsec]
  if keyword_set(DDEC) then ddec = ddec[0] else ddec = 0.1           ;sets new value [arcsec]
  if keyword_set(GRAPH) then graph = 'Y' else graph = 'N'            ;sets new value
  if keyword_set(WRITEP) then writep = 'Y' else writep = 'N'         ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 1 ;sets new value
  
  
  ;;;Sanity checks
  if keyword_set(HELP) then help, ra1, dec1, era1, edec1, ra2, dec2, era2, edec2 ;print help
  nra1 = n_elements(ra1)                                                         ;find # elements
  ndec1 = n_elements(dec1)                                                       ;find # elements
  nera1 = n_elements(era1)                                                       ;find # elements
  nedec1 = n_elements(edec1)                                                     ;find # elements
  nra2 = n_elements(ra2)                                                         ;find # elements
  ndec2 = n_elements(dec2)                                                       ;find # elements
  nera2 = n_elements(era2)                                                       ;find # elements
  nedec2 = n_elements(edec2)                                                     ;find # elements
  
  
  ;;;Start the probability calculation
  tmpra = double((ulindgen(rawin/dra)*dra - 0.5*rawin)*(1.0/3600.0))      ;test ra points
  tmpdec = double((ulindgen(decwin/ddec)*ddec - 0.5*decwin)*(1.0/3600.0)) ;test ra points
  
  outstruct = {masind:1, slvind:1, pabs:0.0, prel:0.0} ;out struct
  outarray = replicate(outstruct, n_elements(ra1))     ;replicated structure
  for aa=0UL, n_elements(ra1)-1, 1 do begin            ;loop over master list
     if verbose GE 3 then print, ra1[aa], dec1[aa]     ;print info
     ras = tmpra + ra1[aa]                             ;finds RA search window for detection
     decs = tmpdec + dec1[aa]                          ;finds Dec search window for detection
     
     close = where(abs(ra2-ra1[aa]) LT (rawin/3600.0) AND $       ;cont next line
                   abs(dec2-dec1[aa]) LT (decwin/3600.0), nclose) ;finds close subset
     
     if graph EQ 'Y' THEN BEGIN                                                        ;check graph
        window, 0, XPOS=100, YPOS=450, XSIZE=450, YSIZE=450                            ;sets window
        ploterror, [ra1[aa]], [dec1[aa]], [era1[aa]], [edec1[aa]], PSYM=2, $           ;plot
                   COLOR='000000'XL, $                                                 ;plot options
                   ERRCOLOR='000000'XL, $                                              ;plot options
                   BACKGROUND='FFFFFF'XL, $                                            ;plot options
                   XTITLE = 'RA [deg]', $                                              ;plot options
                   YTITLE = 'DEC [deg]', $                                             ;plot options
                   TITLE = 'RA, DEC Plot', $                                           ;plot options
                   XRANGE = [min(ra2[close])-0.00139, max(ra2[close])+0.00139], $      ;plot options
                   YRANGE = [min(dec2[close])-0.00139, max(dec2[close])+0.00139], $    ;plot options
                   XTHICK = 2.0, $                                                     ;plot options
                   YTHICK = 2.0, $                                                     ;plot options
                   CHARSIZE = 1.5, $                                                   ;plot options
                   CHARTHICK = 1.5, $                                                  ;plot options
                   SYMSIZE = 1.5, $                                                    ;plot options
                   THICK = 1.5                                                         ;plot options
        oploterror, ra2[close], dec2[close], era2[close], edec2[close], PSYM=4, $      ;overplot close points
                    COLOR='000000'XL, $                                                ;oplot options
                    ERRCOLOR='000000'XL, $                                             ;plot options
                    SYMSIZE = 1.5                                                      ;plot options
        legend, [strcompress('point of interest'), strcompress('possible matches')], $ ;adds legend
                PSYM=[2,4], TEXTCOLORS='000000'XL, $                                   ;legend options           
                CHARSIZE = 1.3, $                                                      ;legend options
                CHARTHICK = 1.5, $                                                     ;legend options
                BOX=0                                                                  ;legend options
     ENDIF                                                                             ;end check graph
     IF writep EQ 'Y' THEN BEGIN                                                       ;check writep
        set_plot, 'ps'                                                                 ;sets to post script
        device, FILENAME='nearbypoints.ps', /COLOR                                     ;sets device
        ploterror, [ra1[aa]], [dec1[aa]], [era1[aa]], [edec1[aa]], PSYM=2, $           ;plot
                   COLOR='000000'XL, $                                                 ;plot options
                   ERRCOLOR='000000'XL, $                                              ;plot options
                   BACKGROUND='FFFFFF'XL, $                                            ;plot options
                   XTITLE = 'RA [deg]', $                                              ;plot options
                   YTITLE = 'DEC [deg]', $                                             ;plot options
                   TITLE = 'RA, DEC Plot', $                                           ;plot options
                   XRANGE = [min(ra2[close])-0.00139, max(ra2[close])+0.00139], $      ;plot options
                   YRANGE = [min(dec2[close])-0.00139, max(dec2[close])+0.00139], $    ;plot options
                   XTHICK = 4.0, $                                                     ;plot options
                   YTHICK = 4.0, $                                                     ;plot options
                   CHARSIZE = 1.5, $                                                   ;plot options
                   CHARTHICK = 4.0, $                                                  ;plot options
                   SYMSIZE = 1.5, $                                                    ;plot options
                   THICK = 3.0                                                         ;plot options
        oploterror, ra2[close], dec2[close], era2[close], edec2[close], PSYM=4, $      ;overplot close points
                    COLOR='000000'XL, $                                                ;oplot options
                    ERRCOLOR='000000'XL, $                                             ;plot options
                    SYMSIZE = 1.5, $                                                   ;plot options
                    THICK = 3.0                                                        ;plot options
        legend, [strcompress('point of interest'), strcompress('possible matches')], $ ;adds legend
                PSYM = [2,4], TEXTCOLORS='000000'XL, $                                 ;legend options
                CHARSIZE = 1.3, $                                                      ;legend options
                CHARTHICK = 4.0, $                                                     ;legend options
                BOX=0                                                                  ;legend options
        device, /CLOSE                                                                 ;closes device
        set_plot, 'x'                                                                  ;undoes ps
     ENDIF                                                                             ;end check graph
     
     norm1 = alog(1.0 / (2.0*!pi*era1[aa]*edec1[aa]))       ;norm constant 2d gaussian
     x1 = -1.0*((ra2[close]-ra1[aa])^2/(2.0*era1[aa]^2))    ;x part 2d gaussian
     y1 = -1.0*((dec2[close]-dec1[aa])^2/(2.0*edec1[aa]^2)) ;y part 2d gaussian
     
     norm2 = alog(1.0 / (2.0*!pi*era2[close]*edec2[close]))       ;norm constant 2d gaussian
     x2 = -1.0*((ra2[close]-ra1[aa])^2/(2.0*era2[close]^2))    ;x part 2d gaussian
     y2 = -1.0*((dec2[close]-dec1[aa])^2/(2.0*edec2[close]^2)) ;y part 2d gaussian

     likeli = x1 + y1 + norm1 + x2 + y2 + norm2 ;find likelihood
     likeli = exp(likeli)                       ;out of log space
     totlikeli = total(likeli)                  ;find total of likelihood
     maxval = max(likeli, maxind)               ;find most probable match
     outarray[aa].masind = aa                   ;set master ind
     outarray[aa].slvind = close[maxind]        ;set slave ind
     outarray[aa].pabs = maxval                 ;set abolute probability value
     outarray[aa].prel = maxval / totlikeli     ;set relative probability value
     
     IF verbose GE 2 then print, ' ' ;spacer
  endfor                             ;end loop over master list
  
  return, outarray
end
;===================================================================================================
  


;===================================================================================================
pro call_bayesian_radec_match

  master = mrdfits('iracch1_small.fits', 1)
  ;help, master, /STRUC
  slave = mrdfits('zband_small.fits', 1)
  ;help, slave, /STRUC

  
  matches = bayesian_radec_match(master.alpha_j2000, master.delta_j2000, (master.x2_world)^0.5, (master.y2_world)^0.5, $   ;cont next line
                                 slave.alpha_j2000, slave.delta_j2000, (slave.x2_world)^0.5, (slave.y2_world)^0.5, /GRAPH) ;
  print, matches


end
;===================================================================================================
