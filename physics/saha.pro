function saha, degenz2, degenz1, temp, energyion_z1, ELECTRON=nelectron, PRESSURE=pressure


  if keyword_set(ELECTRON) then ratio = ((2.0*degenz2)/(nelectron*degenz1))*$
                                        ((2.0*!pi*(9.11E-31/6.626E-34)*(1.38E-23/6.626E-34)*temp))^1.5*exp(double(-1.0*energyion_z1/(8.617E-5*temp)))
  if keyword_set(PRESSURE) then begin
     ratio = ((2.0*1.38E-23*temp*degenz2)/(pressure*degenz1))*((2.0*!pi*(9.11E-31/6.626E-34)*(1.38E-23/6.626E-34)*temp))^1.5*$
             exp(double(-1.0*energyion_z1/(8.617E-5*temp)))
  endif
  
  
return, ratio
end


pro call_saha

temps = indgen(101.0)*(25000.0-5000.0)/100.0+5000.0
ratio_n2_n1 = saha(2.0,1.0,temps,24.6, PRESSURE=20.0)
ratio_n3_n2 = saha(1.0,2.0,temps,54.4, PRESSURE=20.0)
ratio = (ratio_n2_n1)/(1.0+ratio_n2_n1+ratio_n3_n2*ratio_n2_n1)

plot, temps, ratio, PSYM=2, $
      background='FFFFFF'XL, $
      color='000000'XL, $
      title='Fraction of Helium Atoms in Excited State', $
      xtitle='Temperature [K]', $
      ytitle='NII/Ntotal', $
      charsize=1.3
hline, 0.5, color='000000'XL, /DATA
im=tvrd()
write_jpeg, 'he_partialionization.jpeg', im

end

