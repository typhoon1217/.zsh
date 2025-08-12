# If you come from bash you might have to change your $PATH.

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# If you come from bash you might have to change your $PATH.

# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Create .zsh directory if it doesn't exist

[[ ! -d $HOME/.zsh ]] && mkdir -p $HOME/.zsh


# Check archlinux plugin commands here

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux


# Display Pokemon-colorscripts

# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos

#pokemon-colorscripts --no-title -s -r #without fastfetch

#pokemon-colorscripts --no-title -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -


#fastfetch.: Will be disabled if above colorscript was chosen to install

#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

#fastfetch

# Create .zsh directory if it doesn't exist

[[ ! -d $HOME/.zsh ]] && mkdir -p $HOME/.zsh


# Oh-My-Zsh installation

export ZSH="$HOME/.oh-my-zsh"

# Load all .zsh files from .zsh directory

for config_file in $HOME/.config/.zsh/*.zsh; do

  source $config_file

done


# Source all alias files from the aliases directory

for alias_file in $HOME/.config/.zsh/aliases/*.zsh; do

  source $alias_file

done


# Set-up FZF key bindings (CTRL R for fuzzy history finder)

source <(fzf --zsh)
# Initialize starship prompt
#eval "$(starship init zsh)" 

# Oh My Posh configuration
eval "$(oh-my-posh init zsh --config /usr/share/oh-my-posh/themes/robbyrussell.omp.json)"

