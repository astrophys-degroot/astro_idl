;+
; NAME:
;       cdfs44()
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
;       A. DeGroot, 2015 May 20, Univ. Cali, Riverside v1-8-1
;          -added possiblily of secondary redshift peak
;       A. DeGroot, 2015 May 20, Univ. Cali, Riverside v1-7-1
;          -elimated ambiguity in BCG keyword [deg]
;       A. DeGroot, 2015 May 20, Univ. Cali, Riverside v1-7-0
;          -BCG info in [deg]
;       A. DeGroot, 2015 May 20, Univ. Cali, Riverside v1-0-0
;          -inception
;
; DESIRED UPGRADES
;     
;
;-

;====================================================================================================
PRO cdfs44::getprop, OBJVER=objver, PROPNAME=propname, $
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
PRO cdfs44::analyze1d, xmask, xobj, MCITERS=mciters, NOMCWRITE=nomcwrite ;, CATALOG=catalog, OUTFILE=outfile

  COMPILE_OPT IDL2              ;force new defaults
  check_dir, 1                  ;compile module

  IF keyword_set(MCITERS) THEN mciters = fix(mciters[0]) ELSE mciters = self.mciters ;set default
       
  CASE xmask OF
     
     1 : BEGIN                                                                                                          ;choice of first mask
        indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/'                              ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/'                             ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                                   ;batchmode
           xobj = ['bcsbs109', 'bcsbs113', 'bcsbs37', 'bcsbs69', 'bcsbs78', 'bsbs2', 'bsbs66', 'cl12' , 'cl1', 'cl3', $ ;
                   'cl4', 'cl5', 'cl6', 'cl7', 'cl8', 'cl9','msbs3', 'nby6', 'pzbsbs25', 'pzbsbs30', $                  ;
                   'pzbsbs31', 'pzfsbs115', 'pzfsbs134', 'pzfsbs64', 'pzfsbs87', 'pzmsbs22', 'pzmsbs23', 'pzmsbs28', $  ;
                   'pzmsbs31', 'pzmsbs34', 'pzmsbs38', 'pzmsbs43', 'pzmsbs44','pzmsbs46', 'pzmsbs56', $                 ;
                   'pzmsbs60', 'pzmsbs70', 'pzmsbs72', 'pzmsbs76', 'scistb3']                                           ;set to all possibles
     END                                                                                                                ;end first mask

     2 : BEGIN                                                                                                          ;choice of first mask
        indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/'                              ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/'                             ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                                   ;batchmode
           xobj = ['bcsbs103', 'bcsbs117', 'bcsbs154', 'bcsbs162', 'bsbs76', 'cl10', 'cl2', 'msbs10', $                 ;
                   'msbs198', 'msbs5', 'msbs7', 'pzbsbs40', 'pzbsbs42', 'pzfsbs130', 'pzfsbs155', $                     ;
                   'pzfsbs166', 'pzfsbs175', 'pzfsbs76', 'pzmsbs100', 'pzmsbs32', 'pzmsbs41', 'pzmsbs51', 'pzmsbs57', $ ;
                   'pzmsbs67', 'pzmsbs74', 'pzmsbs78', 'pzmsbs85', 'pzmsbs89', 'pzmsbs93', 'pzmsbs98', 'scistb9']       ;set to all possibles
     END                                                                                                                ;end second mask

     3 : BEGIN                                                                                                        ;choice of first mask
        indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/'                            ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/'                           ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                                 ;batchmode
           xobj = ['bcsbs12', 'bcsbs28', 'bcsbs51','bsbs1', 'bsbs62', 'cl11', 'msbs140', $                            ;
                   'msbs144', 'msbs165', 'msbs2', 'nby8', 'pzbsbs0', 'pzbsbs10', 'pzbsbs13', 'pzbsbs14', 'pzbsbs4', $ ;
                   'pzbsbs6', 'pzbsbs7', 'pzbsbs8', 'pzfsbs37', 'pzfsbs51', 'pzfsbs57', 'pzfsbs95', 'pzmsbs13', $     ;
                   'pzmsbs19', 'pzmsbs25', 'pzmsbs26', 'pzmsbs27', 'pzmsbs33', 'pzmsbs4', 'pzmsbs6', 'scista0']       ;set to all possibles
     END                                                                                                              ;end third mask
     
     4 : BEGIN                                                                                                   ;choice of first mask
        indir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/'                       ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/'                      ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                            ;batchmode
           xobj = [ 'bcsbs107', 'bcsbs112', 'bcsbs131', 'bcsbs23', 'bcsbs48', 'bcsbs53', 'bcsbs58', 'bcsbs67', $ ;
                    'bcsbs72', 'bcsbs74', 'bcsbs76', 'bsbs0', 'cl0', 'msbs147', 'msbs149', $                     ;
                    'msbs214', 'msbs4', 'nby7', 'pzbsbs3', 'pzfsbs105', 'pzfsbs114', 'pzfsbs120', 'pzfsbs133', $ ;
                    'pzfsbs136', 'pzfsbs142', 'pzfsbs157', 'pzfsbs170','pzfsbs33','pzfsbs65', $                  ;
                    'pzfsbs77', 'pzfsbs85', 'pzmsbs11', 'pzmsbs61', 'pzmsbs77', 'scista6', 'scistb3']            ;set to all possibles
     END                                                                                                         ;end fourth mask

     5 : BEGIN                                                                                                 ;choice of fifth mask
        indir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask5_v2/2014nov16/H/'                      ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask5_v2/2014nov16/H/'                     ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                          ;batchmode
           xobj = ['pzhi29', 'pzhi31', 'pzhi36', 'pzhi39', 'pzhi52', 'pzhi59', 'pzhi60', 'pzhi62', 'pzhi64', $ ;
                   'pzhi67', 'pzhi71', 'pzhi72', 'pzhi76', 'pzhi77', 'pzhi79', 'pzhi80', 'pzhi88', 'pzhi91', $ ;
                   'pzhi95', 'pzhi97', 'pzlow1816', 'pzmed1052', 'pzmed1085', 'pzmed1095', 'pzmed1102', $      ;
                   'pzmed1139', 'pzmed1193', 'pzmed1229', 'pzmed303', 'pzmed370', 'pzmed446', 'pzmed478', $    ;
                   'pzmed552', 'pzmed577', 'pzmed602', 'pzmed607', 'pzmed909', 'pzmed946', 'spzg98', 'st31']   ;set to all possibles
     END                                                                                                       ;end fifth mask

     6 : BEGIN                                                                                                     ;choice of sixth mask
        indir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask6_v2/2014nov16/H/'                          ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask6_v2/2014nov16/H/'                         ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                              ;batchmode
           xobj = ['pzhi53', 'pzhi56', 'pzhi57', 'pzhi65', 'pzhi66', 'pzhi68','pzhi69', 'pzhi70', 'pzhi73', $      ;
                   'pzhi75',  'pzhi81', 'pzhi82', 'pzhi87',  'pzhi90', 'pzhi96', 'pzlow1800' , $                   ;
                   'pzmed1125', 'pzmed1138',  'pzmed1240', 'pzmed1270', 'pzmed578', 'pzmed598', 'pzmed610', $      ;
                   'pzmed613' ,  'pzmed628' , 'pzmed692',  'pzmed720' ,  'pzmed781' ,   'pzmed829', 'pzmed911' , $ ;
                   'pzmed937', 'spzg117' ,  'spzg43', 'spzg71' ,  'spzo55' ,  'st21']                              ;set to all possibles
     END                                                                                                           ;end sixth mask

     7 : BEGIN                                                                                                 ;choice of seventh mask
        indir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask7_v2/2014nov17/H/'                      ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask7_v2/2014nov17/H/'                     ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                          ;batchmode
           xobj = ['pzhi17', 'pzhi19', 'pzhi24', 'pzhi38', 'pzhi40', 'pzhi42', 'pzhi48', 'pzhi50', 'pzhi54', $ ;
                   'pzhi93', 'pzlow1674', 'pzlow1869', 'pzlow2736', 'pzmed1170', 'pzmed1181', 'pzmed1195', $   ;
                   'pzmed1223', 'pzmed1227', 'pzmed200', 'pzmed211', 'pzmed258', 'pzmed283', 'pzmed306', $     ;
                   'pzmed341', 'pzmed384', 'pzmed444', 'pzmed464', 'pzmed580', 'pzmed640', 'pzmed649', $       ;
                   'pzmed776', 'pzmed797', 'pzmed799', 'pzmed825', 'pzmed836', 'pzmed871', 'spzg29', $         ;
                   'spzg76', 'st20']                                                                           ;set to all possibles
     END                                                                                                       ;end seventh mask ;

     8 : BEGIN                                                                                                 ;choice of eighth mask
        indir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask8_v2/2014nov17/H/'                      ;directory with spectra
        outdir = '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask8_v2/2014nov17/H/'                     ;directory to output spectra
        IF strlowcase(strcompress(xobj, /REMOVE_ALL)) EQ 'all' THEN $                                          ;batchmode
           xobj = ['pzhi26', 'pzhi33', 'pzhi34', 'pzhi37', 'pzhi44', 'pzhi47', 'pzhi51', 'pzhi55', $           ;
                   'pzhi61', 'pzmed1273', 'pzmed300', 'pzmed395', 'pzmed417', 'pzmed483', 'pzmed515', $        ;
                   'pzmed517', 'pzmed547', 'pzmed557', 'pzmed616', 'pzmed620','pzmed622', 'pzmed626', $        ;
                   'pzmed651', 'pzmed671', 'pzmed687', 'pzmed698', 'pzmed699', 'pzmed706', 'pzmed727', $       ;
                   'pzmed733', 'pzmed761', 'pzmed819', 'pzmed876', 'pzmed933', 'pzmed935', 'pzmed955', 'st18'] ;
     END                                                                                                       ;end eighth mask ;

     ELSE : BEGIN                                              ;begin no match found
        print, 'Warning!! Mask choice not found!'              ;print info
        print, '  Current choices are: 1, 2, 3, 4, 5, 6, 7, 8' ;print info
     END                                                       ;end no match found

  ENDCASE                       ;end which mask
  
  
  FOR xx=0, n_elements(xobj)-1, 1 DO BEGIN                    ;loop over spectra
     print, strcompress( ' Now working on file: ' + xobj[xx]) ;print info
     CASE xmask OF
        1 : anset = cdfs44_mask1_h_analyze_settings(xobj[xx])     ;get analysis settings
        2 : anset = cdfs44_mask2_h_analyze_settings(xobj[xx])     ;get analysis settings
        3 : anset = cdfs44_mask3_h_analyze_settings(xobj[xx])     ;get analysis settings
        4 : anset = cdfs44_mask4_h_analyze_settings(xobj[xx])     ;get analysis settings
        5 : anset = cdfs44_mask5_h_analyze_settings(xobj[xx])     ;get analysis settings
        6 : anset = cdfs44_mask6_h_analyze_settings(xobj[xx])     ;get analysis settings
        7 : anset = cdfs44_mask7_h_analyze_settings(xobj[xx])     ;get analysis settings
        8 : anset = cdfs44_mask8_h_analyze_settings(xobj[xx])     ;get analysis settings
        ELSE : BEGIN                                              ;begin no match found
           print, 'Warning!! Mask choice not found!'              ;print info
           print, '  Current choices are: 1, 2, 3, 4, 5, 6, 7, 8' ;print info
        END                                                       ;end no match found
     ENDCASE                                                      ;end which mask


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
PRO cdfs44::collate, which, DOOBJ=doobj, SPECVER=specver, NEWSPECVER=newspecver

  
  IF keyword_set(SPECVER) THEN specver = string(specver[0]) ELSE specver = 'v1-2'
  IF keyword_set(NEWSPECVER) THEN newspecver = string(newspecver[0]) ELSE newspecver = 'v6-3'

  CASE which OF
     1 : cstuf = {maskname:'CDFS44_mask1_1.0_H', $
                  mask:'CDFS44_mask1_1.0_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/CDFS44_mask1_1.0/', $
                  chkradecdeg:'CDFS_44_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/', $
                  outfile:strcompress('cdfs44_mask1_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/', $
                  radecdeg:1}

     2 : cstuf = {maskname:'CDFS44_mask2_1.0_H', $
                  mask:'CDFS44_mask2_1.0_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/CDFS44_mask2_1.0/', $
                  chkradecdeg:'CDFS_44_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/', $
                  outfile:strcompress('cdfs44_mask2_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/', $
                  radecdeg:1}
 
     3 : cstuf = {maskname:'CDFS44_mask3_1.0_H', $
                  mask:'CDFS44_mask3_1.0_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/CDFS44_mask3_1.0/', $
                  chkradecdeg:'CDFS_44_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/', $
                  outfile:strcompress('cdfs44_mask3_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/', $
                  radecdeg:1}

     4 : cstuf = {maskname:'CDFS44_mask4_1.0_H', $
                  mask:'CDFS44_mask4_1.0_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/CDFS44_mask4_1.0/', $
                  chkradecdeg:'CDFS_44_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/', $
                  outfile:strcompress('cdfs44_mask4_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/', $
                  radecdeg:1}

     5 : cstuf = {maskname:'cdfs44_mask5_v2_H', $
                  mask:'cdfs44_mask5_v2_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/cdfs44_mask5_v2/', $
                  chkradecdeg:'CDFS_44_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/', $
                  outfile:strcompress('cdfs44_mask5_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/cdfs44_mask5_v2/2014nov16/H/', $
                  radecdeg:1}

     6 : cstuf = {maskname:'cdfs44_mask6_v2_H', $
                  mask:'cdfs44_mask6_v2_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/cdfs44_mask6_v2/', $
                  chkradecdeg:'CDFS_44_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/', $
                  outfile:strcompress('cdfs44_mask6_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/cdfs44_mask6_v2/2014nov16/H/', $
                  radecdeg:1}
 
     7 : cstuf = {maskname:'cdfs44_mask7_v2_H', $
                  mask:'cdfs44_mask7_v2_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/cdfs44_mask7_v2/', $
                  chkradecdeg:'CDFS_44_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/', $
                  outfile:strcompress('cdfs44_mask7_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/cdfs44_mask7_v2/2014nov16/H/', $
                  radecdeg:1}

     8 : cstuf = {maskname:'cdfs44_mask8_v2_H', $
                  mask:'cdfs44_mask8_v2_orig.coords', $
                  maskdir:'/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/cdfs44_mask8_v2/', $
                  chkradecdeg:'CDFS_44_Ks_v4_ima.fits', $
                  dirchkradecdeg:'/Users/adegroot/research/clusters/cdfs/cdfs44/images_safe/', $
                  outfile:strcompress('cdfs44_mask8_1dspeccat_'+ newspecver +'.fits', /REMOVE_ALL), $
                  outdir:'/Users/adegroot/research/dataredux/mosfire/cdfs44_mask8_v2/2014nov16/H/', $
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
PRO cdfs44::mergeMOSFIRE, OUTFILE=outfile, OUTDIR=outdir, $
                          APPLYOFF=applyoff, APPLYBASE=applybase, WHICHAPPLY=whichapply


  files = ['/Users/adegroot/research/dataredux/mosfire/CDFS44_mask1_1.0/2012nov25/H/cdfs44_mask1_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask2_1.0/2012nov25/H/cdfs44_mask2_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask3_1.0/2012nov25/H/cdfs44_mask3_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/CDFS44_mask4_1.0/2012nov25/H/cdfs44_mask4_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask5_v2/2014nov16/H/cdfs44_mask5_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask6_v2/2014nov16/H/cdfs44_mask6_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask7_v2/2014nov17/H/cdfs44_mask7_1dspeccat_v6-3.fits', $
           '/Users/adegroot/research/dataredux/mosfire/cdfs44_mask8_v2/2014nov17/H/cdfs44_mask8_1dspeccat_v6-3.fits']
  
  IF keyword_set(OUTFILE) THEN outfile = string(outfile[0]) ELSE outfile = 'cdfs44_mosfire_specz_v6-5.fits'
  IF keyword_set(OUTDIR) THEN outdir = string(outdir[0]) ELSE outdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/spectroscopic/'


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
     data = mrdfits(files[xx], 1, hdr, /SILENT)
     nmask = n_elements(data.(0))
     FOR yy=0, nmask-1, 1 DO BEGIN
        out[nrun] = data[yy]
        nrun++
     ENDFOR
  ENDFOR
  

  ;;;if we want to check WCS offsets
  IF keyword_set(APPLYOFF) THEN BEGIN                                                                ;
     IF keyword_set(APPLYBASE) THEN applybase = int(applybase[0]) ELSE applybase = 7                 ;set default
     IF keyword_set(WHICHAPPLY) THEN whichapply = string(whichapply[0]) ELSE whichapply = 'rotation' ;set default
     print, '    Finding and apply offset to WCS solution...'                                        ;
     
     ;;;reorder the list to put the base at first
     ;;;;known issues here if the applybase value is not the last
     ;;;;element of the list
     files = [files[applybase], files[0:applybase-1]] ;
     
     ;;;loop over the catalogs
     FOR ii=0, n_elements(files)-1, 1 DO BEGIN            ;
        curfull = files[ii]                               ;
        split_curfull = strsplit(curfull, '/', EXTRACT=1) ;
        curfile = split_curfull[-1]                       ;

        ;;;the lookup case for MAGMA input
        magmadir = '/Users/adegroot/research/clusters/cdfs/cdfs44/spectroscopy/masks/'                      ;
        CASE curfile OF                                                                                     ; 
           'cdfs44_mask1_1dspeccat_v6-3.fits' : magmafile = 'CDFS44_mask1_1.0/CDFS44_mask1_1.0_orig.coords' ;
           'cdfs44_mask2_1dspeccat_v6-3.fits' : magmafile = 'CDFS44_mask2_1.0/CDFS44_mask2_1.0_orig.coords' ;
           'cdfs44_mask3_1dspeccat_v6-3.fits' : magmafile = 'CDFS44_mask3_1.0/CDFS44_mask3_1.0_orig.coords' ;
           'cdfs44_mask4_1dspeccat_v6-3.fits' : magmafile = 'CDFS44_mask4_1.0/CDFS44_mask4_1.0_orig.coords' ;
           'cdfs44_mask5_1dspeccat_v6-3.fits' : magmafile = 'cdfs44_mask5_v2/cdfs44_mask5_v2_orig.coords'   ;
           'cdfs44_mask6_1dspeccat_v6-3.fits' : magmafile = 'cdfs44_mask6_v2/cdfs44_mask6_v2_orig.coords'   ;
           'cdfs44_mask7_1dspeccat_v6-3.fits' : magmafile = 'cdfs44_mask7_v2/cdfs44_mask7_v2_orig.coords'   ;
           'cdfs44_mask8_1dspeccat_v6-3.fits' : magmafile = 'cdfs44_mask8_v2/cdfs44_mask8_v2_orig.coords'   ;
           ELSE : BEGIN                                                                                     ;
              print, 'Mask not found to look up MAGMA input catalog!!'                                      ;
              print, '  Can not proceed with WCS comparison and offset!!'                                   ;
           ENDELSE                                                                                          ;
        ENDCASE                                                                                             ;
        IF ii EQ 0 THEN magmamaster = magmadir + magmafile                                                  ;
        
        ;;;read in magma files, convert sexigesimal to degrees
        IF ii EQ 0 THEN readcol, magmamaster, mmid, mmpriority, mmmag, mmrah, mmram, mmras, mmdech, mmdecm, mmdecs, $               ;
                                 mmeqoch, mmequi, mmthing1, mmthing2, FORMAT=('A,F,F,I,I,F,I,I,F,F,F,F,F')                          ;
        IF ii NE 0 THEN BEGIN                                                                                                       ;
           readcol, magmadir + magmafile, mnewid, mnewpriority, mnewmag, mnewrah, mnewram, mnewras, mnewdech, mnewdecm, mnewdecs, $ ;
                    mneweqoch, mnewequi, mnewthing1, mnewthing2, FORMAT=('A,F,F,I,I,F,I,I,F,F,F,F,F')                               ;
           mmra = 15.0*(double(mmrah) + mmram/60.0 + mmras/3600.0)                                                                  ;
           mmdec = tenv(mmdech, mmdecm, mmdecs)                                                                                     ;
           mnewra = 15.0*(double(mnewrah) + mnewram/60.0 + mnewras/3600.0)                                                          ;
           mnewdec = tenv(mnewdech, mnewdecm, mnewdecs)                                                                             ;

           ;;;double checking code
           ;print, magmamaster
           ;print, magmafile
           ;openw, lun, 'wtfwcs1.txt', /get_lun
           ;FOR ii=0, n_elements(mmra)-1, 1 DO BEGIN
           ;   printf, lun, mmra[ii], mmdec[ii]
           ;ENDFOR
           ;free_lun, lun
           ;openw, lun, 'wtfwcs2.txt', /get_lun
           ;FOR ii=0, n_elements(mnewra)-1, 1 DO BEGIN
           ;   printf, lun, mnewra[ii], mnewdec[ii]
           ;ENDFOR
           ;free_lun, lun
           ;stop


           ;;;define a set of "matches" to correct
           matches = []
           radii = []
           radius = 0.2
           dradius = 0.4
           maxradii = 10.0
           cnt = 0
           perfectmatch = 'false'
           WHILE radius LT maxradii and cnt LT 100 DO BEGIN
              close_match, mnewra, mnewdec, mmra, mmdec, match1, match2, float(radius)/3600.0, 1, miss1, SILENT=1
              radii = [radii, radius]
              matches = [matches, n_elements(match1)]              
              radius = radius + dradius
              IF n_elements(match1) EQ n_elements(mmra) THEN BEGIN
                 cnt = 100
                 perfectmatch = 'true'
              ENDIF
              cnt = cnt + 1
           ENDWHILE

           IF perfectmatch NE 'true' THEN BEGIN
              
              ;;;basically an ROC to find best matching radius
              radii = radii / maxradii
              matches = matches/float(n_elements(mnewra))
              closest = ((radii)^2+(1.0-matches)^2)^0.5
              minclosest = min(closest, minind)
              print, '  Optimal matching radius [arcsec]', radii[minind]*maxradii
              myplot = plot(radii, matches, 'bo', $
                            TITLE = curfile)
              myplot = plot(radii, closest, 'r+', /CURRENT, /OVERPLOT)

           ;;;redo the match with the best radii
              close_match, mnewra, mnewdec, mmra, mmdec, match1, match2, float(radii[minind]*maxradii)/3600.0, 1, miss1, SILENT=1
              submnewra = mnewra[match1]
              submnewdec = mnewdec[match1]
              submmra = mmra[match2]
              submmdec = mmdec[match2]
              
              diffras = (submnewra-submmra)
              meddiffra = median(diffras)
              diffdecs = (submnewdec-submmdec)
              ;print, diffdecs
              meddiffdec = median(diffdecs)

              IF (meddiffra GT 0.00001) OR (meddiffdec GT 0.00001) THEN BEGIN
                 print, meddiffra
                 print, meddiffdec
                 print, meddiffra*3600.0
                 print, meddiffdec*3600.0


                 mywin = window(LOCATION=[100,100], DIMENSIONS=[800,400])         ;window
                 pdfra = histogram(diffras*3600.0, LOCATIONS=rabins, BINSIZE=0.1) ;bin it up
                 myplot1 = plot(rabins, pdfra, COLOR='black', /STAIRSTEP, $       ;plot dec hist
                                XTITLE='RA Offset [arcsec]', $                    ;plot options
                                YTITLE='Frequency', $                             ;plot options
                                /CURRENT, LAYOUT=[1,2,1])                         ;plot options
                 pdfdec = histogram(diffdecs*3600.0, LOCATIONS=decbins, BINSIZE=0.1) ;bin it up
                 myplot1 = plot(decbins, pdfdec, COLOR='black', /STAIRSTEP, $        ;plot dec hist
                                XTITLE='DEC Offset [arcsec]', $                      ;plot options
                                YTITLE='Frequency', $                                ;plot options
                                /CURRENT, LAYOUT=[1,2,2])                            ;plot options



                                ;submmra = submmra[0:5]
                                ;print, submmra
                                ;submmdec = submmdec[0:5]
                                ;print, submmdec
                                ;submnewra = submnewra[0:5]
                                ;print, submnewra
                                ;submnewdec = submnewdec[0:5]
                                ;print, submnewdec

                 fullnew = [[submnewra],[submnewdec]]
                 fullmm = [[submmra],[submmdec]]
                 SVDC, fullnew, W, U, V
                 help, W
                                ;print, W
                 wdiag = diag_matrix(W)
                 help, wdiag
                                ;print, wdiag
                 winvert = invert(wdiag)
                 help, winvert
                                ;print, winvert
                 help, U
                                ;print, U
                 help, V
                                ;print, V

                                ;print, '************'
                                ;print, fullnew
                                ;print, '************'
                                ;print, U ## wdiag ## transpose(V)
                 this = V ## winvert ## transpose(U)
                                ;print, this

                                ;print, ''
                                ;print, fullmm ## this
                                ;stop
                                ;print, ''
                                ;print, this ## fullmm
                 
              ENDIF ELSE BEGIN
                 print, 'THERE IS NO DIFFERENCE'
              ENDELSE
              

              ;stop       

           ENDIF ELSE BEGIN
              print, 'SAME DAMN CATALOG'
              ;;just copy columns

           ENDELSE



        ENDIF
     ENDFOR                     ;
  ENDIF                         ;

  stop

  help, transpose(U)
                                ;print, matrix_multiply(fullmm, transpose(U))
  help, matrix_multiply(transpose(fullmm), U)
  stop
  print, matrix_multiply(transpose(fullmm), U)
  stop

  if ii eq 2 THEN BEGIN
     openw, lun, 'text2.txt', /get_lun
     FOR ii=0, n_elements(mnewra)-1, 1 DO BEGIN
              printf, lun, mnewra[ii], mnewdec[ii]
           ENDFOR
           free_lun, lun
        ENDIF
        ;;;find the offset to determine
        CASE whichapply OF
           'simple' : BEGIN
              print, 'still working on this'
           END
           'rotation' : BEGIN
              print, 'now here'
              
           END
        ENDCASE

  ;;;by keyword choose which method to determine an offset by
  ;;;;;simple ra dec shift
  ;;;;;ra, dec shift plus rotation
  ;;;;;copy current ra dec values to new columns
  ;;;;;apply offset and store as current columns

  ;;;write the file
  mwrfits, out, outfile, /CREATE


END
;====================================================================================================


;====================================================================================================
PRO cdfs44::mergespecz, OUTFILE=outfile, OUTDIR=outdir


  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'cdfs44_mosfire_specz_v6-4.fits'
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/spectroscopic/'
  IF keyword_set(PRE1) THEN pre1 = pre1[0] ELSE pre1 = 'm_'
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = 'CDFS44_all_v1-1.fits'
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/spectroscopic/'
  IF keyword_set(PRE2) THEN pre2 = pre2[0] ELSE pre2 = 'g_'
  IF keyword_set(FILE3) THEN file3 = file3[0] ELSE file3 = 'cdfs44_p91_redshifts_jan2015.fits'
  IF keyword_set(INDIR3) THEN indir3 = indir3[0] ELSE indir3 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/julie/'
  IF keyword_set(PRE3) THEN pre3 = pre3[0] ELSE pre3 = 'j_'
  IF keyword_set(FILE4) THEN file4 = file4[0] ELSE file4 = 'cdfs44_PRIMUS_8arcmin_v1.fits'
  IF keyword_set(INDIR4) THEN indir4 = indir4[0] ELSE indir4 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/public/'
  IF keyword_set(PRE4) THEN pre4 = pre4[0] ELSE pre4 = 'p_'
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'cdfs44_composite_specz_v6-4.fits'
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/spectroscopic/'
  
  polish_speczcat, FILE1=file1, FILE2=file2, FILE3=file3, FILE4=file4, $
                          PRE1=pre1, PRE2=pre2, PRE3=pre3, PRE4=pre4, $
                          INDIR1=indir1, INDIR2=indir2, INDIR3=indir3, INDIR4=indir4, $
                          OUTFILE=outfile, OUTDIR=outdir
  

END
;====================================================================================================


;====================================================================================================
PRO cdfs44::mergespecphoto, USEOLD=useold, OUTFILE=outfile, OUTDIR=outdir


  
  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'cdfs44_composite_specz_v6-4.fits'
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/spectroscopic/'
  IF keyword_set(PRE1) THEN pre1 = pre1[0] ELSE pre1 = 'SP_'
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = 'cdfs44_catalog_v6.1-2.fits'
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/julie/cdfs44_catalog_v6/'
  IF keyword_set(PRE2) THEN pre2 = pre2[0] ELSE pre2 = 'PH_'
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'CDFS44_pz_specz_full_v3-10-0.fits'
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/'


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
PRO cdfs44::seechangewcs, OUTFILE=outfile, OUTDIR=outdir


  
  ;;;default values
  IF keyword_set(FILE1) THEN file1 = file1[0] ELSE file1 = 'SPARCSJ0330_v12345_F140W_sci1.fits'
  IF keyword_set(INDIR1) THEN indir1 = indir1[0] ELSE indir1 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/seechange/'
  IF keyword_set(FILE2) THEN file2 = file2[0] ELSE file2 = 'CDFS44_pz_specz_full_v3-9-4_all.fits'
  IF keyword_set(INDIR2) THEN indir2 = indir2[0] ELSE indir2 = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/'
  IF keyword_set(OUTFILE) THEN outfile = outfile[0] ELSE outfile = 'SPARCSJ0330_HSTv5_cdfs44v3-9-0_v1-0.fits'
  IF keyword_set(OUTDIR) THEN outdir = outdir[0] ELSE outdir = '/Users/adegroot/research/clusters/cdfs/cdfs44/catalogs/seechange/'


  master = mrdfits(strcompress(indir1 + file1, /REMOVE_ALL), 1, hdr, /SILENT)              ;which is the master catalog
  mtags = tag_names(master)                                                                ;get tag names from structure
  data1 = mrdfits(strcompress(indir2 + file2, /REMOVE_ALL), 1, hdr, /SILENT)               ;which is the matching catalog
  data1tags = tag_names(data1)                                                             ;tag names of matching catalog
  mymatch = obj_new('master_radec', master.col1, master.col2, FULLM=master, FULL1=data1, $ ;cont next line
                    RA1=data1.xmra, DEC1=data1.xmdec)                                      ;call the master match object
  mymatch.boxscore                                                                         ;get some basic info
  cont = mymatch.sanitycheck()                                                             ;perform basic sanity checks
  IF cont EQ 1 THEN BEGIN                                                                  ;if all sanity checks pass
     mymatch.startstruc                                                                    ;start the structure
     mymatch.addtags, data1tags, data1[0], EXCEPT=['ID'], /MATCH                           ;add tags from matching catalog
     mymatch.addtags, mtags, master[0], EXCEPT=['RA', 'DEC'], /MASTER                      ;add tags from matching catalog
     mymatch.copyout                                                                       ;copy data that came with master 
     indmatch = mymatch.matches(MAXSEAR=2.0, /NOMID)                                       ;create matched pairs
     mymatch.adjust, 'SIMPLEMEAN', /SHOWPLOT, $                                            ;cont next line
        TGRAONE=strcompress('XMRA', /REMOVE_ALL), $                                        ;cont next line
        TGDECONE=strcompress('XMDEC', /REMOVE_ALL)                                         ;find offset and adjust
     indmatch = mymatch.matches(MAXSEAR=2.0)                                               ;create matched pairs
     mymatch.write, FILENAME=strcompress(outdir + outfile, /REMOVE_ALL), $                 ;cont next line
                             /EXTRA, /FAILED, /ALL                                         ;write out file
  ENDIF                                                                                    ;end all sanity checks pass
  
END
;====================================================================================================


;====================================================================================================
PRO cdfs44::add_agn_k06, CATALOG=catalog, OUTFILE=outfile, $
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
PRO cdfs44::add_agn_d12, CATALOG=catalog, OUTFILE=outfile, $
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
PRO cdfs44::add_clmem, WHICH=which, $
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
PRO cdfs44::finalcat


  catalog = 'CDFS44_pz_specz_full_v3-10-0_all.fits'
  outfile = 'CDFS44_pz_specz_full_v3-10-1_all.fits'
  self.add_agn_k06, CATALOG=catalog, OUTFILE=outfile

  catalog = outfile
  outfile = 'CDFS44_pz_specz_full_v3-10-2_all.fits'
  self.add_agn_d12, CATALOG=catalog, OUTFILE=outfile

  catalog = outfile
  outfile = 'CDFS44_pz_specz_full_v3-10-3_all.fits'
  self.add_clmem, WHICH='adaptivekernel', MAIN='B', SECONDARY=1, CATALOG=catalog, OUTFILE=outfile
  
  catalog = outfile
  outfile = 'CDFS44_pz_specz_full_v3-10-4_all.fits'
  self.add_clmem, WHICH='shiftinggapper', CATALOG=catalog, OUTFILE=outfile

END
;====================================================================================================




;====================================================================================================
PRO cdfs44::cleanup

  ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION cdfs44::init, CATALOG=catalog, OUTFILE=outfile, $
                       Z=z, ZLOW=zlow, ZHIGH=zhigh, MCITERS=mciters

                                ;self.data = ptr_new(data)
  self.objver = 'v1-8-1'
  self.propname = 'SpARCS 033056-284300'
  self.rah = 03
  self.ram = 30
  self.ras = 55.8783
  self.decd = -28
  self.decm = 42
  self.decs = 59.8576
  self.rasex = '03:30:55.8783'
  self.decsex = '-28:42:59.8576'
  self.radegcl = 52.732825  
  self.decdegcl = -28.716627
  self.radegbcg = 52.732825  
  self.decdegbcg = -28.716627

  IF keyword_set(Z) THEN self.z = z[0] ELSE self.z = 1.626
  IF keyword_set(ZLOW) THEN self.zlow = zlow[0] ELSE self.zlow = 1.616
  IF keyword_set(ZHIGH) THEN self.zhigh = zhigh[0] ELSE self.zhigh = 1.636
  IF keyword_set(ZSEC) THEN self.zsec = zsec[0] ELSE self.zsec = 1.535
  IF keyword_set(ZSECLOW) THEN self.zseclow = zseclow[0] ELSE self.zseclow = 1.530
  IF keyword_set(ZSECHIGH) THEN self.zsechigh = zsechigh[0] ELSE self.zsechigh = 1.540

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
PRO cdfs44__define

  void = {cdfs44, objver:'A', PROPNAME:'A', $
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

