function update
  # bring in any additional repos and files
  source $HOME/.config/fish/repos.fish

  # copy backup files
  set target $HOME/.config/fish/backup
  for file in $target/*
    cp $file $HOME
  end

  for dir in $repos
    pushd $dir
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
