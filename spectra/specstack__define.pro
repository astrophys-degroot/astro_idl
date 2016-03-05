;+
; NAME:
;       SPECSTACK()
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
;       A. DeGroot, 2014 Sep 11, Univ. Cali, Riverside v2.1.0
;          -additional upgrades for flexibility
;       A. DeGroot, 2014 Sep 11, Univ. Cali, Riverside v2.0.0
;          -massive upgrade for flexibility
;       A. DeGroot, 2014 Sep 11, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;      -test whether file can be opened before tyring to use it
;      -helio centric rest frame that business
;      -redo those wavegrid options that reread in the files
;     
;
;-

;====================================================================================================
PRO specstack::getprop, SSOBJVER=ssobjver, MINLAMB=minlamb, MAXLAMB=maxlamb

  IF arg_present(SSOBJVER) THEN ssobjver = self.ssobjver    ;return the data
  IF arg_present(MINWAVE) THEN minwave = self.minwave ;return the data
  IF arg_present(MAXWAVE) THEN maxwave = self.maxwave ;return the data

  RETURN
END
;====================================================================================================



;====================================================================================================
PRO specstack::findfiles, xspec, XDIR=xdir


  ;;;get some data
  self.nspec = n_elements(xspec) ;# of spectra
  
  
  ;;;work on directories structure
  IF keyword_set(XDIR) THEN BEGIN                              ;if keyword set
     ndirs = n_elements(xdir)                                  ;how many elements in dirs
     IF ndirs EQ 1 THEN BEGIN                                  ;if only 1 elements
        tmpxdir = xdir[0]                                      ;get single entry
        xdir = xspec                                           ;copy array
        xdir[*] = tmpxdir                                      ;set all entries to the same
     ENDIF ELSE BEGIN                                          ;if more than 1 element
        IF self.nspec NE ndirs THEN BEGIN                      ;if #s no equal
           print, 'WARNING!! # of specs not equal # of dirs!!' ;print info
           stop                                                ;stop run
        ENDIF ELSE BEGIN                                       ;end if #s not equal
           print, '  One directory for each spectrum...'       ;print info
        ENDELSE                                                ;end if equal
     ENDELSE                                                   ;end if more than 1 elements
  ENDIF ELSE BEGIN                                             ;end if keyword set
     xdir = xspec                                              ;copy array
     xdir[*] = ' '                                             ;set all entries to the nothign
  ENDELSE                                                      ;end if keyword not set

  ;;;append directoy(ies) to files
  xspec = strcompress(xdir + xspec, /REMOVE_ALL)


  ;;;verify files exist
  keep = intarr(self.nspec)                                             ;create array
  FOR xx=0, self.nspec-1, 1 DO BEGIN                                    ;loop over files
     keep[xx] = file_test(xspec[xx])                                    ;store which exist
  ENDFOR                                                                ;end loop over files
  chk = where((keep EQ 1), COMPLEMENT=nokeep)                           ;find which to keep
  IF (nokeep[0] NE -1) THEN BEGIN                                       ;if some were not found
     print, 'Some spectra were not found in directory(ies) provided...' ;print info
     print, xspec[nokeep]                                               ;print not found
  ENDIF                                                                 ;end some not found
  IF (chk[0] NE -1) THEN xspec = xspec[chk]                             ;keep found 


  ;;;store spectra to be used
  self.specnames = ptr_new(xspec) ;store info
  

  RETURN
END
;====================================================================================================



;====================================================================================================
FUNCTION specstack::readfiles, xspec, XDIR=xdir, KEYZ=keyz


  IF keyword_set(KEYZ) THEN keyz = keyz[0] ELSE keyz = self.keyz ;set default

  fullfile = *self.specnames                          ;print full file
  FOR xx=0, n_elements(fullfile)-1, 1 DO BEGIN         ;loop over specs
     spectrum = mrdfits(fullfile[xx], 1, hdr, /SILENT) ;read in file
     IF (xx NE 0) THEN BEGIN                           ;if not first spectrum
        FOR yy=0, ntags-1, 1 DO BEGIN                  ;loop over tags
           retfiles[xx].(yy) = spectrum.(yy)           ;store values
        ENDFOR                                         ;end loop over tags
        retfiles[xx].(mytag) = float(fxpar(hdr, keyz)) ;get redshift from header
     ENDIF ELSE BEGIN                                  ;if first spectrum
        ntags = n_elements(tag_names(spectrum))        ;grab number of tags in struc
        retfiles = spectrum                            ;copy structure
        add_tag, retfiles, keyz, 0.0, tmpstruc         ;add tag
        retfiles = 0                                   ;remove previous
        retfiles = tmpstruc                            ;recapture
        mytag = tagind(retfiles, keyz)                 ;get tag index
        retfiles = replicate(retfiles, self.nspec)     ;replicate structure
        retfiles[xx].(mytag) = float(fxpar(hdr, keyz)) ;get redshift from header
     ENDELSE                                           ;end if first spectrum
  ENDFOR                                               ;end loop over specs

  RETURN, retfiles
END
;====================================================================================================


