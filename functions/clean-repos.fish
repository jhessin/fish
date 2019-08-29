function clean-repos
  source ~/.config/fish/repos.fish

  for repo in $repos
    rm -rf $repo
  end
  
  if test (uname) = 'Linux'
    for repo in $linuxRepos
      rm -rf $repo
    end
  end

  setup_repos
end
