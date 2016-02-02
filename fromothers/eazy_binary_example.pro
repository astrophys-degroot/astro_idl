pro pz

; POFZ
 openr,lun,'xmm105_v1_binary.pz',/get_lun,/swap_if_big_endian
 s = lonarr(2) & readu,lun,s
 NZ = s[0] & NOBJ = s[1]
 chi2fit = dblarr(NZ,NOBJ)
 readu,lun,chi2fit
 NK = 0L & readu,lun,NK
 kbins = dblarr(NK) & priorzk = dblarr(NZ,NK) & kidx = lonarr(NOBJ)
 readu,lun,kbins,priorzk,kidx 
 close,/all

; reading in redshift values
readcol,'344.pz',z
prob = make_array(nz)
photz = make_array(nobj)

; reading id from FORS catalog
readcol,'XMM105_all.scat',id,forsra,forsdec,pixx,pixy,mag1,mag2,mag3,pr,forsq,forsz

for id = 0,nobj - 1 do begin

	; k id identifies the k-mag bin of the prior we are in
	; so get the prior from that, or make a uniform prior
	kid = kidx[id]
	if (kid gt 0 and kid lt nk) then begin
		prior = priorzk[*,kid]
	endif else begin
		prior = make_array(nz, value = 1.0)
	endelse
	
	; probability is e ^ chisq
	
	p = exp(-0.5 * (chi2fit[*,id] - min(chi2fit[*,id])) ) * prior * (1+z)
	np = p / total(p)
	if id gt 0 then prob = [[prob],[np]]
	if id eq 0 then prob = np

	photz[id] = z[ where(prob[*,id] eq max(prob[*,id]) ) ]

	print,id

endfor

; reading in julie stuff
julie = mrdfits('xmm105_v1_master.fits',1)
close_match_radec,julie.ra,julie.dec,forsra,forsdec,m3,m4,1/3600.,1,miss



; integrate the probability distribution
member_prob = make_array(nobj)

for i = 0,nobj - 1 do begin
	member_prob[i] = total(prob[91:99,i])
endfor