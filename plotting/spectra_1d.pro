;========================================================================================================================
pro graphreset, num
  
  COMMON graphing, graphops
  
  graphops = {color: '000000'XL, $
              background: 'FFFFFF'XL, $
              errcolor: '000000'XL, $
              fitcolor: 175, $ ;'0000FF'XL, $
              tt: ' ',  $
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
              xticks: 5, $
              xminor: 4, $
              xticklen: 0.1, $
              xtickv: [17000.0, 17500.0, 18000.0], $
              xtickname: ['17200', '17450', '17700'], $
              xtickformat:'(I6)', $
              linethick: 4.0 }
  
end
;========================================================================================================================




;========================================================================================================================
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
;========================================================================================================================




;========================================================================================================================
pro datareset, num

  ;COMMON dataing, data, datasave
    
end
;========================================================================================================================




;========================================================================================================================
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
  zlambda = indgen(n_elements(zdata.(sind)))
  zlambda = double(zlambda)
  zlambda = dl*(zlambda-x0+1.0)+l0
 

  zdata.(lind) = zlambda
  return, zdata
end 
;;;===========================================================================================================




;;;===========================================================================================================
function smoothing, zdata, sind, WIDTH=width
  
  if keyword_set(WIDTH) then width = width[0] else width = 7 ;set new value
  zdata.(sind) = poly_smooth(zdata.(sind), width)
  
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
  
  speclines, 'balmer', ZZ=zfeat, VALS=balmerlines
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
              xyouts, balmerlines.lines[check[xx]]+1 + 0.02*(graphops.xmax-graphops.xmin), $
                      graphops.ymax-0.1*(graphops.ymax-graphops.ymin), $
                      balmerlines.namesold[check[xx]], $
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

  speclines, 'nonbalmer', ZZ=zfeat, VALS=nonbalmerlines
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
              
              xyouts, nonbalmerlines.lines[check[xx]]+1 + 0.02*(graphops.xmax-graphops.xmin), $
                      graphops.ymax - 0.1*(graphops.ymax-graphops.ymin), $
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
  COMMON lining, lines

  loadct, 0                                                 ;load color table
  speclines, lines.hsky, VALS=hskylines                     ;get sky line info
  check = where((hskylines.lines GT graphops.xmin) AND $    ;check sky line info
                (hskylines.lines LT graphops.xmax), ncheck) ;check sky line info
  if ncheck NE 0 then begin                                 ;if some sky lines fall in domain
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
           check1 = min(abs(zdata.(lind) - graphops.xmin), minsub1)
           for xx=0, ncheck-1, 1 do begin
              delta = hskylines.widths[check[xx]] / 2.0
              check2 = min(abs(zdata.(lind) - hskylines.lines[check[xx]]), minsub2)
              temp = floor(minsub2 - delta)
              oplot, zdata.(lind)[minsub1:temp], zdata.(sind)[minsub1:temp], $
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
pro psetup, zdata, zfeat, zspec, lind, sind
  
  COMMON graphing, graphops
  COMMON lining, lines
  
  plot, zdata.(lind), zdata.(sind), /NODATA, $ ;graph it
             TITLE = graphops.tt, $                               ;graph options
             THICK = graphops.thick, $                            ;graph options
             XTITLE = graphops.xxtt, $                            ;graph options
             XRANGE = [graphops.xmin, graphops.xmax], $           ;graph options
             XTHICK = graphops.xthick, $                          ;graph options
             XSTY = graphops.xsty, $                              ;graph options
             XTICKS = graphops.xticks, $                          ;graph options
             XMINOR = graphops.xminor, $                          ;graph options
             XTICKFORMAT = graphops.xtickformat, $                ;graph options
             YTITLE = graphops.yytt, $                            ;graph options
             YRANGE = [graphops.ymin, graphops.ymax], $           ;graph options
             YTHICK = graphops.ythick, $                          ;graph options
             YSTY = graphops.ysty, $                              ;graph options
             CHARSIZE = graphops.charsize, $                      ;graph options
             CHARTHICK = graphops.charthick                       ;graph options

END
;;;===========================================================================================================



