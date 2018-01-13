" ===============================================================================================
" File:        vim-translate.vim
" Description: vim plugin to translate text
" Maintainer:  Ryan Jennings
" License:     MIT
" Notes:       Press <leader>t in visual mode to translate highlighted text
"
" ===============================================================================================

" Fails if vim doesn't have python3 support
if !has('python3')
  finish
endif

function! Translate(text)
  " Set variable accessable in python through vim module
  let input_text = a:text

  " Start python
python3 << EOF
from googletrans import Translator
from vim import *

# Language that the google translate api will translate words into
translate_into = 'en'

# Start translator instance
translator = Translator()

text_to_translate = vim.eval("input_text")
translated_text = translator.translate(text_to_translate, dest=translate_into)
vim.command("let return_text = '%s'" % translated_text.text)
EOF
  " End python

  return return_text
endfunc

" Get selected text in visual mode
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

" mapping for calling Translate_text function
vnoremap <leader>t :call<Space>Translate_text()<CR>
