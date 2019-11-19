set repos $HOME/.config/nvim
set -a repos $HOME/.config/powerline

set localrepos $HOME/.config/termite
set -a localrepos $HOME/.local/bin
set -a localrepos $HOME/.config/conky
set -a localrepos $HOME/.config/nitrogen
set -a localrepos $HOME/.config/i3status

set linuxRepos $HOME/.irssi
set -a linuxRepos $HOME/.config/i3
set -a linuxRepos $HOME/.config/dmenu-recent
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

  if not test -d ~/.local/bin/.git
    mv ~/.local/bin $BACKUPS
    hub clone jhessin/bin ~/.local/bin
    pushd ~/.local/bin
    gfetch (hostname)
    popd
  end

  if not test -d ~/.config/powerline/.git
    mv ~/.config/powerline $BACKUPS
    hub clone jhessin/powerline ~/.config/powerline
  end

  if not test -d ~/.config/termite/.git
    mv ~/.config/termite $BACKUPS
    hub clone jhessin/termite ~/.config/termite
    pushd ~/.config/termite
    gfetch (hostname)
    popd
  end

 if test (uname) = 'Linux'
    if not test -d ~/.irssi/.git
      mv ~/.irssi $BACKUPS
      hub clone jhessin/.irssi ~/.irssi
    end

    if not test -d ~/.config/i3/.git
      mv ~/.config/i3 $BACKUPS
      hub clone jhessin/i3 ~/.config/i3
    end

    if not test -d ~/.config/zathura/.git
      mv ~/.config/zathura $BACKUPS
      hub clone jhessin/zathura ~/.config/zathura
    end

    if not test -d ~/.config/nitrogen/.git
      mv ~/.config/nitrogen $BACKUPS
      hub clone jhessin/nitrogen ~/.config/nitrogen
      pushd ~/.config/nitrogen
      gfetch (hostname)
      popd
    end

    if not test -d ~/.config/conky/.git
      mv ~/.config/conky $BACKUPS
      hub clone jhessin/conky ~/.config/conky
      pushd ~/.config/conky
      gfetch (hostname)
      popd
    end

    if not test -d ~/.config/i3status/.git
      mv ~/.config/i3status $BACKUPS
      hub clone jhessin/i3status ~/.config/i3status
      pushd ~/.config/i3status
      gfetch (hostname)
      popd
    end
  end

  mkdir ~/Documents/bitbucket
  mkdir ~/Documents/github
end
