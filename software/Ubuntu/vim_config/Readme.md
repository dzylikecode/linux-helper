# vim配置的过程
##1、关键是插件的配置
	注意点是coc-vim和vimspector，需要配置文件
	coc-vim需要的是c++的配置，它是用来自动补全的，
	一个很要命的是需要有jsnode,可以去官网下载后把可运行程序创建软连接到
	/usr/bin/node
	coc的其他配置在init.vim中配置
	vimspector配置主要是要有python3环境，没有的话参考Linux笔记下的vim部分
	其次就是需要给nvim配置python3环境，使用pip3 install --user --upgrade
	 pynvim
##2、基础配置
	1. 快捷键的配置,关键是改缩进和括号匹配和leader键（个人习惯是使用空格）
	2. 还有一些高亮光标提示等配置。

