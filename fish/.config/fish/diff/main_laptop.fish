set -gx DISABLE_FZF_AUTO_COMPLETION true

set -gx TERMINAL kitty
set -gx EDITOR nvim
set -gx PAGER less
set -gx JAVA_HOME /usr/lib/jvm/default
# set -gx LOCALE_ARCHIVE $HOME/.nix-profile/lib/locale/locale-archive
# set -gx GOPROXY https://mirrors.aliyun.com/goproxy/,direct

set -gx FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4 \
--tmux"

set -gx PUB_HOSTED_URL "https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
set -gx FLUTTER_STORAGE_BASE_URL "https://mirrors.tuna.tsinghua.edu.cn/flutter"

set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx NDK_HOME $ANDROID_HOME/ndk/26.1.10909125

if not status is-interactive
    return
end

function select-area -d "Select screen area (only support Hyprland)"
    if test (count $argv) -ge 1
        set active_workspace $argv[1]
    else
        set active_workspace $(hyprctl activeworkspace -j | jq .id)
    end

    set windows $(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $active_workspace) | \"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])\"")
    printf "%s\n" $windows | slurp
end

function record-selected -d "Select screen area and record (only support Hyprland)"
    set area (select-area $argv)
    wf-recorder -g "$area" -f ~/Videos/wf-recorder/(datef).mp4
end
