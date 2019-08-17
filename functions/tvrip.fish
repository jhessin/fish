function tvrip -a show first last season episode 
  set title $first
  mkdir -p $HOME/Videos/TV/$show/Season_$season
  while test $title -lt $last
    if test $episode -lt 10
      HandBrakeCLI -Z "H.264 MKV 720p30" -t $title --subtitle-lang-list eng -i /dev/sr0 -o "$HOME/Videos/TV/$show/Season_$season/$show-S$season-E0$episode.mkv"
    else
      HandBrakeCLI -Z "H.264 MKV 720p30" -t $title --subtitle-lang-list eng -i /dev/sr0 -o "$HOME/Videos/TV/$show/Season_$season/$show-S$season-E$episode.mkv"
    end
    set title (math "$title + 1")
    set episode (math "$episode + 1")
  end
end

