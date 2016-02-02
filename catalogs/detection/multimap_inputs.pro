;========================================================================================================================
function multimap_inputs, pixscale
  
  ;;;back_varbin: square with side length of bin size for which to find the variance of the background in 
  ;;;back_cut: top x% at which to cut, above which these pixels assumed to be associated with sources 
  ;;;back_grow: how many pixels to grow outward from each source pixel to avoid usig source pixels as background
  ;;;back annulus: how many pixels outward from object to use in determining the proper background for source pixels
  ;;;back_bkkersz: kernel size for smoothing the background
  ;;;disp_imkerzs: kernel size for normalizing to unit dispersion
  ;;;disp_mubins: number of bins to divide image into
  ;;;disp_sigbins: number of bins to divide the dispersion sampling into
  ;;;disp_ulfrac: fraction of sigma in the image to cut at so that only those values below this value are used
 



  CASE pixscale OF
     '0.185'  : inputs = [{band:'sparcsu', back_varbin:9, back_cut:0.05, back_grow:6, back_annulus:20, back_bkkersz:20, $
                           disp_imkersz:3, disp_mubins:100, disp_sigbins:250, disp_ulfrac:0.5}, $
                          {band:'sparcsg', back_varbin:9, back_cut:0.05, back_grow:6, back_annulus:20, back_bkkersz:20, $
                           disp_imkersz:3, disp_mubins:100, disp_sigbins:250, disp_ulfrac:0.5}, $
                          {band:'sparcsr', back_varbin:9, back_cut:0.05, back_grow:6, back_annulus:20, back_bkkersz:20, $
                           disp_imkersz:3, disp_mubins:100, disp_sigbins:250, disp_ulfrac:0.5}, $
                          {band:'sparcsz', back_varbin:9, back_cut:0.05, back_grow:6, back_annulus:20, back_bkkersz:20, $
                           disp_imkersz:3, disp_mubins:100, disp_sigbins:250, disp_ulfrac:0.5}, $
                          {band:'iracch1', back_varbin:9, back_cut:0.05, back_grow:6, back_annulus:20, back_bkkersz:20, $
                           disp_imkersz:3, disp_mubins:100, disp_sigbins:250, disp_ulfrac:0.5}, $
                          {band:'iracch2', back_varbin:9, back_cut:0.05, back_grow:6, back_annulus:20, back_bkkersz:20, $
                           disp_imkersz:3, disp_mubins:100, disp_sigbins:250, disp_ulfrac:0.5}]
     '0.200'  : inputs = [{band:'videok', back_varbin:9, back_cut:0.05, back_grow:6, back_annulus:20, back_bkkersz:20, $
                           disp_imkersz:3, disp_mubins:100, disp_sigbins:250, disp_ulfrac:0.5}, $
                          {band:'videoj', back_varbin:9, back_cut:0.05, back_grow:6, back_annulus:20, back_bkkersz:20, $
                           disp_imkersz:3, disp_mubins:100, disp_sigbins:250, disp_ulfrac:0.5}] ;, $
                                ;{band:'ukidssJ', back_varbin:9, back_cut:0.05, back_grow:6, back_annulus:20, back_bkkersz:20, $
                                ; disp_imkersz:3, disp_mubins:100, disp_sigbins:250, disp_ulfrac:0.5}, $
                                ;{band:'ukidssK', back_varbin:6, back_cut:0.05, back_grow:15, back_annulus:25, back_bkkersz:5, $
                                ; disp_imkersz:1.5, disp_mubins:20, disp_sigbins:20, disp_ulfrac:0.3} ]
     '0.60'  : inputs = [{band:'iracch1', back_varbin:6, back_cut:0.05, back_grow:15, back_annulus:25, back_bkkersz:5, $
                          disp_imkersz:1.5, disp_mubins:20, disp_sigbins:20, disp_ulfrac:0.3}, $
                         {band:'iracch2', back_varbin:6, back_cut:0.05, back_grow:15, back_annulus:25, back_bkkersz:5, $
                          disp_imkersz:1.5, disp_mubins:20, disp_sigbins:20, disp_ulfrac:0.3}, $
                         {band:'iracch3', back_varbin:5, back_cut:0.01, back_grow:12, back_annulus:25, back_bkkersz:5, $
                          disp_imkersz:1.5, disp_mubins:20, disp_sigbins:20, disp_ulfrac:0.3}, $
                         {band:'iracch4', back_varbin:5, back_cut:0.01, back_grow:12, back_annulus:25, back_bkkersz:5, $
                          disp_imkersz:1.5, disp_mubins:20, disp_sigbins:20, disp_ulfrac:0.3}]
     ELSE : BEGIN
        print, 'WARNING!! Choice of pixel scale not found!!'
        print, '  Current choices are: 0.185, 0.200, 0.60 '
        stop
     END
  ENDCASE
  

  RETURN, inputs
END
;========================================================================================================================

