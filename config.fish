# add shortcuts and tools
source $HOME/.config/fish/functions/shortcuts.fish

# set up proper keyboard options if necessary
setxkbmap -option
setxkbmap -option compose:102 -option numpad:shift3 -option kpdl:semi -option keypad:ATM -option caps:escape

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
# setxkbmap -layout us -variant dvp -option compose:102 -option keypad:atm -option numpad:shift3 -option kpdl:semi

# Add homebrew and it's installs to the path
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH

# Add ruby gems to the path
set -gx PATH $PATH $HOME/.local/bin 
set -gx PATH $PATH $HOME/.gem/ruby/2.3.0/bin 

# Add cargo and it's installs to the path
set -gx PATH $HOME/.cargo/bin $PATH

# Add yarn and it's installs to the path
set -gx PATH $PATH $HOME/.yarn/bin

# set up the emscripten environment
# source $HOME/.config/fish/emsdk_set_env.fish
