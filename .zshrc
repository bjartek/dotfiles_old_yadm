# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi



# Essential
source ~/.zplug/init.zsh

# Make sure to use double quotes to prevent shell expansion
# Look at these later?
# zplug "b4b4r07/enhancd", use:init.sh i use fasd for now
zplug "zsh-users/zsh-history-substring-search", nice:19
zplug "zsh-users/zsh-syntax-highlighting", nice:18

zplug "zsh-users/zsh-completions"
zplug "chmouel/oh-my-zsh-openshift"
zplug "supercrabtree/k"
zplug "plugins/fasd", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "joshuarubin/zsh-homebrew", if:"[[ $OSTYPE == *darwin* ]]"

source $HOME/.config/sourcecodepro.sh

openshift_cluster(){
			  local cluster=ose2
				local project=aurora
#        echo -n "\uE895 $cluster \uE817 $project" 
        echo ""
}

POWERLEVEL9K_CUSTOM_OPENSHIFT="openshift_cluster"
POWERLEVEL9K_CUSTOM_OPENSHIFT_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_OPENSHIFT_FOREGROUND="orange"

POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_openshift context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
DEFAULT_USER=$USER

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"


zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# zplug "hchbaw/auto-fu.zsh", at:pu could not get it to work
# zplug "zsh-users/zaw" looks like a cool idea


alias j='fasd_cd -d'
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# Add a bunch more of your favorite packages!

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load --verbose

### KEY BINDINGS ###
bindkey -v

# Bind UP and DOWN arrow keys for subsstring search.
if zplug check zsh-users/zsh-history-substring-search; then
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
fi

export EDITOR='vim'

export TERM=xterm-256color

# Appends every command to the history file once it is executed
setopt inc_append_history
# # Reloads the history whenever you use it
setopt share_history
