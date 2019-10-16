function renumber
  for num in (seq 39 63)
    set newnum (math $num - 38)
    if test $newnum -lt 10
      mv "[AnimeRG] My Hero Academia - $num [720p] [Dual-Audio] [x265] [pseudo].mkv" My_Hero_Academia_S03E0$newnum.mkv
    else
      mv "[AnimeRG] My Hero Academia - $num [720p] [Dual-Audio] [x265] [pseudo].mkv" My_Hero_Academia_S03E$newnum.mkv
    end
  end
end
