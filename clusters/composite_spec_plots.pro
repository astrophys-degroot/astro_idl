;========================================================================================================================
FUNCTION STACKSPEC1xn, xdata, xoptions, YMIN=ymin, YMAX=ymax, FILENAME=filename, USEFULLERR=usefullerr


  IF keyword_set(YMIN) THEN ymin = float(ymin[0]) ELSE ymin = -0.4                                           ;set default
  IF keyword_set(YMAX) THEN ymax = float(ymax[0]) ELSE ymax = 1.5                                            ;set default
  IF keyword_set(FILENAME) THEN filename = string(filename[0]) ELSE filename = 'composite_stackspec_new.eps' ;set default

  ;;;setup
  print, '  Stacked Spectra for MZR plot 1xn ...' ;print info
  n = n_elements(xdata)                           ;number of stacked spectra
  step = (0.88 / n)                                ;divy up the vertical space
  

  ;;;get emission lines
  speclines, 'balmer', VALS=values
  chk = where((values.lines GT xoptions.wavemin) AND (values.lines LT xoptions.wavemax))
  IF chk[0] NE -1 THEN BEGIN
     names = values.names[chk]
     waves = values.lines[chk]
  ENDIF
  speclines, 'nonbalmer', VALS=values
  chk = where((values.lines GT xoptions.wavemin) AND (values.lines LT xoptions.wavemax))
  IF chk[0] NE -1 THEN BEGIN
     help, values[chk].names
     names = [names,values.names[chk]]
     waves = [waves,values.lines[chk]]
  ENDIF


  ;;;set up window
  IF (125*n LT 800) THEN ysize = 125*n ELSE ysize = 800 ;so plot doesnt go off screen
  w = window(LOCATION=[200,0], DIMENSIONS=[600,ysize])

  ;;;loop through spectra
  FOR xx=0, n-1, 1 DO BEGIN
     spdata = mrdfits(xdata[xx], 1, hdr, /SILENT)                                                                       ;read in file
     ndata = fxpar(hdr, 'NSTCK')                                                                                        ;get number in the stack
     avemass = fxpar(hdr, 'STCKMAVE')                                                                                   ;get average mass of stack
     eavemass = string(floor(avemass))                                                                                  ;get lowest whole interger
     bavemass = string(10^(avemass-eavemass), FORMAT='(F4.2)')                                                          ;proper formatting
     savemass = strcompress('$\langle M_{*} \rangle$ ='+bavemass + '$\times 10^{'+eavemass+'}$ M$_\Sun$' , /REMOVE_ALL) ;more formatting
     IF keyword_set(USEFULLERR) THEN specerr = spdata.spec1dfullwei ELSE specerr = spdata.spec1dwei                     ;pick the error
     specplot1 = plot(spdata.lambdas, spdata.spec1d, /CURRENT, $                                                        ;plot
                      XRANGE=[xoptions.wavemin,xoptions.wavemax], $                                                     ;plot options
                      XTICKNAME=replicate('', 6), $                                                                     ;plot options
                      YRANGE=[ymin,ymax], $                                                                             ;plot options
                      LAYOUT=[1,n,xx], POSITION=[0.1,0.1+xx*step,0.9,0.1+(xx+1)*step])                                  ;plot options
                                ;xtext1 = text(0.50,0.1+xx*(1.5*step),'Cluster Bin 1', FONT_SIZE=11)
     specplot1 = plot([spdata.lambdas[0],spdata.lambdas,spdata.lambdas[-1],spdata.lambdas[0]], $
                      ([0.0, specerr^0.5,0.0,0.0]-0.2), 'grey', $
                      FILL_BACKGROUND=1, FILL_COLOR='grey', $
                      /CURRENT, /OVERPLOT)
     IF (avemass NE 0) THEN xtext3 = text(0.50,(0.1+0.7*step)+xx*step, savemass, FONT_SIZE=11)
     xtext2 = text(0.50,(0.1+0.55*step)+xx*step,strcompress('N='+string(ndata), /REMOVE_ALL), FONT_SIZE=11)
     FOR yy=0, n_elements(names)-1, 1 DO BEGIN
        IF (xx EQ n-1) THEN BEGIN
           xtext4 = text(waves[yy]-6, ymax-0.3, names[yy], ORIENTATION=0, FONT_SIZE=10, TARGET=specplot1, /DATA)
           specplot1 = plot([waves[yy],waves[yy]], [ymin,ymax-0.3], /OVERPLOT, LINESTYLE=':', THICK=1, /DATA, $
                            XMAJOR=specplot1.xmajor, YMAJOR=specplot1.xmajor)
        ENDIF ELSE specplot1 = plot([waves[yy],waves[yy]], [ymin,ymax], /OVERPLOT, LINESTYLE=':', THICK=1, /DATA, $
                                    XMAJOR=specplot1.xmajor, YMAJOR=specplot1.xmajor)
     ENDFOR
  ENDFOR

  ;titletext = text(0.30,0.95,'KEMCLASS Stacked Spectra', FONT_SIZE=16)
  xaxtext = text(0.30,0.065,'Rest Frame Wavelength [$\AA$]', FONT_SIZE=16)
  yaxtext = text(0.035,0.36,'Flux [arbitrary units]', FONT_SIZE=16, ORIENTATION=90)
 
  specplot1.save, filename, RESOLUTION=1200

  RETURN, 1