;;;===========================================================================================================
pro pmain, zdata, zpsname, zfeat, zspec, lind, sind
  
  COMMON graphing, graphops
  COMMON lining, lines

  
  oplot, zdata.(lind), zdata.(sind), $ ;overplot data
         THICK = graphops.thick        ;graph options


  
END
;;;===========================================================================================================



;;;===========================================================================================================
pro plotfit, zdata, zdatahdr, lind, PREFIX=prefix
  
  COMMON graphing, graphops
  COMMON lining, lines
  
  IF keyword_set(PREFIX) THEN prefix = string(prefix[0]) ELSE prefix = '' ;set default
  
  tx0 = fxpar(zdatahdr, strcompress(prefix + 'X0', /REMOVE_ALL)) ;get value
  tx1 = fxpar(zdatahdr, strcompress(prefix + 'X1', /REMOVE_ALL)) ;get value
  tx2 = fxpar(zdatahdr, strcompress(prefix + 'X2', /REMOVE_ALL)) ;get value
  tx3 = fxpar(zdatahdr, strcompress(prefix + 'X3', /REMOVE_ALL)) ;get value
  tx4 = fxpar(zdatahdr, strcompress(prefix + 'X4', /REMOVE_ALL)) ;get value
  tx5 = fxpar(zdatahdr, strcompress(prefix + 'X5', /REMOVE_ALL)) ;get value
  
  tmpxs = (zdata.lambdas - fxpar(zdatahdr, strcompress(prefix + 'MEDX', /REMOVE_ALL)))                           ;shift to median
  cont = tx0 + tx1*tmpxs + tx2*tmpxs^2 + tx3*tmpxs^3 + tx4*tmpxs^4 + tx5*tmpxs^5 ;calculate continuum
  
  nobs = 1
  flag = 0
  WHILE FLAG EQ 0 DO BEGIN
     tmp = fxpar(zdatahdr, strcompress('zanlin' + string(nobs), /REMOVE_ALL))
     tmp = strcompress(tmp, /REMOVE_ALL)
     wl = emissionlines(tmp)
     IF nobs EQ 1 THEN BEGIN
        allobs = tmp 
        allwl = wl 
     ENDIF ELSE BEGIN
        allobs = [allobs, tmp]
        allwl = [allwl, wl]
     ENDELSE
     chk = fxpar(zdatahdr, strcompress('zanlin' + string(nobs+1), /REMOVE_ALL))
     chk = strcompress(string(chk), /REMOVE_ALL)
     IF chk NE '0' THEN nobs = nobs + 1 ELSE flag = 1
  ENDWHILE
  allwl = allwl * (1.0+fxpar(zdatahdr, 'ZANZMLE'))

  FOR xx=0, nobs-1, 1 DO BEGIN
     this = zdata.lambdas
     this[*] = 0.0
     sigma = fxpar(zdatahdr, strcompress(allobs[xx] + 'WML', /REMOVE_ALL))
     coeff = fxpar(zdatahdr, strcompress(allobs[xx] + 'CML', /REMOVE_ALL))
     exponent = -(zdata.lambdas-allwl[xx])^2/(2.0*sigma^2)
     chk = where((exponent GT -83.0) AND (exponent LT 83.0))
     IF chk[0] NE -1 THEN this[chk] = coeff*exp(exponent[chk]) 
     IF xx EQ 0 THEN lines = this ELSE lines = lines + this
  ENDFOR

  loadct, 13                                 ;load color table
  fitys = cont + lines                       ;combine the two
  oplot, zdata.(lind), fitys, LINESTYLE=0, $ ;plot values 
         COLOR = graphops.fitcolor, $        ;plot options   
         THICK = 5.0                         ;plot options
  
  ;legend, ['Bayesian Fit'], LINESTYLE=[0], $ ;add legend
  ;        COLOR=[graphops.fitcolor], $       ;legend option
  ;        BOX=0                              ;legend option

    
END
;;;===========================================================================================================



;;;===========================================================================================================
pro pmain_yerr, zdata, zpsname, zfeat, zspec, lind, sind, eind
  
  COMMON graphing, graphops
  COMMON lining, lines
  
  oploterror, zdata.(lind), zdata.(sind), zdata.(eind), $ ;overplot data
              ERRCOLOR=graphops.errcolor, $               ;plot options
              THICK = graphops.thick                      ;graph options
  
