#!/usr/bin/env fish

# Download or reset this repo

if not test -d ~/.config/fish/.git
  rm -rf ~/.config/fish
  hub clone jhessin/fish ~/.config/fish
else
  pushd ~/.config/fish
  git reset --hard
  git pull
  source ~/.config/fish/config.fish
end

source ~/.config/fish/repos.fish

# Start by seting up all the necessary repos
setup_repos

# then update them all (also installs programs
update 

