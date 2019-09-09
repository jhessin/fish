function gfetch
  git fetch origin $argv
  git checkout "origin/$argv"
  git push -u origin $argv
end

