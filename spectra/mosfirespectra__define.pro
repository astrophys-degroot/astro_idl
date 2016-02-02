;+
; NAME:
;       MOSFIRESPECTRA()
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
PRO MOSFIRESPECTRA::getprop, MOSSPECOBJVER=mosspecobjver, $
                             LAMBDAS=lambdas, FLUX=flux, DFLUX=dflux, FLAGFLUX=flagflux

  IF arg_present(MOSSPECOBJVER) THEN mosspecobjver = self.mosspecobjver ;return the data
  IF arg_present(LAMBDAS) THEN lambdas = *self.lambdas                  ;return the data
  IF arg_present(FLUX) THEN flux = *self.flux                           ;return the data
  IF arg_present(DFLUX) THEN dflux = *self.fluxerr                      ;return the data
  IF arg_present(FLAGFLUX) THEN flagflux = *self.fluxflag               ;return the data
  
  RETURN
END
;====================================================================================================


;====================================================================================================
PRO MOSFIRESPECTRA::readspecthrough

  
  directory = '/Users/adegroot/code/IDL/idlandrew/mosfire/auxiliary/' ;directory 
  file = '???band_specthroughput.txt'                                 ;base name
  bands = ['y', 'j', 'h', 'k'] ;bands

  chk = where(self.band EQ bands)                      ;find bands
  IF (chk[0] NE -1) THEN BEGIN                         ;band is valid
     strreplace, file, '???', self.band                ;replace
     file = strcompress(directory + file, /REMOVE_ALL) ;append directory
     readcol, file, lambdas, throughput                ;read in data
     self.lambdathrough = ptr_new(lambdas)             ;store data
     self.specthrough = ptr_new(throughput)            ;store data
  ENDIF                                                ;end band is valid
  
  
END
;====================================================================================================


;====================================================================================================
FUNCTION MOSFIRESPECTRA::read, FILEUNIT=fileunit

  IF keyword_set(FILEUNIT) THEN fileunit = fix(fileunit[0]) ELSE fileunit = 1 ;set default


  data = mrdfits(self.file, fileunit, hdr, STATUS=status, /SILENT) ;read in the file
  IF (status EQ 0) THEN BEGIN                                      ;if file is read
     self.data = ptr_new(data)                                     ;store the data
     self.hdr = ptr_new(hdr)                                       ;store the header
     pass = 1                                                      ;pass check 
  ENDIF ELSE pass = 0                                              ;fail check

  RETURN, pass
END
;====================================================================================================


;====================================================================================================
PRO MOSFIRESPECTRA::unpack


  data = *self.data                        ;grab data
  self.lambdas = ptr_new(data.lambdas)     ;store data
  self.flux = ptr_new(data.spec1d)         ;store data
  self.fluxerr = ptr_new(data.spec1dwei)   ;store data
  flags = intarr(n_elements(data.lambdas)) ;create flag array
  self.fluxflag = ptr_new(flags)           ;store data

END
;====================================================================================================


