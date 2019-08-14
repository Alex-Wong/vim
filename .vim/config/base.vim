syntax enable
syntax on

set number                          " line numbers
set ruler
set cursorline
set cursorcolumn
set showcmd                         " display incomplete commands

" set t_Co=256                        " set vim color(this depend on the terminal color mode)

set tabstop=4                       " default to 4 spaces for a hard tab
set softtabstop=4                   " default to 4 spaces for a soft tab
set expandtab                       " expand tabs into spaces
set shiftwidth=4                    " for when <TAB> is pressed at the beginning of a line

set smartindent
set autoindent
set cindent

set backspace=indent,eol,start
set scrolloff=5                     " don't let the cursor touch the edge of the viewport
set foldnestmax=1                   " Only fold up to one level deep

if has('python3')
  silent! python3 1
endif

" In many terminal emulators the mouse works just fine, thus enable it
if has('mouse')
    set mouse=a
endif

if has("termguicolors")
    " enable true color
    set termguicolors
endif

" improved command autocompletion
set wildmenu
set wildmode=list:longest

set noswapfile

set formatoptions=qrn2tcoj

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
