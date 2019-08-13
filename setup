source ~/.config/fish/repos.fish

# Start by seting up all the necessary repos
setup_repos

# then update them all (also installs programs
update

# ensure neovim is installed and set up
set NVIM /home/linuxbrew/.linuxbrew/bin/nvim
ln -s $NVIM /home/linuxbrew/.linuxbrew/bin/vim 2> /dev/null
ln -s $NVIM /home/linuxbrew/.linuxbrew/bin/vi 2> /dev/null
ln -s $NVIM /home/linuxbrew/.linuxbrew/bin/editor 2> /dev/null
# set up spacevim (if necessary)
if not test -d ~/.SpaceVim
  curl -sLf https://spacevim.org/install.sh | bash
end

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

