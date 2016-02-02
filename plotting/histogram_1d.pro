function histogram_1d, values, NORMAL=normal, STRADDLE=straddle, MINX=minx, MAXX=maxx, BINX=binx, $
                       TOLERANCE=tolerance, LOGX=logx, LOGY=logy, $
                       BACKGROUND=background, DATACOLOR=datacolor, XTITLE=xtitle, YTITLE=ytitle, TITLE=title, $
                       CHARSIZE=charsize, CHARTHICK=charthick, SYMBOL=symbol, OUTFILE=outfile, WINNUM=winnum, $
                       WINVALS=winvals, LEGEND=legend, LABEL=label, LEG_BOX=leg_box, LEG_CHARSIZE=leg_charsize, $
                       WRITE=write, NOCALC=nocalc, RETVALS=retvals
 
  
  if keyword_set(NORMAL) then normalize = 'y' else normalize = 'n'                      ;sets new value
  if keyword_set(STRADDLE) then straddle = 'y' else straddle = 'n'                      ;sets new value
  if keyword_set(MINX) then minx = minx[0] else minx = min(values)                      ;sets new value
  if keyword_set(MAXX) then maxx = maxx[0] else maxx = max(values)                      ;sets new value
  if keyword_set(BINX) then binx = binx[0] else binx = (maxx-minx)/100.0                ;sets new value
  if keyword_set(TOLERANCE) then tolerance = TOLERANCE[0] else tolerance=0.000001       ;sets new value
  if keyword_set(LOGX) then logx = 'y' else logx = 'n'                                  ;sets new value
  if keyword_set(LOGY) then logy = 'y' else logy = 'n'                                  ;sets new value
  if keyword_set(BACKGROUND) then background = background[0] else background='FFFFFF'XL ;sets new value
  if keyword_set(DATACOLOR) then datacolor = datacolor[0] else datacolor = '000000'XL   ;sets new value
  if keyword_set(XTITLE) then xtitle = xtitle[0] else xtitle = ''                       ;sets new value
  if keyword_set(YTITLE) then ytitle = ytitle[0] else ytitle = ''                       ;sets new value
  if keyword_set(TITLE) then title = title[0] else title = ''                           ;sets new value
  if keyword_set(CHARSIZE) then charsize = charsize[0] else charsize = 1.5              ;sets new value
  if keyword_set(CHARTHICK) then charthick = charthick[0] else charthick = 1.4          ;sets new value
  if keyword_set(SYMBOL) then symbol = symbol[0] else symbol = 10                       ;sets new value
  if keyword_set(OUTFILE) then outfile = outfile[0] else outfile = 'histogram.ps'       ;sets new value
  if keyword_set(WINNUM) then winnum = winnum[0] else winnum = 0                        ;sets new value
  if keyword_set(LEGEND) then legend = 'y' else legend = 'no'                           ;sets new value
  if keyword_set(LABEL) then label = label[0] else label = 'standard'                   ;sets new value
  if keyword_set(LEG_B0X) then leg_box = leg_box[0] else leg_box = 0                    ;sets new value
  if keyword_set(LEG_CHARSIZE) then leg_charsize = leg_charsize[0] else leg_charsize=2  ;sets new value
  if keyword_set(WRITE) then write = 'y' else write = 'n'                               ;sets new value
  if keyword_set(NOCALC) then nocalc = 'y' else nocalc = 'n'                            ;sets new value
  

  
  ;;;This section creates the 2 column array of bin value, frequency
  ;;;if an array of raw values are given
  if nocalc eq 'n' then begin                                                                     ;determins if necessary to find bin values
     xnum_bins = (maxx-minx)/binx + 4                                                             ;finds number of bins + padding
     xbins = indgen(xnum_bins)                                                                    ;creates array for bin number
     xbins = maxx - binx*xbins                                                                    ;sets bin value
     hist = fltarr(xnum_bins)                                                                     ;creates array to be populated
     for ii=2UL, xnum_bins-1, 1 do begin                                                          ;begins loop over each of bins
        case straddle of                                                                          ;checks straddle keyword
           'y' : begin                                                                            ;if straddle on
              find = where( (values le (xbins[ii]+(binx/2.0)+tolerance)) AND $                    ;cont next line
                            (values gt (xbins[ii]-(binx/2.0)+tolerance)), N_FIND)                 ;finds points in bin
           end                                                                                    ;end straddle on
           'n' : begin                                                                            ;if straddle off
              find = where( (values lt (xbins[ii]+binx)) AND $                                    ;cont next line
                            (values ge (xbins[ii]-tolerance)), N_FIND)                            ;finds points in bin
           end                                                                                    ;end straddle off
        endcase                                                                                   ;end check straddle keyword
        hist[ii] = N_FIND                                                                         ;sets value in array
     endfor                                                                                       ;ends loop over each bin
     if label eq 'standard' then label = strcompress('n='+ string(UINT(total(hist))),/REMOVE_ALL) ;sets a legend value
     norm = total(hist)                                                                           ;finds total number of item
     if normalize eq 'y' then hist = hist / norm                                                  ;normalizes the hist array
     if straddle eq 'n' then xbins = xbins + (binx/2.0)                                           ;bumps x vals by 1/2 a bin width
     ;if keyword_set(RETVALS) then return, [xbins,hist] ;
  endif                                                                                           ;end if on necessary on bin values
  
  ;;;This section run if bin value, frequency are given as indicated by /NOCALC keyword
  if nocalc eq 'y' then begin                                                                     ;find in need to calculate bin values
     check = size(values)                                                                         ;finds size of values array
     if (check[1] ne 2) AND (check[2] ne 2) then begin                                            ;checks array for proper size
        print, 'Number of rows or columns must be 2!'                                             ;prints warning
        stop                                                                                      ;stops program
     endif                                                                                        ;end check on proper array size
     if (check[4]/check[1]) ne 2 then values = transpose(values)                                  ;set array proper orrientation
     minx = min(values[*,0])                                                                      ;sets new xmin
     maxx = max(values[*,0])                                                                      ;sets new xmax
     minx = minx - 0.02*(maxx-minx)                                                               ;resets minx
     maxx = maxx + 0.02*(maxx-minx)                                                               ;resets maxx
     xbins = values[*,0]                                                                          ;sets x values
     hist = values[*,1]                                                                           ;sets y values
     if normalize eq 'y' then hist = values[*,1] / reverse(normal)                                ;sets y values
     if label eq 'standard' then label = strcompress('n='+ string(UINT(total(hist))),/REMOVE_ALL) ;sets a legend value
  endif                                                                                           ;ends if on no need to calc
  
  ;;;This section plots the data
  if NOT keyword_set(WRITE) then begin                                                    ;dont plot if writing
     window, winnum, TITLE=title                                                          ;sets window number
     if keyword_set(WINVALS) then window, winnum, XPOS=winvals[0], YPOS=winvals[1], $     ;cont next line
                                          XSIZE=winvals[2], YSIZE=winvals[3], TITLE=title ;sets window opts if avail
     case 1 of                                                                            ;begins trivial case
        logx eq 'n' and logy eq 'n' : begin                                               ;check logx, logy keywords
           plot, xbins, hist, $                                                           ;plots the data
                 PSYM=symbol, $                                                           ;plot option
                 background = background, $                                               ;plot option
                 color = datacolor, $                                                     ;plot option
                 xtitle = xtitle, $                                                       ;plot option
                 ytitle = ytitle, $                                                       ;plot option
                 title = title, $                                                         ;plot option
                 xrange = [minx,maxx], $                                                  ;plot option
                 yrange = [0,max(hist)*1.1], $                                            ;plot option
                 charsize = charsize, $                                                   ;plot option
                 charthick = charthick                                                    ;plot option
           if legend eq 'y' then legend, [label], $                                       ;sets legend
                                         box=leg_box, $                                   ;legend option
                                         textcolors = datacolor, $                        ;legend option
                                         charsize=leg_charsize                            ;legend option
        end                                                                               ;end case logx, logy keywords
        logx eq 'n' and logy eq 'y' : begin                                               ;check logx, logy keywords
           plot, xbins, hist, $                                                           ;plots the data
                 PSYM=symbol, $                                                           ;plot option
                 background = background, $                                               ;plot option
                 color = datacolor, $                                                     ;plot option
                 xtitle = xtitle, $                                                       ;plot option
                 ytitle = ytitle, $                                                       ;plot option
                 title = title, $                                                         ;plot option
                 xrange = [minx,maxx], $                                                  ;plot option
                 yrange = [0,max(hist)*1.1], $                                            ;plot option
                 charsize = charsize, $                                                   ;plot option
                 charthick = charthick, $                                                 ;plot option
                 /YLOG                                                                    ;plot option
           if legend eq 'y' then legend, [label], $                                       ;sets legend
                                         box=leg_box, $                                   ;legend option
                                         textcolors = datacolor, $                        ;legend option
                                         charsize=leg_charsize                            ;legend option
        end                                                                               ;end case logx, logy keywords
        logx eq 'y' and logy eq 'y' : begin                                               ;check logx, logy keywords
           plot, xbins, hist, $                                                           ;plots the data
                 PSYM=symbol, $                                                           ;plot option
                 background = background, $                                               ;plot option
                 color = datacolor, $                                                     ;plot option
                 xtitle = xtitle, $                                                       ;plot option
                 ytitle = ytitle, $                                                       ;plot option
                 xrange = [minx,maxx], $                                                  ;plot option
                 yrange = [0,max(hist)*1.1], $                                            ;plot option
                 charsize = charsize, $                                                   ;plot option
                 charthick = charthick, $                                                 ;plot option
                 /YLOG, /XLOG                                                             ;plot option
           if legend eq 'y' then legend, [label], $                                       ;sets legend
                                         box=leg_box, $                                   ;legend option
                                         textcolors = datacolor, $                        ;legend option
                                         charsize=leg_charsize                            ;legend option
        end                                                                               ;end case logx, logy keywords
        logx eq 'y' and logy eq 'n' : begin                                               ;check logx, logy keywords
           plot, xbins, hist, $                                                           ;plots the data
                 PSYM=symbol, $                                                           ;plot option
                 background = background, $                                               ;plot option
                 color = datacolor, $                                                     ;plot option
                 xtitle = xtitle, $                                                       ;plot option
                 ytitle = ytitle, $                                                       ;plot option
                 xrange = [minx,maxx], $                                                  ;plot option
                 yrange = [0,max(hist)*1.1], $                                            ;plot option
                 charsize = charsize, $                                                   ;plot option
                 charthick = charthick, $                                                 ;plot option
                 /XLOG                                                                    ;plot option
           if legend eq 'y' then legend, [label], $                                       ;sets legend
                                         box=leg_box, $                                   ;legend option
                                         textcolors = datacolor, $                        ;legend option
                                         charsize=leg_charsize                            ;legend option
        end                                                                               ;end case logx, logy keywords
     endcase                                                                              ;ends trivial case
  endif                                                                                   ;end dont plot if writing
  
  if keyword_set(WRITE) then begin                                 ;check on WRITE keyword
     set_plot, 'ps'                                                ;sets plot to ps
     device, FILENAME=outfile                                      ;sets device
     case 1 of                                                     ;begins trivial case
        logx eq 'n' and logy eq 'n' : begin                        ;check logx, logy keywords
           plot, xbins, hist, $                                    ;plots the data
                 PSYM=symbol, $                                    ;plot option
                 background = background, $                        ;plot option
                 color = datacolor, $                              ;plot option
                 xtitle = xtitle, $                                ;plot option
                 ytitle = ytitle, $                                ;plot option
                 xrange = [minx,maxx], $                           ;plot option
                 yrange = [0,max(hist)*1.1], $                     ;plot option
                 charsize = charsize, $                            ;plot option
                 charthick = charthick                             ;plot option
           if legend eq 'y' then legend, [label], $                ;sets legend
                                         box=leg_box, $            ;legend option
                                         textcolors = datacolor, $ ;legend option
                                         charsize=leg_charsize     ;legend option
        end                                                        ;end case logx, logy keywords
        logx eq 'n' and logy eq 'y' : begin                        ;check logx, logy keywords
           plot, xbins, hist, $                                    ;plots the data
                 PSYM=symbol, $                                    ;plot option
                 background = background, $                        ;plot option
                 color = datacolor, $                              ;plot option
                 xtitle = xtitle, $                                ;plot option
                 ytitle = ytitle, $                                ;plot option
                 xrange = [minx,maxx], $                           ;plot option
                 yrange = [0,max(hist)*1.1], $                     ;plot option
                 charsize = charsize, $                            ;plot option
                 charthick = charthick, $                          ;plot option
                 /YLOG                                             ;plot option
           if legend eq 'y' then legend, [label], $                ;sets legend
                                         box=leg_box, $            ;legend option
                                         textcolors = datacolor, $ ;legend option
                                         charsize=leg_charsize     ;legend option
        end                                                        ;end case logx, logy keywords
        logx eq 'y' and logy eq 'y' : begin                        ;check logx, logy keywords
           plot, xbins, hist, $                                    ;plots the data
                 PSYM=symbol, $                                    ;plot option
                 background = background, $                        ;plot option
                 color = datacolor, $                              ;plot option
                 xtitle = xtitle, $                                ;plot option
                 ytitle = ytitle, $                                ;plot option
                 xrange = [minx,maxx], $                           ;plot option
                 yrange = [0,max(hist)*1.1], $                     ;plot option
                 charsize = charsize, $                            ;plot option
                 charthick = charthick, $                          ;plot option
                 /YLOG, /XLOG                                      ;plot option
           if legend eq 'y' then legend, [label], $                ;sets legend
                                         box=leg_box, $            ;legend option
                                         textcolors = datacolor, $ ;legend option
                                         charsize=leg_charsize     ;legend option
        end                                                        ;end case logx, logy keywords
        logx eq 'y' and logy eq 'n' : begin                        ;check logx, logy keywords
           plot, xbins, hist, $                                    ;plots the data
                 PSYM=symbol, $                                    ;plot option
                 background = background, $                        ;plot option
                 color = datacolor, $                              ;plot option
                 xtitle = xtitle, $                                ;plot option
                 ytitle = ytitle, $                                ;plot option
                 xrange = [minx,maxx], $                           ;plot option
                 yrange = [0,max(hist)*1.1], $                     ;plot option
                 charsize = charsize, $                            ;plot option
                 charthick = charthick, $                          ;plot option
                 /XLOG                                             ;plot option
           if legend eq 'y' then legend, [label], $                ;sets legend
                                         box=leg_box, $            ;legend option
                                         textcolors = datacolor, $ ;legend option
                                         charsize=leg_charsize     ;legend option
        end                                                        ;end case logx, logy keywords
     endcase                                                       ;ends trivial case
     device, /CLOSE                                                ;closes device
     set_plot, 'x'                                                 ;resets plot
  endif                                                            ;end check on WRITE keyword
  
  output = [[xbins], [hist]]    ;sets output of function
  return, output                ;returnds funtion output
end                             ;ends function histogram_1d

  
  
  


pro hist1D

  readcol, 'phys005_grades_midterm1.txt', grades
  help, grades

 
  zdist = histogram_1d(grades, MINX=0, MAXX=50, $                    ;cont next line
                       BINX=2, XTITLE='Score [Points out of 50]', $  ;cont next line
                       YTITLE='Number', TITLE='Midterm 1 Grade Distribution', /WRITE, OUTFILE='midterm1_distribution.ps', $
                       LABEL='# Student = 358', /LEGEND ) ;runs plotting 
  
  

end
