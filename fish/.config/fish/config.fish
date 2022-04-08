if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /usr/share/autojump/autojump.fish

set -U fish_greeting
set -gx DISABLE_FZF_AUTO_COMPLETION true

set -gx TERMINAL alacritty
set -gx EDITOR nvim
set -gx PAGER less
set -U nvm_default_version v16.14.2

# Alias
alias gitu='git add . && git commit && git push'
alias ll='ls -lh'
alias lla='ls -alh'
alias l='ls'
alias la='ls -a'
alias vi='vim'
alias trm='/bin/rm'
alias rm='trash-put'
alias pc='proxychains'
alias sw='swallow'
alias svim='sudo vim'
alias ...='cd ..; cd .. '
alias www='python -m http.server 8000'
alias ls='exa'
alias find='fd'
alias dstat='dstat -cdlmnpsy'
alias py='python'
alias :q='exit'
alias :wq='exit'

# Functions
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

if not set -q DISPLAY; and test $XDG_VTNR = 1
    exec startx &> $HOME/customLogs/xlog
end
