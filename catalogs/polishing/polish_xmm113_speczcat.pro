;========================================================================================================================
PRO polish_xmm113_speczcat, FILE1=file1, FILE2=file2, FILE3=file3, FILE4=file4, $
                            PRE1=pre1, PRE2=pre2, PRE3=pre3, PRE4=pre4, $
                            INDIR1=indir1, INDIR2=indir2, INDIR3=indir3, INDIR4=indir4, $
                            OUTFILE=outfile, OUTDIR=outdir


;+
; NAME:
;       POLISH_XMM113_SPECZCAT()
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
;-
  version = '1-0-0'

  print, 'Hello World!!'


  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'xmm113_mosfire_specz_v2-1.fits'
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/spectroscopic/'
  IF keyword_set(PRE1) THEN pre1 = pre1[0] ELSE pre1 = 'm_'
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = 'xmm113_fors2_specz_v1-0.fits'
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/spectroscopic/'
  IF keyword_set(PRE2) THEN pre2 = pre2[0] ELSE pre2 = 'g_'
  IF keyword_set(FILE3) THEN file3 = file3[0] ELSE file3 = ''
  IF keyword_set(INDIR3) THEN indir3 = indir3[0] ELSE indir3 = ''
  IF keyword_set(PRE3) THEN pre3 = pre3[0] ELSE pre3 = 'j_'
  IF keyword_set(FILE4) THEN file4 = file4[0] ELSE file4 = ''
  IF keyword_set(INDIR4) THEN indir4 = indir4[0] ELSE indir4 = ''
  IF keyword_set(PRE4) THEN pre4 = pre4[0] ELSE pre4 = 'p_'
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'xmm113_composite_specz_v2-0.fits'
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/spectroscopic/'


  ;;;housekeeping
  file1 = strcompress(indir1 + file1, /REMOVE_ALL)     ;concatenate
  file2 = strcompress(indir2 + file2, /REMOVE_ALL)     ;concatenate
  ;file3 = strcompress(indir3 + file3, /REMOVE_ALL)     ;concatenate
  ;file4 = strcompress(indir4 + file4, /REMOVE_ALL)     ;concatenate
  outfile = strcompress(outdir + outfile, /REMOVE_ALL) ;concatenate


  ;;;read in files
  data1 = mrdfits(file1, 1, hdr1)                     ;read in file
  IF file2 NE '' THEN data2 = mrdfits(file2, 1, hdr2) ;read in file
  IF file3 NE '' THEN data3 = mrdfits(file3, 1, hdr3) ;read in file
  IF file4 NE '' THEN data4 = mrdfits(file4, 1, hdr4) ;read in file

 
  ;;;organize shit
  tags1 = tag_names(data1)                          ;get tag names
  tags1 = strcompress(pre1 + tags1, /REMOVE_ALL)    ;prefix tag names
  tottags = [tags1]                                 ;start collecting
  ndata = n_elements(data1.(0))                     ;start collecting
  tags2 = tag_names(data2)                          ;get tag names
  tags2 = strcompress(pre2 + tags2, /REMOVE_ALL)    ;prefix tag names
  tottags = [tottags, tags2]                        ;concatenate
  ndata = ndata + n_elements(data2.(0))             ;add to number
  IF file3 NE '' THEN BEGIN                         ;if file4 exists 
     tags3 = tag_names(data3)                       ;get tag names
     tags3 = strcompress(pre3 + tags3, /REMOVE_ALL) ;prefix tag names
     tottags = [tottags, tags3]                     ;concatenate
     ndata = ndata + n_elements(data3.(0))          ;add to number
  ENDIF                                             ;end if file4 exists
  IF file4 NE '' THEN BEGIN                         ;if file4 exists 
     tags4 = tag_names(data4)                       ;get tag names
     tags4 = strcompress(pre4 + tags4, /REMOVE_ALL) ;prefix tag names
     tottags = [tottags, tags4]                     ;concatenate
     ndata = ndata + n_elements(data4.(0))          ;add to number
  ENDIF                                             ;end if file4 exists

  ;;;create uber-structure to fill
  startstruc = {ID:0, RABEST:0.0D, DECBEST:0.0D, SPECZBEST:0.0, SPECZFLAG:0, SPECZDIFF:0}
  FOR xx=0, n_elements(tags1)-1, 1 DO BEGIN
     add_tag, startstruc, tags1[xx], data1[0].(xx), tmpstruc
     startstruc = tmpstruc
     tmpstruc = 0
  ENDFOR
  FOR xx=0, n_elements(tags2)-1, 1 DO BEGIN
     add_tag, startstruc, tags2[xx], data2[0].(xx), tmpstruc
     startstruc = tmpstruc
     tmpstruc = 0
  ENDFOR
  IF file3 NE '' THEN BEGIN     ;if file3 exists 
     FOR xx=0, n_elements(tags3)-1, 1 DO BEGIN
        add_tag, startstruc, tags3[xx], data3[0].(xx), tmpstruc
        startstruc = tmpstruc
        tmpstruc = 0
     ENDFOR
  ENDIF                         ;end if file3 exists
  IF file4 NE '' THEN BEGIN     ;if file4 exists 
     FOR xx=0, n_elements(tags4)-1, 1 DO BEGIN
        add_tag, startstruc, tags4[xx], data4[0].(xx), tmpstruc
        startstruc = tmpstruc
        tmpstruc = 0
     ENDFOR
  ENDIF                         ;end if file4 exists
  FOR xx=0, n_elements(tag_names(startstruc))-1, 1 DO BEGIN
     tmp = startstruc.(xx)
     CASE typename(tmp) OF
        'INT' : startstruc.(xx) = -99
        'UINT' : startstruc.(xx) = -99
        'LONG' : startstruc.(xx) = -99
        'ULONG' : startstruc.(xx) = -99
        'LONG64' : startstruc.(xx) = -99
        'ULONG64' : startstruc.(xx) = -99
        'FLOAT' : startstruc.(xx) = -99.0
        'STRING' : startstruc.(xx) = '-99'
        'DOUBLE' : startstruc.(xx) = -99.0D
        ELSE : print, '####Unknown data type!!!', typename(tmp)
     ENDCASE
  ENDFOR
  outstruc = replicate(startstruc, ndata)


  ;;;now fill in the structure
  ;;;first just the first file
  FOR xx=0, n_elements(tags1)-1, 1 DO BEGIN
     FOR yy=0, n_elements(data1.(0))-1, 1 DO BEGIN
        chk = tag_exist(outstruc, tags1[xx], INDEX=ind)
        outstruc[yy].(ind) = data1[yy].(xx)
        outstruc[yy].(0) = yy
     ENDFOR
  ENDFOR

  ;;;and now the second file
  IF file2 NE '' THEN BEGIN     ;if file2 exists 
     close_match_radec, data2.ra, data2.dec, outstruc.m_ra, outstruc.m_dec, match2, matchout, (3.0/3600.0), 1, miss2
     FOR xx=0, n_elements(tags2)-1, 1 DO BEGIN
        FOR yy=0, n_elements(match2)-1, 1 DO BEGIN
           chk = tag_exist(outstruc, tags2[xx], INDEX=ind)
           outstruc[matchout[yy]].(ind) = data2[match2[yy]].(xx)
        ENDFOR
     ENDFOR
     chk = where(outstruc.(0) EQ -99.0)
     newstart = min(chk)
     FOR xx=0, n_elements(tags2)-1, 1 DO BEGIN
        FOR yy=newstart, n_elements(miss2)+newstart-1, 1 DO BEGIN
           chk = tag_exist(outstruc, tags2[xx], INDEX=ind)
           outstruc[yy].(ind) = data2[miss2[yy-newstart]].(xx)
           outstruc[yy].(0) = yy
        ENDFOR
     ENDFOR
  ENDIF                         ;end if file2 exists


  ;;;and the third file
  IF file3 NE '' THEN BEGIN     ;if file3 exists 
     close_match_radec, data3.ra, data3.dec, outstruc.m_ra, outstruc.m_dec, match3, matchout, (3.0/3600.0), 1, miss3
     FOR xx=0, n_elements(tags3)-1, 1 DO BEGIN
        FOR yy=0, n_elements(match3)-1, 1 DO BEGIN
           chk = tag_exist(outstruc, tags3[xx], INDEX=ind)
           outstruc[matchout[yy]].(ind) = data3[match3[yy]].(xx)
        ENDFOR
     ENDFOR
     data3 = data3[miss3]       ;cut matched objects
     close_match_radec, data3.ra, data3.dec, outstruc.g_ra, outstruc.g_dec, match3, matchout, (3.0/3600.0), 1, miss3
     FOR xx=0, n_elements(tags3)-1, 1 DO BEGIN
        FOR yy=0, n_elements(match3)-1, 1 DO BEGIN
           chk = tag_exist(outstruc, tags3[xx], INDEX=ind)
           outstruc[matchout[yy]].(ind) = data3[match3[yy]].(xx)
        ENDFOR
     ENDFOR
     chk = where(outstruc.(0) EQ -99.0)
     newstart = min(chk)
     FOR xx=0, n_elements(tags3)-1, 1 DO BEGIN
        FOR yy=newstart, n_elements(miss3)+newstart-1, 1 DO BEGIN
           chk = tag_exist(outstruc, tags3[xx], INDEX=ind)
           outstruc[yy].(ind) = data3[miss3[yy-newstart]].(xx)
           outstruc[yy].(0) = yy
        ENDFOR
     ENDFOR
  ENDIF                         ;end if file3 exists
  


  ;;;and the fourth file
  IF file4 NE '' THEN BEGIN     ;if file4 exists 
     close_match_radec, data4.ra, data4.dec, outstruc.m_ra, outstruc.m_dec, match4, matchout, (3.0/3600.0), 1, miss4
     FOR xx=0, n_elements(tags4)-1, 1 DO BEGIN
        FOR yy=0, n_elements(match4)-1, 1 DO BEGIN
           chk = tag_exist(outstruc, tags4[xx], INDEX=ind)
           outstruc[matchout[yy]].(ind) = data4[match4[yy]].(xx)
        ENDFOR
     ENDFOR
     data4 = data4[miss4]       ;cut matched objects
     close_match_radec, data4.ra, data4.dec, outstruc.g_ra, outstruc.g_dec, match4, matchout, (3.0/3600.0), 1, miss4
     FOR xx=0, n_elements(tags4)-1, 1 DO BEGIN
        FOR yy=0, n_elements(match4)-1, 1 DO BEGIN
           chk = tag_exist(outstruc, tags4[xx], INDEX=ind)
           outstruc[matchout[yy]].(ind) = data4[match4[yy]].(xx)
        ENDFOR
     ENDFOR
     close_match_radec, data4.ra, data4.dec, outstruc.j_ra, outstruc.j_dec, match4, matchout, (3.0/3600.0), 1, miss4
     FOR xx=0, n_elements(tags4)-1, 1 DO BEGIN
        FOR yy=0, n_elements(match4)-1, 1 DO BEGIN
           chk = tag_exist(outstruc, tags4[xx], INDEX=ind)
           outstruc[matchout[yy]].(ind) = data4[match4[yy]].(xx)
        ENDFOR
     ENDFOR
     chk = where(outstruc.(0) EQ -99.0)
     newstart = min(chk)
     FOR xx=0, n_elements(tags4)-1, 1 DO BEGIN
        FOR yy=newstart, n_elements(miss4)+newstart-1, 1 DO BEGIN
           chk = tag_exist(outstruc, tags4[xx], INDEX=ind)
           outstruc[yy].(ind) = data4[miss4[yy-newstart]].(xx)
           outstruc[yy].(0) = yy
        ENDFOR
     ENDFOR
  ENDIF                         ;end if file4 exists



  ;;;now comparisons and cleaning
  chk = where(outstruc.(0) EQ -99.0, COMPLEMENT=keep)     ;find unfilled rows
  IF chk[0] NE -1 THEN outstruc = outstruc[keep]          ;keep filled rows
  chk = where(outstruc.speczdiff EQ -99, COMPLEMENT=keep) ;find unfilled rows
  IF chk[0] NE -1 THEN outstruc[chk].speczdiff = 0        ;keep filled rows
  

  ;;;detections only found in one catalog
  chk = where(((outstruc.m_z NE -99.) OR (outstruc.m_rah NE -99.)) AND (outstruc.g_z_fors2 EQ -99.) AND $
              ;(outstruc.j_specz EQ -99.) AND $
              ;(outstruc.p_z EQ -99.) AND $
              (outstruc.speczbest EQ -99.))
  IF chk[0] NE -1 THEN BEGIN
     outstruc[chk].speczbest = outstruc[chk].m_z 
     outstruc[chk].speczflag = outstruc[chk].m_qflag_mosfire 
     outstruc[chk].rabest = outstruc[chk].m_ra 
     outstruc[chk].decbest = outstruc[chk].m_dec 
  ENDIF

  chk = where((outstruc.m_z EQ -99.) AND ((outstruc.g_z_fors2 NE -99.) OR (outstruc.g_ra NE -99.)) AND $
              ;(outstruc.j_specz EQ -99.) AND $
              ;(outstruc.p_z EQ -99.) AND $
              (outstruc.speczbest EQ -99.))
  IF chk[0] NE -1 THEN BEGIN
     outstruc[chk].speczbest = outstruc[chk].g_z_fors2
     chk2 = where((outstruc[chk].g_qflag_fors2 EQ 0) OR (outstruc[chk].g_qflag_fors2 EQ 2) OR $
                                        (outstruc[chk].g_qflag_fors2 EQ 5) OR (outstruc[chk].g_qflag_fors2 EQ 7))
     IF chk2[0] NE -1 THEN outstruc[chk[chk2]].speczflag = 1
     chk2 = where((outstruc[chk].g_qflag_fors2 EQ 1) OR (outstruc[chk].g_qflag_fors2 EQ 6))
     IF chk2[0] NE -1 THEN outstruc[chk[chk2]].speczflag = 2
     chk2 = where((outstruc[chk].g_qflag_fors2 EQ 3) OR (outstruc[chk].g_qflag_fors2 EQ 8))
     IF chk2[0] NE -1 THEN outstruc[chk[chk2]].speczflag = 3
     outstruc[chk].rabest = outstruc[chk].g_ra
     outstruc[chk].decbest = outstruc[chk].g_dec
  ENDIF

  IF file3 NE '' THEN BEGIN     ;if file3 exists 
     chk = where((outstruc.m_z EQ -99.) AND (outstruc.g_z_fors2 EQ -99.) AND $
                                ;((outstruc.j_specz NE -99.) OR (outstruc.j_ra NE -99.)) AND $
                                ;(outstruc.p_z EQ -99.) AND $
                 (outstruc.speczbest EQ -99.))
     IF chk[0] NE -1 THEN BEGIN
        outstruc[chk].speczbest = outstruc[chk].j_specz
        chk2 = where((strcompress(outstruc[chk].j_notes, /REMOVE_ALL) EQ 'high-confidence'))
        IF chk2[0] NE -1 THEN outstruc[chk[chk2]].speczflag = 1
        chk2 = where((strcompress(outstruc[chk].j_notes, /REMOVE_ALL) EQ 'new'))
        IF chk2[0] NE -1 THEN outstruc[chk[chk2]].speczflag = 2
        chk2 = where((strcompress(outstruc[chk].j_notes, /REMOVE_ALL) EQ 'low-confidence'))
        IF chk2[0] NE -1 THEN outstruc[chk[chk2]].speczflag = 3
        outstruc[chk].rabest = outstruc[chk].j_ra
        outstruc[chk].decbest = outstruc[chk].j_dec
     ENDIF
  ENDIF


  IF file4 NE '' THEN BEGIN     ;if file3 exists 
     chk = where((outstruc.m_z EQ -99.) AND (outstruc.g_z_fors2 EQ -99.) AND $
                                ;(outstruc.j_specz EQ -99.) AND $
                                ;((outstruc.p_z NE -99.) OR (outstruc.p_ra NE -99.)) AND $
                 (outstruc.speczbest EQ -99.))
     IF chk[0] NE -1 THEN BEGIN
        outstruc[chk].speczbest = outstruc[chk].p_z
        chk2 = where((outstruc[chk].p_zquality EQ 4))
        IF chk2[0] NE -1 THEN outstruc[chk[chk2]].speczflag = 1
        chk2 = where((outstruc[chk].p_zquality EQ 3))
        IF chk2[0] NE -1 THEN outstruc[chk[chk2]].speczflag = 2
        chk2 = where((outstruc[chk].p_zquality EQ 2))
        IF chk2[0] NE -1 THEN outstruc[chk[chk2]].speczflag = 3
        outstruc[chk].rabest = outstruc[chk].p_ra
        outstruc[chk].decbest = outstruc[chk].p_dec
     ENDIF
  ENDIF
  
  ;;;detections found two catalogs
  chk = where(((outstruc.m_z NE -99.) OR (outstruc.m_rah NE -99.)) AND (outstruc.g_z_fors2 NE -99.) AND $
                                ;(outstruc.j_specz EQ -99.) AND $                          ;
                                ;(outstruc.p_z EQ -99.) AND $
              (outstruc.speczbest EQ -99.)) ;mosfire and gillians FORS2
  IF chk[0] NE -1 THEN BEGIN
     chk2 = where((outstruc[chk].m_qflag_mosfire LE 1), COMPLEMENT=fors2)
     IF chk2[0] NE -1 THEN BEGIN
        outstruc[chk[chk2]].speczbest = outstruc[chk[chk2]].m_z 
        outstruc[chk[chk2]].speczflag = outstruc[chk[chk2]].m_qflag_mosfire 
        outstruc[chk[chk2]].rabest = outstruc[chk[chk2]].m_ra 
        outstruc[chk[chk2]].decbest = outstruc[chk[chk2]].m_dec 
     ENDIF
     IF fors2[0] NE -1 THEN BEGIN
        outstruc[chk[fors2]].speczbest = outstruc[chk[fors2]].g_z_fors2
        chk3 = where((outstruc[chk[fors2]].g_qflag_fors2 EQ 0) OR (outstruc[chk[fors2]].g_qflag_fors2 EQ 2) OR $
                     (outstruc[chk[fors2]].g_qflag_fors2 EQ 5) OR (outstruc[chk[fors2]].g_qflag_fors2 EQ 7))
        IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 1
        chk3 = where((outstruc[chk[fors2]].g_qflag_fors2 EQ 1) OR (outstruc[chk[fors2]].g_qflag_fors2 EQ 6))
        IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 2
        chk3 = where((outstruc[chk[fors2]].g_qflag_fors2 EQ 3) OR (outstruc[chk[fors2]].g_qflag_fors2 EQ 8))
        IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 3
        outstruc[chk[fors2]].rabest = outstruc[chk[fors2]].g_ra 
        outstruc[chk[fors2]].decbest = outstruc[chk[fors2]].g_dec 
     ENDIF
     safety = where((outstruc[chk].m_z - outstruc[chk].g_z_fors2) GT 0.01)
     IF safety[0] NE -1 THEN print, 'Redshift discrepancy: ', outstruc[chk[safety]].id
     outstruc[chk[safety]].speczdiff = 1
  ENDIF

  IF file3 NE '' THEN BEGIN                                                                                                                 ;if file3 exists 
     chk = where(((outstruc.m_z NE -99.) OR (outstruc.m_rah NE -99.)) AND (outstruc.g_z_fors2 EQ -99.) AND (outstruc.j_specz NE -99.) AND $ ;
                 (outstruc.p_z EQ -99.) AND (outstruc.speczbest EQ -99.))                                                                   ;mosfire and julie's FORS2
     IF chk[0] NE -1 THEN BEGIN
        chk2 = where((outstruc[chk].m_qflag_mosfire LE 1), COMPLEMENT=fors2)
        IF chk2[0] NE -1 THEN BEGIN
           outstruc[chk[chk2]].speczbest = outstruc[chk[chk2]].m_z 
           outstruc[chk[chk2]].speczflag = outstruc[chk[chk2]].m_qflag_mosfire 
           outstruc[chk[chk2]].rabest = outstruc[chk[chk2]].m_ra 
           outstruc[chk[chk2]].decbest = outstruc[chk[chk2]].m_dec 
        ENDIF
        IF fors2[0] NE -1 THEN BEGIN
           outstruc[chk[fors2]].speczbest = outstruc[chk[fors2]].j_specz
           chk3 = where((strcompress(outstruc[chk[fors2]].j_notes, /REMOVE_ALL) EQ 'high-confidence'))
           IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 1
           chk3 = where((strcompress(outstruc[chk[fors2]].j_notes, /REMOVE_ALL) EQ 'new'))
           IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 2
           chk3 = where((strcompress(outstruc[chk[fors2]].j_notes, /REMOVE_ALL) EQ 'low-confidence'))
           IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 3
           outstruc[chk[fors2]].rabest = outstruc[chk[fors2]].j_ra 
           outstruc[chk[fors2]].decbest = outstruc[chk[fors2]].j_dec 
        ENDIF
        safety = where((outstruc[chk].m_z - outstruc[chk].j_specz) GT 0.01)
        IF safety[0] NE -1 THEN print, 'Redshift discrepancy: ', outstruc[chk[safety]].id
        outstruc[chk[safety]].speczdiff = 1
     ENDIF
  ENDIF


  IF file4 NE '' THEN BEGIN                                                                                                              ;if file3 exists 
     chk = where(((outstruc.m_z NE -99.) OR (outstruc.m_rah NE -99.)) AND (outstruc.g_z_fors2 EQ -99.) AND (outstruc.j_specz EQ -99.) AND $ ;
                 (outstruc.p_z NE -99.) AND (outstruc.speczbest EQ -99.))                                                                   ;mosfire and PRIMUS
     IF chk[0] NE -1 THEN BEGIN
        chk2 = where((outstruc[chk].m_qflag_mosfire LE 1), COMPLEMENT=primus)
        IF chk2[0] NE -1 THEN BEGIN
           outstruc[chk[chk2]].speczbest = outstruc[chk[chk2]].m_z 
           outstruc[chk[chk2]].speczflag = outstruc[chk[chk2]].m_qflag_mosfire 
           outstruc[chk[chk2]].rabest = outstruc[chk[chk2]].m_ra 
           outstruc[chk[chk2]].decbest = outstruc[chk[chk2]].m_dec 
        ENDIF
        IF primus[0] NE -1 THEN BEGIN
           outstruc[chk[primus]].speczbest = outstruc[chk[primus]].p_z
           chk3 = where((outstruc[chk[primus]].p_zquality EQ 4))
           IF chk3[0] NE -1 THEN outstruc[chk[primus[chk3]]].speczflag = 1
           chk3 = where((outstruc[chk[primus]].p_zquality EQ 3))
           IF chk3[0] NE -1 THEN outstruc[chk[primus[chk3]]].speczflag = 2
           chk3 = where((outstruc[chk[primus]].p_zquality EQ 2))
           IF chk3[0] NE -1 THEN outstruc[chk[primus[chk3]]].speczflag = 3
           outstruc[chk[primus]].rabest = outstruc[chk[primus]].p_ra 
           outstruc[chk[primus]].decbest = outstruc[chk[primus]].p_dec 
        ENDIF
        safety = where((outstruc[chk].m_z - outstruc[chk].p_z) GT 0.01)
        IF safety[0] NE -1 THEN print, 'Redshift discrepancy: ', outstruc[chk[safety]].id
        outstruc[chk[safety]].speczdiff = 1
     ENDIF
  ENDIF
  

  IF file3 NE '' THEN BEGIN                                                                                ;if file3 exists 
  chk = where((outstruc.m_z EQ -99.) AND (outstruc.g_z_fors2 NE -99.) AND (outstruc.j_specz NE -99.) AND $ ;
              (outstruc.p_z EQ -99.) AND (outstruc.speczbest EQ -99.))                                     ;gillian's fors2 and julie's fors2
  IF chk[0] NE -1 THEN BEGIN
     chk2 = where((outstruc[chk].g_qflag_fors2 LE 5), COMPLEMENT=fors2)
     IF chk2[0] NE -1 THEN BEGIN
        outstruc[chk[chk2]].speczbest = outstruc[chk[chk2]].g_z_fors2 
        IF chk3[0] NE -1 THEN chk3 = where((outstruc[chk[chk2]].g_qflag_fors2 EQ 0) OR (outstruc[chk[chk2]].g_qflag_fors2 EQ 2) OR $
                     (outstruc[chk[chk2]].g_qflag_fors2 EQ 5) OR (outstruc[chk[chk2]].g_qflag_fors2 EQ 7))
        outstruc[chk[chk2[chk3]]].speczflag = 1
        IF chk3[0] NE -1 THEN chk3 = where((outstruc[chk[chk2]].g_qflag_fors2 EQ 1) OR (outstruc[chk[chk2]].g_qflag_fors2 EQ 6))
        outstruc[chk[chk2[chk3]]].speczflag = 2
        IF chk3[0] NE -1 THEN chk3 = where((outstruc[chk[chk2]].g_qflag_fors2 EQ 3) OR (outstruc[chk[chk2]].g_qflag_fors2 EQ 8))
        outstruc[chk[chk2[chk3]]].speczflag = 3
        outstruc[chk[chk2]].rabest = outstruc[chk[chk2]].g_ra
        outstruc[chk[chk2]].decbest = outstruc[chk[chk2]].g_dec
     ENDIF
     IF fors2[0] NE -1 THEN BEGIN
        outstruc[chk[fors2]].speczbest = outstruc[chk[fors2]].j_specz
        chk3 = where((strcompress(outstruc[chk[fors2]].j_notes, /REMOVE_ALL) EQ 'high-confidence'))
        IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 1
        chk3 = where((strcompress(outstruc[chk[fors2]].j_notes, /REMOVE_ALL) EQ 'new'))
        IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 2
        chk3 = where((strcompress(outstruc[chk[fors2]].j_notes, /REMOVE_ALL) EQ 'low-confidence'))
        IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 3
        outstruc[chk[fors2]].rabest = outstruc[chk[fors2]].j_ra
        outstruc[chk[fors2]].decbest = outstruc[chk[fors2]].j_dec
     ENDIF
     safety = where((outstruc[chk].g_z_fors2 - outstruc[chk].j_specz) GT 0.01)
     IF safety[0] NE -1 THEN print, 'Redshift discrepancy: ', outstruc[chk[safety]].id
     outstruc[chk[safety]].speczdiff = 1
  ENDIF
