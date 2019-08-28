function binpush
  if not test \( (count '$argv') -ne 1 \) -a \( -x '$argv' \)
    echo Usage: binpush path/to/new/executable
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

