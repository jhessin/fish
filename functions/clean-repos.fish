function clean-repos
  source ~/.config/fish/repos.fish

  for repo in $repos
    rm -rf $repo
  end

  setup_repos
end
