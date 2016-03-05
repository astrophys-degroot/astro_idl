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

     '1' : BEGIN                                                                                           ;choice of first mask
        indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov29/H/'                     ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov29/H/'                    ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                      ;batchmode
           xobj = ['bsbsr3b', 'bsbsr3a', 'bsbsr5a', 'bsbsr5e', 'bsbsr8b', 'fore1', 'fore2', 'fsbsb139', $  ;
                   'fsbsb186', 'fsbsr214', 'fsbsr221', 'fsbsr232', 'msbsb130', 'msbsb130b','msbsb207', $   ;
                   'msbsb219', 'msbsb227', 'msbsr180a', 'msbsr180b', 'msbsr181', 'msbsr215', 'msbsr217', $ ;
                   'msbsr229', 'msbsr233a', 'msbsr233b', 'msbsr239', 'msbsr244', 'msbsr248', 'msbsr249', $ ;
                   'msbsr251', 'msbsr266', 'msbsr314', 'msbsr316', 'msbsr320', 'msbsr334', 'msbsr340', $   ;
                   'msbsr344', 'msbsr379a', 'msbsr391', 'msbsr392', 'msbsr403', 'msbsr408', 'msbsr416', $  ;
                   'msbsr424', 'msbsr427', 'msbsr446']                                                     ;
     END                                                                                                   ;end first mask ;

     '2' : BEGIN                                                                                                       ;choice of first mask
        indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask2/2014may14/H/'                                 ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask2/2014may14/H/'                                ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                                  ;batchmode
           xobj = ['bsbsr17', 'bsbsr5b', 'fsbsb121', 'fsbsb173', 'fsbsr123', 'fsbsr128', 'fsbsr130', 'fsbsr189', $     ;
                   'fsbsr237a', 'fsbsr237b', 'fsbsr239', 'man1', 'msbsb109a', 'msbsb112', 'msbsb157', 'msbsb158a', $   ;
                   'msbsb174', 'msbsb182', 'msbsb198', 'msbsb224', 'msbsb81', 'msbsb90', 'msbsr224', 'msbsr226a', $    ;
                   'msbsr242', 'msbsr252', 'msbsr278a', 'msbsr355', 'msbsr358', 'msbsr359', 'msbsr395', 'msbsr404a', $ ;
                   'msbsr404b', 'msbsr406', 'msbsr413a', 'msbsr431', 'msbsr454']                                       ;
     END                                                                                                               ;end first mask ;

     '3' : BEGIN                                                                                                       ;choice of first mask
        indir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/'                                 ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/'                                ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                                  ;batchmode
           xobj = ['bsbsr5c', 'fsbsb123', 'msbsb105', 'msbsb128', 'msbsb134', 'msbsb140', 'msbsb142a', 'msbsb143', $   ;
                   'msbsb153', 'msbsb175', 'msbsb188', 'msbsr221', 'msbsr240', 'msbsr243', 'msbsr257a', 'msbsr263', $  ;
                   'msbsr269', 'msbsr277', 'msbsr278b', 'msbsr279a', 'msbsr280', 'msbsr285', 'msbsr293', 'msbsr310', $ ;
                   'msbsr312a', 'msbsr315', 'msbsr317', 'msbsr323', 'msbsr335a', 'msbsr336', 'msbsr342', 'msbsr350', $ ;
                   'msbsr376', 'st1']                                                                                  ;
     END                                                                                                               ;end first mask ;

     '4' : BEGIN                                                                                                  ;choice of fourth mask
        indir = '/Users/adegroot/research/dataredux/mosfire/lok400_mask4_v1/2014nov17/H/'                         ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/lok400_mask4_v1/2014nov17/H/'                        ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                             ;batchmode
           xobj = ['pzmed56', 'rest1057', 'rest1173', 'rest1596', 'rest1700', 'rest1927', 'rest2551', $ ;
                   'rest3099', 'rest3216', 'rest3299', 'rest3331', 'rest4548', 'rest4580', 'rest4', 'targ1']      ;
   
                                ;'cl11', 'cl12', 'fg10', 'pzhi16', 'pzhi7', 'pzlow204', 'pzlow205', 'pzlow222', 'pzlow236', $   ;
                                ;'pzmed124', 'pzmed133', 'pzmed153', 'pzmed170', 'pzmed191', 'pzmed1', $                        ;
                                ;'pzmed2', 
     END                        ;end fourth mask ;
     
     ELSE : BEGIN                                 ;begin no match found
        print, 'Warning!! Mask choice not found!' ;print info
        print, '  Current choices are: stack'     ;print info
     END                                                       ;end no match found

  ENDCASE                       ;end which mask
  
  
  FOR xx=0, n_elements(xobj)-1, 1 DO BEGIN                    ;loop over spectra
     print, strcompress( ' Now working on file: ' + xobj[xx]) ;print info
     CASE xmask OF                                            ;which mask
        1 : anset = lok400_mask1_h_analyze_settings(xobj[xx]) ;get analysis settings
        2 : anset = lok400_mask2_h_analyze_settings(xobj[xx]) ;get analysis settings
        3 : anset = lok400_mask3_h_analyze_settings(xobj[xx]) ;get analysis settings
        4 : anset = lok400_mask4_h_analyze_settings(xobj[xx]) ;get analysis settings
        ELSE : BEGIN                                          ;begin no match found
           print, 'Warning!! Mask choice not found!'          ;print info
           print, '  Current choices are: stack'              ;print info
        END                                                   ;end no match found
     ENDCASE                                                  ;end which mask


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
PRO lok400::collate, which, DOOBJ=doobj, SPECVER=specver, NEWSPECVER=newspecver

  
  IF keyword_set(SPECVER) THEN specver = string(specver[0]) ELSE specver = 'v11'
  IF keyword_set(NEWSPECVER) THEN newspecver = string(newspecver[0]) ELSE newspecver = 'v6-3'

  
  CASE which OF
     1 : cstuf = {maskname:'lok400_mask1_H', $
                  mask:'lok400_mask1_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/LOK400_mask1/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'lok400_mask1_1dspeccat_v1-0.fits', $
                  outdir:'/Users/degroota/research/current1_mosfire_2013nov28_lok400/lok400_mask1_H/', $
                  radecdeg:1}

     2 : cstuf = {maskname:'LOK400_mask2_H', $
                  mask:'LOK400_mask2_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/LOK400_mask2_v2/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'lok400_mask2_1dspeccat_v1-0.fits', $
                  outdir:'/Users/degroota/research/current1_mosfire_2013nov28_lok400/lok400_mask2_H/', $
                  radecdeg:1}

     3 : cstuf = {maskname:'LOK400_mask3_H', $
                  mask:'LOK400_mask3_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/LOK400_mask3_v2/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'lok400_mask3_1dspeccat_v1-1.fits', $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/', $
                  radecdeg:1}

     4 : cstuf = {maskname:'lok400_mask4_v1_H', $
                  mask:'lok400_mask4_v1_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/lok400_mask4_v1/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'lok400_mask4_1dspeccat_v1-0.fits', $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/LOK400_mask4/2014nov16/H/', $
                  radecdeg:1}

     5 : cstuf = {maskname:'J1049_20150426_v4_H', $
                  mask:'J1049_20150426_v4_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/lockman/lok400/spectroscopy/masks/MOSFIRE/J1049_20150426_v4/', $
                  chkradecdeg:'lok400_ukidssK_mosaic_v1.0.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/lockman/lok400/images_safe/', $
                  outfile:'J1049_mask5_1dspeccat_v1-0.fits', $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/J1049_20150426_v4/2015apr27/H/', $
                  radecdeg:1}
     
     ELSE : BEGIN
        print, 'Mask choice not recognized!'
        print, '  Please try again. Valid Choices are nothing yet'
        stop
     ENDELSE
  ENDCASE
  
  
  IF keyword_set(DOOBJ) THEN BEGIN
     mycat = obj_new('MOSFIRE_COLLATE1D', MASKNAME=cstuf.maskname, SPECVERS=specver) ;call object
     mycat.getprop, MCOOBJVER=mycatver                                               ;get property
     mycat.makecat                                                                   ;make the catalog
     obj_destroy, mycat
  ENDIF ELSE BEGIN
     mosfire_1dspec_collate, cstuf.maskname, cstuf.mask, /RADECDEG, MASKDIR=cstuf.maskdir, $
                             CHKRADECDEG=cstuf.chkradecdeg, DIRCHKRADECDEG=cstuf.dirchkradecdeg, $
                             OUTFILE=cstuf.outfile
  ENDELSE
  

