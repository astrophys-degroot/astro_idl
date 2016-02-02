;;;===========================================================================================================
pro graphreset, num
  
  COMMON graphing, graphops
  
  graphops = {tt: ' ',  $
              thick: 4.0, $
              xxtt: ' ', $
              xmin: 0.0, $
              xmax: 1.0, $
              xsty: 1.0, $
              xthick: 2.0, $
              yytt: '', $
              ymin: 0.0, $
              ymax: 1.0, $
              ysty: 1.0, $
              ythick: 2.0, $
              cs: 1.0, $
              charthick: 2.0, $
              charsize: 1.0, $
              xticks: 2, $
              xticklen: 0.05, $
              xtickv: [17000.0, 17500.0, 18000.0], $
              xtickname: ['17200', '17450', '17700'], $
              linethick: 4.0 }
  
end
;;;===========================================================================================================




;;;===========================================================================================================
pro linesreset, num

  COMMON lining, lines

  lines = {balmer: 'no', $
           nonbalmer: 'no', $
           ysky: 'no', $
           jsky: 'no', $
           hsky: 'no', $
           ksky: 'no', $
           shadesky: 'no', $
           masksky: 'no', $
           ids: 'yes'}
  
end
;;;===========================================================================================================




;;;===========================================================================================================
pro datareset, num

  ;COMMON dataing, data, datasave
    
end
;;;===========================================================================================================




;;;===========================================================================================================
function readasfits, file, EXTEN=exten, APER=aper, BAND=band
  
  if keyword_set(EXTEN) then exten = exten[0] else exten = 0 ;sets new value 
  if keyword_set(BAND) then band = band[0] else band = 0     ;set new value
  if keyword_set(APER) then aper = aper[0] else aper = 0     ;set new value
  
  
  print, ' '                                             ;spacer
  im = mrdfits(file , 0, hdr, /SILENT)                   ;
  imsize = size(im)                                      ;
  case imsize[0] of                                      ;
     1 : begin                                           ; 
        print, '  Only 1 dimension in file'              ;
        zdata = {hdr:hdr, lambda:im, flux:im}            ;
     end                                                 ;
     2 :begin                                            ;
        print, '  Two dimensions in file'                ;
     end                                                 ;
     else : begin                                        ;
        ;print, 'Something has gone horribly wrong!!'     ;
        ;print, 'Taking first spectra!!'
        zdata = {hdr:hdr, lambda:im, flux:im} ;
     end                                                 ;
  endcase                                                ;
  
  
  print, ' '                    ;spacer
  return, zdata
end
;;;===========================================================================================================




;;;===========================================================================================================
function readasascii, file
  
  readcol, zfile, w, f, FORMAT='d,d'
  ps_name=zfile+'.ps'
  
  
end
;;;===========================================================================================================




;;;===========================================================================================================
function makelambda, zdata
  
  l0 = fxpar(zdata.hdr,'CRVAL1')
  x0 = fxpar(zdata.hdr,'CRPIX1')
  dl = fxpar(zdata.hdr,'CD1_1', COUNT=cc)
  case cc of
     0 : dl = fxpar(hdr,'CDELT1')
     1 : dl = dl
     else : begin
        print, ' More than one value found in header!'
        print, '  Something is very wrong!'
     end
  endcase
  zlambda = indgen(n_elements(zdata.flux))
  zlambda = double(zlambda)
  zlambda = dl*(zlambda-x0+1.0)+l0
 

  zdata.lambda = zlambda
  return, zdata
end 
;;;===========================================================================================================




;;;===========================================================================================================
function smoothing, zdata, WIDTH=width
  
  if keyword_set(WIDTH) then width = width[0] else width = 7 ;set new value
  zdata.flux = poly_smooth(zdata.flux, width)
  
  return, zdata 
end
;;;===========================================================================================================




;;;===========================================================================================================
function plotting
  if keyword_set(plt) then begin
     unit=sxpar(h,'BUNIT')
     norm=1.d-18
     siz=size(unit) & if siz(1) eq 7 then ytit='!6 10!u-18!n '+unit+'!3' else ytit=''
