;+
; NAME:
;       lok400()
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
;       A. DeGroot, 2015 May 20, Univ. Cali, Riverside v1-2-0
;          -BCG info in [deg]
;       A. DeGroot, 2015 May 20, Univ. Cali, Riverside v1-0-0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO lok400::getprop, OBJVER=objver, PROPNAME=propname, $
                     RAH=rah, RAM=ram, RAS=ras, DECD=decd, DECM=decm, DECS=decs, $
                     RASEX=rasex, DECSEX=decsex, RADEGCL=radegcl, DECDEGCL=decdegcl, $
                     RADEGBCG=radegbcg, DECDEGBCG=decdegbcg, $
                     REDSHIFT=redshift, $
                     CATALOG=catalog

  IF arg_present(OBJVER) THEN objver = self.objver          ;return the data
  IF arg_present(PROPNAME) THEN propname = self.propname    ;return the data
  IF arg_present(RAH) THEN rah = self.rah                   ;return the data
  IF arg_present(RAM) THEN ram = self.ram                   ;return the data
  IF arg_present(RAS) THEN ras = self.ras                   ;return the data
  IF arg_present(DECH) THEN dech = self.dech                ;return the data
  IF arg_present(DECM) THEN decm = self.decm                ;return the data
  IF arg_present(DECS) THEN decs = self.decs                ;return the data
  IF arg_present(RASEX) THEN rasex = self.rasex             ;return the data
  IF arg_present(DECSEX) THEN decsex = self.decsex          ;return the data
  IF arg_present(RADEGCL) THEN radegcl = self.radegcl       ;return the data
  IF arg_present(DECDEGCL) THEN decdegcl = self.decdegcl    ;return the data
  IF arg_present(RADEGBCG) THEN radegbcg = self.radegbcg    ;return the data
  IF arg_present(DECDEGBCG) THEN decdegbcg = self.decdegbcg ;return the data
  IF arg_present(REDSHIFT) THEN redshift = self.z           ;return the data
  IF arg_present(CATALOG) THEN catalog = self.catalog       ;return the data

  RETURN
END
;====================================================================================================



;====================================================================================================
;PRO lok400::add_agn_k06, CATALOG=catalog, OUTFILE=outfile
;
;  
;  IF keyword_set(CATALOG) THEN catalog = catalog[0] ELSE catalog = self.catalog
;  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = self.outfile
;  
;  data = mrdfits(catalog, 1, hdr)
;  out = kewley_2006(1, FLUXHA=data.SP_M_HA_FLUX, FLUXNII=data.SP_M_NIIR_FLUX) ;
;
;  add_tag, data, 'AN_AGNK06', 0, newstruc
;  data = newstruc
;  data.AN_AGNK06 = out
;
;  mwrfits, data, outfile, /CREATE
;
;  RETURN
;END
;====================================================================================================



;====================================================================================================
;PRO lok400::add_clmem, CATALOG=catalog, OUTFILE=outfile
;
;  
;  IF keyword_set(CATALOG) THEN catalog = catalog[0] ELSE catalog = self.catalog
;  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = self.outfile
;
;  
;  data = mrdfits(catalog, 1, hdr)
;  clmems = intarr(n_elements(data))
;  chk = where((data.sp_speczbest GE self.zlow) AND (data.sp_speczbest LE self.zhigh))
;  IF (chk[0] NE -1) THEN clmems[chk] = 1 
;
;  add_tag, data, 'AN_CLMEM', 0, newstruc
;  data = newstruc
;  data.AN_CLMEM = clmems
;
;  mwrfits, data, outfile, /CREATE
;
;  RETURN
;END
;====================================================================================================


