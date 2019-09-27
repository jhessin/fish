function gpush
  git add .
  git commit -m "updated"
  git push $argv
  git push --all
end


