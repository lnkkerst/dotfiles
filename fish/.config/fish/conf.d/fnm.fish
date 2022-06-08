if type -f fnm > /dev/null
    fnm env --use-on-cd --shell fish | source
    fnm completions --shell fish | source 
    set -gx FNM_NODE_DIST_MIRROR https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
end
