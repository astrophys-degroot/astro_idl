;;;===========================================================================================================
pro mosfirespec1d::read, file

  IF n_elements(file) NE 1 THEN RETURN ;if file not right
  chk = file_test(file)                ;check if image exists
  IF chk EQ 0 THEN RETURN              ;if image exists
  image = mrdfits(file, 0, hdr)        ;read in imag
  self -> set, image                   ;set image in object
  self.filename = file                 ;set file name
  

  RETURN
END
;;;===========================================================================================================



;;;===========================================================================================================
function mosfirespec1d_define::get, filename

  filename = self.filename ;copy filename into variable
  image = self -> data::get()
  
  RETURN, image
END
;;;===========================================================================================================



;;;===========================================================================================================
pro mosfirespec1d__define


    void = {mosfirespec1d, filename:'', inherits mosfirespec2d} ;inherit msofirespec2d class

    
    RETURN
END
;;;===========================================================================================================
