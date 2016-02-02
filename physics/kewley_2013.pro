;========================================================================================================================
function KEWLEY_2013, model, redshift, $
                      NPTS=npts, XMIN=xmin, XMAX=xmax


;+
; NAME:
;       KEWLEY_2013()
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
;       A. DeGroot, 2015 March 25, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-
  version = '1.0.0'

  
  ;;;defaults
  IF keyword_set(NPTS) THEN npts = npts[0] ELSE npts = 500.0 ;set default
  IF keyword_set(XMIN) THEN xmin = xmin[0] ELSE xmin = -2.0  ;set default
  IF keyword_set(XMAX) THEN xmax = xmax[0] ELSE xmax = 0.99  ;set default


  mixvals = [{model:1, redshift:0.0, which:'mixing', bound:'l', a:0.034, b:1.447, c:-0.986, d:0.0, xmin:-0.45, xmax:0.29, ymin:-0.90, ymax:0.38}, $
             {model:1, redshift:0.0, which:'mixing', bound:'u', a:0.885, b:-0.792, c:-6.712, d:0.0, xmin:-0.45, xmax:-0.12, ymin:-0.20, ymax:0.91}, $
             {model:1, redshift:1.5, which:'mixing', bound:'l', a:0.034, b:1.447, c:-0.986, d:0.0, xmin:-0.45, xmax:0.29, ymin:-0.90, ymax:0.38}, $
             {model:1, redshift:1.5, which:'mixing', bound:'u', a:1.027, b:0.902, c:-0.837, d:0.0, xmin:-0.61, xmax:-0.12, ymin:0.16, ymax:0.91}] ;, $
                                ;{model:2, redshift:1.5, which:'mixing', bound:'l', a:, b:, c:, d:, xmin:, xmax:, ymin:, ymax:}, $
                                ;{model:2, redshift:1.5, which:'mixing', bound:'u', a:, b:, c:, d:, xmin:, xmax:, ymin:, ymax:}, $
                                ;{model:3, redshift:1.5, which:'mixing', bound:'l', a:, b:, c:, d:, xmin:, xmax:, ymin:, ymax:}, $
                                ;{model:3, redshift:1.5, which:'mixing', bound:'u', a:, b:, c:, d:, xmin:, xmax:, ymin:, ymax:}, $
                                ;{model:4, redshift:1.5, which:'mixing', bound:'l', a:, b:, c:, d:, xmin:, xmax:, ymin:, ymax:}, $
                                ;{model:4, redshift:1.5, which:'mixing', bound:'u', a:, b:, c:, d:, xmin:, xmax:, ymin:, ymax:} ]

  
  ;;;get specific cases
  find = [-1,-1]
  find[0] = where((model EQ mixvals.model) AND (redshift EQ mixvals.redshift) AND (mixvals.which EQ 'mixing') AND (mixvals.bound EQ 'l')) ;meet criteria
  find[1] = where((model EQ mixvals.model) AND (redshift EQ mixvals.redshift) AND (mixvals.which EQ 'mixing') AND (mixvals.bound EQ 'u')) ;meet criteria

  FOR xx=0, 1, 1 DO BEGIN                                     ;loop over both
     IF (find[xx] NE -1) THEN BEGIN                           ;if a match found
        IF (xx EQ 0) THEN coeffs1 = mixvals[find[xx]]         ;grab match
        IF (xx EQ 1) THEN coeffs2 = mixvals[find[xx]]         ;grab match
     ENDIF ELSE BEGIN                                         ;if no match found
        print, 'WARNING!! No match set of parameters found!!' ;print info
        stop                                                  ;stop run
     ENDELSE                                                  ;end more than one match
  ENDFOR                                                      ;end loop over both
  

  ;;;find the place where the models change over
  xs = indgen(npts)*((xmax-xmin)/npts) + xmin                                ;create an array of xs
  tmpmys1 = coeffs1.a + coeffs1.b*xs + coeffs1.c*xs^2 + coeffs1.d*xs^3       ;find full range of lower mixing
  tmpmys2 = coeffs2.a + coeffs2.b*xs + coeffs2.c*xs^2 + coeffs2.d*xs^3       ;find full range of upper mixing
  tmpsfys1 = (1.1) +  (0.61 / (xs + 0.08))                                   ;find full range of lower star forming
  tmpsfys2 = (1.1 + 0.03*redshift) +  (0.61 / (xs + 0.08 - 0.1833*redshift)) ;find full range of upper star forming
  chk = min(abs(tmpmys1-tmpsfys1), break1)                                   ;find NII/Halpha value where lower equal
  chk = min(abs(tmpmys2-tmpsfys2), break2)                                   ;find NII/Halpha value where upper equal
  chk = min(abs(xs-coeffs1.xmax), mmax1)                                     ;find NII/Halpha value where lower mixing is valid 
  chk = min(abs(xs-coeffs2.xmax), mmax2)                                     ;find NII/Halpha value where upper mixing is valid
  nlm = mmax1-break1                                                         ;number of lower mixing points
  num = mmax2-break2                                                         ;number of upper mixing points


  ;;;create model values
  bptmodel = {lsfxs:fltarr(break1+1), lsfys:fltarr(break1+1), usfxs:fltarr(break2+1), usfys:fltarr(break2+1), $ ;cont next line
              lmixxs:fltarr(nlm), lmixys:fltarr(nlm), umixxs:fltarr(num), umixys:fltarr(num)}                   ;output structure

  ;;;mixing sequence
  bptmodel.lmixxs = xs[break1:mmax1-1]                                                                                ;x values
  bptmodel.lmixys = coeffs1.a + coeffs1.b*bptmodel.lmixxs + coeffs1.c*bptmodel.lmixxs^2 + coeffs1.d*bptmodel.lmixxs^3 ;yvalues
  bptmodel.umixxs = xs[break2:mmax2-1]                                                                                ;x values
  bptmodel.umixys = coeffs2.a + coeffs2.b*bptmodel.umixxs + coeffs2.c*bptmodel.umixxs^2 + coeffs2.d*bptmodel.umixxs^3 ;yvalues

  ;;;star forming sequence
  bptmodel.lsfxs = xs[0:break1]                                                                ;x values
  bptmodel.lsfys = (1.1) +  (0.61 / (bptmodel.lsfxs + 0.08))                                   ;yvalues
  bptmodel.usfxs = xs[0:break2]                                                                ;x values
  bptmodel.usfys = (1.1 + 0.03*redshift) +  (0.61 / (bptmodel.usfxs + 0.08 - 0.1833*redshift)) ;yvalues
  
  
  RETURN, bptmodel
END
;========================================================================================================================