END
;========================================================================================================================


;========================================================================================================================
FUNCTION STACKSPEC2xn, xdata, xoptions, FILENAME=filename, USEFULLERR=usefullerr
  
  
  IF keyword_set(FILENAME) THEN filename = string(filename[0]) ELSE filename = 'composite_stackspec_new.eps' ;set default
 
  ;;;setup
  print, '  Stacked Spectra for MZR plot 2xn ...' ;print info
  size = size(xdata)                              ;number of stacked spectra
  xstep = 0.4                                     ;divy up the horizontal space
  ystep = (0.8 / size[1])                         ;divy up the vertical space
  ymin = -0.9
  ymax = 2.1
  

  ;;;get emission lines
  speclines, 'balmer', VALS=values
  chk = where((values.lines GT xoptions.wavemin) AND (values.lines LT xoptions.wavemax))
  IF chk[0] NE -1 THEN BEGIN
     names = values.names[chk]
     waves = values.lines[chk]
  ENDIF
  speclines, 'nonbalmer', VALS=values
  chk = where((values.lines GT xoptions.wavemin) AND (values.lines LT xoptions.wavemax))
  IF chk[0] NE -1 THEN BEGIN
     help, values[chk].names
     names = [names,values.names[chk]]
     waves = [waves,values.lines[chk]]
  ENDIF

  
  ;;;set up window
  IF (125*size[1] LT 800) THEN ysize = 200*size[1] ELSE ysize = 800 ;so plot doesnt go off screen
  w = window(LOCATION=[200,0], DIMENSIONS=[800,ysize])              ;window


  FOR xx=0, 1, 1 DO BEGIN                                                                ;loop over spectra
     FOR yy=0, size[1]-1, 1 DO BEGIN                                                     ;loop over spectra        
        IF (xx EQ 0) THEN label =  strcompress('Field Bin ' + string(size[1]-yy)) ELSE $ ;define label
           label = strcompress('Cluster Bin ' + string(size[1]-yy))                      ;define label
        IF (xx EQ 0) THEN ytickname = '' ELSE ytickname = replicate('', 6)               ;tick names
        IF (yy EQ 0) THEN xtickname = '' ELSE xtickname = replicate('', 6)               ;tick names
        IF (yy EQ size[1]-1) THEN ygap = 0.5 ELSE ygap = 0.0                             ;space at the top
        
        isthere = strpos(xdata[yy,xx], 'EMPTY')
        IF (isthere EQ -1) THEN BEGIN
           spdata = mrdfits(xdata[yy,xx], 1, hdr, /SILENT)           ;read in file
           ndata = fxpar(hdr, 'NSTCK')                               ;get hdr info
           avemass = fxpar(hdr, 'STCKMAVE')                          ;get hdr info
           eavemass = string(floor(avemass))                         ;calculate average mass
           bavemass = string(10^(avemass-eavemass), FORMAT='(F4.2)') ;out of log space
           savemass = strcompress('$\langle M_{*} \rangle$ ='+bavemass + '$\times 10^{'+eavemass+'}$ M$_\Sun$' , /REMOVE_ALL)
           IF keyword_set(USEFULLERR) THEN specerr = spdata.spec1dfullwei ELSE specerr = spdata.spec1dwei ;pick the error
           specplot1 = plot(spdata.lambdas, spdata.spec1d, /CURRENT, $
                            XRANGE=[xoptions.wavemin,xoptions.wavemax], $
                            XTICKNAME=xtickname, $
                            YTICKNAME=ytickname, $
                            YRANGE=[ymin,ymax], $
                            LAYOUT=[2,size[1],xx+yy],$
                            POSITION=[0.1+(xx*xstep),0.1+yy*ystep,0.1+((xx+1)*xstep),0.1+(yy+1)*ystep])
           specplot1 = plot([spdata.lambdas[0],spdata.lambdas,spdata.lambdas[-1],spdata.lambdas[0]], $
                            ([0.0, specerr^0.5,0.0,0.0]-0.5), 'grey', $
                            FILL_BACKGROUND=1, FILL_COLOR='grey', $
                            /CURRENT, /OVERPLOT)
           xtext1 = text((0.1+0.4*xstep)+xx*xstep,(0.1+0.8*ystep)+yy*ystep,label, FONT_SIZE=10)
           xtext2 = text((0.1+0.4*xstep)+xx*xstep,(0.1+0.7*ystep)+yy*ystep,strcompress('N='+string(ndata), /REMOVE_ALL), FONT_SIZE=11)
           IF (avemass NE 0) THEN xtext3 = text((0.1+0.4*xstep)+xx*xstep,(0.1+0.6*ystep)+yy*ystep, savemass, FONT_SIZE=10)
           FOR zz=0, n_elements(names)-1, 1 DO BEGIN
              specplot1 = plot([waves[zz],waves[zz]], [ymin,ymax-ygap], /OVERPLOT, LINESTYLE='--', THICK=1, /DATA, $
                               XMAJOR=specplot1.xmajor, YMAJOR=specplot1.xmajor)
              IF (yy EQ size[1]-1) THEN xtext4 = text(waves[zz]-2*(zz), ymax-0.35, names[zz], FONT_SIZE=8, TARGET=specplot1, /DATA)
           ENDFOR
        ENDIF
     ENDFOR                     ;end loop over spectra
  ENDFOR                        ;end loop over spectra


  titletext = text(0.35,0.92,'KEMCLASS Stacked Spectra', FONT_SIZE=15)
  xaxtext = text(0.35,0.025,'Rest Frame Wavelength [$\AA$]', FONT_SIZE=15)
  yaxtext = text(0.04,0.36,'Flux [arbitrary units]', FONT_SIZE=15, ORIENTATION=90)

   
  specplot1.save, filename, RESOLUTION=1200

  RETURN, 1
