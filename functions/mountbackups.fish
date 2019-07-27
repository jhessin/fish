function mountbackups
  fusermount -u /media/backups
  if test (count $argv) -eq 0
    set argv /dev/sdb2
end
if sudo apfs-fuse -o allow_other $argv /media/backups
  cd /media/backups/root/
  cp -rv * ~/harddrive/
end
end

