;+
; NAME:
;       SPECSTACKSET()
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
;       A. DeGroot, 2015 Jun 03, Univ. Cali, Riverside v1.0.0
;          -INCEPTION
;
; DESIRED UPGRADES
;
;     
;
;-

;====================================================================================================
PRO specstackset::getprop, OBJVER=objver, PRESET=preset

  IF arg_present(OBJVER) THEN objver = self.objver       ;return the data
  IF arg_present(PRESET) THEN preset = self.preset       ;return the data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION specstackset::readfile, xfile, INDIR=indir, FILEUNIT=fileunit


  IF keyword_set(INDIR) THEN indir = indir[0] ELSE indir = ' ' ;set default
  IF keyword_set(FILEUNIT) THEN fileunit = fileunit[0] ELSE fileunit = 1 ;set default
  
  myspectra = mrdfits(strcompress(indir + xfile, /REMOVE_ALL), fileunit, hdr) ;read in file
  
  
  RETURN, myspectra 
END
;====================================================================================================



;====================================================================================================
FUNCTION specstackset::getpresets, xpreset


  CASE xpreset OF               ;which stack settings to use

     'smcurrent' : xpreset = {perturb:0, continuum:2, wavegrid:3, commongrid:2, $ ;cont next line
                              normalize:2, convolve:99, $                         ;cont next line
                              rejection:1, combination:4}                         ;present

     'kulas13' : BEGIN          ;do as Kulas did
     END                        ;end as Kulas did

     'sanders15' : BEGIN        ;do as Sanders did
     END                        ;end as Sanders did

     ELSE : BEGIN                                                           ;if no matches for data file ;
        print, 'WARNING!! Preset choice not found. Please provide another.' ;print info ;
        print, '  Avaible choices are: current'                             ;print info ;
        stop                                                                ;stop run ;
     END                                                                    ;end no match for data file ;

  ENDCASE                       ;end which data file to use ;
  
  
  RETURN, xpreset
END
;====================================================================================================


;====================================================================================================
FUNCTION specstackset::makestack, xmyspecs, xpre, ENV=env, SUBSET=subset, TEMPNAME=tempname, $
                                  SPECVER=specver, NEWSPECVER=newspecver, OUTDIR=outdir

  COMPILE_OPT idl2

  IF keyword_set(SUBSETS) THEN subsets = subsets ELSE subsets = ['A']                                       ;set default value
  IF keyword_set(TEMPNAME) THEN tempname = tempname[0] ELSE tempname = 'compos_spectstk_1d_bin***_???.fits' ;set default value
  IF keyword_set(BASENAME) THEN basename = basename[0] ELSE basename = 'compos_spectstk'                    ;set default value
  IF keyword_set(SPECVER) THEN specver = specver[0] ELSE specver = 'v0-0-0'                                 ;set default value
  IF keyword_set(NEWSPECVER) THEN newspecver = newspecver[0] ELSE newspecver = 'v0-0-1'                     ;set default value
  IF keyword_set(OUTDIR) THEN outdir = string(outdir[0]) ELSE outdir = ' '                                  ;set default value

  ;;;deal with name
  strreplace, tempname, '???', specver ;fill in version
  


  chk = where(strcompress(xmyspecs.key, /REMOVE_ALL) EQ strcompress(subset)) ;find spectra to stack

  ;;;
  IF keyword_set(ENV) THEN BEGIN
     env = strlowcase(string(env[0]))               ;set default value
     otherchk = tag_exist(xmyspecs, env, INDEX=ind) ;find tag
     meanenv = mean(xmyspecs[chk].(ind))            ;get values
     envi = round(meanenv)                          ;find value
                                ;CASE envi OF                                      ;ENV is set to?
                                ;   'field' : envi = 0                             ;
                                ;   'cluster' : envi = 1                           ;
                                ;   'group' : envi = 2                             ;
                                ;   ELSE : BEGIN                                   ;ENV set to something we dont know
                                ;      print, 'WARNING!! ENV keyword not understood.' ;print info
                                ;   ENDELSE                                           ;end set to something we dont know
                                ;ENDCASE                                              ;end ENV set to?
  ENDIF ELSE envi = 0 ;defaults to field
  
  newout = tempname                         ;copy temporary name
  strreplace, newout, '***', subset         ;fill in subset
  newout = strcompress(newout, /REMOVE_ALL) ;remove any whitespace

  IF chk[0] NE -1 THEN BEGIN                                                                                           ;if subset exists
     data = xmyspecs[chk]                                                                                              ;get subset if possible
     mystack = obj_new('specstack', TWAVEGRID=xpre.wavegrid, TCOMMONGRID=xpre.commongrid, TNORMALIZE=xpre.normalize, $ ;cont next line
                       TCONVOLVE=xpre.convolve, TREJECTION=xpre.rejection, TCOMBINATION=xpre.combination, $            ;cont next line
                       TPERTURB=xpre.perturb, TCONTINUUM=xpre.continuum, $                                             ;cont next line
                       MASSES=data.ph_lmass, OUTFILE=newout)                                                           ;create the object
     
     mystack.getprop, SSOBJVER=mystackver                                                      ;get version of code
     print, 'Using spectra_stack object: ', mystackver                                         ;print info
     mystack.findfiles, data.file, XDIR=data.directory                                         ;find files
     myfiles = mystack.readfiles(data.file, XDIR=data.directory)                               ;read those files
     myfiles = mystack.perturb(myfiles)                                                        ;perturb the spectra
     myfiles = mystack.continuum(myfiles)                                                      ;handle spectra continuum
     myfiles = mystack.normalize(myfiles)                                                          ;normalize the spectra
                                ;stop
     mygrid = mystack.wavegrid(TWAVEGRID=wavegrid, MINLAMB=5400, MAXLAMB=7100, DELTALAMB=0.62) ;create wavelength grid
     myout = mystack.prepout(mygrid)                                                           ;get output sample to fill
     myout = mystack.commongrid(mygrid, myfiles, myout, /LSQUADRATIC)                          ;everything on common wavelength grid
     myout = mystack.convolve(myout)                                                           ;convolve to common velocity dispersion
     myout = mystack.rejection(myout)                                                          ;reject points
     mystacked = mystack.combination(myout)                                                    ;combine into a stack
     mystack.massanalysis                                                                      ;analyze the masses in this stack
     mystack.display, mystacked, myout                                                         ;plot the stacked, indiv spectra
     myhdr = mystack.header(myout, CLMEMS=envi)                                                ;create the stack header
     mystack.save, mystacked, myhdr, OUTDIR=outdir                                             ;write the file
     status = mystack.measure(basename, 'bin'+subset, INDIR=outdir, OUTDIR=outdir, $           ;cont next line
                              SPECVER=specver, NEWSPECVER=newspecver)                          ;meaure the spectra
  ENDIF                                                                                        ;end if subset exists



  RETURN, 1
END
;====================================================================================================



;====================================================================================================
PRO specstackset::cleanup

  self.specstack::cleanup
                                ;ptr_free, self.data

  RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION specstackset::init, PRESET=preset

  
  self.objver = 'v1-0-0'                                                                         ;code version
  status = self.specstack::init()                                                                ;initialize parent
  IF keyword_set(PRESET) THEN self.preset = strlowcase(preset[0]) ELSE self.preset = 'smcurrent' ;object opt
  

  RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO specstackset__define

  void = {specstackset, inherits specstack, objver:'A', preset:'A' }

  RETURN
END
;====================================================================================================

