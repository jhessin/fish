function gfetch
  git fetch origin $argv
  git switch -c $argv
end

