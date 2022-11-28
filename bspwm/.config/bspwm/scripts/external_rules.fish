#!/usr/bin/fish

set wid $argv[1]
set class $argv[2]
set instance $argv[3]
set consequences $argv[4]

if string match -r '.*\.exe$' $class then
    echo "state=floating border=off"
end

if string match -r '^Minecraft.*' $class then
    echo "state=floating border=off"
end
