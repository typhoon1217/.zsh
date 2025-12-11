alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed '\''s/^\s*[0-9]+\s*//;s/[;&|]*$//'\'')"'
alias weather='curl wttr.in'
alias weather2='curl v2.wttr.in/seoul'
alias shrug='echo "¯\_(ツ)_/¯" | wl-copy && echo "¯\_(ツ)_/¯"'
alias tableflip='echo "(╯°□°）╯︵ ┻━┻" | wl-copy && echo "(╯°□°）╯︵ ┻━┻"'

alias love='echo "❤️" | wl-copy && echo "❤️"'

alias fun-h="cat ~/.config/.zsh/aliases/fun.zsh"
