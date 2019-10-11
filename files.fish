set -a files $HOME/.gitconfig
set -a files $HOME/.profile
set -a files $HOME/.synergy.conf
set -a files $HOME/.rtorrent.rc
set -a files $HOME/.config/mimeapps.list
set -a files $HOME/.abcde.conf
set -ax files $HOME/.tmux.conf

set -x backupDir $HOME/.config/fish/backup
set -x linuxBrewList $backupDir/linuxbrewlist.txt
set -x macBrewList $backupDir/macbrewlist.txt
set -x linuxPackages $backupDir/linuxpackages.txt
set -x aptKeys $backupDir/apt.keys
