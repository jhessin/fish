#!/usr/bin/env fish
set repos $HOME/.config/nvim
set -a repos $HOME/.config/powerline

set localrepos $HOME/.local/bin
set -a localrepos $HOME/.config/nitrogen

set linuxRepos $HOME/.config/i3
set -a linuxRepos $HOME/.config/zathura
set -a linuxRepos $HOME/.config/yay

function update_repos
  for repo in $repos
    if pushd $repo
      echo "updating $repo"
      gpull
      popd
    end
  end

  for repo in $localrepos
    if pushd $repo
      echo "updating $repo"
      git checkout master
      gpull
      git checkout (basename)
      gpull
      git merge master
      gpush
      popd
    end
  end

  if test (uname) = 'Linux'
    for repo in $linuxRepos
      if pushd $repo
        echo "updating $repo"
        gpull
        popd
      end
    end
  end

end

function backup_repos
  for repo in $repos
    if pushd $repo
      echo "saving $repo"
      gpush
      popd
    end
  end

  for repo in $localrepos
    if pushd $repo
      echo "saving $repo"
      git checkout master
      gpull
      git checkout (basename)
      git merge master
      gpush
      popd
    end
  end

  if test (uname) = 'Linux'
    for repo in $linuxRepos
      if pushd $repo
        echo "saving $repo"
        gpush
        popd
      end
    end
  end

end

function setup_repos
  set BACKUPS $HOME/.local/backups
  mkdir -p $BACKUPS

  if not test -d $HOME/.config/nvim/.git
    mv $HOME/.config/nvim $BACKUPS
    git clone git@bitbucket.org:jhessin/vim.git $HOME/.config/nvim
  end

  if not test -d ~/.config/powerline/.git
    mv ~/.config/powerline $BACKUPS
    hub clone jhessin/powerline ~/.config/powerline
  end

  if not test -d ~/.local/bin/.git
    mv ~/.local/bin $BACKUPS
    hub clone jhessin/bin ~/.local/bin
    pushd ~/.local/bin
    gfetch (hostname)
    popd
  end

  if not test -d ~/.config/nitrogen/.git
    mv ~/.config/nitrogen $BACKUPS
    hub clone jhessin/nitrogen ~/.config/nitrogen
    pushd ~/.config/nitrogen
    gfetch (hostname)
    popd
  end

 if test (uname) = 'Linux'
    if not test -d ~/.config/i3/.git
      mv ~/.config/i3 $BACKUPS
      hub clone jhessin/i3 ~/.config/i3
    end

    if not test -d ~/.config/zathura/.git
      mv ~/.config/zathura $BACKUPS
      hub clone jhessin/zathura ~/.config/zathura
    end
    
    if not test -d ~/.config/yay/.git
      mv ~/.config/yay $BACKUPS
      hub clone jhessin/yay ~/.config/yay
    end
  end

  mkdir ~/Documents/bitbucket
  mkdir ~/Documents/github
end
