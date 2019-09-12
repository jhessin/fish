function update_this
  # first update this repo
  if pushd ~/.config/fish
    gpull
    popd
  end
end

function update
  update_this

  source ~/.config/fish/update.fish

  update_programs
  copy_files
  for option in $argv
    switch "$option"
      case -p --packages
        install_packages
    end
  end
end
