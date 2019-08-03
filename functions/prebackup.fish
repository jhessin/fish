function prebackup
  pushd $HOME/.config/fish/backup
  command brew list > newbrew.txt
  vim -d newbrew.txt brewlist.txt
  sudo dpkg-query -f '${binary:Package}\n' -W > newpackages.txt
  vim -d newpackages.txt packages_list.txt
  popd
end