;====================================================================================================
PRO lok400::analyze1d, xmask, xobj, MCITERS=mciters, NOMCWRITE=nomcwrite ;, CATALOG=catalog, OUTFILE=outfile

  COMPILE_OPT IDL2              ;force new defaults
  check_dir, 1                  ;compile module

  IF keyword_set(MCITERS) THEN mciters = fix(mciters[0]) ELSE mciters = self.mciters ;set default
  
  CASE xmask OF

     'stack' : BEGIN                                                                   ;choice of eighth mask
        indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/stack/'  ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/stack/' ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                  ;batchmode
           xobj = ['brsr1a','brsr2','brsr10']                                                  ;
     END                                                                               ;end eighth mask ;

     ELSE : BEGIN                                 ;begin no match found
        print, 'Warning!! Mask choice not found!' ;print info
        print, '  Current choices are: stack'     ;print info
     END                                                       ;end no match found

  ENDCASE                       ;end which mask
  
  
  FOR xx=0, n_elements(xobj)-1, 1 DO BEGIN                    ;loop over spectra
     print, strcompress( ' Now working on file: ' + xobj[xx]) ;print info
     CASE xmask OF
        'stack' : anset = lok400_stack_y_analyze_settings(xobj[xx]) ;get analysis settings
                                ;stack : anset = cdfs44_mask1_h_analyze_settings(xobj[xx])     ;get analysis settings
        ELSE : BEGIN            ;begin no match found
           print, 'Warning!! Mask choice not found!' ;print info
           print, '  Current choices are: stack'     ;print info
        END                                          ;end no match found
     ENDCASE                                         ;end which mask


     ;;;test if value is defined in settings structure
     IF tag_exist(anset, 'openfits', /QUIET) THEN openfits = anset.openfits ELSE openfits = 0 ;if value is defined
     IF tag_exist(anset, 'nofitsky', /QUIET) THEN nofitsky = anset.nofitsky ELSE nofitsky = 0 ;if value is defined
     IF tag_exist(anset, 'dryrun', /QUIET) THEN dryrun = anset.dryrun ELSE dryrun = 0         ;if value is defined
     IF tag_exist(anset, 'fitto', /QUIET) THEN fitto = anset.fitto ELSE fitto = 0             ;if value is defined
     IF tag_exist(anset, 'lal', /QUIET) THEN lal = anset.lal ELSE lal = 0                     ;if value is defined
     IF tag_exist(anset, 'lau', /QUIET) THEN lau = anset.lau ELSE lau = 0                     ;if value is defined
     IF tag_exist(anset, 'yl', /QUIET) THEN yl = anset.yl ELSE yl = 0                         ;if value is defined
     IF tag_exist(anset, 'yu', /QUIET) THEN yu = anset.yu ELSE yu = 0                         ;if value is defined
     IF tag_exist(anset, 'border', /QUIET) THEN border = anset.border ELSE border = 0         ;if value is defined
     IF tag_exist(anset, 'initgss', /QUIET) THEN initgss = anset.initgss ELSE initgss = 0     ;if value is defined
     IF tag_exist(anset, 'priors', /QUIET) THEN priors = anset.priors ELSE priors = 0         ;if value is defined
     IF tag_exist(anset, 'oldver', /QUIET) THEN oldver = anset.oldver ELSE oldver = 0         ;if value is defined
     IF tag_exist(anset, 'newver', /QUIET) THEN newver = anset.newver ELSE newver = 0         ;if value is defined
     IF tag_exist(anset, 'xwhich', /QUIET) THEN xwhich = anset.xwhich ELSE xwhich = 0         ;if value is defined
     IF tag_exist(anset, 'zqflag', /QUIET) THEN zqflag = anset.zqflag ELSE zqflag = 0         ;if value is defined
     IF tag_exist(anset, 'yerr', /QUIET) THEN yerr = anset.yerr ELSE yerr = '1'               ;if value is defined
 
     myanyl = obj_new('mosfire_analyze1d', anset.basename, xobj[xx], INDIR=indir, OUTDIR=outdir, $     ;cont next line
                      FITTO=fitto, LAL=lal, LAU=lau, YL=yl, YU=yu, NOFITSKY=nofitsky, DRYRUN=dryrun, $ ;cont next line
                      BORDER=border, INITGSS=initgss, PRIORS=priors, OLDVER=oldver, NEWVER=newver, $   ;cont next line
                      XWHICH=xwhich, ZQFLAG=zqflag, YERR=yerr)                                         ;call analyze 1d object


     myanyl.prep, mciters, FITTOWL=myfittowl, ITERSTORE=mcstore                                                ;prepare a few things
     status = myanyl.findfiles()                                                                               ;check directories, read in files
     IF (status NE 1) THEN BEGIN                                                                               ;if not all files found
        print, 'WARNING!! Not all files found!!'                                                               ;print info
        print, 'Proceeding but likely failing...'                                                              ;print info
        print, 'Seriously...make sure you rerun the MOSFIRE DRP to get out the wavelength calibration error!!' ;print info
        wait, 5                                                                                                ;wait 
     ENDIF                                                                                                     ;end not all files found

     mydata = myanyl.readfiles('data')                 ;read in data
     mywvres = myanyl.readfiles('waveresid')           ;read in data
     myanyl.bounds, LAL=lal, LAU=lau                   ;determine some bounds
     myanyl.displaytwod, mybase, OPENFITS=openfits     ;create graphic of object
     mylambflg = myanyl.lambsubset(NOFITSKY=nofitsky)  ;find subset of wavelengths to fit
     mydatasub = myanyl.getsub(mydata, mylambflg)      ;grab subset
     mydatanew = myanyl.prepmcdata(mydatasub, mciters) ;prepare to do MC
     mygssnew = myanyl.prepmcguess(mciters)            ;more prepare to do MC


     tick = systime(/SECONDS)                                                                  ;start time
     cnt = 0                                                                                   ;start counter
     myvary = myanyl.fitspec(mydatasub, NEWDATA=mydatanew[-1].mcspec1d, /GETVARY)              ;fit 1D spectrum
     WHILE (cnt LE mciters) DO BEGIN                                                           ;iterate over monte carlo
        print, strcompress('  Iteraction number ' + string(cnt) + ' of ' + string(mciters))    ;print info
        drycnt = abs(mciters-cnt)                                                              ;count down to real run
        newguess = myanyl.undecipher(mygssnew[cnt])                                            ;back to a string
        IF (cnt EQ mciters) THEN BEGIN                                                         ;if last pass
           mkplot = 1                                                                          ;whether to plot or not
           myanyl.displayoned, mylambflg, NEWDATA=mydatanew[cnt].mcspec1d                      ;plot 1D spectrum
        ENDIF ELSE mkplot = 0                                                                  ;end if last pass
        myfit = myanyl.fitspec(mydatasub, NEWDATA=mydatanew[cnt].mcspec1d, INITGSS=newguess, $ ;cont next line
                               DRYRUN=drycnt, PLOTIT=mkplot, VARIES=myvary)                    ;fit 1D spectrum
        IF (cnt EQ 0) THEN mytotfit = myfit ELSE mytotfit = [mytotfit, myfit]                  ;store results
        cnt = cnt + 1                                                                          ;up counter
     ENDWHILE                                                                                  ;end monte carlo
     tock = systime(/SECONDS)                                                                  ;end time
     print, 'TIME FOR ONE SPECTRUM: ', abs(tick-tock)                                          ;display
     myanyl.getprop, FMCRUNS=filemcruns                                                        ;store
     IF ~(keyword_set(NOMCWRITE)) THEN mwrfits, mytotfit, filemcruns, /CREATE
                                ;mytotfit = mrdfits(strcompress('CDFS44_mask2_1.0_H_' + xobj[xx] + '_eps_1d_v10_mcruns250.fits'), 1, hdr)

     
     myz = myanyl.zbrkdwn(mytotfit, RESID=mywvres)                                           ;digest redshift values and error
     myfitbrk = myanyl.fitbrkdwn(mytotfit)                                                   ;digest other fit values and errors
     myflags = myanyl.flagging(myz, myfitbrk)                                                ;flag based on available info
     mynewhdr = myanyl.updatehdr(['basic', 'run', 'fit', 'postrun', 'flags'], $              ;cont next line
                                 FITVALS=myfit, ZVALS=myz, FITBRK=myfitbrk, FLGVALS=myflags) ;add values to header
     myanyl.displayonedout, myz.zmle, NEWHDR=mynewhdr                                        ;final outplot
     myanyl.getprop, OBJVER=myanylver, DATAHDR=myhdr                                         ;get properties
     status = myanyl.writefile()                                                             ;write the file
     IF status EQ 1 THEN print, 'File written successfully!'                                 ;print info

     obj_destroy, myanyl        ;free pointers
  ENDFOR                        ;end loop spectra
