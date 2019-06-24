source $HOME/.config/fish/functions/shortcuts.fish
set -g fish_key_bindings fish_user_keybindings
set -gx EDITOR nvim
set -x PAGER "/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
set -gx PATH /home/linuxbrew/.linuxbrew/bin /home/jhessin/.local/bin $PATH
# if necessary set the keyboard layout
# setxkbmap -layout us -variant dvp -option compose:102 -option keypad:atm -option numpad:shift3 -option kpdl:semi
