function newfunc
  if not count $argv > /dev/null
    echo "Usage: newfunc functionname"
    return 1
  end
  pushd ~/.config/fish/functions
  vim $argv.fish
  popd
end

