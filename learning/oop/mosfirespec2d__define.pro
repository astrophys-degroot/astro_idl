;;;===========================================================================================================
function mosfirespec2d::init


  ;;;Allocate memory to pointer when initalizing the object

  self.ptr = ptr_new(/ALLOCATE)

  RETURN, 1
END
;;;===========================================================================================================




;;;===========================================================================================================
pro mosfirespec2d::set, value
  
  ;;;If value exists, insert into pointer location

  IF n_elements(value) NE 0 THEN *(self.ptr) = value

  RETURN
END
;;;===========================================================================================================



;;;===========================================================================================================
function mosfirespec2d::get, value

  ;;;If data is stored in pointer, then copy it out

  IF n_elements(*(self.ptr)) NE 0 THEN value = *(self.ptr)

  RETURN, value
END
;;;===========================================================================================================



;;;===========================================================================================================
pro mosfirespec2d::read, file

  ;;;Read in data
  IF n_elements(file) NE 1 THEN RETURN ;check for appropriate arguments
  chk = file_test(file)                ;check for file
  IF chk NE 1 THEN RETURN              ;check file exists
  image = fltarr(512, 512)             ;array for file
  openr, lun, file, /GET_LUN           ;open file unit
  readf, lun, image                    ;read in file
  free_lun, lun                        ;free file unit
  self -> set, image                   ;set image in object
  
  RETURN
END
;;;===========================================================================================================



;;;===========================================================================================================
pro mosfirespec2d::plot

  ;;;Plot the data
  
  val = self -> get() ;extract data
  size = size(val)    ;get size
  IF size[0] EQ 2 THEN tvscl, congrid(val, 512, 512) ;display data

  RETURN
END
;;;===========================================================================================================



;;;===========================================================================================================
function mosfirespec2d::cleanup

  ;;;Free memory allocated to pointer when destroying object

  ptr_free, self.ptr


  RETURN, 1
END
;;;===========================================================================================================



;;;===========================================================================================================
pro mosfirespec2d__define

  void = {mosfirespec2d, ptr:ptr_new()}


  RETURN
END
;;;===========================================================================================================
