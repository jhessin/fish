function bbclone
  git clone git@bitbucket.org:$argv.git
  set path (string split "/" $argv)
  # echo $path[2]
  cd $path[2]
  git push -u origin master
  cd ..
end

