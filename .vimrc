" Enable mouse
set  mouse=a
set ttymouse=xterm2

" Not compatible with Vi
set nocompatible

" Relative line number
set number
set relativenumber

" Fix backspace
set backspace=indent,eol,start

" Colors 
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
syntax on

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" Highlight search things
set hlsearch

" No swapfile
set noswapfile

" No backup file
set nobackup

" Full menu
set wildmenu

" Confirm save
set confirm

" No wrap
set nowrap

" When pressing return after typing a comment, don't automatically start a new
" comment
au FileType * setlocal formatoptions-=r

" Highlight cursor line
set cursorline

" Clang-Format
let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -4,
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "DerivePointerAlignment" : "false",
      \ "PointerAlignment" : "Right",
      \ "Standard" : "C++11"}
let g:clang_format#code_style = "Google"
autocmd FileType c,cpp,objc map <buffer> = <Plug>(operator-clang-format)

" Theme AirLine
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.colnr = ':'

" Fix airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1

let g:airline#extensions#default#section_truncate_width = {
  \ 'x': 60,
  \ 'y': 60
  \ }
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'v'  : 'V',
  \ 'V'  : 'V-L',
  \ 'c'  : 'C',
  \ '␖' : 'V-B',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '␓' : 'S',
  \ }
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
    autocmd BufWritePost $MYVIMRC AirlineRefresh
augroup END " }

" Settings to search file with plugin ctrlp.vim
let g:ctrlp_custom_ignore = 'v[ / ] .(swp|zip)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1

" Snippets:

" Select Line
noremap <C-l> V<CR>

" Save with CTRL + S: but need 'stty -ixon' on end .bashrc or .zshrc
noremap <C-s> :w <CR>

" Break line
noremap <F4> :set wrap!<CR>

" Move line and selection to up
nnoremap <C-j> :m .+1<CR>==

" Move line and selection to down
nnoremap <C-k> :m .-2<CR>==

" Undo
noremap <C-z> :u<CR>

"Plugins 
call plug#begin('~/.vim/plugged')
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'mattn/emmet-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'mhinz/vim-startify'
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/nerdtree'
call plug#end()