"按键设置
let mapleader ="\<space>"
imap jk <Esc> 
"NERDTreeToggle打开快捷键
map <silent> <C-e> :NERDTreeToggle<CR>
"格式化代码快捷键
map <leader>s gg=G
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
"退出调试界面"
map <leader>r :VimspectorReset<CR>
"快速打开manpage"
nmap <C-k> :Man<CR>

"vim快速切换页面"
map <leader>u :bp<CR>
map <leader>n :bn<CR>

"切换跳转的页面"
map <leader>[ : tabnext<CR>
map <leader>] : tabprevious<CR>
"快速新建vim页面"
map <C-n> :tabnew<CR>
"另存为的快捷键"
map <C-s> :w<space>
"=====markdown 快捷键"
"[[ "跳转上一个标题
"
"]] "跳转下一个标题
"
"]c "跳转到当前标题
"
"]u "跳转到副标题
"
"zr "打开下一级折叠
"
"zR "打开所有折叠
"
"zm "折叠当前段落
"
"zM "折叠所有段落
"
":Toc "显示目录（定义为leader+d）
"快速预览快捷键
map <leader>y :MarkdownPreview<CR>
"退出预览模式
map <leader>b :MarkdownPreviewStop<CR>
"快速显示markdown目录"
map <leader>m :Toc<CR>

" ====基础设置====
" Line Numbers
set relativenumber

"语法高亮
 syntax on


"凸显当前行
set cursorline

"凸显当前列
"set cursorcolumn

"自动保存
set autowrite

"光标立刻跳转到搜索到内容
set incsearch

"设置softtabstop有一个好处是可以用Backspace键来一次删除4个空格.
"softtabstop的值为负数,会使用shiftwidth的值,两者保持一致,方便统一缩进.
set softtabstop=4

"高亮显示括号匹配
set showmatch

"设置Tab长度为4空格
set tabstop=4

"设置自动缩进长度为4空格
set shiftwidth=4

"设置自动缩进长度为4空格
set shiftwidth=4
"自动缩进,这个导致从外面拷贝多行以空格开头的内容时,会有多的缩进,先不设置
"set autoindent

"不要用空格代替制表符
set noexpandtab
"输入tab制表符时，自动替换成空格
"set expandtab

"高亮显示所有搜索到的内容.后面用map映射快捷键来方便关闭当前搜索的高亮.
"set hlsearch

"光标立刻跳转到搜索到内容
"set incsearch


"底部状态行两行
set laststatus=2 

set showcmd         " 输入的命令显示出来，看的清楚些  

set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  

set foldenable      " 允许折叠 



"禁止生成临时文件
set nobackup
set noswapfile


"括号自动补全
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>


