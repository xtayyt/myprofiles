set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

colo liveme				"配色方案
"set enc=utf-8			"编码设置
"set fencs=utf-8,ucs-bom,shft-jis,gb18030,gbk,gb2312,cp936
"set langmenu=zh_CN.UTF-8	"设置菜单语言

set spell " Enable spell check

set number
set backspace=indent,eol,start
set ts=4
set expandtab
set list
set listchars=tab:->,space:~
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

set syntax=on			"语法高亮
set autoindent			"自动缩进
set cindent				"c语言方式缩进
set smartindent			"智能缩进
set softtabstop=4		"统一缩进为 4
set shiftwidth=4

set cmdheight=2
"set lines=30 columns=82	"默认窗口大小
set wrap				"自动换行
set linebreak			"整词换行
set showmatch			"高亮显示匹配的括号
set hlsearch			"搜索逐字符高亮和实时搜索
set incsearch
set showmatch			"显示括号配对情况
set fdm=indent			"代码折叠
set foldmethod=syntax	"代码折叠类型
set foldlevel=100		"禁止自动折叠

set history=1000
filetype on				"侦测文件类型
filetype indent on
filetype plugin on
filetype plugin indent on

set iskeyword+=_,$,@,%,#,-			"带有如下符号的单词不要被换行分割
set linespace=0						"字符间插入的像素行数目

source $VIMRUNTIME/delmenu.vim		"导入删除菜单脚本，删除乱码的菜单
source $VIMRUNTIME/menu.vim			"导入正常的菜单脚本

"language messages zh_CN.uft-8		"设置提示信息语言

set guifont=Monaco:h12:cANSI		"设置字体

"隐藏工具栏，用快捷键F12切换
set guioptions-=T
set guioptions-=m
map <silent> <F12> :if &guioptions =~# 'T' <Bar>
	\	set guioptions-=T <Bar>
	\	set guioptions-=m <Bar>
	\ else <Bar> 
	\	set guioptions+=T <Bar>
	\	set guioptions+=m <Bar>
	\ endif<CR>

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"if (g:iswindows && g:isGUI)
"    map <F10> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
"endif

map <C-\>p :NERDTreeToggle<CR>

let Tlist_Use_Right_Window=1
let Tlist_Use_SingleClick=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
map <C-\>l :TlistToggle<CR>

inoremap jj <ESC>

set noundofile
set nobackup