;====================================================================================================
FUNCTION specstack::wavegrid, TWAVEGRID=twavegrid, $
                              MINLAMB=minlamb, MAXLAMB=maxlamb, DELTALAMB=deltalamb

  IF keyword_set(TWAVEGRID) THEN twavegrid = twavegrid[0] ELSE twavegrid = self.twavegrid ;set default


  ;;;create the wavelength grid
  CASE twavegrid OF
     
     1 : BEGIN                                            ;first option
        print, '   Using first spectrums wavelength grid' ;print info
        self.wavegrid = 'FIRST'                           ;set value
        firstfile = *self.specnames                       ;get filenames
        spectrum = mrdfits(firstfile[0], 1, hdr, /SILENT) ;read in file
        z = fxpar(hdr, keyz)                              ;get redshift value from header
        z = float(z)                                      ;convert to float type
        lambgrid = spectrum.lambdas / (1.0 + z)           ;get rest frame wavelengths
     END                                                  ;end first option
     
     2 : BEGIN                                                      ;second option
        print, '   Using median redshift spectrums wavelength grid' ;print info
        self.wavegrid = 'MEDIAN'                                    ;set value
        zs = fltarr(self.nspec)                                     ;create array
        files = *self.specnames                                     ;get filenames
        FOR xx=0, self.nspec-1, 1 DO BEGIN                          ;loop over specs
           data = mrdfits(files[xx], 1, hdr, /SILENT)               ;read in file
           zs[xx] = float(fxpar(hdr, keyz))                         ;get redshift value from header
        ENDFOR                                                      ;end loop over spec
        medzs = median(zs)                                          ;find median redshift in list
        chk = where(zs EQ medzs)                                    ;find median index
        firstfile =  files[chk[0]]                                  ;print full file
        spectrum = mrdfits(firstfile, 1, hdr, /SILENT)              ;read in file
        z = fxpar(hdr, keyz)                                        ;get redshift value from header
        z = float(z)                                                ;convert to float type
        lambgrid = spectrum.lambdas / (1.0 + z)                     ;get rest frame wavelengths
     END                                                            ;end second option

     3 : BEGIN                                                                                   ;third option
        print, '   Using perscribed wavelength grid'                                             ;print info
        self.wavegrid = 'FIXED'                                                                  ;set value
        IF (keyword_set(MINLAMB) AND keyword_set(MAXLAMB) AND keyword_set(DELTALAMB)) THEN BEGIN ;necessary keywords set
           minlamb = minlamb[0]                                                                  ;ensure only 1 element 
           maxlamb = maxlamb[0]                                                                  ;ensure only 1 element 
           deltalamb = deltalamb[0]                                                              ;ensure only 1 element 
           IF (minlamb LT maxlamb) THEN a = 1 ELSE BEGIN                                         ;sanity check
              print, '    MINLAMB value is greater than MAXLAMB value. Switching...'             ;print info
              tmp = maxlamb                                                                      ;store value
              maxlamb = minlamb                                                                  ;set other value
              minlamb = tmp                                                                      ;recapture stored value
           ENDELSE                                                                               ;end sanity check failed
           nelements = (maxlamb-minlamb) / deltalamb                                             ;number of wavelength elements
           lambgrid = deltalamb*indgen(nelements+1) + minlamb                                    ;create rest frame grid
           reflamb = lambgrid[0]                                                                 ;get first wavelength
           reflamb2 = lambgrid[-1]                                                               ;get last wavelength
        ENDIF ELSE BEGIN                                                                         ;end necessary keywords set
           IF ~keyword_set(MINLAMB) THEN print, '   You must set MINLAMB keyword!'               ;print info
           IF ~keyword_set(MAXLAMB) THEN print, '   You must set MAXLAMB keyword!'               ;print info
           IF ~keyword_set(DELTALAMB) THEN print, '   You must set DELTALAMB keyword!'           ;print info
           stop                                                                                  ;stop running
        ENDELSE                                                                                  ;end necessary keywords not set
     END                                                                                         ;end third option

     ELSE : BEGIN                                       ;if choice not found
        print, 'WARNING!! WAVEGRID choice not valid'    ;print info
        print, '   Section requires additional work!!!' ;print info
        stop                                            ;stop run
     END                                                ;end wavegrid choice not found
  ENDCASE                                               ;end choice of wavegrid
  self.minwave = lambgrid[0]                            ;get first wavelength
  self.maxwave = lambgrid[-1]                           ;get last wavelength


  RETURN, lambgrid
END
;====================================================================================================



;====================================================================================================
FUNCTION specstack::prepout, xwavegrid


  ;;;create the output structure to be filled
  tmp = xwavegrid                                                            ;copy array
  tmp[*] = 0.0                                                               ;set all to zero, float type
  tmp2 = fix(tmp)                                                            ;int type
  outstruc = {lambdas:xwavegrid, spec1d:tmp, spec1dwei:tmp, spec1dflag:tmp2} ;create structure
  output = replicate(outstruc, self.nspec)                                   ;replicate structure

  RETURN, output
END
;====================================================================================================



;====================================================================================================
FUNCTION specstack::commongrid, xwavegrid, xmyfiles, xmyout, TCOMMONGRID=tcommongrid, KEYZ=keyz, $
                                LSQUADRATIC=lsquadratic, QUADRATIC=quadratic, SPLINE=spline, $
                                OFFPLOT=offplot


  IF keyword_set(TCOMMONGRID) THEN tcommongrid = tcommongrid[0] ELSE tcommongrid = self.tcommongrid ;set default
  IF keyword_set(KEYZ) THEN keyz = keyz[0] ELSE keyz = self.keyz                                    ;set default
  zind = tagind(xmyfiles, keyz)                                                                     ;get tag index


  CASE TCOMMONGRID OF
     1 : BEGIN
        print, '   Using INTERPOLATE function to move to common wavelength grid' ;print info
        self.commongrid = 'LINEAR'                                               ;store common grid info
        print, 'WARNING!! This section still needs work!!'
        stop
     END

     2 : BEGIN
        print, '   Using INTERPOL function to move to common wavelength grid' ;print info
        self.commongrid = 'INTERPOL'                                          ;store common grid info
        FOR xx=0, self.nspec-1, 1 DO BEGIN                                    ;loop over spectrum
           rlambdas =  xmyfiles[xx].lambdas / (1.0 + xmyfiles[xx].(zind))     ;get rest frame wavelengths
           zeros = where(xmyfiles[xx].spec1d EQ 0.0, nzeros)                  ;check for zeros in xmyfiles[xx]
           IF (zeros[0] NE -1) THEN BEGIN                                     ;if zeros exist

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

           ENDIF ELSE BEGIN     ;end if zeros exist
              ;;;i shouldn't have to worry if no zeros exist in spectrum
           ENDELSE              ;end 

           result = interpol(xmyfiles[xx].spec1d, rlambdas, xwavegrid, /NAN, $            ;cont next line
                             LSQUADRATIC=lsquadratic, QUADRATIC=quadratic, SPLINE=spline) ;interplotate
           result[0:minind] = 0.0                                                         ;set interpolation to zero, it started at zero
           result[maxind:-1] = 0.0                                                        ;set interpolation to zero, it started at zero

                                ;variance = (xmyfiles[xx].spec1dwei)^2                                           ;get variance
           variance = (xmyfiles[xx].spec1dwei)                                             ;get variance######
           result2 = interpol(variance, rlambdas, xwavegrid, /NAN, $                       ;cont next line
                              LSQUADRATIC=lsquadratic, QUADRATIC=quadratic, SPLINE=spline) ;interplotate
           chk = where(result2 LE 0.0)                                                     ;find any negatives

           ;;;find the indices to fill with
           IF (chk[0] NE -1) THEN BEGIN                                             ;if interpolation created negative errors
              filllow = chk                                                         ;copy array
              filllow[*] = 0                                                        ;reset to zero
              fillhigh = filllow                                                    ;copy again
              flaglow = chk                                                         ;copy
              flaglow[*] = 1                                                        ;flag
              flaghigh = flaglow                                                    ;copy again
              cnt = 1                                                               ;counter
              pass = 0                                                              ;flag
              WHILE ((pass EQ 0) AND (cnt LT 5) AND (total(flaglow) NE 0)) DO BEGIN ;start looking
                 chk2 = where((result2[chk-cnt] GT 0.0) AND (flaglow EQ 1))         ;not zero and still needed
                 IF (chk2[0] NE -1) THEN BEGIN                                      ;if found
                    tmpind = chk-cnt                                                ;shifted indices
                    filllow[chk2] = tmpind[chk2]                                    ;store new indices
                    flaglow[chk2] = 0                                               ;flag as found
                 ENDIF                                                              ;end found
                 chk3 = where((result2[chk+cnt] GT 0.0) AND (flaghigh EQ 1))        ;not zero and still needed
                 IF (chk3[0] NE -1) THEN BEGIN                                      ;if found
                    tmpind = chk+cnt                                                ;shifted indices
                    fillhigh[chk3] = tmpind[chk3]                                   ;store new indices
                    flaghigh[chk3] = 0                                              ;flag as found
                 ENDIF                                                              ;end found
                 cnt = cnt + 1                                                      ;up counter
              ENDWHILE                                                              ;end looking
              
              ;;;find new value
              distlow = chk-filllow                                                  ;# indices lower
              disthigh = fillhigh-chk                                                ;# indices higher
              dist = fillhigh - filllow                                              ;total indices
              weilow = (1.0 - float(distlow) / float(dist))                          ;low weight
              weihigh = (1.0 - float(disthigh) / float(dist))                        ;high weight
              result2[chk] = weilow * result2[filllow] + weihigh * result2[fillhigh] ;new values
              chk = where(result2 LT 0.0)                                            ;find any negatives              
           ENDIF                                                                     ;end interpol neg errors

           result2 = result2^0.5    ;back to errors
           result2[0:minind] = 0.0  ;set interpolation to zero, it started at zero
           result2[maxind:-1] = 0.0 ;set interpolation to zero, it started at zero
           
           xmyout[xx].spec1d = result                                ;store spectrum result
           xmyout[xx].spec1dwei = result2                            ;store error result
           xmyout[xx].spec1dflag[0:minind] = 1                       ;set flag
           xmyout[xx].spec1dflag[maxind:-1] = 1                      ;set flag
           chk = where(xmyout[xx].spec1dwei EQ 0.0)                  ;find zero errors
           IF (chk[0] NE -1) THEN xmyout[xx].spec1dflag[chk] = 1     ;flag them
           chk = where(xmyout[xx].spec1dwei NE xmyout[xx].spec1dwei) ;find zero errors
           IF (chk[0] NE -1) THEN xmyout[xx].spec1dflag[chk] = 1     ;flag them
           
        ENDFOR                  ;end loop over spec
     END

     ELSE : BEGIN
        print, 'WARNING!! COMMONGRID choice not valid'  ;print info
        print, '   Section requires additional work!!!' ;print info
        stop                                            ;stop run
     ENDELSE
     
  ENDCASE 

 
  RETURN, xmyout
