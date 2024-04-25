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

colo liveme				"��ɫ����
"set enc=utf-8			"��������
"set fencs=utf-8,ucs-bom,shft-jis,gb18030,gbk,gb2312,cp936
"set langmenu=zh_CN.UTF-8	"���ò˵�����

set spell " Enable spell check

set number
set backspace=indent,eol,start
set ts=4
set expandtab
set list
set listchars=tab:->,space:~
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

set syntax=on			"�﷨����
set autoindent			"�Զ�����
set cindent				"c���Է�ʽ����
set smartindent			"��������
set softtabstop=4		"ͳһ����Ϊ 4
set shiftwidth=4

set cmdheight=2
"set lines=30 columns=82	"Ĭ�ϴ��ڴ�С
set wrap				"�Զ�����
set linebreak			"���ʻ���
set showmatch			"������ʾƥ�������
set hlsearch			"�������ַ�������ʵʱ����
set incsearch
set showmatch			"��ʾ����������
set fdm=indent			"�����۵�
set foldmethod=syntax	"�����۵�����
set foldlevel=100		"��ֹ�Զ��۵�

set history=1000
filetype on				"����ļ�����
filetype indent on
filetype plugin on
filetype plugin indent on

set iskeyword+=_,$,@,%,#,-			"�������·��ŵĵ��ʲ�Ҫ�����зָ�
set linespace=0						"�ַ���������������Ŀ

source $VIMRUNTIME/delmenu.vim		"����ɾ���˵��ű���ɾ������Ĳ˵�
source $VIMRUNTIME/menu.vim			"���������Ĳ˵��ű�

"language messages zh_CN.uft-8		"������ʾ��Ϣ����

set guifont=Monaco:h12:cANSI		"��������

"���ع��������ÿ�ݼ�F12�л�
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