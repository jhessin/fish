function gfetch
  git fetch origin $argv
  git switch -c $argv
  git push -u $argv
end

