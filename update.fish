function update_programs
  if test (uname) = 'Linux'
    yay -Syu --noconfirm --sudoloop
  end
  rustup update
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

  cp $target/mimeapps.list $HOME/.config/mimeapps.list

  update_repos

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
  source ~/.config/fish/files.fish
  if test (uname) = 'Linux'
    echo "Installing Packages"
    # yay -Sy --needed --noconfirm - < $linuxPackages
    yay -Sy --needed --sudoloop - < $linuxPackages
  else
    cat $macBrewList | xargs brew install 2> /dev/null
    cat $macBrewList | xargs brew upgrade 2> /dev/null
  end
  rustup toolchain add nightly
  cargo +nightly install racer
  rustup component add rls-preview --toolchain nightly
  rustup component add rust-analysis --toolchain nightly
  rustup component add rust-src --toolchain nightly
end


