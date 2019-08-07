#!/home/linuxbrew/.linuxbrew/bin/fish
# add shortcuts and tools
source $HOME/.config/fish/functions/shortcuts.fish

# add homebrew paths


# add the LFS path
set LFS /mnt/lfs

# custom bindings to work with tmux
set -g fish_key_bindings fish_user_keybindings

# set the default editor to nvim
set -gx EDITOR nvim

# This is supposed to allow nvim to read man pages
set -gx PAGER "/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# if necessary set the keyboard layout
if test (type -q setxkbmap)
  echo "Setting up programmer dvorak - hopefully"
  setxkbmap -option
  setxkbmap -layout us -variant dvp -option compose:102 -option numpad:shift3 -option kpdl:semi -option keypad:atm -option caps:escape
end

if test -d "$HOME/Library/Python/3.7/lib/python/site-packages"
  set -gx POWERLINE_PATH $HOME/Library/Python/3.7/lib/python/site-packages/powerline
  set -g fish_user_paths $fish_user_paths $HOME/Library/Python/3.7/bin
else if test -d "$HOME/.local/lib/python3.7/site-packages"
  set -gx POWERLINE_PATH $HOME/.local/lib/python3.7/site-packages/powerline
else if test -d "/home/linuxbrew/.linuxbrew/lib/python3.7/site-packages"
  set -gx POWERLINE_PATH /home/linuxbrew/.linuxbrew/lib/python3.7/site-packages/powerline
end

# Add homebrew and it's installs to the path
set -g fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths

# Add ruby gems to the path
set -g fish_user_paths $fish_user_paths $HOME/.local/bin 
set -g fish_user_paths $fish_user_paths $HOME/.gem/ruby/2.3.0/bin 

# Add cargo and it's installs to the path
set -g fish_user_paths $HOME/.cargo/bin $fish_user_paths

# Add yarn and it's installs to the path
set -g fish_user_paths $fish_user_paths $HOME/.yarn/bin

# Add powerline
set fish_function_path $fish_function_path "$POWERLINE_PATH/bindings/fish"
powerline-setup

# set up the emscripten environment
# source $HOME/.config/fish/emsdk_set_env.fish

# add Android SDK path
set -gx ANDROID_HOME "$HOME/Android/Sdk"

# Setup PKG_CONFIG_PATH
set PKG_CONFIG_PATH $PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig
set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH /usr/local/Cellar/libffi/3.2.1/lib/pkgconfig

# set up XDG_DATA_DIRS
set XDG_DATA_DIRS $XDG_DATA_DIRS '/var/lib/flatpak/exports/share'
set -gx XDG_DATA_DIRS $XDG_DATA_DIRS '/home/jhessin/.local/share/flatpak/exports/share'

# set RUST_SRC_PATH
set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
