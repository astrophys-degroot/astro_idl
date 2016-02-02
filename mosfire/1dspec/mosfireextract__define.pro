;====================================================================================================
PRO mosfireextract::prep


  ;;;make things conform
  drivemask = self.mask                                        ;copy mask name
  drivemask = strjoin(strsplit(drivemask, '-', /EXTRACT), '_') ;make name conform

  ;;;create list of 2D spectra
  IF self.verbose GE 1 THEN print, '  Mask name: ', drivemask ;print info
  fulldir = strcompress(self.directory + '/' + self.mask + '/' + self.date + '/' + self.band + '/', /REMOVE_ALL) ;create path to files
  print, fulldir
  

RETURN
END
;====================================================================================================




;====================================================================================================
PRO mosfireextract::cleanup

  a=1

RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION mosfireextract::init, mask, directory, date, band

  self.mask = mask
  self.directory = directory
  self.date = date
  self.band = band
  
RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO mosfireextract__define

  void = {mosfireextract, mask:'', directory:'', date:'', band:'', verbose:0}

RETURN
END
;====================================================================================================
