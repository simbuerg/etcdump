""" Configure the ale plugin

"""
" Keybindings
"""

"""
" Plugin Settings
"""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#poetv = 1
let g:airline_theme = 'pencil'

" ALE
let g:ale_set_balloons = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_open_list = 0
let g:ale_linters = {
\   'cpp': ['clangtidy'],
\   'python': ['pylint']
\}
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

