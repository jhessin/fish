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
  if not test -d $HOME/.config/nvim/.git
    rm -rf $HOME/.config/nvim
    git clone git@bitbucket.org:jhessin/vim.git $HOME/.config/nvim
  end

  if not test -d ~/.local/bin/.git
    rm -rf ~/.local/bin
    hub clone jhessin/bin ~/.local/bin
    pushd ~/.local/bin
    gfetch (hostname)
    popd
  end

  if not test -d ~/.config/powerline/.git
    rm -rf ~/.config/powerline
    hub clone jhessin/powerline ~/.config/powerline
  end

  if not test -d ~/.config/termite/.git
    rm -rf ~/.config/termite
    hub clone jhessin/termite ~/.config/termite
    pushd ~/.config/termite
    gfetch (hostname)
    popd
  end

 if test (uname) = 'Linux'
    if not test -d ~/.irssi/.git
      rm -rf ~/.irssi
      hub clone jhessin/.irssi ~/.irssi
    end

    if not test -d $HOME/.config/dmenu-recent/.git
      rm -rf $HOME/.config/dmenu-recent
      hub clone jhessin/dmenu-recent $HOME/.config/dmenu-recent
    end

    if not test -d ~/.config/i3/.git
      rm -rf ~/.config/i3
      hub clone jhessin/i3 ~/.config/i3
    end

    if not test -d ~/.config/zathura/.git
      rm -rf ~/.config/zathura
      hub clone jhessin/zathura ~/.config/zathura
    end

    if not test -d ~/.config/nitrogen/.git
      rm -rf ~/.config/nitrogen
      hub clone jhessin/nitrogen ~/.config/nitrogen
      pushd ~/.config/nitrogen
      gfetch (hostname)
      popd
    end

    if not test -d ~/.config/conky/.git
      rm -rf ~/.config/conky
      hub clone jhessin/conky ~/.config/conky
      pushd ~/.config/conky
      gfetch (hostname)
      popd
    end

    if not test -d ~/.config/i3status/.git
      rm -rf ~/.config/i3status
      hub clone jhessin/i3status ~/.config/i3status
      pushd ~/.config/i3status
      gfetch (hostname)
      popd
    end
  end

  mkdir ~/Documents/bitbucket
  mkdir ~/Documents/github
end
