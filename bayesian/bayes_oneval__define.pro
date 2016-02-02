;+
; NAME:
;       bayes_oneval()
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
PRO bayes_oneval::getprop, OBJVER=objver

  IF arg_present(OBJVER) THEN objver = self.bov_objver ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO bayes_oneval::mpv, MPV=mpv, DMPV=dmpv, NXS=nxs, MAXITER=maxiter

  IF keyword_set(NXS) THEN nxs = ulong(nxs[0]) ELSE nxs = 500UL           ;set default value
  IF keyword_set(MAXITER) THEN maxiter = fix(maxiter[0]) ELSE maxiter = 10 ;set default value


  ys = *self.bov_ys                                            ;dereference values
  dys = *self.bov_dys                                          ;dereference values
  ysmin = min(ys, mysind)                                      ;find min value given
  minxs = min(ys) - 0.005                                      ;go lower
  ysmax = max(ys, mysind)                                      ;find max value given
  maxxs = max(ys) + 0.005                                      ;go higher

  cnt = 0                                                   ;start counter
  pass = 0                                                  ;pass flag
  WHILE ((cnt LT maxiter) AND (pass EQ 0)) DO BEGIN         ;start iterating
     xs = (maxxs-minxs) * ulindgen(nxs + 1) / (nxs) + minxs ;get x values

     FOR xx=0, n_elements(ys)-1, 1 DO BEGIN                      ;loop over points
        like = -1.0*((xs - ys[xx])^2 / (2.0*dys[xx]^2))          ;likelihood in log space
        IF (xx NE 0) THEN jlike = jlike + like ELSE jlike = like ;joint likelihood in log space
     ENDFOR                                                      ;end loop over points

     maxjlike = max(jlike, maxind) ;find highest value
     jlike = jlike - jlike[maxind] ;subtract highest value
     jlike = exp(jlike)            ;out of log space
     
     chk = where(jlike GT 0.0001)                                             ;check for real points
     IF (n_elements(chk) LT 25) THEN BEGIN                                    ;if not enough real measurements
        IF (chk[0] NE -1) THEN BEGIN                                          ;at least one real point
           minind = min(chk)                                                  ;find lowest position index
           newminind = fix(minind - 0.1*nxs)                                  ;pad lower bound index
           IF newminind LT 0 THEN newminind = 0                               ;sanity check lower bound index
           minxs = xs[newminind]                                              ;new lower bound value
           maxind = max(chk)                                                  ;find highest real position index
           newmaxind = fix(maxind + 0.1*nxs)                                  ;pad upper bound index
           IF newmaxind GT n_elements(xs)-1 THEN newmaxind = n_elements(xs)-1 ;sanity check upper bound index
           maxxs = xs[newmaxind]                                              ;new upper bound
        ENDIF ELSE BEGIN                                                      ;end no real point
           print, 'WARNING!! Something has gone horribly wrong!!'             ;print info
           print, '  There should always be at least one point'               ;print info
        ENDELSE                                                               ;end no real point
     ENDIF ELSE pass = 1                                                      ;end enough real points
     cnt = cnt + 1                                                            ;up counter
  ENDWHILE                                                                    ;end iteration

  maxjlike = max(jlike, maxind) ;find highest value
  mpv = xs[maxind]              ;get most prob value
  errors = sigmas(xs, jlike)    ;get 1sig errors
  dmpv = mean(errors)           ;get average error
  
  RETURN
END
;====================================================================================================



;====================================================================================================
PRO bayes_oneval::cleanup

  ptr_free, self.bov_ys
  ptr_free, self.bov_dys
  ;ptr_free, self.bov_xs
  ;ptr_free, self.bov_dxs

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION bayes_oneval::init, tmpys, tmpdys, TMPXS=tmpxs, TMPDXS=tmpdxs                            
  
  self.bov_objver = 'v1-0-0'                                 ;code version
  self.bov_ys = ptr_new(tmpys)                               ;store values
  self.bov_dys = ptr_new(tmpdys)                             ;store values
  IF keyword_set(TMPXS) THEN self.bov_xs = ptr_new(tmpxs)    ;store values
  IF keyword_set(TMPDXS) THEN self.bov_dxs = ptr_new(tmpdxs) ;store values
  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO bayes_oneval__define

  void = {bayes_oneval, bov_objver:'A', bov_ys:ptr_new(), bov_dys:ptr_new(), $
          bov_xs:ptr_new(), bov_dxs:ptr_new()}

  RETURN
END
;====================================================================================================

