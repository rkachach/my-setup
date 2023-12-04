# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=xterm-256color

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    git
    z
    fzf-tab
    sudo
    zsh-autosuggestions
    colored-man-pages
    jsontools
    web-search
    dirhistory
    zsh-syntax-highlighting)

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
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias adm="cd /home/redo/workspaces/ceph/src/cephadm/"
alias plans="cd /home/redo/workspaces/notes/kcli_plans/"
alias ceph="cd /home/redo/workspaces/ceph/"
alias rook="cd /home/redo/workspaces/src/github.com/rook/rook"
alias mgr="cd /home/redo/workspaces/ceph/src/pybind/mgr/"
alias doc="cd /home/redo/workspaces/ceph/doc/"
alias com="cd /home/redo/workspaces/ceph/src/python-common/"
alias dep="cd /home/redo/workspaces/ceph/src/python-common/ceph/deployment/"
alias s="git status --short"
alias gs="show_branches"
alias magit='emacsclient -nw -e \(magit-status\)'
#alias kcli='podman run --net host -it --rm --security-opt label=disable -v $HOME/.ssh:/root/.ssh -v $HOME/.kcli:/root/.kcli -v /var/lib/libvirt/images:/var/lib/libvirt/images -v /var/run/libvirt:/var/run/libvirt -v $PWD:/workdir -v /var/tmp:/ignitiondir quay.io/karmab/kcli:2543a61'
alias kubectl="minikube kubectl --"
alias ivpn="/usr/bin/python3.10 /home/redo/workspaces/ibm/gp-saml-gui/gp_saml_gui.py --sudo-openconnect --allow-insecure-crypto --gateway spain-east-producti.gpgy2csyocc2.gw.gpcloudservice.com -- --csd-wrapper=/usr/libexec/openconnect/hipreport.sh"
alias 9="/var/lib/snapd/snap/k9s/155/bin/k9s"
alias k="kubectl -n rook-ceph"
alias b="kubectl -n rook-ceph exec -it deploy/rook-ceph-tools -- bash"

export MCFLY_FUZZY=2
eval "$(mcfly init zsh)"

bindkey "^[." forward-char
bindkey "^[," backward-char

#export GOROOT=/usr/local/go
export GOPROXY=https://proxy.golang.org,direct

#export PATH=$GOROOT/bin:~/bin/:$PATH:~/.local/bin/:/usr/local/bin/:~/.oh-my-zsh/custom/plugins/fzf-zsh-plugin/bin/:$(go env GOPATH)/bin
export PATH=~/bin/:$PATH:~/.local/bin/:/usr/local/bin/:~/.oh-my-zsh/custom/plugins/fzf-zsh-plugin/bin/:$(go env GOPATH)/bin

#source /home/redo/.oh-my-zsh/lib/key-bindings.zsh solve ** operator issue
#bindkey "^[[Z" fzf-tab-complete
#bindkey "^I" expand-or-complete
bindkey '^I' fzf-tab-complete
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
