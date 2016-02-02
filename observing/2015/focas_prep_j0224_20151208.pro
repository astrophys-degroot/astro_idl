;========================================================================================================================
pro j0224_make_focas_inputcat, HELP=help


  ;;***********************************************;;
  verbose = 2                   ;how much do you want to know
  includeall = 'Y'              ;caps count
  helper = 'Y'                  ;capitals count
  
  datain = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/seechange/SPARCSJ0224_HSTv6_xmm113v3-1-5_v1-0.fits'
  starsin = '/Users/adegroot/research/clusters/xmm/xmm113/catalogs/stars/xmm113_SeeChange_v1-2.fits'
  catout = 'j0224_feedtofocas_formask1_v1-1.txt'
  
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
  distance = [7.0,12.0,399.0,400.0]         ;distance divisions [arcmin]
  specz = [0.0, 1.622, 1.644, 3.0]          ;spectroscopic redshift bins
  qspecz = [0, 1, 2, 3]                     ;spectroscopic redshift quality bins
  zphot = [0.0, 1.0, 1.422, 1.844, 2.044]   ;distance divisions [arcmin]
  qzphot = [0.0, 0.25, 0.50, 0.75, 1.0]     ;distance divisions [arcmin]
  lsfr = [-2.0,0.0,0.698,10.0]              ;star formation rate
  zflux = [1.58,6.31,3981.0,25118.9]          ;z band flux
  

  zmags = -2.5*alog10(data.ph_zflux) + 25.0
  chk = where(zmags NE zmags)
  IF (chk[0] NE -1) THEN zmags[chk] = 30.00

  subsets = [ $
            {name:'cluq', priority:20, sets:[1,6,8,1,1]}, $ ;cluster members of various quality
            {name:'clhq', priority:21, sets:[1,6,9,1,1]}, $
            {name:'clmq', priority:22, sets:[1,6,10,1,1]}, $
            {name:'cllq', priority:1200, sets:[1,6,11,1,1]}, $
            
            {name:'fgluq', priority:10, sets:[1,5,8,1,1]}, $ ;lower redshift field members of various quality
            {name:'fglhq', priority:13, sets:[1,5,9,1,1]}, $
            {name:'fglmq', priority:16, sets:[1,5,10,1,1]}, $
            {name:'fgllq', priority:1100, sets:[1,5,11,1,1]}, $
            
            {name:'fguuq', priority:11, sets:[1,7,8,1,1]}, $ ;lower redshift field members of various quality
            {name:'fguhq', priority:14, sets:[1,7,9,1,1]}, $
            {name:'fgumq', priority:17, sets:[1,7,10,1,1]}, $
            {name:'fgulq', priority:1000, sets:[1,7,11,1,1]}, $
            
            {name:'pzhiuqhs', priority:30000, sets:[1,14,19,22,24]}, $ ;photo-z in range, ultra quality, high SFR
            {name:'pzhiuqms', priority:3000, sets:[1,14,19,21,24]}, $  ;
            {name:'pzhiuqls', priority:300, sets:[1,14,19,20,24]}, $  ;

            {name:'pzhihqhs', priority:29000, sets:[1,14,18,22,24]}, $ ;photo-z of various quality and photo-z SFR
            {name:'pzhihqms', priority:2900, sets:[1,14,18,21,24]}, $
            {name:'pzhihqls', priority:290, sets:[1,14,18,20,24]}, $

            {name:'pzhimqhs', priority:21000, sets:[1,14,17,22,24]}, $ ;photo-z of various quality and photo-z SFR
            {name:'pzhimqms', priority:2100, sets:[1,14,17,21,24]}, $ 
            {name:'pzhimqls', priority:210, sets:[1,14,17,20,24]}, $ 

            {name:'pzhilqhs', priority:15000, sets:[1,14,16,22,24]}, $ ;photo-z of various quality and photo-z SFR
            {name:'pzhilqms', priority:1500, sets:[1,14,16,21,24]}, $ 
            {name:'pzhilqls', priority:150, sets:[1,14,16,20,24]}, $ 

            {name:'pzmedluqhs', priority:28000, sets:[1,13,19,22,24]}, $ ;photo-z in low end range, ultra quality, high SFR
            {name:'pzmedluqms', priority:2800, sets:[1,13,19,21,24]}, $ ;
            {name:'pzmedluqls', priority:280, sets:[1,13,19,20,24]}, $ ;
    
            {name:'pzmedlhqhs', priority:27000, sets:[1,13,18,22,24]}, $ 
            {name:'pzmedlhqms', priority:2700, sets:[1,13,18,21,24]}, $ 
            {name:'pzmedlhqls', priority:270, sets:[1,13,18,20,24]}, $ 
                        
            {name:'pzmedlmqhs', priority:14000, sets:[1,13,17,22,24]}, $ 
            {name:'pzmedlmqms', priority:1400, sets:[1,13,17,21,24]}, $ 
            {name:'pzmedlmqls', priority:140, sets:[1,13,17,20,24]}, $ 
            
            {name:'pzmedllqhs', priority:13000, sets:[1,13,16,22,24]}, $ 
            {name:'pzmedllqms', priority:1300, sets:[1,13,16,21,24]}, $ 
            {name:'pzmedllqls', priority:130, sets:[1,13,16,20,24]}, $ 
            
            {name:'pzhiuq', priority:25000, sets:[1,14,16,23,14]}, $ 
            {name:'pzhihq', priority:24000, sets:[1,14,17,23,14]}, $ 
            {name:'pzhimq', priority:2500, sets:[1,14,18,23,14]}, $ 
            {name:'pzhilq', priority:2400, sets:[1,14,19,23,14]}, $ 

            {name:'pzmedluq', priority:23000, sets:[1,13,16,23,13]}, $ 
            {name:'pzmedlhq', priority:22000, sets:[1,13,17,23,13]}, $ 
            {name:'pzmedlmq', priority:2300, sets:[1,13,18,23,13]}, $ 
            {name:'pzmedllq', priority:2200, sets:[1,13,19,23,13]}, $ 

                                ;{name:'pzmedhuq', priority:100, sets:[1,15,19,23,1]}, $ ;photo-z of various quality
                                ;{name:'pzmedhhq', priority:95, sets:[1,15,18,23,1]}, $ 
                                ;{name:'pzmedhmq', priority:90, sets:[1,15,17,23,1]}, $ 
                                ;{name:'pzmedhlq', priority:85, sets:[1,15,16,23,1]}, $ 
            
            
                                ;{name:'pzlowl', priority:30, sets:[1,12,12,23,1]}, $

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
                                 TAGTEN='PH_ZFLUX', TEN=zflux, $
                                 TAGSTRA='RA', TAGSTDEC='DEC', TAGSTJ='Jmag', JNOM=zmags, $
                                 CRA=cra, CDEC=cdec, /REGXY, $
                                 OUTFILE=catout
  
  
END
;========================================================================================================================