;====================================================================================================
PRO MOSFIRESPECTRA::commonwave, TCOMMONGRID=tcommongrid, $
                                LSQUADRATIC=lsquadratic, QUADRATIC=quadratic, SPLINE=spline ;, $

                                ;, xwavegrid, xmyfiles, xmyout, , KEYZ=keyz, $
                                ;OFFPLOT=offplot


  IF keyword_set(TCOMMONGRID) THEN tcommongrid = tcommongrid[0] ELSE tcommongrid = 2 ;set default
                                ;IF keyword_set(KEYZ) THEN keyz = keyz[0] ELSE keyz = self.keyz                                    ;set default
                                ;zind = tagind(xmyfiles, keyz)                                                                     ;get tag index


  ;;;grab data
  wavegrid = *self.lambdathrough ;get wavelength grid
  rlambdas = *self.lambdas       ;get wavelengths
  flux = *self.flux              ;get flux
  fluxerr = *self.fluxerr        ;get fluxerr
  fluxflag = *self.fluxflag      ;get flux flags

  CASE TCOMMONGRID OF
     1 : BEGIN
        print, '   Using INTERPOLATE function to move to common wavelength grid' ;print info
        self.commongrid = 'LINEAR'                                               ;store common grid info
        print, 'WARNING!! This section still needs work!!'
        stop
     END

     2 : BEGIN
        print, '   Using INTERPOL function to move to common wavelength grid' ;print info
        self.commonwave = 'INTERPOL'                                          ;store common grid info
        zeros = where(flux EQ 0.0, nzeros)                                    ;check for zeros in xmyfiles[xx]
        
        IF (zeros[0] NE -1) THEN BEGIN           ;if zeros exist

           IF (zeros[0] LT 0.5*n_elements(xmyfiles[xx].spec1d)) THEN BEGIN ;if lowest zero index is in first half
              cnt = 0                                                      ;initialize 
              finish = 0                                                   ;initialize
              WHILE ((finish EQ 0) AND (abs(cnt) LT nzeros-1)) DO BEGIN    ;begin counting up
                 IF (cnt NE 0) THEN BEGIN                                  ;if not first pass
                    IF (zeros[cnt+1] - zeros[cnt]) NE 1 THEN BEGIN         ;more than one index
                       lolimind = zeros[cnt]                               ;save lower limit index
                       finish = 1                                          ;set to finish
                    ENDIF ELSE lolimind = zeros[cnt]                       ;if not more than one index
                 ENDIF ELSE lolimind = zeros[cnt]                          ;save first lower limit index
                 cnt = cnt + 1                                             ;up counter
              ENDWHILE                                                     ;end counting up
           ENDIF ELSE lolimind = -9999                                     ;end if index is in first half

           IF (zeros[-1] GT 0.5*n_elements(xmyfiles[xx].spec1d)) THEN BEGIN ;if index is in second half
              cnt = -1                                                      ;initialize 
              finish = 0                                                    ;initialize
              WHILE ((finish EQ 0) AND (abs(cnt) LT nzeros-1)) DO BEGIN     ;begin counting down
                 IF (cnt NE -1) THEN BEGIN                                  ;if not first pass
                    IF (zeros[cnt] - zeros[cnt-1]) NE 1 THEN BEGIN          ;more than one index
                       hilimind = zeros[cnt]                                ;save lower limit index
                       finish = 1                                           ;set to finish
                    ENDIF ELSE hilimind = zeros[cnt]                        ;if not more than one index
                 ENDIF ELSE hilimind = zeros[cnt]                           ;save first lower limit index
                 cnt = cnt - 1                                              ;down counter
              ENDWHILE                                                      ;end counting down
           ENDIF ELSE hilimind = -9999                                      ;end if index is in second half
           
           IF (lolimind NE -9999) THEN lolimlamb = rlambdas[lolimind] ELSE lolimlamb = rlambdas[0]  ;get wavelength
           IF (hilimind NE -9999) THEN hilimlamb = rlambdas[hilimind] ELSE hilimlamb = rlambdas[-1] ;get wavelength
           chk = min(abs(lolimlamb-xwavegrid), minind)                                              ;find index in new wavegrid array
           chk = min(abs(hilimlamb-xwavegrid), maxind)                                              ;find index in new wavegrid array

        ENDIF ELSE BEGIN               ;end if zeros exist
           minind = 0                  ;default
           maxind = n_elements(flux)-1 ;default
        ENDELSE                        ;end 
        
        result = interpol(flux, rlambdas, wavegrid, /NAN, $                            ;cont next line
                          LSQUADRATIC=lsquadratic, QUADRATIC=quadratic, SPLINE=spline) ;interplotate
        result[0:minind] = 0.0                                                         ;set interpolation to zero, it started at zero
        result[maxind:-1] = 0.0                                                        ;set interpolation to zero, it started at zero

                                ;variance = (xmyfiles[xx].spec1dwei)^2                                           ;get variance
        variance = (fluxerr)    ;get variance######
        result2 = interpol(variance, rlambdas, wavegrid, /NAN, $                        ;cont next line
                           LSQUADRATIC=lsquadratic, QUADRATIC=quadratic, SPLINE=spline) ;interplotate
        chk = where(result2 LE 0.0)                                                     ;find any negatives

           ;;;find the indices to fill with
        IF (chk[0] NE -1) THEN BEGIN                                                ;if interpolation created negative errors
           filllow = chk                                                            ;copy array
           filllow[*] = 0                                                           ;reset to zero
           fillhigh = filllow                                                       ;copy again
           flaglow = chk                                                            ;copy
           flaglow[*] = 1                                                           ;flag
           flaghigh = flaglow                                                       ;copy again
           cnt = 1                                                                  ;counter
           pass = 0                                                                 ;flag
           WHILE ((pass EQ 0) AND (cnt LT 5) AND (total(flaglow) NE 0)) DO BEGIN    ;start looking
              chk2 = where((result2[chk-cnt] GT 0.0) AND (flaglow EQ 1))            ;not zero and still needed
              IF (chk2[0] NE -1) THEN BEGIN                                         ;if found
                 tmpind = chk-cnt                                                   ;shifted indices
                 filllow[chk2] = tmpind[chk2]                                       ;store new indices
                 flaglow[chk2] = 0                                                  ;flag as found
              ENDIF                                                                 ;end found
              chk3 = where((result2[chk+cnt] GT 0.0) AND (flaghigh EQ 1))           ;not zero and still needed
              IF (chk3[0] NE -1) THEN BEGIN                                         ;if found
                 tmpind = chk+cnt                                                   ;shifted indices
                 fillhigh[chk3] = tmpind[chk3]                                      ;store new indices
                 flaghigh[chk3] = 0                                                 ;flag as found
              ENDIF                                                                 ;end found
              cnt = cnt + 1                                                         ;up counter
           ENDWHILE                                                                 ;end looking
           
              ;;;find new value
           distlow = chk-filllow                                                     ;# indices lower
           disthigh = fillhigh-chk                                                   ;# indices higher
           dist = fillhigh - filllow                                                 ;total indices
           weilow = (1.0 - float(distlow) / float(dist))                             ;low weight
           weihigh = (1.0 - float(disthigh) / float(dist))                           ;high weight
           result2[chk] = weilow * result2[filllow] + weihigh * result2[fillhigh]    ;new values
           chk = where(result2 LT 0.0)                                               ;find any negatives              
        ENDIF                                                                        ;end interpol neg errors

        result2 = result2^0.5       ;back to errors
        result2[0:minind] = 0.0     ;set interpolation to zero, it started at zero
        result2[maxind:-1] = 0.0    ;set interpolation to zero, it started at zero
        
        self.lambdas = ptr_new(wavegrid)         ;store spectrum wavelength
        self.flux = ptr_new(result)              ;store spectrum result
        self.fluxerr = ptr_new(result2)          ;store error result
        fluxflag[0:minind] = 1                   ;set flag
        fluxflag[maxind:-1] = 1                  ;set flag
        chk = where(result2 EQ 0.0)              ;find zero errors
        IF (chk[0] NE -1) THEN fluxflag[chk] = 1 ;flag them
        chk = where(result2 NE result2)          ;find zero errors
        IF (chk[0] NE -1) THEN fluxflag[chk] = 1 ;flag them
        self.fluxflag = ptr_new(fluxflag)        ;store flags 
        
                                ;ENDFOR                  ;end loop over spec
     END

     ELSE : BEGIN
        print, 'WARNING!! COMMONGRID choice not valid'  ;print info
        print, '   Section requires additional work!!!' ;print info
        stop                                            ;stop run
     ENDELSE
     
  ENDCASE 

  
