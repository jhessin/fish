# Reload the config file
function reload
  source ~/.config/fish/config.fish
  killall -USR1 termite
end