END
;;;===========================================================================================================



;;;===========================================================================================================
pro psout_noyerr, zdata, zpsname, zfeat, zspec, lind, sind
  
  COMMON graphing, graphops
  COMMON lining, lines 

  ;;Determine sky lines
  case lines.masksky of                                        ;check if mask sky line 
     'yes' : skynum = 3                                        ;yes to mask
     'no' : begin                                              ;no to mask
        case lines.shadesky of                                 ;check shade sky
           'no' : skynum = 1                                   ;no to shade
           'yes' : skynum = 2                                  ;yes to shade
           else : print, 'Something has gone horribly wrong!!' ;catch
        endcase                                                ;end check shade
     end                                                       ;end no to mask
  endcase                                                      ;end check mask
  
  plot, zdata.(lind), zdata.(sind), /NODATA, $     ;graph it
        TITLE = graphops.tt, $                     ;graph options
        THICK = graphops.thick, $                  ;graph options
        XTITLE = graphops.xxtt, $                  ;graph options
        XRANGE = [graphops.xmin, graphops.xmax], $ ;graph options
        XTHICK = graphops.xthick, $                ;graph options
        XSTY = graphops.xsty, $                    ;graph options
        XTICKS = graphops.xticks, $                ;graph options
        XMINOR = graphops.xminor, $                ;graph options
        XTICKFORMAT = graphops.xtickformat, $      ;graph options
        YTITLE = graphops.yytt, $                  ;graph options
        YRANGE = [graphops.ymin, graphops.ymax], $ ;graph options
        YTHICK = graphops.ythick, $                ;graph options
        YSTY = graphops.ysty, $                    ;graph options
        CHARSIZE = graphops.charsize, $            ;graph options
        CHARTHICK = graphops.charthick             ;graph options
  
  if lines.hsky eq 'yes' then plothsky, skynum, zdata   ;plot lines
  if lines.balmer eq 'yes' then plotbalmer, zfeat       ;plot lines
  if lines.nonbalmer eq 'yes' then plotnonbalmer, zfeat ;plot lines
  
  oplot, zdata.(lind), zdata.(sind), $      ;overplot data
         THICK = graphops.thick             ;graph options
  
END
;;;===========================================================================================================




;;;===========================================================================================================
pro screenout_noyerr, zdata, zfeat, zspec, lind, sind, eind
  
  COMMON graphing, graphops
  COMMON lining, lines

  case lines.masksky of 
     'yes' : begin
        plot, zdata.(lind), zdata.(sind), /NODATA, $       ;graph it
              COLOR = graphops.color, $                    ;graph options
              BACKGROUND = graphops.background, $          ;graph options
              TITLE = graphops.tt, $                       ;graph options
              THICK = graphops.thick, $                    ;graph options
              XTITLE = graphops.xxtt, $                    ;graph options
              XRANGE = [graphops.xmin, graphops.xmax], $   ;graph options
              XTHICK = graphops.xthick, $                  ;graph options
              XSTY = graphops.xsty, $                      ;graph options
              XTICKS = graphops.xticks, $                  ;graph options
              YTITLE = graphops.yytt, $                    ;graph options
              YRANGE = [graphops.ymin, graphops.ymax], $   ;graph options
              YTHICK = graphops.ythick, $                  ;graph options
              YSTY = graphops.ysty, $                      ;graph options
              CHARSIZE = graphops.charsize, $              ;graph options
              CHARTHICK = graphops.charthick               ;graph options
        
        if lines.hsky eq 'yes' then plothsky, 3, zdata
        if lines.balmer eq 'yes' then plotbalmer, zfeat
        if lines.nonbalmer eq 'yes' then plotnonbalmer, zfeat
     end
     'no' : begin
        plot, zdata.(lind), zdata.(sind), /NODATA, $       ;graph it
              COLOR = graphops.color, $                    ;graph options
              BACKGROUND = graphops.background, $          ;graph options
              TITLE = graphops.tt, $                       ;graph options
              THICK = graphops.thick, $                    ;graph options
              XTITLE = graphops.xxtt, $                    ;graph options
              XRANGE = [graphops.xmin, graphops.xmax], $   ;graph options
              XTHICK = graphops.xthick, $                  ;graph options
              XSTY = graphops.xsty, $                      ;graph options
              XTICKS = graphops.xticks, $                  ;graph options
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
              oplot, zdata.(lind), zdata.(sind), $               ;overplotdata
                     COLOR = graphops.color, $                   ;graph options
                     THICK = graphops.thick                      ;graph options
           end                                                 ;
           'yes' : begin                                       ;
              if lines.hsky eq 'yes' then plothsky, 2, zdata   ;
              oplot, zdata.(lind), zdata.(sind), $             ;overplot data
                     COLOR = graphops.color, $                 ;graph options
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
pro spectra_1d, xsp1d, xsp1dhdr, YERR=yerr, TITLE=title, PREFIX=prefix, $
                TAGS=tags, ZZ=zz, BAYESFIT=bayesfit, $
                RESTFRA=restfra, PSNAME=psname, DOMAIN=domain, RANGE=range, $
                NORMALIZE=normalize, SMOOTH=smooth, $
                YSKY=ysky, JSKY=jsky, HSKY=hsky, KSKY=ksky, SHADESKY=shadesky, MASKSKY=masksky, $
                BALMER=balmer, NONBALMER=nonbalmer, TELLURIC=telluric, SKY=sky, $
                NOXVALE=noxvals, NOXLABLE=noxlable, XTICKNAME=xtickname, NOYVALS=noyvals, NOYLABLE=noylable, $
                NOLINEID=nolineid, $
                _EXTRA=ee, LABZ=labz, IDSPEC=idspec
 
  
