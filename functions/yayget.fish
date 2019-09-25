function yayget
  set args (getopt -s sh y: $argv)
  set args (fish -c "for el in $args; echo \$el; end")

  if test $args[1] = -y
    yay -Sy --noconfirm $argv[1..-1]
  else
    yay -Sy $argv --sudoloop
  end
end

