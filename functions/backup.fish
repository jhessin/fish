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
  command brew list > $HOME/.config/fish/backup/brewlist.txt
  if test (uname) = 'Linux'
    sudo dpkg-query -f '${binary:Package}\n' -W > $HOME/.config/fish/backup/packages_list.txt
  end

  # backup this repo
  if pushd $HOME/.config/fish
    echo "saving fish config files"
    gpush
    popd
  end

  # then we backup extra repos
  for dir in $repos
    if pushd $dir
      echo "saving $dir"
      gpush
      popd
    end
  end
end

function backup_others
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

  backup_this
  backup_others
end
