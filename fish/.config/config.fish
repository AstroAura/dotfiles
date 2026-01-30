set -g fish_greeting
#if status is-interactive
#   starship init fish | source
#end

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'
zoxide init fish | source

# Set YT_X_FZF_OPTS globally
set -Ux YT_X_FZF_OPTS "--color=fg:#e0def4,fg+:#e0def4,bg:#232136,bg+:#44415a --color=hl:#3e8fb0,hl+:#9ccfd8,info:#f6c177,marker:#3e8fb0 --color=prompt:#eb6f92,spinner:#c4a7e7,pointer:#c4a7e7,header:#c4afcb --color=border:#44415a,label:#ea9a97,query:#f6c177 --border=rounded --border-label='' --preview-window=border-rounded --prompt='> ' --marker='>' --pointer='◆' --separator='─' --scrollbar='│'"

function lsi
    set -l output (ls-interactive "$argv")
    if test $status -eq 0
        and test -n "$output"
        cd $output
    end
end