END
;====================================================================================================


;====================================================================================================
PRO lok400::collate, WHICH=which

  
  CASE which OF
     1 : cstuf = {maskname:'lok400_mask1_H', $
                  mask:'lok400_mask1_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/LOK400_mask1/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'lok400_mask1_1dspeccat_v1-0.fits', $
                  outdir:'/Users/degroota/research/current1_mosfire_2013nov28_lok400/lok400_mask1_H/', $
                  radecdeg:'/Users/degroota/research/current1_mosfire_2013nov28_lok400/images/lok400_ukidssK_mosaic_v1.0.fits'}

     2 : cstuf = {maskname:'LOK400_mask2_H', $
                  mask:'LOK400_mask2_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/LOK400_mask2_v2/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'lok400_mask2_1dspeccat_v1-0.fits', $
                  outdir:'/Users/degroota/research/current1_mosfire_2013nov28_lok400/lok400_mask2_H/', $
                  radecdeg:'/Users/degroota/research/current1_mosfire_2013nov28_lok400/images/lok400_ukidssK_mosaic_v1.0.fits'}

     3 : cstuf = {maskname:'LOK400_mask3_H', $
                  mask:'LOK400_mask3_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/LOK400_mask3_v2/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'lok400_mask3_1dspeccat_v1-1.fits', $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/'}

     4 : cstuf = {maskname:'lok400_mask4_v1_H', $
                  mask:'lok400_mask4_v1_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/lok400_mask4_v1/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'lok400_mask4_1dspeccat_v1-0.fits', $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/LOK400_mask4/2014nov16/H/'}

     5 : cstuf = {maskname:'J1049_20150426_v4_H', $
                  mask:'J1049_20150426_v4_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/J1049_20150426_v4/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'J1049_mask5_1dspeccat_v1-0.fits', $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/J1049_20150426_v4/2015apr27/H/'}

     ELSE : BEGIN
        print, 'Mask choice not recognized!'
        print, '  Please try again. Valid Choices are 1, 2, 3, 4, and 5'
        stop
     ENDELSE
  ENDCASE
  
  mosfire_1dspec_collate, cstuf.maskname, cstuf.mask, /RADECDEG, MASKDIR=cstuf.maskdir, $
                          CHKRADECDEG=cstuf.chkradecdeg, DIRCHKRADECDEG=cstuf.dirchkradecdeg, $
                          OUTFILE=cstuf.outfile
  

