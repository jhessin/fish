# See if we need git and download if necessary
if not test (type git)
  brew install git
else
  echo "git found"
end

# Get hub as a shortcut
if not test (type hub)
  brew install hub
end

# clone this repo if necessary
if not test -d ~/.config/fish
  hub clone jhessin/fish
end

# Set up curl if we don't have it
if not test (type curl)
  brew install curl
end

# ensure neovim is installed and set up
if not test (type nvim)
  brew install neovim
 # set up spacevim
  curl -sLf https://spacevim.org/install.sh | bash
end

# ensure my spacevim repo is cloned
if not test -d ~/.SpaceVim.d
  if not git clone git@bitbucket.org:jhessin/vim.git ~/.SpaceVim.d
    echo "git clone failed - ensure you have your key set up with bitbucket"
  end
end

update
