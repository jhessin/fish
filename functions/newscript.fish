function newscript
  pushd ~/.local/bin
  git checkout master
  vim $argv
  chmod +x $argv
  gpush
  git checkout (hostname)
  git merge master
  popd
end

