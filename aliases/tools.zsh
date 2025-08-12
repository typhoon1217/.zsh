# Tmux
alias tmts='tmux new -s typhoon'
alias tmt='tmux attach-session -t typhoon' 

#zellij
alias zj='zellij'

# Cheatsheets
alias chtmux='nvim $NOTES/cheatsheat/tmux.md'

# regdir
alias regdir='zsh $SCR/register_shortcut.sh'
alias regprj='zsh $SCR/register_project.sh'

alias capt='zsh $SCR/capture.sh'
alias capc='zsh $SCR/capture-c.sh'

alias dol='dolphin .'

alias lg='lazygit'
alias ld='lazydocker'
alias ze='zellij'


alias ccg='cd ~/Documents/ws/claudecodeui && npm run dev &'
alias ccgk='pkill -f "claudecodeui.*npm run dev"'

alias tools-h="cat ~/.config/.zsh/aliases/tools.zsh"
# Vietnamese Typing Helper Functions

# Path to Vietnamese cheatsheet script
VIETNAMESE_SCRIPT="$HOME/.config/myScripts/vietnamese-cheat.sh"

# Quick access to Vietnamese cheatsheet
alias vi-cheat='$VIETNAMESE_SCRIPT'
alias vn-help='$VIETNAMESE_SCRIPT'
alias vietnamese-cheat='$VIETNAMESE_SCRIPT'

# Quick fcitx5 controls
alias vi-toggle='fcitx5-remote -t'        # Toggle input method
alias vi-status='fcitx5-remote -s'        # Check status  
alias vi-restart='pkill fcitx5 && sleep 1 && fcitx5 &'  # Restart fcitx5
alias vi-reload='vi-restart'              # Alternative restart alias

# Quick practice words
alias vi-practice='echo "Practice these: xin chaof → xin chào | cam own → cảm ơn | Viet Nam → Việt Nam"'

# Vietnamese input quick reference
alias vi-vowels='$VIETNAMESE_SCRIPT vowels'
alias vi-tones='$VIETNAMESE_SCRIPT tones'

# Check if Vietnamese input is active
vietnamese_input_status() {
    if command -v fcitx5-remote >/dev/null 2>&1; then
        if fcitx5-remote -s >/dev/null 2>&1; then
            local current_im=$(fcitx5-remote -n 2>/dev/null)
            if [[ "$current_im" == *"unikey"* ]] || [[ "$current_im" == *"vietnamese"* ]]; then
                echo "🇻🇳 Vietnamese"
            else
                echo "🇺🇸 English"
            fi
        else
            echo "❌ fcitx5 not running"
        fi
    else
        echo "❌ fcitx5 not installed"
    fi
}

# Show current input method status
alias vi-current='vietnamese_input_status'

# Vietnamese typing session starter
vi-session() {
    echo "🇻🇳 Starting Vietnamese typing session..."
    echo "Current status: $(vietnamese_input_status)"
    echo
    $VIETNAMESE_SCRIPT words
    echo "📝 Use 'vi-toggle' to switch input method"
    echo "📖 Use 'vi-cheat' for full reference"
}

# Optional: Add Vietnamese status to prompt (uncomment to use)
# RPROMPT='$(vietnamese_input_status)'
