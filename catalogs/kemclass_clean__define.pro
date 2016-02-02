;+
; NAME:
;       KEMCLASS_CLEAN()
;
; PURPOSE:
;           
;
; CALLING SEQUENCE:
;       
;      
; INPUTS:
;        
;
; OPTIONAL INPUTS:
;       
;
; KEYWORD PARAMETERS:
;        
;
; OUTPUTS:
;       
;
; OPTIONAL OUTPUTS:
;
;
; COMMON BLOCKS:
;       
;
; PROCEDURES USED:
;       
;
; COMMENTS:
;        
;
; EXAMPLES:
;       
;
; MODIFICATION HISTORY:
;
;
; DESIRED UPGRADES
;
;     
;
;-

;====================================================================================================
PRO KEMCLASS_CLEAN::getprop, OBJVER=objver

  IF arg_present(OBJVER) THEN objver = self.kccobjver ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION KEMCLASS_CLEAN::removetags, xtags


  ;;;copy data from pointers
  xdata = *self.xdata                     ;grab structure
  xdatatags = *self.xdatatags             ;grab tag names
  flgtags = intarr(n_elements(xdatatags)) ;flag array
                                ;help, xdatatags
                                ;help, xtags

  ;;;make sure tags exist
  FOR xx=0, n_elements(xtags)-1, 1 DO BEGIN    ;loop over tags to remove
     chk = where(xdatatags EQ xtags[xx], nchk) ;check that tags exists
     
     CASE nchk OF                                            ;how many matches found
        0 : BEGIN                                            ;tag not matched
           print, '  Tag not found; removal is not possible' ;print info
        END                                                  ;end tag not matched

        1 : BEGIN               ;exactly one match
           flgtags[chk] = 1     ;flag object
        END                     ;end one match
        
        ELSE : BEGIN                                                            ;matched more than once
           print, '  How is the tag in the structure more than once?'           ;print info
           print, '   This should not be possible. Check this tag: ', xtags[xx] ;print info
        END                                                                     ;end matched more than once
     ENDCASE                                                                    ;end how many matches found
  ENDFOR                                                                        ;end loop over tags to remove

  ;;;now build new structure with desired tags
  flgkeep = where(flgtags EQ 0, nflgkeep)                                         ;find tags not flagged
  IF flgkeep[0] NE -1 THEN BEGIN                                                  ;some tags to be kept
     retstruc = create_struct(xdatatags[flgkeep[0]], xdata[0].(flgkeep[0]))       ;start the structure
     FOR xx=1, nflgkeep-1, 1 DO BEGIN                                             ;loop over remaining tags to keep
        add_tag, retstruc, xdatatags[flgkeep[xx]], xdata[0].(flgkeep[xx]), newstr ;add to structure
        retstruc = 0                                                              ;reset variable
        retstruc = newstr                                                         ;recapture new structure
        newstr = 0                                                                ;reset variable
     ENDFOR                                                                       ;end loop over remaining tags
  ENDIF ELSE BEGIN                                                                ;end some tags to be kept
     print, '  All tags removed!! Nothing remains of original sturcture'          ;print info
     retstruc = {MESSAGE:'You got rid of everything!!'}                           ;something to return
  ENDELSE                                                                         ;if not tags to be kept


  ;;;now fill built structure with original data
  nxdata = n_elements(xdata)                      ;how many entries to we have
  retstr  = replicate(retstruc, nxdata)           ;copy entry
  FOR xx=0UL, nxdata-1, 1 DO BEGIN                ;loop over data
     FOR yy=0UL, nflgkeep-1, 1 DO BEGIN           ;loop over tags kept
        retstr[xx].(yy) = xdata[xx].(flgkeep[yy]) ;fill in values
     ENDFOR                                       ;end loop over tags kept
  ENDFOR                                          ;end loop over data
  

  RETURN, retstr
END
;====================================================================================================


