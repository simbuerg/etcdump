""" Configure the fzf plugin

let g:fzf_layout = { 'down': '40%' }

"""
" Keybindings
"""

nnoremap <Leader>t :FZF<CR>
nnoremap <Leader>l :Buffers<CR>
nnoremap <s-c> :Ag<space>

" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab>  <plug>(fzf-maps-o)

" Insert mode completion
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)

" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 ctermfg=161 ctermbg=251
"   highlight fzf2 ctermfg=23 ctermbg=251
"   highlight fzf3 ctermfg=237 ctermbg=251
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction
" 
" autocmd! User FzfStatusLine call <SID>fzf_statusline()
" autocmd FileType python BracelessEnable +indent +highlight-cc2

