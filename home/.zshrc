# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/erica/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="minimal"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions node npm kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval $(minikube -p minikube docker-env)

# Bindkeys
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward

# Git log formatting
_git_log_medium_format='%C(bold)Commit: %C(reset)%C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
_git_log_fullgraph_format='%C(green)%h%C(reset) %<|(50,trunc)%s %C(bold blue)<%an>%C(reset) %C(yellow)(%cd)%C(reset)%C(auto)%d%C(reset)%n'

alias ll='ls --group-directories-first --color=auto -la'

# Git aliases
alias gs='git status'
alias gco='git checkout'
alias gc='git commit'
alias ga='git add'
alias gd='git icdiff'
alias gl='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
alias gpl='git pull --rebase'
alias gpsh='git push'
alias glG='git log --topo-order --all --graph --pretty=format"${_git_log_fullgraph_format}" --date=relative'
alias gcan='git commit --amend --no-edit'
alias gri='git rebase -i'
alias gcha='cd ~/code && ./checkout_all.sh'
alias gsd='git switch develop'
alias gsm='git switch master'
alias gsl='git switch -'
alias gsw='git switch'
alias gswc='git switch'
alias gpr='git fetch -p && for branch in $(git branch -vv | grep ": gone]" | awk '"'"'{print $1}'"'"'); do git branch -D $branch; done'
#Fetch authors for branches
alias gbau='git fetch -p && git for-each-ref --format="%(color:cyan)%(authordate:format:%m/%d/%Y %I:%M %p)    %(align:25,left)%(color:yellow)%(authorname)%(end) %(color:reset)%(refname:strip=3)" --sort=authordate refs/remotes'

# Mvn aliases
function lmvn {
    if [ ! -f mvnw ]; 
    then 
        mvn $@
    else 
        ./mvnw $@
    fi
}
alias mci='lmvn clean install'
alias mcv='lmvn clean verify'
alias mcd='lmvn clean install -Pdockerbuild'

# Other aliases
alias week='date "+%V"'
alias shutdown='systemctl poweroff'
alias reboot='systemctl reboot'
alias lock='loginctl lock-session'
alias dum2='du -h -S ~/.m2/repository | sort --human-numeric-sort -r | head -n 15'
alias fixsound='pacmd set-card-profile 5 a2dp_sink'
alias localportforward='sudo setcap CAP_NET_BIND_SERVICE=+eip /usr/bin/kubectl;kubectl port-forward service/nginx-nginx-ingress-controller 80:80 443:443 -n local'
alias rc='find-cursor --repeat 0 --follow --distance 1 --line-width 16 --size 10 --color red'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/erica/.sdkman"
[[ -s "/home/erica/.sdkman/bin/sdkman-init.sh" ]] && source "/home/erica/.sdkman/bin/sdkman-init.sh"
#[[ /usr/bin/kubectl ]] && source <(kubectl completion zsh)

_dev-tools() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _DEV_TOOLS_COMPLETE=complete-zsh  dev-tools)
}
if [[ "$(basename -- ${(%):-%x})" != "_dev-tools" ]]; then
  compdef _dev-tools dev-tools
fi
