if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx fish_greeting
set -gx DISABLE_FZF_AUTO_COMPLETION true

fish_add_path $HOME/.local/share/gem/ruby/3.0.0/bin
fish_add_path $HOME/.local/bin $HOME/.yarn/bin

set -gx TERMINAL alacritty
set -gx EDITOR nvim
set -gx PAGER less
set -U nvm_default_version v16.14.2
set -gx JAVA_HOME /usr/lib/jvm/java-18-jdk
set -gx HASTE_SERVER https://pb.lnkkerst.me

set -Ux FZF_DEFAULT_OPTS "--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"

# Alias
alias gitu='git add . && git commit && git push'
alias ll='ls -lh'
alias lla='ls -alh'
alias l='ls'
alias la='ls -a'
alias trm='/bin/rm'
alias rm='trash-put'
alias pc='proxychains'
alias svim='sudo vim'
alias ...='cd ..; cd .. '
alias www='python -m http.server 8000' 
alias ls='exa'
alias lsi='exa --icons --color=auto'
alias dstat='dstat -cdlmnpsy'
alias py='python'
alias :q='exit'
alias :wq='exit'
alias rcd='ranger-cd'
alias nv='neovide --nofork --multigrid'
alias cp='cp -i'
alias cpr='cp --reflink'
alias fspb='curl -F "c=@-" "http://fars.ee/"'
alias fspbu='curl -F "c=@-" "http://fars.ee/?u=1"'
alias mv='mv -i'
alias j='z'
alias sudo='sudo -E'
# thefuck --alias | source
zoxide init fish | source

# Functions
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

function sw
    set swid (bspc query -N -n)
    bspc node $swid --flag hidden=on
    $argv
    bspc node $swid --flag hidden=off
end


if not set -q DISPLAY; and test $XDG_VTNR = 1
   exec startx &>$HOME/.cache/custom_logs/startx
end

