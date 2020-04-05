if !exists('g:vscode')
  "   " Genreal Highlighter
  "   Plug 'jaxbot/semantic-highlight.vim'
  "   Plug 'sakshamgupta05/vim-todo-highlight'
  " HTML, CSS, JavaScript, PHP, JSON, etc.
  Plug 'neoclide/jsonc.vim', { 'for': 'jsonc' }
  Plug 'yuezk/vim-js', { 'for': ['php', 'html', 'javascript', 'css', 'less', 'javascriptreact'] }
  
  Plug 'jelera/vim-javascript-syntax', { 'for': ['php', 'html', 'javascript', 'css', 'less', 'javascriptreact'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascriptreact', 'typescriptreact'] }
  " Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
  Plug 'posva/vim-vue', { 'for': 'vue' }
  Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
  Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescriptreact'] }
  " Go
  Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
  
  " swift
  "   Plug 'keith/swift.vim', { 'for': ['swift'] }
  " Tex
  "   Plug 'lervag/vimtex'
  " Plug 'sheerun/vim-polyglot'
endif
