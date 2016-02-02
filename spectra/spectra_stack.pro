;+
; NAME:
;       SPECTRA_STACK()
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
;       A. DeGroot, 2015 May 22, Univ. Cali, Riverside v2.1.0
;          -removed stacking part to other OOP code
;       A. DeGroot, 2015 May 12, Univ. Cali, Riverside v2.0.0
;          -massive upgrade for flexibility
;       A. DeGroot, 2014 Sep 11, Univ. Cali, Riverside v1.0.0
;          -inception
; 
;
; DESIRED UPGRADES
;     
;
;-



;========================================================================================================================
FUNCTION spectra_fillkeystruc, xkeystruc, xbin, minmass, maxmass, mindense, maxdense, minagn, maxagn, $
                               minq, maxq
  
  xkeystruc.key = xbin
  xkeystruc.minlogMstar = minmass
  xkeystruc.maxlogMstar = maxmass
  xkeystruc.mindense = mindense
  xkeystruc.maxdense = maxdense
  xkeystruc.minagn = minagn
  xkeystruc.maxagn = maxagn
  xkeystruc.minq = minq
  xkeystruc.maxq = maxq


  RETURN, xkeystruc
END
;========================================================================================================================



;========================================================================================================================
FUNCTION spectra_fillstruc, xstruc, xmask, xobj, xmass, xbin



  CASE strcompress(xmask, /REMOVE_ALL) OF
     'CDFS44_mask1_1.0_H' : BEGIN
        file = strcompress('CDFS44_mask1_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/'
     END
     'CDFS44_mask2_1.0_H' : BEGIN
        file = strcompress('CDFS44_mask2_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/'
     END
     'CDFS44_mask3_1.0_H' : BEGIN
        file = strcompress('CDFS44_mask3_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/'
     END
     'CDFS44_mask4_1.0_H' : BEGIN
        file = strcompress('CDFS44_mask4_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/'
     END
     'cdfs44_mask5_v2_H' : BEGIN
        file = strcompress('cdfs44_mask5_v2_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask5_v2/2014nov16/H/'
     END
     'cdfs44_mask6_v2_H' : BEGIN
        file = strcompress('cdfs44_mask6_v2_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask6_v2/2014nov16/H/'
     END
     'cdfs44_mask7_v2_H' : BEGIN
        file = strcompress('cdfs44_mask7_v2_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask7_v2/2014nov17/H/'
     END
     'cdfs44_mask8_v2_H' : BEGIN
        file = strcompress('cdfs44_mask8_v2_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask8_v2/2014nov17/H/'
     END
     'XMM113_mask1_1.0_H' : BEGIN
        file = strcompress('XMM113_mask1_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/'
     END
     'XMM113_mask2_1.0_H' : BEGIN
        file = strcompress('XMM113_mask2_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/'
     END
     'XMM113_mask3_1.0' : BEGIN
        file = strcompress('XMM113_mask3_1.0_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask3_1.0/2012nov25/H/'
     END
     'XMM113_mask5' : BEGIN
        file = strcompress('XMM113_mask5_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask5/2014aug16/H/'
     END
     'XMM113_mask6_H' : BEGIN
        file = strcompress('XMM113_mask6_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/'
     END
     'XMM113_mask7_H' : BEGIN
        file = strcompress('XMM113_mask7_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/'
     END
     'xmm113_mask8_v1_H' : BEGIN
        file = strcompress('xmm113_mask8_v1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask8_v1/2014nov16/H/'
     END
     'xmm113_mask9_v1_H' : BEGIN
        file = strcompress('xmm113_mask9_v1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask9_v1/2015feb23/H/'
     END
     'xmm105_mask1_v1_H' : BEGIN
        file = strcompress('xmm105_mask1_v1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/xmm105_mask1_v1/2014nov17/H/'
     END
     'xmm105_mask2_v1' : BEGIN
        file = strcompress('xmm105_mask2_v1_H_' + xobj + '_eps_1d_v11.fits', /REMOVE_ALL)
        dir = '/Users/adegroot/research/dataredux/mosfire/xmm105_mask2_v1/2014nov17/H/'
     END

     ELSE : BEGIN
        print, 'WARNING!! Something has gone horribly wrong!'
        print, ' Mask option not found: ', xmask
     ENDELSE
  END


  xstruc.spec = file
  xstruc.directory = dir
  xstruc.logMstar = xmass
  xstruc.key = xbin


  RETURN, xstruc
END
;========================================================================================================================



;========================================================================================================================
PRO prep_spectra_stack, xfile, HAKEY=hakey, NULLFLUX=nullflux, MASKKEY=maskkey, OBJKEY=objkey, $ 
                        MASSBINS=massbins, MASSKEY=masskey, $
                        DENSEBINS=densebins, DENSEKEY=densekey, AGNBINS=agnbins, AGNKEY=agnkey, QBINS=qbins, QKEY=qkey, $
                        OUTFILE=outfile, $
                        VERBOSE=verbose




  
  ;;;set default values
  IF keyword_set(HAKEY) THEN hakey = hakey[0] ELSE hakey = 'SP_M_HA_FLUX'                      ;set default value
  IF keyword_set(NULLFLUX) THEN nullflux = nullflux[0] ELSE nullflux = -99.0                   ;set default value
  IF keyword_set(MASKKEY) THEN maskkey = maskkey[0] ELSE maskkey = 'SP_M_MASK'                 ;set default value
  IF keyword_set(OBJKEY) THEN objkey = objkey[0] ELSE objkey = 'SP_M_OBJ'                      ;set default value
  IF keyword_set(MASSKEY) THEN masskey = masskey[0] ELSE masskey = 'PH_LMASS'                  ;set default value
  IF keyword_set(DENSEKEY) THEN densekey = densekey[0] ELSE densekey = 'AN_CLMEM'              ;set default value
  IF keyword_set(AGNKEY) THEN agnkey = agnkey[0] ELSE agnkey = 'AN_AGNK06'                     ;set default value
  IF keyword_set(QKEY) THEN qkey = qkey[0] ELSE qkey = 'SP_SPECZFLAG'                          ;set default value
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'spectra_stack_output.fits' ;set default value
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2                           ;set default value


  ;;;read in file(s)
  tmpstruc = {spec:'string', directory:'string', logMstar:0.0, key:'A'}                        ;define template output structure
  tmpkeystruc = {key:'string', minlogMstar:0.0, maxlogMstar:0.0, mindense:0.0, maxdense:0.0, $ ;cont next line
                 minagn:0.0, maxagn:0.0, minq:0.0, maxq:0.0}                                   ;define template key structure
  xdata = mrdfits(xfile, 1, hdr)                                                               ;read in cluster catalog file
  chkfile = file_test(outfile)                                                                 ;check if outfile exists
  IF (chkfile EQ 1) THEN BEGIN                                                                 ;file exists
     IF (verbose GE 1) THEN print, '  OUTFILE already exists. Appending to OUTFILE... '        ;print info
     outstruc = mrdfits(outfile, 1, hdr)                                                       ;read in output file
     leavekey = 1                                                                              ;dont modify key
     ditchfirst = 0                                                                            ;no need to remove first entry
  ENDIF ELSE BEGIN                                                                             ;end file exists
     IF (verbose GE 1) THEN print, '  OUTFILE does not exists. Creating... '                   ;print info
     outstruc = [tmpstruc]                                                                     ;start array
     keystruc = [tmpkeystruc]                                                                  ;start array
     leavekey = 0                                                                              ;dont modify key
     ditchfirst = 1                                                                            ;need to remove null first entry
  ENDELSE                                                                                      ;end file doesnt exist
                                ;help, outstruc, /STRUC
                                ;help, outstruc

  help, xdata, /STRUC
  

  ;;;get structre tag names
  chk = tag_exist(xdata, hakey, INDEX=haind)        ;find necessary tag
  text = '   This code requires a Halpha keyword: ' ;text to pass
  IF chk EQ 0 THEN haind = tagprompt(xdata, text)   ;find necessary tag
  chk = tag_exist(xdata, maskkey, INDEX=maskind)    ;find necessary tag
  text = '   This code requires a mask keyword: '   ;text to pass
  IF chk EQ 0 THEN maskind = tagprompt(xdata, text) ;find necessary tag
  chk = tag_exist(xdata, objkey, INDEX=objind)      ;find necessary tag
  text = '   This code requires a object keyword: ' ;text to pass
  IF chk EQ 0 THEN objind = tagprompt(xdata, text)  ;find necessary tag

  IF keyword_set(MASSBINS) THEN BEGIN                                              ;if MASSBINS set
     chk = tag_exist(xdata, masskey, INDEX=massind)                                ;find necessary tag
     text = '   With MASSBINS keyword set, this requires a mass keyword: '         ;text to pass
     IF chk EQ 0 THEN massind = tagprompt(xdata, text)                             ;find necessary tag
  ENDIF                                                                            ;end MASSBINS set
  IF keyword_set(DENSEBINS) THEN BEGIN                                             ;if DENSEBINS set
     chk = tag_exist(xdata, densekey, INDEX=denseind)                              ;find necessary tag
     text = '   With DENSEBINS keyword set, this requires a density keyword: '     ;text to pass
     IF chk EQ 0 THEN denseind = tagprompt(xdata, text)                            ;find necessary tag
  ENDIF                                                                            ;end DENSEBINS set
  IF keyword_set(AGNBINS) THEN BEGIN                                               ;if AGNBINS set
     chk = tag_exist(xdata, agnkey, INDEX=agnind)                                  ;find necessary tag
     text = '   With AGNBINS keyword set, this requires an AGN keyword: '          ;text to pass
     IF chk EQ 0 THEN agnind = tagprompt(xdata, text)                              ;find necessary tag
  ENDIF                                                                            ;end AGNBINS set
  IF keyword_set(QBINS) THEN BEGIN                                                 ;if QBINS set
     chk = tag_exist(xdata, qkey, INDEX=qind)                                      ;find necessary tag
     text = '   With QBINS keyword set, this requires a spectra quality keyword: ' ;text to pass
     IF chk EQ 0 THEN qind = tagprompt(xdata, text)                                ;find necessary tag
  ENDIF                                                                            ;end QBINS set
  IF (verbose GE 4) THEN print, '     These should be different:', $               ;cont next line
                                haind, maskind, massind, denseind, agnind, qind    ;print, info
  
  
  ;;;make a cut on Ha flux
  chk = where(xdata.(haind) NE nullflux)  ;check that there is an Halpha flux
  IF chk[0] NE -1 THEN xdata = xdata[chk] ;keep only those with Halpha flux


  ;;;Order and recognize bins to divide sample into
  binnames = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', $           ;cont next line
              'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AI', 'AJ', 'AK', $ ;cont next line
              'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ', 'BA', 'BB'] ;bin names
  IF (massind NE -1) THEN massbins = massbins[sort(massbins)]     ;make sure its ordered
  IF (denseind NE -1) THEN densebins = densebins[sort(densebins)] ;make sure its ordered
  IF (agnind NE -1) THEN agnbins = agnbins[sort(agnbins)]         ;make sure its ordered
  IF (qind NE -1) THEN qbins = qbins[sort(qbins)]                 ;make sure its ordered

                                ;binplot = plot([10.0], [1.0], $
                                ;               XTITLE='log(Stellar Mass)', $
                                ;               XRANGE=[massbins[0],massbins[1]], $
                                ;               YTITLE='Environment', $
                                ;               YRANGE=[densebins[0],densebins[1]])
  cnt = 0                       ;start counter
  FOR ww=0, n_elements(massbins)-2, 1 DO BEGIN
     FOR xx=0, n_elements(densebins)-2, 1 DO BEGIN
        FOR yy=0, n_elements(agnbins)-2, 1 DO BEGIN
           FOR zz=0, n_elements(qbins)-2, 1 DO BEGIN
              chk = where((xdata.(massind) GE massbins[ww]) AND (xdata.(massind) LT massbins[ww+1]) AND $
                          (xdata.(denseind) GE densebins[xx]) AND (xdata.(denseind) LT densebins[xx+1]) AND $
                          (xdata.(agnind) GE agnbins[yy]) AND (xdata.(agnind) LT agnbins[yy+1]) AND $
                          (xdata.(qind) GE qbins[zz]) AND (xdata.(qind) LT qbins[zz+1]))
              IF (chk[0] NE -1) THEN BEGIN
                 addkeystruc = spectra_fillkeystruc(tmpkeystruc, binnames[cnt], massbins[ww], massbins[ww+1], densebins[xx], densebins[xx+1], $
                                                    agnbins[yy], agnbins[yy+1], qbins[zz], qbins[zz+1])
                 IF (leavekey EQ 0) THEN keystruc = [keystruc, addkeystruc]
                 
                 FOR ii=0, n_elements(chk)-1, 1 DO BEGIN
                    addstruc = spectra_fillstruc(tmpstruc, xdata[chk[ii]].(maskind), xdata[chk[ii]].(objind), $
                                                 xdata[chk[ii]].(massind), binnames[cnt])
                    outstruc = [outstruc, addstruc]
                 ENDFOR
              ENDIF
              cnt = cnt + 1     ;up counter regardless; keeps bins consistant
           ENDFOR
        ENDFOR
     ENDFOR
  ENDFOR
  

  ;;;write files
  IF (ditchfirst EQ 1) THEN BEGIN
     outstruc = outstruc[1:-1]  ;remove first entry
     keystruc = keystruc[1:-1]  ;remove first entry
  ENDIF
  mwrfits, outstruc, outfile, /CREATE                            ;write file
  keyoutfile = outfile                                           ;copy name
  strreplace, keyoutfile, '.fits', '_key.fits'                   ;append name
  IF (leavekey EQ 0) THEN mwrfits, keystruc, keyoutfile, /CREATE ;write file

  

END
;========================================================================================================================



;========================================================================================================================
PRO call_spectra_stack

  compile_opt idl2
    
  massbins = [9.0, 10.2, 11.0]
  densebins = [-0.5, 0.5, 1.5]
  agnbins = [-0.5, 1.5, 2.5]
  qbins = [-0.5, 1.5, 2.5, 3.5]


  mystkset = obj_new('specstackset', PRESET='CURRENT', DATASET='COMPOSITE')      ;initiate object
  mystkset.getprop, DATASET=mydata, PRESET=presets                               ;get property
  myfile = mystkset.getfile()                                                    ;get the file for the subset
  print, 'Using file: ', myfile                                                  ;print info
  myspecs = mystkset.readfile(myfile)                                            ;read the file
  mypresets = mystkset.getpresets(presets)                                       ;read the file
  status = mystkset.makestacks(myspecs, mypresets, SUBSETS=['A', 'G', 'M', 'S'], $
                              SPECVER='2-3-0', NEWSPECVER='2-4-0') ;make the stacks


                                ;status = mystkset.plotstackspec()
                                ;;;;want to do this next
  

  ;infile = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/CDFS44_pz_specz_full_v3-6-0.fits'
  ;prep_spectra_stack, infile, OUTFILE=outfile, MASSBINS=massbins, DENSEBINS=densebins, AGNBINS=agnbins, QBINS=qbins

  ;infile = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/xmm113_pz_specz_full_v1-2-0.fits'
  ;outfile = 'xmm113_spectra_stack_input_v1-0.fits'
  ;prep_spectra_stack, infile, OUTFILE=outfile, MASSBINS=massbins, DENSEBINS=densebins, AGNBINS=agnbins, QBINS=qbins

  ;infile = '/Users/adegroot/research/clusters/xmm/xmm105/catalogs/xmm105_pz_specz_full_v2-2-0.fits'
  ;outfile = 'xmm105_spectra_stack_input_v2-0.fits'
  ;prep_spectra_stack, infile, OUTFILE=outfile, MASSBINS=massbins, DENSEBINS=densebins, AGNBINS=agnbins, QBINS=qbins


END
;========================================================================================================================
