function wifi
  if test $argv = ls
    nmcli d wifi list
else if test $argv = iphone
  nmcli d wifi connect iPhone password ocokw7qc04nc4
else
  nmcli d wifi $argv
end
end

