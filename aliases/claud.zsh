# Set up sudo with askpass helper
export SUDO_ASKPASS="/usr/local/bin/zenity-askpass"
alias sudo='sudo -A'


alias claude-mcp="claude --mcp-config ~/.config/Claude/claude_desktop_config.json"
alias claude-r="claude --resume"
alias claude-s="claude --stream"
alias claude-t="claude --text"
alias claude-c="claude --continue"

alias claude-mcp-r="claude --mcp-config ~/.config/Claude/claude_desktop_config.json --resume"
alias claude-mcp-s="claude --mcp-config ~/.config/Claude/claude_desktop_config.json --stream"
alias claude-mcp-t="claude --mcp-config ~/.config/Claude/claude_desktop_config.json --text"

alias claude-r-s="claude --resume --stream"
alias claude-r-t="claude --resume --text"

alias claude-s-t="claude --stream --text"

alias claude-r-s-t="claude --resume --stream --text"

alias claud-h="cat ~/.config/.zsh/aliases/claud.zsh"
