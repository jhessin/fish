function backup_packages

  source $HOME/.config/fish/files.fish

  echo "Backing up packages"
  # backup all packages 
  if test (uname) = 'Linux'
    pacman -Qqe > $linuxPackages
  else
    command brew list > $macBrewList
  end

end

function backup_this
 
  # copy backup files
  set target $HOME/.config/fish/backup
  if not test -d $target
    mkdir $target
  end
  for file in $files
    cp -v $file $HOME/.config/fish/backup/
  end

 # backup this repo
  if pushd $HOME/.config/fish
    echo "saving fish config files"
    gpush
    popd
  end
end

function backup_others

  # then we backup extra repos
  backup_repos

  # then we backup the github and bitbucket repos
  for dir in $HOME/Documents/github/*
    if pushd $dir
      echo "saving $dir"
      gpush
      popd
    end
  end

  for dir in $HOME/Documents/bitbucket/*
    if pushd $dir
      echo "saving $dir"
      gpush
      popd
    end
  end
end
 
function backup
  # bring in any additional repos and files
  source $HOME/.config/fish/repos.fish
  source $HOME/.config/fish/files.fish
  for option in $argv
    switch "$option"
      case -p --packages
        backup_packages
    end
  end

  backup_this
  backup_others
end
