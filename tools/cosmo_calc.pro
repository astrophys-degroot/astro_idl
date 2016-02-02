;========================================================================================================================
function E_z, z_prime                                                      ;begin function E_z
  common share1, omega_l, omega_m, omega_k, h_0                            ;common share variables
  return, (omega_m*(1+z_prime)^3 + omega_k*(1+z_prime)^2 + omega_l)^(-0.5) ;cosmological equation
end                                                                        ;end function E_z
;========================================================================================================================



;========================================================================================================================
function length, primary, primunits, OUTUNITS=outunits, SECONDARY=secondary, SECUNITS=secunits, $
                 OMEGAL=omegal, OMEGAM=omegam, OMEGAK=omegak, H0=ho, VERBOSE=verbose
  
  if keyword_set(SECUNITS) then secunits = secunits[0]               ;sets new value
  if keyword_set(OMEGAL) then omegal = omegal[0] else omegal = 0.73  ;sets new value
  if keyword_set(OMEGAM) then omegam = omegam[0] else omegam = 0.27  ;sets new value
  if keyword_set(OMEGAK) then omegak = omegak[0] else omegak = 0.0   ;sets new value
  if keyword_set(H0) then h0 = h0[0] else h0 = 70.0                  ;sets new value [km/s/Mpc]
  if keyword_set(VERBOSE) then verbose = verbose[0] else verbose = 2 ;check verbose keyword
  
  common share1, omega_l, omega_m, omega_k, h_0 ;shares variables with all functions
  omega_l = omegal                              ;constant
  omega_m = omegam                              ;constant
  omega_k = omegak                              ;constant
  h_0 = h0                                      ;[km/s/Mpc]

  if primunits eq 'degree' or primunits eq 'arcmin' or primunits eq 'arcsec' or $ ;cont next line
     primunits eq 'radian' then begin                                             ;check primunits
     case primunits of                                                            ;begin case of primunits
        'radian' : prim_to_rad = primary                                          ;converts radians to arcsec
        'degree' : prim_to_rad = primary * (!pi/180.0)                            ;converts degrees to arcsec
        'arcmin' : prim_to_rad = primary * (!pi/10800.0)                          ;converts to radians
        'arcsec' : prim_to_rad = primary * (!pi/648000.0)                         ;converts to arcsec
     endcase                                                                      ;end case of primunits
  endif                                                                           ;end check primunits
  
  if primunits eq 'ly' or primunits eq 'gpc' or primunits eq 'mpc' or primunits eq 'kpc' or $ ;cont next line
     primunits eq 'm' or primunits eq 'km' then begin                                         ;check primunits
     case primunits of                                                                        ;case of primunits
        'kpc' : prim_to_mpc = primary / 1000.0                                                ;converts kpc to mpc
        'mpc' : prim_to_mpc = primary                                                         ;converts mpc to mpc
        'gpc' : prim_to_mpc = primary * 1000.0                                                ;converts gpc to mpc
        'ly' : prim_to_mpc = primary / 3261566.0                                              ;converts ly to mpc
        'km' : prim_to_mpc = primary / 3.085677581E19                                         ;converts km to mpc
        'm' : prim_to_mpc = primary / 3.085677581E22                                          ;converts m to mpc
     endcase                                                                                  ;end case primunits
  endif                                                                                       ;end check primunits
  
  if secunits eq 'degree' or secunits eq 'arcmin' or secunits eq 'arcsec' or $ ;check secunits
     secunits eq 'radian' then begin                                           ;check primunits
     case secunits of                                                          ;begin case of secunits
        'radian' : sec_to_rad = secondary                                      ;converts radians to arcsec
        'degree' : sec_to_rad = secondary * (!pi/180.0)                        ;converts degrees to arcsec
        'arcmin' : sec_to_rad = secondary * (!pi/10800.0)                      ;converts to radians
        'arcsec' : sec_to_rad = secondary * (!pi/648000.0)                     ;converts to arcsec
     endcase                                                                   ;end case of secunits
  endif                                                                        ;end check secunits
  
  if secunits eq 'ly' or secunits eq 'gpc' or secunits eq 'mpc' or secunits eq 'kpc' or $ ;cont next line
     secunits eq 'm' or secunits eq 'km' then begin                                       ;check secunits
     case secunits of                                                                     ;case of secunits
        'kpc' : sec_to_mpc = secondary / 1000.0                                           ;converts kpc to mpc
        'mpc' : sec_to_mpc = secondary                                                    ;converts mpc to mpc
        'gpc' : sec_to_mpc = secondary * 1000.0                                           ;converts gpc to mpc
        'ly' : sec_to_mpc = secondary / 3261566.0                                         ;converts ly to mpc
        'km' : sec_to_mpc = secondary / 3.085677581E19                                    ;converts km to mpc
        'm' : sec_to_mpc = secondary / 3.085677581E22                                     ;converts m to mpc
     endcase                                                                              ;end case secunits
  endif                                                                                   ;end check secunits
  
  
  
  case primunits of                                                                        ;begins case of converting from
     'degree' : begin                                                                      ;if given dist is in degrees
        case outunits of                                                                   ;begins case of converting to
           'degree' : begin                                                                ;if wanted dist is in degrees
              if verbose ge 2 then print, ' What you put in is what you get out!', primary ;prints info
              to_one = primary                                                             ;sets value in output
           end                                                                             ;end wanted dist in degrees
           'arcmin' : begin                                                                ;if wanted dist in in arcmin
              if verbose ge 2 then print, ' degrees to arcmins'                            ;prints info
              to_one = primary * 60.0                                                      ;converts degrees to arcmin
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in arcmin
           'arcsec' : begin                                                                ;if wanted dist is in arcsec
              if verbose ge 2 then print, ' degrees to arcsecs '                           ;prints info
              to_one = primary * 3600.0                                                    ;converts degrees to arcsec
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in arcsec
           'radian' : begin                                                                ;if wanted dist is in radian
              if verbose ge 2 then print, ' degrees to radians '                           ;prints info
              to_one = prim_to_rad                                                         ;converts degrees to arcsec
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in radian
           else : print, 'Output value unit(s) not valid!!!'                               ;catch statement
        endcase                                                                            ;end case of converting to
     end                                                                                   ;end case of converting from
     
     'arcmin' : begin                                                                      ;if primary in arcmin
        case outunits of                                                                   ;case of unit for output
           'degree' : begin                                                                ;if wanted dist is in degrees
              if verbose ge 2 then print, ' arcmins to degrees'                            ;prints info
              to_one = primary / 60.0                                                      ;convertes to degrees
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;print info
           end                                                                             ;end wanted dist in degrees
           'arcmin' : begin                                                                ;if wanted dist in arcmin
              if verbose ge 2 then print, ' What you put in is what you get out!', primary ;prints info
              to_one = primary                                                             ;sets value in output
           end                                                                             ;end wanted dist in arcmin
           'arcsec' : begin                                                                ;if wanted dist in arcsec
              if verbose ge 2 then print, ' armins to arcsecs'                             ;prints info
              to_one = primary * 60.0                                                      ;converts to arcsec
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;print info
           end                                                                             ;end wanted dist in arcsec
           'radian' : begin                                                                ;if wanted dist is in radians
              if verbose ge 2 then print, ' armins to radians'                             ;prints info
              to_one = prim_to_rad                                                              ;converts to radians
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;print info
           end                                                                             ;end wanted dist in radians
           else : print, 'Output value unit(s) not valid!!!'                               ;catch statement
        endcase                                                                            ;end case converting to
     end                                                                                   ;end case converting from
     
     'arcsec' : begin                                                                      ;if primary in units of arcsec
        case outunits of                                                                   ;case of units for output
           'degree' : begin                                                                ;if wanted dist is in degrees
              if verbose ge 2 then print, ' arcsecs to degreess'                           ;prints info
              to_one = primary / 3600.0                                                    ;converts to degrees
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;print info
           end                                                                             ;end wanted dist in degrees
           'arcmin' : begin                                                                ;if wanted dist is in arcmin
              if verbose ge 2 then print, ' arcsecs to arcmins'                            ;prints info
              to_one = primary / 60.0                                                      ;converts to arcmin
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;print info
           end                                                                             ;end wanted dist in arcmin
           'arcsec' : begin                                                                ;if wanted dist is in arcsec
              if verbose ge 2 then print, ' What you put in is what you get out!', primary ;prints info
              to_one = primary                                                             ;converts to arcsec
           end                                                                             ;end wanted dist in arcsec
           'radian' : begin                                                                ;if wanted dist is in radians
              if verbose ge 2 then print, ' arcmins to radians'                            ;prints info
              to_one = prim_to_rad                                                              ;converts to radians
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;print info
           end                                                                             ;end wanted dist in radians
           else : print, 'Output value unit(s) not valid!!!'                               ;catch statement
        endcase                                                                            ;end case converting to 
     end                                                                                   ;end possibly converting from
     
     'radian' : begin                                                                      ;if primary units are radian
        case outunits of                                                                   ;begin case of units for output
           'degree' : begin                                                                ;if wanted dist is in degrees
              if verbose ge 2 then print, ' radians to degrees'                            ;prints info
              to_one = primary * (180.0/!pi)                                               ;converts to degrees
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;print info
           end                                                                             ;end wanted dist in degrees
           'arcmin' : begin                                                                ;if wanted dist is in arcmin
              if verbose ge 2 then print, ' radians to arcmins'                            ;prints info
              to_one = primary * (10800.0/!pi)                                             ;converts to arcmin
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;print info
           end                                                                             ;end wanted dist in arcmin
           'arcsec' : begin                                                                ;if wanted dist is in arcsec
              if verbose ge 2 then print, ' radians to arcsec'                             ;prints info
              to_one = primary * (648000.0/!pi)                                            ;converts to arcsec
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;print info
           end                                                                             ;end wanted dist in arcsec
           'radian' : begin                                                                ;if wanted dist is in radians
              if verbose ge 2 then print, ' What you put in is what you get out!', primary ;prints info
              to_one = primary                                                             ;sets value in output
           end                                                                             ;end wanted dist in radians
           else : print, 'Output value unit(s) not valid!!!'                               ;catch statement
        endcase                                                                            ;end case converting to
     end                                                                                   ;end possibility converting form
     
     'kpc' : begin                                                                             ;if given dist is in kpc
        case outunits of                                                                       ;begins case of converting to
           'kpc' : begin                                                                       ;if wanted dist is in kpc
              if verbose ge 2 then print, ' What you put in is what you get out!', primary     ;prints info
              to_one = primary                                                                 ;sets value in output
           end                                                                                 ;end wanted dist in kpc
           'mpc' : begin                                                                       ;if wanted dist in in mpc
              if verbose ge 2 then print, ' kpc to mpc'                                        ;prints info
              to_one = prim_to_mpc                                                             ;converts kpc to mpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in mpc
           'gpc' : begin                                                                       ;if wanted dist is in gpc
              if verbose ge 2 then print, ' kpc to gpc '                                       ;prints info
              to_one = primary / 1000000.0                                                     ;converts kpc to gpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in gpc
           'ly' : begin                                                                        ;if wanted dist is in ly
              if verbose ge 2 then print, ' kpc to ly '                                        ;prints info
              to_one = primary * 3261.566                                                      ;converts kpc to ly
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in ly
           'km' : begin                                                                        ;if wanted dist is in km
              if verbose ge 2 then print, ' kpc to km!!!!!!!!!!'                               ;prints info
              to_one = primary * 3.085683E16                                                   ;converts kpc to km
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in km
           'm' : begin                                                                         ;if wanted dist is in m
              if verbose ge 2 then print, ' kpc to m'                                          ;prints info
              to_one = primary * 3.085683E19                                                   ;converts kpc to m
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in m
           'degree' : begin                                                                    ;if wanted value in degree
              if keyword_set(SECONDARY) eq 0 then begin                                        ;check SECONDARY keyword is set
                 print, ' Secondary values must also be set!!'                                 ;prints info
                 stop                                                                          ;halts program
              endif else begin                                                                 ;end check SECONDARY keyword is set
                 case secunits of                                                              ;case of secunits
                    'redshift' : begin                                                         ;if secunits is redshift
                       case 1 of                                                               ;begin trival case
                          n_elements(primary) gt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # secondary entries not equal # of primary entries!!' ;prints info
                                print, ' Assuming all primary entries at same redshift!!'      ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             d_c = qromb('E_z', 0.0, secondary[0], /DOUBLE )                   ;integrate function using subarray
                             distance = (2.99E5 / h0) * d_c                                    ;calculates the proper distance
                             to_rad = prim_to_mpc / (distance/(1+secondary[0]))                ;angle in rads of phys size
                             to_one = to_rad * (180.0/!pi)                                     ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) lt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # primary entries not equal # of secondary entries!!' ;prints info
                                print, ' Assuming same physical size at all redshifts!!'       ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             to_rad = dblarr(n_elements(secondary))                            ;creates array to store
                             prim_to_mpc = replicate(prim_to_mpc, n_elements(secondary))       ;replicated primary phys dist val
                             for ii=0, n_elements(secondary)-1, 1 do begin                     ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii], /DOUBLE )               ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (180.0/!pi)                                     ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) eq n_elements(secondary) : begin                 ;test number of entries
                             to_rad = dblarr(n_elements(primary))                              ;creates array to store
                             for ii=0, n_elements(primary)-1, 1 do begin                       ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii] )                        ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (180.0/!pi)                                     ;converts rads to arcsec
                          end                                                                  ;end alt to unequal # of entries
                       endcase                                                                 ;ends trivial case
                    end                                                                        ;end secunits is redshift
                    else : begin                                                               ;for no match of secunits
                       print, ' Secondary units not valid'                                     ;prints info
                       to_one = ' under construction'                                          ;prints info
                    end                                                                        ;end else of secunits
                 endcase                                                                       ;end case of secunits
              endelse                                                                          ;end alt to SECONDARY keyword not set
           end                                                                                 ;end wanted value in degree
           'arcmin' : begin                                                                    ;if wanted value in arcmin
              if keyword_set(SECONDARY) eq 0 then begin                                        ;check SECONDARY keyword is set
                 print, ' Secondary values must also be set!!'                                 ;prints info
                 stop                                                                          ;halts program
              endif else begin                                                                 ;end check SECONDARY keyword is set
                 case secunits of                                                              ;case of secunits
                    'redshift' : begin                                                         ;if secunits is redshift
                       case 1 of                                                               ;begin trival case
                          n_elements(primary) gt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # secondary entries not equal # of primary entries!!' ;prints info
                                print, ' Assuming all primary entries at same redshift!!'      ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             d_c = qromb('E_z', 0.0, secondary[0], /DOUBLE )                   ;integrate function using subarray
                             distance = (2.99E5 / h0) * d_c                                    ;calculates the proper distance
                             to_rad = prim_to_mpc / (distance/(1+secondary[0]))                ;angle in rads of phys size
                             to_one = to_rad * (10800.0/!pi)                                   ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) lt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # primary entries not equal # of secondary entries!!' ;prints info
                                print, ' Assuming same physical size at all redshifts!!'       ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             to_rad = dblarr(n_elements(secondary))                            ;creates array to store
                             prim_to_mpc = replicate(prim_to_mpc, n_elements(secondary))       ;replicated primary phys dist val
                             for ii=0, n_elements(secondary)-1, 1 do begin                     ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii], /DOUBLE )               ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (10800.0/!pi)                                   ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) eq n_elements(secondary) : begin                 ;test number of entries
                             to_rad = dblarr(n_elements(primary))                              ;creates array to store
                             for ii=0, n_elements(primary)-1, 1 do begin                       ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii] )                        ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (10800.0/!pi)                                   ;converts rads to arcsec
                          end                                                                  ;end alt to unequal # of entries
                       endcase                                                                 ;ends trivial case
                    end                                                                        ;end secunits is redshift
                    else : begin                                                               ;for no match of secunits
                       print, ' Secondary units not valid'                                     ;prints info
                       to_one = ' under construction'                                          ;prints info
                    end                                                                        ;end else of secunits
                 endcase                                                                       ;end case of secunits
              endelse                                                                          ;end alt to SECONDARY keyword not set
           end                                                                                 ;end wanted value in arcmin
           'arcsec' : begin                                                                    ;if wanted value in arcsec
              if keyword_set(SECONDARY) eq 0 then begin                                        ;check SECONDARY keyword is set
                 print, ' Secondary values must also be set!!'                                 ;prints info
                 stop                                                                          ;halts program
              endif else begin                                                                 ;end check SECONDARY keyword is set
                 case secunits of                                                              ;case of secunits
                    'redshift' : begin                                                         ;if secunits is redshift
                       case 1 of                                                               ;begin trival case
                          n_elements(primary) gt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # secondary entries not equal # of primary entries!!' ;prints info
                                print, ' Assuming all primary entries at same redshift!!'      ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             d_c = qromb('E_z', 0.0, secondary[0], /DOUBLE )                   ;integrate function using subarray
                             distance = (2.99E5 / h0) * d_c                                    ;calculates the proper distance
                             to_rad = prim_to_mpc / (distance/(1+secondary[0]))                ;angle in rads of phys size
                             to_one = to_rad * (648000.0/!pi)                                  ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) lt n_elements(secondary) : begin                 ;test number of entries
                             if verbose ge 2 then begin                                        ;check VERBOSE keyword
                                print, ' # primary entries not equal # of secondary entries!!' ;prints info
                                print, ' Assuming same physical size at all redshifts!!'       ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             to_rad = dblarr(n_elements(secondary))                            ;creates array to store
                             prim_to_mpc = replicate(prim_to_mpc, n_elements(secondary))       ;replicated primary phys dist val
                             for ii=0, n_elements(secondary)-1, 1 do begin                     ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii], /DOUBLE )               ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (648000.0/!pi)                                  ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) eq n_elements(secondary) : begin                 ;test number of entries
                             to_rad = dblarr(n_elements(primary))                              ;creates array to store
                             for ii=0, n_elements(primary)-1, 1 do begin                       ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii] )                        ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (648000.0/!pi)                                  ;converts rads to arcsec
                          end                                                                  ;end alt to unequal # of entries
                       endcase                                                                 ;ends trivial case
                    end                                                                        ;end secunits is redshift
                    else : begin                                                               ;for no match of secunits
                       print, ' Secondary units not valid'                                     ;prints info
                       to_one = ' under construction'                                          ;prints info
                    end                                                                        ;end else of secunits
                 endcase                                                                       ;end case of secunits
              endelse                                                                          ;end alt to SECONDARY keyword not set
           end                                                                                 ;end wanted value in arcsec
           'radian' : begin                                                                    ;if wanted value in radians
              if keyword_set(SECONDARY) eq 0 then begin                                        ;check SECONDARY keyword is set
                 print, ' Secondary values must also be set!!'                                 ;prints info
                 stop                                                                          ;halts program
              endif else begin                                                                 ;end check SECONDARY keyword is set
                 case secunits of                                                              ;case of secunits
                    'redshift' : begin                                                         ;if secunits is redshift
                       case 1 of                                                               ;begin trival case
                          n_elements(primary) gt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # secondary entries not equal # of primary entries!!' ;prints info
                                print, ' Assuming all primary entries at same redshift!!'      ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             d_c = qromb('E_z', 0.0, secondary[0], /DOUBLE )                   ;integrate function using subarray
                             distance = (2.99E5 / h0) * d_c                                    ;calculates the proper distance
                             to_rad = prim_to_mpc / (distance/(1+secondary[0]))                ;angle in rads of phys size
                             to_one = to_rad                                                   ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) lt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # primary entries not equal # of secondary entries!!' ;prints info
                                print, ' Assuming same physical size at all redshifts!!'       ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             to_rad = dblarr(n_elements(secondary))                            ;creates array to store
                             prim_to_mpc = replicate(prim_to_mpc, n_elements(secondary))       ;replicated primary phys dist val
                             for ii=0, n_elements(secondary)-1, 1 do begin                     ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii], /DOUBLE )               ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad                                                   ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) eq n_elements(secondary) : begin                 ;test number of entries
                             to_rad = dblarr(n_elements(primary))                              ;creates array to store
                             for ii=0, n_elements(primary)-1, 1 do begin                       ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii] )                        ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad                                                   ;converts rads to arcsec
                          end                                                                  ;end alt to unequal # of entries
                       endcase                                                                 ;ends trivial case
                    end                                                                        ;end secunits is redshift
                    else : begin                                                               ;for no match of secunits
                       print, ' Secondary units not valid'                                     ;prints info
                       to_one = ' under construction'                                          ;prints info
                    end                                                                        ;end else of secunits
                 endcase                                                                       ;end case of secunits
              endelse                                                                          ;end alt to SECONDARY keyword not set
           end                                                                                 ;end wanted value in radians
           else : print, 'Output value unit(s) not valid!!!'                                   ;catch statement
        endcase                                                                                ;end case of converting to
     end                                                                                       ;end case of converting from
     
     'mpc' : begin                                                                             ;if given dist is in mpc
        case outunits of                                                                       ;begins case of converting to
           'kpc' : begin                                                                       ;if wanted dist is in kpc
              if verbose ge 2 then print, ' mpc to kpc '                                       ;prints info
              to_one = primary * 1000.0                                                        ;converts mpc to kpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in kpc
           'mpc' : begin                                                                       ;if wanted dist in in mpc
              if verbose ge 2 then print, ' What you put in is what you get out!', primary     ;prints info
              to_one = primary                                                                 ;sets value in output
           end                                                                                 ;end wanted dist in mpc
           'gpc' : begin                                                                       ;if wanted dist is in gpc
              if verbose ge 2 then print, ' mpc to gpc '                                       ;prints info
              to_one = primary / 1000.0                                                        ;converts mpc to gpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in gpc
           'ly' : begin                                                                        ;if wanted dist is in ly
              if verbose ge 2 then print, ' mpc to ly '                                        ;prints info
              to_one = primary * 3261566.0                                                     ;converts mpc to ly
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in ly
           'km' : begin                                                                        ;if wanted dist is in km
              if verbose ge 2 then print, ' mpc to km '                                        ;prints info
              to_one = primary * 3.085683E19                                                   ;converts mpc to km
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in km
           'm' : begin                                                                         ;if wanted dist is in m
              if verbose ge 2 then print, ' mpc to m '                                         ;prints info
              to_one = primary * 3.085683E22                                                   ;converts mpc to m
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                          ;prints info
           end                                                                                 ;end wanted dist in m
           'degree' : begin                                                                    ;if wanted value in degree
              if keyword_set(SECONDARY) eq 0 then begin                                        ;check SECONDARY keyword is set
                 print, ' Secondary values must also be set!!'                                 ;prints info
                 stop                                                                          ;halts program
              endif else begin                                                                 ;end check SECONDARY keyword is set
                 case secunits of                                                              ;case of secunits
                    'redshift' : begin                                                         ;if secunits is redshift
                       case 1 of                                                               ;begin trival case
                          n_elements(primary) gt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # secondary entries not equal # of primary entries!!' ;prints info
                                print, ' Assuming all primary entries at same redshift!!'      ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             d_c = qromb('E_z', 0.0, secondary[0], /DOUBLE )                   ;integrate function using subarray
                             distance = (2.99E5 / h0) * d_c                                    ;calculates the proper distance
                             to_rad = prim_to_mpc / (distance/(1+secondary[0]))                ;angle in rads of phys size
                             to_one = to_rad * (180.0/!pi)                                     ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) lt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # primary entries not equal # of secondary entries!!' ;prints info
                                print, ' Assuming same physical size at all redshifts!!'       ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             to_rad = dblarr(n_elements(secondary))                            ;creates array to store
                             prim_to_mpc = replicate(prim_to_mpc, n_elements(secondary))       ;replicated primary phys dist val
                             for ii=0, n_elements(secondary)-1, 1 do begin                     ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii], /DOUBLE )               ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (180.0/!pi)                                     ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) eq n_elements(secondary) : begin                 ;test number of entries
                             to_rad = dblarr(n_elements(primary))                              ;creates array to store
                             for ii=0, n_elements(primary)-1, 1 do begin                       ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii] )                        ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (180.0/!pi)                                     ;converts rads to arcsec
                          end                                                                  ;end alt to unequal # of entries
                       endcase                                                                 ;ends trivial case
                    end                                                                        ;end secunits is redshift
                    else : begin                                                               ;for no match of secunits
                       print, ' Secondary units not valid'                                     ;prints info
                       to_one = ' under construction'                                          ;prints info
                    end                                                                        ;end else of secunits
                 endcase                                                                       ;end case of secunits
              endelse                                                                          ;end alt to SECONDARY keyword not set
           end                                                                                 ;end wanted value in degree
           'arcmin' : begin                                                                    ;if wanted value in arcmin
              if keyword_set(SECONDARY) eq 0 then begin                                        ;check SECONDARY keyword is set
                 print, ' Secondary values must also be set!!'                                 ;prints info
                 stop                                                                          ;halts program
              endif else begin                                                                 ;end check SECONDARY keyword is set
                 case secunits of                                                              ;case of secunits
                    'redshift' : begin                                                         ;if secunits is redshift
                       case 1 of                                                               ;begin trival case
                          n_elements(primary) gt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # secondary entries not equal # of primary entries!!' ;prints info
                                print, ' Assuming all primary entries at same redshift!!'      ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             d_c = qromb('E_z', 0.0, secondary[0], /DOUBLE )                   ;integrate function using subarray
                             distance = (2.99E5 / h0) * d_c                                    ;calculates the proper distance
                             to_rad = prim_to_mpc / (distance/(1+secondary[0]))                ;angle in rads of phys size
                             to_one = to_rad * (10800.0/!pi)                                   ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) lt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # primary entries not equal # of secondary entries!!' ;prints info
                                print, ' Assuming same physical size at all redshifts!!'       ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             to_rad = dblarr(n_elements(secondary))                            ;creates array to store
                             prim_to_mpc = replicate(prim_to_mpc, n_elements(secondary))       ;replicated primary phys dist val
                             for ii=0, n_elements(secondary)-1, 1 do begin                     ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii], /DOUBLE )               ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (10800.0/!pi)                                   ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) eq n_elements(secondary) : begin                 ;test number of entries
                             to_rad = dblarr(n_elements(primary))                              ;creates array to store
                             for ii=0, n_elements(primary)-1, 1 do begin                       ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii] )                        ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (10800.0/!pi)                                   ;converts rads to arcsec
                          end                                                                  ;end alt to unequal # of entries
                       endcase                                                                 ;ends trivial case
                    end                                                                        ;end secunits is redshift
                    else : begin                                                               ;for no match of secunits
                       print, ' Secondary units not valid'                                     ;prints info
                       to_one = ' under construction'                                          ;prints info
                    end                                                                        ;end else of secunits
                 endcase                                                                       ;end case of secunits
              endelse                                                                          ;end alt to SECONDARY keyword not set
           end                                                                                 ;end wanted value in arcmin
           'arcsec' : begin                                                                    ;if wanted value in arcsec
              if keyword_set(SECONDARY) eq 0 then begin                                        ;check SECONDARY keyword is set
                 print, ' Secondary values must also be set!!'                                 ;prints info
                 stop                                                                          ;halts program
              endif else begin                                                                 ;end check SECONDARY keyword is set
                 case secunits of                                                              ;case of secunits
                    'redshift' : begin                                                         ;if secunits is redshift
                       case 1 of                                                               ;begin trival case
                          n_elements(primary) gt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # secondary entries not equal # of primary entries!!' ;prints info
                                print, ' Assuming all primary entries at same redshift!!'      ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             d_c = qromb('E_z', 0.0, secondary[0], /DOUBLE )                   ;integrate function using subarray
                             distance = (2.99E5 / h0) * d_c                                    ;calculates the proper distance
                             to_rad = prim_to_mpc / (distance/(1+secondary[0]))                ;angle in rads of phys size
                             to_one = to_rad * (648000.0/!pi)                                  ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) lt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # primary entries not equal # of secondary entries!!' ;prints info
                                print, ' Assuming same physical size at all redshifts!!'       ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             to_rad = dblarr(n_elements(secondary))                            ;creates array to store
                             prim_to_mpc = replicate(prim_to_mpc, n_elements(secondary))       ;replicated primary phys dist val
                             for ii=0, n_elements(secondary)-1, 1 do begin                     ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii], /DOUBLE )               ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (648000.0/!pi)                                  ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) eq n_elements(secondary) : begin                 ;test number of entries
                             to_rad = dblarr(n_elements(primary))                              ;creates array to store
                             for ii=0, n_elements(primary)-1, 1 do begin                       ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii] )                        ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad * (648000.0/!pi)                                  ;converts rads to arcsec
                          end                                                                  ;end alt to unequal # of entries
                       endcase                                                                 ;ends trivial case
                    end                                                                        ;end secunits is redshift
                    else : begin                                                               ;for no match of secunits
                       print, ' Secondary units not valid'                                     ;prints info
                       to_one = ' under construction'                                          ;prints info
                    end                                                                        ;end else of secunits
                 endcase                                                                       ;end case of secunits
              endelse                                                                          ;end alt to SECONDARY keyword not set
           end                                                                                 ;end wanted value in arcsec
           'radian' : begin                                                                    ;if wanted value in radians
              if keyword_set(SECONDARY) eq 0 then begin                                        ;check SECONDARY keyword is set
                 print, ' Secondary values must also be set!!'                                 ;prints info
                 stop                                                                          ;halts program
              endif else begin                                                                 ;end check SECONDARY keyword is set
                 case secunits of                                                              ;case of secunits
                    'redshift' : begin                                                         ;if secunits is redshift
                       case 1 of                                                               ;begin trival case
                          n_elements(primary) gt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # secondary entries not equal # of primary entries!!' ;prints info
                                print, ' Assuming all primary entries at same redshift!!'      ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             d_c = qromb('E_z', 0.0, secondary[0], /DOUBLE )                   ;integrate function using subarray
                             distance = (2.99E5 / h0) * d_c                                    ;calculates the proper distance
                             to_rad = prim_to_mpc / (distance/(1+secondary[0]))                ;angle in rads of phys size
                             to_one = to_rad                                                   ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) lt n_elements(secondary) : begin                 ;test number of entries
                             if verbose gt 2 then begin                                        ;check VERBOSE keyword
                                print, ' # primary entries not equal # of secondary entries!!' ;prints info
                                print, ' Assuming same physical size at all redshifts!!'       ;prints info
                             endif                                                             ;end check VERBOSE keyword
                             to_rad = dblarr(n_elements(secondary))                            ;creates array to store
                             prim_to_mpc = replicate(prim_to_mpc, n_elements(secondary))       ;replicated primary phys dist val
                             for ii=0, n_elements(secondary)-1, 1 do begin                     ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii], /DOUBLE )               ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad                                                   ;converts radian to arcsec
                          end                                                                  ;end test # entries
                          n_elements(primary) eq n_elements(secondary) : begin                 ;test number of entries
                             to_rad = dblarr(n_elements(primary))                              ;creates array to store
                             for ii=0, n_elements(primary)-1, 1 do begin                       ;loop over all entries
                                d_c = qromb('E_z', 0.0, secondary[ii] )                        ;integrate function using subarray
                                distance = (2.99E5 / h0) * d_c                                 ;calculates the proper distance
                                to_rad[ii] = prim_to_mpc[ii] / (distance/(1+secondary[ii]))    ;angle in rads of phys size
                             endfor                                                            ;end loop over all entries
                             to_one = to_rad                                                   ;converts rads to arcsec
                          end                                                                  ;end alt to unequal # of entries
                       endcase                                                                 ;ends trivial case
                    end                                                                        ;end secunits is redshift
                    else : begin                                                               ;for no match of secunits
                       print, ' Secondary units not valid'                                     ;prints info
                       to_one = ' under construction'                                          ;prints info
                    end                                                                        ;end else of secunits
                 endcase                                                                       ;end case of secunits
              endelse                                                                          ;end alt to SECONDARY keyword not set
           end                                                                                 ;end wanted value in radians
           else : print, 'Output value unit(s) not valid!!!'                                   ;catch statement
        endcase                                                                                ;end case of converting to
     end                                                                                       ;end case of converting from
     
     'gpc' : begin                                                                         ;if given dist is in gpc
        case outunits of                                                                   ;begins case of converting to
           'kpc' : begin                                                                   ;if wanted dist is in kpc
              if verbose ge 2 then print, ' gpc to kpc '                                   ;prints info
              to_one = primary * 1000000.0                                                 ;converts gpc to kpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in kpc
           'mpc' : begin                                                                   ;if wanted dist in in mpc
              if verbose ge 2 then print, ' gpc to mpc '                                   ;prints info
              to_one = prim_to_mpc                                                              ;converts gpc to mpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in mpc
           'gpc' : begin                                                                   ;if wanted dist is in gpc
              if verbose ge 2 then print, ' What you put in is what you get out!', primary ;prints info
              to_one = primary                                                             ;sets value in output
           end                                                                             ;end wanted dist in gpc
           'ly' : begin                                                                    ;if wanted dist is in ly
              if verbose ge 2 then print, ' gpc to ly '                                    ;prints info
              to_one = primary * 3261566000.0                                              ;converts gpc to ly
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in ly
           'km' : begin                                                                    ;if wanted dist is in km
              if verbose ge 2 then print, ' gpc to km '                                    ;prints info
              to_one = primary * 3.085683E22                                               ;converts gpc to km
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in km
           'm' : begin                                                                     ;if wanted dist is in m
              if verbose ge 2 then print, ' gpc to m '                                     ;prints info
              to_one = primary * 3.085683E25                                               ;converts gpc to m
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in m
           else : print, 'Output value unit(s) not valid!!!'                               ;catch statement
        endcase                                                                            ;end case of converting to
     end                                                                                   ;end case of converting from
      
     'ly' : begin                                                                          ;if given dist is in light years
        case outunits of                                                                   ;begins case of converting to
           'kpc' : begin                                                                   ;if wanted dist is in kpc
              if verbose ge 2 then print, ' ly to kpc '                                    ;prints info
              to_one = primary / 3261.566                                                  ;converts ly to kpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in kpc
           'mpc' : begin                                                                   ;if wanted dist in in mpc
              if verbose ge 2 then print, ' ly to mpc '                                    ;prints info
              to_one = prim_to_mpc                                                              ;converts ly to mpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in mpc
           'gpc' : begin                                                                   ;if wanted dist is in gpc
              if verbose ge 2 then print, ' ly to gpc '                                    ;prints info
              to_one = primary / 3261566000.0                                              ;converts ly to gpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in gpc
           'ly' : begin                                                                    ;if wanted dist is in ly
              if verbose ge 2 then print, ' What you put in is what you get out!', primary ;prints info
              to_one = primary                                                             ;sets value in output
           end                                                                             ;end wanted dist in ly
           'km' : begin                                                                    ;if wanted dist is in km
              if verbose ge 2 then print, ' ly to km '                                     ;prints info
              to_one = primary * 9.45425E12                                                ;converts ly to km
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in km
           'm' : begin                                                                     ;if wanted dist is in m
              if verbose ge 2 then print, ' ly to m '                                      ;prints info
              to_one = primary * 9.45425E15                                                ;converts ly to m
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in m
           else : print, 'Output value unit(s) not valid!!!'                               ;catch statement
        endcase                                                                            ;end case of converting to
     end                                                                                   ;end case of converting from
     
     'km' : begin                                                                          ;if given dist is in light years
        case outunits of                                                                   ;begins case of converting to
           'kpc' : begin                                                                   ;if wanted dist is in kpc
              if verbose ge 2 then print, ' km to kpc '                                    ;prints info
              to_one = primary * 3.24077649E-17                                            ;converts km to kpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in kpc
           'mpc' : begin                                                                   ;if wanted dist in in mpc
              if verbose ge 2 then print, ' km to mpc '                                    ;prints info
              to_one = prim_to_mpc                                                              ;converts km to mpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in mpc
           'gpc' : begin                                                                   ;if wanted dist is in gpc
              if verbose ge 2 then print, ' km to gpc '                                    ;prints info
              to_one = primary * 3.24077649E-23                                            ;converts km to gpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in gpc
           'ly' : begin                                                                    ;if wanted dist is in ly
              if verbose ge 2 then print, ' km to ly '                                     ;prints info
              to_one = primary / 9.45425E12                                                ;converts km to ly
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in ly
           'km' : begin                                                                    ;if wanted dist is in km
              if verbose ge 2 then print, ' What you put in is what you get out!', primary ;prints info
              to_one = primary                                                             ;sets value in output
           end                                                                             ;end wanted dist in km
           'm' : begin                                                                     ;if wanted dist is in m
              if verbose ge 2 then print, ' km to m '                                      ;prints info
              to_one = primary * 1000.0                                                    ;converts km to m
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in m
           else : print, 'Output value unit(s) not valid!!!'                               ;catch statement
        endcase                                                                            ;end case of converting to
     end                                                                                   ;end case of converting from
     
     'm' : begin                                                                           ;if given dist is in light years
        case outunits of                                                                   ;begins case of converting to
           'kpc' : begin                                                                   ;if wanted dist is in kpc
              if verbose ge 2 then print, ' m to kpc '                                     ;prints info
              to_one = primary * 3.24077649E-20                                            ;converts m to kpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in kpc
           'mpc' : begin                                                                   ;if wanted dist in in mpc
              if verbose ge 2 then print, ' m to mpc '                                     ;prints info
              to_one = prim_to_mpc                                                              ;converts m to mpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in mpc
           'gpc' : begin                                                                   ;if wanted dist is in gpc
              if verbose ge 2 then print, ' m to gpc '                                     ;prints info
              to_one = primary * 3.24077649E-26                                            ;converts m to gpc
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in gpc
           'ly' : begin                                                                    ;if wanted dist is in ly
              if verbose ge 2 then print, ' m to ly '                                      ;prints info
              to_one = primary / 9.45425E15                                                ;converts m to ly
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in ly
           'km' : begin                                                                    ;if wanted dist is in km
              if verbose ge 2 then print, ' m to km '                                      ;prints info
              to_one = primary / 1000.0                                                    ;converts m to km
              if verbose ge 2 then print, ' ', primary, ' = ', to_one                      ;prints info
           end                                                                             ;end wanted dist in km
           'm' : begin                                                                     ;if wanted dist is in m
              if verbose ge 2 then print, ' What you put in is what you get out!', primary ;prints info
              to_one = primary                                                             ;sets value in output
           end                                                                             ;end wanted dist in m
           else : print, 'Output value unit(s) not valid!!!'                               ;catch statement
        endcase                                                                            ;end case of converting to
     end                                                                                   ;end case of converting from
     
     else : print, 'Primary value unit(s) not valid!!!' ;catch statement
  endcase                                               ;end case primary units
  
  
  return, to_one                ;returns physical length value(s)
