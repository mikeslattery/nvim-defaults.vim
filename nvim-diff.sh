#!/bin/bash
#shellcheck disable=SC2016

# Show defaults differences between vim and nvim
# except those handled by my .vimrc.

# This is used to maintain .vimrc
# to set vim defaults similar to nvim defaults.


has() { command -v "$@" >/dev/null 2>&1; }

# fedora
if has vimx && ! has vim; then
  vim() { vimx "$@"; }
fi

cleanit() {
  cat "$1" | sed -r '
    # no=off
    s/^no(.*)/\1=off/;
    s|^ *||;

    # Remove system paths
    /^(packpath|runtimepath)=/ {
      s|/etc/xdg/nvim(/after)?,||g;
      s|/usr/(local/)?share/n?vim(/vimfiles)?(/vim82)?(/runtime)?(/site)?(/after)?,||g;
      s|/usr/lib/n?vim,||g;
      s|[^,]*flatpak[^,]*,||g;
      s|[^,]*matchit[^,]*,||g;
    }

    # path differences
    s|/tmp/\.mount_nvim[^/]*/|/|g;
    s|/vimswap|/swap|;
    s|/vimundo|/undo|;
    s|^(shadafile)=$|\1=~/.local/share/nvim/shada/main.shada|;

    # Naming differences
    s|main.shada|viminfo|g;
    s|shada|viminfo|g;

    # option values not in both
    /^cpoptions=/ { s/_//; };
    /^diffopt=/ { s/,closeoff//; };
    /^display=/ { s/,msgsep//; };
    /^sessionoptions=/ { s/,terminal//; };

    # incomparable differences
    /^mouse=/ { s/=a/=/; };
    /^scroll=/ d;
    /^cdpath=/ d;

    # do not care
    /^highlight=/ d;
    /^printexpr=/ d;
    /^helpfile=/ d;

    # Neovim has an odd default for backupdir
    s/(backupdir=)\.,/\1/;

    ' | sort
}

# only include options that exist in both
cleaned() {
  cleanit "$1" | grep -f <(cleanit "$2" | sed -r 's/=.*$//; /^$/d; s/^/^/; s/$/\\b/;')
  # this isn't efficient, but who care?
}

vim  -u NONE -c 'source plugin/.vimrc' \
  +'redir! > /tmp/vs.txt | silent set! all | redir END | qa'
nvim -u NONE \
  +'redir! > /tmp/ns.txt | silent set! all | redir END | qa'

diff -u0 <(cleaned /tmp/vs.txt /tmp/ns.txt) <(cleaned /tmp/ns.txt /tmp/vs.txt) | \
  sed '/^@@/d' | \
  nvim --clean - -R '+set ft=diff'

rm -f /tmp/vs.txt /tmp/ns.txt
