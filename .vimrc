syntax on
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
set helplang=en

colorscheme desert

nnoremap <Space>w :<C-u>w<CR>
nnoremap <Space>q :<C-u>q<CR>
nnoremap <Space>Q :<C-u>q!<CR>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <Space>h ^
nnoremap <Space>l $

nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gi
nnoremap gk k
nnoremap gj j
vnoremap gk k
vnoremap gj j

nnoremap <Space>/ *<C-o>
nnoremap g<Space>/ g*<C-o>

nnoremap <silent> tt :<C-u>tabe<CR>
nnoremap <C-p> gT
nnoremap <C-n> gt
inoremap jk <Esc>