end                             ;end function length
;========================================================================================================================



;========================================================================================================================
function testsuite, primary, primunits, OUTUNITS=outunits, SECONDARY=secondary, SECUNITS=secunits, $
                    OMEGAL=omegal, OMEGAM=omegam, OMEGAK=omegak, H0=ho, VERBOSE=verbose
  
  if keyword_set(OMEGAL) then omegal = omegal[0] else omegal = 0.7 ;sets new value
  if keyword_set(OMEGAM) then omegam = omegam[0] else omegam = 0.3 ;sets new value
  if keyword_set(OMEGAK) then omegak = omegak[0] else omegak = 0.0 ;sets new value
  if keyword_set(H0) then h0 = h0[0] else h0 = 70.0                ;sets new value
  if keyword_set(VERBOSE) then begin                               ;test VERBOSE keyword
     case verbose[0] of                                            ;begin case of verbose value
        'loud' : verbose = 3                                       ;sets new value
        'normal' : verbose = 2                                     ;sets new value
        'quiet' : verbose = 1                                      ;sets new value
        else : verbose = 2                                         ;sets new value
     endcase                                                       ;end case verbose value
  endif                                                            ;end test VERBOSE keyword
  
  common share1, omega_l, omega_m, omega_k, h_0 ;shares variables with all functions
  omega_l = omegal                              ;constant
  omega_m = omegam                              ;constant
  omega_k = omegak                              ;constant
  h_0 = h0                                      ;[km/s/Mpc]
  
  primunits = ['degree', 'arcmin', 'arcsec', 'radian']
  outunits = ['degree', 'arcmin', 'arcsec', 'radian']
  for ii=0, n_elements(primunits)-1, 1 do begin
     for jj=0, n_elements(outunits)-1, 1 do begin
        result = length(primary, primunits[ii], OUTUNITS=outunits[jj], SECONDARY='', SECUNITS='', $
                        OMEGAL=omegal, OMEGAM=omegam, OMEGAK=omegak, H0=h0, VERBOSE='loud')
        print, ''
     endfor
  endfor
  
  primunits = ['kpc', 'mpc', 'gpc', 'ly', 'km', 'm']
  outunits = ['kpc', 'mpc', 'gpc', 'ly', 'km', 'm']
  for ii=0, n_elements(primunits)-1, 1 do begin
     for jj=0, n_elements(outunits)-1, 1 do begin
        result = length(primary, primunits[ii], OUTUNITS=outunits[jj], SECONDARY='', SECUNITS='', $
                        OMEGAL=omegal, OMEGAM=omegam, OMEGAK=omegak, H0=h0, VERBOSE='loud')
        print, ''
     endfor
  endfor

  return, 1
