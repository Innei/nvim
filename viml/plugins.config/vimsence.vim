augroup discord
  au!
  au InsertEnter * call plug#load('vimsence') | au! discord
  au InsertEnter * :call UpdatePresence()
augroup END