;====================================================================================================
FUNCTION KEMCLASS_CLEAN::cleanradec, xra, xdec


 ;;;Sanity check
  IF (n_elements(xra) NE n_elements(xdec)) THEN BEGIN           ;if non equal number of elements
     print, '  Non-equal numbers of elements in RA, Dec arrays' ;print info
     stop                                                       ;stop run
  ENDIF                                                         ;end nonequal number of elements


  pdfra = histogram(xra, LOCATIONS=xrabins, BINSIZE=0.01)    ;histogram
  pdfra = pdfra / float(n_elements(xra))                     ;normalize histogram
  xrabins = [xrabins[0]-0.1, xrabins, xrabins[-1]+0.1]       ;pass bins
  pdfra = [0.0,pdfra,0.0]                                    ;pad array
  pdfdec = histogram(xdec, LOCATIONS=xdecbins, BINSIZE=0.01) ;histrogram
  pdfdec = pdfdec / float(n_elements(xdec))                  ;normalize histogdecm
  xdecbins = [xdecbins[0]-0.1, xdecbins, xdecbins[-1]+0.1]   ;pass bins
  pdfdec = [0.0,pdfdec,0.0]                                  ;pad array


  ;;;do the plotting
  mywin = window(LOCATION=[100+50*self.nwin,25*self.nwin]) ;window

  myplot = plot(xra, xdec, 'b+', $                                      ;plot ra, dec
                XTITLE = 'RA [deg]', $                                  ;plot options
                YTITLE = 'DEC [deg]', $                                 ;plot options
                /CURRENT, LAYOUT=[2,2,3], POSITION=[0.15,0.1,0.75,0.7]) ;plot options

  myplot = plot(xrabins, pdfra, COLOR='black', /STAIRSTEP, $              ;plot ra hist
                YTITLE = 'Freq', $                                        ;plot options
                /CURRENT, LAYOUT=[2,2,1], POSITION=[0.15,0.7,0.75,0.9], $ ;plot options
                XSHOWTEXT=0)                                              ;plot options

  myplot1 = plot(xdecbins, pdfdec, COLOR='black', /STAIRSTEP, $            ;plot dec hist
                 /CURRENT, LAYOUT=[2,2,4], POSITION=[0.75,0.1,0.95,0.7], $ ;plot options
                 XSHOWTEXT=0)                                              ;plot options
                                ;myplot1.rotate, -90


  self.nwin = self.nwin + 1     ;up window number
  RETURN, 1
END
;====================================================================================================



