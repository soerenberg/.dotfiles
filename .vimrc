set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'google/yapf', { 'rtp': 'plugins/vim' }
Plug 'jalvesaq/Nvim-R'
Plug 'eigenfoo/stan-vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright'
Plug 'ntpeters/vim-better-whitespace' " better alternative to vim-trailing-whitespace
Plug 'davidhalter/jedi-vim' " autocompletion

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-easymotion'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" nice tab bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'

" interactive scratch pad Codi
Plug 'metakirby5/codi.vim'
Plug 'chriskempson/base16-vim'

" rainbow color brackets
Plug 'frazrepo/vim-rainbow'

Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'puremourning/vimspector'

" The following is used for google code formatter (:FormatLines, :FormatCode)
" (required apt-get install clang-format)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()

" " Note: install xclip inorder to have working clipboard support in neovim
" " coding scratchpad
" Plugin 'metakirby5/codi.vim'
"
" "Firenvim for textfields in browser (requires Browser plugins)
" " requires neovim >=0.4.0, currently disabled
" "Plugin 'glacambre/firenvim'

" enable rainbow brackets
let g:rainbow_active = 1
let g:rainbow_ctermfgs = [244, 136, 166, 160, 37, 64]
let g:rainbow_guifgs = ['brblue', 'yellow', 'brred', 'red', 'cyan', 'green']
"#808080, #af8700, #d75f00, #d70000, #00afaf, #5f8700]

" FZF shortcut
nnoremap <silent> <C-p> :Files<CR>

syntax enable
colorscheme solarized
set background=dark

" default font
set guifont=FiraCode

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab
set smartindent
set ruler
set relativenumber
set ttyfast
set autoread
set more
set cursorline!

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7
set sidescrolloff=15  " at 15 characters left start sidescrolling if nowrap
set wrap " toggle this?


" No annoying sound on errors
set noerrorbells
set novisualbell
set timeoutlen=500

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

set laststatus=2

" Starting from vim 7.3 undo can be persisted across sessions
" http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2onmqe
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Prevent from changing the split size if the window is resized (as for
" alt+f in i3)
autocmd VimResized * wincmd =

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" capitalize a word in insert mode
imap <c-u> <esc>b<c-v>eUea

" additional split commands
nnoremap <C-w>- <esc>:split<CR>
nnoremap <C-w><bar> <esc>:vsplit<CR>

" NERDtree commands
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

" reformat using yapf in python files
" autocmd FileType python nnoremap <LocalLeader
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>>f :0,$!yapf<CR>

" disable gvim menu bars
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar

" proper PEP 8 indentation for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let g:ale_python_flake8_executable = 'python3'
let g:ale_python_executable='python3'
let g:ale_python_pyflakes_executable = 'pyflakes3'
let g:ale_python_pylint_executable = 'pylint3'

" show marker at line length 80
:set colorcolumn=80

" Haskell configurations
autocmd FileType haskell setlocal colorcolumn=78
" See https://github.com/jaspervdj/stylish-haskell/
noremap <leader>f :%!stylish-haskell

" " Search for visual selection with //
" vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" let nerdtree show hidden files
let NERDTreeShowHidden=1

" let nerdtree ignore .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

:set formatoptions-=t

"let g:github_enterprise_urls = ['https://github.com/UPcload/']

" airline (tab par)
" set nice arrows and fonts in bar
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized_flood'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Semshi syntax highlighting for python
function SolarizedDarkHighlights()
    hi semshiLocal           ctermfg=37 guifg=#00afaf
    hi semshiGlobal          ctermfg=160 guifg=#d70000
    hi semshiImported        ctermfg=166 guifg=#d75f00 cterm=bold gui=bold
    hi semshiFree            ctermfg=125 guifg=#af005f
    hi semshiParameter       ctermfg=37 guifg=#00afaf
    hi semshiParameterUnused ctermfg=166 guifg=#d75f00 cterm=reverse gui=reverse
    hi semshiBuiltin         ctermfg=136 guifg=#af8700 cterm=bold gui=bold
    hi semshiAttribute       ctermfg=64  guifg=#00afaf
    hi semshiSelf            ctermfg=249 guifg=#b2b2b2
    hi semshiUnresolved      ctermfg=red guifg=#dc322f cterm=underline gui=underline
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
    hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    " sign define semshiError text=E> texthl=semshiErrorSign
endfunction
autocmd FileType python call SolarizedDarkHighlights()

let g:vimspector_enable_mappings = 'HUMAN'