END	
;====================================================================================================


;====================================================================================================
PRO lok400::mergeMOSFIRE, OUTFILE=outfile, OUTDIR=outdir


  files = ['/Users/adegroot/research/dataredux/mosfire/LOK400_mask1/2013nov29/H/lok400_mask1_1dspeccat_v1-0.fits', $
           '/Users/adegroot/research/dataredux/mosfire/LOK400_mask2/2014may14/H/lok400_mask2_1dspeccat_v1-0.fits', $
           '/Users/adegroot/research/dataredux/mosfire/LOK400_mask3/2014nov16/H/lok400_mask3_1dspeccat_v1-1.fits', $
           '/Users/adegroot/research/dataredux/mosfire/lok400_mask4_v1/2014nov17/H/lok400_mask4_1dspeccat_v1-0.fits']
  
  IF keyword_set(OUTFILE) THEN outfile = string(outfile[0]) ELSE outfile = 'lok400_mosfire_specz_v5-0.fits'
  IF keyword_set(OUTDIR) THEN outdir = string(outdir[0]) ELSE outdir = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/spectroscopic/'


  ;;;determine structure to fill
  outfile = strcompress(outdir + outfile, /REMOVE_ALL)
  ntot = 0
  FOR xx=0, n_elements(files)-1, 1 DO BEGIN
     print, xx
     data = mrdfits(files[xx], 1, hdr, /SILENT)
     nmask = n_elements(data.(0))
     ntot = ntot + nmask
  ENDFOR

  ;;;fill the structure
  out = replicate(data[0], ntot)
  nrun = 0
  FOR xx=0, n_elements(files)-1, 1 DO BEGIN
     data = mrdfits(files[xx], 1, hdr)
     nmask = n_elements(data.(0))
     FOR yy=0, nmask-1, 1 DO BEGIN
        out[nrun] = data[yy]
        nrun++
     ENDFOR
  ENDFOR
  
  ;;;write the file
  mwrfits, out, outfile, /CREATE

