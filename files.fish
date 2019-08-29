set -a files $HOME/.gitconfig
set -a files $HOME/.profile
set -ax files $HOME/.tmux.conf

set -x backupDir $HOME/.config/fish/backup
set -x linuxBrewList $backupDir/linuxbrewlist.txt
set -x macBrewList $backupDir/macbrewlist.txt
set -x linuxPackages $backupDir/linuxpackages.txt
set -x aptKeys $backupDir/apt.keys
