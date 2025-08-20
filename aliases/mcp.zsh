# MCP RAG Vector Database aliases
# Usage: Run these commands from any project directory

# Core MCP project path
export MCP_PROJECT_PATH="$HOME/Documents/ws/mcp-project-context"

# Index current project
alias mcp-index='(cd $MCP_PROJECT_PATH && npm run index-codebase -- --path $(pwd))'
alias mcp-index-project='(cd $MCP_PROJECT_PATH && npm run index-codebase -- --path $(pwd))'

# Server management
alias mcp-start='(cd $MCP_PROJECT_PATH && npm run start-server)'
alias mcp-dev='(cd $MCP_PROJECT_PATH && npm run dev)'
alias mcp-stop='pkill -f "node dist/server/mcp.js"'
alias mcp-restart='mcp-stop && sleep 2 && mcp-start'
alias mcp-status='ps aux | grep "node dist/server/mcp.js"'

# Development (run from MCP project)
alias mcp-build='(cd $MCP_PROJECT_PATH && npm run build)'
alias mcp-test='(cd $MCP_PROJECT_PATH && npm run test)'
alias mcp-lint='(cd $MCP_PROJECT_PATH && npm run lint)'

# Database operations
alias mcp-reindex='(cd $MCP_PROJECT_PATH && npm run clean-cache && npm run index-codebase -- --path $(pwd))'
alias mcp-clean-cache='(cd $MCP_PROJECT_PATH && npm run clean-cache)'

# Health and monitoring
alias mcp-health='curl -f http://localhost:3000/health 2>/dev/null || echo "Server not running"'
alias mcp-logs='tail -f $MCP_PROJECT_PATH/data/logs/server.log 2>/dev/null || echo "No logs found"'
alias mcp-port='lsof -i :3000'

# Quick workflows
alias mcp-setup-project='mcp-index && mcp-start'
alias mcp-refresh='mcp-reindex && mcp-restart'

# Search current project (if API endpoint exists)
alias mcp-search='function _mcp_search() { curl -X POST http://localhost:3000/search -H "Content-Type: application/json" -d "{\"query\":\"$1\",\"limit\":${2:-5}}" 2>/dev/null | jq . || echo "Server not running or no results"; }; _mcp_search'

# Development helpers
alias mcp-debug='(cd $MCP_PROJECT_PATH && NODE_OPTIONS="--inspect" npm run dev)'
alias mcp-mem='(cd $MCP_PROJECT_PATH && NODE_OPTIONS="--max-old-space-size=4096" npm run start-server)'

# Project navigation (for MCP maintenance)
alias mcp-cd='cd $MCP_PROJECT_PATH'
alias mcp-edit='cd $MCP_PROJECT_PATH && code .'

# Help
alias mcp-help='echo "
MCP RAG Vector Database Commands:
================================

From any project directory:
  mcp-index          - Index current project for RAG
  mcp-setup-project  - Index current project and start server
  mcp-search \"query\" - Search indexed content
  mcp-reindex        - Clean cache and reindex current project
  
Server management:
  mcp-start         - Start MCP server
  mcp-stop          - Stop MCP server  
  mcp-restart       - Restart MCP server
  mcp-status        - Show server status
  mcp-health        - Check server health
  mcp-logs          - View server logs
  
Typical workflow:
  cd /path/to/your/project
  mcp-setup-project     # Index project and start server
  mcp-search \"login\"    # Search for login-related code
  
MCP development:
  mcp-cd            - Go to MCP project directory
  mcp-build         - Build MCP project
  mcp-test          - Run MCP tests
"'

alias mcp-h="cat ~/.config/.zsh/aliases/mcp.zsh"

