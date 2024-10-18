
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
    source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # eval "$(oh-my-posh init zsh --config ~/.config/zsh/plugins/omp/custom_theme.toml)"
    ;;
  darwin*)
    export PATH=/opt/homebrew/bin:$PATH
    source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    export STARSHIP_CONFIG="~/.config/starship/starship.toml"
    if [ -z "$ZELLIJ" ]; then
      zellij --layout ~/.config/zellij/layouts/default.kdl
    fi
    ;;
  *)
    echo "IDK this shouldnt happen"
    ;;

esac

eval "$(fzf --zsh)"
eval "$(starship init zsh)"
