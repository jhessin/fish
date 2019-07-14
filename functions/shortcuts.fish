# EDIT THIS FILE QUICKLY
function shortcuts
  vim ~/.config/fish/functions/shortcuts.fish
end

# edit tmux config file
function tmuxconfig
  vim ~/.tmux.conf
end

function fishbindings
  vim ~/.config/fish/functions/fish_user_keybindings.fish
end

# shortcuts to common directories
function github
  if test (count $argv) -eq 0
    set argv .
  end

  cd ~/Documents/github/$argv
end

function bitbucket 
  if test (count $argv) -eq 0
    set argv .
  end

  cd ~/Documents/bitbucket/$argv
end

function notes
  cd ~/Documents/github/notes/
end

function novel
  cd ~/Documents/github/novel/
end

function fishrc 
  if test (count $argv) -eq 0
    set argv .
  end

  cd ~/.config/fish/$argv
end

# Reload the config file
function reload
  source ~/.config/fish/config.fish
end

# some git shortcuts
function gpush
  git add .
  git commit
  git push
end

function gpull
  git pull
end

function greset
  git reset --hard
end

