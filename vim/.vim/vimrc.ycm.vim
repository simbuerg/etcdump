""" Configure the ycm plugin

"""
" Keybindings
"""

nnoremap <leader>jd :YcmCompleter GoToImprecise<CR>
nnoremap <leader>jj :YcmCompleter GoTo<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>
nnoremap <leader>jp :YcmCompleter GetParent<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F6> :YcmShowDetailedDiagnostic<CR>
nnoremap <leader>gf :YcmCompleter GoTo<CR>

"""
" Plugin Settings
"""

let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_server_use_vim_stdout=0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '~'
let g:ycm_warning_symbol = '!'
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

