function bitbucket 
  if test (count $argv) -eq 0
    set argv .
  end

  cd ~/Documents/bitbucket/$argv
end


