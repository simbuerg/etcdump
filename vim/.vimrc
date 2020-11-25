call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Plug 'Valloric/YouCompleteMe', { 'for' : ['go', 'c', 'cpp', 'python'], 'do' : './install.py --go-completer --clangd-completer' }
"autocmd! User YouCompleteMe call youcompleteme#Enable()

Plug 'godlygeek/tabular'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'farseer90718/vim-taskwarrior'

" Plug 'tweekmonster/braceless.vim', { 'for' : ['python'] }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'reedes/vim-colors-pencil'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-test/vim-test'
" Plug 'petobens/poet-v'
Plug 'intrntbrn/awesomewm-vim-tmux-navigator'

call plug#end()

if !has("gui_running")
  set timeoutlen=250
  set ttimeoutlen=0
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=500
  augroup END
endif
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme pencil
let g:pencil_terminal_italics = 1
let g:pencil_gutter_color = 1
let g:airline_theme = 'pencil'
set background=dark

" enable indentation
set breakindent
" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
set breakindentopt=shift:2,min:40,sbr
" append '>>' to indent
set showbreak=>>

set spelllang=en
set nospell
set softtabstop=2
set shiftwidth=2
set expandtab

""" PoetV
let g:poetv_executables = ['poetry', 'pipenv']
let g:poetv_auto_activate = 1
let g:poetv_set_environment = 1
"""

set cmdheight=1
set updatetime=300
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#poetv = 1
let g:airline_theme = 'pencil'

" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_open_list = 0
let g:ale_linters = {
\   'cpp': ['clangtidy'],
\   'python': ['pylint']
\}
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" YouCompleteMe
" let g:ycm_always_populate_location_list = 1
" let g:ycm_autoclose_preview_window_after_completion = 0
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_confirm_extra_conf=0
" let g:ycm_enable_diagnostic_highlighting = 1
" let g:ycm_enable_diagnostic_signs = 1
" let g:ycm_open_loclist_on_ycm_diags = 1
" let g:ycm_server_use_vim_stdout=0
" let g:ycm_show_diagnostics_ui = 1
" let g:ycm_error_symbol = '~'
" let g:ycm_warning_symbol = '!'
set wildignore+=build,build-debug,*.a,*.so,*.o,*.obj,.git

" let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:ultisnips_python_style="google"
let g:snips_author="Andreas Simbürger <simbuerg@lairosiel.de>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <Leader>t :FZF<CR>
nnoremap <Leader>l :Buffers<CR>

" YCM: Jump to definition/declaration
" nnoremap <leader>jd :YcmCompleter GoToImprecise<CR>
" nnoremap <leader>jj :YcmCompleter GoTo<CR>
" nnoremap <leader>jt :YcmCompleter GetType<CR>
" nnoremap <leader>jp :YcmCompleter GetParent<CR>

" Save the file with sudo, if you forgot to open it with sudo again... ;-)
cmap w!! w !sudo tee % >/dev/null

" Toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" nnoremap <F6> :YcmShowDetailedDiagnostic<CR>
" nnoremap <leader>gf :YcmCompleter GoTo<CR>

nnoremap <F8> :Make! <CR>

" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab>  <plug>(fzf-maps-o)

" Insert mode completion
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" autocmd FileType python BracelessEnable +indent +highlight-cc2

nnoremap <s-c> :Ag<space>

nnoremap <silent> <UP>            :bprev<CR>
nnoremap <silent> <DOWN>          :bnext<CR>
nnoremap <silent> <LEFT>          :cprev<CR>
nnoremap <silent> <RIGHT>         :cnext<CR>

tnoremap <Esc> <C-\><C-n>
