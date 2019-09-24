function mvgeorge -a season
  set target $TV/Curious_George\(2006\)/Season_$season
  mkdir -p $target
  for file in *.*
    mv -v -- $file (string replace -r '^S' 'Curious_George_S' $file)
  end
  for file in *.*
    mv -v -- $file (string replace -r -a ' ' '_' $file)
  end
  mv -v *.* $target
end

