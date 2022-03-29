# Neovim Defaults For Vim

Sets options in Vim to the sames as [Neovim's defaults](https://neovim.io/doc/user/vim_diff.html).

## Features

* Neovim `set` values
* True color support in Tmux with `termguicolors`
* `runtimepath` extended for Neovim directory structure
* Set `$XDG_*` values
* `Stdpath()` function equivalent to Neovim's `stdpath()`
* Neovim default mappings, including `Q`
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

### Alternate ways to install

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

## Caveats

In summary, I can't make Vim into Neovim.

* Make use of `if has('nvim')` to conditionally skip code in your configs that only will work in Neovim.
* Lua is not supported.
* Plugins written specifically to only work for Neovim, will continue to not work for Vim.
* Don't expect Vim to magically work exactly like Neovim.  There are a lot of things out of my control.
* This is not tested with Windows.

## Reporting Issues and Contributing

* Please do!   I'd love improvments in the `README.md`.
* If you report a good issue, I'll likely turn it around quickly.  I use this project daily.
* The scope of this project is limited to making stock Vim 7, 8 more like nightly Neovim.  No more; no less.
* Before starting on a pull request, create an issue, if none, to make sure it's something I'll be willing to merge.
* I do not test in environments other than Linux + Tmux.  I may not pick up tickets I can't test for, but I will accept pull requests.
* If you notice no commits in a while, run `nvim-diff.sh` to see if there options that need to be added to `.vimrc`.  Write an issue or pull request.

## References and Technical Notes

* <https://github.com/noahfrederick/vim-neovim-defaults>
* <https://github.com/noahfrederick/vim-neovim-defaults/blob/master/plugin/neovim_defaults.vim>
* <https://neovim.io/doc/user/starting.html#startup>
* <https://neovim.io/doc/user/vim_diff.html>
* <https://github.com/vim/vim/blob/master/runtime/defaults.vim>
* <https://github.com/neovim/neovim/blob/master/src/nvim/os/stdpaths.c>
* Options were partially determined by running `nvim-diff.sh`
