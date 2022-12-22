fish_add_path -g $HOME/.gem/ruby/2.7.0/bin
fish_add_path -g $HOME/.cargo/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.pyenv/bin
fish_add_path -g $HOME/.bun/bin

if not status is-interactive
    return
end

# Commands to run in interactive sessions can go here
set -gx fish_greeting
set -gx DISABLE_FZF_AUTO_COMPLETION true

set -gx TERMINAL kitty
set -gx EDITOR nvim
set -gx PAGER less
set -gx nvm_default_version v16.14.2
set -gx JAVA_HOME /usr/lib/jvm/java-18-jdk
set -gx HASTE_SERVER https://pb.lnkkerst.me
set -gx LOCALE_ARCHIVE $HOME/.nix-profile/lib/locale/locale-archive

set -gx FZF_DEFAULT_OPTS "\
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

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
alias nv='WINIT_UNIX_BACKEND=x11 XCURSOR_SIZE=48 neovide --nofork --multigrid'
alias cp='cp -i'
alias cpr='cp --reflink'
alias fspb='curl -F "c=@-" "http://fars.ee/"'
alias fspbu='curl -F "c=@-" "http://fars.ee/?u=1"'
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
        set -gx all_proxy socks://127.0.0.1:20170
        set -gx http_proxy http://127.0.0.1:20171
        set -gx https_proxy http://127.0.0.1:20170
    else if test $argv[1] = off
        set -e all_proxy
        set -e http_proxy
        set -e https_proxy
    else
        return 1
    end
end


# bun
if type -f bun >/dev/null 2>/dev/null
    set --export BUN_INSTALL "$HOME/.bun"
    # set --export PATH $BUN_INSTALL/bin $PATH
end

# fnm
if type -f fnm >/dev/null 2>/dev/null
    fish_add_path -g $HOME/.cargo/bin
    fnm env --use-on-cd --shell fish | source
    fnm completions --shell fish | source
end

# zoxide
if type -f zoxide >/dev/null 2>/dev/null
    zoxide init fish | source
    alias j='z'
end

#pyenv
if type -f pyenv >/dev/null 2>/dev/null
    pyenv init - | source
end

# pnpm
if type -f pnpm >/dev/null 2>/dev/null
    set -gx PNPM_HOME "/home/lnk/.local/share/pnpm"
    set -gx PATH "$PNPM_HOME" $PATH
    # tabtab source for packages
    # uninstall by removing these lines
    [ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
end

# direnv
if type -f direnv >/dev/null 2>/dev/null
    direnv hook fish | source
end

if type -f starship >/dev/null 2>/dev/null
    starship init fish | source
end

# atuin
if type -f fish >/dev/null 2>/dev/null
    set -gx ATUIN_NOBIND true
    atuin init fish | source
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end

# thefuck
if type -f thefuck >/dev/null 2>/dev/null
    thefuck --alias | source
end

# if not test $TMUX
#     and not test -z $DISPLAY
#     t
# end
