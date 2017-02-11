***

[TOC]
# KeplerVim 介绍

![vim](http://images.cnblogs.com/cnblogs_com/tianjintou/890803/o_Screenshot%20from%202016-10-07%2011-59-15.png)

> 我的vim配置是来自[skwp/dotfiles](https://github.com/skwp/dotfiles)的，只是做了自己的个性化更改,
去掉了很多不必要的插件   
使用的````YCM````编译后的文件,[网盘下载](https://pan.baidu.com/s/1jHOquKe)

> 这个配置主要用来写````c++/python/java/shell/html5````这些，配置了````F5````一键运行


## 安装
1. 首先安装插件管理```Vundle```
</br>`git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`

2. git clone 或 download 我的 keplervim.git
</br>`git clone https://github.com/M-Kepler/Keplervim.git`

3. 把文件夹放到 Home 目录下, 并改名为`.vim`
```
mv keplervim/ .vim/
cd .vim
ln -s ~/.vim/vimrc ~/.vimrc
```
4. 安装插件<br />
这个。。有点尴尬。。额，你得先去编辑 ~/.vim/bundles.vim 把 Plugin 'Valloric/YouCompleteMe'注释掉
<br /> 然后保存退出, 终端输入`vim`, 不管提示的错误，一直回车进入到界面就行
输入括号里的内容(:BundleInstall) 直到所有插件安装正确, 出错就再执行一次
    这些插件安装完后在把 ~/.vim/bundles.vim 里的Plugin 'Valloric/YouCompeteMe' 的注释去掉就可以了
<br />**注**:
> 由于自己编译YCM太麻烦了，而且不一定能成功，反正我的电脑上没成功.
    所以下载别人编译后的YCM，然后放到 ~/.vim/bundle/ 下就可以了
***
## 特色和快捷键
    我的默认```leader```键为` ; `,你也可以在`.vimrc`里面修改
* NERDTreeToggle --------------------------------------------`<Leader>tn`
</br>
> 目录树

* NERDCommenter -------------------------------------------`<Leader>cc` & `<Leader>cu`
</br>
> [快速注释](http://blog.csdn.net/zcube/article/details/42298419)

* Tabular ---------------------------------------------------------`:Tab/=`
</br>
> [任意对齐](http://blog.longwin.com.tw/2012/02/vim-align-text-plugin-tabular-2012/)

* TagbarToggle -------------------------------------------------`<Leader>tg`
</br>
> 代码结构

* NeoComplete -------------------------------------------------`已知c、c++、python、java`
</br>
> 自动补全

* YouCompleteMe ---------------------------------------------`大名鼎鼎的YCM`
```
这个由于编译麻烦，且不一定成功，所以我copy了别人的来用
```

* markdown preview ------------------------------------------`:MarkdownPreview`
```
Markdown实时预览,Ubuntu下配置中默认使用chrome打开预览 .md文件来预览
```

* syntastic --------------------------------------------------------`<Leader>e`
```
语法格式检查
<Leader>c  close errors windows</br>
<Leader>n  jump to next error</br>
<Leader>p  jump to pre error</br>
```

* snippet--------------------------------------------------------`<Leader>Tab`
</br>
> 自动补全代码块，如你写入if， 按下<leader>Tab就会自动不全if的结构

* Git ----------------------------------------------------------------`↓`
```
`Gstatus` git status
`Gcommit`
`Glog`
`Gdiff`
`Gread`   git checkout -- filename
`Gwrite`  git add filename
`Gmove`   git mv
`Gremvoe` git rm
```

* Gundo ----------------------------------------------------------`<Leader>u`
</br>
> 很好用的插件，可以记录文档修改记录

* Ctrlp -------------------------------------------------------------`<leader>o`
</br>
> [快速打开文件](http://www.boiajs.com/2014/12/17/vim-ctrlp)

* Ctrlp -------------------------------------------------------------`<leader>o`

* Emmet -------------------------------------------------------------`<leader>h`
 </br>
 > [HTML/CSS补全](http://www.iteye.com/news/27580)

* 一键编译 -------------------------------------------------------`F6`
```
C,C++,Fortran,Python,java,Latex,sh等按`<F6>`编译
```

* 一键运行 -------------------------------------------------------`F5`
```
C,C++,Fortran,Python,java,Latex,sh等按`<F5>`编译运行
```

* 打开粘贴 -------------------------------------------------------`<Leader>p`
```
其实，不打开粘贴，也是可以直接将系统剪切板的内容粘贴到vim编辑器里的，而且格式不会乱
Ctrl + <Leader>就可以选择粘贴系统剪切板的内容了
```

* 插入作者信息--------------------------------------------------`Ctrl+i`
```
自己的个人信息可以在vimrc修改
```
* 快速修改.vimrc--------------------------------------------------`<Leader>ev`
* 输入 + - / * =  < >可以自动在前后添加空格---------------这个有时候不好用,可以自己在vimrc里注释掉
* 翻译vim编辑器里的文字--------------------------------------------`<Leader>d`
* 括号自动补全---------------------------------没用插件,但基本的够了
* 标签页
* 忘了加```sudo```? -------------------------------```w!!```
```
:tab file_name tab打开新文件
<Leader>x 关闭当前tab
<Leader>bn next tab
<Leader>bp 前一个tab
```
* 能高亮TODO和FIXME

***
### Vim使用小贴士

| vim command | |
|:-----|----:|:---:|
| `gd` |   跳转到局部变量定义处
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

# 常用命令
* 多行行首插入：   
```
按 Ctrl + v 进入列选择模式，选择需要行首插入的行
然后按 I，进入列插入状态，
输入星号 *，再按下 ESC
你会看到，所有行之前都出现了一个星号
```

* 多行行末插入：   
`Ctrl-v + $ + A + input + esc`

* 统计:    
g + ctrl + g

