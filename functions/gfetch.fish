function gfetch
  git fetch origin $argv
  git switch -c origin/$argv
  git push -u $argv
end

