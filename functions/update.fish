function update

  # first update this repo
  cd ~/.config/fish
  gpull

  # bring in any additional repos and files
  source $HOME/.config/fish/repos.fish
  # copy backup files
  set target $HOME/.config/fish/backup
  # keep an eye on this - if I add anything that isn't proceeded by a dot it could be tricky
  for file in $target/.*
    cp -v $file $HOME
  end

  for dir in $repos
    pushd $dir
    echo "updating $dir"
    gpull
    popd
  end

  for dir in $HOME/Documents/github/*
    pushd $dir
    echo "updating $dir"
    gpull
    popd
  end

  for dir in $HOME/Documents/bitbucket/*
    pushd $dir
    echo "updating $dir"
    gpull
    popd
  end
end
