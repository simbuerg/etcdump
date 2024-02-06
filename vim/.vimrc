call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'
Plug 'morhetz/gruvbox'

" Plug 'Valloric/YouCompleteMe', { 'for' : ['go', 'c', 'cpp', 'python'], 'do' : './install.py --go-completer --clangd-completer' }
"autocmd! User YouCompleteMe call youcompleteme#Enable()

Plug 'godlygeek/tabular'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

" Plug 'vimwiki/vimwiki'
" Plug 'tbabej/taskwiki'
Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'farseer90718/vim-taskwarrior'

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
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'iamcco/coc-diagnostic', {'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'master'}

" Plug 'vim-test/vim-test'
" Plug 'petobens/poet-v'
Plug 'intrntbrn/awesomewm-vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
" Plug 'numirias/semshi', { 'do': 'UpdateRemotePlugins' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Set <Leader> to whitespace.
let mapleader = " "

runtime vimrc.ale.vim
runtime vimrc.coc.vim
runtime vimrc.fzf.vim
runtime vimrc.filetypes.vim

"""
" Setup Theme & UI
"""

" Speed up insert mode enter/leave in console mode.
if !has("gui_running")
  set timeoutlen=250
  set ttimeoutlen=0
  set mouse=
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=500
  augroup END
else
  set mouse=a
endif

" Use more than 16 colors.
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme gruvbox
let g:airline_theme='gruvbox'

" let g:pencil_terminal_italics = 1
" let g:pencil_gutter_color = 1
" let g:airline_theme = 'pencil'
set background=dark

" Highlight syntax in programming languages
syntax on
syntax sync minlines=256

" Don't highlight the cursor column.
set nocursorcolumn

" Don't highlight the cursor row.
set nocursorline

" ident by an additional 2 characters on wrapped lines, when line >= 40
" characters, put 'showbreak' at start of line
set breakindent
set breakindentopt=shift:2,min:40,sbr
set showbreak=>>

" Configure auto-correct
set spelllang=en
" set nospell

" Insert 2 spaces instead of tab while editing.
set softtabstop=2
" Use 2 spaces of for each step of (auto) indent.
set shiftwidth=2
" Expand tabs to spaces
set expandtab

" Tab at beginning of line inserts <shiftwidth>,
" otherwise <tabstop> or <softtabstop>, depending on the value of expandtab.
set smarttab

" Set command window height to 1
set cmdheight=1

" Use shorter messages for
"  f: use (3 of 5) instead of (file 3 of 5)
"  i: use [noeol] instead of [Incomplete last line]
"  l: use 999L, 888B instead of 999 lines, 888 bytes
"  m: use [+] instead of [Modified]
"  n: use [New] instead of [New File]
"  r: use [RO] instead of [readonly]
"  w: use [w] instead of written
"     use [a] instead of appended
"  x: use [dos] instead of [dos format], [unix] instead of [unix format], etc.
"  t: truncate file message at the start if it is too long to fit the
"     command-line.
"  c: don't give ins-completion-menu messages.
"  I: disable the Vim intro message.
set shortmess=actI

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.Recently (>= patch 8.1.1564) vim can merge
" signcolumn and number column into one
if !has('nvim')
  set signcolumn=number
endif

" Show line numbers
set number

" Show a colored column after 80 chars
set colorcolumn=80

" Allow backspace over autoindent, line breaks (joins the lines) and over the
" start of insert.
set backspace=indent,eol,start

" Backup settings: Keep a large amount of undo steps consistent over session
" boundaries in ~/.vim/undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" Disable the swap file.
set noswapfile
" Write the swap file after 300 ms
" set updatetime=300

" Show partial command in the last line of the screen.
set showcmd

" Briefly highlight matching brackets when visible.
set showmatch

" No need to show the mode, vim airline does this for us
set noshowmode

" The last window should have a status line if there are at least 2 windows.
" (This is vim's default)
set laststatus=1

" Enable incremental search.
set incsearch

" Show line and column number of the cursor position.
set ruler

" Hide abandoned buffers instead of unloading them.
set hidden

" Configure :mksession store options 
if !has('nvim')
  set ssop=blank,buffers,curdir,help,tabpages,winsize,terminal
endif

" Configure completion:
"   menu, menuone: Use a popup menu to show the possible completions
"   longest: Only insert the longest common text of the matches.
"            Use Ctrl-L to add more characters.
"   preview: Show extra information in the preview window.
"            Alternative: popup
set completeopt=menuone,menu,longest,preview

" Ignore the following patterns when expanding globs.
set wildignore+=build,build-debug,*.a,*.so,*.o,*.obj,.git

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" if has('nvim')
"   set foldmethod=expr
"   set foldexpr=nvim_treesitter#foldexpr()
" endif

" Useful macros for cleaning up code to conform to LLVM coding guidelines
" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g

" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" let g:ultisnips_python_style="google"
" let g:snips_author="Andreas Simbürger <simbuerg@lairosiel.de>"

"""
" Small utility bindings.
"""

" Save the file with sudo, if you forgot to open it with sudo again... ;-)
cmap w!! w !sudo tee % >/dev/null

" Toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

" Dispatch a call to makeprg in the background using <F8>
nnoremap <F8> :Make! <CR>

" nnoremap <silent> <UP>            :bprev<CR>
" nnoremap <silent> <DOWN>          :bnext<CR>
" nnoremap <silent> <LEFT>          :cprev<CR>
" nnoremap <silent> <RIGHT>         :cnext<CR>

nnoremap <leader>r :w<CR>:!tmux send-keys -t {last} C-p C-j <CR><CR>
nnoremap <leader>R :w<CR>:!tmux send-keys -t {last}. C-p C-j <CR><CR>

tnoremap <Esc> <C-\><C-n>

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