;====================================================================================================
FUNCTION KEMCLASS_CLEAN::cleanspecz, xspecz

  
  ;;;find histrogram data
  pdfspecz = histogram(xspecz, LOCATIONS=xspeczbins, BINSIZE=0.05)  ;histogspeczm
  pdfspecz = pdfspecz / float(n_elements(xspecz))                   ;normalize histogspeczm
  xspeczbins = [xspeczbins[0]-0.1, xspeczbins, xspeczbins[-1]+0.1]  ;pass bins
  pdfspecz = [0.0,pdfspecz,0.0]                                     ;pad array


  ;;;do the plotting
  mywin = window(LOCATION=[100+50*self.nwin,25*self.nwin]) ;window
  
  myplot = plot(xspeczbins, pdfspecz, COLOR='black', /STAIRSTEP, $ ;plot specz hist
                XTITLE = 'Spectroscopic Redshift', $               ;plot options
                YTITLE = 'Frequency', $                            ;plot options
                /CURRENT)                                          ;plot options

  self.nwin = self.nwin + 1     ;up window number
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
FUNCTION KEMCLASS_CLEAN::cleanhaflux, xhaflux

  
  ;;;find histrogram data
  pdfhaflux = histogram(xhaflux, LOCATIONS=xhafluxbins, BINSIZE=1.0)   ;histoghafluxm
  pdfhaflux = pdfhaflux / float(n_elements(xhaflux))                   ;normalize histoghafluxm
  xhafluxbins = [xhafluxbins[0]-0.1, xhafluxbins, xhafluxbins[-1]+0.1] ;pass bins
  pdfhaflux = [0.0,pdfhaflux,0.0]                                      ;pad array
  

  ;;;do the plotting
  mywin = window(LOCATION=[100+50*self.nwin,25*self.nwin]) ;window
  
  myplot = plot(xhafluxbins, pdfhaflux, COLOR='black', /STAIRSTEP, $ ;plot haflux hist
                XTITLE = 'H$\alpha$ Flux [uncalibrated]', $          ;plot options
                YTITLE = 'Frequency', $                              ;plot options
                /CURRENT)                                            ;plot options

  self.nwin = self.nwin + 1     ;up window number
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
FUNCTION KEMCLASS_CLEAN::cleanhasnr, xhasnr

  
  ;;;find histrogram data
  pdfhasnr = histogram(xhasnr, LOCATIONS=xhasnrbins, BINSIZE=1.0)   ;histoghasnrm
  pdfhasnr = pdfhasnr / float(n_elements(xhasnr))                   ;normalize histoghasnrm
  xhasnrbins = [xhasnrbins[0]-0.1, xhasnrbins, xhasnrbins[-1]+0.1] ;pass bins
  pdfhasnr = [0.0,pdfhasnr,0.0]                                      ;pad array
  

  ;;;do the plotting
  mywin = window(LOCATION=[100+50*self.nwin,25*self.nwin]) ;window
  
  myplot = plot(xhasnrbins, pdfhasnr, COLOR='black', /STAIRSTEP, $ ;plot hasnr hist
                XTITLE = 'H$\alpha$ SNR', $                        ;plot options
                YTITLE = 'Frequency', $                              ;plot options
                /CURRENT)                                            ;plot options

  self.nwin = self.nwin + 1     ;up window number
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
FUNCTION KEMCLASS_CLEAN::cleanniiflux, xniiflux

  
  ;;;find histrogram data
  pdfniiflux = histogram(xniiflux, LOCATIONS=xniifluxbins, BINSIZE=1.0)      ;histogniifluxm
  pdfniiflux = pdfniiflux / float(n_elements(xniiflux))                      ;normalize histogniifluxm
  xniifluxbins = [xniifluxbins[0]-0.01, xniifluxbins, xniifluxbins[-1]+0.01] ;pass bins
  pdfniiflux = [0.0,pdfniiflux,0.0]                                          ;pad array


  ;;;do the plotting
  mywin = window(LOCATION=[100+50*self.nwin,25*self.nwin]) ;window
  
  myplot = plot(xniifluxbins, pdfniiflux, COLOR='black', /STAIRSTEP, $ ;plot niiflux hist
                XTITLE = '[NII] Flux [uncalibrated]', $                ;plot options
                YTITLE = 'Frequency', $                                ;plot options
                /CURRENT)                                              ;plot options

  self.nwin = self.nwin + 1     ;up window number
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
FUNCTION KEMCLASS_CLEAN::cleanmass, xmass

  
  ;;;find histrogram data
  pdfmass = histogram(xmass, LOCATIONS=xmassbins, BINSIZE=0.1) ;histogmassm
  pdfmass = pdfmass / float(n_elements(xmass))                 ;normalize histogmassm
  xmassbins = [xmassbins[0]-0.1, xmassbins, xmassbins[-1]+0.1] ;pass bins
  pdfmass = [0.0,pdfmass,0.0]                                  ;pad array
  

  ;;;do the plotting
  mywin = window(LOCATION=[100+50*self.nwin,25*self.nwin]) ;window
  
  myplot = plot(xmassbins, pdfmass, COLOR='black', /STAIRSTEP, $ ;plot mass hist
                XTITLE = 'Log Stellar Mass', $                   ;plot options
                YTITLE = 'Frequency', $                          ;plot options
                /CURRENT)                                        ;plot options

  self.nwin = self.nwin + 1     ;up window number
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO KEMCLASS_CLEAN::scatterscatter, xdata


  ;;;ground work
  tags = tag_names(xdata)       ;get tags
  ntags = n_elements(tags)      ;number of tags
  loc = 1                       ;location

  ;;;do the plotting
  mywin = window(LOCATION=[100,0], DIMENSIONS=[85*(ntags+1),85*(ntags+1)]) ;window

  FOR xx=0, ntags-1, 1 DO BEGIN                                                                          ;loop over tags
     FOR yy=0, xx, 1 DO BEGIN                                                                            ;loop over tags again
        pos =  [(0.1+0.1*float(yy)),(0.9-0.1*float(xx+1.0)),(0.1+0.1*float(yy+1.0)),(0.9-0.1*float(xx))] ;position vector
        IF (xx EQ ntags-1) AND (yy EQ 0) THEN BEGIN
           myplot = plot(xdata.(yy), xdata.(xx), 'b+', $                   ;plot ra, dec
                         XTITLE = tags[yy], $                              ;plot options
                         YTITLE = tags[xx], $                              ;plot options
                         FONT_SIZE=6, $                                    ;YTITLE = 'DEC [deg]', $         ;plot options
                         /CURRENT, LAYOUT=[8,8,loc], POSITION=pos)         ;plot options
        ENDIF ELSE BEGIN
           IF (xx EQ ntags-1) THEN BEGIN 
              myplot = plot(xdata.(yy), xdata.(xx), 'b+', $           ;plot ra, dec
                            XTITLE = tags[yy], $                      ;plot options
                            YSHOWTEXT=0, FONT_SIZE=6, $               ;YTITLE = 'DEC [deg]', $         ;plot options
                            /CURRENT, LAYOUT=[8,8,loc], POSITION=pos) ;plot options
           ENDIF ELSE BEGIN
              IF (yy EQ 0) THEN BEGIN 
                 myplot = plot(xdata.(yy), xdata.(xx), 'b+', $           ;plot ra, dec
                               YTITLE = tags[xx], $                      ;plot options
                               XSHOWTEXT=0, FONT_SIZE=6, $               ;plot options
                               /CURRENT, LAYOUT=[8,8,loc], POSITION=pos) ;plot options
              ENDIF ELSE BEGIN
                 myplot = plot(xdata.(yy), xdata.(xx), 'b+', $           ;plot ra, dec
                               XSHOWTEXT=0, YSHOWTEXT=0, FONT_SIZE=6, $  ;plot options
                               /CURRENT, LAYOUT=[8,8,loc], POSITION=pos) ;plot options
              ENDELSE
           ENDELSE
        ENDELSE
        loc = loc + 1           ;increase location
     ENDFOR                     ;end loop over tags again
  ENDFOR                        ;end loop over tags
  

END
;====================================================================================================


;====================================================================================================
PRO KEMCLASS_CLEAN::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION KEMCLASS_CLEAN::init, xdata                            
  
  self.kccobjver = 'v0-1-0'     ;code version
  
  self.xdata = ptr_new(xdata)                ;store data in pointer
  self.xdatatags = ptr_new(tag_names(xdata)) ;store data tags in pointer

  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO KEMCLASS_CLEAN__define

  void = {KEMCLASS_CLEAN, kccobjver:'A', $
          XDATA:ptr_new(), XDATATAGS:ptr_new(), $
          NWIN:0}

  RETURN
END
;====================================================================================================

