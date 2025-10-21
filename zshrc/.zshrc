ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Set path
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# For virtualization with KVM/QEMU
export LIBVIRT_DEFAULT_URI='qemu:///system'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Install zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit

zinit cdreplay -q

# Source oh-my-psh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"

# Keybind for navigating history
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Set alias and exports
alias ll="ls --color -lArt"
alias ls="ls -l --color"
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
export EDITOR="nvim"
export MANPAGER="nvim +Man!"


# Set History options
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# pnpm
export PNPM_HOME="/home/z3co/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
