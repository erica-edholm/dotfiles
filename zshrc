export EDITOR=vim
export PATH="/home/erica/.bin:$PATH"
[[ $- == *i* ]] && stty -ixon
alias shutdown='systemctl poweroff'
alias reboot='systemctl reboot'
alias lock='loginctl lock-session'
alias ll='ls --group-directories-first --color=auto -h'
alias gs='git status'
alias ga='git add'
alias gc='git checkout'
alias gd='git icdiff'
alias gl='git log'
