#!/usr/bin/env fish

set rofi_command rofi -dpi $ROFI_DPI

switch (echo "finish
proxy
chinese" | $rofi_command -dmenu)
    case "finish"
        exec $rofi_command -show
    case "chinese"
        LANG=zh_CN.UTF-8 fish (status filename)
    case "proxy"
        proxychains fish (status filename)
end
