if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""vundle"""""

call plug#begin('~/.vim/plugged')

Plug 'sickill/vim-monokai'

Plug 'vim-scripts/taglist.vim'

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" 自动识别文件的编码格式
"Plug 'mbbill/fencview'
Plug 'vim-scripts/a.vim'
"protobuf格式高亮
Plug 'uarun/vim-protobuf'

"状态栏
Plug 'vim-airline/vim-airline'
"快速注释
Plug 'scrooloose/nerdcommenter'
"快速搜索
Plug 'mileszs/ack.vim'
"文件/函数名/搜索
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

"vim本地diff
Plug 'mhinz/vim-signify'
"vim 内嵌svn命令
Plug 'vim-scripts/vcscommand.vim'
" clang-format 格式化代码，需要配合安装clang-format 
Plug 'rhysd/vim-clang-format'
"  
Plug 'kana/vim-operator-user'

Plug 'mbbill/echofunc'



if has('nvim')
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

call plug#end()

filetype plugin indent on


"""""""""""""""""
"""""setting"""""
"""""""""""""""""
"set background=dark
colorscheme monokai
"set term=screen

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
set tabstop=2
" 统一缩进
set softtabstop=2
set shiftwidth=2
" tab转空格
set expandtab
" 空格转tab
"set noexpandtab
" 删除空格=删除tab
"set sts=4
" 显示相对行号
"set rnu
" 显示行号
set nu
" 历史记录数
set history=10000
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
" 显示tab和末尾空格
set listchars=tab:>-,trail:-
"set list
"关闭错误提示音
set noerrorbells
"错误闪烁代替响铃
"set visualbell
set colorcolumn=121



""""""""""""""""""
"""""encoding"""""
""""""""""""""""""
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1



"""""""""""""
"""""map"""""
"""""""""""""
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

let mapleader=','

"map <leader>t :Tlist<cr>
map <leader>t :LeaderfFunction<cr>
"map <leader>n :NERDTreeToggle<CR>
"map <leader>f :LeaderfFile<cr> " default is leader + f
"map <leader>d :%s/\s\+$//<cr>
"set pastetoggle=<F3>

noremap <c-n> :NERDTreeToggle<CR>
"noremap <c-p> :LeaderfFile<cr>
"noremap <c-m> :LeaderfFunction<cr>




""""""""""""""""""""""""""""""""""
""""""""" LeaderF """"""""""""""""
""""""""""""""""""""""""""""""""""
"let g:Lf_WindowPosition='left' " 'fullScreen', 'top', 'bottom', 'left', 'right'
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': ['s[km]_*','*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}





"""""""""""""""""
""""" ctrlp """""
"""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist)$'





""""""""""""""""""""""""
""""" clang-format """""
""""""""""""""""""""""""
"base style. llvm, google, chromium, mozilla is supported
let g:clang_format#code_style = "google"
"When this variable's value is 1, vim-clang-format automatically detects the style file like .clang-format or _clang-format and applies the style to formatting.
let g:clang_format#detect_style_file = 1
"When the value is 1, a current buffer is automatically formatted on saving the buffer. Formatting is executed on BufWritePre event.
"let g:clang_format#auto_format = 1
"When the value is 1, inserted lines are automatically formatted on leaving insert mode. Formatting is executed on InsertLeave event.
"let g:clang_format#auto_format_on_insert_leave = 1

let g:clang_format#style_options = {
      \ "ColumnLimit": 120,
      \ "AlignAfterOpenBracket": "AlwaysBreak",
      \ "BinPackParameters": "false",
      \ "AllowAllParametersOfDeclarationOnNextLine": "false",
      \ "AllowShortFunctionsOnASingleLine": "false"}

" map to <Leader>cf
autocmd FileType c,cpp,objc,proto nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,proto vnoremap <buffer><Leader>cf :ClangFormat<CR>





""""""""""""""""""""""""""""""
""""" Tag list (ctags) """""""
""""""""""""""""""""""""""""""
" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
" 在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1
" 自动打开Tlist
"let Tlist_Auto_Open = 1
"let Tlist_WinWidth=50





""""""""""""""
""""" ag """""
""""""""""""""
let g:ag_prg="ag --column"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>






""""""""""""""""""
""""" autocmd """"
""""""""""""""""""
" 保留上次打开的位置
autocmd BufReadPost *
        \ if line("'\"")>0&&line("'\"")<=line("$") |
        \   exe "normal g'\"" |
        \ endif

autocmd BufNewFile,BufRead *.proto setfiletype proto
autocmd FileType proto set expandtab

" 绑定=号格式化 
autocmd FileType c,cpp,objc,proto map <buffer> = <Plug>(operator-clang-format)





"""""""""""""""""""""""""""""
""""""""" NERDTree """"""""""
"""""""""""""""""""""""""""""
" 自动关闭最后一个窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif





""""""""""""""""""""""""""""""""""""
""""""""""" AddAuthor """"""""""""""
""""""""""""""""""""""""""""""""""""
"map <F4> ms:call AddAuthor()<cr>'S

autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call AddAuthor()"

function AddAuthor()
    let n=1
    while n < 11
        let line = getline(n)
        if line=~'[#]*\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
        call UpdateTitle()
        return
    endif
    let n = n + 1
    endwhile
    if &filetype == 'sh'
        call AddTitleForShell()
    elseif &filetype == 'python'
        call AddTitleForPython()
    else
        call AddTitleForC()
    endif

endfunction

function UpdateTitle()
    normal m'
    execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal mk
    execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." |echohl None
endfunction

function AddTitleForC()
    call append(0,"/**********************************************************")
    call append(1," * Author        : vinceliang")
    call append(2," * Email         : liangguoqiu@gmail.com")
    call append(3," * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(4," * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(5," * Filename      : ".expand("%:t"))
    call append(6," * Description   : ")
    call append(7," * *******************************************************/")
    call append(8,"")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab mer MMERR("ERR:");<Left><Left><Left>
iab der MMDEBUG("ERR:");<Left><Left><Left>
iab rer RETURN_ON_ERROR(logger, iRet, "", iRet);<Esc>10<Left>
iab mlg MMBIZFuncLogHelper logger(__func__,);<Esc>1<Left>
iab irt int iRet = 0;<CR>return iRet;
iab llg MMBIZFuncLogHelper& logger = MMBIZFuncLogHelper::LastObj();<CR>
iab ber MMBIZERR(logger, "ERR: ret %d", iRet);<Esc>15<Left>
iab pu64 " PRIu64 "<Left><Esc>
iab roe RETURN_ON_ERROR(logger, 0 != iRet, "", iRet);<Esc>10<Left>
