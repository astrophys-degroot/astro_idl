;========================================================================================================================
PRO j0224_matchtoseechange

  master = mrdfits('SPARCSJ0224_v123456_F140W_sci1.fits', 1)
  data1 = mrdfits('SPARCSJ0224_HSTv6_xmm113v3-1-5_v0-2.fits', 1)
  data1tags = tag_names(data1)
  mymatch = obj_new('master_radec', master.col1, master.col2, data1, RA1=data1.raone, DEC1=data1.decone)
  mymatch.getprop, OBJVER=myver
  mymatch.boxscore
  cont = mymatch.sanitycheck()
  IF cont EQ 1 THEN BEGIN                                   ;if all sanity checks pass
     mymatch.startstruc                                     ;start the structure
     mymatch.addtags, data1tags, data1[0], EXCEPT=['ID']    ;add tags from matching catalog
     indmatch = mymatch.matches(MAXSEAR=5.0)                ;create matched pairs
     mymatch.adjust, 'SIMPLEMEAN'                           ;
     ;indmatch = mymatch.matches(MAXSEAR=2.5)                ;create matched pairs
     ;mymatch.write, /EXTRA                                  ;write out file
  ENDIF

END
;========================================================================================================================


;========================================================================================================================
pro j0224_make_magmacat, HELP=help


  ;;***********************************************;;
  verbose = 2                   ;how much do you want to know
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  datain = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/seechange/SPARCSJ0224_HSTv6_xmm113v3-1-5_v1-0.fits'
  starsin = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/stars/xmm113_SeeChange_v1-2.fits'
  magmaout = 'j0224_feedtomagma_formask1_v1-5.txt'
  
  epoch = 2000.0                ;no need to change
  equinox = 2000.0              ;no need to change
  thing1 = 0                    ;no need to change
  thing2 = 0                    ;no need to change
  jnom = 21.0                   ;if no jmag available

  starbri = 11.0                ;min mag for star list
  starfai = 18.0                ;max mag for star list

  sbsred = 0.1                  ;ch1-ch2 must be great than
  sbsblue = -0.1                ;;ch1-ch2 must be great than but less than sbsred

  sbsbri = 19.0                 ;ch2mag must be less than
  sbsmed = 21.0                 ;ch2 mag must be less than but greater than sbsbright
  sbsfai = 23.5                 ;ch2 mag must be less than but greater than sbsmedium
  

  pst = -1                      ;star fiducial probability
  pcl = 00                      ;prob(cluster members)
  pbsbsr = 10000                ;prob(bsbsr)
  pmsbsr = 1                    ;prob(msbsr)
  pfsbsr = 1                    ;prob(fsbsr)
  pbsbsb = 1000                 ;prob(bsbsb)
  pmsbsb = 100                  ;prob(msbsb)
  pfsbsb = 40                   ;prob(fsbsb)
  psbsbc = 1                    ;prob(sbsbc)
  prest = 5                     ;prob(everything else)
  
  
  ;;***********************************************;;
  

  ;;;read in the files
  data = mrdfits(datain, 1, datahdr, /SILENT)   ;read in data file
  IF keyword_set(HELP) THEN help, data, /STRUC  ;offer struc help
  stars = mrdfits(starsin, 1, starhdr, /SILENT) ;read in guide star file
  IF keyword_set(HELP) THEN help, stars, /STRUC ;offer struc help
  
  
  add_tag, data, 'RA', 0.0, newstruc ;add to structure
  data = 0
  data = newstruc
  add_tag, data, 'DEC', 0.0, newstruc ;add to structure
  data = 0
  data = newstruc
  FOR xx=0, n_elements(data.(0))-1, 1 DO BEGIN
     IF (data[xx].col1 NE -99.) THEN data[xx].ra = data[xx].col1 ELSE data[xx].ra = data[xx].raone
     IF (data[xx].col2 NE -99.) THEN data[xx].dec = data[xx].col2 ELSE data[xx].dec = data[xx].decone
  ENDFOR
  
  ;;;relevant data
  cra = 36.11465 
  cdec = -3.395832
 
 
  ;;;cut to be made
  distance = [8.0,16.0,399.0,400.0]         ;distance divisions [arcmin]
  specz = [0.0, 1.622, 1.644, 3.0]          ;spectroscopic redshift bins
  qspecz = [0, 1, 2, 3]                     ;spectroscopic redshift quality bins
  zphot = [1.0, 1.222, 1.422, 1.844, 2.044] ;distance divisions [arcmin]
  qzphot = [0.0, 0.25, 0.50, 0.75, 1.0]     ;distance divisions [arcmin]
  lsfr = [-2.0,0.0,1.0,10.0]                ;star formation rate
  kflux = [0.0,6.3,3981.0]                  ;Ks band flux
  

  subsets = [ $
            {name:'cluq', priority:20, sets:[1,6,8,1,1]}, $ ;cluster members of various quality
            {name:'clhq', priority:21, sets:[1,6,9,1,1]}, $
            {name:'clmq', priority:22, sets:[1,6,10,1,1]}, $
            {name:'cllq', priority:200, sets:[1,6,11,1,1]}, $
            
            {name:'fgluq', priority:10, sets:[1,5,8,1,1]}, $ ;lower redshift field members of various quality
            {name:'fglhq', priority:13, sets:[1,5,9,1,1]}, $
            {name:'fglmq', priority:16, sets:[1,5,10,1,1]}, $
            {name:'fgllq', priority:120, sets:[1,5,11,1,1]}, $
            
            {name:'fguuq', priority:11, sets:[1,7,8,1,1]}, $ ;lower redshift field members of various quality
            {name:'fguhq', priority:14, sets:[1,7,9,1,1]}, $
            {name:'fgumq', priority:17, sets:[1,7,10,1,1]}, $
            {name:'fgulq', priority:130, sets:[1,7,11,1,1]}, $
            
            {name:'pzhiuqls', priority:30000, sets:[1,14,19,20,24]}, $ ;photo-z of various quality and photo-z SFR
            {name:'pzhiuqms', priority:3000, sets:[1,14,19,21,24]}, $  ;
            {name:'pzhiuqhs', priority:300, sets:[1,14,19,22,24]}, $   ;

            {name:'pzhihqls', priority:29000, sets:[1,14,18,20,24]}, $ ;photo-z of various quality and photo-z SFR
            {name:'pzhihqms', priority:2900, sets:[1,14,18,21,24]}, $
            {name:'pzhihqhs', priority:290, sets:[1,14,18,22,24]}, $

            {name:'pzhimqls', priority:14000, sets:[1,14,17,20,24]}, $ ;photo-z of various quality and photo-z SFR
            {name:'pzhimqms', priority:1400, sets:[1,14,17,21,24]}, $ 
            {name:'pzhimqhs', priority:140, sets:[1,14,17,22,24]}, $ 

            {name:'pzhilq', priority:110, sets:[1,14,16,24,1]}, $ 

            {name:'pzmedhuq', priority:100, sets:[1,15,19,24,1]}, $ ;photo-z of various quality
            {name:'pzmedhhq', priority:95, sets:[1,15,18,24,1]}, $ 
            {name:'pzmedhmq', priority:90, sets:[1,15,17,24,1]}, $ 
            {name:'pzmedhlq', priority:85, sets:[1,15,16,24,1]}, $ 
            
            {name:'pzmedluq', priority:60, sets:[1,13,19,24,1]}, $ ;photo-z of various quality
            {name:'pzmedlhq', priority:55, sets:[1,13,18,24,1]}, $ 
            {name:'pzmedlmq', priority:50, sets:[1,13,17,24,1]}, $ 
            {name:'pzmedllq', priority:45, sets:[1,13,16,24,1]}, $ 
            
            {name:'pzlowl', priority:30, sets:[1,12,12,24,1]}, $

            {name:'rest', priority:1, sets:[1,4,4,1,1]} $
            ]
  

  ;;;call the routine
  mosfire_magmacat_specz_photoz, data, stars, DATAHDR=datahdr, STARHDR=starhdr, SUBSETS=subsets, $
                                 DIST=distance, $
                                 TAGRA='RA', TAGDEC='DEC', $
                                 TAGSPECZ='SP_SPECZBEST', SPECZ=specz, $
                                 TAGQSPECZ='SP_SPECZFLAG', QSPECZ=qspecz, $
                                 TAGZPHOT='PH_Z_M2', ZPHOT=zphot, $
                                 TAGQZPHOT='PH_PZINT', QZPHOT=qzphot, $
                                 TAGNINE='PH_LSFR', NINE=lsfr, $
                                 TAGTEN='PH_KFLUX_TOT', TEN=kflux, $
                                 TAGSTRA='RA', TAGSTDEC='DEC', TAGSTJ='Jmag', $
                                 CRA=cra, CDEC=cdec, /REGXY, $
                                 OUTFILE=magmaout
  
  
