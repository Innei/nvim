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
  silent !cp ~/.config/nvim/plug.vim ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
" set autochdir
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
" ===
" === Editor behavior
" ===
set number
" set relativenumber
set mouse=niv
set cursorline
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set smarttab
set signcolumn=yes
set list
set listchars=tab:▸-,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set linebreak
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
set noshowcmd
autocmd CursorHold * :echo
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
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
set updatetime=1000

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
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

" NETRW
let g:netrw_winsize = 24
let g:NetrwIsOpen = 0

noremap <C-b> :NERDTreeToggle<CR>

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :
noremap : q:i
noremap r <C-r>
nnoremap X r
nnoremap <BS> X
" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
nnoremap <silent> S :w<CR>
noremap <silent> <C-S> :wa<CR>
inoremap <silent> <C-s> <ESC>:w<CR>i
" vnoremap <BS> x
inoremap <S-CR> <ESC>o
" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
noremap <LEADER>st :Startify<CR>

" Undo operations
" noremap l u
" Redi operations
" noremap R <C-r>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" Folding
noremap <silent> l za

" Open up lazygit
noremap \g :term lazygit<CR>

" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
"noremap <silent> u k
"noremap <silent> n h
"noremap <silent> e j
"noremap <silent> i l
noremap k <nop>
noremap j :Vista!!<CR>
noremap J :BTags<CR>
noremap h <nop>
noremap . <C-I>
noremap , <C-O>
noremap = <C-a>
noremap - <C-x>
noremap <C-a> <nop>
noremap <C-x> <nop>
noremap <Home> ^
inoremap <Home> <esc>^i
" U/E keys for 5 times u/e (faster navigation)
noremap <silent> F 5k
noremap <silent> E 5j

" N key: go to the start of the line
"noremap <silent> N 0
" I key: go to the end of the line
"noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Go next or forward word under cursor
nnoremap \\ *
nnoremap \| #
" select word
inoremap <M-d> <ESC>viw<C-g>
nnoremap <M-d> viw<C-g>
snoremap <M-d> <ESC>*ve<C-g>
snoremap <M-D> <ESC>#ve<C-g>
snoremap <ESC> <ESC>:noh<CR>
" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


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

"
inoremap <S-up> <ESC>:m .-2<CR>i
inoremap <S-down> <ESC>:m .+1<CR>i
inoremap <S-left> <ESC>bi
inoremap <S-right> <Esc>ea

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
noremap s<up> :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap s<down> :set splitbelow<CR>:split<CR>
noremap s<left> :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap s<right> :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <S-up> :res +5<CR>
noremap <S-down> :res -5<CR>
noremap <S-left> :vertical resize-5<CR>
noremap <S-right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with t/
noremap t/ :tabe<CR>
" Move around tabs with t, and t.
noremap t, :-tabnext<CR>
noremap t. :+tabnext<CR>
" Move the tabs with tm, and tm.
noremap tm, :-tabmove<CR>
noremap tm. :+tabmove<CR>

" ===
" === Buffer manage
" ===
noremap <C-\> :bprevious<CR>
noremap <C-]> :bnext<CR>

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" Move the next character to the end of the line with ctrl+9
inoremap <C-u> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>. :set nosplitbelow<CR>:split<CR><C-w>w:terminal<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER>+ <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~<left>

noremap <C-c> zz

" Auto change directory to current dir
" autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet

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
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run %
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term node %
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
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc' " vim-session dep
" Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}
" Plug 'innei/discord.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'ananagame/vimsence', { 'on': [] }
augroup discord
  au!
  au InsertEnter * call plug#load('vimsence') | au! discord
  au InsertEnter * :call UpdatePresence()
augroup END
" Plug 'ObserverOfTime/discord.nvim', {'do': ':UpdateRemotePlugins', 'branch': 'refactored'}
" Plug 'ObserverOfTime/discord.nvim', { 'do': ':UpdateRemotePlugins'}
" Testing my own plugin
Plug 'theniceboy/vim-calc'

