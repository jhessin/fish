function filerip -a filename
  set temp (mktemp -d)
  cp $filename $filename.bak
  set rootname (echo $filename | sed 's/\.[^.]*$//')
  set dest $rootname.mkv
  if HandBrakeCLI -i $filename -Z "H.264 MKV 720p30" -o $temp/$dest
    cp -v $temp/$dest $dest
    rm $filename.bak
  else
    echo CANCELED
  end
  rm -rf $temp
end

