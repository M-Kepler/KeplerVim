
" 让vim可以使用系统的剪切板
set clipboard=unnamed

let mapleader=";"

"-------- -------- -------- -------- -------- --------
                    "fugitive
"Gstatus git status
"Gcommit git commit
"Gdiff   git diff
"Glog    git log
"Gread   git checkout file_name
"Gwrite  git add file_name
"Gmove   git mv
"Gremove git rm



"-------- -------- -------- -------- -------- --------
                    "easy-motion
"-------- -------- -------- -------- -------- --------
let g:EasyMotion_leader_key = '<Leader>'


"-------- -------- -------- -------- -------- --------
                    "Syntastic
"-------- -------- -------- -------- -------- --------

let g:syntastic_error_symbol='e>'
let g:syntastic_warning_symbol='w>'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_w=0
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=6

let g:syntastic_python_checkers=['pyflakes']

nmap <Leader>e :Errors<cr>
nmap <Leader>c :lclose<cr>
nmap <Leader>n :lnext<cr>
nmap <Leader>p :lpre<cr>


"-------- -------- -------- -------- -------- --------
                    "Fold
"-------- -------- -------- -------- -------- --------
set foldenable
set foldmethod=syntax
set foldcolumn=0
setlocal foldlevel=1
set foldclose=all
set foldlevelstart=99
set foldopen-=search
set foldopen-=undo

nnoremap <Space> @=((foldclosed(line('.'))<0)?'zc':'zo')<cr>

" zm 折叠全部
" zc 打开全部折叠



" to deal with it's slow when I swith insert to normal
set ttimeoutlen=0

"-------- -------- -------- -------- -------- --------
                    "title
"-------- -------- -------- -------- -------- --------
function AddTitle()
    call append(0,"/***********************************************************")
    call append(1,"* Author       : M_Kepler")
    call append(2,"* EMail        : hellohuangjinjie@gmail.com")
    call append(3,"* Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(4,"* Filename     : ".expand("%:t"))
    call append(5,"* Description  :")
    call append(6,"**********************************************************/")
    call append(7,"")
    echohl WarningMsg | echo "Successful in adding the copyright."|echohl None
endfunction
" update latest modified time & name
function UpdateTitle()
    normal m'
    execute '/* Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
    normal ''
    normal mk
    execute '/* Filename     :/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
" 判断前10行代码里，是否有Last modified
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

map <C-i> :call TitleDet() <cr>'s



source ~/.vim/bundles.vim

"set windows size
set lines =28 columns=86
winpos 200 100

set nobackup
set nowb
set noswapfile

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1


"-------- -------- -------- -------- -------- --------
                    " Vim UI
"-------- -------- -------- -------- -------- --------
syntax enable

" set background=dark
" colorscheme atom-dark-256
colorscheme molokai
let g:Powerline_colorscheme='solarized256'

" set background=dark


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
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
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
" Plugin 'iamcco/markdown-preview.vim'
" set chrome path
let g:mkdp_path_to_chrome = "google-chrome"
" 设置不自动打开chrome预览
let g:mkdp_auto_start = 0
" set to 1: 检查预览窗口是否打开，否则自动打开
let g:mkdp_auto_open = 0
" 在切换buffer的时候自动关闭预览窗口
let g:mkdp_auto_close = 1
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

    let g:tagbar_type_markdown = {
                \ 'ctagstype' : 'markdown',
                \ 'sort' : 0,
                \ 'kinds' : [
                \ 'h:sections'
                \ ]
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
" HTML5标签
let g:user_emmet_expandabbr_key='<C-j>'



" powerline " air-line

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)


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
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

nmap <Leader>tg :TagbarToggle<cr>
nmap <Leader>tn :NERDTreeToggle<cr>
" buffer 切换快捷键
map <Leader>bl :MBEToggle<cr>
noremap <C-Tab> :MBEbn<CR>
noremap <C-S-Tab> :MBEbp<CR>
noremap <Leader>fw :MBEbn<CR>
noremap <Leader>bw :MBEbn<CR>

" 文件撤销、重做
nmap <Leader>u :GundoToggle<cr>

" 垂直对齐线IndentGuidesToggle<cr>
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1

nmap <D-/> :
nnoremap <leader>a :Ack
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
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'fortran'
        exec "!gfortran % -o %<"
        exec "! ./%<"
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
                "C,C++,Fortran,Python,java,Latex,sh等按F6编译但是一般不要求运行
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
map <C-r> :call Rungdb()<CR>
func! Rungdb()
    :cd %:p:h
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


"-------- -------- -------- -------- -------- --------
                    " Useful Functions
"-------- -------- -------- -------- -------- --------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

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

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa "退出全部窗口
:command QA qa


" Plugin 'Valloric/YouCompleteMe'

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
" 引入 C++ 标准库tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
set tags+=~/.vim/stdcpp.tags
set tags+=~/.vim/sys_tags
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

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap gd :YcmCompleter GoTo<CR>

"-------- -------- -------- -------- -------- --------
                " .cpp 和 .h间切换
"-------- -------- -------- -------- -------- --------
" Plugin 'SirVer/ultisnips'
nmap <silent> <Leader>sw :FSHere<cr>
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<Leader><s-tab>"

