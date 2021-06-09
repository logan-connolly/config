# open with default
alias o='xdg-open'
alias cat='bat --theme="gruvbox-dark"'
alias yank='xsel --clipboard'
alias cpwd='pwd | yank'
alias ssh='kitty +kitten ssh'
alias icat='kitty +kitten icat'

# configure files
alias cv='nvim ~/.config/nvim'
alias cz='nvim ~/.zshrc'
alias ci='nvim ~/.config/i3/config'

# use neovim
alias v='nvim'
alias vim='nvim -u "NORC"'

# ls aliases
alias nnn='nnn_cd'
alias ls='nnn -dc'
alias ll='nnn -dc'
alias la='nnn -dc'

# k alias
alias k='k -h --no-vcs'

# ignore files/dirs with tree
alias tree="tree -I '__pycache__|.git|venv|node_modules'"

# network aliases
alias nml="nmcli device wifi list"
alias nm="nmcli connection"
alias nmc="nmcli --ask device wifi connect"

# renaming files
alias rename="perl-rename"

# generate virtual environment
alias venv="python -m venv .venv && source venv/bin/activate && pip install -U pip setuptools wheel &> /dev/null"

# swallow terminal apps
alias mpv="i3-swallow mpv"
alias zathura="i3-swallow zathura"
