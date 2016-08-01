call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe', { 'for' : ['c', 'cpp', 'python'], 'do' : './install.sh --clang-completer' }
autocmd! User YouCompleteMe call youcompleteme#Enable()

Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tweekmonster/braceless.vim', { 'for' : ['python'] }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Lucius'
Plug 'crusoexia/vim-monokai'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
call plug#end()

if has("gui_running")
  set guifont=Roboto\ Mono\ for\ Powerline\ 9
  set guioptions-=l
  set guioptions-=T
  set guioptions-=m
  set linespace=4
endif

if !has("gui_running")
  set timeoutlen=250
  set ttimeoutlen=0
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=500
  augroup END
endif


colorscheme lucius
" colorscheme Tomorrow
" colorscheme Tomorrow-Night-Eighties
" colorscheme lucius
LuciusDark

set spelllang=en
set nospell
"set spell

set softtabstop=2
set shiftwidth=2
set expandtab
set cmdheight=1
set number
set colorcolumn=80
set backspace=indent,eol,start

" Backup settings
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set noswapfile

set showcmd
set showmatch
set noshowmode
set laststatus=1
set incsearch
set shortmess=atI
set ruler
set hidden
let mapleader = " "

" set wildchar=<Tab> wildmenu wildmode=full
" set wildcharm=<C-Z>

" Lines longer than 80 columns.
"au BufWinEnter * let w:m0=matchadd('SpellBad', '\%>80v.\+', -1)
"
"" Whitespace at the end of a line. This little dance suppresses
"" whitespace that has just been typed.
"au BufWinEnter * let w:m1=matchadd('Error', '\s\+$', -1)
"au InsertEnter * call matchdelete(w:m1)
"au InsertEnter * let w:m2=matchadd('Error', '\s\+\%#\@<!$', -1)
"au InsertLeave * call matchdelete(w:m2)
"au InsertLeave * let w:m1=matchadd('Error', '\s\+$', -1)
"au BufWinEnter vimfiler* call matchdelete(w:m1)
"au BufWinLeave vimfiler* let w:m1=matchadd('Error', '\s\+$', -1)
"au BufWinEnter Unite* call matchdelete(w:m1)
"au BufWinLeave Unite* let w:m1=matchadd('Error', '\s\+$', -1)

" Optional
" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END

set smarttab

" Highlight syntax in programming languages
syntax on
syntax sync minlines=256
set nocursorcolumn
set nocursorline

" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's important to categorize them as such.
augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Set pylint compiler for python files
autocmd FileType python compiler pylint

" Useful macros for cleaning up code to conform to LLVM coding guidelines
" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/tablegen.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

set ssop-=options
set ssop-=folds

set completeopt=menuone,menu,longest,preview

let g:airline_extensions=[]

" YouCompleteMe
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_server_use_vim_stdout=0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_warning_symbol = 'x'
let g:ycm_error_symbol = '»'
set wildignore+=build,*.a,*.so,*.o,*.obj,.git

let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:snips_author="Andreas Simbürger <simbuerg@lairosiel.de>"
let g:EclimCompletionMethod='omnifunc'

" Unite bindings.
nmap <unique> <Leader>t :FZF<CR>
nmap <unique> <Leader>l :Buffers<CR>

" Doxygen comments
nmap <unique> <Leader>c :Dox<CR>
nmap <unique> <Leader>x :DoxBlock<CR>
" YCM: Jump to definition/declaration
nmap <unique> <leader>jd :YcmCompleter GoToImprecise<CR>
nmap <unique> <leader>jj :YcmCompleter GoTo<CR>
nmap <unique> <leader>jt :YcmCompleter GetType<CR>
nmap <unique> <leader>jp :YcmCompleter GetParent<CR>

" Save the file with sudo, if you forgot to open it with sudo again... ;-)
cmap w!! w !sudo tee % >/dev/null

" Toggle search highlighting
nmap <F3> :set hlsearch!<CR>
nmap <F5> :YcmForceCompileAndDiagnostics<CR>
nmap <F6> :YcmShowDetailedDiagnostic<CR>

nnoremap <leader>gf :YcmCompleter GoTo<CR>

nmap <F8> :Neomake! <CR>

" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab>  <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
autocmd FileType python BracelessEnable +indent +highlight-cc2

nmap <unique> <s-c> :Ag<space>

nmap <silent> <UP>            :bprev<CR>
nmap <silent> <DOWN>          :bnext<CR>
nmap <silent> <LEFT>          :cprev<CR>
nmap <silent> <RIGHT>         :cnext<CR>
