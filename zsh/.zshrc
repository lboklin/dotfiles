# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_TMUX_TERM="screen-256color" # This seems to not really affect things?

DEFAULT_USER=ludvig

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Base16-Shell
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
 DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(emacs web-search cabal themes zsh-syntax-highlighting git colorized-man-pages colorize systemd tmux command-not-found safe-paste)

# User configuration

# export PATH="$HOME/.local/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR="$HOME/.oh-my-zsh/plugins/emacs/emacsclient.sh -nw"
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l="ls -lhAF --group-directories-first --color"

## Git aliases
alias gdv="git difftool -t nvimdiff"
alias gcm="git commit -m"
alias gaacam="git add -A && git commit -am"
alias gaacan!="git add -A && git commit -a --amend --no-edit"
alias glolg='glol --diff-filter=M --minimal --word-diff=color -pG'

# alias e='emacs -nw'
# alias ema='emacsclient -nw -c -a ""'
# alias egui='emacsclient -c -a ""'
# alias emacs='emacs'
alias vim="nvim"

## cd aliases
alias prog="cd $HOME/Projects/GameDev/GodotEngine/Projects/Prog/game/ && gst"
alias prog3d="cd $HOME/Projects/GameDev/GodotEngine/Projects/Prog3D/game && gst"
alias pgm="cd ~/Projects/GameDev/Unity3D/501Industries/pgm18/ && gst"

## Task warrior
alias tcb="task context pro:Blog"
alias tab="task add pro:Blog"
alias tcp="task context pro:Prog"
alias tap="task add pro:Prog"
alias tcw="task context +work pro:PGM"
alias taw="task add +work pro:PGM"
alias tchf="task context pro:HiFi"
alias tahf="task add pro:HiFi"

## Sysadmin stuff
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"

## Hakyll dev
alias sitelup='tmux run -b "./site watch --host 192.168.10.220 --port 8000"'
alias sitewup='tmux run -b "./site server --host 192.168.10.220 --port 8888"'

## misc
alias g="grep -i"
alias didtoday="cat ~/Documents/Personal/Did_`date +%F`.log"
alias lr='find . -type f -name "*.cs"'
alias snix="nix-env -qaP --description '*' | g"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