END
;====================================================================================================


;====================================================================================================
PRO lok400::mergespecz, OUTFILE=outfile, OUTDIR=outdir


  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'lok400_mosfire_specz_v5-0.fits'
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/spectroscopic/'
  IF keyword_set(PRE1) THEN pre1 = pre1[0] ELSE pre1 = 'm_'
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = ''
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = ''
  IF keyword_set(PRE2) THEN pre2 = pre2[0] ELSE pre2 = ''
  IF keyword_set(FILE3) THEN file3 = file3[0] ELSE file3 = ''
  IF keyword_set(INDIR3) THEN indir3 = indir3[0] ELSE indir3 = ''
  IF keyword_set(PRE3) THEN pre3 = pre3[0] ELSE pre3 = ''
  IF keyword_set(FILE4) THEN file4 = file4[0] ELSE file4 = ''
  IF keyword_set(INDIR4) THEN indir4 = indir4[0] ELSE indir4 = ''
  IF keyword_set(PRE4) THEN pre4 = pre4[0] ELSE pre4 = ''
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'lok400_composite_specz_v6-4.fits'
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/spectroscopic/'
  
  polish_xmm113_speczcat, FILE1=file1, FILE2=file2, FILE3=file3, FILE4=file4, $
                          PRE1=pre1, PRE2=pre2, PRE3=pre3, PRE4=pre4, $
                          INDIR1=indir1, INDIR2=indir2, INDIR3=indir3, INDIR4=indir4, $
                          OUTFILE=outfile, OUTDIR=outdir
  

END
;====================================================================================================


