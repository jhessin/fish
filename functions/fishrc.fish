function fishrc 
  if test (count $argv) -eq 0
    set argv .
  end

  cd ~/.config/fish/$argv
end


