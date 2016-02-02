;========================================================================================================================
PRO clmems, xfile, memtag, ztag, zmin, zmax, OUTFILE=outfile, $
            INDIR=indir, OUTDIR=outdir, $
            HELP=help, VERBOSE=verbose


;+
; NAME:
;       CLMEMS()
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
;       A. DeGroot, 2014 Oct 13, Univ. Cali, Riverside v1.0.0
;          -inception
;
;
; DESIRED UPGRADES
;       none at this time
;
;-
  version = '1.0.0'


  ;;;set default values
  IF keyword_set(INDIR) THEN indir = indir[0] ELSE indir = ' '                           ;set default
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'clmems_outfile.fits' ;set default
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = ' '                       ;set default
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 1                     ;set default
  check_dir, 1                                                                           ;compile module


  ;;;sanity check 
  IF zmax LE zmin THEN print, 'WARNING!!! Minimun redshift is greater than maximum redshift!!' ;print info


  ;;;check file, directories
  check_indir, indir, xfile, NOTE='INDIR' ;check indir
  print, xfile

  ;;;read in file
  data = mrdfits(xfile, 1, hdr)                ;read in file
  IF keyword_set(HELP) THEN help, data, /STRUC ;print data structure
  tagname = tag_names(data)                    ;get structure tags


  ;;;check structure, add tag
  memtag = strupcase(memtag)                                       ;all uppercase 
  chk = where(tagname EQ memtag)                                   ;check if tag already exists
  IF chk[0] NE -1 THEN BEGIN                                       ;if tag found to exist
     print, '  The MEMTAG value already exists in the structure!!' ;print info
     print, '   Please supply another tag and rerun!!'             ;print info
     stop                                                          ;stop program
  ENDIF ELSE BEGIN                                                 ;if tag doesn't exist
     add_tag, data, memtag, 0, tmpstruc                            ;add tag to new temp structure
     data = tmpstruc                                               ;recapture
     tmpstruc = 0                                                  ;erase temp structure
     chk2 = tag_exist(data, memtag, INDEX=memind)                  ;find tag index
  ENDELSE                                                          ;end tag doesn't exist


  ;;;find which are cluster members
  ztag = strupcase(ztag)                                                             ;all uppercase 
  chk = where(tagname EQ ztag)                                                       ;check if tag already exists
  IF chk[0] NE -1 THEN BEGIN                                                         ;if tag found to exist
     chk2 = tag_exist(data, ztag, INDEX=zind)                                        ;find tag index
     chk3 = where((data.(zind) GT zmin) AND (data.(zind) LT zmax), COMPLEMENT=field) ;find cluster members
     IF chk3[0] NE -1 THEN data[chk3].(memind) = 1                                   ;set cluster member flag
  ENDIF ELSE BEGIN                                                                   ;if tag doesn't exist
     print, '  ZTAG does not exists in the structure!!'                              ;print info
     print, '   Please supply another tag for redshift and rerun!!'                  ;print info
     stop                                                                            ;stop program
  ENDELSE                                                                            ;end tag doesn't exist
  
  
  ;;;write out result
  mwrfits, data, outfile, hdr, /CREATE ;write file
  
  

END
;========================================================================================================================



;========================================================================================================================
PRO call_clmems

  file = 'CDFS44_pz_specz_full_v1.0.fits'
  indir = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/'

  memtag = 'clmem'
  ztag = 'z_2'
  zmin = 1.606
  zmax = 1.646
  
  outfile = 'CDFS44_pz_specz_full_v1.1.fits'

  clmems, file, memtag, ztag, zmin, zmax, INDIR=indir, OUTFILE=outfile


END
;========================================================================================================================
