function movierip -a title
  set path /run/media/jhessin/backups/Videos/Movies
  mkdir -p $path
  mkdir -p $HOME/Videos/Movies
  if set -q argv
    HandBrakeCLI -Z "H.264 MKV 720p30" $argv --subtitle-lang-list eng -i /dev/sr0 -o "$path/$title.mkv"
  else
    HandBrakeCLI -Z "H.264 MKV 720p30" --main-feature --subtitle-lang-list eng -i /dev/sr0 -o "$path/$title.mkv"
  end
end

