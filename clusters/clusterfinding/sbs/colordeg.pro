;C.O. Remco van de Berg as colorim
;"functionized" by Andrew Crooks as colorimg to return RGB array
function colordeg, dimi, cluster, clid, md

if ~keyword_set(dimi) then dimi = 2500 ;amount of pixels around BCG
FILTERS=["u","r","K"]



IM1=mrdfits(md+"/data/fits/newbigblu.fits",0,/fscale)        ;change these to image you download from my website
IM2=mrdfits(md+"/data/fits/newbiggre.fits",0,/fscale)
IM3=mrdfits(md+"/data/fits/newbigred.fits",0,/fscale)

xdim = 698/2
ydim = 788/2

;bcg in center, image dimensions are 5000x5000
IM1=IM1[xdim-dimi :xdim+dimi,ydim-dimi :ydim+dimi]            ;make cutouts around BCG
IM2=IM2[xdim-dimi :xdim+dimi,ydim-dimi :ydim+dimi]
IM3=IM3[xdim-dimi :xdim+dimi,ydim-dimi :ydim+dimi]

;these should work for u, r and K-bands
a=[20.,6.,5.]/5.
b=[-1.5,-1.5,-1.5]
c=[20.,2500.,2500.]

BINA=(asinh(IM1*a(0))+b(0))*c(0)
GINA=(asinh(IM2*a(1))+b(1))*c(1)
RINA=(asinh(IM3*a(2))+b(2))*c(2)

bl = where(BINA le 0.)
gl = where(GINA le 0.)
rl = where(RINA le 0.)

bh = where(BINA gt 255.)
gh = where(GINA gt 255.)
rh = where(RINA gt 255.)



if bl[0] ne -1 then BINA(where(BINA le 0.))=0.
if gl[0] ne -1 then GINA(where(GINA le 0.))=0.
if rl[0] ne -1 then RINA(where(RINA le 0.))=0.

if bh[0] ne -1 then BINA(where(BINA gt 255.))=255.
if gh[0] ne -1 then GINA(where(GINA gt 255.))=255.
if rh[0] ne -1 then RINA(where(RINA gt 255.))=255.


B=byte(BINA)
G=byte(GINA)
R=byte(RINA)

image=[[[R]],[[G]],[[B]]]

return, image

END
