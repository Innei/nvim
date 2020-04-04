" Author:   Innei
" Github:   https://github.com/innei
" License:  MIT
autocmd BufRead,BufNewFile *.md setlocal spell
" ===
" === Markdown
" ===

"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>


let g:auto_save = 0
augroup ft_markdown
  au!
  au FileType markdown let b:auto_save = 1
augroup END
" let g:auto_save_write_all_buffers = 1  " write all open buffers as if you would use :wa
" let g:auto_save_silent = 1  " do not display the auto-save notification
augroup unmapChn
  au!
  au FileType markdown  :inoremap <buffer> （ （
  au FileType markdown  :inoremap <buffer> ） ）
  au FileType markdown  :inoremap <buffer> 』 』
  au FileType markdown  :inoremap <buffer> 『 『
  au FileType markdown  :inoremap <buffer> 【 【
  au FileType markdown  :inoremap <buffer> 】 】
  au FileType markdown  :inoremap <buffer> 。 。
  au FileType markdown  :inoremap <buffer> ， ，
  au FileType markdown  :inoremap <buffer> ； ；
  au FileType markdown  :inoremap <buffer> ： ：
  au FileType markdown  :inoremap <buffer> “  “
  au FileType markdown  :inoremap <buffer> ”  ”
  au FileType markdown  :inoremap <buffer> ‘  ‘
  au FileType markdown  :inoremap <buffer> ’  ’
  au FileType markdown  :inoremap <buffer> ？ ？
  au FileType markdown  :inoremap <buffer> ！ ！
  au FileType markdown  :inoremap <buffer> 》 》
  au FileType markdown  :inoremap <buffer> 《 《
  au FileType markdown  :inoremap <buffer> 、 、
  au FileType markdown  :inoremap <buffer> ￥ ￥
  au FileType markdown  :inoremap <buffer> 》 》
  au FileType markdown  :inoremap <buffer> 《 《
augroup END
au FileType markdown setlocal wrap
