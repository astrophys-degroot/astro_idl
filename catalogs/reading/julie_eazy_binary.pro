;========================================================================================================================
PRO julie_eazy_binary, FILE=file, OUTFILE=outfile, $
                       ZMIN=zmin, ZMAX=zmax, MAGTAG=magtag, MAGCUT=magcut, $
                       INDIR=indir, OUTDIR=outdir


;+
; NAME:
;       JULIE_EAZY_BINARY()
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
                                ;IF keyword_set(FILE) THEN file = file[0] ELSE file = 'cdfs44_v3_binary.pz'                                                                 ;

  IF keyword_set(MASTER) THEN master = master[0] ELSE master = 'xmm113_v4_master.fits'                                                      ;
  IF keyword_set(FILE) THEN file = file[0] ELSE file = 'xmm113_v4_binary.pz'                                                                ;
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'xmm113_pzint_v1-0.fits'                                                 ;
  IF keyword_set(INDIR) THEN indir = indir[0] ELSE indir = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/julie/xmm113_catalog_v4/' ;
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/julie/'               ;
  IF keyword_set(ZMIN) THEN zmin = zmin[0] ELSE zmin = 1.336                                                                                ;
  IF keyword_set(ZMAX) THEN zmax = zmax[0] ELSE zmax = 1.936                                                                                ;
  chksum = 0                                                                                                                                ;start it off


  ;;;housekeeping
  file = strcompress(indir + file, /REMOVE_ALL)        ;concatenate
  chkfile = file_test(file)                            ;check for file existance
  print, ' File exist: ', chkfile ? 'yes' : 'no'       ;print if file exists
  chkfile = 1 ? (chksum = chksum) : (chksum++)         ;print if file exists
  outfile = strcompress(outdir + outfile, /REMOVE_ALL) ;concatenate
  IF chksum NE 0 THEN stop                             ;stop run


  ;;;reading in julie's binary
  openr, lun, file, /GET_LUN, /SWAP_IF_BIG_ENDIAN ;open file
  sizes = lonarr(2)                               ;create array
  readu, lun, sizes                               ;read into array
  nz = sizes[0]                                   ;# of redshift bins
  nobj = sizes[1]                                 ;# of objects
  chi2fit = dblarr(nz,nobj)                       ;create array
  readu, lun, chi2fit                             ;read into array
  nk = 0L                                         ;# k-prior bins
  readu, lun, nk                                  ;read value
  kbins = dblarr(nk)                              ;make array
  zkprior = dblarr(nz,nk)                         ;make array
  kid = lonarr(nobj)                              ;make array
  readu, lun, kbins, zkprior, kid                 ;read into arrarys
  free_lun, lun                                   ;free memory
  close, /ALL                                     ;close memory
  

  ;;;reading in redshift values
  readcol, strcompress(indir +'tmp_344.pz', /REMOVE_ALL), z, tmpchi2, tmpprior, tmppz ;read in value
                                ;prob = make_array(nz)         ;make array
  photz = make_array(nobj)      ;make array

  ;;;reading in julie stuff
  julie = mrdfits(strcompress(indir + master, /REMOVE_ALL), 1)
                                ;close_match_radec,julie.ra,julie.dec,forsra,forsdec,m3,m4,1/3600.,1,miss
  outstruc = {ID:0, RA:0.0D, DEC:0.0D, PZINT:0.0D, PZIN:0}
  outstruc = replicate(outstruc, nobj)
  ;help, outstruc, /STRUC
  FOR xx = 0, nobj-1, 1 DO BEGIN
     outstruc[xx].id = julie[xx].id   ;add id number
     outstruc[xx].ra = julie[xx].ra   ;add RA 
     outstruc[xx].dec = julie[xx].dec ;add DEC
  ENDFOR

  ;;;reading id from FORS catalog
  ;readcol,'XMM105_all.scat',id,forsra,forsdec,pixx,pixy,mag1,mag2,mag3,pr,forsq,forsz


  ;;;redshift bounds  
  lowest = min(abs(zmin - z), minind)
  highest = min(abs(zmax - z), maxind)
  ;print, lowest, minind, z[minind]
  ;print, highest, maxind, z[maxind]

  ;;;loop over detections
  FOR id = 0, nobj-1, 1 DO BEGIN
     IF ((id mod 500) EQ 0) THEN print, '  Now on id # ', id

                                ; k id identifies the k-mag bin of the prior we are in
                                ; so get the prior from that, or make a uniform prior
     thiskid = kid[id]
     IF (thiskid GT 0) AND (thiskid LT nk) THEN BEGIN
        prior = zkprior[*,thiskid]
     ENDIF ELSE BEGIN
        prior = make_array(nz, value = 1.0)
     ENDELSE
                                ;kpriorplot = plot(indgen(n_elements(prior)), prior)
     
     ;;;probability is e ^ chisq
     p = exp(-0.5 * (chi2fit[*,id] - min(chi2fit[*,id])) ) * prior * (1+z)
     np = p / total(p)
                                ;pplot = plot(z, np, XRANGE = [0.0,1.0])
     IF (id GT 0) THEN prob = [[prob],[np]] ELSE prob = np  ;store photo-z prob distribution
     photz[id] = z[ where(prob[*,id] EQ max(prob[*,id]) ) ] ;find peak photo-z
     IF ((photz[id] GE z[minind]) AND (photz[id] LE z[maxind])) THEN outstruc[id].pzin = 1
     

     ;;;probability of being in cluster
     outstruc[id].pzint = total(np[minind:maxind])

     
  ENDFOR

  ;;;apply magnitude cut if desired
  IF keyword_set(MAGTAG) THEN BEGIN                                                                 ;if a magnitude tag is given
     IF keyword_set(MAGCUT) THEN magcut = magcut[0] ELSE magcut = 23.0                              ;magnitude limit
     chk = tag_exist(julie, magtag, INDEX=magind)                                                   ;find necessary tag
     IF keyword_set(FLUX) THEN mags = -2.5*alog10(julie.(magind)) + 23.9 ELSE mags = julie.(magind) ;convert to magnitude
     chk = where(mags GT magcut)                                                                    ;find faint objects
     help, chk
     IF chk[0] NE -1 THEN BEGIN   ;if faints exists
        outstruc[chk].pzint = 0.0 ;set prob to zero
     ENDIF                        ;end if faints exist

  ENDIF                         ;end if magnitude tag is given


  ;;;write out file
  mwrfits, outstruc, outfile, /CREATE ;write the file

END
