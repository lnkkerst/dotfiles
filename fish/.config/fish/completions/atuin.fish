complete -c atuin -n "__fish_use_subcommand" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_use_subcommand" -s V -l version -d 'Print version information'
complete -c atuin -n "__fish_use_subcommand" -f -a "history" -d 'Manipulate shell history'
complete -c atuin -n "__fish_use_subcommand" -f -a "import" -d 'Import shell history from file'
complete -c atuin -n "__fish_use_subcommand" -f -a "stats" -d 'Calculate statistics for your history'
complete -c atuin -n "__fish_use_subcommand" -f -a "init" -d 'Output shell setup'
complete -c atuin -n "__fish_use_subcommand" -f -a "uuid" -d 'Generate a UUID'
complete -c atuin -n "__fish_use_subcommand" -f -a "search" -d 'Interactive history search'
complete -c atuin -n "__fish_use_subcommand" -f -a "gen-completions" -d 'Generate shell completions'
complete -c atuin -n "__fish_use_subcommand" -f -a "sync" -d 'Sync with the configured server'
complete -c atuin -n "__fish_use_subcommand" -f -a "login" -d 'Login to the configured server'
complete -c atuin -n "__fish_use_subcommand" -f -a "logout" -d 'Log out'
complete -c atuin -n "__fish_use_subcommand" -f -a "register" -d 'Register with the configured server'
complete -c atuin -n "__fish_use_subcommand" -f -a "key" -d 'Print the encryption key for transfer to another machine'
complete -c atuin -n "__fish_use_subcommand" -f -a "server" -d 'Start an atuin server'
complete -c atuin -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c atuin -n "__fish_seen_subcommand_from history; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_from end; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from last; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from history; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_from end; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from last; and not __fish_seen_subcommand_from help" -f -a "start" -d 'Begins a new command in the history'
complete -c atuin -n "__fish_seen_subcommand_from history; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_from end; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from last; and not __fish_seen_subcommand_from help" -f -a "end" -d 'Finishes a new command in the history (adds time, exit code)'
complete -c atuin -n "__fish_seen_subcommand_from history; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_from end; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from last; and not __fish_seen_subcommand_from help" -f -a "list" -d 'List all items in history'
complete -c atuin -n "__fish_seen_subcommand_from history; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_from end; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from last; and not __fish_seen_subcommand_from help" -f -a "last" -d 'Get the last command ran'
complete -c atuin -n "__fish_seen_subcommand_from history; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_from end; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from last; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from end" -s e -l exit -r
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from end" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from list" -s c -l cwd
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from list" -s s -l session
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from list" -l human
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from list" -l cmd-only -d 'Show only the text of the command'
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from last" -l human
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from last" -l cmd-only -d 'Show only the text of the command'
complete -c atuin -n "__fish_seen_subcommand_from history; and __fish_seen_subcommand_from last" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from import; and not __fish_seen_subcommand_from auto; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from zsh-hist-db; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from resh; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from import; and not __fish_seen_subcommand_from auto; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from zsh-hist-db; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from resh; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "auto" -d 'Import history for the current shell'
complete -c atuin -n "__fish_seen_subcommand_from import; and not __fish_seen_subcommand_from auto; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from zsh-hist-db; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from resh; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "zsh" -d 'Import history from the zsh history file'
complete -c atuin -n "__fish_seen_subcommand_from import; and not __fish_seen_subcommand_from auto; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from zsh-hist-db; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from resh; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "zsh-hist-db" -d 'Import history from the zsh history file'
complete -c atuin -n "__fish_seen_subcommand_from import; and not __fish_seen_subcommand_from auto; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from zsh-hist-db; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from resh; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "bash" -d 'Import history from the bash history file'
complete -c atuin -n "__fish_seen_subcommand_from import; and not __fish_seen_subcommand_from auto; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from zsh-hist-db; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from resh; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "resh" -d 'Import history from the resh history file'
complete -c atuin -n "__fish_seen_subcommand_from import; and not __fish_seen_subcommand_from auto; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from zsh-hist-db; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from resh; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "fish" -d 'Import history from the fish history file'
complete -c atuin -n "__fish_seen_subcommand_from import; and not __fish_seen_subcommand_from auto; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from zsh-hist-db; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from resh; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c atuin -n "__fish_seen_subcommand_from import; and __fish_seen_subcommand_from auto" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from import; and __fish_seen_subcommand_from zsh" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from import; and __fish_seen_subcommand_from zsh-hist-db" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from import; and __fish_seen_subcommand_from bash" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from import; and __fish_seen_subcommand_from resh" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from import; and __fish_seen_subcommand_from fish" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from stats" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from init; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from init; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "zsh" -d 'Zsh setup'
complete -c atuin -n "__fish_seen_subcommand_from init; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "bash" -d 'Bash setup'
complete -c atuin -n "__fish_seen_subcommand_from init; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "fish" -d 'Fish setup'
complete -c atuin -n "__fish_seen_subcommand_from init; and not __fish_seen_subcommand_from zsh; and not __fish_seen_subcommand_from bash; and not __fish_seen_subcommand_from fish; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c atuin -n "__fish_seen_subcommand_from init; and __fish_seen_subcommand_from zsh" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from init; and __fish_seen_subcommand_from bash" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from init; and __fish_seen_subcommand_from fish" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from uuid" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from search" -s c -l cwd -d 'Filter search result by directory' -r
complete -c atuin -n "__fish_seen_subcommand_from search" -l exclude-cwd -d 'Exclude directory from results' -r
complete -c atuin -n "__fish_seen_subcommand_from search" -s e -l exit -d 'Filter search result by exit code' -r
complete -c atuin -n "__fish_seen_subcommand_from search" -l exclude-exit -d 'Exclude results with this exit code' -r
complete -c atuin -n "__fish_seen_subcommand_from search" -s b -l before -d 'Only include results added before this date' -r
complete -c atuin -n "__fish_seen_subcommand_from search" -l after -d 'Only include results after this date' -r
complete -c atuin -n "__fish_seen_subcommand_from search" -l limit -d 'How many entries to return at most' -r
complete -c atuin -n "__fish_seen_subcommand_from search" -s i -l interactive -d 'Open interactive search UI'
complete -c atuin -n "__fish_seen_subcommand_from search" -l human -d 'Use human-readable formatting for time'
complete -c atuin -n "__fish_seen_subcommand_from search" -l cmd-only -d 'Show only the text of the command'
complete -c atuin -n "__fish_seen_subcommand_from search" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from gen-completions" -s s -l shell -d 'Set the shell for generating completions' -r
complete -c atuin -n "__fish_seen_subcommand_from gen-completions" -s o -l out-dir -d 'Set the output directory' -r
complete -c atuin -n "__fish_seen_subcommand_from gen-completions" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from sync" -s f -l force -d 'Force re-download everything'
complete -c atuin -n "__fish_seen_subcommand_from sync" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from login" -s u -l username -r
complete -c atuin -n "__fish_seen_subcommand_from login" -s p -l password -r
complete -c atuin -n "__fish_seen_subcommand_from login" -s k -l key -d 'The encryption key for your account' -r
complete -c atuin -n "__fish_seen_subcommand_from login" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from logout" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from register" -s u -l username -r
complete -c atuin -n "__fish_seen_subcommand_from register" -s p -l password -r
complete -c atuin -n "__fish_seen_subcommand_from register" -s e -l email -r
complete -c atuin -n "__fish_seen_subcommand_from register" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from key" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from server; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c atuin -n "__fish_seen_subcommand_from server; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_from help" -f -a "start" -d 'Start the server'
complete -c atuin -n "__fish_seen_subcommand_from server; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c atuin -n "__fish_seen_subcommand_from server; and __fish_seen_subcommand_from start" -l host -d 'The host address to bind' -r
complete -c atuin -n "__fish_seen_subcommand_from server; and __fish_seen_subcommand_from start" -s p -l port -d 'The port to bind' -r
complete -c atuin -n "__fish_seen_subcommand_from server; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help information'
