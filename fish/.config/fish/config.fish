if not status is-interactive
    return
end

# Alias
alias gitu='git add . && git commit && git push'
alias trm='/bin/rm'
alias rm='trash-put'
alias pc='proxychains'
alias ...='cd ..; cd .. '
alias www='darkhttpd .'
alias dstat='dstat -cdlmnpsy'
alias py='python'
alias :q='exit'
alias :wq='exit'
alias nv='neovide --nofork'
alias cp='cp -i'
alias cpr='cp --reflink'
alias fspb='curl -F "c=@-" "http://fars.ee/"'
alias fspbu='curl -F "c=@-" "http://fars.ee/?u=1"'
alias lpb='curl -s -F "file=@-" "https://pb.lnkkerst.me" | jq -r .url'
alias mv='mv -i'
alias sudoe='sudo -E'
alias xc='xclip -sel clipboard'
alias t="tmux attach -t main 2> /dev/null || tmux new -s main"
alias rs='rsync -P'
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'
alias woman='man'
alias 翻译='fanyi'
alias sl='ls'
alias icat="kitty +kitten icat"
alias datef="date +%Y%m%d%H%M%S_%s"
alias dates="date '+%Y-%m-%d %H:%M:%S %Z'"

# Key binding
bind \co ranger-cd --mode insert
bind \co ranger-cd --mode default
bind \eq 'fish_commandline_prepend pc' --mode insert
bind \eq 'fish_commandline_prepend pc' --mode default

# Functions
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

function proxy_env
    if test $argv[1] = on
        # set -gx all_proxy socks://127.0.0.1:20170
        set -gx http_proxy http://127.0.0.1:20171
        set -gx https_proxy http://127.0.0.1:20171
    else if test $argv[1] = off
        # set -e all_proxy
        set -e http_proxy
        set -e https_proxy
    else
        return 1
    end
end

function ranger-cd
    set dir (mktemp -t ranger_cd.XXX)
    ranger --choosedir=$dir
    cd (cat $dir) $argv
    rm $dir
    commandline -f repaint
end

function fish_command_not_found
    echo `$argv[1]` not found 😢
end

# fnm
if type -f fnm >/dev/null 2>/dev/null
    fnm env --use-on-cd --shell fish | source
    fnm completions --shell fish | source
end

# zoxide
if type -f zoxide >/dev/null 2>/dev/null
    zoxide init fish | source
    alias j='z'
end

# direnv
if type -f direnv >/dev/null 2>/dev/null
    direnv hook fish | source
end

if type -f starship >/dev/null 2>/dev/null
    starship init fish | source
end

# atuin
if type -f atuin >/dev/null 2>/dev/null
    set -gx ATUIN_NOBIND true
    atuin init fish | source
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end

# thefuck
if type -f thefuck >/dev/null 2>/dev/null
    thefuck --alias | source
end
