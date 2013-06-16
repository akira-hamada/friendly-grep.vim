friendly-grep.vim
============

you can grep easily with this plugin.

<a href="http://www.youtube.com/watch?v=xpNYo39pCkg" target="_blank">demo movie</a>

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

I recommend you add shortcut for the function into your .vimrc like this.

`nnoremap <C-g> <ESC>:FriendlyGrep<CR>`

Options
------------

```vim
  let g:friendlygrep_target_dir = 'path/to/dir/you/often/grep/'
  " You can set directory path you grep friquently.

  let g:friendlygrep_recursively = 1
  " if you set this option 1, you can grep recursively always without a prompt for you.
  " The default value is null (ask you recursive option everytime you grep)

  let g:friendlygrep_display_result_in = 'tab'
  " if you set 'tab' for this option, the plugin opens result in newtab.
  " you can set 'split', 'vsplit' or 'quickfix' as value.
  " The default value is 'split' (open results in top splited window)
```

Vimgrep Tips
---

You might want to add the following shortcuts to jump around the grep result into your .vimrc.

```vim:.vimrc
  nnoremap <LEFT> :cprevious<CR>
  nnoremap <RIGHT> :cnext<CR>
  nnoremap <UP> :<C-u>cfirst<CR>
  nnoremap <DOWN> :<C-u>clast<CR>
````
