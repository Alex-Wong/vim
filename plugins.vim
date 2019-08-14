set nocompatible              " This must be first, because it changes other options as a side effect
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ----- Plugin comming from GitHub: jez/vim-as-an-ide -----------------
" ----- 颜色 -----
Plugin 'flazz/vim-colorschemes'
" ----- 状态栏 -----
Plugin 'vim-airline/vim-airline'
" ----- 书签 -----
Plugin 'kshenoy/vim-signature'
" ----- 窗口切换 -----
Plugin 'christoomey/vim-tmux-navigator'
" ----- 选词、移动 -----
Plugin 'easymotion/vim-easymotion'
Plugin 'ihacklog/HiCursorWords'

" ----- IDE -----
" ----- 代码文件列表 -----
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" ----- 结构体、函数列表 -----
Plugin 'majutsushi/tagbar'
" ----- 语法 -----
"Plugin 'scrooloose/syntastic'
" 语法高亮
Plugin 'justinmk/vim-syntax-extra'
Plugin 'fatih/vim-go'
Plugin 'Blackrush/vim-gocode'
Plugin 'cespare/vim-toml'
" ----- (文件、符号)搜索-----
Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'vim-scripts/gtags.vim'
" ----- 代码提示、帮助、模板-----
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ludovicchabant/vim-gutentags'
" ----- 注释-----
Plugin 'scrooloose/nerdcommenter'
" ----- 空格处理-----
Plugin 'vim-scripts/StripWhiteSpaces'
Plugin 'ntpeters/vim-better-whitespace'
" ----- 文档-----
Plugin 'vim-scripts/DoxygenToolkit.vim'
" ----- linux kernel代码格式 -----
Plugin 'vivien/vim-linux-coding-style'
" ----- 括号补全、修改 -----
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
" ----- 代码补全、语法检查 -----
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'w0rp/ale'
" ----- 函数调用关系 -----
Plugin 'vim-scripts/CCTree'
" ----- vim插件功能库(函数、命令) -----
Plugin 'L9'
Plugin 'xolox/vim-misc'


" ----- 中文帮助文档 -----
Plugin 'vimcn/vimcdoc'
Plugin 'vimcn/NERD_tree.vim.cnx'
Plugin 'vimcn/ctrlp.cnx'
Plugin 'vimcn/c.vim.cnx'
"Plugin 'vimcn/syntastic.cnx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList	    - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" ---------------------------------------------------------------------
" Plugin configuration
" ---------------------------------------------------------------------

" ----- flazz/vim-colorschemes -----
colorscheme solarized

" ----- vim-airline/vim-airline -----
set laststatus=2
let g:airline_detect_paste=1                    " Show PASTE if in paste mode
let g:airline#extension#tabline#enabled = 1     " Show airline for tabs too
let g:airline#extensions#hunks#non_zero_only = 1

" ----- kshenoy/vim-signature -----
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ----- scrooloose/nerdtree -----
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.pyc$', '\.cmd$', '\.tmp$']

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w

" ----- jistr/vim-nerdtree-tabs -----
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
"let g:nerdtree_tabs_autofind = 1

" ----- majutsushi/tagbar -----
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
let tagbar_left=0
let tagbar_width=32
let g:tagbar_compact=1
let g:tagbar_sort=0
" 设置 ctags 对哪些代码标识符生成标签,格式: {short}:{long}[:{fold}[:{stl}]]
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" ----- scrooloose/syntastic -----
"let g:syntastic_error_symbol = '✘'
"let g:syntastic_warning_symbol = "▲"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"augroup mySyntastic
"  au!
"  au FileType tex let b:syntastic_mode = "passive"
"augroup END

" ----- nathanaelkane/vim-indent-guides ----
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1

" ----- vim-gutentags -----
set cscopetag
set cscopeprg='gtags-cscope'

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif


" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" ----- fatih/vim-go -----
au BufRead,BufNewFile *.go set filetype=go
let g:go_autodetect_gopath = 1


" ----- vim-scripts/gtags.vim


" ----- Raimondi/delimitMate -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- Valloric/YouCompleteMe -----
" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 默认参数
let g:ycm_global_ycm_extra_conf = '~/.vim/config/.ycm_extra_conf.py'

let g:ctrlsf_ackprg = 'ag'


" ------ w0rp/ale -----
"let g:ale_emit_conflict_warnings = 0
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" ------ vim-scripts/CCTree -----
autocmd VimEnter * if filereadable('cscope.out') | exec "cscope add cscope.out" | endif
autocmd VimEnter * if filereadable('GTAGS') | exec "cscope add GTAGS" | endif
autocmd VimEnter * if filereadable('ccglue.out') | exec "CCTreeLoadXRefDBFromDisk ccglue.out" | elseif filereadable('cscope.out') | exec "CCTreeLoadDB cscope.out" | endif
"let g:CCTreeWindowVertical = 0
let g:CCTreeOrientation = "rightbelow"
let g:CCTreeMinVisibleDepth = 3
let g:CCTreeRecursiveDepth = 3