END
;========================================================================================================================



;========================================================================================================================
PRO j0224_remake

  master = 'j0224_feedtomagma_formask1_v1.0.txt'
  regfile = 'j0224_multipass_v2-2_ds9.reg'
  regdir = '../regions/'

  outfile = 'j0224_feedtomagma_formask1_v1.1.txt'
  
  mosfire_magmacat_remake, master, regfile, REGDIR=regdir, OUTFILE=outfile

END
;========================================================================================================================



;========================================================================================================================
pro j0224_remakecomp, VERBOSE=verbose, HELP=help


  ;;add ability to take a new region file and remake catalog with altered coordinates 

  mascat = 'j0224_feedtomagma_formask1_v1-3.txt' 
  directory = './'
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro j0224_nextmask, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'j0224_feedtomagma_formask1_v1-3.txt'                         ;master input list
  compcat = 'j0224_feedtomagma_formask1_v1-3.fits'                       ;companion list
  recmask = '../J0224_mask1/J0224_mask1.coords'                          ;just made mask
  outfile = 'j0224_feedtomagma_formask2_v1-3.txt'                        ;next input file
  outcompnext = 'j0224_feedtomagma_formask2_v1-3.fits'                   ;companion to next input file
  outcompthis = 'j0224_feedtomagma_inmask1_v1-3.fits'                    ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis, /RETARG

END
;========================================================================================================================
