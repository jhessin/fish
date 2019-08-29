function bbpush
  git remote add origin git@bitbucket.org:$argv.git
  git push -u origin master
end