END
;========================================================================================================================



;========================================================================================================================
PRO COMPOSITE_SPEC_PLOTS, USEFILE=usefile, YOURFILE=yourfile, AUXFILE=auxfile, $
                          SPECZHISTALL=speczhistall, SPECZHISTBCG=speczhistbcg, SPECZHISTG1=speczhistg1, $
                          SPECZDENSITYALL=speczdensityall, $
                          PHOTOZOD=photozod, DEDICA=dedica, CLUSTERIN=clusterin, $
                          BPT=BPT, IRACAGN=iracagn, $
                          MZRINDIV=mzrindiv, MZRSTACK=mzrstack, SPECSTACK=specstack, $
                          RSFULLFOV=rsfullfov, RSSUBFOV=rssubfov, SBSFULLFOV=sbsfullfov, SBSSUBFOV=sbssubfov, $
                          WEPSILON=wepsilon, $

                          ZMINCL=zmincl, ZMAXCL=zmaxcl, ZMING1=zming1, ZMAXG1=zmaxg1, $
                          HISTZMIN=histzmin, HISTZMAX=histzmax, HISTZBINSZ=histzbinsz, $
                          HISTZMINNAR=histzminnar, HISTZMAXNAR=histzmaxnar, HISTZBINSZNAR=histzbinsznar, $
                          HELP=help


