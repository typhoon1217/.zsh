# Weather display with caching for zsh startup
# Uses wttr.in for weather data

# Configuration
WEATHER_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/weather"
WEATHER_CACHE_FILE="$WEATHER_CACHE_DIR/current"
WEATHER_CACHE_TTL=1800  # Cache for 30 minutes (in seconds)
WEATHER_LOCATION=""     # Empty = auto-detect, or set: "London" "Tokyo" etc
WEATHER_FORMAT="%l:+%c+%t+%w"  # Location, condition, temp, wind

# Create cache directory
[[ ! -d "$WEATHER_CACHE_DIR" ]] && mkdir -p "$WEATHER_CACHE_DIR"

# Function to fetch weather
_fetch_weather() {
    local location="${WEATHER_LOCATION:-}"
    local url="https://wttr.in/${location}?format=${WEATHER_FORMAT}"

    # Fetch with timeout to not block shell startup
    local weather
    weather=$(curl -s --max-time 3 "$url" 2>/dev/null)

    if [[ -n "$weather" && "$weather" != *"Unknown"* && "$weather" != *"error"* ]]; then
        echo "$weather" > "$WEATHER_CACHE_FILE"
        echo "$weather"
    else
        # Return cached if fetch fails
        [[ -f "$WEATHER_CACHE_FILE" ]] && cat "$WEATHER_CACHE_FILE"
    fi
}

# Function to get weather (cached)
_get_weather() {
    local now=$(date +%s)
    local cache_time=0

    if [[ -f "$WEATHER_CACHE_FILE" ]]; then
        cache_time=$(stat -c %Y "$WEATHER_CACHE_FILE" 2>/dev/null || stat -f %m "$WEATHER_CACHE_FILE" 2>/dev/null)
    fi

    local age=$((now - cache_time))

    if [[ $age -gt $WEATHER_CACHE_TTL ]] || [[ ! -f "$WEATHER_CACHE_FILE" ]]; then
        # Fetch in background to not block startup
        (_fetch_weather &>/dev/null &)
        # Still show cached data if available
        [[ -f "$WEATHER_CACHE_FILE" ]] && cat "$WEATHER_CACHE_FILE"
    else
        cat "$WEATHER_CACHE_FILE"
    fi
}

# Display weather on shell startup
show_weather() {
    local weather=$(_get_weather)
    if [[ -n "$weather" ]]; then
        echo "$weather"
    fi
}

# Force refresh weather
weather_refresh() {
    rm -f "$WEATHER_CACHE_FILE"
    _fetch_weather
}

# Show weather info (use 'wtr' to avoid conflict with existing 'weather' alias)
wtr() {
    if [[ "$1" == "-r" || "$1" == "--refresh" ]]; then
        weather_refresh
    elif [[ "$1" == "-f" || "$1" == "--full" ]]; then
        curl -s "https://wttr.in/${WEATHER_LOCATION}"
    elif [[ "$1" == "-h" || "$1" == "--help" ]]; then
        echo "Usage: wtr [option]"
        echo "  -r, --refresh  Force refresh cache"
        echo "  -f, --full     Show full weather report"
        echo "  -h, --help     Show this help"
        echo ""
        echo "Config vars (set in .zshrc before sourcing):"
        echo "  WEATHER_LOCATION   City name (empty=auto)"
        echo "  WEATHER_CACHE_TTL  Cache duration in seconds (default: 1800)"
    else
        show_weather
    fi
}

# Auto-display on startup (comment out if you don't want this)
show_weather