END
;====================================================================================================


;====================================================================================================
FUNCTION specstack::normalize, xmyout, TNORMALIZE=tnormalize, LAMBVAL=lambval

  
  IF keyword_set(TNORMALIZE) THEN tnormalize = tnormalize[0] ELSE tnormalize = self.tnormalize ;set default
  IF keyword_set(LAMBVAL) THEN lambval = lambval[0] ELSE lambval = 6563.0                      ;set default

  CASE tnormalize OF

     1 : BEGIN                                                                                                  ;use Halpha peak flux for normalization
        print, '   Using flux value at lambda=6563Ang to normalize the spectra'                                 ;print info
        self.normalize = 'HAFLUX'                                                                               ;store common grid info
        FOR xx=0, n_elements(xmyout)-1, 1  DO BEGIN                                                             ;loop over spectra
           IF (xx NE 0) THEN BEGIN                                                                              ;if not the first spectra
              tmpmindiff = min(abs(xmyout.lambdas - lambval), tmpminind)                                        ;find the index for Halpha
           ENDIF ELSE BEGIN                                                                                     ;if it is the first
              mindiff = min(abs(xmyout.lambdas - lambval), minind)                                              ;also find the indes for Halpha
              tmpminind = minind                                                                                ;just for the first pass
           ENDELSE                                                                                              ;end if it is first
           IF ((minind NE tmpminind) AND (xx NE 0)) THEN print, 'WARNING!! Something has gone horribly wrong!!' ;sanity check
           xmyout[xx].spec1d = xmyout[xx].spec1d / xmyout[xx].spec1d[minind]                                    ;normalize
           xmyout[xx].spec1dwei = xmyout[xx].spec1dwei / xmyout[xx].spec1d[minind]                              ;recompute error
        ENDFOR                                                                                                  ;end loop over spectra
     END                                                                                                        ;end Halpha peak flux for normalization

     99 : BEGIN                                                ;no normalization
        print, '   No normalization performed on the spectra.' ;print info
        self.normalize = 'NONE'                                ;store common grid info
        xmyout = xmyout                                        ;trivial
     END                                                       ;end no normalizaiton
     
     ELSE : BEGIN
     ENDELSE
     
  ENDCASE


  RETURN, xmyout
END
;====================================================================================================



;====================================================================================================
FUNCTION specstack::convolve, xmyout, VELDISP=veldisp, LAMBREF=labmref


  IF keyword_set(TCONVOLVE) THEN tconvolve = tconvolve[0] ELSE tconvolve = self.tconvolve ;set default
  IF keyword_set(VELDISP) THEN veldisp = veldisp ELSE veldisp = [100.0]                   ;set default [km/s]
  IF keyword_set(LAMBREF) THEN lambref = lambref ELSE lambref = 6562.81                   ;set default
  
  CASE tconvolve OF             ;which type of convolution

     1 : BEGIN                                                                     ;convolve using Gaussian
        print, strcompress('   Convolving spectra with a Gaussian of width ' + $   ;cont next line
                           string(veldisp) + ' [km/s]')                            ;print info
        self.convolve = 'GAUSSIAN'                                                 ;store convolve type info
        FOR xx=0, n_elements(veldisp)-1, 1 DO BEGIN                                ;loop over number of convolutions
           sigma = ((1000.0 * veldisp[xx]) / 299792458.0) * lambref                ;width of gaussian in wavelength
           chk = ((lambref - xmyout[0].lambdas[0]) GT 0.0) AND $                   ;cont next line
                 ((xmyout[0].lambdas[-1] - lambref) GT 0.0)                        ;must fall in wavelength range
           IF (chk NE 1) THEN BEGIN                                                ;if reference wavelength falls outside spectra range
              print, 'WARNING!! Reference lambda falls outside wavelength range!!' ;print info
              print, '  Convolution may be poor!'                                  ;print info
           ENDIF                                                                   ;end falls outside range
           mindiff = min(abs(lambref - xmyout[0].lambdas), minind)                 ;pixel for reference lamb
           dlamb = xmyout[0].lambdas[minind+1] - xmyout[0].lambdas[minind]         ;delta lambda
           sigpix = sigma / dlamb                                                  ;width of gaussian in pixels
           kernel = gaussian_function(sigma, /NORMALIZE)                           ;create kernel
           FOR yy=0, self.nspec-1, 1 DO BEGIN                                      ;loop over spectra
              xmyout[yy].spec1d = convol(xmyout[yy].spec1d, kernel)                ;convolve spectrum
           ENDFOR                                                                  ;end loop over spectra
        ENDFOR                                                                     ;end loop over number of convolutions
     END                                                                           ;end convolve with a Gaussian
     
     99 : BEGIN                                              ;no normalization
        print, '   No convolution performed on the spectra.' ;print info
        self.convolve = 'NONE'                               ;store common grid info
        self.convolveval = 0.0                               ;store common grid info
        xmyout = xmyout                                      ;trivial
     END                                                     ;end no normalizaiton
     
     ELSE : BEGIN
     ENDELSE
     
  ENDCASE                       ;end which type of convolution


 RETURN, xmyout
