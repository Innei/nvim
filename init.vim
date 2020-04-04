" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @theniceboy && @innei

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload
  " silent !cp ~/.config/nvim/plug.vim ~/.config/nvim/autoload/plug.vim
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \  https://cdn.jsdelivr.net/gh/junegunn/vim-plug@master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
" set clipboard=unnamedplus
let &t_ut=''
" set autochdir
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_python_provider = 0
" let g:loaded_python3_provider = 0
" ===
" === Editor behavior
" ===
set number
" set relativenumber
set mouse=nv
set mousehide
set cursorline
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2
set backspace=2
set autoindent
set smartindent
set smarttab
set signcolumn=yes:2
set list
set listchars=tab:→\ ,trail:·
set scrolloff=8
set viewoptions=cursor,folds,slash,unix
" set notimeout
set timeout
set timeoutlen=500
set ttimeoutlen=0
set nowrap
set sidescroll=8
" set linebreak
set wrapmargin=8
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=cro
set splitright
autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set splitbelow
set noshowmode
set showcmd
" autocmd CursorHold * :echo
set wildmenu
set ignorecase
set smartcase
set shortmess+=cOtT
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set autoread
" set autowrite
set hidden
set pastetoggle=<F10>
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo,.
endif
" set colorcolumn=80
set updatetime=500

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Ignore File
" ===
set wildignore+=*node_modules/**
set wildignore+=*.o,*.obj,*~
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
" tnoremap <C-N> <C-\><C-N>
" tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :
" noremap : q:i
noremap r <C-r>
nnoremap X r
" map 0 To the first non-blank character of the line.
nnoremap 0 ^
nnoremap ) g_
" nnoremap <BS> X
" Save & quit
nnoremap Q :bd<CR>
command! -nargs=0 Q :q!
noremap <C-q> :qa<CR>
nnoremap <silent> S :w<CR>
noremap <silent> <C-S> :wa<CR>
inoremap <silent> <C-s> <ESC>:w<CR>i
inoremap <M-f> <ESC>:Format<CR>a

nnoremap <S-CR> <ESC>o<ESC>
inoremap <S-CR> <ESC>o
" Meta key remap
vnoremap <M-c> "+y
inoremap <M-v> <C-o>"+]p

" Open the vimrc file anytime
nnoremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
nnoremap <LEADER>st :Startify<CR>

" make Y to copy till the end of the line
nnoremap Y yg_

" Paste from system clipboard
nnoremap P "+p

" Copy to system clipboard
xnoremap y "+y

" Indentation
nnoremap < <<
nnoremap > >>
xnoremap < <gv
xnoremap > >gv

" Search
nnoremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
xnoremap <LEADER>tt :s/    /\t/g
nnoremap <LEADER>ss :%s/\t/    /g
xnoremap <leader>ss :s/\t/    /g
" Folding
" noremap <silent> l za

" Open up lazygit
nnoremap \g :term lazygit<CR>

" Toggle wrap
nnoremap <LEADER>tw :set wrap!<CR>
" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
nnoremap J :BTags<CR>
" nnoremap h <nop>
nnoremap . <C-I>
nnoremap , <C-O>
noremap " .
nnoremap = <C-a>
nnoremap - <C-x>
nnoremap <C-a> <nop>
nnoremap <C-x> <nop>
noremap <Home> ^
inoremap <Home> <esc>^i
inoremap <Del> <ESC>lxi
nnoremap <Del> "_x
xnoremap <Del> "_d
" U/E keys for 5 times u/e (faster navigation)
nnoremap <silent> F 5k
nnoremap <silent> E 5j
xnoremap <silent> F 5k
xnoremap <silent> E 5j

xnoremap <silent> , ^
xnoremap <silent> . g_
xnoremap <silent> <End> g_
xnoremap <silent> <Home> ^
" Faster in-line navigation
nnoremap W 5w
nnoremap B 5b
xnoremap W 5w
xnoremap B 5b

" Go next or forward word under cursor
nnoremap \\ *
nnoremap \| #
" select word
inoremap <M-d> <ESC>viw<C-g>
nnoremap <M-d> viw<C-g>
snoremap <M-d> <ESC>*ve<C-g>
snoremap <M-D> <ESC>#ve<C-g>

" rename a word
nnoremap cw viwc

smap <ESC> <ESC>:noh<CR>
" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-W> 5<C-y>
noremap <C-E> 5<C-e>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap jj <ESC>l
inoremap jk <ESC>l
inoremap kk <ESC>l
" undo
inoremap <M-z> <ESC>u
" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" use shift(Meta) + arrow keys to move line up/down
nnoremap <S-up> :m .-2<CR>
nnoremap <S-down> :m .+1<CR>
inoremap <M-up> <ESC>:m .-2<CR>==gi
inoremap <M-down> <ESC>:m .+1<CR>==gi
inoremap <M-left> <ESC>bi
inoremap <M-right> <Esc>ea
inoremap <S-up> <ESC>:m .-2<CR>==gi
inoremap <S-down> <ESC>:m .+1<CR>==gi
inoremap <S-left> <ESC>bi
inoremap <S-right> <Esc>ea
" multi-lines move up/down in visual mode
vnoremap <M-up> :m '<-2<CR>gv=gv
vnoremap <M-down> :m '>+1<CR>gv=gv
vnoremap <M-left> b
vnoremap <M-right> e
vnoremap <S-up> <nop>
vnoremap <S-down> <nop>
vnoremap <S-left> <nop>
vnoremap <S-right> <nop>
" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER><Up> <C-w>k
noremap <LEADER><Down> <C-w>j
noremap <LEADER><Left> <C-w>h
noremap <LEADER><Right> <C-w>l

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap s<up> :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap s<down> :set splitbelow<CR>:split<CR>
nnoremap s<left> :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap s<right> :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
nnoremap <M-up> :res +5<CR>
nnoremap <M-down> :res -5<CR>
nnoremap <M-left> :vertical resize-5<CR>
nnoremap <M-right> :vertical resize+5<CR>

" Place the two screens up and down
nnoremap sh <C-w>t<C-w>K
" Place the two screens side by side
nnoremap sv <C-w>t<C-w>H

" Rotate screens
nnoremap srh <C-w>b<C-w>K
nnoremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
nnoremap <LEADER>q <C-w>j:q<CR>
nnoremap <Leader>Q :BufOnly<CR>

" ===
" === Tab management
" ===
" Create a new tab with t/
nnoremap t/ :tabe<CR>
" Move around tabs with t, and t.
nnoremap t, :-tabnext<CR>
nnoremap t. :+tabnext<CR>
" Move the tabs with tm, and tm.
nnoremap tm, :-tabmove<CR>
nnoremap tm. :+tabmove<CR>

" ===
" === Buffer manage
" ===
nnoremap <C-\> :bprevious<CR>
nnoremap <C-]> :bnext<CR>
nnoremap gB :bprevious<CR>
nnoremap gb :bnext<CR>
nnoremap tb :enew<CR>
" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
let g:auto_save = 0
augroup ft_markdown
  au!
  au FileType markdown let b:auto_save = 1
augroup END
" let g:auto_save_write_all_buffers = 1  " write all open buffers as if you would use :wa
" let g:auto_save_silent = 1  " do not display the auto-save notification

" ===
" === Other useful stuff
" ===
" Move the next character to the end of the line with ctrl+9
inoremap <C-u> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>. :set nosplitbelow<CR>:split<CR><C-w>w:terminal<CR><C-\><C-n>:set splitbelow<CR>i

" Press space twice to jump to the next '<++>' and edit it
nnoremap <silent> <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>v3l<C-g>
inoremap <silent> <C-p> <++>
" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~<left>

" Auto change directory to current dir
" autocmd BufEnter * silent! lcd %:p:h

" Call figlet
nnoremap tx :r !figlet

noremap <LEADER>- :lN<CR>
noremap <LEADER>= :lne<CR>

" find and replace
noremap \s :%s//g<left><left>

" Compile function
noremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    :AsyncRun python3 %
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'go'
    exec "GoRun %"
  elseif &filetype == 'javascript'
    :AsyncRun node %
  elseif &filetype == 'typescript'
    :AsyncRun yarn run babel-node % --extensions ".ts"
  endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')
" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
  exec "e ~/.config/nvim/_machine_specific.vim"
endif
" Plug 'mg979/vim-xtabline'
" Plug 'xolox/vim-session'
" Plug 'xolox/vim-misc' vim-session dep
Plug 'ananagame/vimsence', { 'on': [] }
augroup discord
  au!
  au InsertEnter * call plug#load('vimsence') | au! discord
  au InsertEnter * :call UpdatePresence()
augroup END
" Pretty Dress
" Plug 'theniceboy/eleline.vim'
if !exists('g:started_by_firenvim')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif
if (!empty($TMUX))
  Plug 'wellle/tmux-complete.vim'
endif

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'
Plug 'sakshamgupta05/vim-todo-highlight'

" File navigation
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" Taglist
Plug 'liuchengxu/vista.vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'Innei/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
" Tex
"Plug 'lervag/vimtex'


" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'neoclide/jsonc.vim', { 'for': 'json' }
Plug 'yuezk/vim-js', { 'for': ['php', 'html', 'javascript', 'css', 'less', 'javascriptreact'] }
Plug 'AndrewRadev/tagalong.vim' " auto rename tags
Plug 'jelera/vim-javascript-syntax', { 'for': ['php', 'html', 'javascript', 'css', 'less', 'javascriptreact'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascriptreact', 'typescriptreact'] }
" Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript', 'typescriptreact' ] }
" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'vue', 'javascript', 'javascriptreact', 'typescriptreact'] }
Plug 'Yggdroot/indentLine', { 'for': ['python', 'yaml', 'bash'], 'on': ['IndentLinesToggle']}
" Markdown
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': 'markdown' }
Plug 'theniceboy/bullets.vim'
Plug '907th/vim-auto-save', { 'on': 'AutoSaveToggle', 'for': ['text', 'markdown', 'tex'] }
" swift
Plug 'keith/swift.vim', { 'for': ['swift'] }


" Editor Enhancement
Plug 'kkoomen/vim-doge', { 'on': ['DogeGenerate', 'DogeCreateDocStandard'] } " document genertor  
Plug 'kristijanhusak/vim-carbon-now-sh', { 'on': 'CarbonNowSh' }
Plug 'andymass/vim-matchup' " Extends vim's % motion to language-specific words.
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'scrooloose/nerdcommenter'
Plug 'tyru/caw.vim'
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
" Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-easy-align' " gaip= to align the = in paragraph,
Plug 'easymotion/vim-easymotion'
Plug 'Konfekt/FastFold'
" Plug 'junegunn/vim-peekaboo'
Plug 'jesseleite/vim-noh'
Plug 'skywind3000/asyncrun.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'schickling/vim-bufonly'
Plug 'AndrewRadev/splitjoin.vim'  " gS to split line, gJ to join lines
Plug 'Shougo/context_filetype.vim'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-sleuth' " auto adjust tabwidth base on current file
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'wellle/context.vim'
Plug 'thaerkh/vim-workspace'

" Formatter
Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }

" For general writing
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'text', 'tex'], 'on': 'Goyo' }
Plug 'amix/vim-zenroom2', { 'for': ['markdown', 'text', 'tex'], 'on': 'Goyo' }
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'osyo-manga/vim-anzu'

" Mini Vim-APP
if !exists('g:started_by_firenvim')
  Plug 'mhinz/vim-startify'
endif
" Other visual enhancement
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'

" Other useful utilities
Plug 'tpope/vim-eunuch' " do stuff like :SudoWrite
" Plug 'makerj/vim-pdf'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

" ColorScheme
" Plug 'kaicataldo/material.vim'
" Plug 'jacoborus/tender.vim'
" Plug 'dracula/vim'
Plug 'iamcco/onedark.vim'
" Plug 'flazz/vim-colorschemes'
call plug#end()

" experimental
set lazyredraw
syntax sync minlines=256
set regexpengine=1

"
" === Switch
"
nnoremap sw :Switch<cr>
let g:switch_mapping = ""

" ===
" === Set material theme style
" ===
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1
" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" colorscheme material
" color xcodedark
" let g:xcodedark_green_comments = 1
" let g:xcodedark_emph_types = 1
" let g:xcodedark_emph_funcs = 1
" let g:xcodedark_emph_idents = 1
" let g:xcodedark_match_paren_style = 1
" let g:xcodedark_dim_punctuation = 1
" hi Normal guibg=NONE ctermbg=NONE

"hi SpecialKey ctermfg=blue guifg=grey70
" hi NonText guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE
colorscheme onedark
let g:onedark_terminal_italics=1
" ===
" === intentLine
" ===
" let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" ===================== Start of Plugin Settings =====================

" ===
" === AsyncRun
" ===
let g:asyncrun_open = 8
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '.bzr', '_darcs', 'build.xml', 'node_modules']
let g:asyncrun_shell = 'zsh -c'
let g:asyncrun_status = ''
nnoremap <leader>rr :AsyncRun -cwd=<root>
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

function! QuickFix_toggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  copen
endfunction

nnoremap <silent> cC :call QuickFix_toggle()<cr>
" ===
" === rnvimr
" ===
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

" ===
" === lens.vim
" ===
" let g:lens#width_resize_max = 40

" ===
" === eleline.vim
" ===
if !exists('g:started_by_firenvim')
  let g:airline_powerline_fonts = 1
  let g:airline_theme='onedark'
  let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
  let g:airline#extensions#tabline#formatter = 'jsformatter'
  let g:airline_highlighting_cache = 1
  let g:airline_extensions = ['coc', 'tabline']
  let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
  let g:airline#extensions#tabline#tabs_label = ' '
  let g:airline#extensions#tabline#buffers_label = '﬘'
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#exclude_preview = 1
  " let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
  " let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
  let R_setwidth = 0
  let R_clear_line = 0
  " let g:airline_section_c = airline#section#create(['%f  ' , '%{get(b:,''coc_current_function'','''')}'])
  let g:airline_section_b = airline#section#create(['%{get(b:,''coc_git_status'','''')}','%{get(g:,''coc_git_status'','''')}'])
  let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
  function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
      call add(msgs, ' ' . info['error'])
    endif
    if get(info, 'warning', 0)
      call add(msgs, ' ' . info['warning'])
    endif
    if get(info, 'information', 0)
      call add(msgs, ' ' . info['information'])
    endif
    if get(info, 'hint', 0)
      call add(msgs, ' ' . info['hint'])
    endif
    " echo get(g:, 'coc_status', '')
    return join(msgs, ' ')
  endfunction
  let g:airline_section_warning = airline#section#create_right(['%{StatusDiagnostic()}'])
  " let g:airline_section_warning = airline#section#create_right(['%{coc#status()}'])
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''

endif
" ==
" == GitGutter
" ==
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
" nnoremap gf :GitGutterFold<CR>
nnoremap <silent> gh :GitGutterPreviewHunk<CR>
nnoremap g- :GitGutterPrevHunk<CR>
nnoremap g= :GitGutterNextHunk<CR>
nnoremap gu :GitGutterUndoHunk<CR>
nnoremap gs :GitGutterStageHunk<CR>

" ===
" === Git-fugitive (code review)
" ===
" nnoremap <leader>gs :Gdiffsplit<CR><C-w>b<C-w>H
nnoremap <leader>gs :Gvdiffsplit<CR>
nnoremap <leader>gc :Gcommit<CR>
" nnoremap <leader>gm :Gmerge<CR>
" nnoremap <leader>gr :Grebase<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>ga :G add .<CR>:G<CR>
nnoremap <leader>gg :G<CR>
" let g:git_messenger_include_diff = 'all'
" ===
" === vim-illuminate
" ===
" let g:Illuminate_delay = 450
" hi illuminatedWord cterm=underline gui=underline
" let g:Illuminate_highlightUnderCursor = 0
" let g:Illuminate_ftblacklist = ['nerdtree']
" ===
" === coc
" ===
let g:coc_global_extensions = [
    \ 'coc-python',
    \ 'coc-vimlsp',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-css',
    \ 'coc-tsserver',
    \ 'coc-yank',
    \ 'coc-lists',
    \ 'coc-gitignore',
    \ 'coc-vimlsp',
    \ 'coc-tailwindcss',
    \ 'coc-stylelint',
    \ 'coc-tslint',
    \ 'coc-git',
    \ 'coc-explorer',
    \ 'coc-pyright',
    \ 'coc-translator',
    \ 'coc-prettier',
    \ 'coc-snippets',
    \ 'coc-eslint',
    \ 'coc-highlight',
    \ 'coc-zi',
    \ 'coc-github-users',
    \ 'coc-actions',
    \ 'coc-spell-checker',
    \ 'coc-post',
    \ 'coc-go',
    \ 'coc-template',
    \ 'coc-marketplace',
    \ 'coc-calc',
    \ 'coc-bookmark',
    \ 'coc-todolist',
    \ 'coc-postfix',
    \ 'coc-imselect',
    \ 'coc-cssmodules',
    \ ]

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <expr> <silent> <CR>  "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <expr> <silent> o "o\<c-r>=coc#on_enter()\<cr>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
" Open up coc-commands
nnoremap <c-c> :CocList diagnostics<CR>
nnoremap <leader>l :CocList<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nnoremap tt :CocCommand explorer<CR>
" coc-todolist
noremap ta :CocCommand todolist.create<CR>
noremap td :CocCommand todolist.upload<CR>
noremap tD :CocCommand todolist.download<CR>
noremap tc :CocCommand todolist.clearNotice<CR>
noremap tc :CocCommand todolist.clearNotice<CR>
noremap tl :CocList --normal todolist<CR>
" coc-bookmark
nmap ma <Plug>(coc-bookmark-annotate)
nmap mm <Plug>(coc-bookmark-toggle)
nmap m, <Plug>(coc-bookmark-prev)
nmap m. <Plug>(coc-bookmark-next)
" coc-translator
nmap ts <Plug>(coc-translator-p)
" coc-zi
noremap \d :CocList translators<CR>

nnoremap <silent> <leader>b :CocCommand actions.open<cr>

autocmd CursorHold * silent call CocActionAsync('highlight')
" hi CocHighlightText guifg=#eeffff guibg=#888888
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 C             CocConfig
command! -nargs=0 R             CocRestart
command! -nargs=0 L             CocListResume
command! -nargs=0 -range D      CocCommand

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

xmap <leader>f  <Plug>(coc-format-selected)

nmap <leader>o <Plug>(coc-openlink)
nmap <leader>a <Plug>(coc-refactor)

" set workspace
autocmd FileType javascript,javascriptreact,typescript,typescriptreact,scss let b:coc_root_patterns = ['node_modules']

" ===
" === Vue
" ===
let g:vue_pre_processors = ['typescript', 'scss']

" ===
" === JsDoc
" ===
" let g:jsdoc_input_description=1
" let g:jsdoc_allow_input_prompt=0
" let g:jsdoc_enable_es6=1

" ===
" === emmet
" ===
let g:user_emmet_install_global = 0
autocmd FileType html,vue,javascript,javascriptreact,typescriptreact EmmetInstall
let g:user_emmet_leader_key='<M-e>'
au FileType html,vue,javascript,javascriptreact,typescriptreact imap <silent><buffer> ,, <plug>(emmet-expand-abbr)

" ===
" === jsx
" ===
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.typescriptreact
let g:vim_jsx_pretty_colorful_config = 1
" ===
" === Python-syntax
" ===

let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
let g:fzf_history_dir = '~/.config/nvim/tmp/fzf-history'
nnoremap <C-f> :Ag<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <C-r> :Rg<CR>
nnoremap <leader>f :BLines<CR>
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
      \| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
      \ call fzf#vim#buffers(
      \   '',
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:0%', '?'),
      \   <bang>0)


command! -bang -nargs=* LinesWithPreview
      \ call fzf#vim#grep(
      \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
      \   fzf#vim#with_preview({}, 'up:50%', '?'),
      \   1)

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   '',
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%', '?'),
      \   <bang>0)


command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

command! -bang BTags
      \ call fzf#vim#buffer_tags('', {
      \     'down': '40%',
      \     'options': '--with-nth 1
      \                 --reverse
      \                 --prompt "> "
      \                 --preview-window="70%"
      \                 --preview "
      \                     tail -n +\$(echo {3} | tr -d \";\\\"\") {2} |
      \                     head -n 16"'
      \ })


" ===
" === fzf-preview.vim
" ===
" let g:fzf_preview_default_key_bindings = 'ctrl-e:down,ctrl-u:up'
let g:fzf_preview_layout = 'belowright split new'
let g:fzf_preview_rate = 0.4
let g:fzf_full_preview_toggle_key = '<C-f>'
let g:fzf_preview_command = 'ccat --color=always {-1}'
let g:fzf_binary_preview_command = 'echo "It is a binary file"'

" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
  nmap <buffer> u <plug>UndotreeNextState
  nmap <buffer> e <plug>UndotreePreviousState
  nmap <buffer> U 5<plug>UndotreeNextState
  nmap <buffer> E 5<plug>UndotreePreviousState
endfunc


" ===
" === vim-visual-multi
" ===
let g:VM_default_mappings             = 0
let g:VM_maps                         = {}
let g:VM_maps['Find Under']           = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under']   = '<C-d>'           " replace visual C-n
let g:VM_maps["Select All"]           = '<leader>A'
let g:VM_mouse_mappings               = 1
" let g:VM_leader                       = { 'default': '\', 'visual': '''', 'buffer': '\'}
let g:VM_maps["Case Conversion Menu"] = '<leader>cc'
let g:VM_maps["Switch Mode"]          = '<Tab>'
let g:VM_maps["Tools Menu"]           = '<leader>`'
let g:VM_maps['Skip Region']          = '<c-n>'
let g:VM_maps["Undo"]                 = 'u'
let g:VM_maps["Redo"]                 = 'r'
let g:VM_maps['Remove Region']        = 'q'
" === Far.vim
" ===
let g:far#source='ag'

" ===
" === Bullets.vim
" ===
"let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
      \ 'markdown',
      \ 'text',
      \ 'gitcommit',
      \ 'scratch'
      \]


" ===
" === Vista.vim
" ===
noremap <silent> T :Vista!!<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista_sidebar_width = 70
let g:vistarendererenable_icon = 1
" let g:vistarenderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }


" ===
" === vimtex
" ===
"let g:vimtex_view_method = ''
let g:vimtex_view_general_viewer = 'llpp'
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let maplocalleader=' '


" ===
" === Anzu
" ===
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap <Esc> <Plug>(anzu-clear-search-status)
" ===
" === vim-go
" ===
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 1
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_fmt_command = "goimports"

" ===
" === AutoFormat
" ===
nnoremap <silent> \f :retab<CR>:Autoformat<CR>


" ===
" === Prettier
" ===

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>p :Format<CR>


" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
nmap ' <Plug>(easymotion-bd-f)
nnoremap U <Plug>(easymotion-k)
" ===
" === goyo
" ===
nmap <LEADER>gy :Goyo<CR>

" ===
" === fastfold
" ===
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

" ===
" === tagalong
" ===
let g:tagalong_additional_filetypes = ['vue', 'javascript', 'javascriptreact', 'typescriptreact']

" ===
" === vim-easy-align
" ===
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ===
" === rainbow
" ===
let g:rainbow_active = 1
let g:rainbow_conf = {
      \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \ 'operators': '_,_',
      \ 'guis': [''],
      \ 'cterms': [''],
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \ 'separately': {
      \   '*': {},
      \   'tex': {
      \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \   },
      \   'lisp': {
      \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \   },
      \   'vim': {
      \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \   },
      \   'html': {
      \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \   },
      \   'css': 0,
      \}
      \}

" ===
" === xtabline
" ===
" let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
" " let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
" let g:xtabline_settings = {
"       \ 'relative_paths':           0,
"       \ 'tabline_modes':            ['buffers', 'tabs', 'arglist'],
"       \ 'buffer_filtering':         1,
"       \}
" let g:xtabline_settings.enable_persistance = 0
" let g:xtabline_settings.last_open_first = 1
" noremap to :XTabCycleMode<CR>
" noremap \p :XTabInfo<CR>
"
" let g:xtabline_settings.buffers_paths = 0
" let g:xtabline_settings.current_tab_paths = 0
" let g:xtabline_settings.other_tabs_paths = 0
"
" ===
" === vim session
" ===
" let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
" let g:session_autosave = 'no'
" let g:session_autoload = 'no'
" "let g:session_autosave_periodic = 1
" let g:session_autosave_silent = 1
" set sessionoptions+=buffers
" set sessionoptions-=options
" noremap sl :OpenSession<CR>
" noremap ss :SaveSession<CR>
" noremap sc :CloseSession<CR>
" noremap sD :DeleteSession<CR>
" noremap sA :AppendTabSession<CR>

" ===
" === vim-workspace
" ===
let g:workspace_session_directory = $HOME . '/.config/nvim/tmp/sessions/'
let g:workspace_autosave = 0
nnoremap ss :ToggleWorkspace<CR>
" === startify
let g:startify_session_dir= $HOME."/.config/nvim/tmp/sessions"
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   Dirs '. getcwd()] },
      \ { 'type': 'files',     'header': ['   Files']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_files_number = 5
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1
let g:startify_relative_path = 1
let g:startify_bookmarks = [
      \ { 'v': '~/.config/nvim' },
      \ { 'z': '~/.zshrc' },
      \ ]

" ===
" === nerdcommenter
" ===
" Vue comment hook
" let g:ft = ''
" function! NERDCommenter_before()
"   if &ft == 'vue'
"     let g:ft = 'vue'
"     let stack = synstack(line('.'), col('.'))
"     if len(stack) > 0
"       let syn = synIDattr((stack)[0], 'name')
"       if len(syn) > 0
"         exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
"       endif
"     endif
"   endif
" endfunction
" function! NERDCommenter_after()
"   if g:ft == 'vue'
"     setf vue
"     let g:ft = ''
"   endif
" endfunction
" map <Leader>/ <plug>NERDCommenterToggle
" imap <C-c> <plug>NERDCommenterInsert
" let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:NERDToggleCheckAllLines = 1
" let g:NERDDefaultAlign = 'left'
" let g:NERDTrimTrailingWhitespace = 1
" let g:NERDCommentEmptyLines = 1
" let g:NERDCreateDefaultMappings = 0

" ===
" === caw.vim
" ===

map <leader>/ <plug>(caw:hatpos:toggle)
imap <C-c> <ESC><Plug>(caw:dollarpos:comment)

" vim-rooter

let g:rooter_patterns = ['.root', 'package.json', '.git/']
let g:rooter_change_directory_for_non_project_files = 'current'

" ===
" === context.vim
" ===
let g:context_nvim_no_redraw = 1
let g:context_enabled = 0

" ===================== End of Plugin Settings =====================

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" fun! SetCursor()
"   " Don't strip on these filetypes
"   if &ft =~ 'list'
"     return
"   endif
"
  set guicursor=i:ver100-iCursor-blinkwait200-blinkon400-blinkoff250
  set guicursor=n:block-blinkon400
  set guicursor=v:block
" endfun
" au BufEnter * call SetCursor()

if exists('g:started_by_firenvim')
  colorscheme xcodelight
  set wrap
  set laststatus=0
else
  set laststatus=2
endif
au BufEnter github.com_*.txt set filetype=markdown
let g:firenvim_config = {
      \ "globalSettings": {
      \ "alt": "all"
      \}
      \}

" ---------------------------------------------------------------------
" About Chinese: f[[
" punctuations auto changing has unexpected problems
imap （ (
imap ） )
imap 』 }
imap 『 {
imap 【 [
imap 】 ]
imap 。 .
imap ， ,
imap ； ;
imap ： :
imap “ "
imap ” "
imap ‘ '
imap ’ '
imap ？ ?
imap ！ !
imap 》 >
imap 《 <
imap 、 /
imap ￥ $
imap 》 >
imap 《 <
map ： :
map ； :
func! Replace_Chn()                     " for writing latex
	let chinese={"（" : "(" , "）" : ")" , "，" : ",", "；" : ";", "：" : ":",
	"？" : "?", "！" : "!", "“" : "\"", "’" : "'" ,
	""”" : "\"", "℃" : "\\\\textcelsius", "μ" : "$\\\\mu$"}
	for i in keys(chinese)
		silent! exec '%substitute/' . i . '/'. chinese[i] . '/g'
	endfor
endfunc
function! ToggleVerbose()
 if !&verbose
 set verbosefile=/tmp/vim-verbose.log
 set verbose=15
 else
 set verbose=0
 set verbosefile=
 endif
endfunction
