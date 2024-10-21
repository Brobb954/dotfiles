for alias_file in ~/.config/zsh/aliases/aliases.txt; do
	[ -r "$alias_file" ] && [ -f "$alias_file" ] && source "$alias_file"
done

autoload -U compinit && compinit

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

case $OSTYPE in

  linux-gnu*)
    source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    export PATH="$PATH:/opt/nvim/"
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:$(go env GOPATH)/bin
    export STARSHIP_CONFIG=~/.config/starship/starship.toml
    . ".deno/env"
    ;;
  darwin*)
    export PATH=/opt/homebrew/bin:$PATH
    source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    . "/Users/brandonrobb/.deno/env"
    export STARSHIP_CONFIG=~/.config/starship/starship.toml
    if [ -z "$ZELLIJ" ]; then
      zellij --layout ~/.config/zellij/layouts/default.kdl
    fi
    ;;
  *)
    echo "IDK this shouldnt happen"
    ;;

esac

eval "$(starship init zsh)"

autoload -Uz add-zsh-hook add-zle-hook-widget

# Function to update the prompt before each command
.prompt.precmd.update_prompt() {
    FULL_PROMPT=$(starship prompt)
    COMPACT_PROMPT="${FULL_PROMPT##*$'\n'}"
}

add-zsh-hook precmd .prompt.precmd.update_prompt

# ZLE hooks to switch between full and compact prompts
.prompt.compact.line-finish() {
    PS1="$COMPACT_PROMPT"
    zle reset-prompt
}

.prompt.compact.line-init() {
    PS1="$FULL_PROMPT"
    zle reset-prompt
}

add-zle-hook-widget zle-line-finish .prompt.compact.line-finish
add-zle-hook-widget zle-line-init   .prompt.compact.line-init

eval "$(fzf --zsh)
