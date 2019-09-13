function filerip -a filename
  set temp (mktemp -d)
  set rootname (echo $filename | sed 's/\.[^.]*$//')
  set dest $rootname.mkv
  HandBrakeCLI -i $filename -Z "H.264 MKV 720p30" -o $temp/$dest
  ll $temp/
  cp $temp/$dest $dest
  rm -rf $temp
end