END	
;====================================================================================================


;====================================================================================================
PRO lok400::seechangewcs, OUTFILE=outfile, OUTDIR=outdir


  
  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'SPARCS-J1049_v123456789_F160W_sci1.fits'
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/seechange/'
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = 'lok400_photoz_tracy_v2-1.fits'
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/'
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'SPARCSJ1049_HSTv9_lok400v2-1_v1-0.fits'
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/seechange/'


  master = mrdfits(strcompress(indir1 + file1, /REMOVE_ALL), 1, hdr, /SILENT)              ;which is the master catalog
  mtags = tag_names(master)                                                                ;get tag names from structure
  data1 = mrdfits(strcompress(indir2 + file2, /REMOVE_ALL), 1, hdr, /SILENT)               ;which is the matching catalog
  data1tags = tag_names(data1)                                                             ;tag names of matching catalog
  mymatch = obj_new('master_radec', master.col1, master.col2, FULLM=master, FULL1=data1, $ ;cont next line
                    RA1=data1.ra_1, DEC1=data1.dec_1)                                      ;call the master match object
  mymatch.boxscore                                                                         ;get some basic info
  cont = mymatch.sanitycheck()                                                             ;perform basic sanity checks
  IF cont EQ 1 THEN BEGIN                                                                  ;if all sanity checks pass
     mymatch.startstruc                                                                    ;start the structure
     mymatch.addtags, data1tags, data1[0], EXCEPT=['ID'], /MATCH                           ;add tags from matching catalog
     mymatch.addtags, mtags, master[0], EXCEPT=['RA', 'DEC'], /MASTER                      ;add tags from matching catalog
     mymatch.copyout                                                                       ;copy data that came with master 
     indmatch = mymatch.matches(MAXSEAR=2.0, /NOMID)                                       ;create matched pairs
     mymatch.adjust, 'SIMPLEMEAN', /SHOWPLOT, $                                            ;cont next line
        TGRAONE=strcompress('RA_1', /REMOVE_ALL), $                                        ;cont next line
        TGDECONE=strcompress('DEC_1', /REMOVE_ALL)                                         ;find offset and adjust
     indmatch = mymatch.matches(MAXSEAR=2.0)                                               ;create matched pairs
     mymatch.write, FILENAME=strcompress(outdir + outfile, /REMOVE_ALL), $                 ;cont next line
                             /EXTRA, /FAILED, /ALL                                         ;write out file
  ENDIF                                                                                    ;end all sanity checks pass
  
