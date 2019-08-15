function update_this
  # first update this repo
  if pushd ~/.config/fish
    gpull
    popd
  end
end

function update
  update_this

  source ~/.config/fish/files.fish
  source ~/.config/fish/update.fish

  copy_files
  if test $argv = packages
    install_packages
  end
end