END
;====================================================================================================



;====================================================================================================
FUNCTION specstack::rejection, xmyout, TREJECTION=trejection, $
                               NMINMAX=nminmax, CLIPSIG=clipsig, CLIPITERS=clipiters

  
  IF keyword_set(TREJECTION) THEN trejection = trejection[0] ELSE trejection = self.trejection ;set default
  IF keyword_set(NMINMAX) THEN nminmax = nminmax[0] ELSE nminmax = 2                           ;set default
  IF keyword_set(CLIPSIG) THEN clipsig = clipsig[0] ELSE clipsig = 2.0                         ;set default
  IF keyword_set(CLIPITERS) THEN clipiters = clipiters[0] ELSE clipiters = 5                   ;set default 

  CASE TREJECTION OF                                                      ;which type of rejection
     1 : BEGIN                                                            ;begin min/max rejection
        print, '   Using a MIN/MAX rejection.'                            ;print info
        self.rejection = 'MINMAX'                                         ;store type info
        FOR xx=0, n_elements(xmyout[0].spec1d)-1, 1 DO BEGIN              ;loop over wavelength
           FOR yy=0, nminmax-1, 1 DO BEGIN                                ;loop over number of min/max rejections
              good = where(xmyout.spec1dflag[xx] EQ 0)                    ;find non-rejects
              IF ((good[0] NE -1) AND (n_elements(good) GT 2)) THEN BEGIN ;if enough real data exists
                 minval = min(xmyout[good].spec1d[xx], minind)            ;find minimum
                 maxval = max(xmyout[good].spec1d[xx], maxind)            ;find maximum
                 xmyout[good[minind]].spec1dflag[xx] = 1                  ;reject
                 xmyout[good[maxind]].spec1dflag[xx] = 1                  ;reject
              ENDIF                                                       ;end if real data exists
           ENDFOR                                                         ;end loop over min max rejections
        ENDFOR                                                            ;end loop over wavelength
     END                                                                  ;end min/max rejection

     2 : BEGIN                                                                                    ;begin sigma-clip rejection
        print, '   Using a sigma-clipping rejection.'                                             ;print info
        self.rejection = 'SIGCLIP'                                                                ;store type info
        FOR xx=1000, n_elements(xmyout[0].spec1d)-1, 1 DO BEGIN                                   ;loop over wavelength
           good = where(xmyout.spec1dflag[xx] EQ 0)                                               ;find non-rejects
           IF ((good[0] NE -1) AND (n_elements(good) GT 2)) THEN BEGIN                            ;if enough real data exists
              ditch = sigclip(xmyout[good].spec1d[xx], SIGMA=clipsig, NITERS=clipiters, /CLIPPED) ;sigma clip 
              IF (ditch[0] NE -1) THEN xmyout[good[ditch]].spec1dflag[xx] = 1                     ;set reject flag
           ENDIF                                                                                  ;end if non-rejected points
        ENDFOR                                                                                    ;end loop over wavelength
     END                                                                                          ;end sigma-clip rejection

     99 : BEGIN                                       ;no further rejection
        print, '   No rejection; keeping all points.' ;print info
     END                                              ;end no rejection
     
     ELSE : BEGIN                                     ;begin alternative
        print, 'WARNING!! TREJECTION not understood.' ;print info
        print, '  No rejection; keeping all points.'  ;print info
     ENDELSE                                          ;end alternative
     
  ENDCASE
  
  RETURN, xmyout
END
;====================================================================================================