ENDIF
  

    IF file4 NE '' THEN BEGIN     ;if file3 exists 
  chk = where((outstruc.m_z EQ -99.) AND (outstruc.g_z_fors2 NE -99.) AND (outstruc.j_specz EQ -99.) AND $ ;
              (outstruc.p_z NE -99.) AND (outstruc.speczbest EQ -99.))                                     ;gillians fors2 and primus
  IF chk[0] NE -1 THEN BEGIN
     chk2 = where((outstruc[chk].g_qflag_fors2 LE 5), COMPLEMENT=primus)
     IF chk2[0] NE -1 THEN BEGIN
        outstruc[chk[chk2]].speczbest = outstruc[chk[chk2]].g_z_fors2 
        IF chk3[0] NE -1 THEN chk3 = where((outstruc[chk[chk2]].g_qflag_fors2 EQ 0) OR (outstruc[chk[chk2]].g_qflag_fors2 EQ 2) OR $
                     (outstruc[chk[chk2]].g_qflag_fors2 EQ 5) OR (outstruc[chk[chk2]].g_qflag_fors2 EQ 7))
        outstruc[chk[chk2[chk3]]].speczflag = 1
        IF chk3[0] NE -1 THEN chk3 = where((outstruc[chk[chk2]].g_qflag_fors2 EQ 1) OR (outstruc[chk[chk2]].g_qflag_fors2 EQ 6))
        outstruc[chk[chk2[chk3]]].speczflag = 2
        IF chk3[0] NE -1 THEN chk3 = where((outstruc[chk[chk2]].g_qflag_fors2 EQ 3) OR (outstruc[chk[chk2]].g_qflag_fors2 EQ 8))
        outstruc[chk[chk2[chk3]]].speczflag = 3
        outstruc[chk[chk2]].rabest = outstruc[chk[chk2]].g_ra
        outstruc[chk[chk2]].decbest = outstruc[chk[chk2]].g_dec
     ENDIF
     IF primus[0] NE -1 THEN BEGIN
        outstruc[chk[primus]].speczbest = outstruc[chk[primus]].p_z
        chk3 = where((outstruc[chk[primus]].p_zquality EQ 4))
        IF chk3[0] NE -1 THEN outstruc[chk[primus[chk3]]].speczflag = 1
        chk3 = where((outstruc[chk[primus]].p_zquality EQ 3))
        IF chk3[0] NE -1 THEN outstruc[chk[primus[chk3]]].speczflag = 2
        chk3 = where((outstruc[chk[primus]].p_zquality EQ 2))
        IF chk3[0] NE -1 THEN outstruc[chk[primus[chk3]]].speczflag = 3
        outstruc[chk[primus]].rabest = outstruc[chk[primus]].p_ra 
        outstruc[chk[primus]].decbest = outstruc[chk[primus]].p_dec 
     ENDIF
     safety = where((outstruc[chk].g_z_fors2 - outstruc[chk].p_z) GT 0.01)
     IF safety[0] NE -1 THEN print, 'Redshift discrepancy: ', outstruc[chk[safety]].id
     outstruc[chk[safety]].speczdiff = 1
  ENDIF
