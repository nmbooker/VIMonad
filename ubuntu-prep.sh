#!/bin/bash

# # VIMonad listed deps (the ones Ubuntu provides anyway)
# sudo apt-get install cabal-install wmctrl taskwarrior xdotool ranger feh

# # Cabal deps
# sudo apt-get install zlib1g-dev libghc-parsec3-dev

# # Xmonad deps
# sudo apt-get install libghc-x11-dev libghc-mtl-dev

# Stack-based install

if ! fgrep -q "${HOME}/.local/bin" <<<"$PATH"
then
    echo "ERROR: You must put ${HOME}/.local/bin in your PATH in your .bashrc" >&2
    exit 3
fi
sudo apt-get -y install wmctrl taskwarrior xdotool ranger feh
sudo apt-get -y install libdb-dev libxft-dev libicu-dev
# Maybe also
# libxpm-dev libxrandr-dev libasound2-dev
# listed on https://www.reddit.com/r/xmonad/comments/6zg69d/xmonad_github_build_with_stack/

mkdir ~/.stack

# My backup program understands the CACHEDIR.TAG "standard"
cat > "${HOME}/.stack/CACHEDIR.TAG" <<EOF
Signature: 8a477f597d28d172789f06886806bc55
# This file is a cache directory tag created by nmbooker/VIMonad
# For information about cache directory tags, see:
#       http://www.brynosaurus.com/cachedir/
EOF

stack setup
