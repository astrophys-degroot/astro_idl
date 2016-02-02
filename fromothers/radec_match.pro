pro radec_match, ra1, dec1, ra2, dec2, m1, m2, ep, allow, miss1, SILENT=silent
;+
; NAME:
; close_match_radec
;
; PURPOSE:
; this will find close matches between 2 sets of points (ra1,dec1)
; and (ra2,dec2) (note ra1,ra2,dec1,dec2 are all arrays) in ra dec space.
; 
; CALLING SEQUENCE:
; close_match_radec,ra1,dec1,ra2,dec2,m1,m2,ep,allow,miss1
;
; INPUTS:
; ra1,dec1: the ra dec of the first set
; ra2,dec2: the ra dec of the second set
; ep:  this is the error which defines a close match. A pair is considered
; a match if their spherical separation is <= ep.
; allow: how many matches in the (ra2,dec2) space will you allow for
; each (ra1,dec1)
;
; OUTPUTS:
; m1,m2: the indices of the matches in each space. That is  
; (ra1(m1),dec1(m1)) matches (ra2(m2),dec2(m2))
; miss1: this gives the index of the things in x1 NOT found to match (optional)
;
; OPTIONAL KEYWORD PARAMETERS:
; none
;
; NOTES:
; It sorts the ra2 list so that it can do a binary search for each ra1.
; It then carves out the sublist of ra2 where it is off by less than ep.
; It then only searches that sublist for points where dec1 and dec2 differ
; by less than ep. 
; PROCEDURES CALLED:
; binary_search, rem_dup
; REVISION HISTORY:
; written by David Johnston -University of Michigan June 97
;
;   Tim McKay August 97
; 	bug fixed, matcharr extended to "long" to accomodate ROTSE I images
;   Tim McKay 6/23/98
;	Altered to be an ra dec match, with appropriate scaling of ra range...
;   Tim McKay 7/8/99
;	Altered to order matches by distance, rather than just ra dec distance
;   Erin Scott Sheldon 08-Mar-2001
;       Made code human readable. Fixed bug where miss1 was not returned
;       when no matches found.
;   E.S.S.  Fixed bug where some matches could be returned outside of the
;           requested distance cut.  10-June-2004
;   A. DeGroot 2013 April 16
;        -Improved performance???
;        -Updated all possible data types to ulong or long to
;             accomodate Spitzer SERVS catalogs
;
;
;  Copyright (C) 2006  Dave Johnston
;
;    This program is free software; you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation; either version 2 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program; if not, write to the Free Software
;    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;
;

 On_error,2                                      ;Return to caller

 if N_params() LT 8 then begin
    print,'Syntax - close_match, ra1, dec1, ra2, dec2, m1, m2, ep, allow, miss1, silent=silent'
    return
 endif
 
 ;;;first sort out the allowed epsilons in ra and dec
 
 n1 = n_elements(ra1)                                                                     ;# of detections in first list
 IF n1 NE n_elements(dec1) THEN print, 'RA1 and DEC1 have different number of elements!!' ;warning
 n2 = n_elements(ra2)                                                                     ;# of detections in second list
 IF n2 NE n_elements(dec2) THEN print, 'RA2 and DEC2 have different number of elements!!' ;warning
 
 
 matcharr = ulonarr(n1,allow)	;the main book-keeping device for 
 matcharr(*,*) = -1		;matches initialized to -1
 
 ind = ulindgen(n2)             ;indices for second list
 sortind = bsort(ra2)           ;sort ra2 array
 ra2sorted = ra2[sortind]       ;sorted ra2 array
 dec2sorted = dec2[sortind]     ;sorted dec2 array
 ind = ind[sortind]             ;keep track of index
 
 endra2 = ra2sorted[n2-1]       ;highest RA2 value
 runi = 0UL                     ;index of some sort???
 
 epdec = ep                       ;error in Dec, a constant
 epra = ep / cos(dec1*0.01745329) ;errors in RA, one for each detection
 ra1minus = ra1 - epra            ;sets the low bound for RA search
 ra1plus = ra1 + epra             ;sets high bound for RA search
 
 print, 'Running through detections (RA1,Dec1) and finding matches'             ;
 FOR ii=0Ul, n1-1L, 1 DO BEGIN                                                  ;the main top level loop over ra1
    IF NOT keyword_set(silent) THEN IF ii MOD 5000 EQ 0 THEN print, ii, '/', n1 ;progress indicator
    binary_search, ra2sorted, ra1minus[ii], ind1                                ;search for the first good one
    
    case ind1 of                                    ;check the search result
       -1 : IF ra1minus[ii] LT endra2 THEN ind1 = 0 ;in case ra1minus smaller than all ra2 but still may be matches
       ELSE : BEGIN                                 ;alternative
          
          ;;;we have the first match in the sorted list. Look at 
          ;;;objects that come after until we find no more matches
          
          ind2 = long(ind1)
          jj = ind2+1
          WHILE jj LT n2 DO BEGIN 
             IF ra2sorted[ind2+1] LT ra1plus[ii] THEN BEGIN 
                ind2 = ind2+1
                jj = jj+1
             ENDIF ELSE jj=n2
          ENDWHILE 
          IF (n2 EQ 1) THEN ind2 = 0          
          
          
          ;;;WHILE loop carved out sublist to check, now find and check that sublist          
          IF ind1 LE ind2 THEN BEGIN         ;safety check
             dec2check=dec2sorted[ind1:ind2] ;the dec values to check
             ra2check=ra2sorted[ind1:ind2]   ;ra values to check
             
             decoffby = abs(dec2check-dec1[ii])
             raoffby = abs(ra2check-ra1[ii])
             good1 = where( (decoffby LT epdec) AND (raoffby LT epra), ngood1) + ind1
             IF ngood1 GT 0 THEN BEGIN 
                
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                ;; Above was only a square cut
                ;; Get those that are actually within the
                ;; requested radius. E.S.S. 10-June-2004
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                
                offby = sphdist(ra1[ii], dec1[ii], ra2sorted[good1], dec2sorted[good1], /DEGREES)
                good_offby = where(offby LE ep, ngood2)
                
                IF ngood2 NE 0 THEN BEGIN    ;check that we have close possibilities
                   good1 = good1[good_offby] ;subset
                   offby = offby[good_offby] ;subset
                   
                   IF ngood2 GT allow THEN BEGIN  ;check we don't have too many close possibilities
                      good1 = good1[bsort(offby)] ;sort by closeness 
                      ngood2 = allow              ;not more than you are allowed by 'allow' 
                      good1 = good1[0:allow-1]    ;limit to # allowed                         
                   ENDIF                          ;end if on too many close possibilities
                   
                   matcharr[ii,0:ngood2-1] = good1 ;finally the matches are entered in
                   runi = runi+ngood2              ;running total up one    
                ENDIF                              ;end if on spherical distances cut
                
             ENDIF              ;end if on ngood GT 0
          ENDIF                 ;end if on safety check of ind1 lt ind2  
       END                      ;end if on ind1 ne -1
    ENDCASE                     ;end case of ind1 value
 ENDFOR                         ;end loop over ra1 
 
 
 IF NOT keyword_set(silent) THEN print, 'Total put in bytarr:', runi
 matches = where(matcharr ne -1, nmatches)
 IF nmatches EQ 0 THEN BEGIN
    IF NOT keyword_set(silent) then print, 'No matches found!!'
    miss1 = ulindgen(n1)
    m1 = -1 
    m2 = -1
    return
 ENDIF
 m1 = matches mod n1            ;a neat trick to extract them correctly 
 m2 = matcharr[matches]         ;from the matcharr matrix
 IF NOT keyword_set(silent) THEN print, 'Number of matches:', n_elements(m1)
 m2 = ind[m2]                   ;remember, must unsort
 dif = m1[uniq(m1,bsort(m1))]
 IF NOT keyword_set(silent) THEN print, 'Number of different matches:',  n_elements(dif)
 IF N_PARAMS() EQ 9 THEN BEGIN
    If n_elements(m1) lt n1 THEN BEGIN
       miss1 = ulindgen(n1)
       remove, dif, miss1
       IF NOT keyword_set(silent) THEN print, 'Number of misses: ', n_elements(miss1)
    ENDIF ELSE BEGIN
       miss1 = -1  
       IF NOT keyword_set(silent) then print, 'No misses!!'
    ENDELSE 
 ENDIF
 return
end





