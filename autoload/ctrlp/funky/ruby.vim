" File: autoload/ctrlp/funky/ruby.vim
" Description: adds ruby support to ctrlp's funky extension
" Author: Takahiro YOSHIHARA
" License: the MIT License

function! ctrlp#funky#ruby#filter(bufnr)
  let filter = [{ 'pattern': '\m\C^[\t ]*def[\t ]\+\S\+',
                \ 'filter': []}
  \ ]

  if get(g:, 'ctrlp_funky_ruby_requires', 1)
    call extend(filter, [{ 'pattern': '\m\C^[\t ]*require\(_relative\)\?[\t ]\+\S\+',
                         \ 'filter': []}])
  endif

  if get(g:, 'ctrlp_funky_ruby_classes', 1)
    call extend(filter, [{ 'pattern': '\m\C^[\t ]*class[\t ]\+\S\+',
                         \ 'filter': []}])
  endif

  if get(g:, 'ctrlp_funky_ruby_modules', 1)
    call extend(filter, [{ 'pattern': '\m\C^[\t ]*module[\t ]\+\S\+',
                         \ 'filter': []}])
  endif

  if get(g:, 'ctrlp_funky_ruby_contains_rake', 1)
    call extend(filter, [{ 'pattern': '\m\C^[\t ]*task[\t ]\+\S\+',
                         \ 'filter': ['\m\C^[\t ]*', '', '']}])
  endif

  return ctrlp#funky#abstract(a:bufnr, filter)
endfunction

