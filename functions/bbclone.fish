function bbclone
  git clone git@bitbucket.org:$argv.git
  cd $argv
  git push -u origin master
  cd ..
end

