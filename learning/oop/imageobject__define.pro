;====================================================================================================
PRO imageobject::display

  ;win = window(DIMENSIONS=[500,500], LOCATION=[200,200])
  ;im1 = image(*self.data)
  tv, *self.data, TRUE=self.true

RETURN
END
;====================================================================================================


;====================================================================================================
PRO imageobject::setsource, source

  self.source = source

RETURN
END
;====================================================================================================


;====================================================================================================
PRO imageobject::setproperty, SOURCE=source, NAME=name, DATE=date

  IF n_elements(SOURCE) NE 0 THEN self.setsource, source
  IF n_elements(NAME) NE 0 THEN self.name = name
  IF n_elements(DATE) NE 0 THEN self.date = date

RETURN
END
;====================================================================================================



;====================================================================================================
PRO imageobject::getproperty, DATA=data, SOURCE=source, NAME=name, DATE=date

  IF arg_present(DATA) THEN data = *self.data      ;return the data
  IF arg_present(SOURCE) THEN source = self.source ;return the source
  IF arg_present(NAME) THEN name = self.name       ;return the name
  IF arg_present(DATE) THEN date = self.date       ;return the date
  
  
  RETURN
END
;====================================================================================================



;====================================================================================================
PRO imageobject::cleanup

  ptr_free, self.data

RETURN
END
;====================================================================================================


;====================================================================================================
FUNCTION imageobject::init, imagedata

  self.data = ptr_new(imagedata)
  IF size(image, /DIMEN) EQ 3 THEN self.true = 1 ELSE self.true = 0

RETURN, 1
END
;====================================================================================================


;====================================================================================================
PRO imageobject__define

  void = {imageobject, data:ptr_new(), name:'yessirree', TRUE:0L, source:'', date:1001.9D, HELP:'Y'}

RETURN
END
;====================================================================================================