;====================================================================================================
FUNCTION specstack::combination, xmyout, TCOMBINATION=tcombination, ERRFLOOR=errfloor

  IF keyword_set(TCOMBINATION) THEN tcombination = tcombination[0] ELSE tcombination = self.tcombination ;set default
  IF keyword_set(ERRFLOOR) THEN errfloor = errfloor[0] ELSE errfloor = self.errfloor                     ;set default

  stacked = xmyout[0]                                                          ;copy of structure
  stacked.spec1d[*] = 0.0                                                      ;zero out spectra
  stacked.spec1dwei[*] = 0.0                                                   ;zero out errors
  stacked.spec1dflag[*] = 0                                                    ;zero out flags
  CASE tcombination OF                                                         ;typo of combination
     1 : BEGIN                                                                 ;start sum
        print, '   Using a simple sum at each wavelength'                      ;print info
        self.combination = 'SUM'                                               ;set value
        FOR xx=0, n_elements(xmyout[0].spec1d)-1, 1 DO BEGIN                   ;loop over wavelengths
           use = where(xmyout.spec1dflag[xx] EQ 0)                             ;find non-flagged points
           IF (use[0] NE -1) THEN BEGIN                                        ;if non-flagged exist
              stacked.spec1d[xx] = total(xmyout[use].spec1d[xx])               ;add them up
              stacked.spec1dwei[xx] = (total(xmyout[use].spec1dwei[xx]^2))^0.5 ;add them up
           ENDIF ELSE BEGIN                                                    ;if no useful points
              stacked.spec1d[xx] = 0.0                                         ;if not set to zero
              stacked.spec1dwei[xx] = 0.0                                      ;if not set to zero
           ENDELSE                                                             ;end no useful points
        ENDFOR                                                                 ;end loop over wavelengths
     END                                                                       ;end sum

     2 : BEGIN                                                                                         ;start average
        print, '   Using a simple average at each wavelength'                                          ;print info
        self.combination = 'MEAN'                                                                      ;set value
        FOR xx=0, n_elements(xmyout[0].spec1d)-1, 1 DO BEGIN                                           ;loop over wavelengths
           use = where(xmyout.spec1dflag[xx] EQ 0)                                                     ;get non-flagged
           IF (use[0] NE -1) THEN BEGIN                                                                ;if useful info
              stacked.spec1d[xx] = mean(xmyout[use].spec1d[xx])                                        ;find the mean
              stacked.spec1dwei[xx] = (total(xmyout[use].spec1dwei[xx]^2))^0.5 / (n_elements(use)^0.5) ;add them up divide by sqrt(N)
           ENDIF ELSE BEGIN                                                                            ;if no useful points
              stacked.spec1d[xx] = 0.0                                                                 ;if not set to zero
              stacked.spec1dwei[xx] = 0.0                                                              ;if not set to zero
           ENDELSE                                                                                     ;end no useful points
        ENDFOR                                                                                         ;end loop over wavelengths
     END                                                                                               ;end average

     3 : BEGIN                                                                           ;start median combine
        print, '   Using a simple median at each wavelength'                             ;print info
        self.combination = 'MEDIAN'                                                      ;set value
        FOR xx=0, n_elements(xmyout[0].spec1d)-1, 1 DO BEGIN                             ;loop over wavelengths
           use = where(xmyout.spec1dflag[xx] EQ 0)                                       ;get non-flagged
           IF (use[0] NE -1) THEN BEGIN                                                  ;if useful info
              stacked.spec1d[xx] = median([xmyout[use].spec1d[xx]])                      ;find the mean
              stacked.spec1dwei[xx] = 1.253*(total(xmyout[use].spec1dwei[xx]^2))^0.5 / $ ;cont next line
                                      (n_elements(use)^0.5)                              ;add them up divide by sqrt(N)
           ENDIF ELSE BEGIN                                                              ;if no useful points
              stacked.spec1d[xx] = 0.0                                                   ;if not set to zero
              stacked.spec1dwei[xx] = 0.0                                                ;if not set to zero
           ENDELSE                                                                       ;end no useful points
        ENDFOR                                                                           ;end loop over wavelengths
     END                                                                                 ;end median combine

     4 : BEGIN                                                                    ;start inv var wei combine
        print, '   Using a inverse variance weighted average at each wavelength'  ;print info
        self.combination = 'IVMEAN'                                               ;set value
        FOR xx=0, n_elements(xmyout[0].spec1d)-1, 1 DO BEGIN                      ;loop over wavelengths
           use = where(xmyout.spec1dflag[xx] EQ 0)                                ;get non-flagged
           IF (use[0] NE -1) THEN BEGIN                                           ;if useful info
              numer = total([xmyout[use].spec1d[xx]]/xmyout[use].spec1dwei[xx]^2) ;numerator
              denom = total(1.0 / xmyout[use].spec1dwei[xx]^2)                    ;denominator
              stacked.spec1d[xx] =  numer / denom                                 ;find the inv var weighted mean
              stacked.spec1dwei[xx] = (1.0 / denom)^0.5                           ;
           ENDIF ELSE BEGIN                                                       ;if no useful points
              stacked.spec1d[xx] = 0.0                                            ;if not set to zero
              stacked.spec1dwei[xx] = 100.0                                       ;if not set to zero
           ENDELSE                                                                ;end no useful points
        ENDFOR                                                                    ;end loop over wavelengths 
     END                                                                          ;end inv var wei combine

     5 : BEGIN                                                                       ;start MLE combine
        print, '   Using a MLE at each wavelength. Note: no real data are rejected!' ;print info
        self.combination = 'MLE'                                                     ;set value
        FOR xx=0, n_elements(xmyout[0].spec1d)-1, 1 DO BEGIN                         ;loop over wavelengths           
           use = where(xmyout.spec1d[xx] NE 0.0)                                     ;get non-zero
           IF (use[0] NE -1) THEN BEGIN                                              ;if useful info
              IF n_elements(use) EQ 1 THEN BEGIN                                     ;if only point
                 stacked.spec1d[xx] = xmyout[use].spec1d[xx]                         ;if not set to zero
                 stacked.spec1dwei[xx] = xmyout[use].spec1dwei[xx]                   ;if not set to zero
              ENDIF ELSE BEGIN                                                       ;if more than one point
                 
                 cnt = 0        ;start counter
                 pass = 0                                        ;flag
                 minval = -2.0
                 maxval = 2.0
                 npts = 5000.0
                 WHILE ((cnt LT 4) AND (pass EQ 0)) DO BEGIN     ;start iterating
                                ;minval = min(xmyout[use].spec1d[xx], minind) ;find min value
                                ;maxval = max(xmyout[use].spec1d[xx], maxind) ;find max value
                                ;sprdh = (xmyout[use[maxind]].spec1d[xx] + xmyout[use[maxind]].spec1dwei[xx] - $ ;cont next line
                                ;         (xmyout[use[minind]].spec1d[xx] - xmyout[use[minind]].spec1dwei[xx]))  ;find padded range of vals
                                ;trys = (sprdh/1000.0) * ulindgen(1000.0) + (xmyout[use[minind]].spec1d[xx] - $  ;cont next line
                                ;                                                                             xmyout[use[minind]].spec1dwei[xx])  ;find values to try
                    trys = ((maxval-minval) / npts) * ulindgen(npts + 1.0) + minval
                    FOR yy=0, n_elements(use)-1, 1 DO BEGIN                    ;loop over spectra
                       mu = xmyout[use[yy]].spec1d[xx]                         ;grab central value
                       sig = xmyout[use[yy]].spec1dwei[xx]                     ;grab spread value
                       IF (yy NE 0) THEN BEGIN                                 ;if not first pass
                          jlike = jlike + ((mu-trys)^2 / (-2.0*sig^2))         ;add to joint likelihood
                          alljlike = [[jlike], [((mu-trys)^2 / (-2.0*sig^2))]] ;
                       ENDIF ELSE BEGIN                                        ;end not first pass
                          jlike = ((mu-trys)^2 / (-2.0*sig^2))                 ;start joint likelihood
                          alljlike = [[jlike]]                                 ;
                       ENDELSE                                                 ;end if first pass
                    ENDFOR                                                     ;end loop over spectra
                    
                    jlike = exp(jlike - max(jlike))       ;normalize peak value
                    cjlike = jlike                        ;copy
                    maxjlike = max(jlike, maxindj)        ;find peak location
                    stacked.spec1d[xx] = trys[maxindj]    ;find peak flux value
                    sigs = sigmas(trys, cjlike, LEVELS=1) ;find errors
                    stacked.spec1dwei[xx] = mean(sigs)    ;store error bar
                    
                    chk = where(jlike GT 0.0001)                                                 ;check for real points
                    IF (n_elements(chk) LT 25) THEN BEGIN                                        ;if not enough real measurements
                       IF (chk[0] NE -1) THEN BEGIN                                              ;at least one real point
                          minind = min(chk)                                                      ;find lowest position index
                          newminind = fix(minind - 0.1*npts)                                     ;pad lower bound index
                          IF newminind LT 0 THEN newminind = 0                                   ;sanity check lower bound index
                          minval = trys[newminind]                                               ;new lower bound value
                          maxind = max(chk)                                                      ;find highest real position index
                          newmaxind = fix(maxind + 0.1*npts)                                     ;pad upper bound index
                          IF newmaxind GT n_elements(trys)-1 THEN newmaxind = n_elements(trys)-1 ;sanity check upper bound index
                          maxval = trys[newmaxind]                                               ;new upper bound
                       ENDIF ELSE BEGIN                                                          ;end no real point
                          print, 'WARNING!! Something has gone horribly wrong!!'                 ;print info
                          print, '  There should always be at least one point'                   ;print info
                       ENDELSE                                                                   ;end no real point
                    ENDIF ELSE pass = 1                                                          ;end enough real points
                    cnt = cnt + 1                                                                ;up counter
                 ENDWHILE                                                                        ;end iteration
              ENDELSE                                                                            ;if more than one point
           ENDIF ELSE BEGIN                                                                      ;if no useful points
              stacked.spec1d[xx] = 0.0                                                           ;if not set to zero
              stacked.spec1dwei[xx] = 99.0                                                       ;if not set to zero
           ENDELSE                                                                               ;end no useful points
        ENDFOR                                                                                   ;end loop over wavelengths
     END                                                                                         ;end MLE combine

     ELSE : BEGIN
        print, 'WARNING!! You have to pick a way to combine the spectra!!'
        stop
     END
  ENDCASE

  
  ;;;Flag points below SNR floor
  ;print, stacked.spec1dwei[1000:1010]
  ;print, stacked.spec1d[1000:1010]
  ;print, abs(stacked.spec1dwei[1000:1010] / stacked.spec1d[1000:1010]) * 100.0

  chk = where((abs(stacked.spec1dwei / stacked.spec1d) * 100.0) LT errfloor, nchk) ;find points with comically high SNR
  IF (chk[0] NE -1 ) THEN stacked.spec1dflag[chk] = 1                              ;set flag
  print, nchk

  RETURN, stacked
