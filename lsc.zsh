#paste in .zshrc
#cmd: lsc or lsca

_enhanced_ls() {
    local show_all="$1"
    local index_map="qwertyuiopasdfghjklzxcvbnm1234567890"
    local files=()
    
    if [[ "$show_all" == "true" ]]; then
        setopt localoptions dotglob nullglob
        files=(*)
        files=($(printf '%s\n' "${files[@]}" | sort))
    else
        files=(*)
    fi
    
    local i=1
    local cols=$(tput cols)
    local max_width=0
    
    for file in "${files[@]}"; do
        [[ ${#file} -gt $max_width ]] && max_width=${#file}
    done
    
    local col_width=$((max_width + 10))
    local num_cols=$((cols / col_width))
    [[ $num_cols -lt 1 ]] && num_cols=1
    
    local count=0
    for file in "${files[@]}"; do
        local index_char=""
        local map_index=$(( (i - 1) % ${#index_map} + 1 ))
        index_char="${index_map[$map_index]}"
        
        if [[ $i -gt ${#index_map} ]]; then
            local cycle_num=$(( (i - 1) / ${#index_map} + 1 ))
            index_char="${cycle_num}${index_char}"
        fi
        
        local color=""
        local reset="\033[0m"
        
        if [[ -d "$file" ]]; then
            color="\033[1;34m"
        elif [[ -x "$file" ]]; then
            color="\033[1;32m"
        elif [[ -L "$file" ]]; then
            color="\033[1;36m"
        elif [[ "$file" == .* ]]; then
            color="\033[2;37m"
        elif [[ "$file" == *.txt || "$file" == *.md ]]; then
            color="\033[0;37m"
        elif [[ "$file" == *.jpg || "$file" == *.png || "$file" == *.gif ]]; then
            color="\033[1;35m"
        else
            color="\033[0;37m"
        fi
        
        printf "\033[1;33m%2s\033[0m: ${color}%-${max_width}s${reset}" "$index_char" "$file"
        
        ((count++))
        if [[ $count -eq $num_cols ]]; then
            echo
            count=0
        else
            printf "  "
        fi
        
        ((i++))
    done
    
    [[ $count -ne 0 ]] && echo
    
    echo "\033[2;37mEnter index to cd (or press Enter to skip):\033[0m"
    read -r selection
    
    if [[ -n "$selection" ]]; then
        local pos
        local actual_char="$selection"
        
        if [[ "$selection" =~ ^[0-9]+[qwertyuiopasdfghjklzxcvbnm0-9]$ ]]; then
            local prefix="${selection%?}"
            actual_char="${selection: -1}"
            local base_pos=${index_map[(i)$actual_char]}
            pos=$(( (prefix - 1) * ${#index_map} + base_pos ))
        elif [[ ${index_map[(i)$selection]} -ne 0 ]]; then
            pos=${index_map[(i)$selection]}
        elif [[ "$selection" =~ ^[0-9]+$ ]]; then
            pos="$selection"
        else
            pos=0
        fi
        
        if [[ $pos -le ${#files[@]} && $pos -ge 1 ]]; then
            local target="${files[$pos]}"
            if [[ -d "$target" ]]; then
                cd "$target" && echo "\033[1;32m✓\033[0m Changed to: \033[1;34m$target\033[0m"
            else
                echo "\033[1;31m✗\033[0m Not a directory: $target"
            fi
        else
            echo "\033[1;31m✗\033[0m Index '$selection' out of range"
        fi
    fi
}

lsc() {
    _enhanced_ls "false"
}

lsca() {
    _enhanced_ls "true"
}