;====================================================================================================
PRO lok400::mergespecphoto, USEOLD=useold, OUTFILE=outfile, OUTDIR=outdir


  
  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'lok400_composite_specz_v6-4-1.fits'
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/spectroscopic/'
  IF keyword_set(PRE1) THEN pre1 = pre1[0] ELSE pre1 = 'SP_'
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = 'J1049_stellar_mass_v1-2.fits'
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/tracy/'
  IF keyword_set(PRE2) THEN pre2 = pre2[0] ELSE pre2 = 'PH_'
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'J1049_pz_specz_full_v3-0-0.fits'
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/lockman/lok400/catalogs/'


  IF keyword_set(USEOLD) THEN BEGIN
     polish_cdfs44_totalcat, FILE1=file1, FILE2=file2, $
                             PRE1=pre1, PRE2=pre2, $
                             INDIR1=indir1, INDIR2=indir2, $
                             OUTFILE=outfile, OUTDIR=outdir, RDCOMB='photo'
  ENDIF ELSE BEGIN                                                                         ;combine using master_radec object
     master = mrdfits(strcompress(indir2 + file2, /REMOVE_ALL), 1, hdr, /SILENT)           ;which is the master catalog
     mtags = tag_names(master)                                                             ;get tag names from structure
     data1 = mrdfits(strcompress(indir1 + file1, /REMOVE_ALL), 1, hdr, /SILENT)            ;which is the matching catalog
     data1tags = tag_names(data1)                                                          ;tag names of matching catalog
     mymatch = obj_new('master_radec', master.ra, master.dec, FULLM=master, FULL1=data1, $ ;cont next line
                       RA1=data1.rabest, DEC1=data1.decbest, PREM=pre2, PRE1=pre1)         ;call the master match object
     mymatch.boxscore                                                                      ;get some basic info
     cont = mymatch.sanitycheck()                                                          ;perform basic sanity checks
     IF cont EQ 1 THEN BEGIN                                                               ;if all sanity checks pass
        mymatch.startstruc                                                                 ;start the structure
        mymatch.addtags, data1tags, data1[0], EXCEPT=['ID'], /MATCH                        ;add tags from matching catalog
        mymatch.addtags, mtags, master[0], EXCEPT=['RA', 'DEC'], /MASTER                   ;add tags from matching catalog
        mymatch.copyout                                                                    ;copy data that came with master 
        indmatch = mymatch.matches(MAXSEAR=2.0, /NOMID)                                    ;create matched pairs
        mymatch.adjust, 'SIMPLEMEAN', /SHOWPLOT, $                                         ;cont next line
           TGRAONE=strcompress(pre1 + 'RABEST', /REMOVE_ALL), $                            ;cont next line
           TGDECONE=strcompress(pre1 + 'DECBEST', /REMOVE_ALL)                             ;find offset and adjust
        indmatch = mymatch.matches(MAXSEAR=2.0)                                            ;create matched pairs
        mymatch.write, FILENAME=strcompress(outdir + outfile, /REMOVE_ALL), $              ;cont next line
                                /EXTRA, /FAILED, /ALL                                      ;write out file
     ENDIF                                                                                 ;end all sanity checks pass
  ENDELSE                                                                                  ;end combine using master_radec
  
END
;====================================================================================================



