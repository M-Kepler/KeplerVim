
"  _  __          _                    __     ___
" | |/ /___ _ __ | | ___ _ __          \ \   / (_)_ __ ___
" | ' // _ \ '_ \| |/ _ \ '__|  _____   \ \ / /| | '_ ` _ \ 
" | . \  __/ |_) | |  __/ |    |_____|   \ V / | | | | | | |
" |_|\_\___| .__/|_|\___|_|               \_/  |_|_| |_| |_|
"          |_|

let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'


python << EOF
import time
import vim
def SetBreakpoint():
    nLine = int( vim.eval( 'line(".")'))
    strLine = vim.current.line
    i = 0
    strWhite = ""
    while strLine[i] == ' ' or strLine[i] == "\t":
        i += 1
        strWhite += strLine[i]
    vim.current.buffer.append(
    # "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
       "%(space)sipdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)
    for strLine in vim.current.buffer:
        # if strLine == "import pdb":
        if strLine == "import ipdb":
            break
        else:
            # vim.current.buffer.append( 'import pdb', 0)
            vim.current.buffer.append( 'import ipdb', 0)
            vim.command( 'normal j1')
            break
vim.command( 'map <C-d> :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    nCurrentLine = int( vim.eval( 'line(".")'))
    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == 'import pdb' or strLine.lstrip()[:15] == 'pdb.set_trace()':
            nLines.append( nLine)
        nLine += 1
    nLines.reverse()
    for nLine in nLines:
        vim.command( 'normal %dG' % nLine)
        vim.command( 'normal dd')
        if nLine < nCurrentLine:
            nCurrentLine -= 1
    vim.command( 'normal %dG' % nCurrentLine)
vim.command( 'map <C-F8> :py RemoveBreakpoints()<cr>')
# vim.command( 'map <C-D> :!python %<cr>')
EOF


" let g:vebugger_leader = ','

syntax on
" set wildmenu ?

" 让vim可以使用系统的剪切板
set clipboard=unnamed

" 自动设当前编辑文件所在目录为当前工作目录
" set autochdir

let mapleader=";"


" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {}<ESC>i
" inoremap < <><ESC>i

" -------- -------- -------- -------- -------- --------
" python with virtualenv support
" -------- -------- -------- -------- -------- --------
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    '''
    add this
    '''
    sys.path.insert(0,project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF



" -------- -------- -------- -------- -------- --------
                "  auto add head info
" -------- -------- -------- -------- -------- --------
function HeaderPython()
    call setline(1, "# !/usr/bin/env python")
    call append(1, "# _*_ coding:utf-8")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()


" -------- -------- -------- -------- -------- --------
                "窗口分割
"-------- -------- -------- -------- -------- --------
set splitbelow
set splitright

" -------- -------- -------- -------- -------- --------
                "翻译
"-------- -------- -------- -------- -------- --------
nmap <silent> <Leader>fy <Plug>DictSearch



" -- 普通模式下，<Leader>d 即可翻译光标下的文本，并在命令行回显
vmap <silent> <Leader>fy <Plug>DictVSearch
" -- 可视化模式下，<Leader>d 即可翻译选中的文本，并在命令行回显
" nmap <silent> <Plug>DictWSearch
" -- 普通模式下，<Leader>w 即可翻译光标下的文本，并且在Dict新窗口显示
" vmap <silent> <Plug>DictWVSearch
" -- 可视化模式下，<Leader>w 即可翻译选中的文本，并且在Dict新窗口显示
" -- :Dict word 在命令行回显
" -- :DictW word 在一个分割窗口中显示


"-------- -------- -------- -------- -------- --------
                    "fugitive
"-------- -------- -------- -------- -------- - -------
"Gstatus git status
"Gcommit git commit
"Gdiff   git diff
"Glog    git log
"Gread   git checkout file_name
"Gwrite  git add file_name
"Gmove   git mv
"Gremove git rm


"-------- -------- -------- -------- -------- --------
                    "autospace
"设置= + - * 前后自动插入空格
"-------- -------- -------- -------- -------- --------
au FileType python inoremap <buffer>, ,<space>
let g:equ=1
if exists("g:equ")
    :inoremap << <c-r>=EqualSign('<<')<CR>
    :inoremap >> <c-r>=EqualSign('>>')<CR>
    :inoremap + <c-r>=EqualSign('+')<CR>
    :inoremap - <c-r>=EqualSign('-')<CR>
    " :inoremap * <c-r>=EqualSign('*')<CR>
    :inoremap = <c-r>=EqualSign('=')<CR>
    :inoremap += <c-r>=EqualSign('+=')<CR>
endif


function! EqualSign(char)
    if a:char =~ '=' && getline('.') =~ ".*("
        return a:char
    endif
    let ex1 = getline('.')[col('.') - 3]
    let ex2 = getline('.')[col('.') - 2]
    if ex1 =~ "[-=+><>\/\*]"
        if ex2 !~ "\s"
            return "\<ESC>i".a:char."\<SPACE>"
        else
            return "\<ESC>xa".a:char."\<SPACE>"
        endif
    else
        if ex2 !~ "\s"
            return "\<SPACE>".a:char."\<SPACE>\<ESC>a"
        else
            return a:char."\<SPACE>\<ESC>a"
        endif
    endif
endf




"-------- -------- -------- -------- -------- --------
"easy-motion
"-------- -------- -------- -------- -------- --------
"
let g:EasyMotion_leader_key = '<Leader>'




"-------- -------- -------- -------- -------- --------
                    "ALE
"-------- -------- -------- -------- -------- --------
" "ale
" "始终开启标志列
" let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 0
" "自定义error和warning图标
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning='⚠'
" "在vim自带的状态栏中整合ale
" let g:ale_statusline_format = ['✗ %d', '⚠ %d', '✔ OK']
" "显示Linter名称,出错或警告等相关信息
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
" nmap sp <Plug>(ale_previous_wrap)
" nmap sn <Plug>(ale_next_wrap)
" "<Leader>s触发/关闭语法检查
" nmap <Leader>s :ALEToggle<CR>
" "<Leader>d查看错误或警告的详细信息
" nmap <Leader>d :ALEDetail<CR>
"
"

"-------- -------- -------- -------- -------- --------
                    "Syntastic
"-------- -------- -------- -------- -------- --------

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" 第一时间检查发现任何错误
let g:syntastic_aggregate_errors=1
" 自动调用:syntasticsetloclist, 将错误覆盖"qiuckfix"
let g:syntastic_always_populate_loc_list=1

" 打开文件或保存时显示错误提示
" let g:syntastic_check_on_open=1
let g:syntastic_check_on_w=1
"
" 是否自动弹出关闭错误窗口
let g:syntastic_auto_loc_list=1
" 自动跳转到地一个错误或警告处
let g:syntastic_auto_jump = 1

" 鼠标悬停显示错误
let g:syntastic_enable_balloons=1
let g:syntastic_loc_list_height=5

" vim-quick python代码检查插件
let g:pyflakes_use_quickfix=1
" let g:syntastic_python_checkers= ['pyflakes']

" let g:syntastic_cpp_include_dirs= ['/usr/include/']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_checkers= ['gcc']
let g:syntastic_cpp_compiler= 'gcc'
let g:syntastic_cpp_compiler_options= '-std=c++11'


nmap <Leader>e :lopen<cr>
nmap <Leader>c :lclose<cr>
nmap <Leader>n :lnext<cr>
nmap <Leader>p :lpre<cr>


"=========================折叠================================
"开启折叠，并设置空格开关
set foldenable
set foldmethod=indent
"设置折叠区宽度
set foldcolumn=0
"设置折叠层数
setlocal foldlevel=1
"设置自动关闭折叠
"set foldclose=all
"设置空格开关折叠
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
"设置刚开始时不自动折叠
set foldlevelstart=99
"搜索和undo时不展开设置好的折叠
set foldopen-=search
set foldopen-=undo

"设置竖直对齐线
" :set list lcs=tab:\¦\ 



" to deal with it's slow when I swith insert to normal
set ttimeoutlen=0


"-------- -------- -------- -------- -------- --------
                    "title
"-------- -------- -------- -------- -------- --------
function AddTitle()
    call append(0,"/***********************************************************")
    call append(1,"* Author       : M_Kepler")
    call append(2,"* EMail        : m_kepler@foxmail.com")
    call append(3,"* Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(4,"* Filename     : ".expand("%:t"))
    call append(5,"* Description  :")
    call append(6,"**********************************************************/")
    call append(7,"")
    echohl WarningMsg | echo "Successful in adding the copyright."|echohl None
endfunction

function UpdateTitle()
    normal m'
    execute '/* Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
    normal ''
    normal mk
    execute '/* Filename     :/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction

function TitleDet()
    let n=1
    while n < 10
        let line = getline(n)
        if line =~'^\*\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

nmap <leader>i :call TitleDet() <CR>






source ~/.vim/bundles.vim

"set windows size
set lines =25 columns=80
" set lines =31 columns=110
winpos 200 100

set nobackup
set nowb
set noswapfile
" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

"-------- -------- -------- -------- -------- --------
                    " ColorScheme "按<Leader>yy键依次修改颜色主题
"-------- -------- -------- -------- -------- --------
" set background=light
set background=dark

colorscheme default
" colorscheme tir_black
" colorscheme space-vim-dark
"
" colorscheme molokai
" colorscheme atom-dark-256
" colorscheme dracula
" colorscheme railscasts
" colorscheme desert

let python_hithlight_all=1
let g:csnum = 0

"定义全局变量用于切换颜色主题"
map <Leader>yy :call ChangeColorScheme()<CR>
function! ChangeColorScheme()
    if g:csnum == 0
        :colorscheme torte
        :let g:csnum = 1
    elseif  g:csnum == 1
        :colorscheme murphy
        :let g:csnum = 2
    elseif  g:csnum == 2
        :colorscheme desert
        :let g:csnum = 3
    elseif  g:csnum == 3
        :colorscheme murphy
        :let g:csnum = 4
    elseif  g:csnum == 4
        :colorscheme delek
        :let g:csnum = 5
    elseif  g:csnum == 5
        :colorscheme elflord
        :let g:csnum = 6
    elseif  g:csnum == 6
        :colorscheme evening
        :let g:csnum = 7
    elseif  g:csnum == 7
        :colorscheme koehler
        :let g:csnum = 8
    " elseif  g:csnm == 9
        " :colorscheme dracula
    else
        :colorscheme default
        :let g:csnum = 0
    endif
endfunction


"-------- -------- -------- -------- -------- --------
                    " Air-line
"-------- -------- -------- -------- -------- --------
let g:airline_powerline_fonts=1
let g:airline_theme='light'
" let g:airline_theme='behelit'

" 显示上面的buffer tab
let g:airline#extensions#tabline#enabled = 1
"
"-------- -------- -------- -------- -------- --------
                    " buffer
"-------- -------- -------- -------- -------- --------
nnoremap <Leader>bn :bn<cr>
nnoremap <Leader>bp :bp<cr>
" nnoremap <Leader>bc :bd<cr>
nnoremap <Leader>x :bd<cr>
" nnoremap <Leader>tn :tabnew<cr>
nnoremap <Leader>1 :b1<cr>
nnoremap <Leader>2 :b2<cr>
nnoremap <Leader>3 :b3<cr>
nnoremap <Leader>4 :b4<cr>

"-------- -------- -------- -------- -------- --------
                    " quickfix
"-------- -------- -------- -------- -------- --------





" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search
set incsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set history=1000
set nocompatible
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set relativenumber
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=1                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
" set relativenumber

" Default Indentation

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on
filetype plugin on
filetype indent on
set autoindent
set cindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width

"set textwidth=79
"set smarttab
set expandtab       " expand tab to space


"-------- -------- -------- -------- -------- --------
                    "vim-markdown
"-------- -------- -------- -------- -------- --------
" set chrome path
let g:mkdp_path_to_chrome = "google-chrome"
" 设置不自动打开chrome预览
let g:mkdp_auto_start = 0
" set to 1: 检查预览窗口是否打开，否则自动打开
let g:mkdp_auto_open = 0
" 在切换buffer的时候自动关闭预览窗口
let g:mkdp_auto_close = 0
" real-time preview
let g:mkdp_refresh_slow = 0

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"


"----------------- ----------------- ----------------- -----------------
                    " Rainbow parentheses for Lisp and variants
"----------------- ----------------- ----------------- -----------------
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white


" Tagbar
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" tag for markdown
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'sort' : 0,
            \ 'kinds' : [
            \ 'h:sections'
            \ ]
            \ }
let g:tagbar_type_html = {
            \ 'ctagstype' : 'html',
            \ 'kinds' : [
            \ 'i:identifiers',
            \ 'c:classes',
            \ ],
            \ }

" tag for coffee
if executable('coffeetags')
	let g:tagbar_type_coffee = {
                \ 'ctagsbin' : 'coffeetags',
                \ 'ctagsargs' : '',
                \ 'kinds' : [
                \ 'f:functions',
                \ 'o:object',
                \ ],
                \ 'sro' : ".",
                \ 'kind2scope' : {
                \ 'f' : 'object',
                \ 'o' : 'object',
                \ }
                \ }

endif

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "left"
let NERDTreeAutoDeleteBuffer=1
"

" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
" Emmet
" let g:user_emmet_expandabbr_key='<C-j>'
let g:user_emmet_expandabbr_key='<Leader>h'


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'

" SuperTab
" let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

"-------- -------- -------- -------- -------- --------
                    " ctrlp
"-------- -------- -------- -------- -------- --------
let g:ctrlp_map = '<Leader>o'
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Keybindings for plugin toggle
"绑定快捷键来激活or取消paste模式
" nnoremap <F9> :set invpaste paste?<CR>
nnoremap <Leader>p :set invpaste paste?<CR>
set pastetoggle=<F9>

"目录树和代码结构
nmap <Leader>tg :TagbarToggle<cr>
nmap <Leader>tn :NERDTreeToggle<cr>

" 文件撤销、重做
nmap <Leader>u :GundoToggle<cr>


" 垂直对齐线IndentGuidesToggle<cr>
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
" let g:indent_guides_auto_colors=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg = red   ctermbg = 3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg = green ctermbg = 4

nmap <D-/> :
nnoremap <leader>a :Ack -i<space>
nnoremap <leader>v V`]



"-------- -------- -------- -------- -------- --------
"C,C++,Fortran,Python,java,Latex,sh等按<F5>编译运行
"-------- -------- -------- -------- -------- --------
map <F5> :call CompileAndRun()<CR>
func! CompileAndRun()
    :cd %:p:h
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'ncl'
        exec "!ncl %"
    elseif &filetype == 'html'
        exec "!google-chrome %"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'fortran'
        exec "!gfortran % -o %<"
        exec "! ./%<"
    elseif &filetype == 'python'
        exec "!python3 %"
    elseif &filetype == 'markdown'
        :MarkdownPreview
    elseif &filetype == 'tex'
        exec "!xelatex -shell-escape %<"
        exec "!xelatex -shell-escape %<"
    elseif &filetype == 'sh'
        :!sh ./%
    endif
endfunc

"-------- -------- -------- -------- -------- --------
                "C,C++,Fortran,Python,java,Latex,sh等
                "按F6编译但是一般不要求运行
"-------- -------- -------- -------- -------- --------
map <F6> :call CompileALL()<CR>
func! CompileALL()
    :cd %:p:h
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
    elseif &filetype == 'ncl'
        exec "!ncl %"
    elseif &filetype == 'java'
        exec "!javac %"
    elseif &filetype == 'fortran'
        exec "!gfortran % -o %<"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'tex'
        exec "!xelatex -shell-escape %<"
        exec "!xelatex -shell-escape %<"
    elseif &filetype == 'sh'
        :!sh ./%
    endif
endfunc


"-------- -------- -------- -------- -------- --------
                    "C,C++的调试<F10>
"-------- -------- -------- -------- -------- --------
"
map <C-r> :call Rungdb()<CR>
func! Rungdb()
    :cd %:p:h
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


"-------- -------- -------- -------- -------- --------
                    " Asyncrun.vim
"-------- -------- -------- -------- -------- --------
" 编译
" :noremap <F7> :AsyncRun gcc "%" -o "%<" <cr>


"-------- -------- -------- -------- -------- --------
                    " Useful Functions
"-------- -------- -------- -------- -------- --------
" easier navigation between split windows
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
nnoremap <Leader>wj <c-w>j
nnoremap <Leader>wk <c-w>k
nnoremap <Leader>wh <c-w>h
nnoremap <Leader>wl <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
            \ if ! exists("g:leave_my_cursor_position_alone") |
            \     if line("'\"") > 0 && line ("'\"") <= line("$") |
            \         exe "normal g'\"" |
            \     endif |
            \ endif
"
" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Quickly Edit File
nmap <silent> <leader>td :e ~/workspaces/todo.md<CR>

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa "退出全部窗口
:command QA qa


"-------- -------- -------- -------- -------- --------
                    " YouCompleteMe
"-------- -------- -------- -------- -------- --------

" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags //于4月21更改于此
set tags+=/data/misc/software/misc./vim/stdcpp.tags
set tags+=~/.vim/stdcpp.tags
set tags+=~/.vim/sys_tags
"
"使用syntastic检查语法
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_error_symbol='✗'
let g:ycm_warning_symbol='⚠'
"
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1



" 跳转到声明
nnoremap <Leader>gl :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
" 跳转到定义
nnoremap <Leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gd :YcmCompleter GoTo<CR>
nnoremap gd :YcmCompleter GoTo<CR>

"-------- -------- -------- -------- -------- --------
                " ultisnips
"可.cpp 和 .h间切换
"-------- -------- -------- -------- -------- --------
let g:UltiSnipsSnippetDir = ["~/.vim/budle/UltiSnips"]
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<Leader><s-tab>"


" -------- -------- -------- -------- -------- --------
                    "  tasklist.vim
" -------- -------- -------- -------- -------- --------
nnoremap <Leader>tl :TaskList<cr>


"-------- -------- -------- -------- -------- --------
                " rainbow
"-------- -------- -------- -------- -------- --------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


let tlist_html_settings = 'html;h:Headers;o:Objects(ID);c:Classes'
let tlist_xhtml_settings = 'html;h:Headers;o:Objects(ID);c:Classes'
