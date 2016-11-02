" https://segmentfault.com/a/1190000003962806
"
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
""""""""""""""""""""YouCompleteMe配置"""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf='/root/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0
let g:ycm_key_invoke_completion='<C-/>'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_semantic_triggers = {
  \     'c' : ['->', '  ', '.', ' ', '(', '[', '&'],
  \     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
  \     'perl' : ['->', '::', ' '],
  \     'php' : ['->', '::', '.'],
  \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \     'ruby' : ['.', '::'],
  \     'lua' : ['.', ':']
  \ }
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
" colors zenburn
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
""""""""""""""""""""NERD_TREE配置"""""""""""""""""""""""""
map <leader>nt :NERDTreeToggle<CR>
imap <leader>nt <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/html5.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                    "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Windo =1                "在左侧窗口中显示taglist窗口
nnoremap <leader>tl :TlistToggle<CR>



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""My Custom Configuration"""""""""""""""""""""""""
syntax enable 
syntax on

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set cindent
set hlsearch

set encoding=utf-8
set fileencodings=utf-8,gb2312,cp936,latin1
set fileencoding=utf-8
set termencoding=utf-8
set ambiwidth=double

" vim菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" vim提示信息乱码决
language messages zh_CN.utf-8

" 自动改变VIM当前目录为打开的文件所在目录
set autochdir
" 自动保存
set autowrite
" 突出显示当前行
" set cursorline
set magic
" 关闭错误提示音
set noeb
" 在处理未保存或只读文件时，弹出确认
set confirm
" 历史记录数
set history=1000
" 不生成临时文件
set nobackup
set noswapfile
" 设置状态行显示的内容
"set statusline=%F%m%r%h%w\[FORMAT=%{&ff}]\[TYPE=%Y]\[POS=%|,%v][%p%%]\ %{strftime(\"%d/%m/%y\-\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%|/%L,Column:%c][%p%%]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{fugitive#statusline()} " Git Hotness
"" 总是显示状态行
set laststatus=2
set cmdheight=2
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 高亮显示匹配的括号
set showmatch
set matchtime=1
" 光标移动到buffer顶部和底部时保持3行距离
set scrolloff=3
" 显示标尺
set ruler
set textwidth=79

" vim提示信息乱码解决
language messages zh_CN.utf-8

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

au BufNewFile,BufRead *.vue
\ set filetype=html |
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

if has('gui_running')
  set background=dark
"  colorscheme solarized
else
"  colorscheme desert
"  colorscheme evening
  colorscheme slate
endif

call togglebg#map("<F5>")

set nu
set clipboard=unnamed

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.py文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: bill_law6") 
        call append(line(".")+2, "\# mail: bill_law6@163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: bill_law6") 
        call append(line(".")+2, "\# mail: bill_law6@163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "#include<iostream>")
        call append(line(".")+6, "using namespace std;")
        call append(line(".")+7, "")
    endif
    if &filetype == 'c'
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: bill_law6") 
        call append(line(".")+2, "\# mail: bill_law6@163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "#include<stdio.h>")
        call append(line(".")+6, "")
    endif
    if &filetype == 'python'
        call setline(1,"\#!/usr/bin/env python") 
        call append(line("."), "\# -*- coding: utf8 -*-")
        call append(line(".")+1, "\# File Name: ".expand("%")) 
        call append(line(".")+2, "\# Author: bill_law6") 
        call append(line(".")+3, "\# mail: bill_law6@163.com") 
        call append(line(".")+4, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+5, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 



" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost *
		\ if expand("<afile>:p:h") !=? $TEMP |
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\ let JumpCursorOnEdit_foo = line("'\"") |
		\ let b:doopenfold = 1 |
		\ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
		\ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
		\ let b:doopenfold = 2 |
		\ endif |
		\ exe JumpCursorOnEdit_foo |
		\ endif |
		\ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
		\ if exists("b:doopenfold") |
		\ exe "normal zv" |
		\ if(b:doopenfold > 1) |
		\ exe "+".1 |
		\ endif |
		\ unlet b:doopenfold |
		\ endif
augroup END

"filetype on


"noremap是不会递归的映射 (大概是no recursion)
"例如
"noremap Y y
"noremap y Y
"不会出现问题
"
"前缀代表生效范围
"inoremap就只在插入(insert)模式下生效
"vnoremap只在visual模式下生效
"nnoremap就在normal模式下(狂按esc后的模式)生效
"这样可以减少快捷键所用到的键位组合的个数
"一个组合可以有多种用途 就不用费劲心思思考 该映射哪个没被绑定过的键了 

