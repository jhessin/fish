# EDIT THIS FILE QUICKLY
function shortcuts
vim ~/.config/fish/functions/shortcuts.fish
end

# shortcuts to common directories
function github
cd ~/Documents/github/$argv
end

function bitbucket
cd ~/Documents/bitbucket/$argv
end

function notes
cd ~/Documents/github/notes/
end

function fishrc
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

