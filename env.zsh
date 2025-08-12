#path
export PATH="$HOME/.local/bin:$PATH"
# Terminal
export TERM=xterm-256color

# Directory paths
export DOCS="$HOME/Documents"
export WS="$DOCS/ws"
export DONE="$DOCS/done"
export CONFIG="$HOME/.config"
export SCR="$CONFIG/myScripts"
export HYPRC="$CONFIG/hypr"

# Input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx

# npm-global
export PATH=~/.npm-global/bin:$PATH

##flutter
# Set environment variables in your shell config (~/.zshrc or ~/.bashrc)
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

export CHROME_EXECUTABLE="/usr/bin/chromium"

# For Wayland compatibility
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

#wine
export WINEPREFIX="$HOME/.wine-myapp"

