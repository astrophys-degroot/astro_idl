;========================================================================================================================
PRO polish_cdfs44_totalcat, FILE1=file1, FILE2=file2, $
                            PRE1=pre1, PRE2=pre2, $
                            INDIR1=indir1, INDIR2=indir2, $
                            OUTFILE=outfile, OUTDIR=outdir, RDCOMB=rdcomb


;+
; NAME:
;       POLISH_CDFS44_TOTALCAT()
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




  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'cdfs44_composite_specz_v6-2.fits'                                          ;
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/spectroscopic/' ;
  IF keyword_set(PRE1) THEN pre1 = pre1[0] ELSE pre1 = 'sp_'                                                                           ;
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = 'cdfs44_v3-2_master.fits'                                                   ;
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/julie/'         ;
  IF keyword_set(PRE2) THEN pre2 = pre2[0] ELSE pre2 = 'ph_'                                                                           ;
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'CDFS44_pz_specz_full_v3-5-0.fits'                                  ;
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/'               ;
  IF keyword_set(RDCOMB) THEN rdcomb = strlowcase(string(rdcomb[0])) ELSE rdcomb = 'photo'                                             ;

  ;;;housekeeping
  file1 = strcompress(indir1 + file1, /REMOVE_ALL)     ;concatenate
  file2 = strcompress(indir2 + file2, /REMOVE_ALL)     ;concatenate
  outfile = strcompress(outdir + outfile, /REMOVE_ALL) ;concatenate


  ;;;read in files
  data1 = mrdfits(file1, 1, hdr1) ;read in file
  ;help, data1, /STRUC
  data2 = mrdfits(file2, 1, hdr2) ;read in file
  ;help, data2, /STRUC

 
  ;;;organize shit
  tags1 = tag_names(data1)                          ;get tag names
  tags1 = strcompress(pre1 + tags1, /REMOVE_ALL)    ;prefix tag names
  tottags = [tags1]                                 ;start collecting
  ndata = n_elements(data1.(0))                     ;start collecting
  tags2 = tag_names(data2)                          ;get tag names
  tags2 = strcompress(pre2 + tags2, /REMOVE_ALL)    ;prefix tag names
  tottags = [tottags, tags2]                        ;concatenate
  ndata = ndata + n_elements(data2.(0))             ;add to number


  ;;;create uber-structure to fill
  startstruc = {RAONE:0.0D, DECONE:0.0D}
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
  ;help, outstruc, /STRUC

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
     close_match_radec, data2.ra, data2.dec, outstruc.sp_rabest, outstruc.sp_decbest, match2, matchout, (1.0/3600.0), 1, miss2
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



  ;;;now comparisons and cleaning
  chk = where(outstruc.(0) EQ -99.0, COMPLEMENT=keep) ;find unfilled rows
  IF chk[0] NE -1 THEN outstruc = outstruc[keep]      ;keep filled rows
  
  ;;;fill in a few tags
  chk = where((outstruc.sp_rabest NE -99.0) AND (outstruc.sp_decbest NE -99.0) AND $
              (outstruc.ph_ra NE -99.0) AND (outstruc.ph_dec NE -99.0))
  IF chk[0] NE -1 THEN BEGIN
     CASE rdcomb OF
        
        'photo' : BEGIN                                           ;just take photometric
           FOR xx=0UL, n_elements(chk)-1, 1 DO BEGIN              ;loop over matches
              outstruc[chk[xx]].raone = outstruc[chk[xx]].ph_ra   ;photo RA
              outstruc[chk[xx]].decone = outstruc[chk[xx]].ph_dec ;average DEC
           ENDFOR                                                 ;end loop over matched
        END                                                       ;end just take photometric

        'spec': BEGIN                                                 ;just take spectroscopic
           FOR xx=0UL, n_elements(chk)-1, 1 DO BEGIN                  ;loop over matches
              outstruc[chk[xx]].raone = outstruc[chk[xx]].sp_rabest   ;photo RA
              outstruc[chk[xx]].decone = outstruc[chk[xx]].sp_decbest ;average DEC
           ENDFOR                                                     ;end loop over matched
        END     

        'ave' : BEGIN                                                                                   ;start average
           FOR xx=0UL, n_elements(chk)-1, 1 DO BEGIN                                                    ;loop over matches
              outstruc[chk[xx]].raone = mean([outstruc[chk[xx]].sp_rabest, outstruc[chk[xx]].ph_ra])    ;average RA
              outstruc[chk[xx]].decone = mean([outstruc[chk[xx]].sp_decbest, outstruc[chk[xx]].ph_dec]) ;average DEC
           ENDFOR                                                                                       ;end loop over matched
        END                                                                                             ;end start average

     ENDCASE                    ;
  ENDIF
  chk = where((outstruc.sp_rabest NE -99.0) AND (outstruc.sp_decbest NE -99.0) AND $
              (outstruc.ph_ra EQ -99.0) AND (outstruc.ph_dec EQ -99.0))
  IF chk[0] NE -1 THEN outstruc[chk].raone = outstruc[chk].sp_rabest
  IF chk[0] NE -1 THEN outstruc[chk].decone = outstruc[chk].sp_decbest
  chk = where((outstruc.sp_rabest EQ -99.0) AND (outstruc.sp_decbest EQ -99.0) AND $
              (outstruc.ph_ra NE -99.0) AND (outstruc.ph_dec NE -99.0))
  IF chk[0] NE -1 THEN outstruc[chk].raone = outstruc[chk].ph_ra
  IF chk[0] NE -1 THEN outstruc[chk].decone = outstruc[chk].ph_dec
  
  ;;;write out result
  mwrfits, outstruc, outfile, /CREATE
  




END
;========================================================================================================================
