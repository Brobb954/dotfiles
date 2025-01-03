# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for alias_file in ~/.config/zsh/aliases/aliases.txt; do
	[ -r "$alias_file" ] && [ -f "$alias_file" ] && source "$alias_file"
done


case $OSTYPE in

  linux-gnu*)
    source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /etc/profile.d/apps-bin-path.sh
    export PATH="$PATH:/opt/nvim/"
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:$(go env GOPATH)/bin
    . ".deno/env"
    ;;
  darwin*)
    export PATH=/opt/homebrew/bin:$PATH
    export PATH=$PATH:$(go env GOPATH)/bin
    export EDITOR='nvim'
    . "/Users/brandonrobb/.deno/env"
    ;;
  *)
    echo "IDK this shouldnt happen"
    ;;

esac

eval "$(zoxide init zsh)"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf-tab zsh-syntax-highlighting zsh-autosuggestions fast-syntax-highlighting)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
bindkey '^ ' autosuggest-accept


source $ZSH/oh-my-zsh.sh

zstyle ':fzf-tab:*' continuous-trigger 'tab'
zstyle ':fzf-tab:*' accept-line enter
zstyle ':completion:*' menu select=0
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
