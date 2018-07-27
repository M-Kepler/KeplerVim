set nocompatible               " be improved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" Bundle 'fholgado/minibufexpl.vim'
"
" ====================================================
"
"
"
" 快速打开文件，替换ctrlp
" Plugin 'Yggdroot/LeaderF'
Bundle 'ctrlpvim/ctrlp.vim'

"------------------
" Code Completions
"------------------
"neosnippet
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neosnippet'
"Bundle 'Shougo/neosnippet-snippets'


Plugin 'Valloric/YouCompleteMe'
" Plugin 'shougo/deoplete.nvim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " 这个是作为ultisnips的配置文件来的



"------------------
" HTML/CSS代码快速编写
"------------------
Bundle 'mattn/emmet-vim'

"------------------
"补全括号和引号
"------------------
" Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'

"------------------
" snippets
"------------------
Bundle 'garbas/vim-snipmate'
"Bundle 'honza/vim-snippets'
" ------ snipmate 依赖组件 ------
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
" 标签跳转，vim自带了%
" Bundle 'edsono/vim-matchit'
Bundle 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
Bundle 'tpope/vim-surround'
" 注释
Bundle 'scrooloose/nerdcommenter'
" 编辑当前文件的历史记录
Bundle 'sjl/gundo.vim'
" 对齐, 好像用处不大
" Bundle 'godlygeek/tabular'
" 缩进
Bundle 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
Bundle 'scrooloose/nerdtree'
" Bundle 'humiaozuzu/TabBar'
Bundle 'majutsushi/tagbar'
" 项目里全局搜索字符串
Bundle 'mileszs/ack.vim'
" Bundle 'dyng/ctrlsf.vim'
" Bundle 'tpope/vim-fugitive'

" Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
"
" 语法检查,ycm似乎自带了
" syntax check by :Error in vim
" Bundle 'scrooloose/syntastic'
" Bundle 'w0rp/ale'
" python语法检查
" python-mode
Bundle 'nvie/vim-flake8'

" 标记无效空格
Bundle 'bronson/vim-trailing-whitespace'

"-------------
" Other Utils
"-------------
" Bundle 'humiaozuzu/fcitx-status'
" Bundle 'nvie/vim-togglemouse'


				" Syntax/Indent for language enhancement
"------- web backend ---------
"Bundle '2072/PHP-Indenting-for-VIm'
"Bundle 'tpope/vim-rails'
"Bundle 'lepture/vim-jinja'
"Bundle 'digitaltoad/vim-jade'

				"------- web frontend ----------
Bundle 'InfoGeeker/html5.vim'
" Bundle 'tpope/vim-haml'
" Bundle 'pangloss/vim-javascript'
" Bundle 'kchmck/vim-coffee-script'
" Bundle 'nono/jquery.vim'
" Bundle 'groenewege/vim-less'
" Bundle 'wavded/vim-stylus'
" Bundle 'nono/vim-handlebars'

"------- markup language -------
Bundle 'tpope/vim-markdown'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'mzlogin/vim-markdown-toc'
" Bundle 'timcharper/textile.vim'

"------- Ruby --------
" Bundle 'tpope/vim-endwise'

"------- Go ----------
" Bundle 'fatih/vim-go'

"------- FPs ------
" 多彩括号
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'wlangstroth/vim-racket'
" Bundle 'vim-scripts/VimClojure'
" Bundle 'rosstimson/scala-vim-support'

"-------------- -------------- -------------- -------------- --------------
" Color Schemes
"-------------- -------------- -------------- -------------- --------------
Plugin 'crusoexia/vim-dracula'
" Plugin 'ciaranm/inkpot'
" Plugin 'jpo/vim-railscasts-theme'
" Plugin 'tir_black'

" -------------- -------------- -------------- -------------- --------------
" 翻译
Plugin 'iamcco/dict.vim'

" 异步运行
Plugin 'skywind3000/asyncrun.vim'

" todo fixme xxx
Plugin 'tasklist.vim'

" debug
" Plugin 'idanarye/vim-vebugger'


" 文字图标
Plugin 'ryanoasis/vim-devicons'




filetype plugin indent on     " required!

