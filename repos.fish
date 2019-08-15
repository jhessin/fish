set -x repos $HOME/.SpaceVim.d
set -x repos $repos $HOME/.config/dmenu-recent
set -x repos $repos $HOME/.config/powerline

set -x linuxRepos $HOME/.irssi
set -x linuxRepos $linuxRepos $HOME/.config/i3
set -x linuxRepos $linuxRepos ~/.config/i3status

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

    if not test -d ~/.config/i3status/.git
      rm -rf ~/.config/i3status
      hub clone jhessin/i3status ~/.config/i3status
    end
  end
end
