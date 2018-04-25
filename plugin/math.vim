" ============================================================================
" File:        math.vim
" Description: global plugin to do math operations in vim
" Maintainer:  Javier Lopez <m@javier.io>
" ============================================================================

" Init {{{1
if exists('g:loaded_math_vim') || &cp
  finish
endif
let g:loaded_math_vim = 1

if v:version < '700'
  echoerr "math.vim unavailable: requires Vim 7.0+"
  finish
endif

" Default configuration {{{1
if exists('g:clipboard')
  let g:clipboard = g:clipboard =~? 'none\|vim\|external\|all' ? tolower(g:clipboard) : 'all'
else
  let g:clipboard = 'all'
endif

"if !exists('g:math_providers')    | let g:math_providers = 'sprunge,ix' | endif
"if !exists('g:math_open_browser') | let g:math_open_browser = 0         | endif
"if !exists('g:math_map')          | let g:math_map = '<Leader>s'        | endif
"if !exists('g:math_tabs2spaces')  | let g:math_tabs2spaces = 0          | endif
"if !exists('g:math_flush_left')   | let g:math_flush_left  = 0          | endif

" Commands & Mappings {{{1
command! -nargs=0 -range=% VimSum call math#Sum(<line1>,<line2>)

"if !hasmapto('<Plug>VimSum')
    "try
        "exe "nmap <unique> " . g:math_map . " <Plug>VimSum"
        "exe "xmap <unique> " . g:math_map . " <Plug>VimSum"
    "catch /^Vim(.*):E227:/
        "if(&verbose != 0)
            "echohl WarningMsg|echomsg 'Error: math sum default mapping: ' . g:math_map
            "\ . 'is already taken, refusing to overwrite it. See :h MathConfig-map' |echohl None
        "endif
    "endtry
"endif

"nnoremap <unique> <script> <Plug>VimSum :VimSum<CR>
"xnoremap <unique> <script> <Plug>VimSum :VimSum<CR>
