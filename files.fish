set files
set files $files $HOME/.gitconfig
set -x files $files $HOME/.tmux.conf

set -x backupDir $HOME/.config/fish/backup
set -x linuxBrewList $backupDir/linuxbrewlist.txt
set -x macBrewList $backupDir/macbrewlist.txt
set -x linuxPackages $backupDir/linuxpackages.txt
set -x aptKeys $backupDir/apt.keys
