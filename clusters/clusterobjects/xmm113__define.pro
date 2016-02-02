;+
; NAME:
;       XMM113()
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
;       A. DeGroot, 2015 May 12, Univ. Cali, Riverside v1-4-1
;          -added possiblily of secondary redshift peak
;       A. DeGroot, 2015 May 12, Univ. Cali, Riverside v1.3.0
;          -BCG info in [deg]
;       A. DeGroot, 2015 May 12, Univ. Cali, Riverside v1.3.0
;          -added analyze1d module (imported from cdfs44 object)
;       A. DeGroot, 2015 May 12, Univ. Cali, Riverside v1.0.0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO xmm113::getprop, OBJVER=objver, PROPNAME=propname, $
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
PRO xmm113::analyze1d, xmask, xobj, MCITERS=mciters, NOMCWRITE=nomcwrite ;, CATALOG=catalog, OUTFILE=outfile

  COMPILE_OPT IDL2              ;force new defaults
  check_dir, 1                  ;compile module

  IF keyword_set(MCITERS) THEN mciters = fix(mciters[0]) ELSE mciters = self.mciters ;set default
  
  CASE xmask OF
     
     1 : BEGIN                                                                                                     ;choice of first mask
        indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/'             ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/'            ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                              ;batchmode
           xobj = ['bsbs46', 'cl10', 'cl5', 'cl6', 'cl8', 'cl9', 'fore1', 'fsbs7', 'msbs22', 'msbs28', $           ;
                   'msbs341', 'pzbsbs10', 'pzbsbs11', 'pzbsbs12', 'pzbsbs13', 'pzbsbs14', 'pzbsbs15', $
                   'pzbsbs16', 'pzbsbs18', 'pzbsbs2', 'pzbsbs4', 'pzbsbs6', 'pzbsbs7', 'pzbsbs8', $                ;
                   'pzfsbs30', 'pzmsbs100', 'pzmsbs28', 'pzmsbs45', 'pzmsbs48', 'pzmsbs50', 'new1', $              ;
                   'pzmsbs54', 'pzmsbs67', 'pzmsbs70', 'pzmsbs83', 'pzmsbs87', 'pzmsbs94', 'pzmsbs95' ,'scist2' ]  ;set to all possibles
     END                                                                                                           ;end first mask

     2: BEGIN                                                                                             ;choice of second mask
        indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/'                ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/'               ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                     ;batchmode
           xobj = ['bsbs4', 'bsbs52', 'bsbs58', 'bsbs5', 'cl0', 'cl2', 'cl4', 'cl7', 'fsbs10', 'fsbs9', $ ;
                   'msbs10', 'msbs12', 'msbs17', 'msbs397', 'msbs410', 'msbs467', 'msbs477', 'new2', $    ;
                   'new3', 'pzfsbs35', 'pzmsbs0', 'pzmsbs14', 'pzmsbs19', 'pzmsbs26', 'pzmsbs27', $       ;
                   'pzmsbs31', 'pzmsbs39', 'pzmsbs42', 'pzmsbs43', 'pzmsbs44', 'pzmsbs47', 'pzmsbs51', $  ;
                   'pzmsbs52', 'pzmsbs63', 'pzmsbs80', 'pzmsbs86', 'scist5']                              ;set to all possibles
     END                                                                                                  ;end second mask

     6: BEGIN                                                                                         ;choice of sixth mask
        indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/'                ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/'               ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                 ;batchmode
           xobj = ['cl11', 'cl1', 'cl3', 'msbs17', 'msbs310', 'msbs320', 'msbs335', 'nby0', 'new3', $ ;
                   'pzadd14', 'pzadd18', 'pzadd23', 'pzadd34', 'pzadd72', 'pzadd77', 'pzadd7', $      ;
                   'pzadd86', 'pzadd8', 'pzadd90', 'pzbsbs1', 'pzbsbs3', 'pzfsbs26', 'pzfsbs5', $     ;
                   'pzj4745', 'pzmsbs101', 'pzmsbs88', 'pzmsbs8', 'pzmsbs97','st30']                  ;set to all possibles
     END                                                                                              ;end sixth mask

     7: BEGIN                                                                                                   ;choice of seventh mask
        indir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/'                          ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/'                         ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                           ;batchmode
           xobj = ['bsbs4', 'cl10', 'fore2', 'fore3', 'fore4', 'fsbs0', 'fsbs14', 'fsbs15', $                   ;
                   'fsbs19', 'gill1', 'msbs11', 'msbs14', 'msbs357', 'msbs5', $                                 ;
                   'new5', 'pzadd21', 'pzadd25', 'msbs321', 'msbs346', 'pzadd26', 'pzadd62', $                  ;
                   'pzadd70', 'pzadd85', 'pzbsbs17', $                                                          ;
                   'pzfsbs25', 'pzfsbs37', 'pzj3680', 'pzmsbs23', 'pzmsbs32', 'pzmsbs79', 'pzmsbs86', 'scist1'] ;set to all possibles
     END                                                                                                        ;end seventh mask
     
     8: BEGIN                                                                                                          ;choice of eight mask
        indir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask8_v1/2014nov16/H/'                              ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask8_v1/2014nov16/H/'                             ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                                  ;batchmode
           xobj = [  'pzhi31', 'pzhi35', 'pzhi36', 'pzhi40', 'pzhi44', 'pzhi46', 'pzhi48', 'pzhi49', 'pzhi54', $       ;
                     'pzhi55', 'pzhi56', 'pzhi57', 'pzhi58', 'pzhi60', 'pzhi61', 'pzhi62', 'pzlow2090', 'pzmed331', $  ;
                     'pzmed435', 'pzmed448', 'pzmed449', 'pzmed451', 'pzmed466', 'pzmed493', 'pzmed614', 'pzmed618', $ ;
                     'pzmed619', 'pzmed628', 'pzmed695', 'pzmed716', 'pzmed731', 'pzmed752', 'pzmed761', 'pzmed789', $ ;
                     'pzmed794','st18']                                                                                ;set to all possibles
     END                                                                                                               ;end eight mask

     9: BEGIN                                                                                             ;choice of eight mask
        indir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask9_v1/2015feb23/H/'                 ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/xmm113_mask9_v1/2015feb23/H/'                ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                     ;batchmode
           xobj = ['pzhi19', 'pzhi25', 'pzhi26', 'pzhi32', 'pzhi41', 'pzhi42', 'pzhi45', 'pzhi47', $      ;
                   'pzhi50', 'pzhi59', 'pzhi64', 'pzlow1223', 'pzlow2335', 'pzlow2434', 'pzlow2447', $    ;
                   'pzlow2594', 'pzlow985', 'pzmed230', 'pzmed373', 'pzmed409', 'pzmed446', 'pzmed459', $ ;
                   'pzmed471', 'pzmed476', 'pzmed520', 'pzmed613', 'pzmed646', 'pzmed688', $              ;
                   'pzmed692', 'pzmed757', 'pzmed775', 'pzmed782', 'pzmed802', 'pzmed808', 'spzo27', $    ;
                   'spzo35', 'st24']                                                                      ;set to all possibles
                                ;'pzmed746', 
     END                                                                                                  ;end eight mask
 

     10 : BEGIN                                                                              ;choice of eight mask
        indir = '/Users/adegroot/research/dataredux/mosfire/J0224_mask10_v1-3/2015nov17/Y/'  ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/J0224_mask10_v1-3/2015nov17/Y/' ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                        ;batchmode
           xobj = ['pzhiuqhs4']                                                              ;set to all possibles
     END                                                                                     ;end eight mask
     
     ELSE : BEGIN                                 ;begin no match found
        print, 'Warning!! Mask choice not found!' ;print info
        print, '  Current choices are: 1'         ;print info
     END                                          ;end no match found

  ENDCASE                       ;end which mask


  FOR xx=0, n_elements(xobj)-1, 1 DO BEGIN                      ;loop over spectra
     print, strcompress( ' Now working on file: ' + xobj[xx])   ;print info
     CASE xmask OF                                              ;
        1 : anset = xmm113_mask1_h_analyze_settings(xobj[xx])   ;get analysis settings
        2 : anset = xmm113_mask2_h_analyze_settings(xobj[xx])   ;get analysis settings
        6 : anset = xmm113_mask6_h_analyze_settings(xobj[xx])   ;get analysis settings
        7 : anset = xmm113_mask7_h_analyze_settings(xobj[xx])   ;get analysis settings
        8 : anset = xmm113_mask8_h_analyze_settings(xobj[xx])   ;get analysis settings
        9 : anset = xmm113_mask9_h_analyze_settings(xobj[xx])   ;get analysis settings
        10 : anset = xmm113_mask10_y_analyze_settings(xobj[xx]) ;get analysis settings
        ELSE : BEGIN                                            ;begin no match found
           print, 'Warning!! Mask choice not found!'            ;print info
           print, '  Current choices are: 1, 2, 6, 7, 8, or 9'  ;print info
        END                                                     ;end no match found
     ENDCASE                                                    ;end which mask


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


     myanyl = obj_new('mosfire_analyze1d', anset.basename, xobj[xx], INDIR=indir, OUTDIR=outdir, $     ;cont next line
                      FITTO=fitto, LAL=lal, LAU=lau, YL=yl, YU=yu, NOFITSKY=nofitsky, DRYRUN=dryrun, $ ;cont next line
                      BORDER=border, INITGSS=initgss, PRIORS=priors, OLDVER=oldver, NEWVER=newver, $   ;cont next line
                      XWHICH=xwhich, ZQFLAG=zqflag)                                                    ;call analyze 1d object


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
PRO xmm113::collate, which, DOOBJ=doobj, SPECVER=specver, NEWSPECVER=newspecver

  
  IF keyword_set(SPECVER) THEN specver = string(specver[0]) ELSE specver = 'v1-2'
  IF keyword_set(NEWSPECVER) THEN newspecver = string(newspecver[0]) ELSE newspecver = 'v6-3'

  CASE which OF
     1 : cstuf = {maskname:'XMM113_mask1_1.0_H', $
                  mask:'XMM113_mask1_1.0_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/XMM113_mask1_1.0/', $
                  chkradecdeg:'XMM_113_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/xmm/xmm113/images_safe/', $
                  outfile:strcompress('xmm113_mask1_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/', $
                  radecdeg:1}
     
     2 : cstuf = {maskname:'XMM113_mask2_1.0_H', $
                  mask:'XMM113_mask2_1.0_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/XMM113_mask2_1.0/', $
                  chkradecdeg:'XMM_113_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/xmm/xmm113/images_safe/', $
                  outfile:strcompress('xmm113_mask2_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/', $
                  radecdeg:1}
     
      6 : cstuf = {maskname:'XMM113_mask6_H', $
                  mask:'XMM113_mask6_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/XMM113_mask6/', $
                  chkradecdeg:'XMM_113_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/xmm/xmm113/images_safe/', $
                  outfile:strcompress('xmm113_mask6_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/', $
                  radecdeg:1}
     
      7 : cstuf = {maskname:'XMM113_mask7_H', $
                  mask:'XMM113_mask7_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/XMM113_mask7/', $
                  chkradecdeg:'XMM_113_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/xmm/xmm113/images_safe/', $
                  outfile:strcompress('xmm113_mask7_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014nov16/H/', $
                  radecdeg:1}
     
      8 : cstuf = {maskname:'xmm113_mask8_v1_H', $
                   mask:'xmm113_mask8_v1_orig.coords', $
                   maskdir:'/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/xmm113_mask8_v1/', $
                   chkradecdeg:'xmm_113_Ks_v4_ima.fits', $
                   dirchkradecdeg:'/Users/adegroot/research/clusters/xmm/xmm113/images_safe/', $
                   outfile:strcompress('xmm113_mask8_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                   outdir:'/Users/adegroot/research/dataredux/mosfire/xmm113_mask8/2014nov16/H/', $
                   radecdeg:1}
      
      9 : cstuf = {maskname:'xmm113_mask9_v1_H', $
                   mask:'xmm113_mask9_v1_orig.coords', $
                   maskdir:'/Users/adegroot/research/clusters/xmm/xmm113/spectroscopy/masks/xmm113_mask9_v1/', $
                   chkradecdeg:'xmm_113_Ks_v4_ima.fits', $
                   dirchkradecdeg:'/Users/adegroot/research/clusters/xmm/xmm113/images_safe/', $
                   outfile:strcompress('xmm113_mask9_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                   outdir:'/Users/adegroot/research/dataredux/mosfire/xmm113_mask9_v1/2015feb23/H/', $
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
PRO xmm113::mergeMOSFIRE, OUTFILE=outfile, OUTDIR=outdir


  files = ['/Users/adegroot/research/dataredux/mosfire/XMM113_mask1_1.0/2012nov25/H/Offset_1.25/xmm113_mask1_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/XMM113_mask2_1.0/2012nov25/H/xmm113_mask2_1dspeccat_v6-3.fits' ,$
           '/Users/adegroot/research/dataredux/mosfire/XMM113_mask6/2014aug16/H/xmm113_mask6_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/XMM113_mask7/2014aug16/H/xmm113_mask7_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/xmm113_mask8_v1/2014nov16/H/xmm113_mask8_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/xmm113_mask9_v1/2015feb23/H/xmm113_mask9_1dspeccat_v6-3.fits']
  
  IF keyword_set(OUTFILE) THEN outfile = string(outfile[0]) ELSE outfile = 'xmm113_mosfire_specz_v6-4.fits'
  IF keyword_set(OUTDIR) THEN outdir = string(outdir[0]) ELSE outdir = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/spectroscopic/'


  ;;;determine structure to fill
  outfile = strcompress(outdir + outfile, /REMOVE_ALL)
  ntot = 0
  FOR xx=0, n_elements(files)-1, 1 DO BEGIN
     print, xx, '', files[xx]
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
PRO xmm113::mergespecz, OUTFILE=outfile, OUTDIR=outdir


  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'xmm113_mosfire_specz_v6-4.fits'
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/spectroscopic/'
  IF keyword_set(PRE1) THEN pre1 = pre1[0] ELSE pre1 = 'm_'
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = 'xmm113_fors2_specz_v1-0.fits'
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/spectroscopic/'
  IF keyword_set(PRE2) THEN pre2 = pre2[0] ELSE pre2 = 'g_'
  IF keyword_set(FILE3) THEN file3 = file3[0] ELSE file3 = ''
  IF keyword_set(INDIR3) THEN indir3 = indir3[0] ELSE indir3 = ''
  IF keyword_set(PRE3) THEN pre3 = pre3[0] ELSE pre3 = ''
  IF keyword_set(FILE4) THEN file4 = file4[0] ELSE file4 = ''
  IF keyword_set(INDIR4) THEN indir4 = indir4[0] ELSE indir4 = ''
  IF keyword_set(PRE4) THEN pre4 = pre4[0] ELSE pre4 = ''
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'xmm113_composite_specz_v3-0.fits'
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/spectroscopic/'
  
  polish_xmm113_speczcat, FILE1=file1, FILE2=file2, FILE3=file3, FILE4=file4, $
                          PRE1=pre1, PRE2=pre2, PRE3=pre3, PRE4=pre4, $
                          INDIR1=indir1, INDIR2=indir2, INDIR3=indir3, INDIR4=indir4, $
                          OUTFILE=outfile, OUTDIR=outdir
  

END
;====================================================================================================


;====================================================================================================
PRO xmm113::mergespecphoto, USEOLD=useold, OUTFILE=outfile, OUTDIR=outdir


  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'xmm113_composite_specz_v3-0.fits'
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/spectroscopic/'
  IF keyword_set(PRE1) THEN pre1 = pre1[0] ELSE pre1 = 'SP_'
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = 'xmm113_catalog_v6.1.fits'
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/julie/xmm113_catalog_v6/'
  IF keyword_set(PRE2) THEN pre2 = pre2[0] ELSE pre2 = 'PH_'
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'xmm113_pz_specz_full_v3-3-0.fits'
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/'


 
  IF keyword_set(USEOLD) THEN BEGIN
     polish_xmm113_totalcat, FILE1=file1, FILE2=file2, $
                             PRE1=pre1, PRE2=pre2, $
                             INDIR1=indir1, INDIR2=indir2, $
                             OUTFILE=outfile, OUTDIR=outdir
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
        indmatch = mymatch.matches(MAXSEAR=2.0)                                            ;create matched pairs
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
PRO xmm113::add_agn_k06, CATALOG=catalog, OUTFILE=outfile, $
                         TGHAFLUX=tghaflux, TGNIIFLUX=tgniiflux

  
  ;;;set default values
  IF keyword_set(CATALOG) THEN catalog = catalog[0] ELSE catalog = self.catalog
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = self.outfile
  IF keyword_set(TGHAFLUX) THEN tghaflux = tghaflux[0] ELSE tghaflux = self.tghaflux
  IF keyword_set(TGNIIFLUX) THEN tgniiflux = tgniiflux[0] ELSE tgniiflux = self.tgniiflux
  

  ;;;read in catalog, find data in it
  data = mrdfits(catalog, 1, hdr)                    ;read in data
  chk = tag_exist(data, tghaflux, INDEX=indhaflux) ;find tag index
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
PRO xmm113::add_agn_d12, CATALOG=catalog, OUTFILE=outfile, $
                         TGCH1FLUX=tgch1flux, TGCH2FLUX=tgch2flux, $
                         TGCH3FLUX=tgch3flux, TGCH4FLUX=tgch4flux

  
  ;;;set default values
  IF keyword_set(CATALOG) THEN catalog = catalog[0] ELSE catalog = self.catalog
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = self.outfile

  ;;;read in catalog, find data in it
  data = mrdfits(catalog, 1, hdr)                   ;read in data
  chk = tag_exist(data, self.tgch1flux, INDEX=indch1flux) ;find tag index
  chk = tag_exist(data, self.tgch2flux, INDEX=indch2flux) ;find tag index
  chk = tag_exist(data, self.tgch3flux, INDEX=indch3flux) ;find tag index
  chk = tag_exist(data, self.tgch4flux, INDEX=indch4flux) ;find tag index


  out = donley_2012(1, FLUXCH1=data.(indch1flux), FLUXCH2=data.(indch2flux), $
                    FLUXCH3=data.(indch3flux), FLUXCH4=data.(indch4flux))

  ;;;add the tag
  add_tag, data, 'AN_AGND12', 0, newstruc ;add the tag
  data = newstruc                         ;recapture new structure
  data[out].AN_AGND12 = 1                 ;set flag in structure
  
  mwrfits, data, outfile, /CREATE

  
END
;====================================================================================================


;====================================================================================================
PRO xmm113::add_clmem, WHICH=which, $
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
        dedica, speczs, NITERS=45, FACTOR0=2.5, ANALYZE=analysis, /PLOTIT ;get stuff
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
PRO xmm113::finalcat

  
  
  catalog = 'xmm113_pz_specz_full_v3-3-0_all.fits'
  outfile = 'xmm113_pz_specz_full_v3-3-1_all.fits'
  self.add_agn_k06, CATALOG=catalog, OUTFILE=outfile

  catalog = outfile
  outfile = 'xmm113_pz_specz_full_v3-3-2_all.fits'
  self.add_agn_d12, CATALOG=catalog, OUTFILE=outfile

  catalog = outfile
  outfile = 'xmm113_pz_specz_full_v3-3-3_all.fits'
  self.add_clmem, WHICH='simple', MAIN='A', CATALOG=catalog, OUTFILE=outfile, SECONDARY=1

  catalog = outfile
  outfile = 'xmm113_pz_specz_full_v3-3-4_all.fits'
  self.add_clmem, WHICH='adaptivekernel', MAIN='A', CATALOG=catalog, OUTFILE=outfile, SECONDARY=1

  catalog = outfile
  outfile = 'xmm113_pz_specz_full_v3-3-5_all.fits'
  self.add_clmem, WHICH='shiftinggapper', CATALOG=catalog, OUTFILE=outfile
  

END
;====================================================================================================



;====================================================================================================
PRO xmm113::cleanup

  ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION xmm113::init, CATALOG=catalog, OUTFILE=outfile, $
                       Z=z, ZLOW=zlow, ZHIGH=zhigh

  ;self.data = ptr_new(data)
  self.objver = 'v1-4-1'
  self.propname = 'SpARCS 022427+032354'
  self.rah = 2
  self.ram = 24
  self.ras = 27.0
  self.decd = -3
  self.decm = 23
  self.decs = 54.0
  self.rasex = '02:24:27.0'
  self.decsex = '-03:23:54.0'
  self.radegcl = 36.11465 
  self.decdegcl = -3.395832
  self.radegbcg = 36.11465 
  self.decdegbcg = -3.395832

  IF keyword_set(Z) THEN self.z = z[0] ELSE self.z = 1.633
  IF keyword_set(ZLOW) THEN self.zlow = zlow[0] ELSE self.zlow = 1.60
  IF keyword_set(ZHIGH) THEN self.zhigh = zhigh[0] ELSE self.zhigh = 1.65
  IF keyword_set(ZSEC) THEN self.zsec = zsec[0] ELSE self.zsec = 1.570
  IF keyword_set(ZSECLOW) THEN self.zseclow = zseclow[0] ELSE self.zseclow = 1.565
  IF keyword_set(ZSECHIGH) THEN self.zsechigh = zsechigh[0] ELSE self.zsechigh = 1.575

  IF keyword_set(CATALOG) THEN self.catalog = catalog[0] ELSE self.catalog = 'xmm113_pz_specz_full_v3-2-3_all.fits'
  IF keyword_set(OUTFILE) THEN self.outfile = outfile[0] ELSE self.outfile = 'xmm113_pz_specz_full_v3-2-4_all.fits'

  IF keyword_set(MCITERS) THEN self.mciters = mciters[0] ELSE self.mciters = 250
  IF keyword_set(TGHAFLUX) THEN self.tghaflux = string(tghaflux[0]) ELSE self.tghaflux = 'SP_M_HA_FLUX'
  IF keyword_set(TGNIIFLUX) THEN self.tgniiflux = string(tgniiflux[0]) ELSE self.tgniiflux = 'SP_M_NIIR_FLUX'
  IF keyword_set(TGRA) THEN self.tgra = string(tgra[0]) ELSE self.tgra = 'SP_RABEST'
  IF keyword_set(TGDEC) THEN self.tgdec = string(tgdec[0]) ELSE self.tgdec = 'SP_DECBEST'
  IF keyword_set(TGSPECZ) THEN self.tgspecz = string(tgspecz[0]) ELSE self.tgspecz = 'SP_SPECZBEST'
  IF keyword_set(TGCLMEM) THEN self.tgclmem = string(tgclmem[0]) ELSE self.tgclmem = 'AN_CLMEM'
  IF keyword_set(TGDEDICA) THEN self.tgdedica = string(tgdedica[0]) ELSE self.tgdedica = 'AN_DEDICA'

  IF keyword_set(TGCH1FLUX) THEN self.tgch1flux = string(tgch1flux[0]) ELSE self.tgch1flux = 'ph_irac1flux'
  IF keyword_set(TGCH2FLUX) THEN self.tgch2flux = string(tgch2flux[0]) ELSE self.tgch2flux = 'ph_irac2flux'
  IF keyword_set(TGCH3FLUX) THEN self.tgch3flux = string(tgch3flux[0]) ELSE self.tgch3flux = 'ph_irac3flux'
  IF keyword_set(TGCH4FLUX) THEN self.tgch4flux = string(tgch4flux[0]) ELSE self.tgch4flux = 'ph_irac4flux'



  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO xmm113__define

  void = {xmm113, objver:'A', PROPNAME:'A', $
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

