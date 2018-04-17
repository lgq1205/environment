
"""""vundle"""""

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Bundle 'sickill/vim-monokai'
Bundle 'tomasr/molokai'

Bundle 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist)$'

Bundle 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

"Bundle 'mbbill/fencview'

call vundle#end()
filetype plugin indent on


"""""setting"""""

syntax enable
set background=dark
colorscheme monokai

set nu
set ts=4
set sw=4
set st=4
set hlsearch
set incsearch

"""""encoding"""""

"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"""""map"""""

let mapleader='\'

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>t :Tlist<cr>


"""""plugin"""""

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
" 不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Show_One_File = 1
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
" 在右侧窗口中显示taglist窗口
"let Tlist_Use_Right_Window = 1
" 自动打开Tlist
"let Tlist_Auto_Open = 1
"let Tlist_WinWidth=30


" 保留上次打开的位置
autocmd BufReadPost *
    \ if line("'\"")>0&&line("'\"")<=line("$") |
    \   exe "normal g'\"" |
    \ endif

