function fish_command_not_found
    echo `$argv[1]` not found 😢
end

if not status is-interactive
    return
end

#############
# Variables #
#############

set -gx fish_greeting

#########
# Alias #
#########

alias gitu='git add . && git commit && git push'
alias trm='/bin/rm'
alias rm='echo "Never use rm, please ;("'
alias d="trash-put"
alias pc='proxychains'
alias ...='cd ..; cd .. '
alias www='darkhttpd .'
alias dstat='dstat -cdlmnpsy'
alias py='python'
alias :q='exit'
alias :wq='exit'
alias nv='neovide --no-fork'
alias cp='cp -i'
alias cpr='cp --reflink'
alias fspb='curl -F "c=@-" "http://fars.ee/"'
alias fspbu='curl -F "c=@-" "http://fars.ee/?u=1"'
alias lpb='curl -s -F "file=@-" "https://pb.lnkkerst.me" | jq -r .url'
alias mv='mv -i'
alias sudoe='sudo -E'
alias xc='xclip -sel clipboard'
alias t="tmux attach -t main 2> /dev/null || tmux new -s main"
# alias t="zellij"
alias rs='rsync -P'
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'
alias woman='man'
alias 翻译='fanyi'
alias sl='ls'
alias icat="kitty +kitten icat"
alias datef="date +%Y%m%d%H%M%S_%s"
alias dates="date '+%Y-%m-%d %H:%M:%S %Z'"

###############
# Keybindings #
###############

bind \co yazi-cd --mode insert
bind \co yazi-cd --mode default
bind \eq 'fish_commandline_prepend pc' --mode insert
bind \eq 'fish_commandline_prepend pc' --mode default


#############
# Functions #
#############

function mkcd -d "Make dir and cd"
    mkdir -p $argv[1] && cd $argv[1]
end

function proxy-env -d "Manage env for proxy"
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

function ranger-cd -d "Ranger with auto cd"
    set dir (mktemp -t ranger_cd.XXX)
    ranger --choosedir=$dir
    cd (cat $dir) $argv
    rm $dir
    commandline -f repaint
end

function yazi-cd -d "Yazi with auto cd"
    set dir (mktemp -t yazi_cd.XXX)
    yazi --cwd-file=$dir
    cd (cat $dir) $argv
    rm $dir
    commandline -f repaint
end

function swpesc -d "Swap caps and esc or not"
    argparse --min-args=1 -- $argv
    or return

    set kb_options " "
    if test $argv[1] = on
        set kb_options "caps:swapescape"
    end

    if set -q WAYLAND_DISPLAY
        hyprctl keyword input:kb_options $kb_options
    else if set -q DISPLAY
        setxkbmap -option $kb_options
    else
        echo "It seems that you are not in X11 or Wayland environment."
        return 1
    end
end

function first-ip -d "Get first local ip"
    set ip (ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d '/' -f1 | head -n 1)
    echo -n $ip
end


################
# Applications #
################

# fnm
if type -qf fnm
    fnm env --use-on-cd --shell fish | source
    fnm completions --shell fish | source
end

# zoxide
if type -qf zoxide
    zoxide init fish | source
    alias j='z'
end

# direnv
if type -qf direnv
    direnv hook fish | source
end

# starship
if type -qf starship
    starship init fish | source
end

# atuin
if type -qf atuin
    set -gx ATUIN_NOBIND true
    atuin init fish | source
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end

# thefuck
if type -qf thefuck
    thefuck --alias | source
end

# rye
if type -qf rye
    rye self completion --shell fish | source
end

# uv
if type -qf uv
    uv generate-shell-completion fish | source
end