END
;====================================================================================================


;====================================================================================================
PRO lok400::fulldepth


  files = ['/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/2015feb23/Y/LOK400_mask5_v1-1_Y_brsr9_eps_1d_v10.fits', $
           '/Users/adegroot/research/dataredux/mosfire/LOK400_mask5_v1-1/2015nov17/Y/LOK400_mask5_v1-1_Y_brsr9_eps_1d_v10.fits']
  outfile = 'LOK400_mask5_v1-1_Y_brsr9_eps_1d_v10.fits'
  that = 'brsr9'
  ;storeage = {lambdas:ptr_new(), flux:ptr_new(), fluxerr:ptr_new(), fluxflag:ptr_new()}
  ;storeage = replicate(storeage, n_elements(files))

  scalebounds = [10550, 10700]

  FOR xx=0, n_elements(files)-1, 1 DO BEGIN
     myspec = obj_new('mosfirespectra', files[xx], 'y')
     myspec.getprop, MOSSPECOBJVER=mymosspecver
     print, mymosspecver
     chkread = myspec.read()
     IF chkread EQ 1 THEN BEGIN
        myspec.unpack
        myspec.commonwave
        myspec.scale, scalebounds
        ;myspec.plotspec, /RAWSPEC, /THROUGHPUT, /CORRECTED
        myspec.getprop, LAMBDAS=mylambdas, FLUX=myflux, DFLUX=myfluxerr, FLAGFLUX=myfluxflag
        IF xx EQ 0 THEN BEGIN
           lambdas = [mylambdas]
           flux = [myflux]
           fluxerr = [myfluxerr]
           fluxflag = [myfluxflag]
        ENDIF ELSE BEGIN
           lambdas = [[lambdas],[mylambdas]]
           flux = [[flux],[myflux]]
           fluxerr = [[fluxerr],[myfluxerr]]
           fluxflag = [[fluxflag],[myfluxflag]]
        ENDELSE
        
     ENDIF ELSE print, 'WARNING!!! File not read in correctly!'
     obj_destroy, myspec
  ENDFOR
  
  nels = n_elements(mylambdas)
  stacked = {lambdas:fltarr(nels), flux:fltarr(nels), fluxerr:fltarr(nels), fluxflag:fltarr(nels)}
  help, stacked, /STRUC
  fluxflag = [[intarr(nels)],[intarr(nels)]]


  print, '   Using a inverse variance weighted average at each wavelength' ;print info
  FOR xx=0, n_elements(flux[*,0])-1, 1 DO BEGIN                            ;loop over wavelengths
     stacked.lambdas[xx] = lambdas[xx,0]                                   ;store wavelength
     ;print, xx
     use = where(fluxflag[xx,*] EQ 0)                                      ;get non-flagged
     IF (use[0] NE -1) THEN BEGIN                                          ;if useful info
        numer = total([flux[xx,use]]/fluxerr[xx,use]^2)                    ;numerator
        denom = total(1.0 / fluxerr[xx,use]^2)                             ;denominator
        stacked.flux[xx] =  numer / denom                                  ;find the inv var weighted mean
        stacked.fluxerr[xx] = (1.0 / denom)^0.5                            ;
     ENDIF ELSE BEGIN                                                      ;if no useful points
        stacked.flux[xx] = 0.0                                             ;if not set to zero
        stacked.fluxerr[xx] = 100.0                                        ;if not set to zero
     ENDELSE                                                               ;end no useful points
  ENDFOR                                                                   ;end loop over wavelengths 


  veldisp = 100.0                                                          ;set default [km/s]
  lambref = 4000.0                                                         ;set default
  print, strcompress('   Convolving spectra with a Gaussian of width ' + $ ;cont next line
                     string(veldisp) + ' [km/s]')                          ;print info
  sigma = ((1000.0 * veldisp) / 299792458.0) * lambref                     ;width of gaussian in wavelength
  chk = ((lambref - stacked.lambdas[0]) GT 0.0) AND $                      ;cont next line
        ((stacked.lambdas[-1] - lambref) GT 0.0)                           ;must fall in wavelength range
  IF (chk NE 1) THEN BEGIN                                                 ;if reference wavelength falls outside spectra range
     print, 'WARNING!! Reference lambda falls outside wavelength range!!'  ;print info
     print, '  Convolution may be poor!'                                   ;print info
  ENDIF                                                                    ;end falls outside range
  mindiff = min(abs(lambref - stacked.lambdas), minind)                    ;pixel for reference lamb
  dlamb = stacked.lambdas[minind+1] - stacked.lambdas[minind]              ;delta lambda
  sigpix = sigma / dlamb                                                   ;width of gaussian in pixels
  kernel = gaussian_function(sigma, /NORMALIZE)                            ;create kernel
  stacked.flux = convol(stacked.flux, kernel)                              ;convolve spectrum
  stacked.fluxerr = convol(stacked.fluxerr, kernel)                        ;convolve spectrum
  

  foranalysis = {lambdas:stacked.lambdas, spec1d:stacked.flux, spec1dwei:stacked.fluxerr, fluxflag:stacked.fluxflag}
  mwrfits, foranalysis, outfile, /CREATE

  mywin = window(LOCATION=[100,300], DIMENSION=[1200,400])
  myplot = plot(stacked.lambdas, stacked.flux, $
                XTITLE='Wavelength [$\Ang$]', $
                YTITLE='Flux [arbitrary]', $
                YRANGE=[-1.0, 1.5], $
                /CURRENT)
  myplot = plot([stacked.lambdas[0],stacked.lambdas,stacked.lambdas[-1],stacked.lambdas[0]], $
                ([0.0, stacked.fluxerr^0.5,0.0,0.0]-0.5), 'grey', $
                FILL_BACKGROUND=1, FILL_COLOR='grey', $
                /CURRENT, /OVERPLOT)


  self.analyze1d, 'stack', that, MCITERS=5 ;analyze spectra


  RETURN
