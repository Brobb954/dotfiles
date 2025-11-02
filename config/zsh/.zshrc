# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Aliases
if [[ -r ~/.config/zsh/aliases/aliases.txt ]]; then
  source ~/.config/zsh/aliases/aliases.txt
fi

if [[ -z "$GOPATH" ]]; then
  export GOPATH="$HOME/go"
fi

export PATH="$HOME/.local/bin:$PATH"       # Custom scripts
export PATH="$GOPATH/bin:$PATH"            # Go binaries
export PATH="/opt/homebrew/bin:$PATH"      # Homebrew binaries
export PATH="/opt/homebrew/sbin:$PATH"     # Homebrew system utilities
export PATH="/Users/brandonrobb/.local/share/solana/install/active_release/bin:$PATH"
# Set default editor
export EDITOR="nvim"

# Initialize zoxide
eval "$(zoxide init zsh)"

# Oh-My-Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git fzf-tab zsh-syntax-highlighting zsh-autosuggestions fast-syntax-highlighting)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
bindkey '^ ' autosuggest-accept

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# fzf-tab settings
zstyle ':fzf-tab:*' continuous-trigger 'tab'
zstyle ':fzf-tab:*' accept-line enter
zstyle ':completion:*' menu select=0
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
