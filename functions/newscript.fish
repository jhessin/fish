function newscript
  if set -q argv
    echo "Usage: newscript scriptname"
    return 1
  end
  pushd ~/.local/bin
  git checkout master
  vim $argv
  chmod +x $argv
  gpush
  git checkout (hostname)
  git merge master
  popd
end

