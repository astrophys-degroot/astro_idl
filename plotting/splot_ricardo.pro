pro splot, specfile, PS=ps, W1=w1, W2=w2, LINEID=lineid, Z=z, SPTYPE=sptype, $
           SMOOTH=smooth, _EXTRA=ee, LABZ=labz, NOLID=nolid, IDSPEC=idspec, $
           TELLURIC=telluric, SKY=sky, NOWAVE=nowave, NOFLUX=noflux, $
           NOBALMER=nobalmer
  
;+
;
; INPUT:
;
; SPECFILE: Input file name.
;
; OPTIONAL:
;
; PS: Set this keyword to  create postcript file.
; W1, W2: Ends of wavelength range to be plotted.
; Z: Redshift of input spectrum. If not set, then rest-frame is assumed.
; LINEID: set this keyword to show spectral features with labels.
; SPTYPE: if input file is in fits format, then set equal to 'fits'
; (DEFAULT option). If input file is in ascii format, then set equal to
; 'ascii'.
; SMOOTH: Smoothing box for spectrum.
; _EXTRA: Extra keywords and variables for plot.
; LABZ: Set this keyword to show redshift value.
; NOLID: Set this keyword to supress labels of spectral features.
; IDSPEC: Set this keyword equal to the ID name of the input spectrum 
; to be shown on graphic.
; TELLURIC: Set this keyword to display A- and B-band telluric
;                                          features.
; SKY: Set this keyword to display sky lines.
; NOWAVE: Set this keyword to suppress labels of wavelength axis.
; NOFLUX: Set this keyword to suppress labels of flux axis.
; NOBALMER: Set this keyword to suppress showing balmer line features.
;
; COMMENTS:
;
; Example of execution on the command line:
; splot,'g85_ap1c.dc.fits',/ps,w1=2700,w2=4700,/line
;
; For Gmos spectra, the IRAF 'listpix' task is useful to create an
; ascii format spectrum to be used with this procedure by setting 
; sptype='ascii'. 
;
; listpix spec_from_gmos.fits > spec_ascii.dat
;
; R. Demarco - UdeC - Aug 2011
;
;-

  on_error,2
  !except=2
  
  ;;;If no redshift is provided, then it assumes that is rest-frame:
  if n_elements(z) eq 0 then begin
     z=0.0
     xxtt='!6Wavelength (Angstroems) [Rest-frame]!3'
  endif else xxtt='!6Wavelength (Angstroems)!3'
  

  ;;;Setting y-axis title:
  if not keyword_set(noflux) then yytt='!6F!d!4k!n !6 (arbitrary units)!3' else yytt='   '
  

  ;;;Smoothing box - the default value is 7 pixels:
  if n_elements(smooth) eq 0 then smooth=7


  ;;;Setting default input file type to fits:
  if n_elements(sptype) eq 0 then sptype='fits'

; Reading spectrum according to format:

  if sptype eq 'fits' then begin
     readspec,specfile,w,f
     ps_name=strmid(specfile,0,strpos(specfile,'.fits'))+'.ps'
  endif

  if sptype eq 'ascii' then begin 
     readcol,specfile,w,f,f='d,d'
     ps_name=specfile+'.ps'
  endif

; Setting default plotting range in wavelength: 

  if n_elements(w1) eq 0 then w1=w(0)
  if n_elements(w2) eq 0 then w2=w(n_elements(w)-1)

; Range of plotted wavelength vector:

  w_range=where(w gt w1 and w lt w2)

; Normalizing spectrum:

  f_norm=f/max(f(w_range))

