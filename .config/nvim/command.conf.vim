"------Commands config------"
" Auto remove trailing spaces
augroup utils_user_config
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup end
"------End commands config------"
