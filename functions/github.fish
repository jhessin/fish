function github
  if test (count $argv) -eq 0
    set argv .
  end

  cd ~/Documents/github/$argv
end