END
;====================================================================================================


;====================================================================================================
PRO lok400::cleanup

  ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION lok400::init, CATALOG=catalog, OUTFILE=outfile, $
                       Z=z, ZLOW=zlow, ZHIGH=zhigh

                                ;self.data = ptr_new(data)
  self.objver = 'v1-2-1'
  self.propname = 'SpARCS 104923+564033'
  self.rah = 10
  self.ram = 49
  self.ras = 22.6
  self.decd = 56
  self.decm = 40
  self.decs = 32.5
  self.rasex = '10:49:22.6'
  self.decsex = '56:40:32.5'
  self.radegcl = 162.34417 
  self.decdegcl = 56.675694
  self.radegbcg = 162.34417 
  self.decdegbcg = 56.675694
  IF keyword_set(Z) THEN self.z = z[0] ELSE self.z = 1.705
  IF keyword_set(ZLOW) THEN self.zlow = zlow[0] ELSE self.zlow = 0.0
  IF keyword_set(ZHIGH) THEN self.zhigh = zhigh[0] ELSE self.zhigh = 0.0

  IF keyword_set(CATALOG) THEN self.catalog = catalog[0] ELSE self.catalog = 'UNKNOWN'
  IF keyword_set(OUTFILE) THEN self.outfile = outfile[0] ELSE self.outfile = 'UNKNOWN'
  
  IF keyword_set(MCITERS) THEN self.mciters = mciters[0] ELSE self.mciters = 250

  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO lok400__define

  void = {lok400, objver:'A', PROPNAME:'A', $
          RAH:0, RAM:0, RAS:0.0, DECD:0, DECM:0, DECS:0.0, $
          RASEX:'A', DECSEX:'A', RADEGCL:0.0, DECDEGCL:0.0, $
          RADEGBCG:0.0, DECDEGBCG:0.0, $
          Z:0.0, ZLOW:0.0, ZHIGH:0.0, $ 
          MCITERS:0, $
          CATALOG:'A', OUTFILE:'A'}

  RETURN
END
;====================================================================================================

