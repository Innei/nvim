" Author:   Innei
" Author:   Innei
" Github:   https://github.com/innei
" License:  MIT
" Github:   https://github.com/innei
" License:  MIT

scriptencoding utf-8

let s:script_path = expand('<sfile>:p:h')

let s:sourceList = [
      \ 'init',
      \ 'general',
      \ 'mapping',
      \ 'plugins',
      \ 'functions',
      \ 'commands',
      \ 'autocmds',
      \ 'neovim',
      \ 'plugins.config',
      \ 'style',
      \ 'vscode',
      \]
for s:item in s:sourceList
  exec 'source ' . s:script_path . '/viml/' . s:item . '.vim'
endfor

" Free memory
unlet s:script_path
unlet s:sourceList
