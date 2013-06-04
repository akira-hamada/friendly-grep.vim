" autoload/friendlygrep.vim
" Author:  Akira Hamada <drumcorps.enthusiast@gmail.com>
" Version: 0.1
" Install this file as autoload/friendlygrep.vim.  This file is sourced manually by
" plugin/friendlygrep.vim.  It is in autoload directory to allow for future usage of
" Vim 7's autoload feature.

let s:save_cpo = &cpo
set cpo&vim

function! friendlygrep#FriendlyGrep()
  let s:return_flg = 0

  let query = s:get_grep_query_with('grep query: ')
  if s:return_flg == 1
    return
  endif

  let target = s:get_grep_target_with('target file/dir: ')
  if s:return_flg == 1
    return
  endif

  let target = s:set_grep_recursive_option_with('grep recursively? [y/n] ', target)
  if s:return_flg == 1
    return
  endif

  if exists('g:friendlygrep_display_result_in')
    if g:friendlygrep_display_result_in == 'tab'
      let display_style = 'tabnew'
    elseif g:friendlygrep_display_result_in == 'split'
      let display_style = 'split'
    elseif g:friendlygrep_display_result_in == 'vsplit'
      let display_style = '55vsplit'
    endif
  else
    let display_style = 'split'
    let g:friendlygrep_display_result_in = display_style
  endif
  if g:friendlygrep_display_result_in == 'tab' || g:friendlygrep_display_result_in == 'split' || g:friendlygrep_display_result_in == 'vsplit'
    execute display_style
  endif

  let move_tab_back_flg = s:set_move_tab_back_flg()

  try
    if g:friendlygrep_display_result_in == 'quickfix'
      let target .= ' | cw'
    endif
    execute 'vimgrep'.' '.query.' '.target
  catch
    if g:friendlygrep_display_result_in == 'tab'
      tabclose
      if move_tab_back_flg == 1
        tabprevious
      endif
    elseif g:friendlygrep_display_result_in == 'split' || g:friendlygrep_display_result_in == 'vsplit'
      quit!
    endif

    redraw | echohl WarningMsg | echo matchstr(v:exception, '^Vim\((\w*)\)\?:\s*\zs.*') | echohl None
  endtry

endfunction

function! s:get_grep_query_with(prompt_msg)
  let query = input(a:prompt_msg, '')
  if empty(query)
    let s:return_flg = 1
  endif

  return query
endfunction

function! s:get_grep_target_with(prompt_msg)
  if !exists('g:friendlygrep_target_dir')
    let g:friendlygrep_target_dir = ''
  endif
  let target = input(a:prompt_msg, g:friendlygrep_target_dir, 'file')
  if empty(target)
    let s:return_flg = 1
  endif

  return target
endfunction

function! s:set_grep_recursive_option_with(prompt_msg, target)
  let target = a:target

  if isdirectory(target)
    let target = target.'*'

    if exists('g:friendlygrep_recursively')
      if g:friendlygrep_recursively == 1
        let target = target.'**'
      endif
    else
      let input = input(a:prompt_msg)
      if empty(input)
        let s:return_flg = 1
      endif

      if input == "yes" || input == "y"
        let target = target.'**'
      endif
    endif
  endif

  return target
endfunction

function! s:set_move_tab_back_flg()
  let move_tab_back_flg = 0

  if g:friendlygrep_display_result_in == 'tab'
    if tabpagenr() != tabpagenr('$')
      let move_tab_back_flg = 1
    endif
  endif

  return move_tab_back_flg
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
