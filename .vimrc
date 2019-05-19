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
 NeoBundle 'Shougo/neocomplete.vim'
 NeoBundle 'mattn/webapi-vim'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'vim-jp/vimdoc-ja'
 NeoBundle 'simeji/winresizer'
 NeoBundle 'vim-scripts/taglist.vim'
 NeoBundle 'szw/vim-tags'
 NeoBundle 'nginx.vim'
 NeoBundle 'digitaltoad/vim-pug'
 NeoBundle 'leafgarland/typescript-vim'
 NeoBundle 'pathogen.vim'
 NeoBundle 'kchmck/vim-coffee-script'
 NeoBundle 'ctrlpvim/ctrlp.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 call pathogen#infect()
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
set encoding=utf-8


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

set wildignore+=node_modules/**

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

"Neocomplete
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" taglist
set tags=tags
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Horiz_Window = 1

" nginx
au BufRead,BufNewFile /usr/local/etc/nginx* set ft=nginx