ENDIF


    IF (file3 NE '') AND (file4 NE '') THEN BEGIN ;if file3 exists 
       chk = where((outstruc.m_z EQ -99.) AND (outstruc.g_z_fors2 EQ -99.) AND (outstruc.j_specz NE -99.) AND $ ;
                   (outstruc.p_z NE -99.) AND (outstruc.speczbest EQ -99.))                                     ;julie's fors2 and primus
       IF chk[0] NE -1 THEN BEGIN
          chk2 = where((outstruc[chk].p_zquality GE 2), COMPLEMENT=fors2)
          IF chk2[0] NE -1 THEN BEGIN
             outstruc[chk[chk2]].speczbest = outstruc[chk[chk2]].p_z
             chk3 = where((outstruc[chk[chk2]].p_zquality EQ 4))
             IF chk3[0] NE -1 THEN outstruc[chk[chk2[chk3]]].speczflag = 1
             chk3 = where((outstruc[chk[chk2]].p_zquality EQ 3))
             IF chk3[0] NE -1 THEN outstruc[chk[chk2[chk3]]].speczflag = 2
             chk3 = where((outstruc[chk[chk2]].p_zquality EQ 2))
             IF chk3[0] NE -1 THEN outstruc[chk[chk2[chk3]]].speczflag = 3
             outstruc[chk[chk2]].rabest = outstruc[chk[chk2]].p_ra 
             outstruc[chk[chk2]].decbest = outstruc[chk[chk2]].p_dec 
          ENDIF
          IF fors2[0] NE -1 THEN BEGIN
             outstruc[chk[fors2]].speczbest = outstruc[chk[fors2]].j_specz
             chk3 = where((strcompress(outstruc[chk[fors2]].j_notes, /REMOVE_ALL) EQ 'high-confidence'))
             IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 1
             chk3 = where((strcompress(outstruc[chk[fors2]].j_notes, /REMOVE_ALL) EQ 'new'))
             IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 2
             chk3 = where((strcompress(outstruc[chk[fors2]].j_notes, /REMOVE_ALL) EQ 'low-confidence'))
             IF chk3[0] NE -1 THEN outstruc[chk[fors2[chk3]]].speczflag = 3
             outstruc[chk[fors2]].rabest = outstruc[chk[fors2]].j_ra
             outstruc[chk[fors2]].decbest = outstruc[chk[fors2]].j_dec
          ENDIF
          safety = where((outstruc[chk].g_z_fors2 - outstruc[chk].p_z) GT 0.01)
          IF safety[0] NE -1 THEN print, 'Redshift discrepancy: ', outstruc[chk[safety]].id
          outstruc[chk[safety]].speczdiff = 1
       ENDIF
    ENDIF


  ;;;detections found in three catalogs
  ;chk = where((outstruc.m_z NE -99.) AND (outstruc.g_z_fors2 NE -99.) AND (outstruc.j_specz NE -99.) AND $ ;
  ;            (outstruc.p_z EQ -99.) AND (outstruc.speczbest EQ -99.))                                     ;all but primus
  ;IF chk[0] NE -1 THEN BEGIN
  ;   outstruc[chk].speczbest = outstruc[chk].m_z 
  ;   outstruc[chk].speczflag = outstruc[chk].m_qflag_mosfire 
  ;   outstruc[chk].rabest = outstruc[chk].m_ra 
  ;   outstruc[chk].decbest = outstruc[chk].m_dec 
  ;ENDIF
  
  ;chk = where((outstruc.m_z NE -99.) AND (outstruc.g_z_fors2 NE -99.) AND (outstruc.j_specz EQ -99.) AND $ ;
  ;            (outstruc.p_z NE -99.) AND (outstruc.speczbest EQ -99.))                                     ;all but julie's
  ;IF chk[0] NE -1 THEN BEGIN
  ;   outstruc[chk].speczbest = outstruc[chk].m_z 
  ;   outstruc[chk].speczflag = outstruc[chk].m_qflag_mosfire 
  ;   outstruc[chk].rabest = outstruc[chk].m_ra 
  ;   outstruc[chk].decbest = outstruc[chk].m_dec 
  ;ENDIF

  ;chk = where((outstruc.m_z NE -99.) AND (outstruc.g_z_fors2 EQ -99.) AND (outstruc.j_specz NE -99.) AND $ ;
  ;            (outstruc.p_z NE -99.) AND (outstruc.speczbest EQ -99.))                                     ;all but gillian's
  ;IF chk[0] NE -1 THEN BEGIN
  ;   outstruc[chk].speczbest = outstruc[chk].m_z 
  ;   outstruc[chk].speczflag = outstruc[chk].m_qflag_mosfire 
  ;   outstruc[chk].rabest = outstruc[chk].m_ra 
  ;   outstruc[chk].decbest = outstruc[chk].m_dec 
  ;ENDIF

  ;;;write out result
  mwrfits, outstruc, outfile, /CREATE
  




END
;========================================================================================================================
