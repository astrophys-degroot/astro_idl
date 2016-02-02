;========================================================================================================================
pro j1634_make_magmacat, HELP=help


  ;;***********************************************;;
  verbose = 2                   ;how much do you want to know
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  datain = '/Users/adegroot/research/clusters/en2/J1634/catalogs/remco/SpARCS-1634_v3-0_cat_zout.fits'
  starsin = '/Users/adegroot/research/clusters/en2/J1634/catalogs/public/J1634_2mass_JHK_v1-2.fits'
  magmaout = 'j1634_feedtomagma_formask1_v1-3.txt'
  
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
  
  ;;;relevant data
  cra = 248.64751 
  cdec = 40.36433
 

  ;;;cut to be made
  distance = [10.0,20.0,30.0,400.0]        ;distance divisions [arcmin]
  zphot = [0.87,0.97,1.07,1.27,1.37,1.47] ;distance divisions [arcmin]
  specz = [0.0, 1.15, 1.20, 3.0]
  qspecz = [0, 1, 2, 3]

  
  subsets = [ $
            {name:'cl', priority:1000, sets:[6,6]}, $
            {name:'pzhi', priority:300, sets:[10,10]}, $
            {name:'pzmedl', priority:200, sets:[9,9]}, $
            {name:'pzmedh', priority:200, sets:[11,11]}, $
            {name:'pzlowl', priority:100, sets:[8,8]}, $
            {name:'pzlowh', priority:100, sets:[12,12]}, $
            {name:'rest', priority:1, sets:[4,4]} $
            ]
  

  ;;;call the routine
  mosfire_magmacat_specz_photoz, data, stars, DATAHDR=datahdr, STARHDR=starhdr, SUBSETS=subsets, $
                                 DIST=distance, $
                                 TAGRA='RA_2', TAGDEC='DEC_2', $
                                 TAGSPECZ='SPECZ', SPECZ=specz, $
                                 TAGZPHOT='Z_M2', ZPHOT=zphot, $
                                 CRA=cra, CDEC=cdec, /REGXY, $
                                 OUTFILE=magmaout
  
  
END
;========================================================================================================================



;========================================================================================================================
PRO j1634_remake

  master = 'j1634_feedtomagma_formask1_v1.0.txt'
  regfile = 'j1634_multipass_v2-2_ds9.reg'
  regdir = '../regions/'

  outfile = 'j1634_feedtomagma_formask1_v1.1.txt'
  
  mosfire_magmacat_remake, master, regfile, REGDIR=regdir, OUTFILE=outfile

END
;========================================================================================================================



;========================================================================================================================
pro j1634_remakecomp, VERBOSE=verbose, HELP=help


  ;;add ability to take a new region file and remake catalog with altered coordinates 

  mascat = 'j1634_feedtomagma_formask1_v1-3.txt' 
  directory = './'
  mosfire_magmacat_remakecomp, mascat, DIRECTORY=directory


END
;========================================================================================================================


;========================================================================================================================
pro j1634_nextmask, VERBOSE=verbose, HELP=help

  
  IF keyword_set(VERBOSE) THEN verbose = verbose[0] ELSE verbose = 2 ;sets new value

  ;;***********************************************;;
  
  mascat = 'j1634_feedtomagma_formask1_v1-3.txt'                         ;master input list
  compcat = 'j1634_feedtomagma_formask1_v1-3.fits'                       ;companion list
  recmask = '../J1634_mask1/J1634_mask1.coords'                          ;just made mask
  outfile = 'j1634_feedtomagma_formask2_v1-3.txt'                        ;next input file
  outcompnext = 'j1634_feedtomagma_formask2_v1-3.fits'                   ;companion to next input file
  outcompthis = 'j1634_feedtomagma_inmask1_v1-3.fits'                    ;mask you just created
  
  ;;***********************************************;;

  mosfire_magmacat_nextmask, mascat, recmask, compcat, outfile, outcompnext, outcompthis, /RETARG

END
;========================================================================================================================


pro crap
  name = 'SpARCS-1616_v2.2_cat_zout_FAKE.fits'
  nameout = 'SpARCS-1616_v2.3_cat_zout_FAKE.fits'
  im = mrdfits(name, 1, hdr)
  im[*].zmagerr = 0.1  
  im[*].ch1magerr = 0.1
  im[*].ch2magerr = 0.1
  chk = where(im.z_spec GT 1.14 AND im.z_spec LT 1.17, nchk, COMPLEMENT=nochk, NCOMPLEMENT=nnochk)
  print, nnochk
  im[nochk].zmag = 20.0                                                          
  im[nochk].ch1mag = 17.0                                                      
  im[nochk].ch2mag = 17.5                                                      
  chk = where((im.z_peak GT 1.0 AND im.z_peak LT 1.10) OR (im.z_peak GT 1.2 AND im.z_peak LT 1.3), nchk)
  print, nchk
  im[chk].zmag = 23.0                                                          
  im[chk].ch1mag = 21.15                                                      
  im[chk].ch2mag = 21.1                                                      
  chk = where(im.z_peak GT 1.10 AND im.z_peak LT 1.2, nchk)
  print, nchk
  im[chk].zmag = 23.0                                                          
  im[chk].ch1mag = 20.05                                                      
  im[chk].ch2mag = 20.0                                                      
  chk = where(im.z_spec GT 1.14 AND im.z_spec LT 1.17 AND im.flag NE 1, nchk)
  print, nchk
  im[chk].zmag = 20.0                                                           
  im[chk].ch1mag = 17.0                                                       
  im[chk].ch2mag = 16.95                                                      
  chk = where(im.z_spec GT 1.14 AND im.z_spec LT 1.17 AND im.flag EQ 1, nchk)
  print, nchk
  im[chk].zmag = 20.0
  im[chk].ch1mag = 17.0
  im[chk].ch2mag = 16.5
  mwrfits, im, nameout, hdr, /CREATE




end
