" Name: pasters.vim
" Author: flqwer <github.com/flqwer>
" Description: uploads the contents of the buffer or register to https://paste.rs

function! pasters#buffer() abort
  let content = join(getline(1, '$'), "\n")
  let result = system('echo ' . shellescape(content) . ' | curl -s --data-binary @- https://paste.rs')
  echo 'Uploaded buffer to ' . result
endfunction

function! pasters#register() abort
  let content = getreg('')
  let result = system('echo ' . shellescape(content) . ' | curl -s --data-binary @- https://paste.rs')
  echo 'Uploaded register content to ' . result
endfunction

command! -nargs=0 Paste :call pasters#buffer()
command! -nargs=0 PasteReg :call pasters#register()
