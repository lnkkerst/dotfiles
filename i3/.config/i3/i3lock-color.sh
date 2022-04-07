    #!/bin/sh

    BLANK='#ffffff22'
    CLEAR='#00000022'
    DEFAULT='#00000022'
    TEXT='#000000aa'
    WRONG='#ff000044'
    VERIFYING='#00000022'

    i3lock \
        --insidever-color=$CLEAR     \
        --ringver-color=$VERIFYING   \
        \
        --insidewrong-color=$CLEAR   \
        --ringwrong-color=$WRONG     \
        \
        --inside-color=$BLANK        \
        --ring-color=$DEFAULT        \
        --line-color=$BLANK          \
        --separator-color=$DEFAULT   \
        \
        --verif-color=$TEXT          \
        --wrong-color=$TEXT          \
        --time-color=$TEXT           \
        --date-color=$TEXT           \
        --layout-color=$TEXT         \
        --keyhl-color=$WRONG         \
        --bshl-color=$WRONG          \
        \
        --screen 1                   \
        --blur 5                     \
        --clock                      \
        --indicator                  \
        --time-str="%H:%M:%S"        \
        --date-str="%A, %m %Y"       \
        --keylayout 1                \
