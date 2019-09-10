function gfetch
  # git fetch origin $argv
  git pull -t
  # git checkout "origin/$argv"
  # git checkout -b $argv
  git checkout $argv
  # git push -u origin $argv
end

