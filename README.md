friendly-grep.vim
============

you can grep easily with this plugin.

Installation
------------

if you use vundle, execute `:BundleInstall` after adding the following line into your .vimrc.

```vim:.vimrc
  Bundle 'akira-hamada/friendly-grep.vim'
```

or Download files and put them into your plugin and autoload directory.

How to Use
------------

just execute the following command.

`:FriendlyGrep`

I recommend you add shortcut for the function into your vimrc like this.

`nnoremap <C-g> <ESC>:FriendlyGrep<CR>`

[demo movie](http://www.youtube.com/watch?v=xpNYo39pCkg)

Options
------------

```vim
  let g:friendlygrep_target_dir = 'path/to/dir/you/often/grep/'

  let g:friendlygrep_recursively = 1
  " if you set this option 1, you can grep recursively always without question.

  let g:friendlygrep_display_result_in = 'tab'
  " if you set 'tab' for this option, the plugin opens result in newtab.
  " you can set 'split', 'vsplit' or 'quickfix' as value.
```
