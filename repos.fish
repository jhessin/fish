set -x repos $HOME/.SpaceVim.d/
set -x repos $repos $HOME/.config/powerline
set -x repos $repos ~/.config/i3status

set -x linuxRepos $HOME/.irssi
set -x linuxRepos $linuxRepos $HOME/.config/i3

function setup_repos
  if ! test -d $HOME/.SpaceVim.d/.git
    rm -rf ~/.SpaceVim.d
    git clone git@bitbucket.org:jhessin/vim.git ~/.SpaceVim.d
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
