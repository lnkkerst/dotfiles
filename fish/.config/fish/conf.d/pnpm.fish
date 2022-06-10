if type -f pnpm > /dev/null
    set -gx PNPM_HOME "/home/lnk/.local/share/pnpm"
    set -gx PATH "$PNPM_HOME" $PATH
# tabtab source for packages
# uninstall by removing these lines
    [ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
end

