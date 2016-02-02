;;;===========================================================================================================
pro workingwithoop


  ;;;learning with imageobject

  im = bytscl(dist(500,500)) ;create an array
  objim = obj_new('imageobject', im)
  help, objim

  objim.display

  objim.getproperty, DATE=dated, SOURCE=sourced, NAME=named
  print, chk
  print, dated
  print, sourced
  print, named
  
  ;objim.setproperty, NAME='yessum'
  ;named = objim.getproperty(/NAME)
  ;print, named



  obj_destroy, objim
  help, objim
 


  ;file='bbso_halph_fl_20040310_173531.fts' ;fine name
  ;f = obj_new('mosfirespec1d')                      ;create object
  ;help, f

  ;f -> read, file
  ;f -> plot
  ;image = f -> get(file)
  ;help, image, file
  
END
;;;===========================================================================================================
