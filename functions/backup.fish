function backup_this
 
  # copy backup files
  set target $HOME/.config/fish/backup
  if not test -d $target
    mkdir $target
  end
  for file in $files
    cp $file $HOME/.config/fish/backup/
  end

  # backup all packages 
  if test (uname) = 'Linux'
    command brew list > $linuxBrewList
    dpkg --get-selections > $linuxPackages
  else
    command brew list > $macBrewList
  end

  # backup this repo
  if pushd $HOME/.config/fish
    echo "saving fish config files"
    gpush
    popd
  end
end

function backup_keys
  if test (uname) = 'Linux'
    sudo cp /etc/apt/sources.list $backupDir
    sudo cp -r /etc/apt/sources.list.d $backupDir
    sudo apt-key exportall > $aptKeys
  end
end

function backup_others

  # then we backup extra repos
  for dir in $repos
    if pushd $dir
      echo "saving $dir"
      gpush
      popd
    end
  end

  # backup linux only repos
  if test (uname) = 'Linux'
    for dir in $linuxRepos
      if pushd $dir
        echo "saving $dir"
        gpush
        popd
      end
    end
  end

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

  backup_keys
  backup_this
  backup_others
end