;====================================================================================================
PRO lok400::add_agn_k06, CATALOG=catalog, OUTFILE=outfile, $
                         TGHAFLUX=tghaflux, TGNIIFLUX=tgniiflux

  
  ;;;set default values
  IF keyword_set(CATALOG) THEN catalog = catalog[0] ELSE catalog = self.catalog
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = self.outfile
  IF keyword_set(TGHAFLUX) THEN tghaflux = tghaflux[0] ELSE tghaflux = self.tghaflux
  IF keyword_set(TGNIIFLUX) THEN tgniiflux = tgniiflux[0] ELSE tgniiflux = self.tgniiflux
  

  ;;;read in catalog, find data in it
  data = mrdfits(catalog, 1, hdr)                    ;read in data
  chk = tag_exist(data, tghaflux, INDEX=indhaflux)   ;find tag index
  chk = tag_exist(data, tgniiflux, INDEX=indniiflux) ;find tag index

  ;;;add the tag
  out = kewley_2006(1, FLUXHA=data.(indhaflux), FLUXNII=data.(indniiflux)) ;flag AGN
  add_tag, data, 'AN_AGNK06', 0, newstruc                                  ;add to structure
  data = newstruc                                                          ;new structure
  data.AN_AGNK06 = out                                                     ;set flags in

  mwrfits, data, outfile, /CREATE

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO lok400::add_clmem, WHICH=which, $
                       CATALOG=catalog, OUTFILE=outfile, $
                       TGRA=tgra, TGDEC=tgdec, TGSPECZ=tgspecz, TGDEDICA=tgdedica, TGCLMEM=tgclmem, $
                       MAIN=main, SECONDARY=secondary, PLOTIT=plotit


  ;;;set default values
  IF keyword_set(WHICH) THEN which = which[0] ELSE which = 'shiftinggapper'          ;set default
  IF keyword_set(CATALOG) THEN catalog = catalog[0] ELSE catalog = self.catalog      ;set default
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = self.outfile      ;set default
  IF keyword_set(TGSPECZ) THEN tgspecz = tgspecz[0] ELSE tgspecz = self.tgspecz      ;set default
  IF keyword_set(TGRA) THEN tgra = tgra[0] ELSE tgra = self.tgra                     ;set default
  IF keyword_set(TGDEC) THEN tgdec = tgdec[0] ELSE tgdec = self.tgdec                ;set default
  IF keyword_set(TGCLMEM) THEN tgclmem = tgclmem[0] ELSE tgclmem = self.tgclmem      ;set default
  IF keyword_set(TGDEDICA) THEN tgdedica = tgdedica[0] ELSE tgdedica = self.tgdedica ;set default
  IF keyword_set(MAIN) THEN main = string(main[0]) ELSE main = 'A'                   ;set default


  ;;;read in catalog, find data in it
  print, catalog
  data = mrdfits(catalog, 1, hdr)                ;read in file
  clmems = intarr(n_elements(data))              ;array for flag
  chk = tag_exist(data, tgspecz, INDEX=indspecz) ;find tag index

  CASE which OF                 ;how to assign cluster membership
     
     'simple' : BEGIN                                                                            ;straight redshift limits                                                  
        chk = where((data.(indspecz) GE self.zlow) AND (data.(indspecz) LE self.zhigh))          ;primary overdensity
        IF (chk[0] NE -1) THEN clmems[chk] = 1                                                   ;set flag in array
        IF keyword_set(SECONDARY) THEN BEGIN                                                     ;if secondary redshift peak
           chk = where((data.(indspecz) GE self.zseclow) AND (data.(indspecz) LE self.zsechigh)) ;find flag
           IF (chk[0] NE -1) THEN clmems[chk] = 2                                                ;set flag in array
        ENDIF                                                                                    ;end secondary redshift peak
        tag = 'AN_CLMEM'                                                                         ;define tag
     END                                                                                         ;end straight redshift limits

     'adaptivekernel' : BEGIN
        cpdata = data                                                           ;make a copy
        chk = where((cpdata.sp_rabest GE 0.0) AND (cpdata.sp_rabest LT 360.0))  ;make a sanity cut
        IF (chk[0] NE -1) THEN cpdata = cpdata[chk]                             ;keep good objects
        chk = where((cpdata.(indspecz) GE 0.0) AND (cpdata.(indspecz) LT 10.0)) ;make a sanity cut
        IF (chk[0] NE -1) THEN cpdata = cpdata[chk]                             ;keep good objects
        speczs = cpdata.(indspecz)                                              ;get just redshifts

        analysis = 1                                                      ;start variable as something
        dedica, speczs, NITERS=12, FACTOR0=0.8, ANALYZE=analysis, /PLOTIT ;get stuff
        add_tag, data, 'AN_DEDICA', 'ZZ', tmpstruc                        ;add tag to structure
        data = tmpstruc                                                   ;recapture structure

        labels = ['A', 'B', 'C', 'D', 'E', 'F']                                                          ;peak labels
        FOR xx=0, n_elements(labels)-1, 1 DO BEGIN                                                       ;loop over peaks
           bit1 = strcompress(labels[xx] + '_DINFLEC', /REMOVE_ALL)                                      ;tag name
           bit2 = strcompress(labels[xx] + '_UINFLEC', /REMOVE_ALL)                                      ;tag name
           chk = tag_exist(analysis, bit1, INDEX=ind1)                                                   ;find necessary tag
           chk = tag_exist(analysis, bit2, INDEX=ind2)                                                   ;find necessary tag
           IF (ind1 NE -1) AND (ind2 NE -1) THEN BEGIN                                                   ;sanity check
              yes = where((data.(indspecz) GE analysis.(ind1)) AND (data.(indspecz) LE analysis.(ind2))) ;in range
              IF (yes[0] NE -1) THEN BEGIN                                                               ;if some values fit
                 data[yes].AN_DEDICA = labels[xx]                                                        ;store value
                 IF (labels[xx] EQ main) THEN clmems[yes] = 1 ELSE BEGIN                                 ;if we want secondary peaks
                    IF keyword_set(SECONDARY) THEN clmems[yes] = 2                                       ;set cluster or group
                 ENDELSE                                                                                 ;end want secondary peaks
              ENDIF                                                                                      ;end some values fit
           ENDIF                                                                                         ;sanity check
        ENDFOR                                                                                           ;end loop over peaks
        tag = 'AN_ADAPKER'                                                                               ;define tag
     END

     'shiftinggapper' : BEGIN                                            ;to run shifting gapper
        print, ' To run shifting gapper we need: '                       ;print info
        print, '  RA, Dec, redshift, intial guess of cluster membership' ;print info
        
        
        ;;;grab the tag indices
        chk = tag_exist(data, tgra, INDEX=raind)            ;find necessary tag
        text = '   This routine cant find the RA tag: '     ;text to pass
        IF chk EQ 0 THEN raind = tagprompt(data, text)      ;find necessary tag
        chk = tag_exist(data, tgdec, INDEX=decind)          ;find necessary tag
        text = '   This routine cant find the DEC tag: '    ;text to pass
        IF chk EQ 0 THEN decind = tagprompt(data, text)     ;find necessary tag
        chk = tag_exist(data, tgspecz, INDEX=speczind)      ;find necessary tag
        text = '   This routine cant find the SPECZ tag: '  ;text to pass
        IF chk EQ 0 THEN speczind = tagprompt(data, text)   ;find necessary tag
        chk = tag_exist(data, tgclmem, INDEX=clmemind)      ;find necessary tag
        text = '   This routine cant find the CLMEM tag: '  ;text to pass
        IF chk EQ 0 THEN clmemind = tagprompt(data, text)   ;find necessary tag
        chk = tag_exist(data, tgclmem, INDEX=clmemind)      ;find necessary tag
        text = '   This routine cant find the CLMEM tag: '  ;text to pass
        IF chk EQ 0 THEN clmemind = tagprompt(data, text)   ;find necessary tag
  

        ;;;make cuts to get just structure members
        clmems = intarr(n_elements(data.(0)))                                              ;make array
        cpdata = data                                                                      ;copy of data
        cluse = where(cpdata.(clmemind) EQ 1, ncluse)                                      ;get only cluster members
        IF (cluse[0] NE -1) THEN cpdata = cpdata[cluse]                                    ;grab subset
        tmpcluse = where((cpdata.(raind) GE 0.0) AND (cpdata.(raind) LT 360.0) AND $       ;cont next line
                         (cpdata.(decind) GT -90.0) AND (cpdata.(decind) LT 90.0), ncluse) ;sanity check for RA, Dec
        IF (tmpcluse[0] NE -1) THEN BEGIN                                                  ;if points pass
           cpdata = cpdata[tmpcluse]                                                       ;grab subset
           cluse = cluse[tmpcluse]                                                         ;get original data array indices
        ENDIF                                                                              ;end if points pass
        print, cpdata.(raind)
        print, cpdata.(decind)
        print, ncluse
        ;stop

 


       tmpcluse = uniq(cpdata.(speczind), sort(cpdata.(speczind)))                        ;find unique redshift entries
        IF (tmpcluse[0] NE -1) THEN BEGIN                                                  ;if points pass
           cpdata = cpdata[tmpcluse]                                                       ;eliminating duplicate entries
           cluse = cluse[tmpcluse]                                                         ;get original data array indices
        ENDIF                                                                              ;end if points pass


        IF (ncluse NE 0) THEN BEGIN ;we can proceed
           
           ;;;find biweight guesses for RA, Dec
           mybi = obj_new('beers1990', data[cluse].(raind)) ;create object
           centra = mybi.biweight()                         ;get biweight value
           obj_destroy, mybi                                ;destroy object
           
           mybi = obj_new('beers1990', data[cluse].(decind)) ;create object
           centdec = mybi.biweight()                         ;get biweight value
           obj_destroy, mybi                                 ;destroy object

           IF keyword_set(PLOTIT) THEN BEGIN                                  ;option to plot
              w = window(LOCATION=[100,25])                                   ;window
              myplot = plot(data[cluse].(raind), data[cluse].(decind), '+', $ ;plot ra, dec of good points
                            /CURRENT, $                                       ;plot options
                            TITLE='RA, Dec Plot [deg]', $                     ;plot options
                            XTITLE='RA [deg]', $                              ;plot options
                            YTITLE='Dec [deg]')                               ;plot options
              myplot = plot([centra], [centdec], 'ro', SYM_SIZE=2, $          ;plot biweight center
                            SYM_FILLED=1, SYM_FILL_COLOR='red', /OVERPLOT)    ;plot options
           ENDIF                                                              ;end option to plot
           
           mysg = obj_new('girardi2005', centra, centdec, data[cluse].(raind), $ ;cont next line
                          data[cluse].(decind), data[cluse].(speczind))          ;call object 
           mysg.prepcalc                                                         ;preparatory calculations
           incl = mysg.reject(/FORGIVE)                                          ;reject candidates
           mysg.figure2, INCL=incl                                               ;create figure
           print, ' Shifting gapper yields: ', n_elements(incl)                  ;print info
           zs = *mysg.zs                                                         ;grab redshifts

           mybi = obj_new('beers1990', zs[incl])                                                     ;create object
           centdec = mybi.biweight()                                                                 ;get biweight value
           dcentdec = mybi.biweightscale()                                                           ;get biweight scale value
           obj_destroy, mybi                                                                         ;destroy object
           print, strcompress(' Cluster redshift is ' + string(centdec) + ' +/-' + string(dcentdec)) ;cluster redshift
           obj_destroy, mysg                                                                         ;destroy object

           tag = 'AN_SHIGAP'       ;define tag
           clmems[cluse[incl]] = 1 ;where cluster members are
           
        ENDIF  ELSE BEGIN                                              ;end we can proceed
           print, 'WARNING!! Didnt find any cluster members.'          ;print info
           print, '  Expecting tgclmem values = 1 for cluster members' ;print info
        ENDELSE                                                        ;end can not proceed

     END                        ;end running shifting gapper

     ELSE : BEGIN                                                                  ;if choice not found
        print, 'WARNING!! Choice of cluster membership assignment not understood.' ;print info
        print, '  Choices are "simple", "adaptivekernel", "shiftinggapper" '       ;print info
     ENDELSE                                                                       ;end choice not found

  ENDCASE                       ;end how to assign cluster membership

  ;;;add the tag
  add_tag, data, tag, 0, newstruc          ;add tag to structure
  data = newstruc                          ;get back new structure
  chk = tag_exist(data, tag, INDEX=tagind) ;find tag index
  data.(tagind) = clmems                   ;set tag values
  mwrfits, data, outfile, /CREATE          ;write file

  RETURN
