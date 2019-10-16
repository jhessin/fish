function ripall -a ext
  for file in **/*.$ext
    filerip $file
  end
end

