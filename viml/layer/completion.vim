if !exists('g:vscode')
  " Auto Complete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Snippets
  Plug 'Innei/vim-snippets'

  if (!empty($TMUX))
    Plug 'wellle/tmux-complete.vim'
  endif
endif