; Creating plot:

  print, ps_name
  if keyword_set(ps) then ps_start, ps_name;20, 15, /COL

  if not keyword_set(nowave) then plot,w,smooth(f_norm,smooth),thick=3, $
                                       xsty=1,ysty=1,xran=[w1,w2],xtit=xxtt, $
                                       ytit=yytt,charthick=3,xthick=3, $
                                       ythick=3,charsi=2,_extra=ee
  if keyword_set(nowave) then plot,w,smooth(f_norm,smooth),thick=3, $
                                   xsty=1,ysty=1,xran=[w1,w2],xtit=' ', $
                                   ytit=yytt,charthick=3,xthick=3, $
                                   ythick=3,charsi=2, $
                                   xtickname=replicate(' ',10),_extra=ee

 
  x1=!x.crange[0] & x2=!x.crange[1] & y1=!y.crange[0] & y2=!y.crange[1]
  
  if keyword_set(lineid) then begin

     ;col_ind2, 500
     ;colput, 180, 'violet'
     ;colput, 190, 'seagreen'
     
     ;;;Non Balmer lines:
     speclines=[3727.3,3834.0,3933.7,3968.5,4304.4,4958.91,5006.84,5167.33,5889.97]*(1.+z) 
     linst=[2,2,2,2,4,2,2,2,2,2]
     linlab=['!6[OII]!3','!6CN!3','!6K!3','!6H!3','!6G!3','!6[OIII]!3','!6[OIII]!3','!6Mg!3','!6Na!3']
     sl_range=where(speclines ge w1 and speclines le w2)
     
     for m=0, n_elements(speclines(sl_range))-1 do begin
        vline, speclines(sl_range(m)), LINESTYLE=linst(sl_range(m)), COLOR=253, /DATA ;,thick=3
     endfor
     if not keyword_set(nolid) then xyouts,speclines(sl_range)+7,y2+0.01*(y2-y1),linlab(sl_range), $
                                           charsi=0.9,orientation=90,charthick=2,col=253
     
     
     ;;;Balmer lines:
     if not keyword_set(nobalmer) then begin
        ballines=[6562.00,4863.00,4340.00,4101.7,3888.64,3797.50,3770.24,3749.76]*(1.+z)
        linstb=[4,4,4,4,4,4,4,4,4]
        linlabb=['!6Ha!3','!6Hb!3','!6H!4c!3','!6H!4d!3','!6H6!3','!6H8!3','!6H9!3','!6H10!3']
        slb_range=where(ballines ge w1 and ballines le w2)
        
        for m=0,n_elements(ballines(slb_range))-1 do begin
           vline,ballines(slb_range(m)), LINESTYLE=linstb(slb_range(m)), COLOR=251 ; ,thick=3
        endfor
        if not keyword_set(nolid) then xyouts,ballines(slb_range)+7,y2+0.01*(y2-y1),linlabb(slb_range), $
                                              charsi=0.9,orientation=90,charthick=2,col=251
        
     endif
     
; UV lines:
     
     uvlines=[2344.00,2374.00,2382.00,2586.00,2598.00,2803.00,2852.00]*(1.+z)
     linstuv=[3,3,3,3,3,3,3]
     linlabuv=['!6FeII!3','!6FeII!3','!6FeII!3','!6FeII!3','!6FeII!3','!6MgII!3','!6MgI!3']
     sluv_range=where(uvlines ge w1 and uvlines le w2, countuv)

     if countuv ne 0 then begin
        for m=0,n_elements(uvlines(sluv_range))-1 do vline,uvlines(sluv_range(m)), $
           lines=linstuv(sluv_range(m)),col=180,thick=3
        if not keyword_set(nolid) then xyouts,uvlines(sluv_range)+7,y2+0.01*(y2-y1), $ 
                                              linlabuv(sluv_range), charsi=0.9,orientation=90, $
                                              charthick=2,col=180
     endif
     
; Breaks:

     breaks=[2415.00,2565.00,2640.00,2900.00,3260.00,3646.00,4000.00]*(1.+z)
     brkst=[2,2,2,2,2,2,2]
     brklab=['!6B2415!3','!6B2565!3','!6B2640!3','!6B2900!3','!6B3260!3','!6B.Lim.!3','!6D4000!3']
     brk_range=where(breaks ge w1 and breaks le w2, countbrk)

     if countbrk ne 0 then begin
        for m=0,n_elements(breaks(brk_range))-1 do vline,breaks(brk_range(m)), $
           lines=brkst(brk_range(m)),col=190,thick=3
        if not keyword_set(nolid) then xyouts,breaks(brk_range)+7,y2+0.01*(y2-y1),brklab(brk_range), $
                                              charsi=0.9,orientation=90,charthick=2,col=190
     endif
     
  endif
  
; Labeling redshift:

  if keyword_set(labz) then legend,['!6z!3='+strtrim(z,2)],charsi=1.5,charthick=2,/top,/left,box=0

; Labeling spectrum ID:

  if n_elements(idspec) ne 0 then legend,['!6ID: '+strtrim(idspec,2)+'!3'],charsi=1.5,charthick=2,/bottom,/left,box=0

; Overplotting telluric features:

  if keyword_set(telluric) then begin
     colput,191,'magenta'
     tell_spec='~/iraf/templates/tellspec.fits'
     readspec,tell_spec,l_tell,f_tell
     oplot,l_tell,(y2-y1)*(f_tell-1.0)/2.+y2-0.0*(y2-y1),col=191,thick=4
     axis,w1,y2,xaxis=1,col=249,xthick=3,xtickname=replicate(' ',10),xticks=1,xminor=1
  endif

; Overplotting sky lines:

  if keyword_set(sky) then begin
     colput,192,'royalblue'
     sky_spec='~/iraf/templates/skyspec.fits'
     readspec,sky_spec,l_sky,f_sky
     oplot,l_sky,((y2-y1)*f_sky/(3.0*max(f_sky)))+y1,col=192,thick=4
     axis,w1,y1,xaxis=0,col=249,xthick=3,xtickname=replicate(' ',10),xsty=1
  endif

  if keyword_set(ps) then ps_end,/nos

end