" Pretty Dress
" Plug 'theniceboy/eleline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'bling/vim-bufferline'
" Plug 'edkolev/tmuxline.vim'
" Plug 'edkolev/promptline.vim'
Plug 'ajmwagar/vim-deus'
Plug 'joshdick/onedark.vim'

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'
Plug 'RRethy/vim-illuminate'
Plug 'sakshamgupta05/vim-todo-highlight'
" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Taglist
Plug 'liuchengxu/vista.vim'

" Error checking, handled by coc

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" Plug 'zivyangll/git-blame.vim'
Plug 'tveskag/nvim-blame-line'
" Tex
"Plug 'lervag/vimtex'

" CSharp
"Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json', { 'for': ['vim-plug', 'json'] }
" Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jaxbot/browserlink.vim'
" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
Plug 'diepm/vim-rest-console', { 'for': ['vim-plug', 'rest'] }
" " Python
" " Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
" " Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
" "Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
" "Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
" Plug 'tweekmonster/braceless.vim'
"
" Markdown
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': 'markdown' }
Plug 'theniceboy/bullets.vim'

" Editor Enhancement
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
" Plug 'mg979/vim-visual-multi'
Plug 'scrooloose/nerdcommenter' " in <space>cn to comment a line
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'junegunn/vim-easy-align' " gaip= to align the = in paragraph,
"Plug 'tpope/vim-capslock'  " Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'
Plug 'Konfekt/FastFold'
Plug 'junegunn/vim-peekaboo'
Plug 'jesseleite/vim-noh'
Plug 'skywind3000/asyncrun.vim'
" Input Method Autoswitch

" Formatter
Plug 'Chiel92/vim-autoformat'

" For general writing
Plug 'junegunn/goyo.vim', { 'for': ['vim-plug', 'markdown'] }
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'osyo-manga/vim-anzu'

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
Plug 'mhinz/vim-startify'
Plug 'theniceboy/vim-leader-mapper'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'

" Other useful utilities
Plug 'tpope/vim-eunuch' " do stuff like :SudoWrite
Plug 'makerj/vim-pdf'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

" ColorScheme
Plug 'kaicataldo/material.vim'
call plug#end()

" experimental
set lazyredraw
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
" colorscheme material
let g:onedark_terminal_italics = 1
colorscheme onedark
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
set background=dark

" color xcodedark
hi Normal guibg=NONE ctermbg=NONE

"hi SpecialKey ctermfg=blue guifg=grey70
hi NonText guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE
" ===================== Start of Plugin Settings =====================

" ===
" === AsyncRun
" ===
let g:asyncrun_open = 8
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '.bzr', '_darcs', 'build.xml']
let g:asyncrun_shell = 'zsh -c'
let g:asyncrun_status = ''
nnoremap <leader><leader> :AsyncRun -cwd=<root> 
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

nnoremap <silent> cc :call QuickFix_toggle()<cr>
" ===
" === rnvimr
" ===
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
nnoremap <silent> R :RnvimrSync<CR>:RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
" Resize floating window by all preset layouts
tnoremap <silent> R <C-\><C-n>:RnvimrResize<CR>

" Customize the initial layout
let g:rnvimr_layout = {
            \'relative': 'editor',
            \ 'width': 100,
            \ 'height': 100,
            \ 'col': 0,
            \ 'row': 0
            \ }
" Customize multiple preset layouts
" '{}' represents the initial layout
let g:rnvimr_presets = [
      \ {'width': 1.0, 'height': 1.0},
      \ {'width': 0.500, 'height': 1.000, 'col': 0, 'row': 0},
      \ ]


" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#enabled = 1
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_extensions = ['tabline', 'hunks', 'branch', 'undotree', 'coc', 'netrw', 'vista', 'term']
let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#term#enabled = 1
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#bookmark#enabled = 1
let g:airline_section_c = airline#section#create(['%f','   ','%{get(b:,''coc_current_function'','''')}'])
let g:airline_section_b = airline#section#create(['%{get(b:,''coc_git_status'','''')}','%{get(g:,''coc_git_status'','''')}'])
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" ==
" == GitGutter
" ==
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap gf :GitGutterFold<CR>
nnoremap <silent> gh :GitGutterPreviewHunk<CR>
nnoremap g- :GitGutterPrevHunk<CR>
nnoremap g= :GitGutterNextHunk<CR>
nnoremap gu :GitGutterUndoHunk<CR>
nnoremap gs :GitGutterStageHunk<CR>

