set nocompatible " 关闭 vi 兼容模式
set mouse=a " 允许使用鼠标
syntax on " 自动语法高亮
colorscheme molokai " 设定配色方案
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start" 不设定在插入状态无法用退格键和 Delete 键删除回车 "
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)

set t_Co=256 " vim 为 256 色
set background=dark " 背景色






filetype plugin off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-commentary'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'sheerun/vim-polyglot'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
call vundle#end()




filetype plugin indent on " 开启插件




noremap <C-b> <Esc>:w<cr> " 设置普通和可视模式保存快捷键
imap <C-b> <Esc>:w<cr> " 设置插入模式保存快捷键

noremap <C-g> <Esc>:q<cr> " 设置普通和可视模式退出快捷键
imap <C-g> <Esc>:q<cr> " 设置插入模式退出快捷键


" YouCompleteMe 自动补全配置


set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
let g:ycm_complete_in_comments = 1 "在注释输入中也能补全
let g:ycm_complete_in_strings = 1 "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处




" 以下为nerdtree配置


let NERDTreeShowLineNumbers=1 " 显示行号
let NERDTreeShowHidden=1 " 显示隐藏文件 不显示为0
autocmd vimenter * NERDTree " 默认启动NERDTree
let g:nerdtree_tabs_open_on_console_startup=1 " 在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']  " 忽略一下文件的显示
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " 当NERDTree为剩下的唯一窗口时自动关闭

noremap <F1> <Esc>:NERDTreeToggle<cr>" 普通和可视模式下F1快捷键打开关闭NERDTree
imap <F1> <Esc>:NERDTreeToggle<cr>" 插入模式下F1快捷键打开关闭NERDTree



" 以下是FZF配置
noremap <F3> <Esc>:FZF<cr> " 普通和可视模式下F3打开FZF搜索
imap <F3> <Esc>:FZF<cr> " 插入模式下F3打开FZF搜索




" 以下是autofarmat配置
au BufWrite * :Autoformat "保存时自动格式化代码，针对所有支持的文件
noremap <F4> <Esc>:Autoformat<cr> " 普通和可视模式下F4格式化代码
imap <F4> <Esc>:Autoformat<cr> " 插入模式下F4格式化代码
let g:formatdef_my_html = '"html-beautify -s 2"'
let g:formatters_html = ['my_html']



" 以下为关闭鼠标和行号的配置
noremap <F5> <Esc>:set nonu<cr><Esc>:set mouse=<cr> " 普通和可视模式下F5取消鼠标和行号
imap <F5> <Esc>:set nonu<cr><Esc>:set mouse=<cr> " 插入模式下F5取消鼠标和行号



" 以下为开启鼠标和行号的配置
noremap <F6> <Esc>:set number<cr><Esc>:set mouse=a<cr> " 普通和可视模式下F6增加鼠标和行号
imap <F6> <Esc>:set number<cr><Esc>:set mouse=a<cr> " 插入模式下F6增加鼠标和行号






