"NeoBundle
filetype plugin indent off

" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'vim-jp/vimdoc-ja'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

"autocmds
augroup XML
  autocmd!
  autocmd FileType xml inoremap <silent> <buffer> </ </<C-x><C-o>
  autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
  autocmd FileType eruby inoremap <silent> <buffer> </ </<C-x><C-o>
  autocmd FileType erb inoremap <silent> <buffer> </ </<C-x><C-o>
augroup END
"basic settings
syntax on
set helplang=ja
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set incsearch
set hlsearch
set nowrap
set showmatch
set whichwrap=h,l
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
"0が前置されている数値を８進数とみなさない
set nrformats=

colorscheme desert

"exit commands
nnoremap <Space>w :<C-u>w<CR>
nnoremap <Space>q :<C-u>q<CR>
nnoremap <Space>Q :<C-u>q!<CR>

"map ; :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"move to line of first and last
nnoremap <Space>h ^
nnoremap <Space>l $

"movement
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj
nnoremap gk k
nnoremap gj j
vnoremap gk k
vnoremap gj j

"search
nnoremap <Space>/ *<C-o>
nnoremap g<Space>/ g*<C-o>

"window
nnoremap s <Nop>
nnoremap ss :<C-u>split<CR>
nnoremap sv :<C-u>vsplit<CR>
nnoremap sj <C-w>j
nnoremap sh <c-w>h
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sc <c-w>c
nnoremap so <C-w>o
nnoremap sw <c-w>w

"tab
nnoremap <silent> tt :<C-u>tabe<CR>
nnoremap <C-p> gT
nnoremap <C-n> gt
inoremap jk <Esc>

"Unite.vim
nnoremap sb :Unite buffer<CR>

"NERDTree
let g:NERDTreeShowBookmarks=1
autocmd vimenter * NERDTree

"scripts
source $VIMRUNTIME/macros/matchit.vim
