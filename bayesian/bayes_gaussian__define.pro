;+
; NAME:
;       bayes_gaussian()
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
PRO bayes_gaussian::getprop, OBJVER=objver, DATA=data

  IF arg_present(OBJVER) THEN objver = self.bga_objver ;return the data
  IF arg_present(DATA) THEN data = *self.bga_xs        ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION bayes_gaussian::post2d, MUMIN=mumin, MUMAX=mumax, MIBINS=mubins, $
                                 SIGMIN=sigmin, SIGMAX=sigmax, SIGBINS=sigbins, $
                                 BUFFER=buffer

  IF keyword_set(BUFFER) THEN buffer = float(buffer[0]) ELSE buffer = 0.1 ;set default value


  ;;;retrieve data, metadata
  xdata = *self.bga_xs          ;dereference data
  ndata = n_elements(xdata)     ;how many points are there
  idata = min(xdata)            ;min of data
  adata = max(xdata)            ;max of data
  rdata = adata - idata         ;range of data
  
  IF keyword_set(MUMIN) THEN mumin = float(mumin[0]) ELSE mumin = idata - buffer*rdata ;set default
  IF keyword_set(MUMAX) THEN mumax = float(mumax[0]) ELSE mumax = adata + buffer*rdata ;set default
  IF keyword_set(MUBINS) THEN mubins = ulong(mubins[0]) ELSE mubins = 500              ;set default
  IF keyword_set(SIGMIN) THEN sigmin = float(sigmin[0]) ELSE sigmin = 0.00001*rdata    ;set default
  IF keyword_set(SIGMAX) THEN sigmax = float(sigmax[0]) ELSE sigmax = rdata            ;set default
  IF keyword_set(SIGBINS) THEN sigbins = ulong(sigbins[0]) ELSE sigbins = 500          ;set default


  ;;;prepare array
  mus = self.mkarray(mumin, mumax, mubins)     ;mu array
  nmus = n_elements(mus)                       ;number of mus
  sigs = self.mkarray(sigmin, sigmax, sigbins) ;sigma array
  nsigs = n_elements(sigs)                     ;number of sigs
  
  ;;;pre-calculations
  jlike = dblarr(nmus, nsigs)   ;joint likelihood array

  ;;;probability
  FOR xx=0UL, nsigs-1, 1 DO BEGIN                                       ;loop over width
     cons = (-1.0*ndata) * alog(sigs[xx]*(2.0*!pi)^0.5)                 ;const in log space
     denom = -1.0 / (2.0 * sigs[xx]^2)                                  ;denominator
     FOR yy=0UL, nmus-1, 1 DO BEGIN                                     ;loop over central val
        numer = total((xdata - mus[yy])^2)                              ;numerator
        val = (numer*denom) + cons                                      ;joint likelihood
        IF (val EQ val) THEN jlike[yy,xx] = val ELSE jlike[yy,xx] = 0.0 ;store likelihood
     ENDFOR                                                             ;loop over central val
  ENDFOR                                                                ;end loop over width
  maxjl = max(jlike)                                                    ;find max value
  jlike = jlike - maxjl                                                 ;normalize to max value
  jlike = exp(jlike)                                                    ;out of log space

  RETURN, {mus:mus, sigmas:sigs, jointlike:jlike}
END
;====================================================================================================



;====================================================================================================
PRO bayes_gaussian::cleanup

  ptr_free, self.bga_xs
  
  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION bayes_gaussian::init, tmpxs                           
  
  self.bga_objver = 'v1-0-0'                                 ;code version
  self.bga_xs = ptr_new(tmpxs)                               ;store values
    
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO bayes_gaussian__define

  void = {bayes_gaussian, inherits bayes_common, $
          bga_objver:'A', bga_xs:ptr_new()}

  RETURN
END
;====================================================================================================

