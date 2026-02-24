  if [[ -z "$TMUX" ]]; then
      tmux attach-session -t main || tmux new-session -s main                                                                                                                                                                              
  fi                                                                                                                                                                                                                                     
     
