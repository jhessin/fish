function filerip -a filename
  set rootname (echo $filename | sed 's/\.[^.]*$//')
  set dest $rootname.mkv
  set src $rootname.orig
  mv $filename $src
  if HandBrakeCLI -i $src -Z "H.264 MKV 720p30" -a eng -s eng -o $dest
    rm $src
  else
    mv -v $src $filename
    echo CANCELED
  end
end

