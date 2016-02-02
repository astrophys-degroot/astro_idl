;+
; NAME:
;       GIRARDI2005()
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
PRO GIRARDI2005::getprop, GI05OBJVER=gi05objver

  print, self.gi05objver
  print, keyword_set(GI05OBJVER)
  IF keyword_set(GI05OBJVER) THEN gi05objver = self.gi05objver     ;return the data
  print, gi05objver

  RETURN
END
;====================================================================================================



;====================================================================================================
PRO GIRARDI2005::prepcalc, SCALE=scale

  COMPILE_OPT IDL2

  IF keyword_set(SCALE) THEN scale = float(scale[0]) ELSE scale = self.scale ;set default
  red                                                                        ;package for cosmology calculations
  c = 299792.0                                                               ;speed of light

  ;;;grab data
  ras = *self.ras               ;dereference data
  decs = *self.decs             ;dereference data
  zs = *self.zs                 ;dereference data


  ;;;convert from RA, Dec, redshfit to rf velocity and physical distance
  vels = c*zs                                                          ;velocities
  mybi = obj_new('beers1990', vels)                                    ;create object
  centervel = mybi.biweight()                                          ;find biweight of redshift
  obj_destroy, mybi                                                    ;destory object
  mybi = obj_new('beers1990', zs)                                      ;create object
  centerz = mybi.biweight()                                            ;find biweight of redshift
  obj_destroy, mybi                                                    ;destory object
  vrf = ((299792.0*zs) - centervel) / (1.0 + centerz) / 1000.0         ;rest frame velocity
  self.vrf = ptr_new(vrf)                                              ;store rest frame velocities
  gcirc, 2, self.centerra, self.centerdec, ras, decs, dists            ;calculate distance on sky from center
  dists = (dists * scale) / 1000                                       ;convert to physical Mpc
  self.distmpc = ptr_new(dists)                                        ;store distances from cluster center



  RETURN
END
;====================================================================================================


;====================================================================================================
PRO GIRARDI2005::figure2, BINSIZE=binsize, INCL=incl
   

  IF keyword_set(BINSIZE) THEN binsize = float(binsize[0]) ELSE binsize = 0.5 ;set default
  vrf = *self.vrf                                                             ;store rest frame velocities
  distmpc = *self.distmpc                                                     ;store distances from cluster center

  vrfpdf = histogram(vrf, LOCATION=vrfbins, BINSIZE=binsize, MIN=-4.0) ;find distribution
  vrfbins = [vrfbins[0]-binsize, vrfbins, vrfbins[-1]+binsize]         ;pad
  vrfpdf = [0,vrfpdf,0]                                                ;pad 

  ;;;plotting
  w = window(LOCATION=[150,75])                                                         ;window
  myplot = plot(vrfbins, vrfpdf, COLOR='black', /STAIRSTEP, $                           ;plot vrf hist
                XRANGE= [-4.0,4.0], $                                                   ;plot options
                YTITLE = '$N_{gal}$', $                                                 ;plot options
                YRANGE= [0.0,max(vrfpdf)+2], $                                          ;plot options
                /CURRENT, LAYOUT=[2,1,1], POSITION=[0.15,0.7,0.95,0.9], $               ;plot options
                XSHOWTEXT=0)                                                            ;plot options
  myplot = plot(vrf, distmpc, 'D', $                                                    ;plot vrf, dec
                XTITLE = '$V_{rf}$ [$10^3$ km $s^{-1}$]', $                             ;plot options
                XRANGE= [-4.0,4.0], $                                                   ;plot options
                YTITLE = 'Dist [Mpc]', $                                                ;plot options
                SYM_SIZE=1.25, SYM_THICK=1.5, $                                         ;plot options
                /CURRENT, LAYOUT=[2,1,2], POSITION=[0.15,0.1,0.95,0.7])                 ;plot options
  IF keyword_set(INCL) THEN myplot = plot(vrf[incl], distmpc[incl], '+', $              ;plot vrf, dec
                                          XTITLE = '$V_{rf}$ [$10^3$ km $s^{-1}$]', $   ;plot options
                                          XRANGE= [-4.0,4.0], $                         ;plot options
                                          YTITLE = 'Dist [Mpc]', $                      ;plot options
                                          SYM_SIZE=1.25, SYM_THICK=1.5, $               ;plot options
                                          /CURRENT, /OVERPLOT, $                        ;plot options
                                          LAYOUT=[2,1,2], POSITION=[0.15,0.1,0.95,0.7]) ;plot options





END
;====================================================================================================


