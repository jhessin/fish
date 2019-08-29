function binpush
  if test (count $argv) -ne 1 
    echo Usage: binpush path/to/new/executable
    return 1
  else if not test -x $argv
    echo $argv is not an executable
    return 1
  end

  pushd ~/.local/bin
  git checkout master
  popd
  cp $argv ~/.local/bin
  pushd ~/.local/bin
  gpush
  git checkout (hostname)
  git merge master
  popd
end

