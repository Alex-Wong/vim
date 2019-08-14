" 在VIM中使用 :help mode和 :help map来查看VIM编辑模式和快捷键信息

" set the leader key
let mapleader = ";"

" 定义快捷键关闭当前分割窗口
nnoremap <C-W> :q<CR>
inoremap <C-W> :q<CR>

" 删除行
nmap <C-D> dd
imap <C-D> <ESC>ddi


" Open/close NERDTree Tabs with <F2>
nmap <silent> <F2> :NERDTreeTabsToggle<CR>

" Open/close tagbar with <F3>
nmap <silent> <F3> :TagbarToggle<CR>

nnoremap <leader>jc :Ycmompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :Ycmompleter GoToDefinition<CR>

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<leader><tab>f"
"let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>b"

" YM 集成 Omnippomplete 补全引擎，设置其快捷键
"inoremap <leader>; <-x><-o>

" ctrlsf.vim插件在工程内全局查找光标所在关键字。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" gtags.vim, 使用gtags符号查找代替系统的ctrl + ]
map <C-]> :Gtags<CR><CR>

" 自定义Replace函数快捷键
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
