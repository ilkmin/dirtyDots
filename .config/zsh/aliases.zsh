# Please, check it out: 
# https://blog.sebastian-daschner.com/entries/zsh-aliases
# https://web.archive.org/web/20210207141010/https://blog.sebastian-daschner.com/entries/zsh-aliases

# blank aliases
typeset -a baliases
baliases=()

balias() {
  alias $@
  args="$@"
  args=${args%%\=*}
  baliases+=(${args##* })
}

# ignored aliases
typeset -a ialiases
ialiases=()

ialias() {
  alias $@
  args="$@"
  args=${args%%\=*}
  ialiases+=(${args##* })
}

# functionality
expand-alias-space() {
  [[ $LBUFFER =~ "\<(${(j:|:)baliases})\$" ]]; insertBlank=$?
  if [[ ! $LBUFFER =~ "\<(${(j:|:)ialiases})\$" ]]; then
    zle _expand_alias
  fi
  zle self-insert
  if [[ "$insertBlank" = "0" ]]; then
    zle backward-delete-char
  fi
}
zle -N expand-alias-space

bindkey " " expand-alias-space
bindkey -M isearch " " magic-space

# Expanded aliases
alias xi="sudo xbps-install"
alias xu="sudo xbps-install -Su"
## Recursively remove packages that were installed by PKGNAME 
## and aren't required by other installed packages:
alias xr="sudo xbps-remove -R"

# Ignored aliases
ialias l="exa -lah --icons"
ialias ll="exa -lah --icons --tree"
ialias v="nvim"
ialias vim="nvim"

# Blank aliases, without trailing whitespace
#balias clh='curl localhost:'

# Normally command aliases are only substituted 
# if they’re at the beginning of the line.
# Global aliases are substituted anywhere on the line.
# global aliases
alias -g L='| less'
alias -g G='| grep'

# Zsh also supports suffix aliases
# It allows to open specific programs for files 
# that are typed into the command line, 
# depending on their extensions.

# Starts one or multiple args as programs in background
#background() {
#  for ((i=2;i<=$#;i++)); do
#    ${@[1]} ${@[$i]} &> /dev/null &
#  done
#}

# Suffix aliases
#alias -s {mp4,MP4,mov,MOV}='background mpv'
