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
 NeoBundle 'mattn/webapi-vim'
 NeoBundle 'moznion/hateblo.vim'
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

augroup reload
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC
augroup END

augroup Window
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-p>>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-p>>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-p>>
augroup end

"basic settings
syntax on

"日本語ヘルプを使う
set helplang=ja
"ルーラー、行番号を表示
set number
set ruler

"自動再読み込み
set autoread

"カーソルラインを表示する
set cursorline

"タイトルを表示
set title

"ステータスラインにコマンド表示
set showcmd

"ステータスラインを常に表示
set laststatus=2

set statusline+=%m
set statusline+=%r
set statusline+=%h

"OSのクリップボードを使用
set clipboard+=unnamed

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<

"サーチ途中でも一致するワードをインク表示
set incsearch

"前回の検索パターンに一致するワードをインク表示
set hlsearch

"対応するカッコを強調
set showmatch

"h,l,backspaceで次の行にいけるようにする
set whichwrap=h,l,b

"検索で最後までいったら最初から再度検索しない
set nowrapscan

"大文字小文字を区別しない
set ignorecase

"大文字が含まれていたら、大文字小文字を区別
set smartcase

"バッファのhiddenを有効に
set hidden

"コマンド履歴
set history=2000

"オートインデント
set autoindent

"ソフトタブを使用
set expandtab

"タブの幅を2に
set tabstop=2
set shiftwidth=2
"
"0が前置されている数値を8進数とみなさない
set nrformats=

"<Esc>wで折り返し切り替え
function! Switch_Wrap()
  if &wrap == '1'
    set nowrap
  else
    set wrap
  endif
endfunction

nnoremap <Esc>w :call Switch_Wrap()<CR>

colorscheme desert

"exit commands
nnoremap <Esc><Esc> :noh<CR>
nnoremap <Space>w :<C-u>w<CR>
nnoremap <Space>q :<C-u>q<CR>
nnoremap <Space>Q :<C-u>q!<CR>

"補完
inoremap <C-Space> <C-x><C-o>

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

"vimgrep shortcut
nnoremap [q :cprevious<CR>    "前へ
nnoremap ]q :cnext<CR>        "次へ
nnoremap [Q :<C-u>cfirst<CR>  "最初へ
nnoremap ]Q :<C-u>clast<CR>   "最後へ

"filepath expr
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"scripts
source $VIMRUNTIME/macros/matchit.vim


"""Plugins"""

"Unite.vim
nnoremap sb :Unite buffer<CR>

"NERDTree
let g:NERDTreeShowBookmarks=1
let NERDTreeWinSize=35
autocmd vimenter * NERDTree
