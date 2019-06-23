function fish_user_keybindings --description "vi bindings with tmux copy mode called in visual mode"
  fish_vi_key_bindings
  bind -M visual v copy_mode
  bind p paste_buffer
  bind -M insert \t forward-char
  bind -M insert -k btab complete-and-search
end