"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\#     Author: Yong") 
        call append(line(".")+2, "\#     Mail: 1412202849@qq.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Yong") 
        call append(line(".")+2, "    > Mail: 1412202849@qq.com") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "#include <stdlib.h>")
		call append(line(".")+8, "#include <string.h>")
		call append(line(".")+9, "#include <unistd.h>")
		call append(line(".")+10, "#include <errno.h>")
		call append(line(".")+11, "#include <pthread.h>")
        call append(line(".")+12, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 

"====plugins begin====
call plug#begin('~/vim/plugged')
"file explorer
Plug 'scrooloose/nerdtree'
"highlight
Plug 'cateduo/vsdark.nvim'
"根据语义进行高亮显示
Plug 'jackguo380/vim-lsp-cxx-highlight'
" debug
Plug 'puremourning/vimspector', {'do': './install_gadget.py --all'} 
"vim-rainbow"
Plug 'frazrepo/vim-rainbow'
"NERD Commenter
Plug 'scrooloose/nerdcommenter'
"lightline
Plug 'itchyny/lightline.vim'
" lsp,一种语言服务器，连接插件与后端自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"vim-gitgutter
Plug 'airblade/vim-gitgutter'
 "必要插件，安装在vim-markdown前面
Plug 'godlygeek/tabular'
"vim-markdown"
Plug 'plasticboy/vim-markdown'
"markdown 预览"
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"代码对齐indentline"
Plug 'yggdroot/indentline'
call plug#end()
"====plugins   end====

"各对应插件配置↓

"====indentline===="
"开启下面一句对齐线变为白色
"let g:indentLine_setColors = 0
let g:indentLine_char_list = ['¦']
let g:indentLine_color_term = 100
"======markdown-preview====="
let g:mkdp_path_to_chrome = ""
" 指定预览主题，默认Github
let g:mkdp_markdown_css=''

"====cateduo/vsdark.nvim====
set termguicolors
let g:vsdark_style = "dark"
colorscheme vsdark


" ==== jackguo380/vim-lsp-cxx-highlight ====

hi default link LspCxxHlSymFunction cxxFunction
hi default link LspCxxHlSymFunctionParameter cxxParameter
hi default link LspCxxHlSymFileVariableStatic cxxFileVariableStatic
hi default link LspCxxHlSymStruct cxxStruct
hi default link LspCxxHlSymStructField cxxStructField
hi default link LspCxxHlSymFileTypeAlias cxxTypeAlias
hi default link LspCxxHlSymClassField cxxStructField
hi default link LspCxxHlSymEnum cxxEnum
hi default link LspCxxHlSymVariableExtern cxxFileVariableStatic
hi default link LspCxxHlSymVariable cxxVariable
hi default link LspCxxHlSymMacro cxxMacro
hi default link LspCxxHlSymEnumMember cxxEnumMember
hi default link LspCxxHlSymParameter cxxParameter
hi default link LspCxxHlSymClass cxxTypeAlias


"vim-rainbow 配置"
"只配置某些文件使用
"au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"====lightline====



"====NERD Commenter====
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1




"===='neoclide/coc.nvim====
" coc extensions
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-vimlsp',
      \ 'coc-cmake',
      \ 'coc-highlight',
      \ 'coc-pyright'
      \ ]

"coc setting
set signcolumn=number
" <TAB> to select candidate forward or
" pump completion candidate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" <s-TAB> to select candidate backward
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.')-1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" <CR> to comfirm selected candidate
" only when there's selected complete item
if exists('*complete_info')
  inoremap <silent><expr> <CR> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if(index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" highlight link CocHighlightText Visual
" autocmd CursorHold * silent call CocActionAsync('highlight')   " TODO

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" diagnostic info
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<CR>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nmap <LEADER>qf <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" statusline support
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}  "TODO

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"定义一个函数查找路径中有没有Cmake文件，找到的话自动生成编译需要的头文件,就不会报找不到头文件的错误了，只需要执行下面定义的Gcmake即可调用此函数
"如果是makefile项目的话，使用bear工具生成即可，cocconfig文件中说明了编译头文件路径的位置，生成的compile_commands.json也应该放在此目录下"
function! s:generate_compile_commands()
  if empty(glob('CMakeLists.txt'))
    echo "Can't find CMakeLists.txt"
    return
  endif
  if empty(glob('.vscode'))
	  "沉默的生成一个.vscode文件夹"
    execute 'silent !mkdir .vscode'
  endif
  execute '!cmake -DCMAKE_BUILD_TYPE=debug
      \ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B .vscode'
endfunction
command! -nargs=0 Gcmake :call s:generate_compile_commands()

" ==== puremourning/vimspector ====
" 按键模式，可以去github查看快捷键
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

"定义一个函数用于在当前目录下快速生成一个.vimspector.json,这些函数本质都是判断加使用shell命令"
function! s:generate_vimspector_conf()
  if empty(glob( '.vimspector.json' ))
    if &filetype == 'c' || 'cpp' 
      !cp ~/.config/nvim/vimspector_conf/c.json ./.vimspector.json
    elseif &filetype == 'python'
      !cp ~/.config/nvim/vimspector_conf/python.json ./.vimspector.json
    endif
  endif
  e .vimspector.json
endfunction

command! -nargs=0 Gvimspector :call s:generate_vimspector_conf()
nmap <Leader>v <Plug>VimspectorBalloonEval
xmap <Leader>v <Plug>vimspectorBalloonEval





