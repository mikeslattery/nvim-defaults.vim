# Neovim Defaults For Vim

Sets options in Vim to the sames as [Neovim's defaults](https://neovim.io/doc/user/vim_diff.html).

## Status

I no longer use or maintain this plugin.
I've found Neovim alternative use-cases sufficient, and am no longer using Vim.
If you need help or a fix, I'll gladly help, time permitting.
See alternatives at bottom.

## Features

* Sources `~/.config/nvim/init.vim` and sets `$MYVIMRC` to it.
* `runtimepath` and other paths extended for Neovim directory structure
* `set` default values similar to Neovim's
* Neovim default mappings, including `Q`
* Default plugins (Man, matchit, syntax)
* `Stdpath()` function equivalent to Neovim's `stdpath()`
* True color support in Tmux with `termguicolors`
* Set `$XDG_*` values

### But Why?

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

### Editor Commands

* `UpdateDefaults` - To get updates
* `MapQ` - For full support of [Q mapping](https://neovim.io/doc/user/repeat.html#Q).

## More Details

### Caveats

In summary, I can't make Vim into Neovim.

* Make use of `if has('nvim')` to conditionally skip code in your configuration that only will work in Neovim.
* Lua is not supported.
* Plugins written specifically to only work for Neovim, will continue to *not* work for Vim.
* This is not tested with Windows.

### Reporting Issues and Contributing

* Please do!   I'd love improvments in the `README.md`.
* If you report a good issue, I'll likely turn it around quickly.  I use this project daily.
* The scope of this project is limited to making stock Vim 7, 8 more like nightly Neovim.  No more; no less.
* I do not test in environments other than Linux + Tmux.  I may need assistance with tickets specific to other environments.
* If you notice no commits in a while, run `nvim-diff.sh` to see if options need to be added.  Write an issue or pull request.

### Alternatives

I have found I can use Neovim everwhere I want with my personal config, even in restricted environments.
If I don't need Vim, then I don't need this plugin.
Most preferred by me at top, and most preferred by paranoid corporate policy writers at bottom.

* AppImage.  Doesn't require root to install.  Easy to download and run.
* Exploded AppImage.  For when AppImage can't mount.  It's just a set of user-owned files.
* Realtime remote sync.  Edit files locally.  There are various tools that will synchronize directories over ssh.
* Neovim and netrw support browsing and editing files over ssh.  No need to install anything.
* Vim/Vi.  If I really have to, I'll use it.  It's not even that big of deal, if infrequent.  I have a stripped down version of my `.vimrc` and `.exrc` for my most important mappings.

### References and Technical Notes

* <https://github.com/noahfrederick/vim-neovim-defaults>
* <https://github.com/noahfrederick/vim-neovim-defaults/blob/master/plugin/neovim_defaults.vim>
* <https://neovim.io/doc/user/starting.html#startup>
* <https://neovim.io/doc/user/vim_diff.html>
* <https://github.com/vim/vim/blob/master/runtime/defaults.vim>
* <https://github.com/neovim/neovim/blob/master/src/nvim/os/stdpaths.c>
* Options were partially determined by running `nvim-diff.sh`
* If you want to install `nvim` on a Linux server, `install-nvim.sh` is supplied as an example.
