# Set the zinit directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if doesn't exists
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Initialize zinit
source "${ZINIT_HOME}/zinit.zsh"

# Initialize Oh My Posh
eval "$($HOME/.local/bin/oh-my-posh init zsh)"

# Add ZSH plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light atuinsh/atuin

# Snippets configuration
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes

# Add ZSH snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::eza
zinit snippet OMZP::taskwarrior
zinit snippet OMZP::command-not-found
ZOXIDE_CMD_OVERRIDE=cd zinit snippet OMZP::zoxide

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Colors
export LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# Alias

## Tmux
alias tm='tmux new-session -A -s ${USER} >/dev/null 2>&1'

# LazyGit
alias lg='lazygit'

## Protection
alias chmod='chmod --preserve-root -v'
alias chown='chown --preserve-root -v'

## Resource usage
alias df='df -h'
alias du='du -h'