;+
; NAME:
;       COMPOSITE_SPEC_PLOTS()
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
  version = '2-0-0'


  
  ;;;set default values
  options = {FILE:'hithere', AUXFILE:'hithere2', NWIN:1, WEPSILON:750.0, $
             bcgrasex:'', bcgdecsex:'', bcgradeg:0.0D, bcgdecdeg:0.0D, $
             g1rasex:'', g1decsex:'', g1radeg:0.0D, g1decdeg:0.0D, $
             g2rasex:'', g2decsex:'', g2radeg:0.0D, g2decdeg:0.0D, $
             g3rasex:'', g3decsex:'', g3radeg:0.0D, g3decdeg:0.0D, $
             g4rasex:'00:00:00.00', g4decsex:'-00:00:00.0', g4radeg:0.0D, g4decdeg:0.0D, $
             zmincluster:1.622, zmaxcluster:1.644, zming1:0.0, zmaxg1:0.0, $
             pzmincluster:0.0, pzmaxcluster:0.0, $
             histzmin:0.5, histzmax:3.0, histzbinsz:0.05, histzminnar:1.5, histzmaxnar:1.7, histzbinsznar:0.01, $
             rsxmin:16.0, rsxmax:24.0, rsymin:-2.0, rsymax:6.0, $
             sbsxmin:16.0, sbsxmax:24.0, sbsymin:-1.5, sbsymax:2.0, $
             whichclin:'D', $
             bptxmin:-2.0, bptxmax:0.99, bptymin:-1.1, bptymax:1.5, $
             iracagnxmin:-0.45, iracagnxmax:0.85, iracagnymin:-0.65, iracagnymax:1.35, $
             wavemin:6470, wavemax:6770, $
             pzangsize:5.7750887*1.0 }


  ;;;Mass-metallicty relation binned spectra
  IF keyword_set(SPECSTACK) THEN BEGIN ;if
     specs = [['composite_spectra_stack_cluster_lowmass_v2-2.fits','composite_spectra_stack_cluster_highmass_v2-2.fits'],$
              ['composite_spectra_stack_field_lowmass_v2-2.fits','composite_spectra_stack_field_highmass_v2-2.fits']]
     chk = stackspec2x2(specs, options)                       ;plot stacked spectra
     IF chk EQ 1 THEN print, '    ...created successfully' ;print info
     options.nwin = options.nwin + 1                       ;up number of windows     
  ENDIF
  
  IF keyword_set(MZRSTACK) THEN BEGIN                                               ;if 
     data = mrdfits('composite_spectra_stack_cat_v2-2.fits', 1, hdr)                ;
     chk = plot_mzr(data.mass, 'N2', HAFLUX=data.ha_flux, NIIFLUX=data.niir_flux, $ ;cont next line
                    CLMEM=data.cluster, NS=data.nstck, /STACK)                      ;plot mzr
     IF chk EQ 1 THEN print, '    ...created successfully'                          ;print info
     options.nwin = options.nwin + 1                                                ;up number of windows     
  ENDIF


END
;========================================================================================================================
