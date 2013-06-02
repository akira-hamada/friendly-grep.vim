friendly-grep.vim
============

you can use vimgrep easily with this plugin.

Installation
------------

if you use vundle, add the following line into your .vimrc, `then :BundleInstall`

```vim:.vimrc
  Bundle 'akira-hamada/friendly-grep.vim'
```

or Download files and put them into your plugin and autoload directory.

How to Use
------------

just execute the following command.

`:FriendlyGrep`

Options
------------

```vim
  let g:friendlygrep_target_dir = 'path/to/dir/you/often/grep/'
  let g:friendlygrep_recursively = 1
  let g:friendlygrep_display_result_in = 'tab'
```
