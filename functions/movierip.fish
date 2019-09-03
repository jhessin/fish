function movierip -a title
  if set -q argv
    HandBrakeCLI -Z "H.264 MKV 720p30" $argv --subtitle-lang-list eng -i /dev/sr0 -o "$MOVIES/$title.mkv"
  else
    HandBrakeCLI -Z "H.264 MKV 720p30" --main-feature --subtitle-lang-list eng -i /dev/sr0 -o "$MOVIES/$title.mkv"
  end
end