END
;====================================================================================================



;====================================================================================================
FUNCTION specstack::measure, basename, subsetname, SPECVER=specver, NEWSPECVER=newspecver, $
                             MCITERS=mciters, INDIR=indir, OUTDIR=outdir


  subsetname = string(subsetname[0])                                        ;ensure correct format
  IF keyword_set(SPECVER) THEN specver = specver[0]                         ;ensure nonarray
  IF keyword_set(NEWSPECVER) THEN newspecver = newspecver[0]                ;ensure nonarray
  IF keyword_set(MCITERS) THEN mciters = ulong(mciters[0]) ELSE mciters = 5 ;default value
  IF keyword_set(INDIR) THEN indir = string(indir[0]) ELSE indir = ' '      ;ensure nonarray
  IF keyword_set(OUTDIR) THEN outdir = string(outdir[0]) ELSE outdir = ' '  ;ensure nonarray

  anset = {fitto:['Ha','NIIr','NIIb','SIIb','SIIr'], $
           border:2, $
           lal:6450.0, lau:6800.0, $
           ZQFLAG:'-1', NOFITSKY:0, OPENFITS:0, DRYRUN:0, $
           initgss:['sig=2.5', 'c1=0.3', 'c2=0.2', 'x0=0.1', 'x1=0.0001' ], $
           priors:['SIG1 GT 0.0', 'C1 GT 0.0', 'C2 GT 0.0'], NEWVER:'v1-2'}
  

  ;;;test if value is defined in settings structure
  IF tag_exist(anset, 'openfits', /QUIET) THEN openfits = anset.openfits ELSE openfits = 0 ;if value is defined
  IF tag_exist(anset, 'nofitsky', /QUIET) THEN nofitsky = anset.nofitsky ELSE nofitsky = 0 ;if value is defined
  IF tag_exist(anset, 'dryrun', /QUIET) THEN dryrun = anset.dryrun ELSE dryrun = 0         ;if value is defined
  IF tag_exist(anset, 'fitto', /QUIET) THEN fitto = anset.fitto ELSE fitto = 0             ;if value is defined
  IF tag_exist(anset, 'lal', /QUIET) THEN lal = anset.lal ELSE lal = 0                     ;if value is defined
  IF tag_exist(anset, 'lau', /QUIET) THEN lau = anset.lau ELSE lau = 0                     ;if value is defined
  IF tag_exist(anset, 'yl', /QUIET) THEN yl = anset.yl ELSE yl = 0                         ;if value is defined
  IF tag_exist(anset, 'yu', /QUIET) THEN yu = anset.yu ELSE yu = 0                         ;if value is defined
  IF tag_exist(anset, 'border', /QUIET) THEN border = anset.border ELSE border = 0         ;if value is defined
  IF tag_exist(anset, 'initgss', /QUIET) THEN initgss = anset.initgss ELSE initgss = 0     ;if value is defined
  IF tag_exist(anset, 'priors', /QUIET) THEN priors = anset.priors ELSE priors = 0         ;if value is defined
  IF tag_exist(anset, 'oldver', /QUIET) THEN oldver = anset.oldver ELSE oldver = 0         ;if value is defined
  IF tag_exist(anset, 'newver', /QUIET) THEN newver = anset.newver ELSE newver = 0         ;if value is defined
  IF tag_exist(anset, 'xwhich', /QUIET) THEN xwhich = anset.xwhich ELSE xwhich = 0         ;if value is defined
  IF tag_exist(anset, 'zqflag', /QUIET) THEN zqflag = anset.zqflag ELSE zqflag = 0         ;if value is defined


  print, indir, outdir
  myanyl = obj_new('restframe_analyze1d', basename, subsetname, INDIR=indir, OUTDIR=outdir, $ ;cont next line
                   LAL=lal, LAU=lau, $                                                        ;cont next line
                   NOFITSKY=nofitsky, DRYRUN=dryrun, $                                        ;cont next line                          
                   FITTO=fitto, YL=yl, YU=yu, $                                               ;cont next line
                   BORDER=border, INITGSS=initgss, PRIORS=priors, $                           ;cont next line
                   OLDVER=specver, NEWVER=newspecver)                                         ;, $ ;cont next line
                                ;XWHICH=xwhich, ZQFLAG=zqflag)                                                    ;call analyze 1d object
  

  myanyl.prep, mciters, FITTOWL=myfittowl, ITERSTORE=mcstore ;prepare a few things
  status = myanyl.findfiles()                                ;check directories, read in files
  IF (status NE 1) THEN BEGIN                                ;if not all files found
     print, 'WARNING!! Not all files found!!'                ;print info
     print, 'Proceeding but likely failing...'               ;print info
     wait, 5                                                 ;wait 
  ENDIF                                                      ;end not all files found

  mydata = myanyl.readfiles('data')                 ;read in data
                                ;mywvres = myanyl.readfiles('waveresid')              ;read in data
  myanyl.bounds, LAL=lal, LAU=lau                   ;determine some bounds
                                ;myanyl.displaytwod, mybase, OPENFITS=openfits        ;create graphic of object
  mylambflg = myanyl.lambsubset(NOFITSKY=nofitsky)  ;find subset of wavelengths to fit
  mydatasub = myanyl.getsub(mydata, mylambflg)      ;grab subset
  mydatanew = myanyl.prepmcdata(mydatasub, mciters) ;prepare to do MC
  mygssnew = myanyl.prepmcguess(mciters)            ;more prepare to do MC
  

  tick = systime(/SECONDS)                                                                  ;start time
  cnt = 0                                                                                   ;start counter
  myvary = myanyl.fitspec(mydatasub, NEWDATA=mydatanew[-1].mcspec1d, /GETVARY)              ;fit 1D spectrum
  WHILE (cnt LE mciters) DO BEGIN                                                           ;iterate over monte carlo
     print, strcompress('  Iteraction number ' + string(cnt) + ' of ' + string(mciters))    ;print info
     drycnt = abs(mciters-cnt)                                                              ;count down to real run
     newguess = myanyl.undecipher(mygssnew[cnt])                                            ;back to a string
     IF (cnt EQ mciters) THEN BEGIN                                                         ;if last pass
        mkplot = 1                                                                          ;whether to plot or not
        myanyl.displayoned, mylambflg, NEWDATA=mydatanew[cnt].mcspec1d                      ;plot 1D spectrum
     ENDIF ELSE mkplot = 0                                                                  ;end if last pass
     myfit = myanyl.fitspec(mydatasub, NEWDATA=mydatanew[cnt].mcspec1d, INITGSS=newguess, $ ;cont next line
                            DRYRUN=drycnt, PLOTIT=mkplot, VARIES=myvary)                    ;fit 1D spectrum
     IF (cnt EQ 0) THEN mytotfit = myfit ELSE mytotfit = [mytotfit, myfit]                  ;store results
     cnt = cnt + 1                                                                          ;up counter
  ENDWHILE                                                                                  ;end monte carlo
  tock = systime(/SECONDS)                                                                  ;end time
  print, 'TIME FOR ONE SPECTRUM: ', abs(tick-tock)                                          ;display
  myanyl.getprop, FMCRUNS=filemcruns                                                        ;store
  IF ~(keyword_set(NOMCWRITE)) THEN mwrfits, mytotfit, filemcruns, /CREATE

     
  ;myz = myanyl.zbrkdwn(mytotfit, RESID=mywvres)                                              ;digest redshift values and error
  myfitbrk = myanyl.fitbrkdwn(mytotfit)                                                      ;digest other fit values and errors
  myflags = myanyl.flagging(myz, myfitbrk)                                                   ;flag based on available info
  mynewhdr = myanyl.updatehdr(['basic', 'run', 'fit', 'postrun', 'flags'], $                 ;cont next line
                              FITVALS=myfit, FITBRK=myfitbrk, FLGVALS=myflags)               ;ZVALS=myz,   ;add values to header
  myanyl.displayonedout, 0.0, NEWHDR=mynewhdr                                                ;final outplot
  myanyl.getprop, OBJVER=myanylver, DATAHDR=myhdr                                            ;get properties
  status = myanyl.writefile()                                                                ;write the file
  IF status EQ 1 THEN print, 'File written successfully!'                                    ;print info



  RETURN, 1
