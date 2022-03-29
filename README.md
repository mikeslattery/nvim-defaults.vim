# NeoVim Defaults For Vim

Sets options in Vim to the sames as [NeoVim's defaults](https://neovim.io/doc/user/vim_diff.html).

## Features

* NeoVim `set` values
* True color support in Tmux with `termguicolors`
* Set `$XDG_*` values
* `Stdpath()` function equivalent to NeoVim's `stdpath()`
* NeoVim default mappings, including `Q`
* Default plugins (Man, matchit, syntax)

## But Why?

* When remoting into a server that doesn't have `nvim` installed
* Prefer to use Vim, but want more sensible defaults

## Installation

Run in the terminal:

```sh
cd ~
mkdir -p .config/nvim
mv .vimrc .config/nvim/init.vim
curl -LO https://raw.githubusercontent.com/mikeslattery/nvim-defaults.vim/master/plugin/.vimrc
```

### Alternate Ways to Install

If using gVim for Windows, run in PowerShell:

```sh
cd ~
mkdir -p $LOCALAPPDATA/nvim
mv .vimrc $LOCALAPPDATA/nvim/init.vim
wget https://raw.githubusercontent.com/mikeslattery/nvim-defaults.vim/master/plugin/.vimrc
```

You can install as a plugin with vim-plug.  This may not work as well.

```
Plug 'mikeslattery/nvim-defaults.vim'
runtime! plugin/.vimrc
```

## Commands

* `UpdateDefaults` - To get updates
* `MapQ` - For full support of [Q mapping](https://neovim.io/doc/user/repeat.html#Q).

## References and Technical Notes

* <https://github.com/noahfrederick/vim-neovim-defaults>
* <https://github.com/noahfrederick/vim-neovim-defaults/blob/master/plugin/neovim_defaults.vim>
* <https://neovim.io/doc/user/starting.html#startup>
* <https://neovim.io/doc/user/vim_diff.html>
* <https://github.com/vim/vim/blob/master/runtime/defaults.vim>
* <https://github.com/neovim/neovim/blob/master/src/nvim/os/stdpaths.c>
* Options were partially determined by running `nvim-diff.sh`