;====================================================================================================
FUNCTION GIRARDI2005::reject, GAP=gap, PHYSBIN=physbin, DPHYSBIN=dphysbin, $
                              NGALMIN=ngalmin, NITERS=niters, FORGIVE=forgive

  ;;;set defaults
  IF keyword_set(GAP) THEN gap = (float(gap[0]) / 1000.0) ELSE gap = self.gap             ;set default
  IF keyword_set(PHYSBIN) THEN physbin = float(physbin[0]) ELSE physbin = self.physbin    ;set default
  IF keyword_set(DPHYSBIN) THEN dphysbin = float(dphysbin[0]) ELSE dphysbin = 0.1*physbin ;set default
  IF keyword_set(NGALMIN) THEN ngalmin = fix(ngalmin[0]) ELSE ngalmin = 15                ;set default
  IF keyword_set(NITERS) THEN niters = fix(niters[0]) ELSE niters = 15                    ;set default

  ;;;grab data
  vrf = *self.vrf               ;store rest frame velocities
  distmpc = *self.distmpc       ;store distances from cluster center

  
  ;;;do the rejection
  cnt = 0                                          ;start counter
  iter = 1                                         ;set flag
  nchk = n_elements(vrf)                           ;how many do we start with
  good = intarr(nchk)                              ;flag array
  good[*] = 1                                      ;all start as good
  WHILE ((cnt LT niters) AND (iter EQ 1)) DO BEGIN ;loop over iterations
     use = where(good EQ 1)                        ;get not cut one

     mvbin = 1                                                                         ;set flag
     nmvbin = 0                                                                        ;set another counter
     mindist = 0.0                                                                     ;start minimum distance
     maxdist = physbin                                                                 ;start maximum distance
     WHILE (mvbin EQ 1) DO BEGIN                                                       ;while we can move the spatial bin
        inbin = where((distmpc[use] GE mindist) AND (distmpc[use] LT maxdist), ninbin) ;how many in dist bin
        

        ;;;if not enought galaxies in teh bin
        IF ninbin LT ngalmin THEN BEGIN                                                      ;not enough galaxy in bin
           growbin = 1                                                                       ;set flag
           ngrowbin = 1                                                                      ;start counter
           WHILE (growbin EQ 1) DO BEGIN                                                     ;grow bin size until we have enough
              maxdist = maxdist + dphysbin*ngrowbin                                          ;new max for bin
              inbin = where((distmpc[use] GE mindist) AND (distmpc[use] LT maxdist), ninbin) ;bigger bin
              ngrowbin = ngrowbin + 1                                                        ;up counter
              IF ((ngrowbin GE 25) OR (ninbin GE ngalmin)) THEN growbin = 0                  ;switch flag
           ENDWHILE                                                                          ;end grow bin size
        ENDIF                                                                                ;end not enough galaxies in bin

        ;;;find any galaxy more that the gap away from a cluster member
        start = min(abs(vrf[use[inbin]]), startind)                    ;find close to rest frame velocity 
        IF (startind EQ 0) THEN minin = 0                              ;fail safe 
        IF (startind EQ ninbin-1) THEN maxin = ninbin-1                ;fail safe
        FOR xx=startind, 1, -1 DO BEGIN                                ;start searching down
           thegap = abs(vrf[use[inbin[xx]]] - vrf[use[inbin[xx-1]]])   ;the current gap
           IF thegap GT gap THEN BEGIN                                 ;if the gap is big enough
              minin = xx                                               ;save farthest
              good[use[inbin[0:xx-1]]] = 0                             ;cut the galaxies
              xx = 1                                                   ;cut the for loop short
           ENDIF ELSE minin = 0                                        ;end the gap is big enough
        ENDFOR                                                         ;stop searching down
        FOR xx=startind, ninbin-2, 1 DO BEGIN                          ;start searching up
           thegap = abs(vrf[use[inbin[xx]]] - vrf[use[inbin[xx+1]]])   ;the current gap
           IF thegap GT gap THEN BEGIN                                 ;if the gap is big enough
              maxin = xx                                               ;save farthest
              good[use[inbin[xx-1:-1]]] = 0                            ;cut the galaxies
              xx = ninbin-2                                            ;cut the for loop short
           ENDIF ELSE maxin = ninbin-1                                 ;end the gap is big enough
        ENDFOR                                                         ;stop searching up
        IF keyword_set(FORGIVE) THEN good[use[inbin[minin:maxin]]] = 1 ;if in in one bin

        ;;;determine new bin
        nmvbin = nmvbin + 1                                     ;up counter
        IF ((nmvbin GE 25) OR (maxdist GE 10.0)) THEN mvbin = 0 ;switch flag off
        mindist = (maxdist - mindist) * 0.5 + mindist           ;capture new minimum dist for bin
        maxdist = mindist + physbin                             ;calculate new max dist for bin
     ENDWHILE                                                   ;end can move spatial bin

     newchk = where(good EQ 1, nnewchk) ;find which points survive
     IF (nnewchk EQ nchk) THEN iter = 0 ;all points still there so stop  
     nchk = nnewchk
     cnt = cnt + 1              ;up counter
  ENDWHILE                      ;end loop over iterations

  chk = where(good EQ 1)                            ;find where it is good
  IF (chk[0] NE -1) THEN RETURN, chk ELSE RETURN, 0 ;return values
END
;====================================================================================================



;====================================================================================================
PRO GIRARDI2005::cleanup

  ptr_free, self.ras            ;
  ptr_free, self.decs           ;
  ptr_free, self.zs             ;
  ptr_free, self.distmpc        ;
  ptr_free, self.vrf            ;

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION GIRARDI2005::init, centerra, centerdec, ras, decs, zs, SCALE=scale, GAP=gap, PHYSBIN=physbin                            
  
  self.gi05objver = 'v0-0-1'    ;code version

  self.centerra = centerra      ;
  self.centerdec = centerdec    ;
  self.ras = ptr_new(ras)       ;
  self.decs = ptr_new(decs)     ;
  self.zs = ptr_new(zs)         ;

  IF keyword_set(SCALE) THEN self.scale = scale ELSE self.scale = 8.615                 ; Kpc / "
  IF keyword_set(GAP) THEN self.gap  = float(gap[0]) ELSE self.gap = 0.75               ;set default 10^3 km/s
  IF keyword_set(PHYSBIN) THEN self.physbin = float(physbin[0]) ELSE self.physbin = 0.5 ;set default Mpc


  
  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO GIRARDI2005__define

  void = {GIRARDI2005, gi05objver:'A', $
          CENTERRA:0.0, CENTERDEC:0.0, $
          RAS:ptr_new(), DECS:ptr_new(), ZS:ptr_new(), $
          DISTMPC:ptr_new(), VRF:ptr_new(), $
          SCALE:0.0, GAP:0.0, PHYSBIN:0.0}

  RETURN
END
;====================================================================================================

