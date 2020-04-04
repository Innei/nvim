" Editor Enhancement
" Plug 'xolox/vim-session'
" Plug 'xolox/vim-misc' vim-session dep
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
" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'osyo-manga/vim-anzu'

"
if !exists('g:started_by_firenvim')
  Plug 'mhinz/vim-startify'
endif

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'
