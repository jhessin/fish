function backup
  # first we backup this repo
  pushd $HOME/.config/fish
  gpush
  popd

  # then we backup the github and bitbucket repos
  for dir in $HOME/Documents/github/*
    pushd $dir
    gpush
    popd
  end

  for dir in $HOME/Documents/bitbucket/*
    pushd $dir
    gpush
    popd
  end
end
