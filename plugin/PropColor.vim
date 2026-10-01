vim9script 

if exists('g:loaded_PropColor')
    finish
endif

g:loaded_PropColor = 1

g:prop_colors_style = get(g:, 'prop_colors_style', 'both')

def g:MixChangeColor(lnum: number, col: number)
    PropColor#ChangeColor#MixChangeColor(lnum, col)
enddef

command! -nargs=0 PropColorRefresh      call PropColor#PropColor#RefreshAllColors()
command! -nargs=0 PropColorChange       call g:MixChangeColor(line('.'), col('.'))

augroup SupraColors
    autocmd!
    autocmd User SupraMenuLoaded PropColor#MenuColor#InitMenuColor()
    autocmd BufReadPost * PropColor#PropColor#InitColorListener()
    autocmd ColorScheme * PropColor#PropColor#ReinitColors()
augroup END
