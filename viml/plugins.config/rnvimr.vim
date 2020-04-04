" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
nnoremap <silent> R :RnvimrSync<CR>:RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>

" Customize the initial layout
let g:rnvimr_layout = { 'relative': 'editor',
      \ 'width': &columns,
      \ 'height': &lines,
      \ 'col': 0,
      \ 'row': 0,
      \ 'style': 'minimal' }
" Customize multiple preset layouts
" '{}' represents the initial layout
let g:rnvimr_presets = [
      \ {'width': 1.0, 'height': 1.0},
      \ {'width': 0.500, 'height': 1.000, 'col': 0, 'row': 0},
      \ ]