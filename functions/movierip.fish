function movierip -a title
  mkdir -p $HOME/Videos/Movies
  HandBrakeCLI -Z "H.264 MKV 720p30" --main-feature --subtitle-lang-list eng -i /dev/sr0 -o "$HOME/Videos/Movies/$title.mkv"
end

