function filerip -a filename
  set temp (mktemp -d)
  set rootname (echo $filename | sed 's/\.[^.]*$//')
  set dest $rootname.mkv
  set src $rootname.bak
  mv $filename $src
  if HandBrakeCLI -i $src -Z "H.264 MKV 720p30" -o $temp/$dest
    cp -v $temp/$dest $dest
    rm $src
  else
    echo CANCELED
  end
  rm -rf $temp
end