END
;====================================================================================================


;====================================================================================================
PRO lok400::finalcat


  catalog = 'J1049_pz_specz_full_v3-0-0_all.fits'
  outfile = 'J1049_pz_specz_full_v3-0-1_all.fits'
  self.add_agn_k06, CATALOG=catalog, OUTFILE=outfile

  catalog = outfile
  outfile = 'J1049_pz_specz_full_v3-0-2_all.fits'
  self.add_clmem, WHICH='simple', MAIN='A', SECONDARY=0, CATALOG=catalog, OUTFILE=outfile

  catalog = outfile
  outfile = 'J1049_pz_specz_full_v3-0-4_all.fits'
  self.add_clmem, WHICH='adaptivekernel', MAIN='A', SECONDARY=0, CATALOG=catalog, OUTFILE=outfile
  
  catalog = outfile
  outfile = 'J1049_pz_specz_full_v3-10-4_all.fits'
  self.add_clmem, WHICH='shiftinggapper', CATALOG=catalog, OUTFILE=outfile

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
  IF keyword_set(ZLOW) THEN self.zlow = zlow[0] ELSE self.zlow = 1.690
  IF keyword_set(ZHIGH) THEN self.zhigh = zhigh[0] ELSE self.zhigh = 1.720
                                ;Shifting gapper yields: 26 - Cluster redshift is 1.70854 +/- 0.00282711



  IF keyword_set(CATALOG) THEN self.catalog = catalog[0] ELSE self.catalog = 'UNKNOWN'
  IF keyword_set(OUTFILE) THEN self.outfile = outfile[0] ELSE self.outfile = 'UNKNOWN'
  
  IF keyword_set(MCITERS) THEN self.mciters = mciters[0] ELSE self.mciters = 250
  IF keyword_set(TGHAFLUX) THEN self.tghaflux = string(tghaflux[0]) ELSE self.tghaflux = 'SP_M_HA_FLUX'
  IF keyword_set(TGNIIFLUX) THEN self.tgniiflux = string(tgniiflux[0]) ELSE self.tgniiflux = 'SP_M_NIIR_FLUX'
  IF keyword_set(TGRA) THEN self.tgra = string(tgra[0]) ELSE self.tgra = 'SP_RABEST'
  IF keyword_set(TGDEC) THEN self.tgdec = string(tgdec[0]) ELSE self.tgdec = 'SP_DECBEST'
  IF keyword_set(TGSPECZ) THEN self.tgspecz = string(tgspecz[0]) ELSE self.tgspecz = 'SP_SPECZBEST'
  IF keyword_set(TGCLMEM) THEN self.tgclmem = string(tgclmem[0]) ELSE self.tgclmem = 'AN_ADAPKER'
  IF keyword_set(TGDEDICA) THEN self.tgdedica = string(tgdedica[0]) ELSE self.tgdedica = 'AN_DEDICA'

  IF keyword_set(TGCH1FLUX) THEN self.tgch1flux = string(tgch1flux[0]) ELSE self.tgch1flux = 'ph_irac1flux'
  IF keyword_set(TGCH2FLUX) THEN self.tgch2flux = string(tgch2flux[0]) ELSE self.tgch2flux = 'ph_irac2flux'
  IF keyword_set(TGCH3FLUX) THEN self.tgch3flux = string(tgch3flux[0]) ELSE self.tgch3flux = 'ph_irac3flux'
  IF keyword_set(TGCH4FLUX) THEN self.tgch4flux = string(tgch4flux[0]) ELSE self.tgch4flux = 'ph_irac4flux'

  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO lok400__define

  void = {lok400, objver:'A', PROPNAME:'A', $
          RAH:0, RAM:0, RAS:0.0, DECD:0, DECM:0, DECS:0.0, $
          RASEX:'A', DECSEX:'A', RADEGCL:0.0, DECDEGCL:0.0, $
          RADEGBCG:0.0, DECDEGBCG:0.0, $
          Z:0.0, ZLOW:0.0, ZHIGH:0.0, ZSEC:0.0, ZSECLOW:0.0, ZSECHIGH:0.0, $ 
          CATALOG:'A', OUTFILE:'A', $
          MCITERS:0, $
          TGHAFLUX:'A', TGNIIFLUX:'A', TGRA:'A', TGDEC:'A', $
          TGSPECZ:'A', TGCLMEM:'A', TGDEDICA:'A', $
          TGCH1FLUX:'A', TGCH2FLUX:'A', TGCH3FLUX:'A', TGCH4FLUX:'A'}
  RETURN
END
;====================================================================================================