" ===
" === Git-fugitive (code review)
" ===
nnoremap <leader>gs :Gdiffsplit<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gr :Grebase<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gg :G<CR>

" autocmd BufEnter * EnableBlameLine
let g:blameLineVirtualTextPrefix = '     ~ '
" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=underline gui=underline
" hi illuminatedWord cterm=inverse gui=inverse
let g:Illuminate_highlightUnderCursor = 0
let g:Illuminate_ftblacklist = ['nerdtree']
" ===
" === coc
" ===
" fix the most annoying bug that coc has
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-tslint', 'coc-git', 'coc-explorer', 'coc-pyright', 'coc-translator', 'coc-prettier', 'coc-snippets', 'coc-eslint', 'coc-highlight', 'coc-zi', 'coc-github-users', 'coc-actions']

"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
nnoremap <c-c> :CocCommand<CR>
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

nmap tt :CocCommand explorer<CR>
" coc-todolist
noremap ta :CocCommand todolist.create<CR>
noremap td :CocCommand todolist.upload<CR>
noremap tD :CocCommand todolist.download<CR>
noremap tc :CocCommand todolist.clearNotice<CR>
noremap tc :CocCommand todolist.clearNotice<CR>
noremap tl :CocList --normal todolist<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" coc-zi
noremap \d :CocList translators<CR>

nnoremap <silent> <leader>b :CocCommand actions.open<cr>
" ===
" === MarkdownPreview
" ===
" let g:mkdp_auto_start = 0
" let g:mkdp_auto_close = 1
" let g:mkdp_refresh_slow = 0
" let g:mkdp_command_for_global = 0
" let g:mkdp_open_to_the_world = 0
" let g:mkdp_open_ip = ''
" let g:mkdp_echo_preview_url = 0
" let g:mkdp_browserfunc = ''
" let g:mkdp_preview_options = {
"       \ 'mkit': {},
"       \ 'katex': {},
"       \ 'uml': {},
"       \ 'maid': {},
"       \ 'disable_sync_scroll': 0,
"       \ 'sync_scroll_type': 'middle',
"       \ 'hide_yaml_meta': 1
"       \ }
" let g:mkdp_markdown_css = ''
" let g:mkdp_highlight_css = ''
" let g:mkdp_port = ''
" let g:mkdp_page_title = '「${name}」'

" ===
" === vim-surround
" ===
nmap kw ysiw
nmap ks cs
nmap kcs yss

noremap gv :GV<CR>

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

noremap <C-f> :Ag<CR>


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
noremap <C-w> :BuffersPreview<CR>
" let g:fzf_preview_default_key_bindings = 'ctrl-e:down,ctrl-u:up'
let g:fzf_preview_layout = 'belowright split new'
let g:fzf_preview_rate = 0.4
let g:fzf_full_preview_toggle_key = '<C-f>'
let g:fzf_preview_command = 'ccat --color=always {-1}'
let g:fzf_binary_preview_command = 'echo "It is a binary file"'


" ===
" === CTRLP (Dependency for omnisharp)
" ===
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'



" ===
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappings = 1
nmap mt <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap m. <Plug>BookmarkNext
nmap m, <Plug>BookmarkPrev
nmap mc <Plug>BookmarkClear
nmap mC <Plug>BookmarkClearAll
nmap mu <Plug>BookmarkMoveUp
nmap me <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1


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


" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key = '<c-d>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key = 'g<c-d>'
let g:multi_cursor_select_all_key = 'g<a-k>'
let g:multi_cursor_next_key = '<c-d>'
let g:multi_cursor_prev_key = '<c-p>'
let g:multi_cursor_skip_key = '<C-s>'
let g:multi_cursor_quit_key = '<Esc>'
" ===
" === Far.vim
" ===
noremap <LEADER>f :F  **/*<left><left><left><left><left>
set wildignore+=*/node_modules/*
let g:far#source='ag'
set ignorecase smartcase
" ===
" === vim-calc
" ===
noremap <LEADER>a :call Calc()<CR>


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
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" ===
" === Ranger.vim
" ===
" nnoremap R :Ranger<CR>
" let g:ranger_map_keys = 0


" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === Ultisnips
" ===
" let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
"

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
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" ===
" === vim-go
" ===
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
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


" ===
" === AutoFormat
" ===
nnoremap <silent> \f :retab<CR>:Autoformat<CR>


" ===
" === Prettier
" ===

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>p :Prettier<CR>

" ===
" === Colorizer
" ===
let g:colorizer_syntax = 1


" ===
" === vim-floaterm
" ===
"nnoremap ? :FloatermToggle<CR>
"let g:floaterm_position = 'center'
"let g:floaterm_winblend = 20
"let g:floaterm_height = winheight(0)/3*2
"let g:floaterm_width = &columns/3*2


" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
map ' <Plug>(easymotion-bd-f)
nmap ' <Plug>(easymotion-bd-f)
"map E <Plug>(easymotion-j)
"map U <Plug>(easymotion-k)
"nmap f <Plug>(easymotion-overwin-f)
"map \; <Plug>(easymotion-prefix)
"nmap ' <Plug>(easymotion-overwin-f2)
"map 'l <Plug>(easymotion-bd-jk)
"nmap 'l <Plug>(easymotion-overwin-line)
"map  'w <Plug>(easymotion-bd-w)
"nmap 'w <Plug>(easymotion-overwin-w)


" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === jsx
" ===
let g:vim_jsx_pretty_colorful_config = 1


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
" === vim-easy-align
" ===
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" ===
" === vim-after-object
" ===
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === vim-map-leader
" ===
let g:leaderMenu = {'name':  "Shortcut Menu",
      \'SPC Enter':  ['Clear search'],
      \'SPC dw':  ['Remove adj. dup. words'],
      \'SPC tt':  ['spc to tabs'],
      \'SPC o':  ['Open folds'],
      \'SPC q':  ['Close win below'],
      \'SPC <SPC>':  ['Find <++>'],
      \'SPC sc':  ['Toggle spell-check'],
      \'SPC gf':  ['Fold unchanged'],
      \'SPC rn':  ['Rename variable'],
      \'SPC tm':  ['Toggle table-mode'],
      \'SPC gy':  ['Toggle focus mode'],
      \'Ctrl V':  ['Open in vsplit fzf'],
      \'Ctrl T':  ['Open in tab fzf'],
      \'Meta P':  ['Toggle autopair'],
      \'Meta e':  ['Move pairs after sections']
      \}
nnoremap <silent> ? :call leaderMapper#start() "<Space>"<CR>
let g:leaderMapperWidth = 80


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
      \ }
      \}

" ===
" === xtabline
" ===
" let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
" let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
" let g:xtabline_settings.enable_persistance = 0
" let g:xtabline_settings.last_open_first = 1
" noremap to :XTabCycleMode<CR>
" noremap \p :XTabInfo<CR>


" ===
" === vim session
" ===
let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
let g:session_autosave = 'no'
let g:session_autoload = 'no'
"let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1
set sessionoptions-=buffers
set sessionoptions-=options
noremap sl :OpenSession<CR>
noremap ss :SaveSession<CR>
noremap sc :CloseSession<CR>
noremap sD :DeleteSession<CR>
noremap sA :AppendTabSession<CR>
" === startify
let g:startify_session_dir= $HOME."/.config/nvim/tmp/sessions"
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   Dirs '. getcwd()] },
      \ { 'type': 'files',     'header': ['   Files']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   Files']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_files_number = 10
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
map <Leader>/ <Leader>c<Leader>
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

" ===
" === discord RPC
"
noremap <Leader>d :DiscordUpdatePresence<CR>

" ===================== End of Plugin Settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"



if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[7 q"' | redraw!
  au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' |
        \   silent execute '!echo -ne "\e[5 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[4 q"' | redraw! |
        \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
set guicursor=i:ver100-iCursor-blinkwait200-blinkon400-blinkoff250
set guicursor=n:block-blinkon400
set guicursor=v:block
