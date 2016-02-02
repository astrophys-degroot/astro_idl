;+
; NAME: mosfire_add_truitime
;
; PURPOSE: Add TRUITIME header to MOSFIRE images taken June 9-15,
; 2014.
;
; CALLING SEQUENCE: mosfire_add_truitime
;
; INPUTS: none
;
; OUTPUTS: none
;
; PROCEDURE: Run within the raw data directory.  It will add the
; correct header to all m*.fits files.  TRUITIME is calculated from
; the ITIME header keyword.
;
; MODIFICATION HISTORY:
;       2014-06-24 ENK created
;       2014-06-25 jlyke modified with some error checking, fix for units
;-
pro mosfire_add_truitime, overwrite=overwrite
    f = file_search('m*.fits*', count=c)
    if ( c gt 0 ) then begin
      if ( not keyword_set(overwrite) ) then begin
        subdir = 'updatedFiles'
        cmd = 'mkdir ' + subdir
        spawn, cmd, exit_status=exit_status
        if ( exit_status ne 0 ) then begin
          print, 'Error executing: ' + cmd
          return
        endif
        for i=0,c-1 do begin
          cmd = 'cp ' + f[i] + ' ' + subdir
          spawn, cmd, exit_status=exit_status
          if ( exit_status ne 0 ) then begin
            print, 'Error executing: ' + cmd
            return
          endif
        endfor
        cd, subdir  
        f = file_search('m*.fits*', count=c) 
      endif
    endif
    for i=0,c-1 do begin
        hdr = headfits(f[i])
        truitime = sxpar(hdr, 'TRUITIME')
        if ( truitime eq 0 ) then begin
          ; truitime is not in the header so calculate and add it
          trucom = ' True integration time in seconds (per coadd)'
          ; itime is in ms, truitime is in sec
          itime = sxpar(hdr, 'ITIME')/1000.
          truitime = floor(itime/1.45479)*1.45479
          print, f[i], + ' keyword added. TRUITIME is: ' + string(truitime)
          fxhmodify, f[i], 'TRUITIME', truitime, trucom
        endif else begin
          print, f[i], + ' no change.  TRUITIME is already in header'
          print, 'TRUITIME is ', truitime, ' in ', f[i]
        endelse
    endfor
end
