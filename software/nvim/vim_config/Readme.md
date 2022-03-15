# vim 配置的过程

## 1、关键是插件的配置

- 注意点是 coc-vim 和 vimspector，需要配置文件
  coc-vim 需要的是 c++的配置，它是用来自动补全的，
  一个很要命的是需要有 jsnode,可以去官网下载后把可运行程序创建软连接到
  /usr/bin/node
- coc 的其他配置在 init.vim 中配置
- vimspector 配置主要是要有 python3 环境，没有的话参考 Linux 笔记下的 vim 部分
  其次就是需要给 nvim 配置 python3 环境，使用 pip3 install --user --upgrade
  pynvim

## 2、基础配置

1. 快捷键的配置,关键是改缩进和括号匹配和 leader 键（个人习惯是使用空格）
2. 还有一些高亮光标提示等配置。
