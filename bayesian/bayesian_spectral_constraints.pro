;========================================================================================================================
function bayesian_spectral_constraints, xfeatures

 
  ;;;Constaints to be checked and used
  ;;;Basically it reads (line2's part2) = val * (line1's part1)
  constraints = [ {line2:'NIIr', part2:'sig', val:1.0, line1:'Ha', part1:'sig'}, $
                  {line2:'NIIb', part2:'sig', val:1.0, line1:'Ha', part1:'sig'}, $
                  {line2:'SIIr', part2:'sig', val:1.0, line1:'Ha', part1:'sig'}, $
                  {line2:'SIIb', part2:'sig', val:1.0, line1:'Ha', part1:'sig'}, $
                  {line2:'NIIb', part2:'c', val:0.3333, line1:'NIIr', part1:'c'}, $
                  {line2:'OIIIb', part2:'sig', val:1.0, line1:'OIIIr', part1:'sig'}, $ 

                  {line2:'OIIr', part2:'sig', val:1.0, line1:'OIIb', part1:'sig'}, $
                  {line2:'CaK', part2:'sig', val:1.0, line1:'OIIb', part1:'sig'}, $
                  {line2:'CaH', part2:'sig', val:1.0, line1:'OIIb', part1:'sig'}]


  nullconstraint = [{line2:xfeatures[0], part2:'null', val:1.0, line1:xfeatures[0], part1:'null'}]
  ncon = n_elements(constraints)
  
  ;;;Check which constraints actually apply given features provided
  flag1 = intarr(ncon)
  flag2 = intarr(ncon)  
  FOR zz=0, ncon-1, 1 DO BEGIN
     chk = where(constraints[zz].line2 EQ xfeatures)
     IF chk[0] NE -1 THEN flag2[zz] = 1
     chk = where(constraints[zz].line1 EQ xfeatures)
     IF chk[0] NE -1 THEN flag1[zz] = 1
  ENDFOR

  chk = where((flag1 EQ 1) AND (flag2 EQ 1))
  IF chk[0] NE -1 THEN xconstraints = constraints[chk] ELSE $
     xconstraints = nullconstraint

  RETURN, xconstraints
END
;========================================================================================================================