END
;====================================================================================================



;====================================================================================================
PRO specstack::display, xmystacked, xmyout, LOWIND=lowind, HIIND=hiind

  IF keyword_set(LOWIND) THEN lowind = lowind[0] ELSE lowind = 1700 ;set default
  IF keyword_set(HIIND) THEN hiind = hiind[0] ELSE hiind = 2500     ;set default
  
  
  stackwin = window(LOCATION=[100,100])                          ;create window
  stackplot = plot(xmystacked.lambdas, xmystacked.spec1d+10.0, $ ;plotting
                                ;stackplot = plot(xmystacked.lambdas[lowind:hiind], xmystacked.spec1d[lowind:hiind]+10.0, $                               ;plotting
                                ;stackplot = plot(xmystacked.lambdas[lowind:hiind], xmystacked.spec1d[lowind:hiind], $ ;plotting
                   /CURRENT, $  ;plot options
                   TITLE='Stacked Spectrum and Input Spectra', $       ;plot options
                   XTITLE='Rest Frame Wavelength [$\AA$]', $           ;plot options
                   XRANGE=[6400.0,7000.0], $                           ;force wavelength range
                   YTITLE='Flux [arbitrary units]', COLOR='blue')      ;plot options
  FOR xx=0, n_elements(xmyout)-1, 1 DO BEGIN                           ;loop over individual
     use = where(xmyout[xx].spec1dflag EQ 0)                           ;get non-flagged
     IF use[0] NE -1 THEN BEGIN                                        ;if usable points
        stackplot = plot(xmyout[xx].lambdas[use], $                    ;cont next line
                         (xmyout[xx].spec1d[use])+(5.0-xx), /OVERPLOT) ;plotting individual
     ENDIF                                                             ;end if  useable points
                                ;(xmyout[xx].spec1d[lowind:hiind]), /OVERPLOT) ;plotting individual
  ENDFOR                        ;end loop over individual
  


  chknan = where(xmystacked.spec1dwei NE xmystacked.spec1dwei)                                ;just in case of NaNs
  IF (chknan[0] NE -1) THEN print, 'WARNING!! You have NaNs in your error spectrum.'          ;print info
  erroroff = -0.2                                                                             ;offset in y-dir
  xerrs = [xmystacked.lambdas[lowind:hiind], reverse(xmystacked.lambdas[lowind:hiind])]       ;x values
  yerrs = [erroroff+xmystacked.spec1dwei[lowind:hiind], $                                     ;cont next line
           erroroff-reverse(xmystacked.spec1dwei[lowind:hiind])]                              ;y values
  stackwin2 = window(LOCATION=[150,150])                                                      ;create window
  stackplot = plot(xmystacked.lambdas[lowind:hiind], xmystacked.spec1d[lowind:hiind], $       ;plotting
                   /CURRENT, $                                                                ;plot options
                   TITLE='Stacked Spectrum', $                                                ;plot options
                   XTITLE='Rest Frame Wavelength [$\AA$]', $                                  ;plot options
                   YTITLE='Flux [arbitrary units]', COLOR='blue')                             ;plot options
  stackplot = polygon(xerrs, yerrs, /FILL_BACKGROUND, COLOR='gray', FILL_COLOR='gray', /DATA) ;plot error spectrum
  

END
;====================================================================================================



;====================================================================================================
PRO specstack::massanalysis, NOMLE=nomle

  

  mymass = *self.masses         ;grab them just because

  self.massave = mean(mymass)        ;average mass
  self.massmin = min(mymass, minind) ;minmass
  self.massmax = max(mymass, maxind) ;maxmass
  
  IF ~keyword_set(NOMLE) THEN BEGIN                             ;if keyword not set
     sprdm = (mymass[maxind]-mymass[minind]) + 0.4               ;find padded range of vals
     trys = (sprdm/150.0) * indgen(150.0) + mymass[minind] - 0.2 ;find values to try
     FOR xx=0, n_elements(mymass)-1, 1 DO BEGIN                 ;loop over spectra
        mu = mymass[xx]                                         ;grab central value
        sig = 0.1                                               ;grab spread value
        IF (xx NE 0) THEN BEGIN                                 ;if not first pass
           jlike = jlike - ((mu-trys)^2 / (2.0*sig^2))          ;add to joint likelihood
        ENDIF ELSE BEGIN                                        ;end not first pass
           jlike = ((mu-trys)^2 / (-2.0*sig^2))                 ;start joint likelihood
        ENDELSE                                                 ;end if first pass
     ENDFOR                                                     ;end loop over spectra
     jlike = exp(jlike - max(jlike))                            ;normalize peak value
     maxjlike = max(jlike, maxind)                              ;find peak location
     self.massmle = trys[maxind]                                ;find peak flux value
     sigs = sigmas(trys, jlike, LEVELS=1)                       ;find errors
     self.masssig = mean(sigs)                                  ;add sigma
  ENDIF                                                         ;end keyword not set
  

END
;====================================================================================================



;====================================================================================================
FUNCTION specstack::header, xmyout, CLMEMS=clmems, KEYMASS=keymass

  
  IF keyword_set(CLMEMS) THEN clmems = fix(clmems[0]) ELSE clmems = 0           ;set default
  IF keyword_set(KEYMASS) THEN keymass = keymass[0] ELSE keymass = self.keymass ;set default

  ;;;write the file to create a header and then populate the header
  mwrfits, outstruc, 'tmp.fits', /CREATE     ;first to create a header
  throwaway = mrdfits('tmp.fits', 1, newhdr) ;read in file and new header
  throwaway = 0                              ;for safety

  spawn, 'whoami', mememe                                                                             ;find owner
  fxaddpar, newhdr, 'DATE', systime(/UTC), 'When stack was created'                                   ;add param to hdr
  fxaddpar, newhdr, 'STCKER', mememe[0], 'Who created the stack'                                      ;add param to hdr
  fxaddpar, newhdr, 'STCKOBJ', 'specstack', 'Object (code) that created the stack'                    ;add param to hdr
  fxaddpar, newhdr, 'VSTCKOBJ', self.ssobjver, 'Version of code that created the stack'                 ;add param to hdr
  fxaddpar, newhdr, 'NSTCK', self.nspec, 'Number of spectra in the stack'                             ;add param to hdr
  fxaddpar, newhdr, 'STCKWAVE', self.wavegrid, 'Type of wavelength grid for stack'                    ;add param to hdr
  fxaddpar, newhdr, 'STCKCOMM', self.commongrid, 'Type of moving to a common wavelength grid'         ;add param to hdr
  fxaddpar, newhdr, 'STCKNORM', self.normalize, 'Type of normalization for each spectra'              ;add param to hdr
  fxaddpar, newhdr, 'STCKCONV', self.convolve, 'Type of convolution for each spectra'                 ;add param to hdr
  fxaddpar, newhdr, 'STCKREJ', self.rejection, 'Type of rejection used in stacking'                   ;add param to hdr
  fxaddpar, newhdr, 'STCKCOMB', self.combination, 'Type of combining of individual spectra for stack' ;add param to hdr
  fxaddpar, newhdr, 'CLUSTER', clmems, 'Stack of cluster members?'                                    ;add param to hdr
  IF (self.masses NE !NULL) THEN BEGIN                                                                ;if masses provided
     fxaddpar, newhdr, 'STCKMAVE',self.massave, 'Average stellar mass for stack'                      ;add param to hdr
     fxaddpar, newhdr, 'STCKMMIN',self.massmin, 'Minimum stellar mass for stack'                      ;add param to hdr
     fxaddpar, newhdr, 'STCKMMAX',self.massmax, 'Maximum stellar mass for stack'                      ;add param to hdr
     fxaddpar, newhdr, 'STCKMMLE',self.massmle, 'Maximum stellar mass for stack'                      ;add param to hdr
     fxaddpar, newhdr, 'STCKMSIG',self.masssig, 'Maximum stellar mass for stack'                      ;add param to hdr
  ENDIF                                                                                               ;end if masses provided
  
  spawn, 'rm tmp.fits'          ;get rid of temp file

  RETURN, newhdr
END
;====================================================================================================



;====================================================================================================
PRO specstack::save, xmystacked, xmyhdr, OUTFILE=outfile, OUTDIR=outdir


  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = self.outfile ;set default value
  IF keyword_set(OUTDIR) THEN outdir = string(outdir[0]) ELSE outdir = ' '      ;set default value
  
  chk = where(xmystacked.spec1d NE xmystacked.spec1d, COMPLEMENT=keep)
  IF (chk[0] NE -1) THEN xmystacked.lambdas = xmystacked.lambdas[keep]
  IF (chk[0] NE -1) THEN xmystacked.spec1d = xmystacked.spec1d[keep]
  IF (chk[0] NE -1) THEN xmystacked.spec1dwei = xmystacked.spec1dwei[keep]
  IF (chk[0] NE -1) THEN xmystacked.spec1dflag = xmystacked.spec1dflag[keep]

  outfile = strcompress(outdir + outfile, /REMOVE_ALL) ;append prefix
  mwrfits, xmystacked, outfile, xmyhdr, /CREATE        ;rewrite file with newhdr
  
END
;====================================================================================================



;====================================================================================================
PRO specstack::cleanup

                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION specstack::init, TWAVEGRID=twavegrid, TCOMMONGRID=tcommongrid, TNORMALIZE=tnormalize, $
                          TCONVOLVE=tconvolve, TREJECTION=trejection, TCOMBINATION=tcombination, $
                          ERRFLOOR=errfloor, $
                          KEYZ=keyz, KEYMASS=keymass, MASSES=masses, $
                          OUTFILE=outfile

                                ;self.data = ptr_new(data)
  
  self.ssobjver = 'v2-0-0'                                                                           ;code version
  IF keyword_set(TWAVEGRID) THEN self.twavegrid = twavegrid[0] ELSE self.twavegrid = 3               ;set default
  IF keyword_set(TCOMMONGRID) THEN self.tcommongrid = tcommongrid[0] ELSE self.tcommongrid = 1       ;set default
  IF keyword_set(TNORMALIZE) THEN self.tnormalize = tnormalize[0] ELSE self.tnormalize = 99          ;set default
  IF keyword_set(TCONVOLVE) THEN self.tconvolve = tconvolve[0] ELSE self.tconvolve = 99              ;set default
  IF keyword_set(TREJECTION) THEN self.trejection = trejection[0] ELSE self.trejection = 1           ;set default 
  IF keyword_set(TCOMBINATION) THEN self.tcombination = tcombination[0] ELSE self.tcombination = 1   ;set default 
  IF keyword_set(ERRFLOOR) THEN self.errfloor = errfloor[0] ELSE self.errfloor = 0.5                 ;set default 
  IF keyword_set(KEYZ) THEN self.keyz = keyz[0] ELSE self.keyz = 'z'                                 ;set default
  IF keyword_set(KEYMASS) THEN self.keymass = keymass[0] ELSE self.keymass = 'mass'                  ;set default
  IF keyword_set(MASSES) THEN self.masses = ptr_new(masses)                                          ;set default
  IF keyword_set(OUTFILE) THEN self.outfile = outfile[0] ELSE self.outfile = 'stacked_spectrum.fits' ;set default


  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO specstack__define

  void = {specstack, ssobjver:'A', nspec:0, specnames:ptr_new(), $
          masses:ptr_new(), massave:0.0, massmin:0.0, massmax:0.0, massmle:0.0, masssig:0.0, $
          keyz:'A', keymass:'A', $
          twavegrid:0, wavegrid:'A', minwave:0.0, maxwave:0.0, $
          tcommongrid:0, commongrid:'A', $
          tnormalize:0, normalize:'A', $
          tconvolve:0, convolve:'A', convolveval:0.0, $
          trejection:0, rejection:'A', $
          tcombination:0, combination:'A', errfloor:0.0, $
          outfile:'A'}

  RETURN
END
;====================================================================================================

