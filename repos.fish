set repos $HOME/.SpaceVim.d
set -a repos $HOME/.config/dmenu-recent
set -ax repos $HOME/.config/powerline

set linuxRepos $HOME/.irssi
set -a linuxRepos $HOME/.config/i3
set -ax linuxRepos $HOME/.config/conky

function setup_repos
  if not test -d $HOME/.SpaceVim.d/.git
    rm -rf $HOME/.SpaceVim.d
    git clone git@bitbucket.org:jhessin/vim.git $HOME/.SpaceVim.d
  end

  if not test -d $HOME/.config/dmenu-recent/.git
    rm -rf $HOME/.config/dmenu-recent
    hub clone jhessin/dmenu-recent $HOME/.config/dmenu-recent
  end

  if not test -d ~/.config/powerline/.git
    rm -rf ~/.config/powerline
    hub clone jhessin/powerline ~/.config/powerline
  end

  if test (uname) = 'Linux'
    if not test -d ~/.irssi/.git
      rm -rf ~/.irssi
      hub clone jhessin/.irssi ~/.irssi
    end

    if not test -d ~/.config/i3/.git
      rm -rf ~/.config/i3
      hub clone jhessin/i3 ~/.config/i3
    end

    if not test -d ~/.config/conky/.git
      rm -rf ~/.config/conky
      hub clone jhessin/conky ~/.config/conky
    end
  end

  mkdir ~/Documents/bitbucket
  mkdir ~/Documents/github
end
