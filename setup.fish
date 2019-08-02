
# copy initial setup files
sudo cp ~/.config/fish/setupfiles/keyboard /etc/default/keyboard
sudo cp ~/.config/fish/setupfiles/initramfs.conf /etc/initramfs-tools/initramfs.conf

# Install homebrew stuff
xargs -a $HOME/.config/fish/backup/brewlist.txt brew install

# install linux stuff if necessary
if test (uname) = 'Linux'
  sudo cp $HOME/.config/fish/setupfiles/sources.list /etc/apt/
  sudo cp -r $HOME/.config/fish/setupfiles/sources.list.d /etc/apt/
  sudo xargs -a $HOME/.config/fish/backup/packages_list.txt apt install
  sudo apt-get install i3 i3blocks xautolock xss-lock
end

pip3 install powerline-status

# ensure neovim is installed and set up
set NVIM /home/linuxbrew/.linuxbrew/bin/nvim
ln -s $NVIM /home/linuxbrew/.linuxbrew/bin/vim
ln -s $NVIM /home/linuxbrew/.linuxbrew/bin/vi
ln -s $NVIM /home/linuxbrew/.linuxbrew/bin/editor
# set up spacevim
curl -sLf https://spacevim.org/install.sh | bash

# set up fonts if necessary
if not test -e ~/.fonts/SourceCodePro-Semibold.otf
  mkdir -p /tmp/adodefont
  pushd /tmp/adodefont
  wget -q --show-progress -O source-code-pro.zip https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
  unzip -q source-code-pro.zip -d source-code-pro
  mkdir -p ~/.fonts
  cp -v source-code-pro/*/OTF/*.otf ~/.fonts/
  fc-cache -f
  rm -rf source-code-pro{,.zip}
  popd
  rm -rf /tmp/adobefont
end

# ensure my spacevim repo is cloned
if not test -d ~/.SpaceVim.d/.git
  rm -rf ~/.SpaceVim.d
  if not git clone git@bitbucket.org:jhessin/vim.git ~/.SpaceVim.d
    echo "git clone failed - ensure you have your key set up with bitbucket"
  end
end

# ensure my .irssi repo is cloned
if not test -d ~/.irssi/.git
 rm -rf ~/.irssi
  hub clone jhessin/.irssi ~/.irssi
end

# ensure the .i3 is cloned and up to date
if not test -d ~/.config/i3/.git
  rm -rf ~/.config/i3
  hub clone jhessin/i3 ~/.config/i3
end

if not test -d ~/.config/powerline/.git
  rm -rf ~/.config/powerline
  hub clone jhessin/powerline ~/.config/powerline
end

