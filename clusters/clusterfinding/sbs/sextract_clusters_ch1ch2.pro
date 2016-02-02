;========================================================================================================================
function sextract_clusters_ch1ch2, colormod, image, weight, wlist, zrange, $
                                   PIXSIZE=pixsize, BCGRAD=bcgrad, SKIPPY=skippy, NOISE=noise, $
                                   SEXFILE=sexfile, PARAMFI=paramfi, CONVOL=convol, OUTLIST=outlist, $
                                   INDIR=indir, OUTDIR=outdir, SCREENP=screenp, $
                                   VERBOSE=verbose, HELP=help, WRITEF=writef, WRITEP=writep
  
  

;+
; NAME:
;       SEXTRACT_CLUSTERS_CH1CH2()
;
; PURPOSE:
;       This code uses sextractor to find peaks in a cluster density map
;       A bad pixel mask is used for each density map to make sure that only
;       read pixels are included in the background.  The clusters are output to a file
;       
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
;       A. DeGroot, 2012 Nov 8, Univ. Cali, Riverside v2.1.0
;       A. DeGroot, 2012 Aug 2, Univ. Cali, Riverside v2.0.0
;       A. Muzzin, prior to 2012 Aug, v1.0.0
;-



  if n_params() lt 5 then begin                                                                     ;tests # of params 
     print, 'Number of parameters given: ', n_params()                                              ;prints info
     print, 'USAGE: result = sextract_clusters_ch1ch2(modelfile, image, weight, weight listzrange)' ;prints info
     print, 'OPTIONAL USAGE: TBD'                                                                   ;prints info
     return, 0                                                                                      ;returns null
  endif                                                                                             ;ends test # params
  if keyword_set(PIXSIZE) then pixsize = pixsize[0] else pixsize = 125.0                            ;sets new value [Kpc]
  if keyword_set(BCGRAD) then bcgrad = bcgrad[0] else bcgrad = 500.0                                ;sets new value [Kpc]
  if keyword_set(SKIPPY) then skippy = skippy[0] else skippy = 0                                    ;sets new value
  if keyword_set(NOISE) then noise = 'Y' else noise = 'N'                                           ;sets new value
  if keyword_set(SEXFILE) then sexfile = sexfile[0] ELSE sexfile = 'sbs_se_clusterfind.sex'         ;sets new value
  if keyword_set(PARAMFI) then paramfi = paramfi[0] else paramfi = 'sbs_se_clusterfind.param'       ;sets new value
  if keyword_set(INDIR) then indir = indir[0] else indir = ''                                       ;sets new value
  if keyword_set(OUTDIR) then outdir = outdir[0] else outdir = ''                                   ;sets new value
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2                                ;sets new value


  ;;;Checks file structure(s)
  check_dir, 1                                                                                    ;get folder structure
  prepclusterfinding, FOLDERS=myfolders, /SKIP                                                    ;get folder structure
  print, myfolders
  IF keyword_set(HELP) THEN help, myfolders, /STRUC                                               ;offer help
  ;colordir = strcompress(myfolders.dir + myfolders.home + myfolders.auxiliary + '/', /REMOVE_ALL) ;put files together
  check_indir, indir, colormod, VERBOSE=verbose ;checks indir
  ;outdir = strcompress(myfolders.dir + myfolders.home + myfolders.I1I2clustercats, /REMOVE_ALL)   ;put files together
  check_outdir, outdir, VERBOSE=verbose ;checks outdir
  
  ;;;This section reads in files, does sanity checks
  colormod = mrdfits(colormod, 1, /SILENT)                                              ;reads in model file
  if keyword_set(HELP) then help, colormod, /struc                                      ;offer help
  case (zrange[0] lt min(colormod.z)) of                                                ;checks minimum z value 
     1 : begin                                                                          ;if min z value is too low
        if verbose ge 3 then print, '  Min z value is too low! Using lowest z found!'   ;print info
        zrange[0] = min(colormod.z)                                                     ;resets min z value
        if verbose ge 3 then print, '   Min z is now: ', zrange[0]                      ;print info
        starting = min(zrange[0]-colormod.z, nstart, /ABSOLUTE)                         ;find index number
     end                                                                                ;end if min z values too low
     0 : begin                                                                          ;min z value not too low
        if verbose ge 3 then print, '  Min z value is good!'                            ;print info
        starting = min(colormod.z-zrange[0], nstart, /ABSOLUTE)                         ;find index number
     end                                                                                ;end min z value not too low
  endcase                                                                               ;end check min z value
  case (zrange[1] gt max(colormod.z)) of                                                ;checks max z value 
     1 : begin                                                                          ;max z value too high
        if verbose ge 3 then print, '  Max z value is too high! Using highest z found!' ;print info
        zrange[1] = max(colormod.z)                                                     ;resets max z value
        if verbose ge 3 then print, '   Max z is now: ', zrange[1]                      ;print info
        ending = min(zrange[1]-colormod.z, nend, /ABSOLUTE)                             ;find index number
     end                                                                                ;end max z value too high
     0 : begin                                                                          ;max z not too high
        if verbose ge 3 then print, '  Max z value is good!'                            ;print info
        ending = min(zrange[1]-colormod.z, nend, /ABSOLUTE)                             ;find index number
     end                                                                                ;end max z not too high
  endcase                                                                               ;end check max z value
    
 
  ;;;Set up name(s)
  outlist = strcompress(outdir + 'ccat_slicelist.txt', /REMOVE_ALL)                                     ;append outdir 
  openw, lun2, outlist, /GET_LUN                                                                        ;open file
  for aa = nstart, nend, 1 do begin                                                                     ;loop over all redshift slices
     tmpimage = image                                                                                   ;value holder
     tmpweight = weight                                                                                 ;value holder
     strreplace, tmpimage, '#', colormod[aa].z                                                          ;replace slice # in image name
     print, '*********',tmpimage, image
     tmpimage = strcompress(tmpimage, /REMOVE_ALL)      ;kills whitespace in name
     ;imdir = strcompress(myfolders.I1I2clustermaps + '/', /REMOVE_ALL)                                  ;kills whitespace in name
     check_indir, indir, tmpimage, VERBOSE=verbose                                                      ;finds file
     strreplace, tmpweight, '#', string(colormod[aa].z)                                                 ;replace slice # in weight name
     tmpweight = strcompress(tmpweight, /REMOVE_ALL)                                                    ;kills whitespace in name
     check_indir, indir, tmpweight, VERBOSE=verbose                                                     ;finds file
     catname = strcompress(outdir + 'ccat_slice' + string(colormod[aa].z) + '.cat', /REMOVE_ALL)        ;creates name
     print, catname
     
     case CONVOl[0] of                                                                         ;check CONVOLU keyword
        0 : begin                                                                              ;easy option
           if verbose ge 2 then print, ' Using default.conv!!'                                 ;print info
           convolu = 'default.conv'                                                            ;sets new value
        end                                                                                    ;end easy option
        1 : begin                                                                              ;if CONVOLU is option 0
           if verbose ge 2 then print, '  Using standard Sextractor kernels of various size!!' ;print info
           case 1 of                                                                           ;check redshift
              colormod[aa].z lt 1.2 : convolu = 'gauss_3.0_5x5.conv'                           ;set value
              colormod[aa].z lt 1.2 : convolu = 'gauss_4.0_7x7.conv'                           ;set value
              colormod[aa].z lt 1.2 : convolu = 'gauss_5.0_9x9.conv'                           ;set value
              else : convolu = 'default.conv'                                                  ;set value
           endcase                                                                             ;end check redshift
        end                                                                                    ;end if option 0
        2 : begin                                                                              ;if option 1
           if verbose ge 2 then print, '  Using broken power law for kernel size!!'            ;print info
           if colormod[aa].z lt 1.5 then begin                                                 ;if low z
              kersize = floor((714.0*(colormod[aa].z -0.8) + 1000.0) / pixsize)                ;find kernel size
           endif else begin                                                                    ;if high z
              kersize = floor((1500.0*(colormod[aa].z -1.5) + 1500.0) / pixsize)               ;find kernel size
              kernel = psf_gaussian(NPIX=1.0*kersize[0], FWHM=kersize[0], /DOUBLE, /NORMALIZE) ;create smoothing kernel
              convolu = strcompress('ccat_' + string(colormod[aa].z) + '.conv', /REMOVE_ALL)   ;convo ker name
              openw, lun3, convolu, /GET_LUN                                                   ;open file unit 
              printf, lun3, 'CONV NORM'                                                        ;print to file
              printf, lun3, '# User defined convolutin kernel size'                            ;print to file
              printf, lun3, kernel                                                             ;print to file
              close, lun3                                                                      ;close file unit
              free_lun, lun3                                                                   ;free memory
           endelse                                                                             ;end if high z
        end                                                                                    ;end if option 1           
        else : begin                                                                           ;begin alt
           if verbose ge 2 then print, ' Using fixed user defined kernel FWHM size!!'          ;print info
           kersize = convolu[0]                                                                ;set kernel size
           kernel = psf_gaussian(NPIX=3.0*kersize[0], FWHM=kersize[0], /DOUBLE, /NORMALIZE)    ;create smoothing kernel
           convolu = strcompress('ccat_' + string(colormod[aa].z) + '.conv', /REMOVE_ALL)      ;convo ker name
           openw, lun3, convolu, /GET_LUN                                                      ;open file unit 
           printf, lun3, 'CONV NORM'                                                           ;print to file
           printf, lun3, '# User defined convolutin kernel size'                               ;print to file
           printf, lun3, kernel                                                                ;print to file
           close, lun3                                                                         ;close file unit
           free_lun, lun3                                                                      ;free memory
        end                                                                                    ;end alt
     endcase                                                                                   ;end check which redshift
  
     ;;;Call and run Sextractor
     case noise of                                                        ;check noise parameter
        'N' : begin                                                       ;if noise no
           probmap = mrdfits(tmpimage, 0, header, /SILENT)                ;read in probability map
           xsize = fxpar(header, 'NAXIS1')                                ;find size
           ysize = fxpar(header, 'NAXIS2')                                ;find size
           case 1 of                                                      ;begin trivial case
              colormod[aa].z le 1.200 : begin                             ;checks which redshift
                 command_line = 'sex ' + tmpimage + $                     ;beginning of call to SE, image
                                ' -c ' + sexfile + $        ;configuration file
                                ' -CATALOG_NAME ' + catname + $           ;output name
                                ' -WEIGHT_IMAGE ' + tmpweight + $         ;weight image
                                ' -PARAMETERS_NAME ' + paramfi + $        ;parameter fil
                                ' -FILTER_NAME ' + convolu                ;convolution kernel
              end                                                         ;end check redshift
              colormod[aa].z gt 1.200 AND colormod[aa].z le 1.800 : begin ;checks which redshift
                 command_line = 'sex ' + tmpimage + $                     ;beginning of call to SE, image
                                ' -c ' + sexfile + $                      ;configuration file
                                ' -CATALOG_NAME ' + catname + $           ;output name
                                ' -WEIGHT_IMAGE ' + tmpweight + $         ;weight image
                                ' -PARAMETERS_NAME ' + paramfi + $        ;parameter fil
                                ' -FILTER_NAME ' + convolu                ;convolution kernel
              end                                                         ;end check redshift
              colormod[aa].z gt 1.800 : begin                             ;checks which redshift
                 command_line = 'sex ' + tmpimage + $                     ;beginning of call to SE, image
                                ' -c ' + sexfile + $                      ;configuration file
                                ' -CATALOG_NAME ' + catname + $           ;output name
                                ' -WEIGHT_IMAGE ' + tmpweight + $         ;weight image
                                ' -PARAMETERS_NAME ' + paramfi + $        ;parameter fil
                                ' -FILTER_NAME ' + convolu                ;convolution kernel
              end                                                         ;end check redshift
              else : print, 'Redshift given is not valid!!!'              ;print info
           endcase                                                        ;end trivial case
        end                                                               ;end noise no
        'Y' : begin                                                       ;if noise yes
           probmap = mrdfits(image, 0, header)                            ;read in probability map
           xsize = fxpar(header, 'NAXIS1')                                ;find size
           ysize = fxpar(header, 'NAXIS2')                                ;find size
           case 1 of                                                      ;begin trivial case
              colormod[aa].z lt 1.200 : begin                             ;checks which redshift
                 command_line = 'sex ' + tmpfile + $                      ;call to SE, image name
                                ' -c ' +'clusterfind_lowz.sex' + $        ;configuration file
                                ' -CATALOG_NAME ' + catname + $           ;output name
                                ' -WEIGHT_IMAGE ' + weightfile + $        ;weight image
                                ' -PARAMETERS_NAME ' + paramfi + $        ;parameter file
                                ' -FILTER_NAME ' + convolu                ;convolution kernel 
              end                                                         ;end check redshift
              colormod[aa].z lt 1.200 AND colormod[aa].z lt 1.800 : begin ;checks which redshift
                 command_line = 'sex ' + tmpfile + $                      ;call to SE, image name
                                ' -c ' +'clusterfind_midz.sex' + $        ;configuration file
                                ' -CATALOG_NAME ' + catname + $           ;output name
                                ' -WEIGHT_IMAGE ' + weightfile + $        ;weight image
                                ' -PARAMETERS_NAME ' + paramfi + $        ;parameter file
                                ' -FILTER_NAME ' + convolu                ;convolution kernel 
              end                                                         ;end check redshift
              colormod[aa].z gt 1.800 : begin                             ;checks which redshift
                 command_line = 'sex ' + tmpfile + $                      ;call to SE, image name
                                ' -c ' +'clusterfind_highz.sex' + $       ;configuration file
                                ' -CATALOG_NAME ' + catname + $           ;output name
                                ' -WEIGHT_IMAGE ' + weightfile + $        ;weight image
                                ' -PARAMETERS_NAME ' + paramfi + $        ;parameter file
                                ' -FILTER_NAME ' + convolu                ;convolution kernel 
              end                                                         ;end check redshift
              else : print, 'Redshift given is not valid!!!'              ;print info
           endcase                                                        ;end trivial case
        end                                                               ;end noise yes
     endcase                                                              ;end check noise parameter
     if verbose ge 3 then print, command_line                             ;print info
     spawn, command_line                                                  ;execute command outside IDL
     
     
     ;;;Read in cluster catalog, display on prob map
     readcol, catname, cnum,  xpos, ypos, ra, dec, $                                         ;cont next line
              flux_aper1, flux_aper2, flux_aper3, flux_aper4, flux_aper5, flux_aper6, $      ;cont next line
              eflux_aper1, eflux_aper2, eflux_aper3, eflux_aper4,eflux_aper5, eflux_aper6, $ ;cont next line
              flux_auto, eflux_auto, isoarea, flags, SKIPLINE=skippy, $                      ;cont next line
              FORMAT='(i,f,f,f,f,f,f,f,f,f,f,f,f,f,f,i,i,i,d,d,i)'                           ;reaf in file
     tempstr = {ID:1.0, Z:1.1, CLRA_DEG:0.00, CLDEC_DEG:0.00, $                              ;cont next line
                BCGRA_DEG:0.00, BCGDEC_DEG:0.00, BCGRA_HMS:'hi', BCGDEC_HMS:'there', $       ;cont next line
                FLUX_APER1:0.00, EFLUX_APER1:0.00, FLUX_APER2:0.00, EFLUX_APER2:0.00, $      ;cont next line
                FLUX_APER3:0.00, EFLUX_APER3:0.00, FLUX_APER4:0.00, EFLUX_APER4:0.00, $      ;cont next line
                FLUX_APER5:0.00, EFLUX_APER5:0.00, FLUX_APER6:0.00, EFLUX_APER6:0.00, $      ;cont next line
                FLUX_AUTO:0.00, EFLUX_AUTO:0.00, ISOAREA:30, XPOS:0.0, YPOS:0.0, FLAGS:0}    ;creates struct for ccat
     
     ccat = replicate(tempstr, n_elements(cnum)) ;one struc for each cluster
     ccat.id = cnum                              ;sets values
     ccat.flux_aper1 = flux_aper1                ;sets values
     ccat.eflux_aper1 = eflux_aper1              ;sets values
     ccat.flux_aper2 = flux_aper2                ;sets values
     ccat.eflux_aper2 = eflux_aper2              ;sets values
     ccat.flux_aper3 = flux_aper3                ;sets values
     ccat.eflux_aper3 = eflux_aper3              ;sets values
     ccat.flux_aper4 = flux_aper4                ;sets values
     ccat.eflux_aper4 = eflux_aper4              ;sets values
     ccat.flux_aper5 = flux_aper5                ;sets values
     ccat.eflux_aper5 = eflux_aper5              ;sets values
     ccat.flux_aper6 = flux_aper6                ;sets values
     ccat.eflux_aper6 = eflux_aper6              ;sets values
     ;ccat.flux_aper7 = flux_aper7                ;sets values
     ;ccat.eflux_aper7 = eflux_aper7              ;sets values
     ccat.flux_auto = flux_auto                  ;sets values
     ccat.eflux_auto = eflux_auto                ;sets values
     ccat.isoarea = isoarea                      ;sets values
     ccat.xpos = xpos                            ;sets values
     ccat.ypos = ypos                            ;sets values
     ccat.clra_deg = ra                          ;sets values
     ccat.cldec_deg = dec                        ;sets values
     ccat.flags = flags                          ;sets values
     
     if keyword_set(HELP) then help, ccat, /STRUC                                                    ;prints info
     inim = where((ccat.xpos GT 0) AND (ccat.xpos LT xsize-1) AND $                                  ;cont next line
                  (ccat.ypos GT 0) AND (ccat.ypos LT ysize-1), ninim, NCOMPLEMENT=nnotinim)          ;clusters inside border
     if ninim ne 0 then ccat = ccat[inim]                                                            ;removes bad clusters
     if verbose ge 3 then $                                                                          ;check verbose
        print, '   Number of clusters removed due to being outside image borders: ', nnotinim        ;print info
     title = 'Cluster Probability Map ' + strcompress('z='+string(colormod[aa].z), /REMOVE_ALL ) + $ ;cont next line
             '  Slice: '+  strcompress(string(aa)+'/'+string(nend), /REMOVE_ALL)                     ;title name
     if keyword_set(SCREENP) then begin                                                              ;check SCREENP keyword
        window, 0, XPOS=100, YPOS=000, XSIZE=xsize+50, YSIZE=ysize+50, TITLE=title                   ;window options
        tvscl, probmap                                                                               ;place probabiliy map
        tvcircle, 6.0, ccat.xpos, ccat.ypos, COLOR='FF00FF'XL                                        ;lay down circles on "clusters"
     endif                                                                                           ;end check SCREENP keyword 
     
     ;;;Make region files for detected clusters
     regname = strcompress(outdir+'creg_image_slice'+string(colormod[aa].z)+'.reg', /REMOVE_ALL) ;creates name
     openw, lun, regname, /GET_LUN                                                               ;opens file
     for zz=0L, n_elements(xpos)-1, 1 do begin                                                   ;loops over elements
        printf, lun, xpos[zz], ypos[zz], FORMAT='(2f)'                                           ;prints to file
     endfor                                                                                      ;ends loop over elements
     close, lun                                                                                  ;close file
     free_lun, lun                                                                               ;frees memory
     regname = strcompress(outdir+'creg_wcs_slice'+string(colormod[aa].z)+'.reg', /REMOVE_ALL)   ;creates name
     openw, lun, regname, /GET_LUN                                                               ;opens file
     for zz=0L, n_elements(ra)-1, 1 do begin                                                     ;loop over elements
        printf, lun, ra[zz], dec[zz], FORMAT='(2f)'                                              ;print info
     endfor                                                                                      ;end loop over elements
     close, lun                                                                                  ;close file
     free_lun, lun                                                                               ;free memory
     
     
     ;;;Finding the BCG centroid: the brightest galaxy within 500 kpc with a weight higher than 0.4
     angsz = length(pixsize, 'kpc', OUTUNITS='arcsec', SECONDARY=colormod[aa].z, SECUNITS='redshift') ;calc angular size of pixel at redshift of slice
     angsz2 = length(bcgrad, 'kpc', OUTUNITS='arcsec', SECONDARY=colormod[aa].z, SECUNITS='redshift') ;calc angular size of pixel at redshift of slice
     ccat[*].z = colormod[aa].z                                                                       ;adds redshift value
     if verbose ge 3 then print, '   BCG radius [arcsec]: ', angsz2, 'at redshift ', colormod[aa].z   ;print info 
     
                                ;readweight_final_I1I2_CDFS, ra, dec, I1MI2, eI1MI2, I2tot, eI2tot, I1tot, eI1tot, weight, slicenum
     
     strreplace, wlist, '#', colormod[aa].z         ;replace slice # in wlist name
     wlist = strcompress(wlist, /REMOVE_ALL)        ;kills whitespace in name
     check_indir, indir, wlist, VERBOSE=verbose     ;finds file
     welist = mrdfits(wlist, 1)                     ;read in file
     if keyword_set(HELP) then help, welist, /STRUC ;print help

     
     for bb = 0UL, n_elements(ccat.clra_deg)-1, 1 do begin                                ;loop over clusters
        if (verbose ge 2) AND (bb mod 25 eq 0) then $                                     ;cont next line
           print, '  Finding BCG for cluster number ', bb, ' of ', n_elements(ccat.id)    ;print info  
        gcirc, 2, ccat[bb].clra_deg, ccat[bb].cldec_deg, welist.ra, welist.dec, dists     ;ang dist of detection from cluster  
        cut1_bcg = where(dists LT angsz2[0], ncut1)                                       ;finds galaxies close enough
        if verbose ge 3 then print, '   # of BCG candidates after distance cut: ', ncut1  ;print info
        if ncut1 ne 0 then begin                                                          ;check for candidates 
           cut1_weight = welist[cut1_bcg].weight                                          ;culls list
           cut1_mags = welist[cut1_bcg].ch2best                                           ;culls list
           cut1_ra = welist[cut1_bcg].ra                                                  ;culls list
           cut1_dec = welist[cut1_bcg].dec                                                ;culls list
           
           cut2_bcg = where(cut1_weight GT 0.4, ncut2)                                    ;finds galaxies weighted enough
           if verbose ge 3 then print, '   # of BCG candidates after weight cut: ', ncut2 ;print info
           if ncut2 ne 0 then begin                                                       ;Picking a BCG only works if there is one :)
              cut2_ra = cut1_ra[cut2_bcg]                                                 ;culls list
              cut2_dec = cut1_dec[cut2_bcg]                                               ;culls list
              cut2_mags = cut1_mags[cut2_bcg]                                             ;culls list
              bcg = min(cut2_mags, bcgind)                                                ;finds brightest galaxy 
              ccat[bb].bcgra_deg = cut2_ra[bcgind]                                        ;sets RA for BCG
              ccat[bb].bcgdec_deg = cut2_dec[bcgind]                                      ;sets Dec for BCG
           endif else begin                                                               ;end if BCG candidate 
              ccat[bb].bcgra_deg = ccat[bb].clra_deg                                      ;sets alt RA for BCG
              ccat[bb].bcgdec_deg = ccat[bb].cldec_deg                                    ;sets lat Dec for BCG
           endelse                                                                        ;end if not a BCG candidate
        endif else begin                                                                  ;end if BCG candidate 
           ccat[bb].bcgra_deg = ccat[bb].clra_deg                                         ;sets alt RA for BCG
           ccat[bb].bcgdec_deg = ccat[bb].cldec_deg                                       ;sets lat Dec for BCG
        endelse                                                                           ;end check for candidates
     endfor                                                                               ;end loop over clusters


     ;;;Convert BCG RA, DEC to sexagesimal units
     radec, ccat.bcgra_deg, ccat.bcgdec_deg, ihr, imin, xsec, ideg, imn, xsc ;call to convert
     ihr = string(ihr)                                                       ;convert to string
     ideg = string(ideg)                                                     ;convert to string
     imin = string(imin)                                                     ;convert to string
     check  = where(strlen(strcompress(imin, /REMOVE_ALL)) LT 2, ncheck)     ;check for single digits
     if ncheck ne 0 then imin[check] = '0'+imin[check]                       ;adds spacer digit
     xsec = string(xsec)                                                     ;convert to string
     check  = where(strlen(strcompress(xsec, /REMOVE_ALL)) LT 2, ncheck)     ;check for single digits
     if ncheck ne 0 then xsec[check] = '0'+xsec[check]                       ;adds spacer digit
     imn = string(imn)                                                       ;convert to string
     check  = where(strlen(strcompress(imn, /REMOVE_ALL)) LT 2, ncheck)      ;check for single digits
     if ncheck ne 0 then imn[check] = '0'+imn[check]                         ;adds spacer digit
     xsc = string(xsc)                                                       ;convert to string
     check  = where(strlen(strcompress(xsc, /REMOVE_ALL)) LT 2, ncheck)      ;check for single digits
     if ncheck ne 0 then xsc[check] = '0'+xsc[check]                         ;adds spacer digit     
     ccat.bcgra_hms = strcompress(ihr+':'+imin+':'+xsec, /REMOVE_ALL)        ;create sexagesimal ra
     ccat.bcgdec_hms = strcompress(ideg+':'+imn+':'+xsc, /REMOVE_ALL)        ;create sexagesimal dec
     

     
     ;;;Write out the cat and take care of some odds and ends
     if keyword_set(OUTDIR) then begin                                                               ;check OUTDIR keyword
        catname = strcompress(outdir + 'ccat_slice' + string(colormod[aa].z) + '.fits', /REMOVE_ALL) ;creates name
     endif else catname = strcompress('ccat_slice' + string(colormod[aa].z) + '.fits', /REMOVE_ALL)  ;creates name
     mwrfits, ccat, catname, /CREATE                                                                 ;write cat in fits format
     tolist =  strcompress('ccat_slice' + string(colormod[aa].z) + '.fits', /REMOVE_ALL)             ;cat name for list
     printf, lun2, tolist                                                                            ;prints to file
     ;image = tmpimage                                                                                ;reset value
     ;weight = tmpweight                                                                              ;reset weight
     print, ' '                                                                                      ;spacer
     print, ' '                                                                                      ;spacer
  endfor                                                                                             ;end loop redshift slices
  
  close, lun2                    ;close file unit
  free_lun, lun2                 ;free memory 
  spawn, 'rm ccat_slice*.cat'    ;clean out non-cleaned cluster cats
end
;========================================================================================================================



;========================================================================================================================
pro call_sextract_clusters_ch1ch2
  
  indir = '/Users/degroota/research/current8_en1clusterfinding/'
  modelch1ch2 = 'auxiliary/I1I2vsI2seqszf40_v3.0.fits'
  imagefile = 'cmap_slice#.fits'
  weightfile = 'cmap_weightmap#.fits'
  weightlist = 'I1I2sliceweights/slice#_weights.fits'
  zrange = [1.2, 1.7]

  
  result = sextract_clusters_ch1ch2(modelch1ch2, imagefile, weightfile, weightlist, zrange, CONVOL=1, $
                                    SKIPPY=0, INDIR=indir, VERBOSE=2, /SCREENP) ;, /HELP)
  

end
;========================================================================================================================
