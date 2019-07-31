function wifi
  if test $argv = ls
    nmcli d wifi list
  else if test $argv = iphone
    if ! nmcli c up iPhone
      nmcli d wifi connect iPhone password ocokw7qc04nc4
    end
  else if test $argv = -iphone
    nmcli c down iPhone
  else
    nmcli d wifi $argv
  end
end

