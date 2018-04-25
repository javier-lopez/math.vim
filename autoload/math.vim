" ============================================================================
" File:        math.vim
" Description: global plugin to do math operations on vim
" Maintainer:  Javier Lopez <m@javier.io>
" ============================================================================

python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))

function! math#GetVisualSelection() "{{{
  "why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  try
      let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
      let lines[0] = lines[0][col1 - 1:]
  catch /^Vim\%((\a\+)\)\=:E/
      return ''
  endtry
  return join(lines, "\n")
endfunction

function! math#CopyToClipboard(result) "{{{
  if g:clipboard ==? 'vim' || g:clipboard ==? 'all'
    call setreg('"', a:result)
  endif
  if g:clipboard ==? 'external' || g:clipboard ==? 'all'
    if executable('xclip')
      call system('printf "' .  a:result . '"' . ' | ' .
            \ 'xclip -selection clipboard; xclip -o -selection clipboard')
    elseif executable ('xsel')
      call system('printf "' .  a:result . '"' . ' | ' .  'xsel -bi')
    elseif executable ('pbcopy')
      call system('printf "' .  a:result . '"' . ' | ' .
            \ 'pbcopy')
    endif
    if has("win32") || has("win16")
      call setreg('*', a:result)
    endif
  endif
  if exists('g:clipboard_cmd')
      call system('printf "' .  a:result . '"' . ' | ' .  g:clipboard_cmd)
  endif
endfunction

function! math#Sum(line1, line2)
  if a:line1 == 1 && a:line2 == line('$')
      let buffer = join(getline(a:line1, a:line2), "\n") . "\n"
  else
      let buffer = math#GetVisualSelection()
      if empty(buffer)
        let buffer = join(getline(a:line1, a:line2), "\n") . "\n"
      endif
  endif

  redraw | echon 'Calculating ... '

  python3 << endOfPython
from vim_math import math_sum

buffer = vim.eval('buffer').split('\n')
buffer = list(filter(None, buffer))

result = str(math_sum(buffer))
vim.command("let result = string(" + result + ")")
endOfPython

  if empty(result)
      redraw | echohl WarningMsg|echomsg "Error: couldn't calculate selected input" |echohl None
  else
      call math#CopyToClipboard(result)
      redraw | echomsg "= " . result
  endif
endf
