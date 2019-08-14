function update_this
  # first update this repo
  if pushd ~/.config/fish
    gpull
    popd
  end
end

function copy_files
  # bring in any additional repos and files
  source $HOME/.config/fish/repos.fish
  # copy backup files
  set target $HOME/.config/fish/backup
  # keep an eye on this - if I add anything that isn't proceeded by a dot it could be tricky
  for file in $target/.*
    cp -v $file $HOME
  end

  for dir in $repos
    if pushd $dir
      echo "updating $dir"
      gpull
      popd
    end
  end

  if test (uname) = 'Linux'
    for dir in $linuxRepos
      if pushd $dir
        echo "updating $dir"
        gpull
        popd
      end
    end
  end

  for dir in $HOME/Documents/github/*
    if pushd $dir
      echo "updating $dir"
      gpull
      popd
    end
  end

  for dir in $HOME/Documents/bitbucket/*
    if pushd $dir
      echo "updating $dir"
      gpull
      popd
    end
  end
end

function install_packages
  # install any missing packages
  if test (uname) = 'Linux'
    echo "Installing Packages"
    sudo yay -S --needed --noconfirm - < $linuxPackages
  else
    cat $macBrewList | xargs brew install 2> /dev/null
    cat $macBrewList | xargs brew upgrade 2> /dev/null
  end
end

function update
  update_this

  source ~/.config/fish/files.fish

  copy_files
  install_packages
end