;+
; NAME:
;       SPECTRA_1D()
;
; PURPOSE:
;       
; CALLING SEQUENCE:
;
; INPUTS:
;
; OPTIONAL INPUTS:
;
; KEYWORD PARAMETERS:
;
; OUTPUTS:
;
; OPTIONAL OUTPUTS:
;
; COMMON BLOCKS:
;
; PROCEDURES USED:
;
; COMMENTS:
;
; EXAMPLES:
;
; MODIFICATION HISTORY:
;       A. DeGroot, 2014 Jan 24, Univ. Cali, Riverside v1.0.0
;          -based on splot_andrew which is turn comes from
;          R. Demarco's splot
;
;-


  ON_ERROR, 2
  !except = 2

  COMMON graphing, graphops
  COMMON lining, lines
  COMMON dataing, data, datasave


  IF keyword_set(PREFIX) THEN prefix = string(prefix[0]) ELSE prefix = '' ;set default

  ;;;Funky non-standard stuff
  angstrom = '[!6!sA!r!u!9 %!6!n]'
  
  ;;;Find appropriate tag indices 
  IF keyword_set(TAGS) THEN BEGIN
     note = '  Tag given for lambdas not valid!! Please supply another!!'  ;info
     lind = tagind(xsp1d, tags[0], NOTE=note)                              ;find tag ind
     note = '  Tag given for spectrum not valid!! Please supply another!!' ;info
     sind = tagind(xsp1d, tags[1], NOTE=note)                              ;find tag ind
     note = '  Tag given for errors not valid!! Please supply another!!'   ;info
     eind = tagind(xsp1d, tags[2], NOTE=note)                              ;find tag ind
  ENDIF ELSE BEGIN
     note = '  Default tag for lambdas not found!! Please supply using TAGS keyword!!'  ;info
     lind = tagind(xsp1d, 'lambdas', NOTE=note)                                         ;find tag ind
     note = '  Default tag for spectrum not found!! Please supply using TAGS keyword!!' ;info
     sind = tagind(xsp1d, 'spec1d', NOTE=note)                                          ;find tag ind
     note = '  Default tag for errors not found!! Please supply using TAGS keyword!!'   ;info
     eind = tagind(xsp1d, 'spec1dwei', NOTE=note)                                       ;find tag ind
  END

  ;;;Graph reset
  graphreset, 1
  
  
  ;;;Lines reset
  linesreset, 1                                          ;intialize structure
  IF keyword_set(BALMER) THEN lines.balmer = 'yes'       ;fill with value
  IF keyword_set(NONBALMER) THEN lines.nonbalmer = 'yes' ;fill with value
  IF keyword_set(YSKY) THEN lines.ysky = ysky[0]         ;fill with value
  IF keyword_set(JSKY) THEN lines.jsky = jsky[0]         ;fill with value
  IF keyword_set(HSKY) THEN lines.hsky = hsky[0]         ;fill with value
  IF keyword_set(KSKY) THEN lines.ksky = ksky[0]         ;fill with value
  IF keyword_set(SHADESKY) THEN lines.shadesky = 'yes'   ;fill with value
  IF keyword_set(MASKSKY) THEN lines.masksky = 'yes'     ;fill with value
  IF keyword_set(NOLINEID) THEN lines.ids = 'no'         ;fill with value
  
  
 
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

  ;;;Setting overal title
  IF ~keyword_set(TITLE) THEN BEGIN 
     graphops.tt='   '
  ENDIF ELSE BEGIN
     graphops.tt = string(title[0]) 
  ENDELSE

  
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
        graphops.xmin = min(xsp1d.(lind))
        graphops.xmax = max(xsp1d.(lind))
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
        graphops.ymin = min(xsp1d.(sind))
        graphops.ymax = max(xsp1d.(sind))
     end
     else : print, '  Something has gone horribly wrong!!'
  endcase


  ;;;Other plot options
  if keyword_set(XTICKNAME) then graphops.xtickname = xtickname



  ;;;Smoothing box - the default value is 7 pixels:
  if keyword_set(SMOOTH) then begin
     xsp1d = smoothing(xsp1d, sind, WIDTH=smooth[0])
  endif

  
  ;;;Normalizing spectrum:
  case keyword_set(NORMALIZE) of 
     1 : xsp1d = normalized(xsp1d)
     0 : xsp1d = xsp1d
     else : print, 'Something has gone horribly wrong!!'
  endcase 
  

  ;;;Determine how to handle sky lines
  case lines.masksky of                                        ;check if mask sky line 
     'yes' : skynum = 3                                        ;yes to mask
     'no' : begin                                              ;no to mask
        case lines.shadesky of                                 ;check shade sky
           'no' : skynum = 1                                   ;no to shade
           'yes' : skynum = 2                                  ;yes to shade
           else : print, 'Something has gone horribly wrong!!' ;catch
        endcase                                                ;end check shade
     end                                                       ;end no to mask
  endcase                                                      ;end check mask

  ;;;Creating plot:
        CASE keyword_set(PSNAME) of 
           1 : BEGIN
              set_plot, 'ps'                     ;sets plot type
              device, FILENAME=psname[0], /COLOR ;creates graphics device
              
              psetup, xsp1d, zfeat, zspec, lind, sind ;plot setup
              
              IF lines.hsky NE 'no' THEN plothsky, skynum, zdata   ;plot lines
              IF lines.balmer NE 'no' THEN plotbalmer, zfeat       ;plot lines
              IF lines.nonbalmer NE 'no' THEN plotnonbalmer, zfeat ;plot lines
              
              CASE keyword_set(YERR) OF 
                 0 : pmain, xsp1d, psname[0], zfeat, zspec, lind, sind            ;plot data
                 1 : pmain_yerr, xsp1d, psname[0], zfeat, zspec, lind, sind, eind ;plot data
              ENDCASE
              
              IF keyword_set(BAYESFIT) THEN plotfit, xsp1d, xsp1dhdr, lind, PREFIX=prefix
                            
              device, /CLOSE    ;closes device
              set_plot, 'x'     ;resets plot

           END
           0 : BEGIN
              screenout_noyerr, xsp1d, zfeat, zspec, lind, sind
           END
        ENDCASE

END
;========================================================================================================================




;========================================================================================================================
pro call_spectra_1d


  im1d = 'lok400_mask1_H_msbsr403_eps_1d_v10.fits'

  ;;;read in 1D spectra
  sp1d = mrdfits(im1d, 1, hdr1d)
  
  
  spectra_1d, sp1d, hdr1d       ;, /HELP

END
;========================================================================================================================


