# Labour's zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

### Plugins

# Pure theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# Minimal Zinit setup
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

# LS_COLOURS (will use 'exa')
#zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
#    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
#    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
#zinit light trapd00r/LS_COLORS

# dotbare
zinit light kazhala/dotbare

# TheFuck
zinit ice wait lucid atload'bindkey -r "\e\e"'
zinit light laggardkernel/zsh-thefuck

## End of plugins

### Personal configuration:

# History
if [[ ! -f $HOME/.cache/zsh/history ]]; then
    mkdir -p $HOME/.cache/zsh
    touch $HOME/.cache/zsh/history
fi

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/history

# Cursor
_beam_cursor() {
	echo -ne '\e[5 q'
}

precmd_functions+=(_beam_cursor)

# Bindings
bindkey '^H'      backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Case-insensitivity 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
#setopt MENU_COMPLETE # Don't wait second TAB

# Environment variables
export BROWSER="flatpak run com.brave.Browser"
export TERM="alacritty"
export EDITOR="micro"
export DOTBARE_DIFF_PAGES="delta --diff-so-fancy --line-numbers"

# Simple aliases
alias ll="exa -lah"
alias lll="exa -lah --tree"

# Completions:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Optional
setopt globdots # include hidden files
setopt auto_cd
setopt interactive_comments

zinit cdreplay -q   # required by compinit for fast load
