pro oband,x,y1,y2,border=border,_extra=_extra
;+
; ROUTINE:   oband
;
; USEAGE:    oband,x,y1,y2,border=border,color=color,spacing=spacing,$
;                  fill_pattern=fill_pattern,line_fill=line_fill,$
;                  pattern=pattern,orientation=orientation
;                  
;
; PURPOSE:   Over plot shaded band on an x-y plot.  Shaded region is
;            between y1 and y2 as a function of x.  This is useful for
;            indicating an error bounds on an x-y plot.  
;
; INPUTS:
;
; x          vector of x values (data coordinates)
; y1         vector of lower y values (data coordinates)
; y2         vector of upper y values (data coordinates)
; 
;            NOTE: y1 need not be smaller than y2. The shaded region
;                  always extends from y1 to y2 no matter which one is
;                  greater.
;
;            NOTE: If y1 or y2 is a scalor it will be used internally
;                  as if it were a constant value vector of the same
;                  length as x.
;
; OPTIONAL KEYWORDS:
;
;   border
;        if set, draw a border around the filled region, the numerical
;        value of BORDER is the color index used to draw the border
;    
;
; Keywords recognized by the POLYFILL procedure:
;
;   COLOR
;        color index used to fill region
;
;   LINE_FILL
;        Set this keyword to indicate that polygons are 
;        to be filled with parallel lines, rather than using 
;        solid or patterned filling methods.When using the 
;        line-drawing method of filling, the thickness, line-
;        style, orientation, and spacing of the lines may be 
;        specified with keywords.
;        
;   PATTERN
;        A rectangular array of pixels giving the fill 
;        pattern. If this keyword parameter is omitted, POLY-
;        FILL fills the area with a solid color. The pattern 
;        array may be of any size; if it is smaller than the 
;        filled area the pattern array is cyclically 
;        repeated.
;
;   SPACING
;        The spacing, in centimeters, between the parallel
;        lines used to fill polygons.
;        
;   ORIENTATION
;        Orientation angle of lines used to fill region.
;        
;Graphics Keywords Accepted
;
;        See Chapter 2, Graphics Keywords and System Variables, 
;        for the description of graphics and ploting keywords not 
;        listed above. CHANNEL CLIP DATA DEVICE LINE NOCLIP NORMAL 
;        T3D THICK Z.
; 
; EXAMPLE:
;
;        x=indgen(200)
;        y=randf(200,3)
;        y1=y+.1*(1.+randf(200,2)^2)
;        y2=y-.1*(1.+randf(200,2)^2)
;        plot,x,y
;        oband,x,y1,y2,color=100
;        oplot,x,y
;
;        plot,x,y
;        oband,x,y,0,/line_fill,orien=45,border=100
;
;
; DISCUSSION: If y1 and y2 are more than 1 element, make sure their
;             array lengths are the same as x.
;     
;
;  author:  Paul Ricchiazzi                            12apr93
;           Institute for Computational Earth System Science
;           University of California, Santa Barbara
;-

ny1=n_elements(y1)
ny2=n_elements(y2)
nx=n_elements(x)

if nx eq 0 then begin & xhelp,'oband' & return & end

if ny1 ne nx and ny1 ne 1 then message,'array length mismatch: y1, x'
if ny2 ne nx and ny2 ne 1 then message,'array length mismatch: y2, x'

if ny1 eq 1 then yy1=replicate(y1,nx) else yy1=y1
if ny2 eq 1 then yy2=replicate(y2,nx) else yy2=y2

xxx=[x,reverse(x)]
yyy=[yy1,reverse(yy2)]

dy=!y.crange(1)-!y.crange(0)
ymax=!y.crange(1)-0.01*dy
ymin=!y.crange(0)+0.01*dy

dx=!x.crange(1)-!x.crange(0)
xmax=!x.crange(1)-0.01*dx
xmin=!x.crange(0)+0.01*dx

yyy=(ymin > yyy) < ymax
xxx=(xmin > xxx) < xmax

polyfill,xxx,yyy,_extra=_extra

if n_elements(border) ne 0 then oplot,xxx,yyy,color=border

end
