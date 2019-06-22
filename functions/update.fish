function update
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
