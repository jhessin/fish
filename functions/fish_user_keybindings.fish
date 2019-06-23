function fish_user_keybindings --description "vi bindings with tmux copy mode called in visual mode"
  fish_vi_key_bindings
  bind -M visual v copy_mode
end
