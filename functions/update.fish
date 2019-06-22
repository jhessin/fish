function update
  # bring in any additional repos and files
  source $HOME/.config/fish/repos.fish
  source $HOME/.config/fish/files.fish

  # copy backup files
  set target $HOME/.config/fish/backup
  for file in $files
    cp $target/$file $HOME
  end

  for dir in $repos
    pushdir $dir
    gpull
    popd
  end

  for dir in $HOME/Documents/github/*
    pushd $dir
    gpull
    popd
  end

  for dir in $HOME/Documents/bitbucket/*
    pushd $dir
    gpull
    popd
  end
end
