function brew
  if test (uname) = 'Linux' 
    if ! sudo aptitude $argv
      command brew $argv
    end
  else
    command brew $argv
  end
end
