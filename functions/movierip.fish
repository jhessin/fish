function movierip -a title
  mkdir -p $HOME/Videos/Movies
  if set -q argv
    HandBrakeCLI -Z "H.264 MKV 720p30" $argv --subtitle-lang-list eng -i /dev/sr0 -o "$HOME/Videos/Movies/$title.mkv"
  else
    HandBrakeCLI -Z "H.264 MKV 720p30" --main-feature --subtitle-lang-list eng -i /dev/sr0 -o "$HOME/Videos/Movies/$title.mkv"
  end
end

