FUNCTION summary, x, even=even

; ----------------------------------------------------------
;+
; NAME:
;       SUMMARY
;
; PURPOSE:
;       Tukey's five number summary of input data
;
; AUTHOR:
;       Simon Vaughan (U.Leicester) 
;
; CALLING SEQUENCE:
;       s = summary(x)
;
; INPUTS:
;       x      - (array) array of numbers
;
; OPTIONAL INPUTS:  
;       even   - (logical) pass forward to MEDIAN command
;
; OUTPUTS:
;       s      - (5 element array) 5 number summary
;
; OPTIONAL OUTPUTS:  
;       none
;
; DETAILS:
;       Calculate the Tukey's "five number summary" of
;       a data array (any dimension N > 0).
;       The output is a five element array listing
;        0 minimum
;        1 1st quartile ("lower hinge")
;        2 median
;        3 3rd quartile ("upper hinge")
;        4 maximum
;
;       See Sect 2C of Tukey, J. W. (1977) 
;        "Exploratory Data Analysis"
;
;       The returned values are of the same type as
;       the input array (e.g. float, integer, ...)
;       except when the EVEN keyword is used and the
;       number of data points is even, in which case
;       the output is floating point to allow for
;       the averaging implicit in the MEDIAN.
;
;       Calculating median:
;       The median is calculated using the build-in 
;       function MEDIAN. This has an optional keyword
;       EVEN. When EVEN is set and the number of elements
;       in X is even then the returned median is the mean
;       of the two middle values, otherwise if EVEN is
;       not set it is the N/2 value. When X contains an
;       odd number of elements its median is the (N-1)/2
;       element (recall than IDL labels elements 0,N-1).
;
;       Calculating quartiles:
;       The first and third quartiles are defined in the
;       following manner. The data are split into lower
;       and upper halves excluding the median value. The
;       median of the lower half is the first quartile,
;       the median of the upper half is the third quartile.
;       The medians are calculated as above.
;
;       See J Hyndman & Fan (1996, Am. Stat., 50, 361-365)
;       for discussion of methods for calculating quartiles.
;       
; EXAMPLE USAGE:
;        x = randomn(seed,100)
;        print,summary(x)
;
; HISTORY:
;        09/11/2007  --  v1.0  -- First working version
;
; NOTES:
;        + uses SORT. Non-sorting algorthm would be faster.
;        + or replace use of MEDIAN command with quicker 
;          function that makes use of pre-sorted data
;-
; ----------------------------------------------------------

; options for compilation (recommended by RSI)

  COMPILE_OPT idl2  
  
; watch out for errors

  on_error,2

; ---------------------------------------------------------
; Check arguments

  n = n_elements(x)
  if (n eq 0) then begin
      print,'** SUMMARY: Empty input array'
      return,0
  endif

; ---------------------------------------------------------
; Main routine

; is the input array even or odd in size?

  odd = n mod 2

; find type of input array (float, integer, ...)

  xtype = size(x,/type)


; if N = even and EVEN keyword is set then make sure
; output array is floating point. 

  if (odd eq 0) and keyword_set(even) then begin
      if (xtype eq 2) then xtype = 4
      if (xtype eq 3) then xtype = 5
  endif

; prepare 5 element array for output

  s = make_array(5,type=xtype)

; first sort the array in acending order

  indx = sort(x)
  xx = x[indx]

; find the minimum (put in all place in case N = 1

  s[0:4] = xx[0]

; find maximum (assuming N > 1)

  if (n gt 1) then s[3:4] = xx[n-1]

; find median

  s[2] = median(xx,even=keyword_set(even))

; find first/third quartile (if N >= 4)

  if (n gt 4) then begin
      mid = n/2 - 1
      s[1] = median(xx[0:mid],even=keyword_set(even))
      s[3] = median(xx[mid+1+odd:n-1],even=keyword_set(even))
  endif

; ---------------------------------------------------------
; Return to user

  return,s

END