;     plot,l,f/norm,xtit='!6Wavelength (!3'+STRING("305B)+'!6)!3', ytit=ytit, _EXTRA=ee, ysty=2, xsty=1'
  endif
 
end
;;;===========================================================================================================




;;;===========================================================================================================
function normalized, zdata

  print, ' Havent done this yet'


end
;;;===========================================================================================================



;;;===========================================================================================================
pro plotbalmer, zfeat

  COMMON graphing, graphops
  COMMON lining, lines
  
  loadct, 12
  
  balmerlines = balmer(zfeat)
  check = where((balmerlines.lines GT graphops.xmin) AND (balmerlines.lines LT graphops.xmax), ncheck)
  fakey = [graphops.ymin, graphops.ymax]
  if ncheck ne 0 then begin
     case lines.ids of 
        'yes'  : begin
           for xx=0, n_elements(check)-1, 1 do begin
              oplot, [balmerlines.lines[check[xx]],balmerlines.lines[check[xx]]], fakey, $
                     LINESTYLE = 4, $
                     THICK = graphops.linethick, $
                     COLOR = 200
              xyouts, balmerlines.lines[check[xx]]+1, graphops.ymax+0.01*(graphops.ymax-graphops.ymin), $
                      balmerlines.names[check[xx]], $
                      CHARSIZE = 0.9, $
                      ORIENTATION = 90, $
                      CHARTHICK = 2, $
                      COLOR = 200

           endfor
        end
        'no' : begin
           for xx=0, n_elements(check)-1, 1 do begin
              oplot, [balmerlines.lines[check[xx]],balmerlines.lines[check[xx]]], fakey, $
                     LINESTYLE=4, $
                     THICK=graphops.linethick, $
                     COLOR = 200
           endfor
        end
        else : print, 'Something has gone horribly wrong!!'
     endcase
  endif
  
end
;;;===========================================================================================================




;;;===========================================================================================================
pro plotnonbalmer, zfeat

  COMMON graphing, graphops
  COMMON lining, lines
  
  loadct, 12

  nonbalmerlines = nonbalmer(zfeat)
  check = where((nonbalmerlines.lines GT graphops.xmin) AND (nonbalmerlines.lines LT graphops.xmax), ncheck)
  if ncheck NE 0 then begin
     fakey = [graphops.ymin, graphops.ymax]
     case lines.ids of 
        'yes'  : begin
           for xx=0, n_elements(check)-1, 1 do begin
              oplot, [nonbalmerlines.lines[check[xx]],nonbalmerlines.lines[check[xx]]], fakey, $
                     LINESTYLE=4, $
                     THICK=graphops.linethick, $
                     COLOR = 100
              
              xyouts, nonbalmerlines.lines[check[xx]]+1, graphops.ymax+0.01*(graphops.ymax-graphops.ymin), $
                      nonbalmerlines.names[check[xx]], $
                      CHARSIZE = 0.8, $
                      ORIENTATION = 90, $
                      CHARTHICK = 2, $
                      COLOR = 100
              
           endfor
        end
        'no' : begin
           for xx=0, n_elements(check)-1, 1 do begin
              oplot, [nonbalmerlines.lines[check[xx]],nonbalmerlines.lines[check[xx]]], fakey, $
                     LINESTYLE = 4, $
                     THICK = graphops.linethick, $
                     COLOR = 100

           endfor
        end
        else : print, 'Something has gone horribly wrong!!'
     endcase
  endif
  
end
;;;===========================================================================================================




;;;===========================================================================================================
pro plothsky, num, zdata
  
  COMMON graphing, graphops
  ;speclines, 1
  
  loadct, 0
  
  hskylines = hsky(1)
  check = where((hskylines.lines GT graphops.xmin) AND (hskylines.lines LT graphops.xmax), ncheck)
  if ncheck NE 0 then begin
     case num of
        1 : begin
           fakey = [graphops.ymin, graphops.ymax]
           for xx=0, ncheck-1, 1 do begin
              oplot, [hskylines.lines[check[xx]],hskylines.lines[check[xx]]], fakey, $
                     THICK=graphops.linethick
           endfor
        end
        2 : begin
           fakey = [graphops.ymin, graphops.ymax, graphops.ymax, graphops.ymin, graphops.ymin]
           fakex = fakey
           for xx=0, ncheck-1, 1 do begin
              fakex[0:1] = hskylines.lower[check[xx]]
              fakex[2:3] = hskylines.upper[check[xx]]
              fakex[4] = hskylines.lower[check[xx]]
              polyfill, fakex, fakey, COLOR=200, /DATA
           endfor
           
        end
        3 : begin
           print, '  Now we need to mask the sky lines'
           check1 = min(abs(zdata.lambda - graphops.xmin), minsub1)
           for xx=0, ncheck-1, 1 do begin
              delta = hskylines.widths[check[xx]] / 2.0
              check2 = min(abs(zdata.lambda - hskylines.lines[check[xx]]), minsub2)
              temp = floor(minsub2 - delta)
              oplot, zdata.lambda[minsub1:temp], zdata.flux[minsub1:temp], $
                     THICK = graphops.thick ;graph options
              minsub1 = ceil(minsub2+delta)
           endfor
        end
        else : begin
           print, '  Something has gone horribly wrong!!'
        end
     endcase
  endif
end
;;;===========================================================================================================
 


;;;===========================================================================================================
pro psout, zdata, zpsname, zfeat, zspec
  
  COMMON graphing, graphops
  COMMON lining, lines

  set_plot, 'ps'                ;sets plot type
  device, FILENAME=zpsname      ;creates graphics device
  
  case lines.masksky of 
     'yes' : begin
        plot, zdata.lambda, zdata.flux, /NODATA, $       ;graph it
              TITLE = graphops.tt, $                     ;graph options
              THICK = graphops.thick, $                  ;graph options
              XTITLE = graphops.xxtt, $                  ;graph options
              XRANGE = [graphops.xmin, graphops.xmax], $ ;graph options
              XTHICK = graphops.xthick, $                ;graph options
              XSTY = graphops.xsty, $                    ;graph options
              YTITLE = graphops.yytt, $                  ;graph options
              YRANGE = [graphops.ymin, graphops.ymax], $ ;graph options
              YTHICK = graphops.ythick, $                ;graph options
              YSTY = graphops.ysty, $                    ;graph options
              CHARSIZE = graphops.charsize, $            ;graph options
              CHARTHICK = graphops.charthick             ;graph options
        
        if lines.hsky eq 'yes' then plothsky, 3, zdata
        if lines.balmer eq 'yes' then plotbalmer, zfeat
        if lines.nonbalmer eq 'yes' then plotnonbalmer, zfeat
     end
     'no' : begin
        plot, zdata.lambda, zdata.flux, /NODATA, $       ;graph it
              TITLE = graphops.tt, $                     ;graph options
              THICK = graphops.thick, $                  ;graph options
              XTITLE = graphops.xxtt, $                  ;graph options
              XRANGE = [graphops.xmin, graphops.xmax], $ ;graph options
              XTHICK = graphops.xthick, $                ;graph options
              XSTY = graphops.xsty, $                    ;graph options
              XTICKS = graphops.xticks, $                ;graph options
              YTITLE = graphops.yytt, $                  ;graph options
              YRANGE = [graphops.ymin, graphops.ymax], $ ;graph options
              YTHICK = graphops.ythick, $                ;graph options
              YSTY = graphops.ysty, $                    ;graph options
              CHARSIZE = graphops.charsize, $            ;graph options
              CHARTHICK = graphops.charthick             ;graph options
        
        case lines.shadesky of                                 ;
           'no' : begin                                        ;
              if lines.hsky eq 'yes' then plothsky, 1, zdata   ;
              oplot, zdata.lambda, zdata.flux, $               ;overplotdata
                     THICK = graphops.thick                    ;graph options
           end                                                 ;
           'yes' : begin                                       ;
              if lines.hsky eq 'yes' then plothsky, 2, zdata   ;
              oplot, zdata.lambda, zdata.flux, $               ;overplot data
                     THICK = graphops.thick                    ;graph options
           end                                                 ;
           else : print, 'Something has gone horribly wrong!!' ;
        endcase
        if lines.balmer eq 'yes' then plotbalmer, zfeat       ;
        if lines.nonbalmer eq 'yes' then plotnonbalmer, zfeat ;
     end
  endcase
  
  device, /CLOSE                ;closes device
  set_plot, 'x'                 ;resets plot
  
end
;;;===========================================================================================================




;;;===========================================================================================================
pro screenout, zdata, zfeat, zspec
  
  COMMON graphing, graphops
  COMMON lining, lines


  case lines.masksky of 
     'yes' : begin
        plot, zdata.lambda, zdata.flux, /NODATA, $       ;graph it
              TITLE = graphops.tt, $                     ;graph options
              THICK = graphops.thick, $                  ;graph options
              XTITLE = graphops.xxtt, $                  ;graph options
              XRANGE = [graphops.xmin, graphops.xmax], $ ;graph options
              XTHICK = graphops.xthick, $                ;graph options
              XSTY = graphops.xsty, $                    ;graph options
              XTICKS = graphops.xticks, $                ;graph options
              YTITLE = graphops.yytt, $                  ;graph options
              YRANGE = [graphops.ymin, graphops.ymax], $ ;graph options
              YTHICK = graphops.ythick, $                ;graph options
              YSTY = graphops.ysty, $                    ;graph options
              CHARSIZE = graphops.charsize, $            ;graph options
              CHARTHICK = graphops.charthick             ;graph options
        
        if lines.hsky eq 'yes' then plothsky, 3, zdata
        if lines.balmer eq 'yes' then plotbalmer, zfeat
        if lines.nonbalmer eq 'yes' then plotnonbalmer, zfeat
     end
     'no' : begin
        plot, zdata.lambda, zdata.flux, /NODATA, $       ;graph it
              TITLE = graphops.tt, $                     ;graph options
              THICK = graphops.thick, $                  ;graph options
              XTITLE = graphops.xxtt, $                  ;graph options
              XRANGE = [graphops.xmin, graphops.xmax], $ ;graph options
              XTHICK = graphops.xthick, $                ;graph options
              XSTY = graphops.xsty, $                    ;graph options
              XTICKS = graphops.xticks, $                ;graph options
              ;XTICKNAME = graphops.xtickname, $          ;graph options
              YTITLE = graphops.yytt, $                  ;graph options
              YRANGE = [graphops.ymin, graphops.ymax], $ ;graph options
              YTHICK = graphops.ythick, $                ;graph options
              YSTY = graphops.ysty, $                    ;graph options
              CHARSIZE = graphops.charsize, $            ;graph options
              CHARTHICK = graphops.charthick             ;graph options
        
        case lines.shadesky of                                 ;
           'no' : begin                                        ;
              if lines.hsky eq 'yes' then plothsky, 1, zdata   ;
              oplot, zdata.lambda, zdata.flux, $               ;overplotdata
                     THICK = graphops.thick                    ;graph options
           end                                                 ;
           'yes' : begin                                       ;
              if lines.hsky eq 'yes' then plothsky, 2, zdata   ;
              oplot, zdata.lambda, zdata.flux, $               ;overplot data
                     THICK = graphops.thick                    ;graph options
           end                                                 ;
           else : print, 'Something has gone horribly wrong!!' ;
        endcase
        if lines.balmer eq 'yes' then plotbalmer, zfeat       ;
        if lines.nonbalmer eq 'yes' then plotnonbalmer, zfeat ;
     end
  endcase
  

end
;;;===========================================================================================================




;;;===========================================================================================================
pro splot_andrew, zfile, ZTYPE=ztype, ZZ=zz, RESTFRA=restfra, PS=ps, DOMAIN=domain, RANGE=range, $
                  NORMALIZE=normalize, SMOOTH=smooth, YSKY=ysky, JSKY=jsky, HSKY=hsky, KSKY=ksky, SHADESKY=shadesky, $
                  MASKSKY=masksky, BALMER=balmer, NONBALMER=nonbalmer, $
                  NOXVALE=noxvals, NOXLABLE=noxlable, XTICKNAME=xtickname, $
                  NOYVALS=noyvals, NOYLABLE=noylable, $
                  NOLINEID=nolineid, $
                  _EXTRA=ee, LABZ=labz, IDSPEC=idspec, $
                  TELLURIC=telluric, SKY=sky
  
  
;+
;
; INPUT:
;    ZFILE: Input file name.
;
; OPTIONAL:
;
; PS: Set this keyword to  create postcript file.
; W1, W2: Ends of wavelength range to be plotted.
; Z: Redshift of input spectrum. If not set, then rest-frame is assumed.
; ZTYPE: if input file is in fits format, then set equal to 'fits'
; (DEFAULT option). If input file is in ascii format, then set equal to
; 'ascii'.
; SMOOTH: Smoothing box for spectrum.
; _EXTRA: Extra keywords and variables for plot.
; LABZ: Set this keyword to show redshift value.
; NOLID: Set this keyword to supress labels of spectral features.
; IDSPEC: Set this keyword equal to the ID name of the input spectrum L
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
; ztype='ascii'. 
;
; listpix spec_from_gmos.fits > spec_ascii.dat
;
; R. Demarco - UdeC - Aug 2011
;
;-

  ON_ERROR, 2
  !except = 2

  COMMON graphing, graphops
  COMMON lining, lines
  COMMON dataing, data, datasave


  ;;;Funky non-standard stuff
  angstrom = '[!6!sA!r!u!9 %!6!n]'

  ;;;Reading spectrum according to format:
  if keyword_set(ztype) then ztype = zytpe[0] else ztype = 'blah' ;set new value
  case ztype of
     'fits' : begin
        data = readasfits(zfile)
        datasave = data
        psname = strcompress(strmid(zfile, 0, strpos(zfile, '.fits')) + '.ps', /REMOVE_ALL)
     end
     'ascii' : begin
        data = readasascii(zfile)
        datasave = data
        psname = strcompress(strmid(zfile, 0, strpos(zfile, '.txt')) + '.ps', /REMOVE_ALL)
     end
     else : begin
        print, ' No type given for spectrum file format.'
        print, '  Assuming .FITS format!'
        data = readasfits(zfile) 
        datasave = data
        psname = strcompress(strmid(zfile, 0, strpos(zfile, '.fits')) + '.ps', /REMOVE_ALL)
     end
  endcase
  

  ;;;Graph reset
  graphreset, 1
  
  
  ;;;Lines reset
  linesreset, 1
  if keyword_set(BALMER) then lines.balmer = 'yes'
  if keyword_set(NONBALMER) then lines.nonbalmer = 'yes'
  if keyword_set(YSKY) then lines.ysky = 'yes'
  if keyword_set(JSKY) then lines.jsky = 'yes'
  if keyword_set(HSKY) then lines.hsky = 'yes'
  if keyword_set(KSKY) then lines.ksky = 'yes'
  if keyword_set(SHADESKY) then lines.shadesky = 'yes'
  if keyword_set(MASKSKY) then lines.masksky = 'yes'
  if keyword_set(NOLINEID) then lines.ids = 'no'
  
  
  ;;;Create lambda values from header info
  data = makelambda(data)

 
 ;;;If no redshift is provided, then it assumes that is rest-frame:
  case keyword_set(ZZ) of 
     1 : begin
        case keyword_set(RESTFRA) of
           0: begin
              print, '  Observed spectrum being kept! Moving features to lambda*(1+z)!!'
              zspec = 0.0
              zfeat = zz[0]
              graphops.xxtt = '!6 Obs Wavelength !3 '+ angstrom
           end
           1 : begin
              zspec = zz[0]
              zfeat = 0.0
              graphops.xxtt = '!6 Restframe Wavelength !3 '+ angstrom 
           end
           else : print, 'Something has gone horribly wrong!!'
        endcase
     end
     0 : begin
        zspec = 0.0
        zfeat = 0.0
        graphops.xxtt = '!6 Obs Wavelength !3 '+ angstrom 
     end
     else : print, 'Something has gone horribly wrong!!'
  endcase
  
  
  ;;;Setting axis titles:
  if keyword_set(NOXLABLE) then graphops.xxtt='   '
  if keyword_set(NOYLABLE) then begin
     graphops.yytt='   '
  endif else begin
     graphops.yytt='!6F!d!4k!n !6 (arbitrary units)!3' 
  endelse

  
  ;;;Setting default plotting range in wavelength: 
  case keyword_set(DOMAIN) of
     1 : begin
        test = n_elements(DOMAIN)
        case test of
           2 : begin
              graphops.xmin = domain[0]
              graphops.xmax = domain[1]
           end
           else : begin
              print, ' Domain element must have exactly two members.'
              print, ' First element is lower limiit, second value is upper limit.'
           end
        endcase
     end
     0 : begin
        graphops.xmin = min(data.lambda)
        graphops.xmax = max(data.lambda)
     end
     else : print, '  Something has gone horribly wrong!!'
  endcase
  
  
  ;;;Range of plotted wavelength vector:
  case keyword_set(RANGE) of
     1 : begin
        test = n_elements(RANGE)
        case test of
           2 : begin
              graphops.ymin = range[0]
              graphops.ymax = range[1]
           end
           else : begin
              print, ' Range element must have exactly two members.'
              print, ' First element is lower limiit, second value is upper limit.'
           end
        endcase
     end
     0 : begin
        graphops.ymin = min(data.flux)
        graphops.ymax = max(data.flux)
     end
     else : print, '  Something has gone horribly wrong!!'
  endcase


  ;;;Other plot options
  if keyword_set(XTICKNAME) then graphops.xtickname = xtickname



  ;;;Smoothing box - the default value is 7 pixels:
  if keyword_set(SMOOTH) then begin
     data = smoothing(data, WIDTH=smooth[0])
  endif

  
  ;;;Normalizing spectrum:
  case keyword_set(NORMALIZE) of 
     1 : data = normalized(data)
     0 : data = data
     else : print, 'Something has gone horribly wrong!!'
  endcase 
  

  ;;;Creating plot:
  case keyword_set(PS) of 
     1 : psout, data, psname, zfeat, zspec
     0 : screenout, data, zfeat, zspec
  endcase
    

end
;;;===========================================================================================================