end                             ;end testsuite function
;========================================================================================================================



pro call_cosmo_calc
  set_plot, 'ps'                                       ;sets to post script
  device, filename='angularsize_mpc_arcsec.ps', /color ;sets device

  n = 2000  
  values = [1.00]
  zs = indgen(n+1)*(4.8/n)
  zs = zs[1:n_elements(zs)-1]+0.1
  result = length(values, 'mpc', OUTUNITS='arcsec', SECONDARY=zs, SECUNITS='redshift', OMEGAL=0.73, OMEGAM=0.27, $
                  OMEGAK=0.0, H0=71.0, VERBOSE='loud')
  plot, zs, result, linestyle=1, $
        background='FFFFFF'XL,$
        color='00000'Xl, $
        title = 'Angular Size of Fixed Physical Size Comoving Radius', $
        xtitle = 'Redshift [z]', $
        ytitle = 'Angular Size [arcsec]', $
        charsize = 1.1
  
  values = [0.500]
  zs = indgen(n+1)*(4.8/n)
  zs = zs[1:n_elements(zs)-1]+0.1
  result = length(values, 'mpc', OUTUNITS='arcsec', SECONDARY=zs, SECUNITS='redshift', OMEGAL=0.73, OMEGAM=0.27, $
                  OMEGAK=0.0, H0=71.0, VERBOSE='normal')
  oplot, zs, result, linestyle=2, color='000000'Xl
  
  values = [1.500]
  zs = indgen(n+1)*(4.8/n)
  zs = zs[1:n_elements(zs)-1]+0.1
  result = length(values, 'mpc', OUTUNITS='arcsec', SECONDARY=zs, SECUNITS='redshift', OMEGAL=0.73, OMEGAM=0.27, $
                  OMEGAK=0.0, H0=71.0, VERBOSE='normal')
  oplot, zs, result, linestyle=3, color='000000'Xl
  
  values = [2.000]
  zs = indgen(n+1)*(4.8/n)
  zs = zs[1:n_elements(zs)-1]+0.1
  result = length(values, 'mpc', OUTUNITS='arcsec', SECONDARY=zs, SECUNITS='redshift', OMEGAL=0.73, OMEGAM=0.27, $
                  OMEGAK=0.0, H0=71.0, VERBOSE='normal')
  oplot, zs, result, linestyle=4, color='000000'Xl
  
  values = [2.500]
  zs = indgen(n+1)*(4.8/n)
  zs = zs[1:n_elements(zs)-1]+0.1
  result = length(values, 'mpc', OUTUNITS='arcsec', SECONDARY=zs, SECUNITS='redshift', OMEGAL=0.73, OMEGAM=0.27, $
                  OMEGAK=0.0, H0=71.0, VERBOSE='normal')
  oplot, zs, result, linestyle=5, color='000000'Xl
  
  legend, ['R=0.50Mpc', 'R=1.00Mpc', 'R=1.50Mpc', 'R=2.00Mpc', 'R=2.50Mpc'], $
          linestyle=[2,1,3,4,5], $   ;set legend
          box=0, $                   ;legend option
          /RIGHT, $                  ;legend option
          textcolors = '000000'XL, $ ;legend option
          charsize=1.0               ;legend option
  
  device, /close                ;closes device
  set_plot, 'x'                 ;undoes ps
  

end
;========================================================================================================================



;========================================================================================================================
PRO cosmo_calc, num


  IF num GE 2 THEN print, 'Compile cosm_calc.pro'

END
;========================================================================================================================
