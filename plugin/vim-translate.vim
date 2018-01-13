" ===============================================================================================
" File:        vim-translate.vim
" Description: vim plugin to translate text
" Maintainer:  Ryan Jennings
" License:     MIT
" Notes:       Press <leader>t in visual mode to translate highlighted text
"
" ===============================================================================================

if !has('python3')
  finish
endif

function! Translate(text)
  let input_text = a:text
python3 << EOF
from googletrans import Translator
from vim import *

translator = Translator()
# translated_text = translator.translate('ПОЧИТАТЬ ', dest='en')
# я читаю газету 
text_to_translate = vim.eval("input_text")
translated_text = translator.translate(text_to_translate, dest='en')
vim.command("let return_text = '%s'" % translated_text.text)
EOF
  return return_text
endfunc

function! Get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - 1]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! Translate_text()
  let a:datum = Get_visual_selection()
  let a:returnVal = Translate(a:datum)
  echom a:returnVal
endfunction

vnoremap <leader>t :call<Space>Translate_text()<CR>
