if status is-interactive
    ssh_aloadkeys > /dev/null 2>&1
    #    cd ~/
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/molar/miniforge3/bin/conda
    eval /home/molar/miniforge3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

