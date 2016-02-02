;========================================================================================================================
PRO MOSFIRE_HANDLE_DRIVER


;+
; NAME:
;        MOSFIRE_HANDLE_DRIVER, 
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
;
;
; DESIRED UPGRADES
;     
;
;-
  version = '1-0-0'
  

  dir_with_rawdata = '/Users/adegroot/research/rawdata'
  dir_for_output = '/Users/adegroot/research/dataredux/mymosfiredrp/'
  dates = ['2012nov25', '2013nov29', '2014aug16', '2014aug17', '2014jun13', '2014jun14', $
           '2014may14', '2014nov16', '2014nov17', '2015feb23', '2015apr27', '2015oct19', $
           '2015nov17', '2015dec16']
  individual_version = 'v2-2'
  global_version = 'v2-2'

  myhandle = obj_new('mosfirehandle', dates, DIRRAWDATA=dir_with_rawdata, DIROUTPUT=dir_for_output)
  myhandle.getprop, MHAOBJVER=myver, DIRRAWDATA=myraw, DIROUTPUT=myout
  print, myver
  print, myraw
  print, myout
  chk = myhandle.go()
  obj_destroy, myhandle

END
;========================================================================================================================

