;===================================================================================================
function uniformran, nvals, niter, DOUBLE=double, SEED=seed
  

;+
; NAME:
;       UNIFORMRAN()
;
; PURPOSE:
;       Create a 2D array of deviates drawn from the uniform
;       distribution. 
;
; CALLING SEQUENCE:
;       result = uniformran(integer, integer, [SEED=integer, /DOUBLE])
;      
; INPUTS:
;       nvals - number of values you wish drawn
;       niter - number of times you wish nvals drawn 
;
; OPTIONAL INPUTS:
;       seed - an interger in range [0,32767] to seed the deviate's draw
;
; KEYWORD PARAMETERS:
;       double - if the output need to be to double precison. 
;
; OUTPUTS:
;      an array of size nvals x niters filled with uniform deviates 
;
; OPTIONAL OUTPUTS:
;      NONE
;
; COMMON BLOCKS:
;      NONE 
;
; PROCEDURES USED:
;      IDL's randomu - draw from uniform distrbution 
;
; COMMENTS:
;      NONE
;
; EXAMPLES:
;      rands = uniformran(1000, 3, /DOUBLE, SEED=1234) will produce an
;      output array of uniform deviates of size 1000x3 produced using
;      randomu with a seed value of 1234 that are to
;      double precision.       
;
;
; MODIFICATION HISTORY:
;      A. DeGroot 2014-08-07 Univ. of California Riverside v2.0.0
;         -corrected error where seed value was changed appropriately
;         for multiple iterations
;      A. DeGroot 2012-06-01 Univ. of California Riverside v1.0.0
;         -first creation
;
; DESIRED UPGRADES
;      -could alter so that only 1 call to randomu is needed and then
;       you split that array but this could fail is the number of
;       requested deviates is too large
;
;-
  
  version = '2.0.0'


  IF niter EQ 1 THEN values = dblarr(nvals) ELSE values = dblarr(nvals, niter)                    ;create array
  time = systime(1, /SECONDS)                                                                     ;get time in seconds
  FOR aa=0, niter-1, 1 DO BEGIN                                                                   ;iterate
     time = time + 2145*aa                                                                        ;for multiple iterations
     IF keyword_set(SEED) THEN tseed = fix(aa*seed[0] mod 32767) ELSE tseed = fix(time mod 32767) ;get seed
     IF keyword_set(double) THEN values[*,aa] = randomu(tseed, nvals, /DOUBLE) ELSE $             ;cont next line
        values[*,aa] = randomu(tseed, nvals)                                                      ;get uniform deviates
  ENDFOR                                                                                          ;end iterate

  RETURN, values
end
;===================================================================================================
