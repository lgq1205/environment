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

Bundle 'mbbill/fencview'
Bundle 'vim-scripts/taglist.vim'
Bundle 'a.vim'
Bundle 'uarun/vim-protobuf'

Bundle 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on


"""""setting"""""

set background=dark
colorscheme monokai

" 不要使用vi的键盘模式，而是vim自己的 
set nocompatible 
" 显示命令提示
set showcmd
" 语言色彩
syntax enable
" 语法高亮 
syntax on 
" 去掉输入错误的提示声音 
set noeb 
" 在处理未保存或只读文件的时候，弹出确认 
set confirm 
" 自动缩进 
set autoindent 
" 使用c语言的缩进
set cindent 
" Tab键的宽度 
set tabstop=4 
" 统一缩进为4 
set softtabstop=4 
set shiftwidth=4 
" tab转空格
set expandtab
" 空格转tab     
"set noexpandtab
" 删除空格=删除tab
set sts=4
" 显示行号
set number 
" 历史记录数 
set history=1000
" 搜索忽略大小写 
set ignorecase 
" 搜索逐字符高亮 
set hlsearch 
" 忽略大小写搜索
set incsearch 
" 高亮显示匹配的括号
set showmatch
" 关闭遇到错误时的声音提示
set noerrorbells


"""""encoding"""""

"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"""""map"""""

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let mapleader='\'

map <leader>t :Tlist<cr>

"删除行尾空格
map <leader>d :%s/\s\+$//<cr>

set pastetoggle=<F3>


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

autocmd BufNewFile,BufRead *.proto setfiletype proto
autocmd FileType proto set expandtab
