
# 介绍

>我的vim配置是fork自[skwp/dotfiles](https://github.com/skwp/dotfiles)的，只是做了自己的个性化更改,
去掉了很多不必要的插件
使用的YCM编译后的文件来自[HERE](http://jikaichen.com)

这个配置主要用来写c++/python/java/shell/html5这些，配置了F5一键运行，没试过多大的项目，也就写过`flask`, 平时用来写写算法，demo


## Install
1. 安装插件管理Vundle
</br>`git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`

2. Clone或download我的keplervim
</br>`git clone https://github.com/M-Kepler/Keplervim.git`

3. 把文件放到`/home/`目录下,并改名为`.vim`
</br>`cd keplervim` </br>`cp * ~/` </br>`ln -s ~/.vim/vimrc ~/.vimrc`

4. 安装插件
</br>终端输入`vim`, 不必管那些错误，一直回车进入到编辑界面就行
</br>在normal模式下输入</br>`:BundleInstall`

## 特色功能
我的默认leader键为` ; `,你也可以在`.vimrc`里面修改


* NERDTreeToggle --------------------------------------------`<Leader>tn`
</br> 目录树

* NERDCommenter -------------------------------------------`<Leader>cc` & `<Leader>cu`
</br> [快速注释](http://blog.csdn.net/zcube/article/details/42298419)

* Tabular ---------------------------------------------------------`:Tab/=`
</br>[任意对齐](http://blog.longwin.com.tw/2012/02/vim-align-text-plugin-tabular-2012/)

* TagbarToggle -------------------------------------------------`<Leader>tg`
</br> 代码结构

* NeoComplete -------------------------------------------------`已知c、c++、python、java`
</br> 自动补全

* YouCompleteMe ---------------------------------------------`大名鼎鼎的YCM`
</br>这个由于编译麻烦，且不一定成功，所以我copy了别人的来用

* markdown preview ------------------------------------------`:MarkdownPreview`
</br> Markdown实时预览,配置中默认使用chrome打开预览

* syntastic --------------------------------------------------------`<Leader>e`
</br> 语法格式检查</br>
`<Leader>c`  close errors windows</br>
`<Leader>n`  jump to next error</br>
`<Leader>p`  jump to pre error</br>

* Git ----------------------------------------------------------------`↓`
`Gstatus` git status</br>
`Gcommit`</br>
`Glog`</br>
`Gdiff`</br>
`Gread`   git checkout -- filename</br>
`Gwrite`  git add filename</br>
`Gmove`   git mv</br>
`Gremvoe` git rm</br>


* Gundo ----------------------------------------------------------`<Leader>u`
</br> 很好用的插件，可以记录文档修改记录

* Ctrlp -------------------------------------------------------------`<leader>o`
</br> [快速打开文件](http://www.boiajs.com/2014/12/17/vim-ctrlp)

* Ctrlp -------------------------------------------------------------`<leader>o`

* Emmet -------------------------------------------------------------`<leader>h`
 </br>[HTML/CSS补全](http://www.iteye.com/news/27580)

* 一键编译 -------------------------------------------------------`F6`
</br> C,C++,Fortran,Python,java,Latex,sh等按`<F6>`编译

* 一键运行 -------------------------------------------------------`F5`
</br> C,C++,Fortran,Python,java,Latex,sh等按`<F5>`编译运行

* 打开粘贴 -------------------------------------------------------`F2`
</br>

***

### 快捷键 ###

| vim command | |
|:-----|----:|:---:|
|: `gD` |   跳转到局部变量定义处
| `''`  | (两个单引号) 跳转到上次停靠处
| `:earlier 10m` |  恢复到10分钟以前的状态
| `ge`  | 移动到上一个单词的词未
| `+/-` |  移到下/上一列第一个字符处
| `(/)` |  移到句首/句末
| `{/}` |  段首/段未
| `NG`  |  文件的第n列
| `N+/n-` |  移动光标位置之后/前第N列
| `.`   |  重做
| `:n`  |  跳到第n行
| `:Tx`	|  移动到光标后第一个x处


## TIPS##

1. 多行行首插入：   
按下 gg 跳到第一行，按 Ctrl + v 进入列选择模式，再按 G，选中全文的第一列，然后按 I，进入列插入状态，输入星号 *，再按下 ESC，你会看到，所有行之前都出现了一个星号

2. 多行行末插入：   
`gg + Ctrl-v + G + $ + A + what_you_want`
3. 统计字符:    
`g<C-g>`









