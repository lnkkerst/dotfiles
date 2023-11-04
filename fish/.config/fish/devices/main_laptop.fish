# fish_add_path -g $HOME/.local/share/gem/ruby/3.0.0/bin
# fish_add_path -g $HOME/.cargo/bin
# fish_add_path -g $HOME/.local/bin
# fish_add_path -g $HOME/.bun/bin
# fish_add_path -g $HOME/.nix-profile/bin

set -gx fish_greeting
set -gx DISABLE_FZF_AUTO_COMPLETION true

set -gx TERMINAL kitty
set -gx EDITOR nvim
set -gx PAGER less
set -gx nvm_default_version v16.14.2
set -gx JAVA_HOME /usr/lib/jvm/default
set -gx HASTE_SERVER https://pb.lnkkerst.me
# set -gx LOCALE_ARCHIVE $HOME/.nix-profile/lib/locale/locale-archive
set -gx GOPROXY https://mirrors.aliyun.com/goproxy/,direct

set -gx FZF_DEFAULT_OPTS "\
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

set -gx PUB_HOSTED_URL "https://mirrors.tuna.tsinghua.edu.cn/dart-pub"

set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx NDK_HOME $ANDROID_HOME/ndk/25.2.9519653