END
;====================================================================================================



;====================================================================================================
PRO MOSFIRESPECTRA::scale, scaleregion

  print, 'here'
  
  lambdas = *self.lambdas
  flux = *self.flux
  fluxerr = *self.fluxerr

  region = where((lambdas GE scaleregion[0]) AND ((lambdas LE scaleregion[1])))
  mybi = obj_new('beers1990', flux[region])
  guess = mybi.biweight()
  guesserr = mybi.biweightscale()
  print, guess, guesserr
  obj_destroy, mybi

  flux = flux * (0.1/guess) 
  fluxerr = fluxerr * (1.0 + (guesserr / guess))

  self.flux = ptr_new(flux)
  self.fluxerr = ptr_new(fluxerr)

                                ;stop


  
END
;====================================================================================================


;====================================================================================================
PRO MOSFIRESPECTRA::plotspec, RAWSPEC=rawspec, THROUGHPUT=throughput, CORRECTED=corrected

  mywin = window(LOCATION=[100,300], DIMENSION=[1200,400])

  IF keyword_set(RAWSPEC) THEN BEGIN
     xs = *self.lambdas
     ys = *self.flux
     myplot = plot(xs, ys, 'b', /CURRENT)
  ENDIF

  IF keyword_set(THROUGHPUT) THEN BEGIN
     xs = *self.lambdathrough
     ys = *self.specthrough
     myplot = plot(xs, ys, 'r', /CURRENT, /OVERPLOT)
  ENDIF

  IF keyword_set(CORRECTED) THEN BEGIN
     xs = *self.lambdas
     ys = *self.flux / *self.specthrough
     myplot = plot(xs, ys, 'g', /CURRENT, /OVERPLOT)
  ENDIF

END
;====================================================================================================


;====================================================================================================
PRO MOSFIRESPECTRA::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION MOSFIRESPECTRA::init, file, band                            
  
  self.mosspecobjver = 'v0-0-1'           ;code version
  self.file = string(file[0])             ;set default
  self.band = strlowcase(string(band[0])) ;set default


  self.readspecthrough          ;read in spectroscopic throughput functions

  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO MOSFIRESPECTRA__define

  void = {MOSFIRESPECTRA, inherits SPECTRA, mosspecobjver:'A', $
          file:'A', band:'A', data:ptr_new(), $
          lambdathrough:ptr_new(), specthrough:ptr_new(), $
          commonwave:'A'}

  RETURN
END
;====================================================================================================

