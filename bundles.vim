set nocompatible               " be improved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" Bundle 'fholgado/minibufexpl.vim'

"------------------
" Code Completions
"------------------
"neosnippet
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neosnippet'
"Bundle 'Shougo/neosnippet-snippets'


Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " 这个是作为ultisnips的配置文件来的


Plugin 'iamcco/markdown-preview.vim'

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
    "------ snipmate dependencies -------
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
Bundle 'edsono/vim-matchit'
Bundle 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
" Bundle 'tpope/vim-surround'
" 注释
Bundle 'scrooloose/nerdcommenter'
" 历史编辑
Bundle 'sjl/gundo.vim'
" 对齐
Bundle 'godlygeek/tabular'
" 缩进 (http://www.tuicool.com/articles/2yy6ze)
Bundle 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
Bundle 'scrooloose/nerdtree'
" Bundle 'humiaozuzu/TabBar'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'

" Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-airline/vim-airline'
"
" syntax check by :Error in vim
Bundle 'scrooloose/syntastic'
Bundle 'nvie/vim-flake8'

" 标记无效空格
Bundle 'bronson/vim-trailing-whitespace'

"-------------
" Other Utils
"-------------
" Bundle 'humiaozuzu/fcitx-status'
Bundle 'nvie/vim-togglemouse'


				" Syntax/Indent for language enhancement
"------- web backend ---------
"Bundle '2072/PHP-Indenting-for-VIm'
"Bundle 'tpope/vim-rails'
"Bundle 'lepture/vim-jinja'
"Bundle 'digitaltoad/vim-jade'

				"------- web frontend ----------
Bundle 'othree/html5.vim'
" Bundle 'tpope/vim-haml'
" Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
" Bundle 'nono/jquery.vim'
" Bundle 'groenewege/vim-less'
" Bundle 'wavded/vim-stylus'
" Bundle 'nono/vim-handlebars'

				"------- markup language -------
Bundle 'tpope/vim-markdown'
" Bundle 'timcharper/textile.vim'

"------- Ruby --------
" Bundle 'tpope/vim-endwise'

"------- Go ----------
" Bundle 'fatih/vim-go'

"------- FPs ------
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'wlangstroth/vim-racket'
" Bundle 'vim-scripts/VimClojure'
" Bundle 'rosstimson/scala-vim-support'

"-------------- -------------- -------------- -------------- --------------
" Color Schemes
"-------------- -------------- -------------- -------------- --------------
Plugin 'crusoexia/vim-dracula'


filetype plugin indent on     " required!

