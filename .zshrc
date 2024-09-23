
for alias_file in ~/.config/zsh/aliases/aliases.txt; do
	[ -r "$alias_file" ] && [ -f "$alias_file" ] && source "$alias_file"
done


autoload -U compinit && compinit

export PATH=/opt/homebrew/bin:$PATH
source ~/.config/zsh/plugin/fzf-tab.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval "$(oh-my-posh init zsh --config ~/custom_theme.toml)"
eval "$(fzf --zsh)"

HISTSIZE=5000
HISTFILE=~/.config/zsh/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

export PATH="$PATH:/Users/brandonrobb/bootdotdev/worldbanc/private/bin"
