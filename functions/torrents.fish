function torrents
  if not tmux attach -t torrents
    tmux new -s torrents rtorrent
  end
end

